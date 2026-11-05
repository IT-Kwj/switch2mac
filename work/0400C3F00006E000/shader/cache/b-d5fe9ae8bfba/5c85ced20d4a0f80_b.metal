#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
};

static inline __attribute__((always_inline))
int _92(thread const int& _7587, thread const int& _7588, constant _10& support_buffer)
{
    float _7591 = as_type<float>(support_buffer._m4);
    int _7593 = _7588 + as_type<int>(_7591);
    int _7595 = 1 + _7593;
    float _7597 = support_buffer._m5[_7595].x;
    float _7599 = abs(_7597);
    bool _7601 = _7599 == 1.0;
    if (_7601)
    {
        return _7587;
    }
    float _7603 = float(_7587);
    float _7605 = _7603 / _7599;
    int _7607 = int(_7605);
    return _7607;
}

static inline __attribute__((always_inline))
int _93(thread const int& _7637, thread const int& _7638, constant _10& support_buffer)
{
    float _7641 = as_type<float>(support_buffer._m4);
    int _7643 = _7638 + as_type<int>(_7641);
    int _7645 = 1 + _7643;
    float _7647 = support_buffer._m5[_7645].x;
    bool _7649 = _7647 == 1.0;
    if (_7649)
    {
        return _7637;
    }
    float _7651 = float(_7637);
    float _7653 = _7651 * _7647;
    int _7655 = int(_7653);
    return _7655;
}

static inline __attribute__((always_inline))
void _90(thread const int& _7282, thread const int& _7283, thread const int& _7284, thread const int& _7285, thread int& _7286, thread int& _7287, thread int& _7288, thread int& _7289, thread int& _7290, thread int& _7291, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _7294 = _7285;
    int _7296 = _7283;
    float _7298 = 0.0 + as_type<float>(_7282);
    bool _7300 = _7298 != 0.0;
    bool _7302 = isnan(_7298);
    bool _7304 = _7300 || _7302;
    bool _7306 = isnan(0.0);
    bool _7308 = _7304 || _7306;
    int _7310 = as_type<int>(_7298);
    int _7312 = _7308 ? (-1) : 0;
    if (!_7308)
    {
        float _7314 = as_type<float>(_7282) * 1.0;
        _7294 = as_type<int>(_7314);
    }
    int _7316 = _7294;
    bool _7318 = !_7308;
    int _7320 = _7316;
    int _7322 = _7316;
    if (!_7318)
    {
        bool _7324 = _7298 >= 0.0;
        bool _7326 = isnan(_7298);
        bool _7328 = _7324 || _7326;
        bool _7330 = isnan(0.0);
        bool _7332 = _7328 || _7330;
        _7312 = _7332 ? (-1) : 0;
        if (!_7332)
        {
            _7320 = 2147483647;
        }
        int _7334 = _7320;
        bool _7336 = !_7332;
        int _7338 = _7334;
        _7322 = _7334;
        if (!_7336)
        {
            float _7340 = abs(as_type<float>(_7282));
            float _7342 = 0.0 + _7340;
            bool _7344 = _7342 > as_type<float>(0x7f800000u /* inf */);
            bool _7346 = isnan(_7342);
            bool _7348 = _7344 || _7346;
            bool _7350 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _7352 = _7348 || _7350;
            _7310 = as_type<int>(_7342);
            _7312 = _7352 ? (-1) : 0;
            if (_7352)
            {
                float _7354 = as_type<float>(_7282) + 1.0;
                _7338 = as_type<int>(_7354);
            }
            int _7356 = _7338;
            int _7358 = _7356;
            _7322 = _7356;
            if (!_7352)
            {
                bool _7360 = _7342 != as_type<float>(0x7f800000u /* inf */);
                bool _7362 = isnan(_7342);
                bool _7364 = _7360 || _7362;
                bool _7366 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _7368 = _7364 || _7366;
                _7312 = _7368 ? (-1) : 0;
                if (!_7368)
                {
                    _7358 = _7282;
                }
                int _7370 = _7358;
                bool _7372 = !_7368;
                _7322 = _7370;
                if (!_7372)
                {
                    float _7374 = as_type<float>(_7282) * 18446744073709551616.0;
                    float _7376 = rsqrt(_7374);
                    float _7378 = _7374 * _7376;
                    float _7380 = _7376 * 0.5;
                    float _7382 = -_7378;
                    float _7384 = 0.0 + _7382;
                    float _7386 = fma(_7380, _7384, 0.5);
                    float _7388 = fma(_7378, _7386, _7378);
                    float _7390 = -_7388;
                    float _7392 = 0.0 + _7390;
                    float _7394 = fma(_7388, _7392, _7374);
                    float _7396 = fma(_7380, _7394, _7388);
                    float _7398 = _7396 * 2.3283064365386962890625e-10;
                    _7296 = as_type<int>(_7396);
                    _7310 = as_type<int>(_7388);
                    _7322 = as_type<int>(_7398);
                }
            }
        }
    }
    int _7400 = _7296;
    int _7402 = _7310;
    int _7404 = _7322;
    int _7406 = _7312;
    _7286 = _7284;
    _7287 = 0;
    _7288 = _7400;
    _7289 = _7402;
    _7290 = _7404;
    _7291 = _7406;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1791 = false;
    bool _1603 = false;
    bool _656 = false;
    bool _527 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _101 = int(_99);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3002 = as_type<float>(_117);
        out.gl_Position.z = _3002;
    }
    if (!_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_49.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = _135;
    if (_131)
    {
        float _139 = float(_101);
        _111 = _139;
    }
    float _141 = _111;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    float _149 = _141;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _149;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3072 = as_type<float>(_155);
        out.gl_Position.z = _3072;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = in.m_51.x;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = in.m_53.y;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _161 * _159;
    float _183 = 0.0;
    if (!_175)
    {
        float _185 = _165 * _165;
        float _187 = _185 * 0.5;
        _183 = _187;
    }
    float _189 = _183;
    float _191 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _193 = _189;
    if (!_175)
    {
        float _195 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = in.m_49.x;
    float _201 = in.m_49.y;
    float _203 = in.m_49.z;
    float _205 = _191 * 6.283185482025146484375;
    float _207 = floor(_191);
    float _209 = _205 * 0.15915493667125701904296875;
    float _211 = _209 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = -_207;
    float _217 = _191 + _215;
    float _219 = _207;
    float _221 = _197;
    if (!_175)
    {
        _219 = _165;
    }
    float _223 = _219;
    bool _225 = !_175;
    float _227 = _223;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _165 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _165);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _257;
    }
    float _259 = _221;
    bool _261 = !_175;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _165 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _227 = _281;
    }
    float _283 = _227;
    float _285 = in.m_55.w;
    float _287 = in.m_44.x;
    float _289 = in.m_44.y;
    float _291 = in.m_44.z;
    bool _293 = _217 < 0.5;
    float _295 = float(_293);
    float _297 = -_217;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _303 = _301 != 0;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _307 = _305 != 0;
    float _309 = fma(_213, 0.5, 0.5);
    float _311 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_57.y = _163;
    bool _317 = !_303;
    int _319 = _317 ? 0 : 1;
    float _321 = -_309;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = fma(_283, _199, _311);
    bool _327 = !_307;
    int _329 = _327 ? 0 : 1;
    float _331 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _333 = !_179;
    int _335 = _333 ? 0 : 1;
    float _337 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _339 = abs(_319);
    float _341 = fma(_283, _201, _331);
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_283, _203, _337);
    int _347 = abs(_329);
    int _349 = abs(_335);
    float _351 = float(_339);
    float _353 = fma(_325, _285, _287);
    float _355 = float(_349);
    float _357 = fma(_341, _285, _289);
    float _359 = float(_347);
    float _361 = abs(_299);
    float _363 = _351 * _361;
    float _365 = fma(_345, _285, _291);
    float _367 = fma(_355, _323, _363);
    float _369 = abs(_315);
    float _371 = fma(_359, _369, _367);
    bool _373 = !_343;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_101);
        float _395 = 1.0 / _393;
        float _397 = _135 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = in.m_55.x;
    float _407 = in.m_55.y;
    float _409 = in.m_55.z;
    bool _411 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_399);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _423;
    bool _427 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_399);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _441 = 1.0 / _425;
    float _443 = -_437;
    float _445 = _443 + 1.0;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _403 * _441;
    float _455 = fma(_451, _453, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _461;
    float _465 = _439 * _157;
    float _467 = _421 * _445;
    float _469 = fma(_459, _453, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = fma(_463, _453, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _473 = -_421;
    float _475 = _473 + 1.0;
    float _477 = _455 * _467;
    float _479 = trunc(_465);
    int _481 = int(_479);
    float _483 = _469 * _467;
    float _485 = _471 * _467;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _477);
    float _489 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].z, _485);
    float _493 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].x, _487);
    float _495 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].y, _489);
    float _497 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].z, _491);
    float _499 = _493 * _405;
    float _501 = _495 * _407;
    float _503 = _497 * _409;
    int _505 = _481 << 4;
    int _507 = _505 + 1712;
    bool _509 = !_447;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_101);
        float _531 = 1.0 / _529;
        float _533 = _135 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    uint _538 = uint(int(uint(_507) >> uint(2)));
    uint _540 = uint(int(uint(int(_538)) >> uint(2)));
    int _542 = int(_538) & 3;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[int(_540)][_542];
    int _546 = int(_538) + 1;
    uint _548 = uint(int(uint(_546) >> uint(2)));
    int _550 = _546 & 3;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[int(_548)][_550];
    bool _554 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_535);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    int _572 = _507 + 8;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    uint _576 = uint(int(uint(int(_574)) >> uint(2)));
    int _578 = int(_574) & 3;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[int(_576)][_578];
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = 1.0 / _568;
    float _588 = -_564;
    float _590 = _588 + 1.0;
    float _592 = _584 * _586;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _535 + _594;
    bool _598 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _600 = isnan(_535);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = fma(_592, _596, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _612 = _608 * _590;
    float _614 = -_608;
    float _616 = _614 + 1.0;
    float _618 = _610 * _612;
    float _620 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[115].x, _618);
    float _622 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[116].x, _620);
    float _624 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _626 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _628 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _630 = _624 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _634 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _636 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _638 = !_570;
    float _654;
    if (!_638)
    {
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _642 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        float _658 = float(_101);
        float _660 = 1.0 / _658;
        float _662 = _135 * _660;
        _654 = _662;
    }
    _656 = false;
    float _664 = _654;
    int _666 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _668 = _666;
    int _670 = 0;
    int _672 = _92(_668, _670, (*spvDescriptorSet0.support_buffer));
    float _674 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _676 = int(_674);
    float _678 = fma(_135, 0.01200000010430812835693359375, _157);
    float _680 = in.m_53.z;
    float _682 = in.m_51.y;
    float _684 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _686 = int(_684);
    float _688 = float(_676);
    float _690 = floor(_678);
    float _692 = float(uint(_686));
    float _694 = 1.0 / _688;
    float _696 = 1.0 / _692;
    float _698 = _135 * _694;
    float _700 = trunc(_680);
    int _702 = int(_700);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    int _708 = as_type<int>(_696) + (-2);
    float _710 = trunc(_698);
    int _712 = int(_710);
    int _714 = ~_686;
    int _716 = _714 + 1;
    float _718 = float(uint(_712));
    float _720 = as_type<float>(_708) * _718;
    float _722 = trunc(_720);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    float _728 = fma(_690, 0.20000000298023223876953125, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _730 = precise::clamp(_728, 0.0, 1.0);
    int _732 = _716 * int(_726);
    int _734 = _732 + _712;
    float _736 = float(uint(_734));
    float _738 = as_type<float>(_708) * _736;
    float _740 = trunc(_738);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    int _746 = _672 + (-1);
    float _748 = float(_746);
    float _750 = _730 * _748;
    float _752 = _682 * 1.2345600128173828125;
    float _754 = trunc(_750);
    int _756 = int(_754);
    bool _758 = !_706;
    float _760 = _758 ? _752 : _157;
    int _762 = _756;
    int _764 = 0;
    int _766 = _93(_762, _764, (*spvDescriptorSet0.support_buffer));
    int _768 = _702;
    int _770 = 0;
    int _772 = _93(_768, _770, (*spvDescriptorSet0.support_buffer));
    float4 _775 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_766, _772)), 0).xyzw;
    float _777 = _775.x;
    float _779 = _775.y;
    float _781 = _775.z;
    float _783 = _775.w;
    int _785 = ~_686;
    int _787 = _785 + 1;
    float _789 = floor(_760);
    int _791 = int(_726) + int(_744);
    float _793 = float(_686);
    float _795 = float(_712);
    int _797 = _787 * _791;
    int _799 = _797 + _712;
    float _801 = float(_101);
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _805 = _795 >= _793;
    bool _807 = isnan(_795);
    bool _809 = _805 || _807;
    bool _811 = isnan(_793);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    bool _817 = uint(_799) >= uint(_686);
    bool _819 = _686 == 0;
    bool _821 = !_817;
    int _823 = _821 ? 0 : (-1);
    float _825 = trunc(_815);
    int _827 = int(_825);
    float _829 = -_789;
    float _831 = _760 + _829;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _835 = _833 != 0;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _839 = _837 != 0;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _843 = _841 != 0;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _847 = _845 != 0;
    int _849 = ~_791;
    int _851 = _849 + _823;
    int _853 = _851 + 1;
    float _855 = _831 * _793;
    float _857 = _135 * _793;
    float _859 = 1.0 / _801;
    int _861 = _686 * _853;
    int _863 = _861 + _712;
    int _865 = _686 + (-1);
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _869 = _867 != 0;
    bool _871 = !_819;
    int _873 = _871 ? _863 : (-1);
    int _875 = ~_827;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    float _881 = trunc(_855);
    int _883 = int(_881);
    bool _885 = !_869;
    int _887 = _885 ? 0 : 1;
    bool _889 = !_835;
    int _891 = _889 ? 0 : 1;
    int _893 = _873 * _879;
    bool _895 = !_839;
    int _897 = _895 ? 0 : 1;
    float _899 = _857 * _859;
    int _901 = _827 * _865;
    int _903 = _901 + _893;
    int _905 = abs(_897);
    int _907 = abs(_887);
    float _909 = trunc(_899);
    int _911 = int(_909);
    bool _913 = !_843;
    int _915 = _913 ? 0 : 1;
    int _917 = abs(_891);
    int _919 = _883 * _907;
    int _921 = _919 + _712;
    int _923 = abs(_915);
    int _925 = _903 * _905;
    bool _927 = !_847;
    int _929 = _927 ? 0 : 1;
    int _931 = abs(_929);
    int _933 = _911 * _917;
    int _935 = _933 + _925;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _939 = _937 != 0;
    int _941 = ~_686;
    int _943 = _941 + 1;
    int _945 = _921 * _923;
    int _947 = _945 + _935;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _951 = _949 != 0;
    float _953 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _957 = _955 != 0;
    int _959 = _883 * _931;
    int _961 = _959 + _947;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _965 = _963 != 0;
    float _967 = in.m_53.x;
    float _969 = float(uint(_921));
    float _971 = float(uint(_961));
    float _973 = _859;
    float _975 = _953;
    float _977 = _967;
    if (_939)
    {
        float _979 = in.m_51.z;
        _973 = _979;
    }
    float _981 = _973;
    int _983 = ~_686;
    int _985 = _983 + 1;
    float _987 = as_type<float>(_708) * _971;
    int _989 = ~_686;
    int _991 = _989 + 1;
    float _993 = trunc(_987);
    float _995 = precise::max(_993, 0.0);
    uint _997 = uint(_995);
    int _999 = _991 * int(_997);
    int _1001 = _999 + _961;
    float _1003 = float(uint(_1001));
    float _1005 = as_type<float>(_708) * _1003;
    float _1007 = in.m_51.w;
    float _1009 = trunc(_1005);
    float _1011 = precise::max(_1009, 0.0);
    uint _1013 = uint(_1011);
    int _1015 = int(_997) + int(_1013);
    float _1017 = -_163;
    float _1019 = _1017 + 1.0;
    bool _1021 = _1007 > 0.5;
    bool _1023 = _1021 && _965;
    int _1025 = _943 * _1015;
    int _1027 = _1025 + _961;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1033 = uint(_1027) >= uint(_686);
    float _1035 = 1.0 / _1031;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1039 = !_1033;
    int _1041 = _1039 ? 0 : (-1);
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1045 = _1043 != 0;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1049 = -_1037;
    float _1051 = fma(_953, 2.0, _1049);
    float _1053 = _682 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1055 = _682 > 0.5;
    bool _1057 = _1055 && _1045;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1059;
    float _1063 = fma(_1053, -2.0, _1047);
    float _1065 = _1023 ? _1019 : _163;
    float _1067 = -_135;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1051);
    float _1071 = _1061 * _1035;
    float _1073 = _1035;
    bool _1075 = _1023;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    bool _1079 = _1057;
    if (!_706)
    {
        float _1081 = in.m_51.z;
        _1073 = _1081;
    }
    float _1083 = _1073;
    if (_939)
    {
        bool _1085 = _981 > 0.5;
        _1075 = _1085;
    }
    bool _1087 = _1075;
    float _1089 = as_type<float>(_708) * _969;
    int _1091 = ~_1015;
    int _1093 = _1091 + _1041;
    int _1095 = _1093 + 1;
    float _1097 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1063);
    float _1099 = _1057 ? _1019 : _163;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1103 = ~_686;
    int _1105 = _1103 + 1;
    int _1107 = _686 * _1095;
    int _1109 = _1107 + _961;
    float _1111 = trunc(_1089);
    float _1113 = precise::max(_1111, 0.0);
    uint _1115 = uint(_1113);
    float _1117 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1101);
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _664 + _1119;
    bool _1123 = !_819;
    int _1125 = _1123 ? _1109 : (-1);
    float _1127 = fma(_1071, _1121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_706)
    {
        _1077 = _682;
    }
    float _1129 = _1077;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1133 = _1125 >> 31;
    float _1135 = _1129;
    if (_957)
    {
        bool _1137 = _157 > 0.5;
        _1079 = _1137;
    }
    bool _1139 = _1079;
    float _1141 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    int _1143 = _1133 & 3;
    float _1145 = _1141;
    if (_706)
    {
        _1135 = _157;
    }
    float _1147 = _1135;
    float _1149 = _803 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1151 = _1125 + _1143;
    int _1153 = _1105 * int(_1115);
    int _1155 = _1153 + _921;
    int _1157 = as_type<int>(_1149);
    if (!_957)
    {
        _975 = _967;
    }
    float _1159 = _975;
    float _1161 = fma(_1149, _1099, -0.5);
    int _1163 = _1151 >> 2;
    float _1165 = _1159;
    if (_957)
    {
        float _1167 = -_967;
        float _1169 = _1167 + 1.0;
        _1157 = as_type<int>(_1169);
    }
    int _1171 = _1157;
    float _1173 = float(uint(_1155));
    float _1175 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1141);
    int _1177 = _1163 << 4;
    int _1179 = _1177 + 512;
    float _1181 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1183 = _1083;
    if (!_706)
    {
        _1145 = _1083;
    }
    float _1185 = _1145;
    float _1187 = as_type<float>(_708) * _1173;
    float _1189 = _1185;
    if (_706)
    {
        _1189 = _682;
    }
    float _1191 = _1189;
    if (_706)
    {
        _1183 = _682;
    }
    float _1193 = _1183;
    float _1195 = -_1097;
    float _1197 = fma(_1175, _1161, _1195);
    if (_957)
    {
        float _1199 = _1139 ? as_type<float>(_1171) : _967;
        _1165 = _1199;
    }
    float _1201 = _1165;
    float _1203 = trunc(_1187);
    float _1205 = precise::max(_1203, 0.0);
    uint _1207 = uint(_1205);
    uint _1209 = uint(int(uint(_1179) >> uint(2)));
    uint _1211 = uint(int(uint(int(_1209)) >> uint(2)));
    int _1213 = int(_1209) & 3;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[int(_1211)][_1213];
    int _1217 = int(_1209) + 1;
    uint _1219 = uint(int(uint(_1217) >> uint(2)));
    int _1221 = _1217 & 3;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[int(_1219)][_1221];
    bool _1225 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1227 = isnan(_664);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    bool _1237 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1239 = isnan(_664);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = -_1235;
    float _1251 = _1249 + 1.0;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1255 = _1125 & 3;
    bool _1257 = _1255 != 0;
    float _1259 = _1247 * _1251;
    float _1261 = -_1247;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1253);
    int _1267 = _1125 & 3;
    bool _1269 = _1267 != 0;
    int _1271 = _1179 + 8;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    uint _1275 = uint(int(uint(int(_1273)) >> uint(2)));
    int _1277 = int(_1273) & 3;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[int(_1275)][_1277];
    int _1281 = int(_1273) + 1;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    int _1285 = _1281 & 3;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[int(_1283)][_1285];
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1291 = _1257 ? 0 : 1;
    float _1293 = _1127 * _1259;
    bool _1295 = uint(_1267) > 1u;
    float _1297 = -_1289;
    float _1299 = fma(_1181, 2.0, _1297);
    int _1301 = int(_1115) + int(_1207);
    int _1303 = int(_1207);
    if (_939)
    {
        float _1305 = -_967;
        float _1307 = _1305 + 1.0;
        _1303 = as_type<int>(_1307);
    }
    int _1309 = _1303;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1313 = ~_1291;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    float _1319 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1293);
    int _1321 = _1317;
    if (_939)
    {
        float _1323 = _1087 ? as_type<float>(_1309) : _967;
        _977 = _1323;
    }
    float _1325 = _977;
    int _1327 = _985 * _1301;
    int _1329 = _1327 + _921;
    bool _1331 = _1267 != 3;
    float _1333 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1311);
    bool _1335 = uint(_1267) >= 2u;
    float _1337 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    if (!_1295)
    {
        int _1339 = ~_1291;
        int _1341 = _1339 + 1;
        _1321 = _1341;
    }
    int _1343 = _1321;
    float _1345 = -_135;
    float _1347 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1299);
    bool _1349 = uint(_1329) >= uint(_686);
    int _1351 = _1335 ? 0 : 1;
    int _1353 = abs(_1343);
    bool _1355 = !_1269;
    int _1357 = _1355 ? 0 : 1;
    bool _1359 = !_1349;
    int _1361 = _1359 ? 0 : (-1);
    int _1363 = ~_1351;
    int _1365 = _1363 + 1;
    int _1367 = _1365 + 1;
    bool _1369 = _1267 != 3;
    int _1371 = _1367;
    if (_1331)
    {
        int _1373 = ~_1351;
        int _1375 = _1373 + 1;
        _1371 = _1375;
    }
    int _1377 = _1371;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1381 = abs(_1357);
    int _1383 = ~_1353;
    int _1385 = _1383 + 1;
    int _1387 = _1385 + 1;
    int _1389 = ~_1301;
    int _1391 = _1389 + _1361;
    int _1393 = _1391 + 1;
    bool _1395 = !_1369;
    int _1397 = _1395 ? 0 : (-1);
    int _1399 = _1387 * as_type<int>(_1223);
    int _1401 = abs(_1377);
    int _1403 = _686 * _1393;
    int _1405 = _1403 + _921;
    int _1407 = ~_1381;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    bool _1413 = !_951;
    int _1415 = _1413 ? 0 : 1;
    int _1417 = abs(_1397);
    int _1419 = _1411 * as_type<int>(_1215);
    int _1421 = _1419 + _1399;
    int _1423 = abs(_1415);
    int _1425 = ~_1401;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    int _1431 = _1429 * as_type<int>(_1279);
    int _1433 = _1431 + _1421;
    float _1435 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1437 = ~_1417;
    int _1439 = _1437 + 1;
    int _1441 = _1439 + 1;
    float _1443 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1445 = ~_1423;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    float _1451 = fma(_1435, _1201, -0.5);
    float _1453 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _1455 = _1441 * as_type<int>(_1287);
    int _1457 = _1455 + _1433;
    bool _1459 = !_819;
    int _1461 = _1459 ? _1405 : (-1);
    float _1463 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1265);
    int _1465 = _1457 * _1449;
    float _1467 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1319);
    float _1469 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1333);
    float _1471 = fma(_1463, _1337, _1347);
    int _1473 = _1461 * _1423;
    int _1475 = _1473 + _1465;
    uint _1477 = as_type<uint>(half2(float2(_783, 0.0)));
    float _1479 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1117);
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1483 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _1485 = extract_bits(_1477, 0u, 8u);
    int _1487 = int(_1485) & 255;
    uint _1489 = extract_bits(_1477, 8u, 8u);
    int _1491 = int(_1489) & 255;
    int _1493 = _1491 << 8;
    int _1495 = _1487 | _1493;
    float _1497 = fma(_1479, _1451, _1069);
    float _1499 = float(_1475);
    float _1501 = fma(_1443, -2.0, _1481);
    bool _1503 = _1495 >= 32768;
    float _1505 = _1471 + 0.5;
    int _1507 = _1495 + (-1024);
    out.m_59.y = _1499;
    int _1509 = _756 + 1;
    float _1511 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1501);
    int _1513 = min(_746, _1509);
    float _1515 = -_1511;
    float _1517 = fma(_1469, _1453, _1515);
    float _1519 = _1197 + 0.5;
    float _1521 = _1517 + 0.5;
    int _1523 = _1507;
    if (_1503)
    {
        int _1525 = ~_1495;
        int _1527 = _1525 + 33792;
        int _1529 = _1527 + 1;
        _1523 = _1529;
    }
    int _1531 = _1523;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1535 = _1497 + 0.5;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1539 = _1531 + 30719;
    float _1541 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1543 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = float(_1539);
    float _1547 = fma(_1545, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1551 = abs(_1547);
    float _1553 = -_1551;
    float _1555 = _1553 + 1.0;
    float _1557 = abs(_1547);
    float _1559 = fma(_1557, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1561 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1563 = _1547 < 0.0;
    float _1565 = float(_1563);
    int _1567 = as_type<int>(_1555) + (-218103808);
    float _1569 = abs(_1547);
    float _1571 = fma(_1569, _1559, -0.212114393711090087890625);
    bool _1573 = uint(_1567) >= 1920991232u;
    float _1575 = abs(_1547);
    float _1577 = fma(_1575, _1571, 1.570728778839111328125);
    bool _1579 = !_1573;
    float _1601;
    if (!_1579)
    {
        int _1581 = as_type<int>(_1555);
        int _1583 = as_type<int>(_1471);
        int _1585 = 7664;
        int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].y);
        int _1589;
        int _1591;
        int _1593;
        int _1595;
        int _1597;
        int _1599;
        _90(_1581, _1583, _1585, _1587, _1589, _1591, _1593, _1595, _1597, _1599, out.gl_Position, out.gl_PointSize);
        _1601 = as_type<float>(_1597);
        _1603 = true;
    }
    else
    {
        float _1605 = rsqrt(_1555);
        float _1607 = _1555 * _1605;
        float _1609 = _1605 * 0.5;
        float _1611 = -_1607;
        float _1613 = 0.0 + _1611;
        float _1615 = fma(_1609, _1613, 0.5);
        float _1617 = fma(_1607, _1615, _1607);
        float _1619 = -_1617;
        float _1621 = 0.0 + _1619;
        float _1623 = fma(_1617, _1621, _1555);
        float _1625 = fma(_1609, _1623, _1617);
        _1601 = _1625;
    }
    _1603 = false;
    float _1627 = _1601;
    int _1629 = _1513;
    int _1631 = 0;
    int _1633 = _93(_1629, _1631, (*spvDescriptorSet0.support_buffer));
    int _1635 = _702;
    int _1637 = 0;
    int _1639 = _93(_1635, _1637, (*spvDescriptorSet0.support_buffer));
    float4 _1641 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1633, _1639)), 0).xyzw;
    float _1643 = _1641.x;
    float _1645 = _1641.y;
    float _1647 = _1641.z;
    float _1649 = _1641.w;
    float _1651 = floor(_750);
    float _1653 = _1577 * _1627;
    float _1655 = _1565 * 2.0;
    float _1657 = _1545 * 3.883221149444580078125;
    float _1659 = -_1655;
    float _1661 = fma(_1653, _1659, _1653);
    float _1663 = _1657 * 0.15915493667125701904296875;
    float _1665 = fma(_1565, 3.1415927410125732421875, _1661);
    float _1667 = _1663 * 6.283185482025146484375;
    float _1669 = cos(_1667);
    float _1671 = _1665 * 0.15915493667125701904296875;
    float _1673 = -_1651;
    float _1675 = _750 + _1673;
    float _1677 = _1671 * 6.283185482025146484375;
    float _1679 = sin(_1677);
    float _1681 = _1663 * 6.283185482025146484375;
    float _1683 = sin(_1681);
    float _1685 = _1679 * _1669;
    float _1687 = _1679 * _1683;
    uint _1689 = as_type<uint>(half2(float2(_1649, 0.0)));
    float _1691 = -_777;
    float _1693 = _1691 + _1643;
    float _1695 = -_781;
    float _1697 = _1695 + _1647;
    uint _1699 = extract_bits(_1689, 0u, 8u);
    int _1701 = int(_1699) & 255;
    uint _1703 = extract_bits(_1689, 8u, 8u);
    int _1705 = int(_1703) & 255;
    int _1707 = _1705 << 8;
    int _1709 = _1701 | _1707;
    float _1711 = fma(_1675, _1693, _777);
    float _1713 = fma(_1675, _1697, _781);
    bool _1715 = _1709 >= 32768;
    int _1717 = _1709 + (-1024);
    int _1719 = _1717;
    if (_1715)
    {
        int _1721 = ~_1709;
        int _1723 = _1721 + 33792;
        int _1725 = _1723 + 1;
        _1719 = _1725;
    }
    int _1727 = _1719;
    int _1729 = _1727 + 30719;
    float _1731 = float(_1729);
    float _1733 = fma(_1731, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1735 = abs(_1733);
    float _1737 = -_1735;
    float _1739 = _1737 + 1.0;
    float _1741 = abs(_1733);
    float _1743 = fma(_1741, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1745 = _1733 < 0.0;
    float _1747 = float(_1745);
    int _1749 = as_type<int>(_1739) + (-218103808);
    float _1751 = abs(_1733);
    float _1753 = fma(_1751, _1743, -0.212114393711090087890625);
    bool _1755 = uint(_1749) >= 1920991232u;
    float _1757 = -_779;
    float _1759 = _1757 + _1645;
    float _1761 = abs(_1733);
    float _1763 = fma(_1761, _1753, 1.570728778839111328125);
    float _1765 = fma(_1675, _1759, _779);
    bool _1767 = !_1755;
    float _1789;
    if (!_1767)
    {
        int _1769 = as_type<int>(_1739);
        int _1771 = as_type<int>(_1645);
        int _1773 = 8560;
        int _1775 = as_type<int>(_1627);
        int _1777;
        int _1779;
        int _1781;
        int _1783;
        int _1785;
        int _1787;
        _90(_1769, _1771, _1773, _1775, _1777, _1779, _1781, _1783, _1785, _1787, out.gl_Position, out.gl_PointSize);
        _1789 = as_type<float>(_1785);
        _1791 = true;
    }
    else
    {
        float _1793 = rsqrt(_1739);
        float _1795 = _1739 * _1793;
        float _1797 = _1793 * 0.5;
        float _1799 = -_1795;
        float _1801 = 0.0 + _1799;
        float _1803 = fma(_1797, _1801, 0.5);
        float _1805 = fma(_1795, _1803, _1795);
        float _1807 = -_1805;
        float _1809 = 0.0 + _1807;
        float _1811 = fma(_1805, _1809, _1739);
        float _1813 = fma(_1797, _1811, _1805);
        _1789 = _1813;
    }
    _1791 = false;
    float _1815 = _1789;
    float _1817 = in.m_51.x;
    float _1819 = in.m_51.y;
    float _1821 = in.m_51.z;
    float _1823 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1825 = log2(_1823);
    float _1827 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1829 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1831 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1833 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1827);
    float _1835 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1829);
    float _1837 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1831);
    float _1839 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1833);
    float _1841 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1835);
    float _1843 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1837);
    float _1845 = _1839 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1847 = _1841 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1849 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1851 = _1825 * _135;
    float _1853 = _1843 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1857 = _1847 + _1855;
    float _1859 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1861 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1863 = exp2(_1851);
    float _1865 = _1817 * 2.0;
    float _1867 = _1821 * 2.0;
    float _1869 = _1819 * 2.0;
    float _1871 = floor(_1865);
    float _1873 = floor(_1867);
    float _1875 = floor(_1869);
    bool _1877 = _1871 > 0.0;
    bool _1879 = _1871 >= 0.0;
    bool _1881 = isnan(_1871);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan(0.0);
    bool _1887 = _1883 || _1885;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1891 = _1845 + _1889;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1895 = _1893 != 0;
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1899 = _1897 != 0;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1903 = _1901 != 0;
    float _1905 = _1891 * _1891;
    bool _1907 = _1873 >= 0.0;
    bool _1909 = isnan(_1873);
    bool _1911 = _1907 || _1909;
    bool _1913 = isnan(0.0);
    bool _1915 = _1911 || _1913;
    float _1917 = _1819 + _1821;
    int _1919 = _1887 ? 0 : 1;
    float _1921 = fma(_1857, _1857, _1905);
    int _1923 = _1915 ? 0 : 1;
    float _1925 = _1917 + (-1.0);
    bool _1927 = _1873 > 0.0;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1931 = _1853 + _1929;
    bool _1933 = _1875 > 0.0;
    bool _1935 = _1875 >= 0.0;
    bool _1937 = isnan(_1875);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan(0.0);
    bool _1943 = _1939 || _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1947 = 1.0 + _1945;
    int _1949 = ~_1919;
    int _1951 = _1949 + 1;
    int _1953 = _1951 + 1;
    float _1955 = fma(_1931, _1931, _1921);
    int _1957 = _1953;
    if (!_1877)
    {
        int _1959 = ~_1919;
        int _1961 = _1959 + 1;
        _1957 = _1961;
    }
    int _1963 = _1957;
    float _1965 = in.m_61.x;
    float _1967 = in.m_61.y;
    float _1969 = in.m_61.z;
    float _1971 = 1.0 / _1947;
    bool _1973 = !_1899;
    int _1975 = _1973 ? 0 : 1;
    bool _1977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1979 = isnan(1.0);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1985 = _1981 || _1983;
    int _1987 = abs(_1975);
    float _1989 = -_1863;
    float _1991 = _1989 + 1.0;
    bool _1993 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2001 = _1997 || _1999;
    float _2003 = rsqrt(_1955);
    float _2005 = float(_1987);
    float _2007 = _2001 ? _1991 : 0.0;
    float _2009 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2011 = float(_1963);
    int _2013 = ~_1923;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    int _2019 = _2017;
    if (_1985)
    {
        float _2021 = _2007 * _1971;
        _137 = _2021;
    }
    float _2023 = _137;
    bool _2025 = !_1895;
    int _2027 = _2025 ? 0 : 1;
    float _2029 = _2005 * _2011;
    if (!_1927)
    {
        int _2031 = ~_1923;
        int _2033 = _2031 + 1;
        _2019 = _2033;
    }
    int _2035 = _2019;
    int _2037 = abs(_2027);
    float _2039 = _2029 * (-2.0);
    int _2041 = _1943 ? 0 : 1;
    float _2043 = _1891 * _2003;
    float _2045 = _1857 * _2003;
    float _2047 = fma(_2009, _2039, _2009);
    float _2049 = fma(_2039, _1967, _1967);
    float _2051 = -_2043;
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1891);
    float _2055 = -_2045;
    float _2057 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1857);
    float _2059 = _1819 + (-0.5);
    float _2061 = float(_2037);
    float _2063 = _2053 * _2053;
    float _2065 = float(_2035);
    float _2067 = _1931 * _2003;
    float _2069 = fma(_2059, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2049);
    float _2071 = fma(_2057, _2057, _2063);
    bool _2073 = !_1903;
    int _2075 = _2073 ? 0 : 1;
    float _2077 = _2061 * _2065;
    int _2079 = ~_2041;
    int _2081 = _2079 + 1;
    int _2083 = _2081 + 1;
    float _2085 = -_2067;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1931);
    int _2089 = _2083;
    if (!_1933)
    {
        int _2091 = ~_2041;
        int _2093 = _2091 + 1;
        _2089 = _2093;
    }
    int _2095 = _2089;
    float _2097 = _1819 + _1817;
    int _2099 = abs(_2075);
    float _2101 = _1817 + _1821;
    float _2103 = float(_2095);
    float _2105 = fma(_2087, _2087, _2071);
    float _2107 = float(_2099);
    float _2109 = _2101 + (-1.0);
    float _2111 = _2097 + (-1.0);
    float _2113 = fma(_2047, _2023, _2069);
    float _2115 = _2107 * _2103;
    float _2117 = fma(_2111, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2119 = _2077 * (-2.0);
    float _2121 = _2115 * (-2.0);
    float _2123 = _2113 * 0.15915493667125701904296875;
    float _2125 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2127 = fma(_2119, _1965, _1965);
    float _2129 = fma(_2117, _2119, _2117);
    float _2131 = _1817 + (-0.5);
    float _2133 = _1821 + (-0.5);
    float _2135 = fma(_2121, _1969, _1969);
    float _2137 = fma(_2125, _2121, _2125);
    float _2139 = fma(_2131, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2127);
    float _2141 = sqrt(_2105);
    float _2143 = fma(_2133, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2135);
    float _2145 = fma(_2129, _2023, _2139);
    float _2147 = fma(_2137, _2023, _2143);
    float _2149 = _2145 * 0.15915493667125701904296875;
    float _2151 = _2123 * 6.283185482025146484375;
    float _2153 = sin(_2151);
    float _2155 = _2147 * 0.15915493667125701904296875;
    float _2157 = _2123 * 6.283185482025146484375;
    float _2159 = cos(_2157);
    float _2161 = _2003 * _2141;
    float _2163 = _1849 * _2161;
    float _2165 = _1859 * _2161;
    float _2167 = _1861 * _2161;
    float _2169 = _2149 * 6.283185482025146484375;
    float _2171 = sin(_2169);
    float _2173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1713);
    float _2175 = _2167 * _2173;
    float _2177 = _2155 * 6.283185482025146484375;
    float _2179 = cos(_2177);
    float _2181 = _2149 * 6.283185482025146484375;
    float _2183 = cos(_2181);
    float _2185 = _2171 * _2153;
    float _2187 = _2171 * _2159;
    float _2189 = _2155 * 6.283185482025146484375;
    float _2191 = sin(_2189);
    float _2193 = _2171 * _2179;
    float _2195 = _2159 * _2179;
    float _2197 = _2183 * _2159;
    float _2199 = _2183 * _2153;
    float _2201 = _2183 * _2179;
    float _2203 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1765);
    float _2205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1711);
    float _2207 = _2153 * _2179;
    float _2209 = _2163 * _2203;
    float _2211 = _2165 * _2205;
    float _2213 = fma(_2191, _2197, _2185);
    float _2215 = -_2187;
    float _2217 = fma(_2191, _2199, _2215);
    float _2219 = _2201 * _2209;
    float _2221 = -_2209;
    float _2223 = _2191 * _2221;
    float _2225 = -_2199;
    float _2227 = fma(_2191, _2187, _2225);
    float _2229 = _2193 * _2209;
    float _2231 = fma(_2213, _2211, _2219);
    float _2233 = fma(_2195, _2211, _2223);
    float _2235 = fma(_2191, _2185, _2197);
    float _2237 = fma(_2227, _2211, _2229);
    float _2239 = fma(_2217, _2175, _2231);
    float _2241 = fma(_2207, _2175, _2233);
    float _2243 = fma(_2235, _2175, _2237);
    float _2245 = _2239 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2247 = _2239 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2249 = _2239 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2251 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2245);
    float _2253 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2247);
    float _2255 = _690 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2257 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2249);
    float _2259 = fma(_2243, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2251);
    float _2261 = fma(_2243, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2253);
    float _2263 = fma(_2243, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2257);
    float _2265 = _1853 + _2259;
    float _2267 = _1847 + _2261;
    float _2269 = _1845 + _2263;
    float _2271 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2265);
    float _2273 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2267);
    float _2275 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2269);
    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2279 = _2271 + _2277;
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2283 = _2273 + _2281;
    float _2285 = _2279 * _2279;
    float _2287 = fma(_2283, _2283, _2285);
    float _2289 = sqrt(_2287);
    bool _2291 = _2289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2293 = _2249;
    float _2295 = _2269;
    float _2297 = _2275;
    float _2299 = 0.5;
    float _2301 = _2201;
    if (!_2291)
    {
        _2293 = _2273;
    }
    float _2303 = _2293;
    float _2305 = _2303;
    if (!_2291)
    {
        _2295 = _2271;
    }
    float _2307 = _2295;
    bool _2309 = !_2291;
    float _2311 = _2307;
    if (!_2309)
    {
        float _2313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2317 = _2289 + _2315;
        float _2319 = rsqrt(_2287);
        float _2321 = _2317 * _2313;
        float _2323 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2325 = _2321 * 0.15915493667125701904296875;
        float _2327 = _2325 * 6.283185482025146484375;
        float _2329 = cos(_2327);
        float _2331 = _2325 * 6.283185482025146484375;
        float _2333 = sin(_2331);
        float _2335 = _2329 + (-1.0);
        float _2337 = fma(_2333, _2323, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2341 = _2319 * _2337;
        float _2343 = fma(_2275, _2329, _2339);
        float _2345 = fma(_2283, _2341, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2347 = fma(_2279, _2341, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2297 = _2343;
        _2305 = _2345;
        _2311 = _2347;
    }
    float _2349 = _2297;
    float _2351 = _2305;
    float _2353 = _2311;
    float _2355 = -_2043;
    float _2357 = fma(_2355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2349);
    float _2359 = -_2045;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2351);
    float _2363 = -_2067;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2353);
    float _2367 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2369 = _2357 + _2367;
    float _2371 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2373 = _2361 + _2371;
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2377 = _2365 + _2375;
    float _2379 = _2369 * _2369;
    float _2381 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2383 = fma(_2373, _2373, _2379);
    float _2385 = fma(_2377, _2377, _2383);
    float _2387 = rsqrt(_2385);
    float _2389 = sqrt(_2385);
    float _2391 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2393 = _2373 * _2391;
    float _2395 = _2377 * _2391;
    float _2397 = _2393 * _2393;
    float _2399 = _2395 * _2395;
    float _2401 = _2397 + _2399;
    float _2403 = sqrt(_2401);
    bool _2405 = _2403 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2409 = _2403 + _2407;
    float _2411 = _2063;
    float _2413 = _2401;
    float _2415 = _2409;
    float _2417 = _2391;
    float _2419 = _2369;
    float _2421 = _2393;
    float _2423 = _2395;
    float _2425 = _2397;
    float _2427 = _2399;
    if (_2405)
    {
        float _2429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2411 = _2429;
    }
    float _2431 = _2411;
    if (_2405)
    {
        float _2433 = rsqrt(_2401);
        _2413 = _2433;
    }
    float _2435 = _2413;
    if (_2405)
    {
        float _2437 = _2409 * _2431;
        _2415 = _2437;
    }
    float _2439 = _2415;
    float _2441 = precise::max(0.0, _2381);
    float _2443 = 0.0;
    float _2445 = _2441;
    if (_2405)
    {
        float _2447 = _2439 * 0.15915493667125701904296875;
        _2443 = _2447;
    }
    float _2449 = _2443;
    float _2451 = -_2391;
    float _2453 = -_2441;
    float _2455 = fma(_2369, _2451, _2453);
    float _2457 = as_type<float>(_2041);
    float _2459 = _2455;
    if (_2405)
    {
        float _2461 = _2449 * 6.283185482025146484375;
        float _2463 = sin(_2461);
        _2457 = _2463;
    }
    float _2465 = _2457;
    if (_2405)
    {
        float _2467 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2417 = _2467;
    }
    float _2469 = _2417;
    float _2471 = _2439;
    float _2473 = _2469;
    if (_2405)
    {
        float _2475 = _2449 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        _2471 = _2477;
    }
    float _2479 = _2471;
    float _2481 = _2465;
    if (_2405)
    {
        float _2483 = fma(_2465, _2469, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2481 = _2483;
    }
    float _2485 = _2481;
    if (_2405)
    {
        float _2487 = _2435 * _2485;
        _2445 = _2487;
    }
    float _2489 = _2445;
    float _2491 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2405)
    {
        float _2493 = _2479 + (-1.0);
        _2419 = _2493;
    }
    float _2495 = _2419;
    if (_2405)
    {
        float _2497 = _2393 * _2489;
        _2421 = _2497;
    }
    float _2499 = _2421;
    if (_2405)
    {
        float _2501 = _2395 * _2489;
        _2423 = _2501;
    }
    float _2503 = _2423;
    float _2505 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2491);
    if (_2405)
    {
        float _2507 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2473 = _2507;
    }
    float _2509 = _2473;
    if (_2405)
    {
        float _2511 = _2499 * _2499;
        _2425 = _2511;
    }
    float _2513 = _2425;
    if (_2405)
    {
        float _2515 = _2503 * _2503;
        _2427 = _2515;
    }
    float _2517 = _2427;
    if (_2405)
    {
        float _2519 = fma(_2455, _2479, _2509);
        _2459 = _2519;
    }
    float _2521 = _2459;
    float _2523 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2525 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2505);
    float _2527 = fma(_2521, _2521, _2513);
    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2531 = fma(_2389, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2529);
    float _2533 = precise::clamp(_2531, 0.0, 1.0);
    float _2535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2537 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2539 = _2527 + _2517;
    float _2541 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2523);
    float _2543 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2545 = -_2533;
    float _2547 = _2545 + 1.0;
    float _2549 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2537);
    float _2551 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2541);
    float _2553 = rsqrt(_2539);
    float _2555 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2543);
    float _2557 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2549);
    float _2559 = _2551 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2561 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2555);
    float _2563 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2565 = abs(_2547);
    float _2567 = log2(_2565);
    float _2569 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2571 = -_2563;
    float _2573 = fma(_2571, _2535, 1.0);
    float _2575 = _2557 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2577 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2579 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2581 = _2553 * _2499;
    float _2583 = _2553 * _2521;
    float _2585 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2587 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2577);
    float _2589 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2591 = _2553 * _2503;
    float _2593 = log2(_2573);
    float _2595 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2587);
    float _2597 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2599 = -_2589;
    float _2601 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2599);
    float _2603 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2579);
    float _2605 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2595);
    float _2607 = _2583 + 1.0;
    float _2609 = exp2(_2597);
    float _2611 = -_2591;
    float _2613 = fma(_2611, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2601);
    float _2615 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2617 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2603);
    float _2619 = fma(_2613, -0.5, 0.5);
    float _2621 = fma(_2613, 0.5, 0.5);
    float _2623 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2615);
    float _2625 = 1.0 / _2605;
    float _2627 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2617);
    float _2629 = fma(_2621, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2631 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2623);
    float _2633 = _2593 * 0.693147182464599609375;
    float _2635 = sqrt(_2619);
    float _2637 = -_2583;
    float _2639 = fma(_2609, _2607, _2637);
    float _2641 = fma(_2621, _2629, -0.212114393711090087890625);
    float _2643 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2631);
    float _2645 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2647 = fma(_2621, _2641, 1.570728778839111328125);
    float _2649 = _2627 * _2625;
    float _2651 = _2643 * _2625;
    float _2653 = fma(_2649, 0.5, 0.5);
    float _2655 = fma(_2651, -0.5, 0.5);
    float _2657 = _2635 * 0.636619746685028076171875;
    float3 _6732 = float3(_2653, _2655, _2645);
    float _2659 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6732, float3(0.0), isnan(_6732)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6732, float3(0.0), isnan(_6732)), level(0.0)).x;
    float _2661 = -_2647;
    float _2663 = fma(_2657, _2661, 1.0);
    float _2665 = fma(_2639, 0.5, 0.5);
    float3 _6750 = float3(_2653, _2655, _2645);
    float4 _2667 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6750, float3(0.0), isnan(_6750)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6750, float3(0.0), isnan(_6750)), level(0.0)).xyzw;
    float _2669 = _2667.x;
    float _2671 = _2667.y;
    float _2673 = _2667.z;
    float _2675 = _2667.w;
    float2 _6766 = float2(_2663, _2665);
    float3 _2679 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6766, float2(0.0), isnan(_6766)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6766, float2(0.0), isnan(_6766)), level(0.0)).xyz;
    float _2681 = _2679.x;
    float _2683 = _2679.y;
    float _2685 = _2679.z;
    float _2687 = -_2043;
    float _2689 = fma(_2687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1845);
    float _2691 = _1731 * 3.883221149444580078125;
    float _2693 = -_2045;
    float _2695 = fma(_2693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1847);
    float _2697 = -_2067;
    float _2699 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1853);
    float _2701 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2703 = _2691 * 0.15915493667125701904296875;
    float _2705 = _1763 * _1815;
    bool _2707 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2709 = isnan(0.5);
    bool _2711 = _2707 || _2709;
    bool _2713 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2715 = _2711 || _2713;
    float _2717 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2701);
    float _2719 = _1747 * 2.0;
    float _2721 = _2703 * 6.283185482025146484375;
    float _2723 = cos(_2721);
    float _2725 = -_1547;
    float _2727 = _2725 + _1733;
    float _2729 = fma(_2699, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2717);
    float _2731 = -_2719;
    float _2733 = fma(_2705, _2731, _2705);
    float _2735 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2737 = fma(_1675, _2727, _1547);
    float _2739 = _2729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2741 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2743 = fma(_1747, 3.1415927410125732421875, _2733);
    float _2745 = _2703 * 6.283185482025146484375;
    float _2747 = sin(_2745);
    if (!_2715)
    {
        _2299 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2749 = _2299;
    float _2751 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2741);
    float _2753 = _2743 * 0.15915493667125701904296875;
    float _2755 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2737);
    out.m_63.x = _1535;
    out.m_63.y = _1519;
    out.m_63.z = _1505;
    out.m_63.w = _1521;
    float _2757 = fma(_2699, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2751);
    float _2759 = 1.0 / _2739;
    out.m_65.x = _630;
    out.m_65.y = _632;
    out.m_65.z = _636;
    out.m_65.w = _628;
    float _2761 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_67.x = _1561;
    out.m_67.y = _1541;
    out.m_67.z = _1543;
    out.m_67.w = _1483;
    float _2763 = _2761 + _2739;
    float _2765 = _2753 * 6.283185482025146484375;
    float _2767 = sin(_2765);
    out.m_69.y = _2163;
    float _2769 = -_2755;
    float _2771 = _2191 * _2769;
    out.m_71.x = _2361;
    out.m_71.y = _2357;
    out.m_71.z = _2365;
    float _2773 = _2201 * _2755;
    float _2775 = _2763 * _2759;
    float _2777 = _2775 * 0.5;
    float _2779 = exp2(_2735);
    float _2781 = _2193 * _2755;
    float _2783 = _2777;
    float _2785 = _2749;
    float _2787 = _2759;
    if (_2715)
    {
        _2301 = 1.0;
    }
    float _2789 = _2301;
    float _2791 = _2789;
    if (!_2715)
    {
        float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2795 = fma(_2777, _2749, _2793);
        _2783 = _2795;
    }
    float _2797 = _2783;
    if (!_2715)
    {
        _2785 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2799 = _2785;
    float _2801 = -_1685;
    float _2803 = fma(_2767, _2723, _2801);
    float _2805 = -_1687;
    float _2807 = fma(_2767, _2747, _2805);
    float _2809 = _2797;
    if (!_2715)
    {
        float _2811 = 1.0 / _2797;
        _2809 = _2811;
    }
    float _2813 = _2809;
    if (!_2715)
    {
        float _2815 = -_2799;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2787 = _2817;
    }
    float _2819 = _2787;
    float _2821 = fma(_1675, _2803, _1685);
    float _2823 = fma(_1675, _2807, _1687);
    float _2825 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2821);
    float _2827 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2823);
    float _2829 = _2819;
    if (!_2715)
    {
        float _2831 = 1.0 / _2819;
        _2829 = _2831;
    }
    float _2833 = _2829;
    float _2835 = -_2779;
    float _2837 = _2835 + 1.0;
    float _2839 = fma(_2195, _2825, _2771);
    float _2841 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2843 = fma(_2213, _2825, _2773);
    float _2845 = fma(_2227, _2825, _2781);
    float _2847 = fma(_2207, _2827, _2839);
    float _2849 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2841);
    float _2851 = fma(_2217, _2827, _2843);
    float _2853 = _2813;
    if (!_2715)
    {
        float _2855 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2857 = -_2799;
        float _2859 = fma(_2813, _2855, _2857);
        _2853 = _2859;
    }
    float _2861 = _2853;
    float _2863 = fma(_2235, _2827, _2845);
    float _2865 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2849);
    float _2867 = _2851 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2869 = _2851 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2871 = _2851 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2873 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2865);
    float _2875 = fma(_2847, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2867);
    float _2877 = fma(_2847, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2869);
    float _2879 = fma(_2847, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2871);
    float _2881 = _2861;
    if (!_2715)
    {
        float _2883 = _2861 * _2833;
        float _2885 = precise::clamp(_2883, 0.0, 1.0);
        _2881 = _2885;
    }
    float _2887 = _2881;
    float _2889 = fma(_2863, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2875);
    float _2891 = fma(_2863, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2877);
    float _2893 = fma(_2863, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2879);
    float _2895 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2715)
    {
        float _2897 = -_2887;
        float _2899 = _2897 + 1.0;
        _2791 = _2899;
    }
    float _2901 = _2791;
    float _2903 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2905 = _2873 + _2903;
    out.m_73.x = _2891;
    out.m_73.y = _2889;
    out.m_73.z = _2893;
    float _2907 = _2901 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2909 = _2901 > 0.0;
    bool _2911 = isnan(_2901);
    bool _2913 = _2909 || _2911;
    bool _2915 = isnan(0.0);
    bool _2917 = _2913 || _2915;
    float _2919 = _2605 + _2905;
    float _2921 = _371 * _2907;
    float _2923 = _2919 * 0.5;
    float _2925 = _2921 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2627;
    out.gl_Position.y = _2643;
    out.gl_Position.z = _2905;
    out.gl_Position.w = _2605;
    float _2927 = -_2895;
    float _2929 = _2927 + 1.0;
    out.m_75.z = _2923;
    out.m_75.w = _2605;
    out.m_47.x = _2925;
    float _2931 = _2895 * _2659;
    float _2933 = _2675 * _2931;
    float _2935 = _2675 * _2929;
    float _2937 = _2685 * _2931;
    float _2939 = fma(_2681, _2933, _2669);
    float _2941 = fma(_2683, _2933, _2671);
    float _2943 = fma(_2675, _2937, _2673);
    out.m_77.x = _2939;
    out.m_77.y = _2941;
    out.m_77.z = _2943;
    out.m_77.w = _2935;
    if (_2917)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2945 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2945;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1791 = false;
    bool _1603 = false;
    bool _656 = false;
    bool _527 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _101 = int(_99);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3002 = as_type<float>(_117);
        out.gl_Position.z = _3002;
    }
    if (!_105)
    {
        return out;
    }
    float _121 = in.m_49.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = _135;
    if (_131)
    {
        float _139 = float(_101);
        _111 = _139;
    }
    float _141 = _111;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    float _149 = _141;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _149;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3072 = as_type<float>(_155);
        out.gl_Position.z = _3072;
    }
    if (_147)
    {
        return out;
    }
    float _157 = in.m_51.x;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = in.m_53.y;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _161 * _159;
    float _183 = 0.0;
    if (!_175)
    {
        float _185 = _165 * _165;
        float _187 = _185 * 0.5;
        _183 = _187;
    }
    float _189 = _183;
    float _191 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _193 = _189;
    if (!_175)
    {
        float _195 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = in.m_49.x;
    float _201 = in.m_49.y;
    float _203 = in.m_49.z;
    float _205 = _191 * 6.283185482025146484375;
    float _207 = floor(_191);
    float _209 = _205 * 0.15915493667125701904296875;
    float _211 = _209 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = -_207;
    float _217 = _191 + _215;
    float _219 = _207;
    float _221 = _197;
    if (!_175)
    {
        _219 = _165;
    }
    float _223 = _219;
    bool _225 = !_175;
    float _227 = _223;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _165 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _165);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _257;
    }
    float _259 = _221;
    bool _261 = !_175;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _165 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _227 = _281;
    }
    float _283 = _227;
    float _285 = in.m_55.w;
    float _287 = in.m_44.x;
    float _289 = in.m_44.y;
    float _291 = in.m_44.z;
    bool _293 = _217 < 0.5;
    float _295 = float(_293);
    float _297 = -_217;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _303 = _301 != 0;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _307 = _305 != 0;
    float _309 = fma(_213, 0.5, 0.5);
    float _311 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_57.y = _163;
    bool _317 = !_303;
    int _319 = _317 ? 0 : 1;
    float _321 = -_309;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = fma(_283, _199, _311);
    bool _327 = !_307;
    int _329 = _327 ? 0 : 1;
    float _331 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _333 = !_179;
    int _335 = _333 ? 0 : 1;
    float _337 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _339 = abs(_319);
    float _341 = fma(_283, _201, _331);
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_283, _203, _337);
    int _347 = abs(_329);
    int _349 = abs(_335);
    float _351 = float(_339);
    float _353 = fma(_325, _285, _287);
    float _355 = float(_349);
    float _357 = fma(_341, _285, _289);
    float _359 = float(_347);
    float _361 = abs(_299);
    float _363 = _351 * _361;
    float _365 = fma(_345, _285, _291);
    float _367 = fma(_355, _323, _363);
    float _369 = abs(_315);
    float _371 = fma(_359, _369, _367);
    bool _373 = !_343;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_101);
        float _395 = 1.0 / _393;
        float _397 = _135 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = in.m_55.x;
    float _407 = in.m_55.y;
    float _409 = in.m_55.z;
    bool _411 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_399);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _423;
    bool _427 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_399);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _441 = 1.0 / _425;
    float _443 = -_437;
    float _445 = _443 + 1.0;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _403 * _441;
    float _455 = fma(_451, _453, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _461;
    float _465 = _439 * _157;
    float _467 = _421 * _445;
    float _469 = fma(_459, _453, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = fma(_463, _453, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _473 = -_421;
    float _475 = _473 + 1.0;
    float _477 = _455 * _467;
    float _479 = trunc(_465);
    int _481 = int(_479);
    float _483 = _469 * _467;
    float _485 = _471 * _467;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _477);
    float _489 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].z, _485);
    float _493 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].x, _487);
    float _495 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].y, _489);
    float _497 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].z, _491);
    float _499 = _493 * _405;
    float _501 = _495 * _407;
    float _503 = _497 * _409;
    int _505 = _481 << 4;
    int _507 = _505 + 1712;
    bool _509 = !_447;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_101);
        float _531 = 1.0 / _529;
        float _533 = _135 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    uint _538 = uint(int(uint(_507) >> uint(2)));
    uint _540 = uint(int(uint(int(_538)) >> uint(2)));
    int _542 = int(_538) & 3;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[int(_540)][_542];
    int _546 = int(_538) + 1;
    uint _548 = uint(int(uint(_546) >> uint(2)));
    int _550 = _546 & 3;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[int(_548)][_550];
    bool _554 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_535);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    int _572 = _507 + 8;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    uint _576 = uint(int(uint(int(_574)) >> uint(2)));
    int _578 = int(_574) & 3;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[int(_576)][_578];
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = 1.0 / _568;
    float _588 = -_564;
    float _590 = _588 + 1.0;
    float _592 = _584 * _586;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _535 + _594;
    bool _598 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _600 = isnan(_535);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = fma(_592, _596, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _612 = _608 * _590;
    float _614 = -_608;
    float _616 = _614 + 1.0;
    float _618 = _610 * _612;
    float _620 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[115].x, _618);
    float _622 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[116].x, _620);
    float _624 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _626 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _628 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _630 = _624 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _634 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _636 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _638 = !_570;
    float _654;
    if (!_638)
    {
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _642 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        float _658 = float(_101);
        float _660 = 1.0 / _658;
        float _662 = _135 * _660;
        _654 = _662;
    }
    _656 = false;
    float _664 = _654;
    int _666 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _668 = _666;
    int _670 = 0;
    int _672 = _92(_668, _670, (*spvDescriptorSet0.support_buffer));
    float _674 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _676 = int(_674);
    float _678 = fma(_135, 0.01200000010430812835693359375, _157);
    float _680 = in.m_53.z;
    float _682 = in.m_51.y;
    float _684 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _686 = int(_684);
    float _688 = float(_676);
    float _690 = floor(_678);
    float _692 = float(uint(_686));
    float _694 = 1.0 / _688;
    float _696 = 1.0 / _692;
    float _698 = _135 * _694;
    float _700 = trunc(_680);
    int _702 = int(_700);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    int _708 = as_type<int>(_696) + (-2);
    float _710 = trunc(_698);
    int _712 = int(_710);
    int _714 = ~_686;
    int _716 = _714 + 1;
    float _718 = float(uint(_712));
    float _720 = as_type<float>(_708) * _718;
    float _722 = trunc(_720);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    float _728 = fma(_690, 0.20000000298023223876953125, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _730 = precise::clamp(_728, 0.0, 1.0);
    int _732 = _716 * int(_726);
    int _734 = _732 + _712;
    float _736 = float(uint(_734));
    float _738 = as_type<float>(_708) * _736;
    float _740 = trunc(_738);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    int _746 = _672 + (-1);
    float _748 = float(_746);
    float _750 = _730 * _748;
    float _752 = _682 * 1.2345600128173828125;
    float _754 = trunc(_750);
    int _756 = int(_754);
    bool _758 = !_706;
    float _760 = _758 ? _752 : _157;
    int _762 = _756;
    int _764 = 0;
    int _766 = _93(_762, _764, (*spvDescriptorSet0.support_buffer));
    int _768 = _702;
    int _770 = 0;
    int _772 = _93(_768, _770, (*spvDescriptorSet0.support_buffer));
    float4 _775 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_766, _772)), 0).xyzw;
    float _777 = _775.x;
    float _779 = _775.y;
    float _781 = _775.z;
    float _783 = _775.w;
    int _785 = ~_686;
    int _787 = _785 + 1;
    float _789 = floor(_760);
    int _791 = int(_726) + int(_744);
    float _793 = float(_686);
    float _795 = float(_712);
    int _797 = _787 * _791;
    int _799 = _797 + _712;
    float _801 = float(_101);
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _805 = _795 >= _793;
    bool _807 = isnan(_795);
    bool _809 = _805 || _807;
    bool _811 = isnan(_793);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    bool _817 = uint(_799) >= uint(_686);
    bool _819 = _686 == 0;
    bool _821 = !_817;
    int _823 = _821 ? 0 : (-1);
    float _825 = trunc(_815);
    int _827 = int(_825);
    float _829 = -_789;
    float _831 = _760 + _829;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _835 = _833 != 0;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _839 = _837 != 0;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _843 = _841 != 0;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _847 = _845 != 0;
    int _849 = ~_791;
    int _851 = _849 + _823;
    int _853 = _851 + 1;
    float _855 = _831 * _793;
    float _857 = _135 * _793;
    float _859 = 1.0 / _801;
    int _861 = _686 * _853;
    int _863 = _861 + _712;
    int _865 = _686 + (-1);
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _869 = _867 != 0;
    bool _871 = !_819;
    int _873 = _871 ? _863 : (-1);
    int _875 = ~_827;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    float _881 = trunc(_855);
    int _883 = int(_881);
    bool _885 = !_869;
    int _887 = _885 ? 0 : 1;
    bool _889 = !_835;
    int _891 = _889 ? 0 : 1;
    int _893 = _873 * _879;
    bool _895 = !_839;
    int _897 = _895 ? 0 : 1;
    float _899 = _857 * _859;
    int _901 = _827 * _865;
    int _903 = _901 + _893;
    int _905 = abs(_897);
    int _907 = abs(_887);
    float _909 = trunc(_899);
    int _911 = int(_909);
    bool _913 = !_843;
    int _915 = _913 ? 0 : 1;
    int _917 = abs(_891);
    int _919 = _883 * _907;
    int _921 = _919 + _712;
    int _923 = abs(_915);
    int _925 = _903 * _905;
    bool _927 = !_847;
    int _929 = _927 ? 0 : 1;
    int _931 = abs(_929);
    int _933 = _911 * _917;
    int _935 = _933 + _925;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _939 = _937 != 0;
    int _941 = ~_686;
    int _943 = _941 + 1;
    int _945 = _921 * _923;
    int _947 = _945 + _935;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _951 = _949 != 0;
    float _953 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _957 = _955 != 0;
    int _959 = _883 * _931;
    int _961 = _959 + _947;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _965 = _963 != 0;
    float _967 = in.m_53.x;
    float _969 = float(uint(_921));
    float _971 = float(uint(_961));
    float _973 = _859;
    float _975 = _953;
    float _977 = _967;
    if (_939)
    {
        float _979 = in.m_51.z;
        _973 = _979;
    }
    float _981 = _973;
    int _983 = ~_686;
    int _985 = _983 + 1;
    float _987 = as_type<float>(_708) * _971;
    int _989 = ~_686;
    int _991 = _989 + 1;
    float _993 = trunc(_987);
    float _995 = precise::max(_993, 0.0);
    uint _997 = uint(_995);
    int _999 = _991 * int(_997);
    int _1001 = _999 + _961;
    float _1003 = float(uint(_1001));
    float _1005 = as_type<float>(_708) * _1003;
    float _1007 = in.m_51.w;
    float _1009 = trunc(_1005);
    float _1011 = precise::max(_1009, 0.0);
    uint _1013 = uint(_1011);
    int _1015 = int(_997) + int(_1013);
    float _1017 = -_163;
    float _1019 = _1017 + 1.0;
    bool _1021 = _1007 > 0.5;
    bool _1023 = _1021 && _965;
    int _1025 = _943 * _1015;
    int _1027 = _1025 + _961;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1033 = uint(_1027) >= uint(_686);
    float _1035 = 1.0 / _1031;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1039 = !_1033;
    int _1041 = _1039 ? 0 : (-1);
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1045 = _1043 != 0;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1049 = -_1037;
    float _1051 = fma(_953, 2.0, _1049);
    float _1053 = _682 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1055 = _682 > 0.5;
    bool _1057 = _1055 && _1045;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1059;
    float _1063 = fma(_1053, -2.0, _1047);
    float _1065 = _1023 ? _1019 : _163;
    float _1067 = -_135;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1051);
    float _1071 = _1061 * _1035;
    float _1073 = _1035;
    bool _1075 = _1023;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    bool _1079 = _1057;
    if (!_706)
    {
        float _1081 = in.m_51.z;
        _1073 = _1081;
    }
    float _1083 = _1073;
    if (_939)
    {
        bool _1085 = _981 > 0.5;
        _1075 = _1085;
    }
    bool _1087 = _1075;
    float _1089 = as_type<float>(_708) * _969;
    int _1091 = ~_1015;
    int _1093 = _1091 + _1041;
    int _1095 = _1093 + 1;
    float _1097 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1063);
    float _1099 = _1057 ? _1019 : _163;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1103 = ~_686;
    int _1105 = _1103 + 1;
    int _1107 = _686 * _1095;
    int _1109 = _1107 + _961;
    float _1111 = trunc(_1089);
    float _1113 = precise::max(_1111, 0.0);
    uint _1115 = uint(_1113);
    float _1117 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1101);
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _664 + _1119;
    bool _1123 = !_819;
    int _1125 = _1123 ? _1109 : (-1);
    float _1127 = fma(_1071, _1121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_706)
    {
        _1077 = _682;
    }
    float _1129 = _1077;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1133 = _1125 >> 31;
    float _1135 = _1129;
    if (_957)
    {
        bool _1137 = _157 > 0.5;
        _1079 = _1137;
    }
    bool _1139 = _1079;
    float _1141 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    int _1143 = _1133 & 3;
    float _1145 = _1141;
    if (_706)
    {
        _1135 = _157;
    }
    float _1147 = _1135;
    float _1149 = _803 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1151 = _1125 + _1143;
    int _1153 = _1105 * int(_1115);
    int _1155 = _1153 + _921;
    int _1157 = as_type<int>(_1149);
    if (!_957)
    {
        _975 = _967;
    }
    float _1159 = _975;
    float _1161 = fma(_1149, _1099, -0.5);
    int _1163 = _1151 >> 2;
    float _1165 = _1159;
    if (_957)
    {
        float _1167 = -_967;
        float _1169 = _1167 + 1.0;
        _1157 = as_type<int>(_1169);
    }
    int _1171 = _1157;
    float _1173 = float(uint(_1155));
    float _1175 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1141);
    int _1177 = _1163 << 4;
    int _1179 = _1177 + 512;
    float _1181 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1183 = _1083;
    if (!_706)
    {
        _1145 = _1083;
    }
    float _1185 = _1145;
    float _1187 = as_type<float>(_708) * _1173;
    float _1189 = _1185;
    if (_706)
    {
        _1189 = _682;
    }
    float _1191 = _1189;
    if (_706)
    {
        _1183 = _682;
    }
    float _1193 = _1183;
    float _1195 = -_1097;
    float _1197 = fma(_1175, _1161, _1195);
    if (_957)
    {
        float _1199 = _1139 ? as_type<float>(_1171) : _967;
        _1165 = _1199;
    }
    float _1201 = _1165;
    float _1203 = trunc(_1187);
    float _1205 = precise::max(_1203, 0.0);
    uint _1207 = uint(_1205);
    uint _1209 = uint(int(uint(_1179) >> uint(2)));
    uint _1211 = uint(int(uint(int(_1209)) >> uint(2)));
    int _1213 = int(_1209) & 3;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[int(_1211)][_1213];
    int _1217 = int(_1209) + 1;
    uint _1219 = uint(int(uint(_1217) >> uint(2)));
    int _1221 = _1217 & 3;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[int(_1219)][_1221];
    bool _1225 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1227 = isnan(_664);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    bool _1237 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1239 = isnan(_664);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = -_1235;
    float _1251 = _1249 + 1.0;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1255 = _1125 & 3;
    bool _1257 = _1255 != 0;
    float _1259 = _1247 * _1251;
    float _1261 = -_1247;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1253);
    int _1267 = _1125 & 3;
    bool _1269 = _1267 != 0;
    int _1271 = _1179 + 8;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    uint _1275 = uint(int(uint(int(_1273)) >> uint(2)));
    int _1277 = int(_1273) & 3;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[int(_1275)][_1277];
    int _1281 = int(_1273) + 1;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    int _1285 = _1281 & 3;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[int(_1283)][_1285];
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1291 = _1257 ? 0 : 1;
    float _1293 = _1127 * _1259;
    bool _1295 = uint(_1267) > 1u;
    float _1297 = -_1289;
    float _1299 = fma(_1181, 2.0, _1297);
    int _1301 = int(_1115) + int(_1207);
    int _1303 = int(_1207);
    if (_939)
    {
        float _1305 = -_967;
        float _1307 = _1305 + 1.0;
        _1303 = as_type<int>(_1307);
    }
    int _1309 = _1303;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1313 = ~_1291;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    float _1319 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1293);
    int _1321 = _1317;
    if (_939)
    {
        float _1323 = _1087 ? as_type<float>(_1309) : _967;
        _977 = _1323;
    }
    float _1325 = _977;
    int _1327 = _985 * _1301;
    int _1329 = _1327 + _921;
    bool _1331 = _1267 != 3;
    float _1333 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1311);
    bool _1335 = uint(_1267) >= 2u;
    float _1337 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    if (!_1295)
    {
        int _1339 = ~_1291;
        int _1341 = _1339 + 1;
        _1321 = _1341;
    }
    int _1343 = _1321;
    float _1345 = -_135;
    float _1347 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1299);
    bool _1349 = uint(_1329) >= uint(_686);
    int _1351 = _1335 ? 0 : 1;
    int _1353 = abs(_1343);
    bool _1355 = !_1269;
    int _1357 = _1355 ? 0 : 1;
    bool _1359 = !_1349;
    int _1361 = _1359 ? 0 : (-1);
    int _1363 = ~_1351;
    int _1365 = _1363 + 1;
    int _1367 = _1365 + 1;
    bool _1369 = _1267 != 3;
    int _1371 = _1367;
    if (_1331)
    {
        int _1373 = ~_1351;
        int _1375 = _1373 + 1;
        _1371 = _1375;
    }
    int _1377 = _1371;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1381 = abs(_1357);
    int _1383 = ~_1353;
    int _1385 = _1383 + 1;
    int _1387 = _1385 + 1;
    int _1389 = ~_1301;
    int _1391 = _1389 + _1361;
    int _1393 = _1391 + 1;
    bool _1395 = !_1369;
    int _1397 = _1395 ? 0 : (-1);
    int _1399 = _1387 * as_type<int>(_1223);
    int _1401 = abs(_1377);
    int _1403 = _686 * _1393;
    int _1405 = _1403 + _921;
    int _1407 = ~_1381;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    bool _1413 = !_951;
    int _1415 = _1413 ? 0 : 1;
    int _1417 = abs(_1397);
    int _1419 = _1411 * as_type<int>(_1215);
    int _1421 = _1419 + _1399;
    int _1423 = abs(_1415);
    int _1425 = ~_1401;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    int _1431 = _1429 * as_type<int>(_1279);
    int _1433 = _1431 + _1421;
    float _1435 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1437 = ~_1417;
    int _1439 = _1437 + 1;
    int _1441 = _1439 + 1;
    float _1443 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1445 = ~_1423;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    float _1451 = fma(_1435, _1201, -0.5);
    float _1453 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _1455 = _1441 * as_type<int>(_1287);
    int _1457 = _1455 + _1433;
    bool _1459 = !_819;
    int _1461 = _1459 ? _1405 : (-1);
    float _1463 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1265);
    int _1465 = _1457 * _1449;
    float _1467 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1319);
    float _1469 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1333);
    float _1471 = fma(_1463, _1337, _1347);
    int _1473 = _1461 * _1423;
    int _1475 = _1473 + _1465;
    uint _1477 = as_type<uint>(half2(float2(_783, 0.0)));
    float _1479 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1117);
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1483 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _1485 = extract_bits(_1477, 0u, 8u);
    int _1487 = int(_1485) & 255;
    uint _1489 = extract_bits(_1477, 8u, 8u);
    int _1491 = int(_1489) & 255;
    int _1493 = _1491 << 8;
    int _1495 = _1487 | _1493;
    float _1497 = fma(_1479, _1451, _1069);
    float _1499 = float(_1475);
    float _1501 = fma(_1443, -2.0, _1481);
    bool _1503 = _1495 >= 32768;
    float _1505 = _1471 + 0.5;
    int _1507 = _1495 + (-1024);
    out.m_59.y = _1499;
    int _1509 = _756 + 1;
    float _1511 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1501);
    int _1513 = min(_746, _1509);
    float _1515 = -_1511;
    float _1517 = fma(_1469, _1453, _1515);
    float _1519 = _1197 + 0.5;
    float _1521 = _1517 + 0.5;
    int _1523 = _1507;
    if (_1503)
    {
        int _1525 = ~_1495;
        int _1527 = _1525 + 33792;
        int _1529 = _1527 + 1;
        _1523 = _1529;
    }
    int _1531 = _1523;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1535 = _1497 + 0.5;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1539 = _1531 + 30719;
    float _1541 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1543 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = float(_1539);
    float _1547 = fma(_1545, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1551 = abs(_1547);
    float _1553 = -_1551;
    float _1555 = _1553 + 1.0;
    float _1557 = abs(_1547);
    float _1559 = fma(_1557, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1561 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1563 = _1547 < 0.0;
    float _1565 = float(_1563);
    int _1567 = as_type<int>(_1555) + (-218103808);
    float _1569 = abs(_1547);
    float _1571 = fma(_1569, _1559, -0.212114393711090087890625);
    bool _1573 = uint(_1567) >= 1920991232u;
    float _1575 = abs(_1547);
    float _1577 = fma(_1575, _1571, 1.570728778839111328125);
    bool _1579 = !_1573;
    float _1601;
    if (!_1579)
    {
        int _1581 = as_type<int>(_1555);
        int _1583 = as_type<int>(_1471);
        int _1585 = 7664;
        int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].y);
        int _1589;
        int _1591;
        int _1593;
        int _1595;
        int _1597;
        int _1599;
        _90(_1581, _1583, _1585, _1587, _1589, _1591, _1593, _1595, _1597, _1599, out.gl_Position, out.gl_PointSize);
        _1601 = as_type<float>(_1597);
        _1603 = true;
    }
    else
    {
        float _1605 = rsqrt(_1555);
        float _1607 = _1555 * _1605;
        float _1609 = _1605 * 0.5;
        float _1611 = -_1607;
        float _1613 = 0.0 + _1611;
        float _1615 = fma(_1609, _1613, 0.5);
        float _1617 = fma(_1607, _1615, _1607);
        float _1619 = -_1617;
        float _1621 = 0.0 + _1619;
        float _1623 = fma(_1617, _1621, _1555);
        float _1625 = fma(_1609, _1623, _1617);
        _1601 = _1625;
    }
    _1603 = false;
    float _1627 = _1601;
    int _1629 = _1513;
    int _1631 = 0;
    int _1633 = _93(_1629, _1631, (*spvDescriptorSet0.support_buffer));
    int _1635 = _702;
    int _1637 = 0;
    int _1639 = _93(_1635, _1637, (*spvDescriptorSet0.support_buffer));
    float4 _1641 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1633, _1639)), 0).xyzw;
    float _1643 = _1641.x;
    float _1645 = _1641.y;
    float _1647 = _1641.z;
    float _1649 = _1641.w;
    float _1651 = floor(_750);
    float _1653 = _1577 * _1627;
    float _1655 = _1565 * 2.0;
    float _1657 = _1545 * 3.883221149444580078125;
    float _1659 = -_1655;
    float _1661 = fma(_1653, _1659, _1653);
    float _1663 = _1657 * 0.15915493667125701904296875;
    float _1665 = fma(_1565, 3.1415927410125732421875, _1661);
    float _1667 = _1663 * 6.283185482025146484375;
    float _1669 = cos(_1667);
    float _1671 = _1665 * 0.15915493667125701904296875;
    float _1673 = -_1651;
    float _1675 = _750 + _1673;
    float _1677 = _1671 * 6.283185482025146484375;
    float _1679 = sin(_1677);
    float _1681 = _1663 * 6.283185482025146484375;
    float _1683 = sin(_1681);
    float _1685 = _1679 * _1669;
    float _1687 = _1679 * _1683;
    uint _1689 = as_type<uint>(half2(float2(_1649, 0.0)));
    float _1691 = -_777;
    float _1693 = _1691 + _1643;
    float _1695 = -_781;
    float _1697 = _1695 + _1647;
    uint _1699 = extract_bits(_1689, 0u, 8u);
    int _1701 = int(_1699) & 255;
    uint _1703 = extract_bits(_1689, 8u, 8u);
    int _1705 = int(_1703) & 255;
    int _1707 = _1705 << 8;
    int _1709 = _1701 | _1707;
    float _1711 = fma(_1675, _1693, _777);
    float _1713 = fma(_1675, _1697, _781);
    bool _1715 = _1709 >= 32768;
    int _1717 = _1709 + (-1024);
    int _1719 = _1717;
    if (_1715)
    {
        int _1721 = ~_1709;
        int _1723 = _1721 + 33792;
        int _1725 = _1723 + 1;
        _1719 = _1725;
    }
    int _1727 = _1719;
    int _1729 = _1727 + 30719;
    float _1731 = float(_1729);
    float _1733 = fma(_1731, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1735 = abs(_1733);
    float _1737 = -_1735;
    float _1739 = _1737 + 1.0;
    float _1741 = abs(_1733);
    float _1743 = fma(_1741, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1745 = _1733 < 0.0;
    float _1747 = float(_1745);
    int _1749 = as_type<int>(_1739) + (-218103808);
    float _1751 = abs(_1733);
    float _1753 = fma(_1751, _1743, -0.212114393711090087890625);
    bool _1755 = uint(_1749) >= 1920991232u;
    float _1757 = -_779;
    float _1759 = _1757 + _1645;
    float _1761 = abs(_1733);
    float _1763 = fma(_1761, _1753, 1.570728778839111328125);
    float _1765 = fma(_1675, _1759, _779);
    bool _1767 = !_1755;
    float _1789;
    if (!_1767)
    {
        int _1769 = as_type<int>(_1739);
        int _1771 = as_type<int>(_1645);
        int _1773 = 8560;
        int _1775 = as_type<int>(_1627);
        int _1777;
        int _1779;
        int _1781;
        int _1783;
        int _1785;
        int _1787;
        _90(_1769, _1771, _1773, _1775, _1777, _1779, _1781, _1783, _1785, _1787, out.gl_Position, out.gl_PointSize);
        _1789 = as_type<float>(_1785);
        _1791 = true;
    }
    else
    {
        float _1793 = rsqrt(_1739);
        float _1795 = _1739 * _1793;
        float _1797 = _1793 * 0.5;
        float _1799 = -_1795;
        float _1801 = 0.0 + _1799;
        float _1803 = fma(_1797, _1801, 0.5);
        float _1805 = fma(_1795, _1803, _1795);
        float _1807 = -_1805;
        float _1809 = 0.0 + _1807;
        float _1811 = fma(_1805, _1809, _1739);
        float _1813 = fma(_1797, _1811, _1805);
        _1789 = _1813;
    }
    _1791 = false;
    float _1815 = _1789;
    float _1817 = in.m_51.x;
    float _1819 = in.m_51.y;
    float _1821 = in.m_51.z;
    float _1823 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1825 = log2(_1823);
    float _1827 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1829 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1831 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1833 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1827);
    float _1835 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1829);
    float _1837 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1831);
    float _1839 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1833);
    float _1841 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1835);
    float _1843 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1837);
    float _1845 = _1839 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1847 = _1841 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1849 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1851 = _1825 * _135;
    float _1853 = _1843 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1857 = _1847 + _1855;
    float _1859 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1861 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1863 = exp2(_1851);
    float _1865 = _1817 * 2.0;
    float _1867 = _1821 * 2.0;
    float _1869 = _1819 * 2.0;
    float _1871 = floor(_1865);
    float _1873 = floor(_1867);
    float _1875 = floor(_1869);
    bool _1877 = _1871 > 0.0;
    bool _1879 = _1871 >= 0.0;
    bool _1881 = isnan(_1871);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan(0.0);
    bool _1887 = _1883 || _1885;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1891 = _1845 + _1889;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1895 = _1893 != 0;
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1899 = _1897 != 0;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1903 = _1901 != 0;
    float _1905 = _1891 * _1891;
    bool _1907 = _1873 >= 0.0;
    bool _1909 = isnan(_1873);
    bool _1911 = _1907 || _1909;
    bool _1913 = isnan(0.0);
    bool _1915 = _1911 || _1913;
    float _1917 = _1819 + _1821;
    int _1919 = _1887 ? 0 : 1;
    float _1921 = fma(_1857, _1857, _1905);
    int _1923 = _1915 ? 0 : 1;
    float _1925 = _1917 + (-1.0);
    bool _1927 = _1873 > 0.0;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1931 = _1853 + _1929;
    bool _1933 = _1875 > 0.0;
    bool _1935 = _1875 >= 0.0;
    bool _1937 = isnan(_1875);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan(0.0);
    bool _1943 = _1939 || _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1947 = 1.0 + _1945;
    int _1949 = ~_1919;
    int _1951 = _1949 + 1;
    int _1953 = _1951 + 1;
    float _1955 = fma(_1931, _1931, _1921);
    int _1957 = _1953;
    if (!_1877)
    {
        int _1959 = ~_1919;
        int _1961 = _1959 + 1;
        _1957 = _1961;
    }
    int _1963 = _1957;
    float _1965 = in.m_61.x;
    float _1967 = in.m_61.y;
    float _1969 = in.m_61.z;
    float _1971 = 1.0 / _1947;
    bool _1973 = !_1899;
    int _1975 = _1973 ? 0 : 1;
    bool _1977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1979 = isnan(1.0);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1985 = _1981 || _1983;
    int _1987 = abs(_1975);
    float _1989 = -_1863;
    float _1991 = _1989 + 1.0;
    bool _1993 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2001 = _1997 || _1999;
    float _2003 = rsqrt(_1955);
    float _2005 = float(_1987);
    float _2007 = _2001 ? _1991 : 0.0;
    float _2009 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2011 = float(_1963);
    int _2013 = ~_1923;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    int _2019 = _2017;
    if (_1985)
    {
        float _2021 = _2007 * _1971;
        _137 = _2021;
    }
    float _2023 = _137;
    bool _2025 = !_1895;
    int _2027 = _2025 ? 0 : 1;
    float _2029 = _2005 * _2011;
    if (!_1927)
    {
        int _2031 = ~_1923;
        int _2033 = _2031 + 1;
        _2019 = _2033;
    }
    int _2035 = _2019;
    int _2037 = abs(_2027);
    float _2039 = _2029 * (-2.0);
    int _2041 = _1943 ? 0 : 1;
    float _2043 = _1891 * _2003;
    float _2045 = _1857 * _2003;
    float _2047 = fma(_2009, _2039, _2009);
    float _2049 = fma(_2039, _1967, _1967);
    float _2051 = -_2043;
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1891);
    float _2055 = -_2045;
    float _2057 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1857);
    float _2059 = _1819 + (-0.5);
    float _2061 = float(_2037);
    float _2063 = _2053 * _2053;
    float _2065 = float(_2035);
    float _2067 = _1931 * _2003;
    float _2069 = fma(_2059, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2049);
    float _2071 = fma(_2057, _2057, _2063);
    bool _2073 = !_1903;
    int _2075 = _2073 ? 0 : 1;
    float _2077 = _2061 * _2065;
    int _2079 = ~_2041;
    int _2081 = _2079 + 1;
    int _2083 = _2081 + 1;
    float _2085 = -_2067;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1931);
    int _2089 = _2083;
    if (!_1933)
    {
        int _2091 = ~_2041;
        int _2093 = _2091 + 1;
        _2089 = _2093;
    }
    int _2095 = _2089;
    float _2097 = _1819 + _1817;
    int _2099 = abs(_2075);
    float _2101 = _1817 + _1821;
    float _2103 = float(_2095);
    float _2105 = fma(_2087, _2087, _2071);
    float _2107 = float(_2099);
    float _2109 = _2101 + (-1.0);
    float _2111 = _2097 + (-1.0);
    float _2113 = fma(_2047, _2023, _2069);
    float _2115 = _2107 * _2103;
    float _2117 = fma(_2111, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2119 = _2077 * (-2.0);
    float _2121 = _2115 * (-2.0);
    float _2123 = _2113 * 0.15915493667125701904296875;
    float _2125 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2127 = fma(_2119, _1965, _1965);
    float _2129 = fma(_2117, _2119, _2117);
    float _2131 = _1817 + (-0.5);
    float _2133 = _1821 + (-0.5);
    float _2135 = fma(_2121, _1969, _1969);
    float _2137 = fma(_2125, _2121, _2125);
    float _2139 = fma(_2131, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2127);
    float _2141 = sqrt(_2105);
    float _2143 = fma(_2133, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2135);
    float _2145 = fma(_2129, _2023, _2139);
    float _2147 = fma(_2137, _2023, _2143);
    float _2149 = _2145 * 0.15915493667125701904296875;
    float _2151 = _2123 * 6.283185482025146484375;
    float _2153 = sin(_2151);
    float _2155 = _2147 * 0.15915493667125701904296875;
    float _2157 = _2123 * 6.283185482025146484375;
    float _2159 = cos(_2157);
    float _2161 = _2003 * _2141;
    float _2163 = _1849 * _2161;
    float _2165 = _1859 * _2161;
    float _2167 = _1861 * _2161;
    float _2169 = _2149 * 6.283185482025146484375;
    float _2171 = sin(_2169);
    float _2173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1713);
    float _2175 = _2167 * _2173;
    float _2177 = _2155 * 6.283185482025146484375;
    float _2179 = cos(_2177);
    float _2181 = _2149 * 6.283185482025146484375;
    float _2183 = cos(_2181);
    float _2185 = _2171 * _2153;
    float _2187 = _2171 * _2159;
    float _2189 = _2155 * 6.283185482025146484375;
    float _2191 = sin(_2189);
    float _2193 = _2171 * _2179;
    float _2195 = _2159 * _2179;
    float _2197 = _2183 * _2159;
    float _2199 = _2183 * _2153;
    float _2201 = _2183 * _2179;
    float _2203 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1765);
    float _2205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1711);
    float _2207 = _2153 * _2179;
    float _2209 = _2163 * _2203;
    float _2211 = _2165 * _2205;
    float _2213 = fma(_2191, _2197, _2185);
    float _2215 = -_2187;
    float _2217 = fma(_2191, _2199, _2215);
    float _2219 = _2201 * _2209;
    float _2221 = -_2209;
    float _2223 = _2191 * _2221;
    float _2225 = -_2199;
    float _2227 = fma(_2191, _2187, _2225);
    float _2229 = _2193 * _2209;
    float _2231 = fma(_2213, _2211, _2219);
    float _2233 = fma(_2195, _2211, _2223);
    float _2235 = fma(_2191, _2185, _2197);
    float _2237 = fma(_2227, _2211, _2229);
    float _2239 = fma(_2217, _2175, _2231);
    float _2241 = fma(_2207, _2175, _2233);
    float _2243 = fma(_2235, _2175, _2237);
    float _2245 = _2239 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2247 = _2239 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2249 = _2239 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2251 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2245);
    float _2253 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2247);
    float _2255 = _690 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2257 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2249);
    float _2259 = fma(_2243, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2251);
    float _2261 = fma(_2243, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2253);
    float _2263 = fma(_2243, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2257);
    float _2265 = _1853 + _2259;
    float _2267 = _1847 + _2261;
    float _2269 = _1845 + _2263;
    float _2271 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2265);
    float _2273 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2267);
    float _2275 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2269);
    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2279 = _2271 + _2277;
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2283 = _2273 + _2281;
    float _2285 = _2279 * _2279;
    float _2287 = fma(_2283, _2283, _2285);
    float _2289 = sqrt(_2287);
    bool _2291 = _2289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2293 = _2249;
    float _2295 = _2269;
    float _2297 = _2275;
    float _2299 = 0.5;
    float _2301 = _2201;
    if (!_2291)
    {
        _2293 = _2273;
    }
    float _2303 = _2293;
    float _2305 = _2303;
    if (!_2291)
    {
        _2295 = _2271;
    }
    float _2307 = _2295;
    bool _2309 = !_2291;
    float _2311 = _2307;
    if (!_2309)
    {
        float _2313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2317 = _2289 + _2315;
        float _2319 = rsqrt(_2287);
        float _2321 = _2317 * _2313;
        float _2323 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2325 = _2321 * 0.15915493667125701904296875;
        float _2327 = _2325 * 6.283185482025146484375;
        float _2329 = cos(_2327);
        float _2331 = _2325 * 6.283185482025146484375;
        float _2333 = sin(_2331);
        float _2335 = _2329 + (-1.0);
        float _2337 = fma(_2333, _2323, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2341 = _2319 * _2337;
        float _2343 = fma(_2275, _2329, _2339);
        float _2345 = fma(_2283, _2341, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2347 = fma(_2279, _2341, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2297 = _2343;
        _2305 = _2345;
        _2311 = _2347;
    }
    float _2349 = _2297;
    float _2351 = _2305;
    float _2353 = _2311;
    float _2355 = -_2043;
    float _2357 = fma(_2355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2349);
    float _2359 = -_2045;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2351);
    float _2363 = -_2067;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2353);
    float _2367 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2369 = _2357 + _2367;
    float _2371 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2373 = _2361 + _2371;
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2377 = _2365 + _2375;
    float _2379 = _2369 * _2369;
    float _2381 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2383 = fma(_2373, _2373, _2379);
    float _2385 = fma(_2377, _2377, _2383);
    float _2387 = rsqrt(_2385);
    float _2389 = sqrt(_2385);
    float _2391 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2393 = _2373 * _2391;
    float _2395 = _2377 * _2391;
    float _2397 = _2393 * _2393;
    float _2399 = _2395 * _2395;
    float _2401 = _2397 + _2399;
    float _2403 = sqrt(_2401);
    bool _2405 = _2403 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2409 = _2403 + _2407;
    float _2411 = _2063;
    float _2413 = _2401;
    float _2415 = _2409;
    float _2417 = _2391;
    float _2419 = _2369;
    float _2421 = _2393;
    float _2423 = _2395;
    float _2425 = _2397;
    float _2427 = _2399;
    if (_2405)
    {
        float _2429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2411 = _2429;
    }
    float _2431 = _2411;
    if (_2405)
    {
        float _2433 = rsqrt(_2401);
        _2413 = _2433;
    }
    float _2435 = _2413;
    if (_2405)
    {
        float _2437 = _2409 * _2431;
        _2415 = _2437;
    }
    float _2439 = _2415;
    float _2441 = precise::max(0.0, _2381);
    float _2443 = 0.0;
    float _2445 = _2441;
    if (_2405)
    {
        float _2447 = _2439 * 0.15915493667125701904296875;
        _2443 = _2447;
    }
    float _2449 = _2443;
    float _2451 = -_2391;
    float _2453 = -_2441;
    float _2455 = fma(_2369, _2451, _2453);
    float _2457 = as_type<float>(_2041);
    float _2459 = _2455;
    if (_2405)
    {
        float _2461 = _2449 * 6.283185482025146484375;
        float _2463 = sin(_2461);
        _2457 = _2463;
    }
    float _2465 = _2457;
    if (_2405)
    {
        float _2467 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2417 = _2467;
    }
    float _2469 = _2417;
    float _2471 = _2439;
    float _2473 = _2469;
    if (_2405)
    {
        float _2475 = _2449 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        _2471 = _2477;
    }
    float _2479 = _2471;
    float _2481 = _2465;
    if (_2405)
    {
        float _2483 = fma(_2465, _2469, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2481 = _2483;
    }
    float _2485 = _2481;
    if (_2405)
    {
        float _2487 = _2435 * _2485;
        _2445 = _2487;
    }
    float _2489 = _2445;
    float _2491 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2405)
    {
        float _2493 = _2479 + (-1.0);
        _2419 = _2493;
    }
    float _2495 = _2419;
    if (_2405)
    {
        float _2497 = _2393 * _2489;
        _2421 = _2497;
    }
    float _2499 = _2421;
    if (_2405)
    {
        float _2501 = _2395 * _2489;
        _2423 = _2501;
    }
    float _2503 = _2423;
    float _2505 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2491);
    if (_2405)
    {
        float _2507 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2473 = _2507;
    }
    float _2509 = _2473;
    if (_2405)
    {
        float _2511 = _2499 * _2499;
        _2425 = _2511;
    }
    float _2513 = _2425;
    if (_2405)
    {
        float _2515 = _2503 * _2503;
        _2427 = _2515;
    }
    float _2517 = _2427;
    if (_2405)
    {
        float _2519 = fma(_2455, _2479, _2509);
        _2459 = _2519;
    }
    float _2521 = _2459;
    float _2523 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2525 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2505);
    float _2527 = fma(_2521, _2521, _2513);
    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2531 = fma(_2389, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2529);
    float _2533 = precise::clamp(_2531, 0.0, 1.0);
    float _2535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2537 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2539 = _2527 + _2517;
    float _2541 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2523);
    float _2543 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2545 = -_2533;
    float _2547 = _2545 + 1.0;
    float _2549 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2537);
    float _2551 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2541);
    float _2553 = rsqrt(_2539);
    float _2555 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2543);
    float _2557 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2549);
    float _2559 = _2551 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2561 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2555);
    float _2563 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2565 = abs(_2547);
    float _2567 = log2(_2565);
    float _2569 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2571 = -_2563;
    float _2573 = fma(_2571, _2535, 1.0);
    float _2575 = _2557 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2577 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2579 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2581 = _2553 * _2499;
    float _2583 = _2553 * _2521;
    float _2585 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2587 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2577);
    float _2589 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2591 = _2553 * _2503;
    float _2593 = log2(_2573);
    float _2595 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2587);
    float _2597 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2599 = -_2589;
    float _2601 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2599);
    float _2603 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2579);
    float _2605 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2595);
    float _2607 = _2583 + 1.0;
    float _2609 = exp2(_2597);
    float _2611 = -_2591;
    float _2613 = fma(_2611, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2601);
    float _2615 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2617 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2603);
    float _2619 = fma(_2613, -0.5, 0.5);
    float _2621 = fma(_2613, 0.5, 0.5);
    float _2623 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2615);
    float _2625 = 1.0 / _2605;
    float _2627 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2617);
    float _2629 = fma(_2621, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2631 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2623);
    float _2633 = _2593 * 0.693147182464599609375;
    float _2635 = sqrt(_2619);
    float _2637 = -_2583;
    float _2639 = fma(_2609, _2607, _2637);
    float _2641 = fma(_2621, _2629, -0.212114393711090087890625);
    float _2643 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2631);
    float _2645 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2647 = fma(_2621, _2641, 1.570728778839111328125);
    float _2649 = _2627 * _2625;
    float _2651 = _2643 * _2625;
    float _2653 = fma(_2649, 0.5, 0.5);
    float _2655 = fma(_2651, -0.5, 0.5);
    float _2657 = _2635 * 0.636619746685028076171875;
    float3 _6732 = float3(_2653, _2655, _2645);
    float _2659 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6732, float3(0.0), isnan(_6732)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6732, float3(0.0), isnan(_6732)), level(0.0)).x;
    float _2661 = -_2647;
    float _2663 = fma(_2657, _2661, 1.0);
    float _2665 = fma(_2639, 0.5, 0.5);
    float3 _6750 = float3(_2653, _2655, _2645);
    float4 _2667 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6750, float3(0.0), isnan(_6750)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6750, float3(0.0), isnan(_6750)), level(0.0)).xyzw;
    float _2669 = _2667.x;
    float _2671 = _2667.y;
    float _2673 = _2667.z;
    float _2675 = _2667.w;
    float2 _6766 = float2(_2663, _2665);
    float3 _2679 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6766, float2(0.0), isnan(_6766)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6766, float2(0.0), isnan(_6766)), level(0.0)).xyz;
    float _2681 = _2679.x;
    float _2683 = _2679.y;
    float _2685 = _2679.z;
    float _2687 = -_2043;
    float _2689 = fma(_2687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1845);
    float _2691 = _1731 * 3.883221149444580078125;
    float _2693 = -_2045;
    float _2695 = fma(_2693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1847);
    float _2697 = -_2067;
    float _2699 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1853);
    float _2701 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2703 = _2691 * 0.15915493667125701904296875;
    float _2705 = _1763 * _1815;
    bool _2707 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2709 = isnan(0.5);
    bool _2711 = _2707 || _2709;
    bool _2713 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2715 = _2711 || _2713;
    float _2717 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2701);
    float _2719 = _1747 * 2.0;
    float _2721 = _2703 * 6.283185482025146484375;
    float _2723 = cos(_2721);
    float _2725 = -_1547;
    float _2727 = _2725 + _1733;
    float _2729 = fma(_2699, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2717);
    float _2731 = -_2719;
    float _2733 = fma(_2705, _2731, _2705);
    float _2735 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2737 = fma(_1675, _2727, _1547);
    float _2739 = _2729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2741 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2743 = fma(_1747, 3.1415927410125732421875, _2733);
    float _2745 = _2703 * 6.283185482025146484375;
    float _2747 = sin(_2745);
    if (!_2715)
    {
        _2299 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2749 = _2299;
    float _2751 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2741);
    float _2753 = _2743 * 0.15915493667125701904296875;
    float _2755 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2737);
    out.m_63.x = _1535;
    out.m_63.y = _1519;
    out.m_63.z = _1505;
    out.m_63.w = _1521;
    float _2757 = fma(_2699, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2751);
    float _2759 = 1.0 / _2739;
    out.m_65.x = _630;
    out.m_65.y = _632;
    out.m_65.z = _636;
    out.m_65.w = _628;
    float _2761 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_67.x = _1561;
    out.m_67.y = _1541;
    out.m_67.z = _1543;
    out.m_67.w = _1483;
    float _2763 = _2761 + _2739;
    float _2765 = _2753 * 6.283185482025146484375;
    float _2767 = sin(_2765);
    out.m_69.y = _2163;
    float _2769 = -_2755;
    float _2771 = _2191 * _2769;
    out.m_71.x = _2361;
    out.m_71.y = _2357;
    out.m_71.z = _2365;
    float _2773 = _2201 * _2755;
    float _2775 = _2763 * _2759;
    float _2777 = _2775 * 0.5;
    float _2779 = exp2(_2735);
    float _2781 = _2193 * _2755;
    float _2783 = _2777;
    float _2785 = _2749;
    float _2787 = _2759;
    if (_2715)
    {
        _2301 = 1.0;
    }
    float _2789 = _2301;
    float _2791 = _2789;
    if (!_2715)
    {
        float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2795 = fma(_2777, _2749, _2793);
        _2783 = _2795;
    }
    float _2797 = _2783;
    if (!_2715)
    {
        _2785 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2799 = _2785;
    float _2801 = -_1685;
    float _2803 = fma(_2767, _2723, _2801);
    float _2805 = -_1687;
    float _2807 = fma(_2767, _2747, _2805);
    float _2809 = _2797;
    if (!_2715)
    {
        float _2811 = 1.0 / _2797;
        _2809 = _2811;
    }
    float _2813 = _2809;
    if (!_2715)
    {
        float _2815 = -_2799;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2787 = _2817;
    }
    float _2819 = _2787;
    float _2821 = fma(_1675, _2803, _1685);
    float _2823 = fma(_1675, _2807, _1687);
    float _2825 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2821);
    float _2827 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2823);
    float _2829 = _2819;
    if (!_2715)
    {
        float _2831 = 1.0 / _2819;
        _2829 = _2831;
    }
    float _2833 = _2829;
    float _2835 = -_2779;
    float _2837 = _2835 + 1.0;
    float _2839 = fma(_2195, _2825, _2771);
    float _2841 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2843 = fma(_2213, _2825, _2773);
    float _2845 = fma(_2227, _2825, _2781);
    float _2847 = fma(_2207, _2827, _2839);
    float _2849 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2841);
    float _2851 = fma(_2217, _2827, _2843);
    float _2853 = _2813;
    if (!_2715)
    {
        float _2855 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2857 = -_2799;
        float _2859 = fma(_2813, _2855, _2857);
        _2853 = _2859;
    }
    float _2861 = _2853;
    float _2863 = fma(_2235, _2827, _2845);
    float _2865 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2849);
    float _2867 = _2851 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2869 = _2851 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2871 = _2851 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2873 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2865);
    float _2875 = fma(_2847, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2867);
    float _2877 = fma(_2847, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2869);
    float _2879 = fma(_2847, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2871);
    float _2881 = _2861;
    if (!_2715)
    {
        float _2883 = _2861 * _2833;
        float _2885 = precise::clamp(_2883, 0.0, 1.0);
        _2881 = _2885;
    }
    float _2887 = _2881;
    float _2889 = fma(_2863, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2875);
    float _2891 = fma(_2863, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2877);
    float _2893 = fma(_2863, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2879);
    float _2895 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2715)
    {
        float _2897 = -_2887;
        float _2899 = _2897 + 1.0;
        _2791 = _2899;
    }
    float _2901 = _2791;
    float _2903 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2905 = _2873 + _2903;
    out.m_73.x = _2891;
    out.m_73.y = _2889;
    out.m_73.z = _2893;
    float _2907 = _2901 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2909 = _2901 > 0.0;
    bool _2911 = isnan(_2901);
    bool _2913 = _2909 || _2911;
    bool _2915 = isnan(0.0);
    bool _2917 = _2913 || _2915;
    float _2919 = _2605 + _2905;
    float _2921 = _371 * _2907;
    float _2923 = _2919 * 0.5;
    float _2925 = _2921 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2627;
    out.gl_Position.y = _2643;
    out.gl_Position.z = _2905;
    out.gl_Position.w = _2605;
    float _2927 = -_2895;
    float _2929 = _2927 + 1.0;
    out.m_75.z = _2923;
    out.m_75.w = _2605;
    out.m_47.x = _2925;
    float _2931 = _2895 * _2659;
    float _2933 = _2675 * _2931;
    float _2935 = _2675 * _2929;
    float _2937 = _2685 * _2931;
    float _2939 = fma(_2681, _2933, _2669);
    float _2941 = fma(_2683, _2933, _2671);
    float _2943 = fma(_2675, _2937, _2673);
    out.m_77.x = _2939;
    out.m_77.y = _2941;
    out.m_77.z = _2943;
    out.m_77.w = _2935;
    if (_2917)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2945 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2945;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1791 = false;
    bool _1603 = false;
    bool _656 = false;
    bool _527 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _101 = int(_99);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3002 = as_type<float>(_117);
        out.gl_Position.z = _3002;
    }
    if (!_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_49.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = _135;
    if (_131)
    {
        float _139 = float(_101);
        _111 = _139;
    }
    float _141 = _111;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    float _149 = _141;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _149;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3072 = as_type<float>(_155);
        out.gl_Position.z = _3072;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = in.m_51.x;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = in.m_53.y;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _161 * _159;
    float _183 = 0.0;
    if (!_175)
    {
        float _185 = _165 * _165;
        float _187 = _185 * 0.5;
        _183 = _187;
    }
    float _189 = _183;
    float _191 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _193 = _189;
    if (!_175)
    {
        float _195 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = in.m_49.x;
    float _201 = in.m_49.y;
    float _203 = in.m_49.z;
    float _205 = _191 * 6.283185482025146484375;
    float _207 = floor(_191);
    float _209 = _205 * 0.15915493667125701904296875;
    float _211 = _209 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = -_207;
    float _217 = _191 + _215;
    float _219 = _207;
    float _221 = _197;
    if (!_175)
    {
        _219 = _165;
    }
    float _223 = _219;
    bool _225 = !_175;
    float _227 = _223;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _165 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _165);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _257;
    }
    float _259 = _221;
    bool _261 = !_175;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _165 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _227 = _281;
    }
    float _283 = _227;
    float _285 = in.m_55.w;
    float _287 = in.m_44.x;
    float _289 = in.m_44.y;
    float _291 = in.m_44.z;
    bool _293 = _217 < 0.5;
    float _295 = float(_293);
    float _297 = -_217;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _303 = _301 != 0;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _307 = _305 != 0;
    float _309 = fma(_213, 0.5, 0.5);
    float _311 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_57.y = _163;
    bool _317 = !_303;
    int _319 = _317 ? 0 : 1;
    float _321 = -_309;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = fma(_283, _199, _311);
    bool _327 = !_307;
    int _329 = _327 ? 0 : 1;
    float _331 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _333 = !_179;
    int _335 = _333 ? 0 : 1;
    float _337 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _339 = abs(_319);
    float _341 = fma(_283, _201, _331);
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_283, _203, _337);
    int _347 = abs(_329);
    int _349 = abs(_335);
    float _351 = float(_339);
    float _353 = fma(_325, _285, _287);
    float _355 = float(_349);
    float _357 = fma(_341, _285, _289);
    float _359 = float(_347);
    float _361 = abs(_299);
    float _363 = _351 * _361;
    float _365 = fma(_345, _285, _291);
    float _367 = fma(_355, _323, _363);
    float _369 = abs(_315);
    float _371 = fma(_359, _369, _367);
    bool _373 = !_343;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_101);
        float _395 = 1.0 / _393;
        float _397 = _135 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = in.m_55.x;
    float _407 = in.m_55.y;
    float _409 = in.m_55.z;
    bool _411 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_399);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _423;
    bool _427 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_399);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _441 = 1.0 / _425;
    float _443 = -_437;
    float _445 = _443 + 1.0;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _403 * _441;
    float _455 = fma(_451, _453, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _461;
    float _465 = _439 * _157;
    float _467 = _421 * _445;
    float _469 = fma(_459, _453, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = fma(_463, _453, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _473 = -_421;
    float _475 = _473 + 1.0;
    float _477 = _455 * _467;
    float _479 = trunc(_465);
    int _481 = int(_479);
    float _483 = _469 * _467;
    float _485 = _471 * _467;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _477);
    float _489 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].z, _485);
    float _493 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].x, _487);
    float _495 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].y, _489);
    float _497 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].z, _491);
    float _499 = _493 * _405;
    float _501 = _495 * _407;
    float _503 = _497 * _409;
    int _505 = _481 << 4;
    int _507 = _505 + 1712;
    bool _509 = !_447;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_101);
        float _531 = 1.0 / _529;
        float _533 = _135 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    uint _538 = uint(int(uint(_507) >> uint(2)));
    uint _540 = uint(int(uint(int(_538)) >> uint(2)));
    int _542 = int(_538) & 3;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[int(_540)][_542];
    int _546 = int(_538) + 1;
    uint _548 = uint(int(uint(_546) >> uint(2)));
    int _550 = _546 & 3;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[int(_548)][_550];
    bool _554 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_535);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    int _572 = _507 + 8;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    uint _576 = uint(int(uint(int(_574)) >> uint(2)));
    int _578 = int(_574) & 3;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[int(_576)][_578];
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = 1.0 / _568;
    float _588 = -_564;
    float _590 = _588 + 1.0;
    float _592 = _584 * _586;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _535 + _594;
    bool _598 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _600 = isnan(_535);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = fma(_592, _596, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _612 = _608 * _590;
    float _614 = -_608;
    float _616 = _614 + 1.0;
    float _618 = _610 * _612;
    float _620 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[115].x, _618);
    float _622 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[116].x, _620);
    float _624 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _626 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _628 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _630 = _624 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _634 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _636 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _638 = !_570;
    float _654;
    if (!_638)
    {
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _642 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        float _658 = float(_101);
        float _660 = 1.0 / _658;
        float _662 = _135 * _660;
        _654 = _662;
    }
    _656 = false;
    float _664 = _654;
    int _666 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _668 = _666;
    int _670 = 0;
    int _672 = _92(_668, _670, (*spvDescriptorSet0.support_buffer));
    float _674 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _676 = int(_674);
    float _678 = fma(_135, 0.01200000010430812835693359375, _157);
    float _680 = in.m_53.z;
    float _682 = in.m_51.y;
    float _684 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _686 = int(_684);
    float _688 = float(_676);
    float _690 = floor(_678);
    float _692 = float(uint(_686));
    float _694 = 1.0 / _688;
    float _696 = 1.0 / _692;
    float _698 = _135 * _694;
    float _700 = trunc(_680);
    int _702 = int(_700);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    int _708 = as_type<int>(_696) + (-2);
    float _710 = trunc(_698);
    int _712 = int(_710);
    int _714 = ~_686;
    int _716 = _714 + 1;
    float _718 = float(uint(_712));
    float _720 = as_type<float>(_708) * _718;
    float _722 = trunc(_720);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    float _728 = fma(_690, 0.20000000298023223876953125, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _730 = precise::clamp(_728, 0.0, 1.0);
    int _732 = _716 * int(_726);
    int _734 = _732 + _712;
    float _736 = float(uint(_734));
    float _738 = as_type<float>(_708) * _736;
    float _740 = trunc(_738);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    int _746 = _672 + (-1);
    float _748 = float(_746);
    float _750 = _730 * _748;
    float _752 = _682 * 1.2345600128173828125;
    float _754 = trunc(_750);
    int _756 = int(_754);
    bool _758 = !_706;
    float _760 = _758 ? _752 : _157;
    int _762 = _756;
    int _764 = 0;
    int _766 = _93(_762, _764, (*spvDescriptorSet0.support_buffer));
    int _768 = _702;
    int _770 = 0;
    int _772 = _93(_768, _770, (*spvDescriptorSet0.support_buffer));
    float4 _775 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_766, _772)), 0).xyzw;
    float _777 = _775.x;
    float _779 = _775.y;
    float _781 = _775.z;
    float _783 = _775.w;
    int _785 = ~_686;
    int _787 = _785 + 1;
    float _789 = floor(_760);
    int _791 = int(_726) + int(_744);
    float _793 = float(_686);
    float _795 = float(_712);
    int _797 = _787 * _791;
    int _799 = _797 + _712;
    float _801 = float(_101);
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _805 = _795 >= _793;
    bool _807 = isnan(_795);
    bool _809 = _805 || _807;
    bool _811 = isnan(_793);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    bool _817 = uint(_799) >= uint(_686);
    bool _819 = _686 == 0;
    bool _821 = !_817;
    int _823 = _821 ? 0 : (-1);
    float _825 = trunc(_815);
    int _827 = int(_825);
    float _829 = -_789;
    float _831 = _760 + _829;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _835 = _833 != 0;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _839 = _837 != 0;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _843 = _841 != 0;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _847 = _845 != 0;
    int _849 = ~_791;
    int _851 = _849 + _823;
    int _853 = _851 + 1;
    float _855 = _831 * _793;
    float _857 = _135 * _793;
    float _859 = 1.0 / _801;
    int _861 = _686 * _853;
    int _863 = _861 + _712;
    int _865 = _686 + (-1);
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _869 = _867 != 0;
    bool _871 = !_819;
    int _873 = _871 ? _863 : (-1);
    int _875 = ~_827;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    float _881 = trunc(_855);
    int _883 = int(_881);
    bool _885 = !_869;
    int _887 = _885 ? 0 : 1;
    bool _889 = !_835;
    int _891 = _889 ? 0 : 1;
    int _893 = _873 * _879;
    bool _895 = !_839;
    int _897 = _895 ? 0 : 1;
    float _899 = _857 * _859;
    int _901 = _827 * _865;
    int _903 = _901 + _893;
    int _905 = abs(_897);
    int _907 = abs(_887);
    float _909 = trunc(_899);
    int _911 = int(_909);
    bool _913 = !_843;
    int _915 = _913 ? 0 : 1;
    int _917 = abs(_891);
    int _919 = _883 * _907;
    int _921 = _919 + _712;
    int _923 = abs(_915);
    int _925 = _903 * _905;
    bool _927 = !_847;
    int _929 = _927 ? 0 : 1;
    int _931 = abs(_929);
    int _933 = _911 * _917;
    int _935 = _933 + _925;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _939 = _937 != 0;
    int _941 = ~_686;
    int _943 = _941 + 1;
    int _945 = _921 * _923;
    int _947 = _945 + _935;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _951 = _949 != 0;
    float _953 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _957 = _955 != 0;
    int _959 = _883 * _931;
    int _961 = _959 + _947;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _965 = _963 != 0;
    float _967 = in.m_53.x;
    float _969 = float(uint(_921));
    float _971 = float(uint(_961));
    float _973 = _859;
    float _975 = _953;
    float _977 = _967;
    if (_939)
    {
        float _979 = in.m_51.z;
        _973 = _979;
    }
    float _981 = _973;
    int _983 = ~_686;
    int _985 = _983 + 1;
    float _987 = as_type<float>(_708) * _971;
    int _989 = ~_686;
    int _991 = _989 + 1;
    float _993 = trunc(_987);
    float _995 = precise::max(_993, 0.0);
    uint _997 = uint(_995);
    int _999 = _991 * int(_997);
    int _1001 = _999 + _961;
    float _1003 = float(uint(_1001));
    float _1005 = as_type<float>(_708) * _1003;
    float _1007 = in.m_51.w;
    float _1009 = trunc(_1005);
    float _1011 = precise::max(_1009, 0.0);
    uint _1013 = uint(_1011);
    int _1015 = int(_997) + int(_1013);
    float _1017 = -_163;
    float _1019 = _1017 + 1.0;
    bool _1021 = _1007 > 0.5;
    bool _1023 = _1021 && _965;
    int _1025 = _943 * _1015;
    int _1027 = _1025 + _961;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1033 = uint(_1027) >= uint(_686);
    float _1035 = 1.0 / _1031;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1039 = !_1033;
    int _1041 = _1039 ? 0 : (-1);
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1045 = _1043 != 0;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1049 = -_1037;
    float _1051 = fma(_953, 2.0, _1049);
    float _1053 = _682 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1055 = _682 > 0.5;
    bool _1057 = _1055 && _1045;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1059;
    float _1063 = fma(_1053, -2.0, _1047);
    float _1065 = _1023 ? _1019 : _163;
    float _1067 = -_135;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1051);
    float _1071 = _1061 * _1035;
    float _1073 = _1035;
    bool _1075 = _1023;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    bool _1079 = _1057;
    if (!_706)
    {
        float _1081 = in.m_51.z;
        _1073 = _1081;
    }
    float _1083 = _1073;
    if (_939)
    {
        bool _1085 = _981 > 0.5;
        _1075 = _1085;
    }
    bool _1087 = _1075;
    float _1089 = as_type<float>(_708) * _969;
    int _1091 = ~_1015;
    int _1093 = _1091 + _1041;
    int _1095 = _1093 + 1;
    float _1097 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1063);
    float _1099 = _1057 ? _1019 : _163;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1103 = ~_686;
    int _1105 = _1103 + 1;
    int _1107 = _686 * _1095;
    int _1109 = _1107 + _961;
    float _1111 = trunc(_1089);
    float _1113 = precise::max(_1111, 0.0);
    uint _1115 = uint(_1113);
    float _1117 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1101);
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _664 + _1119;
    bool _1123 = !_819;
    int _1125 = _1123 ? _1109 : (-1);
    float _1127 = fma(_1071, _1121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_706)
    {
        _1077 = _682;
    }
    float _1129 = _1077;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1133 = _1125 >> 31;
    float _1135 = _1129;
    if (_957)
    {
        bool _1137 = _157 > 0.5;
        _1079 = _1137;
    }
    bool _1139 = _1079;
    float _1141 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    int _1143 = _1133 & 3;
    float _1145 = _1141;
    if (_706)
    {
        _1135 = _157;
    }
    float _1147 = _1135;
    float _1149 = _803 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1151 = _1125 + _1143;
    int _1153 = _1105 * int(_1115);
    int _1155 = _1153 + _921;
    int _1157 = as_type<int>(_1149);
    if (!_957)
    {
        _975 = _967;
    }
    float _1159 = _975;
    float _1161 = fma(_1149, _1099, -0.5);
    int _1163 = _1151 >> 2;
    float _1165 = _1159;
    if (_957)
    {
        float _1167 = -_967;
        float _1169 = _1167 + 1.0;
        _1157 = as_type<int>(_1169);
    }
    int _1171 = _1157;
    float _1173 = float(uint(_1155));
    float _1175 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1141);
    int _1177 = _1163 << 4;
    int _1179 = _1177 + 512;
    float _1181 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1183 = _1083;
    if (!_706)
    {
        _1145 = _1083;
    }
    float _1185 = _1145;
    float _1187 = as_type<float>(_708) * _1173;
    float _1189 = _1185;
    if (_706)
    {
        _1189 = _682;
    }
    float _1191 = _1189;
    if (_706)
    {
        _1183 = _682;
    }
    float _1193 = _1183;
    float _1195 = -_1097;
    float _1197 = fma(_1175, _1161, _1195);
    if (_957)
    {
        float _1199 = _1139 ? as_type<float>(_1171) : _967;
        _1165 = _1199;
    }
    float _1201 = _1165;
    float _1203 = trunc(_1187);
    float _1205 = precise::max(_1203, 0.0);
    uint _1207 = uint(_1205);
    uint _1209 = uint(int(uint(_1179) >> uint(2)));
    uint _1211 = uint(int(uint(int(_1209)) >> uint(2)));
    int _1213 = int(_1209) & 3;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[int(_1211)][_1213];
    int _1217 = int(_1209) + 1;
    uint _1219 = uint(int(uint(_1217) >> uint(2)));
    int _1221 = _1217 & 3;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[int(_1219)][_1221];
    bool _1225 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1227 = isnan(_664);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    bool _1237 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1239 = isnan(_664);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = -_1235;
    float _1251 = _1249 + 1.0;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1255 = _1125 & 3;
    bool _1257 = _1255 != 0;
    float _1259 = _1247 * _1251;
    float _1261 = -_1247;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1253);
    int _1267 = _1125 & 3;
    bool _1269 = _1267 != 0;
    int _1271 = _1179 + 8;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    uint _1275 = uint(int(uint(int(_1273)) >> uint(2)));
    int _1277 = int(_1273) & 3;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[int(_1275)][_1277];
    int _1281 = int(_1273) + 1;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    int _1285 = _1281 & 3;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[int(_1283)][_1285];
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1291 = _1257 ? 0 : 1;
    float _1293 = _1127 * _1259;
    bool _1295 = uint(_1267) > 1u;
    float _1297 = -_1289;
    float _1299 = fma(_1181, 2.0, _1297);
    int _1301 = int(_1115) + int(_1207);
    int _1303 = int(_1207);
    if (_939)
    {
        float _1305 = -_967;
        float _1307 = _1305 + 1.0;
        _1303 = as_type<int>(_1307);
    }
    int _1309 = _1303;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1313 = ~_1291;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    float _1319 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1293);
    int _1321 = _1317;
    if (_939)
    {
        float _1323 = _1087 ? as_type<float>(_1309) : _967;
        _977 = _1323;
    }
    float _1325 = _977;
    int _1327 = _985 * _1301;
    int _1329 = _1327 + _921;
    bool _1331 = _1267 != 3;
    float _1333 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1311);
    bool _1335 = uint(_1267) >= 2u;
    float _1337 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    if (!_1295)
    {
        int _1339 = ~_1291;
        int _1341 = _1339 + 1;
        _1321 = _1341;
    }
    int _1343 = _1321;
    float _1345 = -_135;
    float _1347 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1299);
    bool _1349 = uint(_1329) >= uint(_686);
    int _1351 = _1335 ? 0 : 1;
    int _1353 = abs(_1343);
    bool _1355 = !_1269;
    int _1357 = _1355 ? 0 : 1;
    bool _1359 = !_1349;
    int _1361 = _1359 ? 0 : (-1);
    int _1363 = ~_1351;
    int _1365 = _1363 + 1;
    int _1367 = _1365 + 1;
    bool _1369 = _1267 != 3;
    int _1371 = _1367;
    if (_1331)
    {
        int _1373 = ~_1351;
        int _1375 = _1373 + 1;
        _1371 = _1375;
    }
    int _1377 = _1371;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1381 = abs(_1357);
    int _1383 = ~_1353;
    int _1385 = _1383 + 1;
    int _1387 = _1385 + 1;
    int _1389 = ~_1301;
    int _1391 = _1389 + _1361;
    int _1393 = _1391 + 1;
    bool _1395 = !_1369;
    int _1397 = _1395 ? 0 : (-1);
    int _1399 = _1387 * as_type<int>(_1223);
    int _1401 = abs(_1377);
    int _1403 = _686 * _1393;
    int _1405 = _1403 + _921;
    int _1407 = ~_1381;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    bool _1413 = !_951;
    int _1415 = _1413 ? 0 : 1;
    int _1417 = abs(_1397);
    int _1419 = _1411 * as_type<int>(_1215);
    int _1421 = _1419 + _1399;
    int _1423 = abs(_1415);
    int _1425 = ~_1401;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    int _1431 = _1429 * as_type<int>(_1279);
    int _1433 = _1431 + _1421;
    float _1435 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1437 = ~_1417;
    int _1439 = _1437 + 1;
    int _1441 = _1439 + 1;
    float _1443 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1445 = ~_1423;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    float _1451 = fma(_1435, _1201, -0.5);
    float _1453 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _1455 = _1441 * as_type<int>(_1287);
    int _1457 = _1455 + _1433;
    bool _1459 = !_819;
    int _1461 = _1459 ? _1405 : (-1);
    float _1463 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1265);
    int _1465 = _1457 * _1449;
    float _1467 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1319);
    float _1469 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1333);
    float _1471 = fma(_1463, _1337, _1347);
    int _1473 = _1461 * _1423;
    int _1475 = _1473 + _1465;
    uint _1477 = as_type<uint>(half2(float2(_783, 0.0)));
    float _1479 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1117);
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1483 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _1485 = extract_bits(_1477, 0u, 8u);
    int _1487 = int(_1485) & 255;
    uint _1489 = extract_bits(_1477, 8u, 8u);
    int _1491 = int(_1489) & 255;
    int _1493 = _1491 << 8;
    int _1495 = _1487 | _1493;
    float _1497 = fma(_1479, _1451, _1069);
    float _1499 = float(_1475);
    float _1501 = fma(_1443, -2.0, _1481);
    bool _1503 = _1495 >= 32768;
    float _1505 = _1471 + 0.5;
    int _1507 = _1495 + (-1024);
    out.m_59.y = _1499;
    int _1509 = _756 + 1;
    float _1511 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1501);
    int _1513 = min(_746, _1509);
    float _1515 = -_1511;
    float _1517 = fma(_1469, _1453, _1515);
    float _1519 = _1197 + 0.5;
    float _1521 = _1517 + 0.5;
    int _1523 = _1507;
    if (_1503)
    {
        int _1525 = ~_1495;
        int _1527 = _1525 + 33792;
        int _1529 = _1527 + 1;
        _1523 = _1529;
    }
    int _1531 = _1523;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1535 = _1497 + 0.5;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1539 = _1531 + 30719;
    float _1541 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1543 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = float(_1539);
    float _1547 = fma(_1545, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1551 = abs(_1547);
    float _1553 = -_1551;
    float _1555 = _1553 + 1.0;
    float _1557 = abs(_1547);
    float _1559 = fma(_1557, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1561 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1563 = _1547 < 0.0;
    float _1565 = float(_1563);
    int _1567 = as_type<int>(_1555) + (-218103808);
    float _1569 = abs(_1547);
    float _1571 = fma(_1569, _1559, -0.212114393711090087890625);
    bool _1573 = uint(_1567) >= 1920991232u;
    float _1575 = abs(_1547);
    float _1577 = fma(_1575, _1571, 1.570728778839111328125);
    bool _1579 = !_1573;
    float _1601;
    if (!_1579)
    {
        int _1581 = as_type<int>(_1555);
        int _1583 = as_type<int>(_1471);
        int _1585 = 7664;
        int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].y);
        int _1589;
        int _1591;
        int _1593;
        int _1595;
        int _1597;
        int _1599;
        _90(_1581, _1583, _1585, _1587, _1589, _1591, _1593, _1595, _1597, _1599, out.gl_Position, out.gl_PointSize);
        _1601 = as_type<float>(_1597);
        _1603 = true;
    }
    else
    {
        float _1605 = rsqrt(_1555);
        float _1607 = _1555 * _1605;
        float _1609 = _1605 * 0.5;
        float _1611 = -_1607;
        float _1613 = 0.0 + _1611;
        float _1615 = fma(_1609, _1613, 0.5);
        float _1617 = fma(_1607, _1615, _1607);
        float _1619 = -_1617;
        float _1621 = 0.0 + _1619;
        float _1623 = fma(_1617, _1621, _1555);
        float _1625 = fma(_1609, _1623, _1617);
        _1601 = _1625;
    }
    _1603 = false;
    float _1627 = _1601;
    int _1629 = _1513;
    int _1631 = 0;
    int _1633 = _93(_1629, _1631, (*spvDescriptorSet0.support_buffer));
    int _1635 = _702;
    int _1637 = 0;
    int _1639 = _93(_1635, _1637, (*spvDescriptorSet0.support_buffer));
    float4 _1641 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1633, _1639)), 0).xyzw;
    float _1643 = _1641.x;
    float _1645 = _1641.y;
    float _1647 = _1641.z;
    float _1649 = _1641.w;
    float _1651 = floor(_750);
    float _1653 = _1577 * _1627;
    float _1655 = _1565 * 2.0;
    float _1657 = _1545 * 3.883221149444580078125;
    float _1659 = -_1655;
    float _1661 = fma(_1653, _1659, _1653);
    float _1663 = _1657 * 0.15915493667125701904296875;
    float _1665 = fma(_1565, 3.1415927410125732421875, _1661);
    float _1667 = _1663 * 6.283185482025146484375;
    float _1669 = cos(_1667);
    float _1671 = _1665 * 0.15915493667125701904296875;
    float _1673 = -_1651;
    float _1675 = _750 + _1673;
    float _1677 = _1671 * 6.283185482025146484375;
    float _1679 = sin(_1677);
    float _1681 = _1663 * 6.283185482025146484375;
    float _1683 = sin(_1681);
    float _1685 = _1679 * _1669;
    float _1687 = _1679 * _1683;
    uint _1689 = as_type<uint>(half2(float2(_1649, 0.0)));
    float _1691 = -_777;
    float _1693 = _1691 + _1643;
    float _1695 = -_781;
    float _1697 = _1695 + _1647;
    uint _1699 = extract_bits(_1689, 0u, 8u);
    int _1701 = int(_1699) & 255;
    uint _1703 = extract_bits(_1689, 8u, 8u);
    int _1705 = int(_1703) & 255;
    int _1707 = _1705 << 8;
    int _1709 = _1701 | _1707;
    float _1711 = fma(_1675, _1693, _777);
    float _1713 = fma(_1675, _1697, _781);
    bool _1715 = _1709 >= 32768;
    int _1717 = _1709 + (-1024);
    int _1719 = _1717;
    if (_1715)
    {
        int _1721 = ~_1709;
        int _1723 = _1721 + 33792;
        int _1725 = _1723 + 1;
        _1719 = _1725;
    }
    int _1727 = _1719;
    int _1729 = _1727 + 30719;
    float _1731 = float(_1729);
    float _1733 = fma(_1731, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1735 = abs(_1733);
    float _1737 = -_1735;
    float _1739 = _1737 + 1.0;
    float _1741 = abs(_1733);
    float _1743 = fma(_1741, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1745 = _1733 < 0.0;
    float _1747 = float(_1745);
    int _1749 = as_type<int>(_1739) + (-218103808);
    float _1751 = abs(_1733);
    float _1753 = fma(_1751, _1743, -0.212114393711090087890625);
    bool _1755 = uint(_1749) >= 1920991232u;
    float _1757 = -_779;
    float _1759 = _1757 + _1645;
    float _1761 = abs(_1733);
    float _1763 = fma(_1761, _1753, 1.570728778839111328125);
    float _1765 = fma(_1675, _1759, _779);
    bool _1767 = !_1755;
    float _1789;
    if (!_1767)
    {
        int _1769 = as_type<int>(_1739);
        int _1771 = as_type<int>(_1645);
        int _1773 = 8560;
        int _1775 = as_type<int>(_1627);
        int _1777;
        int _1779;
        int _1781;
        int _1783;
        int _1785;
        int _1787;
        _90(_1769, _1771, _1773, _1775, _1777, _1779, _1781, _1783, _1785, _1787, out.gl_Position, out.gl_PointSize);
        _1789 = as_type<float>(_1785);
        _1791 = true;
    }
    else
    {
        float _1793 = rsqrt(_1739);
        float _1795 = _1739 * _1793;
        float _1797 = _1793 * 0.5;
        float _1799 = -_1795;
        float _1801 = 0.0 + _1799;
        float _1803 = fma(_1797, _1801, 0.5);
        float _1805 = fma(_1795, _1803, _1795);
        float _1807 = -_1805;
        float _1809 = 0.0 + _1807;
        float _1811 = fma(_1805, _1809, _1739);
        float _1813 = fma(_1797, _1811, _1805);
        _1789 = _1813;
    }
    _1791 = false;
    float _1815 = _1789;
    float _1817 = in.m_51.x;
    float _1819 = in.m_51.y;
    float _1821 = in.m_51.z;
    float _1823 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1825 = log2(_1823);
    float _1827 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1829 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1831 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1833 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1827);
    float _1835 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1829);
    float _1837 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1831);
    float _1839 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1833);
    float _1841 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1835);
    float _1843 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1837);
    float _1845 = _1839 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1847 = _1841 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1849 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1851 = _1825 * _135;
    float _1853 = _1843 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1857 = _1847 + _1855;
    float _1859 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1861 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1863 = exp2(_1851);
    float _1865 = _1817 * 2.0;
    float _1867 = _1821 * 2.0;
    float _1869 = _1819 * 2.0;
    float _1871 = floor(_1865);
    float _1873 = floor(_1867);
    float _1875 = floor(_1869);
    bool _1877 = _1871 > 0.0;
    bool _1879 = _1871 >= 0.0;
    bool _1881 = isnan(_1871);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan(0.0);
    bool _1887 = _1883 || _1885;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1891 = _1845 + _1889;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1895 = _1893 != 0;
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1899 = _1897 != 0;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1903 = _1901 != 0;
    float _1905 = _1891 * _1891;
    bool _1907 = _1873 >= 0.0;
    bool _1909 = isnan(_1873);
    bool _1911 = _1907 || _1909;
    bool _1913 = isnan(0.0);
    bool _1915 = _1911 || _1913;
    float _1917 = _1819 + _1821;
    int _1919 = _1887 ? 0 : 1;
    float _1921 = fma(_1857, _1857, _1905);
    int _1923 = _1915 ? 0 : 1;
    float _1925 = _1917 + (-1.0);
    bool _1927 = _1873 > 0.0;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1931 = _1853 + _1929;
    bool _1933 = _1875 > 0.0;
    bool _1935 = _1875 >= 0.0;
    bool _1937 = isnan(_1875);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan(0.0);
    bool _1943 = _1939 || _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1947 = 1.0 + _1945;
    int _1949 = ~_1919;
    int _1951 = _1949 + 1;
    int _1953 = _1951 + 1;
    float _1955 = fma(_1931, _1931, _1921);
    int _1957 = _1953;
    if (!_1877)
    {
        int _1959 = ~_1919;
        int _1961 = _1959 + 1;
        _1957 = _1961;
    }
    int _1963 = _1957;
    float _1965 = in.m_61.x;
    float _1967 = in.m_61.y;
    float _1969 = in.m_61.z;
    float _1971 = 1.0 / _1947;
    bool _1973 = !_1899;
    int _1975 = _1973 ? 0 : 1;
    bool _1977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1979 = isnan(1.0);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1985 = _1981 || _1983;
    int _1987 = abs(_1975);
    float _1989 = -_1863;
    float _1991 = _1989 + 1.0;
    bool _1993 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2001 = _1997 || _1999;
    float _2003 = rsqrt(_1955);
    float _2005 = float(_1987);
    float _2007 = _2001 ? _1991 : 0.0;
    float _2009 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2011 = float(_1963);
    int _2013 = ~_1923;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    int _2019 = _2017;
    if (_1985)
    {
        float _2021 = _2007 * _1971;
        _137 = _2021;
    }
    float _2023 = _137;
    bool _2025 = !_1895;
    int _2027 = _2025 ? 0 : 1;
    float _2029 = _2005 * _2011;
    if (!_1927)
    {
        int _2031 = ~_1923;
        int _2033 = _2031 + 1;
        _2019 = _2033;
    }
    int _2035 = _2019;
    int _2037 = abs(_2027);
    float _2039 = _2029 * (-2.0);
    int _2041 = _1943 ? 0 : 1;
    float _2043 = _1891 * _2003;
    float _2045 = _1857 * _2003;
    float _2047 = fma(_2009, _2039, _2009);
    float _2049 = fma(_2039, _1967, _1967);
    float _2051 = -_2043;
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1891);
    float _2055 = -_2045;
    float _2057 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1857);
    float _2059 = _1819 + (-0.5);
    float _2061 = float(_2037);
    float _2063 = _2053 * _2053;
    float _2065 = float(_2035);
    float _2067 = _1931 * _2003;
    float _2069 = fma(_2059, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2049);
    float _2071 = fma(_2057, _2057, _2063);
    bool _2073 = !_1903;
    int _2075 = _2073 ? 0 : 1;
    float _2077 = _2061 * _2065;
    int _2079 = ~_2041;
    int _2081 = _2079 + 1;
    int _2083 = _2081 + 1;
    float _2085 = -_2067;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1931);
    int _2089 = _2083;
    if (!_1933)
    {
        int _2091 = ~_2041;
        int _2093 = _2091 + 1;
        _2089 = _2093;
    }
    int _2095 = _2089;
    float _2097 = _1819 + _1817;
    int _2099 = abs(_2075);
    float _2101 = _1817 + _1821;
    float _2103 = float(_2095);
    float _2105 = fma(_2087, _2087, _2071);
    float _2107 = float(_2099);
    float _2109 = _2101 + (-1.0);
    float _2111 = _2097 + (-1.0);
    float _2113 = fma(_2047, _2023, _2069);
    float _2115 = _2107 * _2103;
    float _2117 = fma(_2111, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2119 = _2077 * (-2.0);
    float _2121 = _2115 * (-2.0);
    float _2123 = _2113 * 0.15915493667125701904296875;
    float _2125 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2127 = fma(_2119, _1965, _1965);
    float _2129 = fma(_2117, _2119, _2117);
    float _2131 = _1817 + (-0.5);
    float _2133 = _1821 + (-0.5);
    float _2135 = fma(_2121, _1969, _1969);
    float _2137 = fma(_2125, _2121, _2125);
    float _2139 = fma(_2131, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2127);
    float _2141 = sqrt(_2105);
    float _2143 = fma(_2133, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2135);
    float _2145 = fma(_2129, _2023, _2139);
    float _2147 = fma(_2137, _2023, _2143);
    float _2149 = _2145 * 0.15915493667125701904296875;
    float _2151 = _2123 * 6.283185482025146484375;
    float _2153 = sin(_2151);
    float _2155 = _2147 * 0.15915493667125701904296875;
    float _2157 = _2123 * 6.283185482025146484375;
    float _2159 = cos(_2157);
    float _2161 = _2003 * _2141;
    float _2163 = _1849 * _2161;
    float _2165 = _1859 * _2161;
    float _2167 = _1861 * _2161;
    float _2169 = _2149 * 6.283185482025146484375;
    float _2171 = sin(_2169);
    float _2173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1713);
    float _2175 = _2167 * _2173;
    float _2177 = _2155 * 6.283185482025146484375;
    float _2179 = cos(_2177);
    float _2181 = _2149 * 6.283185482025146484375;
    float _2183 = cos(_2181);
    float _2185 = _2171 * _2153;
    float _2187 = _2171 * _2159;
    float _2189 = _2155 * 6.283185482025146484375;
    float _2191 = sin(_2189);
    float _2193 = _2171 * _2179;
    float _2195 = _2159 * _2179;
    float _2197 = _2183 * _2159;
    float _2199 = _2183 * _2153;
    float _2201 = _2183 * _2179;
    float _2203 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1765);
    float _2205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1711);
    float _2207 = _2153 * _2179;
    float _2209 = _2163 * _2203;
    float _2211 = _2165 * _2205;
    float _2213 = fma(_2191, _2197, _2185);
    float _2215 = -_2187;
    float _2217 = fma(_2191, _2199, _2215);
    float _2219 = _2201 * _2209;
    float _2221 = -_2209;
    float _2223 = _2191 * _2221;
    float _2225 = -_2199;
    float _2227 = fma(_2191, _2187, _2225);
    float _2229 = _2193 * _2209;
    float _2231 = fma(_2213, _2211, _2219);
    float _2233 = fma(_2195, _2211, _2223);
    float _2235 = fma(_2191, _2185, _2197);
    float _2237 = fma(_2227, _2211, _2229);
    float _2239 = fma(_2217, _2175, _2231);
    float _2241 = fma(_2207, _2175, _2233);
    float _2243 = fma(_2235, _2175, _2237);
    float _2245 = _2239 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2247 = _2239 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2249 = _2239 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2251 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2245);
    float _2253 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2247);
    float _2255 = _690 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2257 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2249);
    float _2259 = fma(_2243, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2251);
    float _2261 = fma(_2243, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2253);
    float _2263 = fma(_2243, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2257);
    float _2265 = _1853 + _2259;
    float _2267 = _1847 + _2261;
    float _2269 = _1845 + _2263;
    float _2271 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2265);
    float _2273 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2267);
    float _2275 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2269);
    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2279 = _2271 + _2277;
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2283 = _2273 + _2281;
    float _2285 = _2279 * _2279;
    float _2287 = fma(_2283, _2283, _2285);
    float _2289 = sqrt(_2287);
    bool _2291 = _2289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2293 = _2249;
    float _2295 = _2269;
    float _2297 = _2275;
    float _2299 = 0.5;
    float _2301 = _2201;
    if (!_2291)
    {
        _2293 = _2273;
    }
    float _2303 = _2293;
    float _2305 = _2303;
    if (!_2291)
    {
        _2295 = _2271;
    }
    float _2307 = _2295;
    bool _2309 = !_2291;
    float _2311 = _2307;
    if (!_2309)
    {
        float _2313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2317 = _2289 + _2315;
        float _2319 = rsqrt(_2287);
        float _2321 = _2317 * _2313;
        float _2323 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2325 = _2321 * 0.15915493667125701904296875;
        float _2327 = _2325 * 6.283185482025146484375;
        float _2329 = cos(_2327);
        float _2331 = _2325 * 6.283185482025146484375;
        float _2333 = sin(_2331);
        float _2335 = _2329 + (-1.0);
        float _2337 = fma(_2333, _2323, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2341 = _2319 * _2337;
        float _2343 = fma(_2275, _2329, _2339);
        float _2345 = fma(_2283, _2341, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2347 = fma(_2279, _2341, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2297 = _2343;
        _2305 = _2345;
        _2311 = _2347;
    }
    float _2349 = _2297;
    float _2351 = _2305;
    float _2353 = _2311;
    float _2355 = -_2043;
    float _2357 = fma(_2355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2349);
    float _2359 = -_2045;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2351);
    float _2363 = -_2067;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2353);
    float _2367 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2369 = _2357 + _2367;
    float _2371 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2373 = _2361 + _2371;
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2377 = _2365 + _2375;
    float _2379 = _2369 * _2369;
    float _2381 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2383 = fma(_2373, _2373, _2379);
    float _2385 = fma(_2377, _2377, _2383);
    float _2387 = rsqrt(_2385);
    float _2389 = sqrt(_2385);
    float _2391 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2393 = _2373 * _2391;
    float _2395 = _2377 * _2391;
    float _2397 = _2393 * _2393;
    float _2399 = _2395 * _2395;
    float _2401 = _2397 + _2399;
    float _2403 = sqrt(_2401);
    bool _2405 = _2403 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2409 = _2403 + _2407;
    float _2411 = _2063;
    float _2413 = _2401;
    float _2415 = _2409;
    float _2417 = _2391;
    float _2419 = _2369;
    float _2421 = _2393;
    float _2423 = _2395;
    float _2425 = _2397;
    float _2427 = _2399;
    if (_2405)
    {
        float _2429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2411 = _2429;
    }
    float _2431 = _2411;
    if (_2405)
    {
        float _2433 = rsqrt(_2401);
        _2413 = _2433;
    }
    float _2435 = _2413;
    if (_2405)
    {
        float _2437 = _2409 * _2431;
        _2415 = _2437;
    }
    float _2439 = _2415;
    float _2441 = precise::max(0.0, _2381);
    float _2443 = 0.0;
    float _2445 = _2441;
    if (_2405)
    {
        float _2447 = _2439 * 0.15915493667125701904296875;
        _2443 = _2447;
    }
    float _2449 = _2443;
    float _2451 = -_2391;
    float _2453 = -_2441;
    float _2455 = fma(_2369, _2451, _2453);
    float _2457 = as_type<float>(_2041);
    float _2459 = _2455;
    if (_2405)
    {
        float _2461 = _2449 * 6.283185482025146484375;
        float _2463 = sin(_2461);
        _2457 = _2463;
    }
    float _2465 = _2457;
    if (_2405)
    {
        float _2467 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2417 = _2467;
    }
    float _2469 = _2417;
    float _2471 = _2439;
    float _2473 = _2469;
    if (_2405)
    {
        float _2475 = _2449 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        _2471 = _2477;
    }
    float _2479 = _2471;
    float _2481 = _2465;
    if (_2405)
    {
        float _2483 = fma(_2465, _2469, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2481 = _2483;
    }
    float _2485 = _2481;
    if (_2405)
    {
        float _2487 = _2435 * _2485;
        _2445 = _2487;
    }
    float _2489 = _2445;
    float _2491 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2405)
    {
        float _2493 = _2479 + (-1.0);
        _2419 = _2493;
    }
    float _2495 = _2419;
    if (_2405)
    {
        float _2497 = _2393 * _2489;
        _2421 = _2497;
    }
    float _2499 = _2421;
    if (_2405)
    {
        float _2501 = _2395 * _2489;
        _2423 = _2501;
    }
    float _2503 = _2423;
    float _2505 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2491);
    if (_2405)
    {
        float _2507 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2473 = _2507;
    }
    float _2509 = _2473;
    if (_2405)
    {
        float _2511 = _2499 * _2499;
        _2425 = _2511;
    }
    float _2513 = _2425;
    if (_2405)
    {
        float _2515 = _2503 * _2503;
        _2427 = _2515;
    }
    float _2517 = _2427;
    if (_2405)
    {
        float _2519 = fma(_2455, _2479, _2509);
        _2459 = _2519;
    }
    float _2521 = _2459;
    float _2523 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2525 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2505);
    float _2527 = fma(_2521, _2521, _2513);
    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2531 = fma(_2389, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2529);
    float _2533 = precise::clamp(_2531, 0.0, 1.0);
    float _2535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2537 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2539 = _2527 + _2517;
    float _2541 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2523);
    float _2543 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2545 = -_2533;
    float _2547 = _2545 + 1.0;
    float _2549 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2537);
    float _2551 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2541);
    float _2553 = rsqrt(_2539);
    float _2555 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2543);
    float _2557 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2549);
    float _2559 = _2551 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2561 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2555);
    float _2563 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2565 = abs(_2547);
    float _2567 = log2(_2565);
    float _2569 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2571 = -_2563;
    float _2573 = fma(_2571, _2535, 1.0);
    float _2575 = _2557 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2577 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2579 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2581 = _2553 * _2499;
    float _2583 = _2553 * _2521;
    float _2585 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2587 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2577);
    float _2589 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2591 = _2553 * _2503;
    float _2593 = log2(_2573);
    float _2595 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2587);
    float _2597 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2599 = -_2589;
    float _2601 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2599);
    float _2603 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2579);
    float _2605 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2595);
    float _2607 = _2583 + 1.0;
    float _2609 = exp2(_2597);
    float _2611 = -_2591;
    float _2613 = fma(_2611, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2601);
    float _2615 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2617 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2603);
    float _2619 = fma(_2613, -0.5, 0.5);
    float _2621 = fma(_2613, 0.5, 0.5);
    float _2623 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2615);
    float _2625 = 1.0 / _2605;
    float _2627 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2617);
    float _2629 = fma(_2621, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2631 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2623);
    float _2633 = _2593 * 0.693147182464599609375;
    float _2635 = sqrt(_2619);
    float _2637 = -_2583;
    float _2639 = fma(_2609, _2607, _2637);
    float _2641 = fma(_2621, _2629, -0.212114393711090087890625);
    float _2643 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2631);
    float _2645 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2647 = fma(_2621, _2641, 1.570728778839111328125);
    float _2649 = _2627 * _2625;
    float _2651 = _2643 * _2625;
    float _2653 = fma(_2649, 0.5, 0.5);
    float _2655 = fma(_2651, -0.5, 0.5);
    float _2657 = _2635 * 0.636619746685028076171875;
    float3 _6732 = float3(_2653, _2655, _2645);
    float _2659 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6732, float3(0.0), isnan(_6732)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6732, float3(0.0), isnan(_6732)), level(0.0)).x;
    float _2661 = -_2647;
    float _2663 = fma(_2657, _2661, 1.0);
    float _2665 = fma(_2639, 0.5, 0.5);
    float3 _6750 = float3(_2653, _2655, _2645);
    float4 _2667 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6750, float3(0.0), isnan(_6750)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6750, float3(0.0), isnan(_6750)), level(0.0)).xyzw;
    float _2669 = _2667.x;
    float _2671 = _2667.y;
    float _2673 = _2667.z;
    float _2675 = _2667.w;
    float2 _6766 = float2(_2663, _2665);
    float3 _2679 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6766, float2(0.0), isnan(_6766)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6766, float2(0.0), isnan(_6766)), level(0.0)).xyz;
    float _2681 = _2679.x;
    float _2683 = _2679.y;
    float _2685 = _2679.z;
    float _2687 = -_2043;
    float _2689 = fma(_2687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1845);
    float _2691 = _1731 * 3.883221149444580078125;
    float _2693 = -_2045;
    float _2695 = fma(_2693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1847);
    float _2697 = -_2067;
    float _2699 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1853);
    float _2701 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2703 = _2691 * 0.15915493667125701904296875;
    float _2705 = _1763 * _1815;
    bool _2707 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2709 = isnan(0.5);
    bool _2711 = _2707 || _2709;
    bool _2713 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2715 = _2711 || _2713;
    float _2717 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2701);
    float _2719 = _1747 * 2.0;
    float _2721 = _2703 * 6.283185482025146484375;
    float _2723 = cos(_2721);
    float _2725 = -_1547;
    float _2727 = _2725 + _1733;
    float _2729 = fma(_2699, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2717);
    float _2731 = -_2719;
    float _2733 = fma(_2705, _2731, _2705);
    float _2735 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2737 = fma(_1675, _2727, _1547);
    float _2739 = _2729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2741 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2743 = fma(_1747, 3.1415927410125732421875, _2733);
    float _2745 = _2703 * 6.283185482025146484375;
    float _2747 = sin(_2745);
    if (!_2715)
    {
        _2299 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2749 = _2299;
    float _2751 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2741);
    float _2753 = _2743 * 0.15915493667125701904296875;
    float _2755 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2737);
    out.m_63.x = _1535;
    out.m_63.y = _1519;
    out.m_63.z = _1505;
    out.m_63.w = _1521;
    float _2757 = fma(_2699, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2751);
    float _2759 = 1.0 / _2739;
    out.m_65.x = _630;
    out.m_65.y = _632;
    out.m_65.z = _636;
    out.m_65.w = _628;
    float _2761 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_67.x = _1561;
    out.m_67.y = _1541;
    out.m_67.z = _1543;
    out.m_67.w = _1483;
    float _2763 = _2761 + _2739;
    float _2765 = _2753 * 6.283185482025146484375;
    float _2767 = sin(_2765);
    out.m_69.y = _2163;
    float _2769 = -_2755;
    float _2771 = _2191 * _2769;
    out.m_71.x = _2361;
    out.m_71.y = _2357;
    out.m_71.z = _2365;
    float _2773 = _2201 * _2755;
    float _2775 = _2763 * _2759;
    float _2777 = _2775 * 0.5;
    float _2779 = exp2(_2735);
    float _2781 = _2193 * _2755;
    float _2783 = _2777;
    float _2785 = _2749;
    float _2787 = _2759;
    if (_2715)
    {
        _2301 = 1.0;
    }
    float _2789 = _2301;
    float _2791 = _2789;
    if (!_2715)
    {
        float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2795 = fma(_2777, _2749, _2793);
        _2783 = _2795;
    }
    float _2797 = _2783;
    if (!_2715)
    {
        _2785 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2799 = _2785;
    float _2801 = -_1685;
    float _2803 = fma(_2767, _2723, _2801);
    float _2805 = -_1687;
    float _2807 = fma(_2767, _2747, _2805);
    float _2809 = _2797;
    if (!_2715)
    {
        float _2811 = 1.0 / _2797;
        _2809 = _2811;
    }
    float _2813 = _2809;
    if (!_2715)
    {
        float _2815 = -_2799;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2787 = _2817;
    }
    float _2819 = _2787;
    float _2821 = fma(_1675, _2803, _1685);
    float _2823 = fma(_1675, _2807, _1687);
    float _2825 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2821);
    float _2827 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2823);
    float _2829 = _2819;
    if (!_2715)
    {
        float _2831 = 1.0 / _2819;
        _2829 = _2831;
    }
    float _2833 = _2829;
    float _2835 = -_2779;
    float _2837 = _2835 + 1.0;
    float _2839 = fma(_2195, _2825, _2771);
    float _2841 = _2569 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2843 = fma(_2213, _2825, _2773);
    float _2845 = fma(_2227, _2825, _2781);
    float _2847 = fma(_2207, _2827, _2839);
    float _2849 = fma(_2575, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2841);
    float _2851 = fma(_2217, _2827, _2843);
    float _2853 = _2813;
    if (!_2715)
    {
        float _2855 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2857 = -_2799;
        float _2859 = fma(_2813, _2855, _2857);
        _2853 = _2859;
    }
    float _2861 = _2853;
    float _2863 = fma(_2235, _2827, _2845);
    float _2865 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2849);
    float _2867 = _2851 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2869 = _2851 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2871 = _2851 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2873 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2865);
    float _2875 = fma(_2847, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2867);
    float _2877 = fma(_2847, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2869);
    float _2879 = fma(_2847, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2871);
    float _2881 = _2861;
    if (!_2715)
    {
        float _2883 = _2861 * _2833;
        float _2885 = precise::clamp(_2883, 0.0, 1.0);
        _2881 = _2885;
    }
    float _2887 = _2881;
    float _2889 = fma(_2863, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2875);
    float _2891 = fma(_2863, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2877);
    float _2893 = fma(_2863, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2879);
    float _2895 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2715)
    {
        float _2897 = -_2887;
        float _2899 = _2897 + 1.0;
        _2791 = _2899;
    }
    float _2901 = _2791;
    float _2903 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2905 = _2873 + _2903;
    out.m_73.x = _2891;
    out.m_73.y = _2889;
    out.m_73.z = _2893;
    float _2907 = _2901 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2909 = _2901 > 0.0;
    bool _2911 = isnan(_2901);
    bool _2913 = _2909 || _2911;
    bool _2915 = isnan(0.0);
    bool _2917 = _2913 || _2915;
    float _2919 = _2605 + _2905;
    float _2921 = _371 * _2907;
    float _2923 = _2919 * 0.5;
    float _2925 = _2921 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2627;
    out.gl_Position.y = _2643;
    out.gl_Position.z = _2905;
    out.gl_Position.w = _2605;
    float _2927 = -_2895;
    float _2929 = _2927 + 1.0;
    out.m_75.z = _2923;
    out.m_75.w = _2605;
    out.m_47.x = _2925;
    float _2931 = _2895 * _2659;
    float _2933 = _2675 * _2931;
    float _2935 = _2675 * _2929;
    float _2937 = _2685 * _2931;
    float _2939 = fma(_2681, _2933, _2669);
    float _2941 = fma(_2683, _2933, _2671);
    float _2943 = fma(_2675, _2937, _2673);
    out.m_77.x = _2939;
    out.m_77.y = _2941;
    out.m_77.z = _2943;
    out.m_77.w = _2935;
    if (_2917)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2945 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2945;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

