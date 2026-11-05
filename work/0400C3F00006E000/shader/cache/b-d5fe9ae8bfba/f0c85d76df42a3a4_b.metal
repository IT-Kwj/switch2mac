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
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_57 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _96(thread const int& _10493, thread const int& _10494, constant _10& support_buffer)
{
    float _10497 = as_type<float>(support_buffer._m4);
    int _10499 = _10494 + as_type<int>(_10497);
    int _10501 = 1 + _10499;
    float _10503 = support_buffer._m5[_10501].x;
    float _10505 = abs(_10503);
    bool _10507 = _10505 == 1.0;
    if (_10507)
    {
        return _10493;
    }
    float _10509 = float(_10493);
    float _10511 = _10509 / _10505;
    int _10513 = int(_10511);
    return _10513;
}

static inline __attribute__((always_inline))
int _97(thread const int& _10543, thread const int& _10544, constant _10& support_buffer)
{
    float _10547 = as_type<float>(support_buffer._m4);
    int _10549 = _10544 + as_type<int>(_10547);
    int _10551 = 1 + _10549;
    float _10553 = support_buffer._m5[_10551].x;
    bool _10555 = _10553 == 1.0;
    if (_10555)
    {
        return _10543;
    }
    float _10557 = float(_10543);
    float _10559 = _10557 * _10553;
    int _10561 = int(_10559);
    return _10561;
}

static inline __attribute__((always_inline))
void _94(thread const int& _10188, thread const int& _10189, thread const int& _10190, thread const int& _10191, thread int& _10192, thread int& _10193, thread int& _10194, thread int& _10195, thread int& _10196, thread int& _10197, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _10200 = _10189;
    int _10202 = _10190;
    float _10204 = 0.0 + as_type<float>(_10188);
    bool _10206 = _10204 != 0.0;
    bool _10208 = isnan(_10204);
    bool _10210 = _10206 || _10208;
    bool _10212 = isnan(0.0);
    bool _10214 = _10210 || _10212;
    int _10216 = as_type<int>(_10204);
    int _10218 = _10214 ? (-1) : 0;
    if (!_10214)
    {
        float _10220 = as_type<float>(_10188) * 1.0;
        _10200 = as_type<int>(_10220);
    }
    int _10222 = _10200;
    bool _10224 = !_10214;
    int _10226 = _10222;
    int _10228 = _10222;
    if (!_10224)
    {
        bool _10230 = _10204 >= 0.0;
        bool _10232 = isnan(_10204);
        bool _10234 = _10230 || _10232;
        bool _10236 = isnan(0.0);
        bool _10238 = _10234 || _10236;
        _10218 = _10238 ? (-1) : 0;
        if (!_10238)
        {
            _10226 = 2147483647;
        }
        int _10240 = _10226;
        bool _10242 = !_10238;
        int _10244 = _10240;
        _10228 = _10240;
        if (!_10242)
        {
            float _10246 = abs(as_type<float>(_10188));
            float _10248 = 0.0 + _10246;
            bool _10250 = _10248 > as_type<float>(0x7f800000u /* inf */);
            bool _10252 = isnan(_10248);
            bool _10254 = _10250 || _10252;
            bool _10256 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _10258 = _10254 || _10256;
            _10216 = as_type<int>(_10248);
            _10218 = _10258 ? (-1) : 0;
            if (_10258)
            {
                float _10260 = as_type<float>(_10188) + 1.0;
                _10244 = as_type<int>(_10260);
            }
            int _10262 = _10244;
            int _10264 = _10262;
            _10228 = _10262;
            if (!_10258)
            {
                bool _10266 = _10248 != as_type<float>(0x7f800000u /* inf */);
                bool _10268 = isnan(_10248);
                bool _10270 = _10266 || _10268;
                bool _10272 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _10274 = _10270 || _10272;
                _10218 = _10274 ? (-1) : 0;
                if (!_10274)
                {
                    _10264 = _10188;
                }
                int _10276 = _10264;
                bool _10278 = !_10274;
                _10228 = _10276;
                if (!_10278)
                {
                    float _10280 = as_type<float>(_10188) * 18446744073709551616.0;
                    float _10282 = rsqrt(_10280);
                    float _10284 = _10280 * _10282;
                    float _10286 = _10282 * 0.5;
                    float _10288 = -_10284;
                    float _10290 = 0.0 + _10288;
                    float _10292 = fma(_10286, _10290, 0.5);
                    float _10294 = fma(_10284, _10292, _10284);
                    float _10296 = -_10294;
                    float _10298 = 0.0 + _10296;
                    float _10300 = fma(_10294, _10298, _10280);
                    float _10302 = fma(_10286, _10300, _10294);
                    float _10304 = _10302 * 2.3283064365386962890625e-10;
                    _10228 = as_type<int>(_10304);
                    _10216 = as_type<int>(_10294);
                    _10202 = as_type<int>(_10290);
                }
            }
        }
    }
    int _10306 = _10228;
    int _10308 = _10216;
    int _10310 = _10202;
    int _10312 = _10218;
    _10192 = _10306;
    _10193 = _10191;
    _10194 = 0;
    _10195 = _10308;
    _10196 = _10310;
    _10197 = _10312;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3663 = false;
    bool _2845 = false;
    bool _2655 = false;
    bool _1453 = false;
    bool _1079 = false;
    bool _905 = false;
    bool _693 = false;
    bool _519 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = in.m_48.w;
    float _105 = trunc(_101);
    int _107 = int(_105);
    float _109 = -_103;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = as_type<float>(_107);
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4158 = as_type<float>(_129);
        out.gl_Position.z = _4158;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _133 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_103);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_53.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4213 = as_type<float>(_155);
        out.gl_Position.z = _4213;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = in.m_55.w;
    float _159 = 1.0 / _143;
    float _161 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_48.x;
    float _175 = in.m_48.y;
    float _177 = in.m_48.z;
    float _179 = in.m_46.x;
    float _181 = in.m_46.y;
    float _183 = in.m_46.z;
    float _185 = 0.0;
    float _187 = _161;
    if (!_171)
    {
        float _189 = _161 * _161;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _193;
    if (!_171)
    {
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    bool _201 = !_171;
    float _203 = _199;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _161 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _161);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_171;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _161 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _187 = _257;
    }
    float _259 = _187;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _263 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = fma(_259, _173, _263);
    float _271 = fma(_259, _175, _265);
    float _273 = fma(_259, _177, _267);
    float _275 = fma(_269, _157, _179);
    float _277 = fma(_271, _157, _181);
    float _279 = fma(_273, _157, _183);
    float _281 = _111 * _159;
    bool _283 = !_261;
    float _301;
    if (!_283)
    {
        float _285 = in.m_57.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        _301 = _281;
    }
    _303 = false;
    float _305 = _301;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _305 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _305 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _327;
    float _331 = 1.0 / _321;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _335 = 1.0 / _329;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = 1.0 / _325;
    float _343 = _309 * _331;
    bool _345 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _347 = isnan(_305);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = fma(_339, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_359, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _365 = _313 * _335;
    bool _367 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_305);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -_355;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _383;
    float _387 = _377 * _381;
    float _389 = fma(_385, _343, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _391 = _317 * _341;
    bool _393 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _395 = isnan(_305);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -_377;
    float _407 = _405 + 1.0;
    bool _409 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _411 = isnan(_305);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = -_403;
    float _431 = _429 + 1.0;
    float _433 = _403 * _407;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = fma(_427, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = _419 * _431;
    float _443 = -_419;
    float _445 = _443 + 1.0;
    float _447 = fma(_437, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _449 = fma(_423, _391, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _451 = _361 * _441;
    float _453 = _363 * _441;
    float _455 = _389 * _441;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].z, _455);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _467;
    float _471 = fma(_439, _433, _457);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _473;
    float _477 = fma(_465, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_469, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_447, _433, _459);
    float _483 = fma(_475, _365, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _485 = fma(_449, _433, _461);
    float _487 = fma(_477, _387, _471);
    float _489 = fma(_479, _387, _481);
    float _491 = fma(_483, _387, _485);
    float _493 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[146].x, _487);
    float _495 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[146].y, _489);
    float _497 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[146].z, _491);
    bool _499 = !_333;
    float _517;
    if (!_499)
    {
        float _501 = in.m_57.x;
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _281;
    }
    _519 = false;
    float _521 = _517;
    float _523 = in.m_55.x;
    float _525 = in.m_55.y;
    float _527 = in.m_55.z;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _531 = _521 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _533;
    bool _537 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _539 = 1.0 / _535;
    float _541 = _495 * _525;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _547 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _549 = isnan(_521);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _497 * _527;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _563 = _521 + _561;
    float _565 = 1.0 / _545;
    bool _567 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _569 = isnan(_521);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = _531 * _539;
    bool _581 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _583 = isnan(_521);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -_557;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _597;
    float _601 = _591 * _595;
    float _603 = -_591;
    float _605 = _603 + 1.0;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _611;
    float _615 = fma(_599, _579, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _617 = _577 * _605;
    float _619 = fma(_609, _579, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _621 = fma(_613, _579, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _623 = _563 * _565;
    float _625 = _615 * _617;
    float _627 = _619 * _617;
    float _629 = _621 * _617;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _643 = -_577;
    float _645 = _643 + 1.0;
    float _647 = fma(_633, _623, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _649 = fma(_637, _623, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _651 = fma(_641, _623, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _653 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[107].x, _627);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[107].y, _625);
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[107].z, _629);
    float _659 = _493 * _523;
    float _661 = fma(_647, _601, _653);
    float _663 = fma(_649, _601, _655);
    float _665 = fma(_651, _601, _657);
    float _667 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[109].x, _661);
    float _669 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[109].y, _663);
    float _671 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[109].z, _665);
    bool _673 = !_537;
    float _691;
    if (!_673)
    {
        float _675 = in.m_57.x;
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _679 = _675 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        _691 = _281;
    }
    _693 = false;
    float _695 = _691;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _699 = _695 + _697;
    float _701 = _667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _711 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _713 = isnan(_695);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _723;
    float _727 = 1.0 / _705;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _733 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _735 = isnan(_695);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _751 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _753 = isnan(_695);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _765 = 1.0 / _709;
    float _767 = -_743;
    float _769 = _767 + 1.0;
    bool _771 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _773 = _721 * _769;
    float _775 = _725 * _727;
    bool _777 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _779 = isnan(_695);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -_721;
    float _791 = _789 + 1.0;
    float _793 = 1.0 / _731;
    float _795 = fma(_775, _699, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _797;
    float _801 = _787 * _791;
    float _803 = -_787;
    float _805 = _803 + 1.0;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _811 = 1.0 / _749;
    float _813 = _761 * _805;
    float _815 = _809 * _765;
    float _817 = -_761;
    float _819 = _817 + 1.0;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _823 = _695 + _821;
    float _825 = _795 * _813;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = _695 + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _835 = _799 * _793;
    bool _837 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _839 = isnan(_695);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = fma(_815, _829, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _851 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[115].x, _825);
    float _853 = fma(_835, _823, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _857 = _695 + _855;
    float _859 = -_847;
    float _861 = _859 + 1.0;
    float _863 = fma(_849, _801, _851);
    float _865 = _833 * _811;
    float _867 = _743 * _861;
    float _869 = fma(_853, _773, _863);
    float _871 = fma(_865, _857, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _873 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = fma(_871, _867, _869);
    float _877 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[119].x, _875);
    float _881 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _879 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _877;
    out.m_59.y = _873;
    out.m_59.z = _881;
    out.m_59.w = _883;
    bool _885 = !_771;
    float _903;
    if (!_885)
    {
        float _887 = in.m_57.x;
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _891 = _887 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _895 = _893 * _889;
        float _897 = floor(_895);
        float _899 = -_897;
        float _901 = _895 + _899;
        _903 = _901;
        _905 = true;
    }
    else
    {
        _903 = _281;
    }
    _905 = false;
    float _907 = _903;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _911 = _907 + _909;
    bool _913 = _907 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _915 = isnan(_907);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _927 = _907 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _929;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _937 = 1.0 / _931;
    bool _939 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _941 = 1.0 / _935;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _943;
    float _947 = _911 * _937;
    bool _949 = _907 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _951 = isnan(_907);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -_923;
    float _963 = _961 + 1.0;
    bool _965 = _907 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _967 = isnan(_907);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = fma(_945, _947, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _979 = _975 * _963;
    float _981 = -_975;
    float _983 = _981 + 1.0;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _989;
    float _993 = _927 * _941;
    float _995 = _959 * _983;
    float _997 = fma(_987, _947, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _999 = fma(_991, _947, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1001 = -_959;
    float _1003 = _1001 + 1.0;
    float _1005 = _977 * _995;
    float _1007 = _997 * _995;
    float _1009 = _999 * _995;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1023 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1007);
    float _1025 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1005);
    float _1027 = fma(_1013, _993, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1029 = fma(_1017, _993, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1031 = fma(_1021, _993, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1033 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1009);
    float _1035 = fma(_1027, _979, _1023);
    float _1037 = fma(_1029, _979, _1025);
    float _1039 = fma(_1031, _979, _1033);
    float _1041 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1035);
    float _1043 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1037);
    float _1045 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1039);
    float _1047 = _1041 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1049 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1051 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1053;
    out.m_61.y = _1055;
    out.m_61.z = _1057;
    bool _1059 = !_939;
    float _1077;
    if (!_1059)
    {
        float _1061 = in.m_57.x;
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1065 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[14].x, _111);
        float _1069 = _1067 * _1063;
        float _1071 = floor(_1069);
        float _1073 = -_1071;
        float _1075 = _1069 + _1073;
        _1077 = _1075;
        _1079 = true;
    }
    else
    {
        _1077 = _281;
    }
    _1079 = false;
    float _1081 = _1077;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1085 = _1081 + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1089 = _1081 + _1087;
    bool _1091 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1093 = isnan(_1081);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1103;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1111;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1119 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1121 = isnan(_1081);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = 1.0 / _1109;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1135 = _1081 + _1133;
    bool _1137 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1139 = isnan(_1081);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = 1.0 / _1105;
    float _1151 = -_1129;
    float _1153 = _1151 + 1.0;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1155;
    bool _1159 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1161 = isnan(_1081);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1175 = _1147 * _1153;
    float _1177 = 1.0 / _1113;
    float _1179 = _1089 * _1131;
    bool _1181 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1183 = isnan(_1081);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1189 = _1185 || _1187;
    float _1191 = float(_1189);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1193;
    bool _1197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1199 = 1.0 / _1117;
    float _1201 = _1085 * _1149;
    float _1203 = -_1101;
    float _1205 = _1203 + 1.0;
    float _1207 = _1129 * _1205;
    bool _1209 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1211 = isnan(_1081);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1217 = _1213 || _1215;
    float _1219 = float(_1217);
    float _1221 = _1135 * _1177;
    float _1223 = -_1147;
    float _1225 = _1223 + 1.0;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1229 = _1081 + _1227;
    float _1231 = -_1191;
    float _1233 = _1231 + 1.0;
    float _1235 = 1.0 / _1157;
    float _1237 = _1191 * _1225;
    bool _1239 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1241 = isnan(_1081);
    bool _1243 = _1239 || _1241;
    bool _1245 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1247 = _1243 || _1245;
    float _1249 = float(_1247);
    float _1251 = _1219 * _1233;
    float _1253 = _1229 * _1199;
    float _1255 = -_1219;
    float _1257 = _1255 + 1.0;
    bool _1259 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1261 = isnan(_1081);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = -_1249;
    float _1273 = _1271 + 1.0;
    float _1275 = 1.0 / _1173;
    float _1277 = _1249 * _1257;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1281 = _1081 + _1279;
    float _1283 = _1269 * _1273;
    float _1285 = -_1269;
    float _1287 = _1285 + 1.0;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1293;
    float _1297 = _1169 * _1287;
    float _1299 = fma(_1291, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1305 = -_1169;
    float _1307 = _1305 + 1.0;
    float _1309 = 1.0 / _1195;
    float _1311 = _1299 * _1297;
    float _1313 = fma(_1303, _1179, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1315 = fma(_1295, _1221, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1317 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1311);
    float _1319 = _1281 * _1235;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1323 = _1081 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1327 = _1081 + _1325;
    float _1329 = fma(_1313, _1283, _1317);
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1335 = _1323 * _1275;
    float _1337 = fma(_1315, _1277, _1329);
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1339;
    float _1343 = fma(_1333, _1253, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1353 = fma(_1341, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1359 = fma(_1343, _1251, _1337);
    float _1361 = fma(_1347, _1319, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1363 = _1327 * _1309;
    float _1365 = fma(_1361, _1237, _1359);
    float _1367 = fma(_1357, _1335, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1369;
    float _1373 = _1353 * _1297;
    float _1375 = fma(_1351, _1179, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1377 = fma(_1367, _1175, _1365);
    float _1379 = fma(_1371, _1363, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1381 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1373);
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1391 = fma(_1379, _1207, _1377);
    float _1393 = fma(_1385, _1221, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1395 = fma(_1375, _1283, _1381);
    float _1397 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1391);
    float _1399 = fma(_1389, _1253, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1401;
    float _1405 = fma(_1393, _1277, _1395);
    out.m_63.y = _1397;
    float _1407 = fma(_1403, _1319, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1413 = fma(_1399, _1251, _1405);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1415;
    float _1419 = fma(_1411, _1335, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1421 = fma(_1407, _1237, _1413);
    float _1423 = fma(_1417, _1363, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1425 = fma(_1419, _1175, _1421);
    float _1427 = fma(_1423, _1207, _1425);
    float _1429 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1427);
    float _1431 = precise::clamp(_1429, 0.0, 1.0);
    bool _1433 = !_1197;
    float _1451;
    if (!_1433)
    {
        float _1435 = in.m_57.x;
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1439 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[14].y, _111);
        float _1443 = _1441 * _1437;
        float _1445 = floor(_1443);
        float _1447 = -_1445;
        float _1449 = _1443 + _1447;
        _1451 = _1449;
        _1453 = true;
    }
    else
    {
        _1451 = _281;
    }
    _1453 = false;
    float _1455 = _1451;
    int _1457 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1459 = _1457;
    int _1461 = 0;
    int _1463 = _96(_1459, _1461, (*spvDescriptorSet0.support_buffer));
    float _1465 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1467 = int(_1465);
    float _1469 = in.m_57.x;
    float _1471 = in.m_57.y;
    float _1473 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1475 = int(_1473);
    float _1477 = float(_1467);
    float _1479 = 1.0 / _1477;
    float _1481 = float(uint(_1475));
    int _1483 = ~_1475;
    int _1485 = _1483 + 1;
    int _1487 = ~_1475;
    int _1489 = _1487 + 1;
    float _1491 = 1.0 / _1481;
    bool _1493 = _1475 == 0;
    int _1495 = ~_1475;
    int _1497 = _1495 + 1;
    float _1499 = _111 * _1479;
    float _1501 = trunc(_1499);
    int _1503 = int(_1501);
    int _1505 = as_type<int>(_1491) + (-2);
    float _1507 = float(uint(_1503));
    float _1509 = as_type<float>(_1505) * _1507;
    float _1511 = trunc(_1509);
    float _1513 = precise::max(_1511, 0.0);
    uint _1516 = uint(_1513);
    int _1518 = _1485 * int(_1516);
    int _1520 = _1518 + _1503;
    float _1522 = float(_1475);
    float _1524 = float(uint(_1520));
    float _1526 = as_type<float>(_1505) * _1524;
    float _1528 = trunc(_1526);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1536 = _1534 != 0;
    bool _1538 = !_1536;
    float _1540 = _1538 ? 7.345489978790283203125 : 1.0;
    float _1542 = _1540 * _1469;
    int _1544 = int(_1516) + int(_1532);
    float _1546 = floor(_1542);
    float _1548 = float(_1503);
    int _1550 = _1489 * _1544;
    int _1552 = _1550 + _1503;
    bool _1554 = _1548 >= _1522;
    bool _1556 = isnan(_1548);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan(_1522);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    bool _1566 = uint(_1552) >= uint(_1475);
    float _1568 = trunc(_1564);
    int _1570 = int(_1568);
    bool _1572 = !_1566;
    int _1574 = _1572 ? 0 : (-1);
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1578 = _1576 != 0;
    int _1580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1582 = _1580 != 0;
    int _1584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1586 = _1584 != 0;
    float _1588 = -_1546;
    float _1590 = _1542 + _1588;
    int _1592 = ~_1544;
    int _1594 = _1592 + _1574;
    int _1596 = _1594 + 1;
    float _1598 = _111 * _1522;
    float _1600 = _1590 * _1522;
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1604 = _1602 != 0;
    int _1606 = _1475 * _1596;
    int _1608 = _1606 + _1503;
    float _1610 = _1598 * _159;
    int _1612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1614 = _1612 != 0;
    float _1616 = trunc(_1600);
    int _1618 = int(_1616);
    bool _1620 = !_1582;
    int _1622 = _1620 ? 0 : 1;
    int _1624 = ~_1570;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    bool _1630 = !_1493;
    int _1632 = _1630 ? _1608 : (-1);
    int _1634 = _1475 + (-1);
    float _1636 = trunc(_1610);
    int _1638 = int(_1636);
    int _1640 = abs(_1622);
    int _1642 = _1632 * _1628;
    bool _1644 = !_1614;
    int _1646 = _1644 ? 0 : 1;
    bool _1648 = !_1586;
    int _1650 = _1648 ? 0 : 1;
    int _1652 = _1570 * _1634;
    int _1654 = _1652 + _1642;
    bool _1656 = !_1578;
    int _1658 = _1656 ? 0 : 1;
    int _1660 = abs(_1646);
    int _1662 = abs(_1658);
    int _1664 = _1618 * _1660;
    int _1666 = _1664 + _1503;
    bool _1668 = !_1604;
    int _1670 = _1668 ? 0 : 1;
    int _1672 = abs(_1650);
    int _1674 = _1654 * _1640;
    int _1676 = abs(_1670);
    int _1678 = _1638 * _1662;
    int _1680 = _1678 + _1674;
    float _1682 = in.m_65.z;
    int _1684 = ~_1475;
    int _1686 = _1684 + 1;
    int _1688 = _1666 * _1672;
    int _1690 = _1688 + _1680;
    int _1692 = _1618 * _1676;
    int _1694 = _1692 + _1690;
    float _1696 = float(uint(_1694));
    float _1698 = as_type<float>(_1505) * _1696;
    float _1700 = trunc(_1698);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    float _1706 = trunc(_1682);
    int _1708 = int(_1706);
    int _1710 = _1686 * int(_1704);
    int _1712 = _1710 + _1694;
    float _1714 = float(uint(_1712));
    float _1716 = as_type<float>(_1505) * _1714;
    float _1718 = trunc(_1716);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = int(_1704) + int(_1722);
    int _1726 = _1497 * _1724;
    int _1728 = _1726 + _1694;
    int _1730 = _1463 + (-1);
    float _1732 = float(_1730);
    float _1734 = _1431 * _1732;
    float _1736 = trunc(_1734);
    int _1738 = int(_1736);
    int _1740 = _1738;
    int _1742 = 0;
    int _1744 = _97(_1740, _1742, (*spvDescriptorSet0.support_buffer));
    int _1746 = _1708;
    int _1748 = 0;
    int _1750 = _97(_1746, _1748, (*spvDescriptorSet0.support_buffer));
    float4 _1753 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1744, _1750)), 0).xyzw;
    float _1755 = _1753.x;
    float _1757 = _1753.y;
    float _1759 = _1753.z;
    float _1761 = _1753.w;
    bool _1763 = uint(_1728) >= uint(_1475);
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1767 = _1455 + _1765;
    int _1769 = ~_1475;
    int _1771 = _1769 + 1;
    bool _1773 = !_1763;
    int _1775 = _1773 ? 0 : (-1);
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1779 = _1777 != 0;
    int _1781 = ~_1724;
    int _1783 = _1781 + _1775;
    int _1785 = _1783 + 1;
    float _1787 = float(uint(_1666));
    int _1789 = _1475 * _1785;
    int _1791 = _1789 + _1694;
    float _1793 = as_type<float>(_1505) * _1787;
    int _1795 = ~_1475;
    int _1797 = _1795 + 1;
    bool _1799 = !_1493;
    int _1801 = _1799 ? _1791 : (-1);
    float _1803 = trunc(_1793);
    float _1805 = precise::max(_1803, 0.0);
    uint _1807 = uint(_1805);
    int _1809 = _1801 >> 31;
    int _1811 = _1801 & 3;
    bool _1813 = _1811 != 0;
    int _1815 = _1809 & 3;
    int _1817 = _1801 & 3;
    bool _1819 = _1817 != 0;
    int _1821 = _1801 + _1815;
    bool _1823 = uint(_1817) > 1u;
    int _1825 = _1821 >> 2;
    int _1827 = _1797 * int(_1807);
    int _1829 = _1827 + _1666;
    bool _1831 = _1817 != 3;
    int _1833 = _1825 << 4;
    int _1835 = _1833 + 368;
    float _1837 = float(uint(_1829));
    uint _1839 = uint(int(uint(_1835) >> uint(2)));
    uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
    int _1843 = int(_1839) & 3;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[int(_1841)][_1843];
    int _1847 = int(_1839) + 1;
    uint _1849 = uint(int(uint(_1847) >> uint(2)));
    int _1851 = _1847 & 3;
    float _1853 = (*spvDescriptorSet0.vp_c9)._m0[int(_1849)][_1851];
    float _1855 = as_type<float>(_1505) * _1837;
    int _1857 = _1813 ? 0 : 1;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1861 = _1859 != 0;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1865 = _1863 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _1867 = _1835 + 8;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[int(_1879)][_1881];
    float _1885 = trunc(_1855);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    bool _1891 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1893 = isnan(_1455);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    bool _1903 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1905 = isnan(_1455);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1917 = _1915 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1919 = 1.0 / _1865;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1923 = int(_1807) + int(_1889);
    float _1925 = 1.0 / _1917;
    int _1927 = ~_1857;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    int _1933 = _1931;
    if (!_1823)
    {
        int _1935 = ~_1857;
        int _1937 = _1935 + 1;
        _1933 = _1937;
    }
    int _1939 = _1933;
    int _1941 = _1771 * _1923;
    int _1943 = _1941 + _1666;
    bool _1945 = uint(_1817) >= 2u;
    int _1947 = abs(_1939);
    bool _1949 = uint(_1943) >= uint(_1475);
    int _1951 = ~_1947;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = _1945 ? 0 : 1;
    bool _1959 = !_1949;
    int _1961 = _1959 ? 0 : (-1);
    bool _1963 = _1817 != 3;
    int _1965 = ~_1957;
    int _1967 = _1965 + 1;
    int _1969 = _1967 + 1;
    int _1971 = _1955 * as_type<int>(_1853);
    bool _1973 = !_1819;
    int _1975 = _1973 ? 0 : 1;
    int _1977 = _1969;
    if (_1831)
    {
        int _1979 = ~_1957;
        int _1981 = _1979 + 1;
        _1977 = _1981;
    }
    int _1983 = _1977;
    float _1985 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1987 = abs(_1975);
    bool _1989 = !_1963;
    int _1991 = _1989 ? 0 : (-1);
    int _1993 = abs(_1983);
    int _1995 = abs(_1991);
    int _1997 = ~_1987;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = _2001 * as_type<int>(_1845);
    int _2005 = _2003 + _1971;
    int _2007 = ~_1993;
    int _2009 = _2007 + 1;
    int _2011 = _2009 + 1;
    float _2013 = -_1921;
    float _2015 = fma(_1985, 2.0, _2013);
    int _2017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2019 = _2017 != 0;
    float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2023 = _2021 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2025 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2027 = int(_2025);
    int _2029 = ~_1995;
    int _2031 = _2029 + 1;
    int _2033 = _2031 + 1;
    int _2035 = _2011 * as_type<int>(_1875);
    int _2037 = _2035 + _2005;
    int _2039 = ~_1923;
    int _2041 = _2039 + _1961;
    int _2043 = _2041 + 1;
    float _2045 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2047 = _2033 * as_type<int>(_1883);
    int _2049 = _2047 + _2037;
    bool _2051 = !_1779;
    int _2053 = _2051 ? 0 : 1;
    int _2055 = _1475 * _2043;
    int _2057 = _2055 + _1666;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2061 = _2059 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2063 = abs(_2053);
    float _2065 = 1.0 / _2023;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2069 = ~_2063;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2077 = _2075 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2079 = fma(_2045, -2.0, _2067);
    float _2081 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2083 = _2081 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    int _2085 = abs(_2027);
    float _2087 = 1.0 / _2061;
    int _2089 = _2049 * _2073;
    float _2091 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2079);
    float _2093 = float(uint(_2085));
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2099 = 1.0 / _2077;
    int _2101 = ~_2027;
    int _2103 = _2101 + 1;
    bool _2105 = _1471 > 0.5;
    bool _2107 = _2105 && _2019;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2111 = 1.0 / _2083;
    bool _2113 = !_1493;
    int _2115 = _2113 ? _2057 : (-1);
    float _2117 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2109);
    bool _2119 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2121 = isnan(_1455);
    bool _2123 = _2119 || _2121;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2127 = _2123 || _2125;
    float _2129 = float(_2127);
    int _2131 = _2115 * _2063;
    int _2133 = _2131 + _2089;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2135;
    float _2139 = 1.0 / _2093;
    float _2141 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2141;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2151 = _2149 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2153 = _2137 * _2099;
    float _2155 = _2143 * _2087;
    bool _2157 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2159 = isnan(_1455);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = _2151 * _2065;
    float _2171 = 1.0 / _2097;
    float _2173 = _2147 * _2111;
    int _2175 = abs(_2133);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2179 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2177;
    float _2181 = float(uint(_2027));
    float _2183 = fma(_2155, _1767, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2185 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2187 = isnan(_1455);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2193 = _2189 || _2191;
    float _2195 = float(_2193);
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2201 = as_type<int>(_2139) + (-2);
    float _2203 = 1.0 / _2181;
    float _2205 = float(uint(_2175));
    float _2207 = -_2167;
    float _2209 = _2207 + 1.0;
    bool _2211 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2213 = isnan(_1455);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = _2199 * _1919;
    float _2225 = float(uint(_2133));
    float _2227 = _2195 * _2209;
    float _2229 = _2179 * _2171;
    float _2231 = as_type<float>(_2201) * _2205;
    float _2233 = -_2195;
    float _2235 = _2233 + 1.0;
    float _2237 = -_2221;
    float _2239 = _2237 + 1.0;
    bool _2241 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2243 = isnan(_1455);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2249 = _2245 || _2247;
    float _2251 = float(_2249);
    float _2253 = _2221 * _2235;
    float _2255 = _2129 * _2239;
    float _2257 = -_2129;
    float _2259 = _2257 + 1.0;
    float _2261 = trunc(_2231);
    float _2263 = precise::max(_2261, 0.0);
    uint _2265 = uint(_2263);
    float _2267 = _2251 * _2259;
    int _2269 = as_type<int>(_2203) + (-2);
    float _2271 = -_2251;
    float _2273 = _2271 + 1.0;
    bool _2275 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2277 = isnan(_1455);
    bool _2279 = _2275 || _2277;
    bool _2281 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2283 = _2279 || _2281;
    float _2285 = float(_2283);
    float _2287 = as_type<float>(_2269) * _2225;
    float _2289 = -_1901;
    float _2291 = _2289 + 1.0;
    float _2293 = _1901 * _2273;
    float _2295 = _1913 * _2291;
    float _2297 = trunc(_2287);
    float _2299 = precise::max(_2297, 0.0);
    uint _2301 = uint(_2299);
    int _2303 = ~int(_2265);
    int _2305 = _2303 + 1;
    float _2307 = -_1913;
    float _2309 = _2307 + 1.0;
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2311;
    int _2315 = _2305 * _2085;
    int _2317 = _2315 + _2175;
    float _2319 = _2285 * _2309;
    float _2321 = _2313 * _1925;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2325 = _1455 + _2323;
    float _2327 = float(uint(_2317));
    float _2329 = _2183 * _2319;
    float _2331 = -_2285;
    float _2333 = _2331 + 1.0;
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2337 = _1455 + _2335;
    int _2339 = _2103 * int(_2301);
    int _2341 = _2339 + _2133;
    float _2343 = as_type<float>(_2201) * _2327;
    float _2345 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2347 = _1455 + _2345;
    float _2349 = fma(_2333, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2329);
    float _2351 = fma(_2173, _2337, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2353 = float(uint(_2341));
    float _2355 = trunc(_2343);
    float _2357 = precise::max(_2355, 0.0);
    uint _2359 = uint(_2357);
    float _2361 = fma(_2169, _2347, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2363 = fma(_2153, _2325, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2365 = as_type<float>(_2269) * _2353;
    float _2367 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2369 = _1455 + _2367;
    float _2371 = _2153;
    if (_1861)
    {
        float _2373 = in.m_57.x;
        _2371 = _2373;
    }
    float _2375 = _2371;
    float _2377 = fma(_2361, _2295, _2349);
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2381 = _1455 + _2379;
    float _2383 = fma(_2229, _2369, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2385 = trunc(_2365);
    float _2387 = precise::max(_2385, 0.0);
    uint _2389 = uint(_2387);
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2393 = _1455 + _2391;
    float _2395 = fma(_2363, _2293, _2377);
    float _2397 = fma(_2223, _2381, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2399 = fma(_2321, _2393, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _2401 = int(_2265) + int(_2359);
    float _2403 = in.m_65.x;
    float _2405 = fma(_2351, _2267, _2395);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2409 = ~_2401;
    int _2411 = _2409 + 1;
    float _2413 = fma(_2383, _2255, _2405);
    int _2415 = ~_2027;
    int _2417 = _2415 + 1;
    float _2419 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2407);
    float _2421 = fma(_2397, _2253, _2413);
    int _2423 = int(_2301) + int(_2389);
    float _2425 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2419);
    int _2427 = _2411 * _2085;
    int _2429 = _2427 + _2175;
    bool _2431 = _2375 > 0.5;
    bool _2433 = _2431 && _1861;
    int _2435 = _2417 * _2423;
    int _2437 = _2435 + _2133;
    float _2439 = fma(_2399, _2227, _2421);
    int _2441 = _2133 ^ _2027;
    float _2443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2445 = uint(_2429) >= uint(_2085);
    float _2447 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2439);
    bool _2449 = uint(_2437) >= uint(_2027);
    float _2451 = in.m_65.y;
    bool _2453 = !_2445;
    int _2455 = _2453 ? 0 : (-1);
    float _2457 = -_111;
    float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2015);
    uint _2461 = uint(int(uint(_2441) >> uint(31)));
    float _2463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2465 = !_2449;
    float _2467 = _2465 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    out.m_67.x = _2447;
    float _2469 = as_type<float>(_2411);
    float _2471 = _2467;
    if (_1861)
    {
        _2469 = _2403;
    }
    float _2473 = _2469;
    int _2475 = ~_2455;
    int _2477 = _2401 + _2475;
    int _2479 = _2477 + 1;
    int _2481 = ~int(_2461);
    int _2483 = _2481 + 1;
    float _2485 = _2473;
    if (_2433)
    {
        float _2487 = -_2473;
        float _2489 = _2487 + 1.0;
        _2485 = _2489;
    }
    float _2491 = _2485;
    int _2493 = ~_2423;
    int _2495 = _2493 + as_type<int>(_2467);
    int _2497 = _2495 + 1;
    float _2499 = _2443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2501 = _2479 ^ _2483;
    bool _2503 = _2027 == 0;
    bool _2505 = _2027 == 0;
    int _2507 = _2027 * _2497;
    int _2509 = _2507 + _2133;
    int _2511 = ~_2483;
    int _2513 = _2511 + _2501;
    int _2515 = _2513 + 1;
    float _2517 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2519 = as_type<int>(_2491);
    if (!_1861)
    {
        _2471 = _2403;
    }
    float _2521 = _2471;
    float _2523 = _2451;
    float _2525 = _2521;
    if (_2107)
    {
        float _2527 = -_2451;
        float _2529 = _2527 + 1.0;
        _2523 = _2529;
    }
    float _2531 = _2523;
    bool _2533 = !_2503;
    int _2535 = _2533 ? _2509 : (-1);
    bool _2537 = !_2505;
    int _2539 = _2537 ? _2515 : (-1);
    if (_1861)
    {
        _2525 = _2491;
    }
    float _2541 = _2525;
    uint _2543 = as_type<uint>(half2(float2(_1761, 0.0)));
    float _2545 = float(_2535);
    float _2547 = fma(_2499, _2541, -0.5);
    uint _2549 = extract_bits(_2543, 0u, 8u);
    int _2551 = int(_2549) & 255;
    uint _2553 = extract_bits(_2543, 8u, 8u);
    int _2555 = int(_2553) & 255;
    int _2557 = _2555 << 8;
    int _2559 = _2551 | _2557;
    float _2561 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2117);
    float _2563 = float(_2539);
    float _2565 = fma(_2499, _2545, _2459);
    bool _2567 = _2559 >= 32768;
    float _2569 = fma(_2517, _2531, -0.5);
    float _2571 = -_2091;
    float _2573 = fma(_2517, _2563, _2571);
    float _2575 = fma(_2561, _2547, _2565);
    float _2577 = fma(_2425, _2569, _2573);
    int _2579 = _1738 + 1;
    float _2581 = _2575 + 0.5;
    float _2583 = _2577 + 0.5;
    int _2585 = min(_1730, _2579);
    int _2587 = _2559 + (-1024);
    int _2589 = _2587;
    if (_2567)
    {
        int _2591 = ~_2559;
        int _2593 = _2591 + 33792;
        int _2595 = _2593 + 1;
        _2589 = _2595;
    }
    int _2597 = _2589;
    int _2599 = _2597 + 30719;
    float _2601 = float(_2599);
    float _2603 = fma(_2601, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2605 = abs(_2603);
    float _2607 = -_2605;
    float _2609 = _2607 + 1.0;
    float _2611 = abs(_2603);
    float _2613 = fma(_2611, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2615 = _2603 < 0.0;
    float _2617 = float(_2615);
    int _2619 = as_type<int>(_2609) + (-218103808);
    float _2621 = abs(_2603);
    float _2623 = fma(_2621, _2613, -0.212114393711090087890625);
    bool _2625 = uint(_2619) >= 1920991232u;
    float _2627 = abs(_2603);
    float _2629 = fma(_2627, _2623, 1.570728778839111328125);
    bool _2631 = !_2625;
    float _2653;
    if (!_2631)
    {
        int _2633 = as_type<int>(_2609);
        int _2635 = as_type<int>(_2531);
        int _2637 = as_type<int>(_2491);
        int _2639 = 13056;
        int _2641;
        int _2643;
        int _2645;
        int _2647;
        int _2649;
        int _2651;
        _94(_2633, _2635, _2637, _2639, _2641, _2643, _2645, _2647, _2649, _2651, out.gl_Position, out.gl_PointSize);
        _2653 = as_type<float>(_2641);
        _2519 = _2649;
        _2655 = true;
    }
    else
    {
        float _2657 = rsqrt(_2609);
        float _2659 = _2609 * _2657;
        float _2661 = _2657 * 0.5;
        float _2663 = -_2659;
        float _2665 = 0.0 + _2663;
        float _2667 = fma(_2661, _2665, 0.5);
        float _2669 = fma(_2659, _2667, _2659);
        float _2671 = -_2669;
        float _2673 = 0.0 + _2671;
        float _2675 = fma(_2669, _2673, _2609);
        float _2677 = fma(_2661, _2675, _2669);
        _2653 = _2677;
    }
    _2655 = false;
    float _2679 = _2653;
    int _2681 = _2519;
    int _2683 = _2585;
    int _2685 = 0;
    int _2687 = _97(_2683, _2685, (*spvDescriptorSet0.support_buffer));
    int _2689 = _1708;
    int _2691 = 0;
    int _2693 = _97(_2689, _2691, (*spvDescriptorSet0.support_buffer));
    float4 _2695 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2687, _2693)), 0).xyzw;
    float _2697 = _2695.x;
    float _2699 = _2695.y;
    float _2701 = _2695.z;
    float _2703 = _2695.w;
    float _2705 = _2629 * _2679;
    float _2707 = _2617 * 2.0;
    float _2709 = _2601 * 3.883221149444580078125;
    float _2711 = floor(_1734);
    float _2713 = -_2707;
    float _2715 = fma(_2705, _2713, _2705);
    float _2717 = _2709 * 0.15915493667125701904296875;
    float _2719 = fma(_2617, 3.1415927410125732421875, _2715);
    float _2721 = _2717 * 6.283185482025146484375;
    float _2723 = cos(_2721);
    float _2725 = _2719 * 0.15915493667125701904296875;
    float _2727 = _2725 * 6.283185482025146484375;
    float _2729 = sin(_2727);
    float _2731 = -_2711;
    float _2733 = _1734 + _2731;
    float _2735 = _2717 * 6.283185482025146484375;
    float _2737 = sin(_2735);
    float _2739 = _2729 * _2723;
    float _2741 = _2729 * _2737;
    uint _2743 = as_type<uint>(half2(float2(_2703, 0.0)));
    float _2745 = -_1755;
    float _2747 = _2745 + _2697;
    float _2749 = -_1757;
    float _2751 = _2749 + _2699;
    float _2753 = -_1759;
    float _2755 = _2753 + _2701;
    uint _2757 = extract_bits(_2743, 0u, 8u);
    int _2759 = int(_2757) & 255;
    uint _2761 = extract_bits(_2743, 8u, 8u);
    int _2763 = int(_2761) & 255;
    int _2765 = _2763 << 8;
    int _2767 = _2759 | _2765;
    float _2769 = fma(_2733, _2747, _1755);
    float _2771 = fma(_2733, _2751, _1757);
    float _2773 = fma(_2733, _2755, _1759);
    bool _2775 = _2767 >= 32768;
    int _2777 = _2767 + (-1024);
    int _2779 = _2777;
    if (_2775)
    {
        int _2781 = ~_2767;
        int _2783 = _2781 + 33792;
        int _2785 = _2783 + 1;
        _2779 = _2785;
    }
    int _2787 = _2779;
    int _2789 = _2787 + 30719;
    float _2791 = float(_2789);
    float _2793 = fma(_2791, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2795 = abs(_2793);
    float _2797 = -_2795;
    float _2799 = _2797 + 1.0;
    float _2801 = abs(_2793);
    float _2803 = fma(_2801, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2805 = _2793 < 0.0;
    float _2807 = float(_2805);
    int _2809 = as_type<int>(_2799) + (-218103808);
    float _2811 = abs(_2793);
    float _2813 = fma(_2811, _2803, -0.212114393711090087890625);
    bool _2815 = uint(_2809) >= 1920991232u;
    float _2817 = abs(_2793);
    float _2819 = fma(_2817, _2813, 1.570728778839111328125);
    bool _2821 = !_2815;
    float _2843;
    if (!_2821)
    {
        int _2823 = as_type<int>(_2799);
        int _2825 = as_type<int>(_2697);
        int _2827 = _2681;
        int _2829 = 13952;
        int _2831;
        int _2833;
        int _2835;
        int _2837;
        int _2839;
        int _2841;
        _94(_2823, _2825, _2827, _2829, _2831, _2833, _2835, _2837, _2839, _2841, out.gl_Position, out.gl_PointSize);
        _2843 = as_type<float>(_2831);
        _2845 = true;
    }
    else
    {
        float _2847 = rsqrt(_2799);
        float _2849 = _2799 * _2847;
        float _2851 = _2847 * 0.5;
        float _2853 = -_2849;
        float _2855 = 0.0 + _2853;
        float _2857 = fma(_2851, _2855, 0.5);
        float _2859 = fma(_2849, _2857, _2849);
        float _2861 = -_2859;
        float _2863 = 0.0 + _2861;
        float _2865 = fma(_2859, _2863, _2799);
        float _2867 = fma(_2851, _2865, _2859);
        _2843 = _2867;
    }
    _2845 = false;
    float _2869 = _2843;
    float _2871 = in.m_57.x;
    float _2873 = in.m_57.y;
    float _2875 = in.m_57.z;
    float _2877 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2879 = log2(_2877);
    float _2881 = _277 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2883 = _277 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2885 = _277 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2887 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2881);
    float _2889 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2883);
    float _2891 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2885);
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2895 = _2893 != 0;
    int _2897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2899 = _2897 != 0;
    int _2901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2903 = _2901 != 0;
    float _2905 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2887);
    float _2907 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2891);
    float _2909 = _2819 * _2869;
    float _2911 = _2905 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2913 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2915 = _2907 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2917 = _2879 * _111;
    float _2919 = _659 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2921 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2923 = _2791 * 3.883221149444580078125;
    float _2925 = -_2603;
    float _2927 = _2925 + _2793;
    float _2929 = exp2(_2917);
    float _2931 = _2875 * 2.0;
    float _2933 = _2871 * 2.0;
    float _2935 = _2873 * 2.0;
    float _2937 = _2875 + _2871;
    float _2939 = _2923 * 0.15915493667125701904296875;
    float _2941 = fma(_2733, _2927, _2603);
    float _2943 = floor(_2931);
    float _2945 = _2937 + (-1.0);
    float _2947 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2889);
    float _2949 = _2947 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2951 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2953 = isnan(1.0);
    bool _2955 = _2951 || _2953;
    bool _2957 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2959 = _2955 || _2957;
    float _2961 = floor(_2933);
    bool _2963 = _2943 > 0.0;
    float _2965 = floor(_2935);
    bool _2967 = _2943 >= 0.0;
    bool _2969 = isnan(_2943);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan(0.0);
    bool _2975 = _2971 || _2973;
    int _2977 = _2975 ? 0 : 1;
    bool _2979 = _2961 >= 0.0;
    bool _2981 = isnan(_2961);
    bool _2983 = _2979 || _2981;
    bool _2985 = isnan(0.0);
    bool _2987 = _2983 || _2985;
    float _2989 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _2991 = ~_2977;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    float _2997 = _2873 + _2871;
    int _2999 = _2987 ? 0 : 1;
    int _3001 = _2995;
    float _3003 = _2941;
    if (!_2963)
    {
        int _3005 = ~_2977;
        int _3007 = _3005 + 1;
        _3001 = _3007;
    }
    int _3009 = _3001;
    float _3011 = _2997 + (-1.0);
    bool _3013 = !_2895;
    int _3015 = _3013 ? 0 : 1;
    bool _3017 = _2961 > 0.0;
    float _3019 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3021 = 1.0 + _3019;
    bool _3023 = _2965 > 0.0;
    bool _3025 = _2965 >= 0.0;
    bool _3027 = isnan(_2965);
    bool _3029 = _3025 || _3027;
    bool _3031 = isnan(0.0);
    bool _3033 = _3029 || _3031;
    float _3035 = -_2929;
    float _3037 = _3035 + 1.0;
    int _3039 = abs(_3015);
    float _3041 = 1.0 / _3021;
    float _3043 = in.m_69.x;
    float _3045 = in.m_69.y;
    float _3047 = in.m_69.z;
    float _3049 = float(_3009);
    float _3051 = fma(_3011, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3053 = float(_3039);
    int _3055 = _3033 ? 0 : 1;
    bool _3057 = !_2903;
    int _3059 = _3057 ? 0 : 1;
    float _3061 = _3053 * _3049;
    bool _3063 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3065 = isnan(0.0);
    bool _3067 = _3063 || _3065;
    bool _3069 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3071 = _3067 || _3069;
    float _3073 = _2871 + (-0.5);
    int _3075 = ~_3055;
    int _3077 = _3075 + 1;
    int _3079 = _3077 + 1;
    float _3081 = _3061 * (-2.0);
    int _3083 = _3079;
    if (!_3023)
    {
        int _3085 = ~_3055;
        int _3087 = _3085 + 1;
        _3083 = _3087;
    }
    int _3089 = _3083;
    float _3091 = -_2949;
    float _3093 = _3091 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _3095 = abs(_3059);
    float _3097 = fma(_3051, _3081, _3051);
    float _3099 = _3071 ? _3037 : 0.0;
    float _3101 = -_2915;
    float _3103 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3105 = float(_3095);
    float _3107 = float(_3089);
    if (_2959)
    {
        float _3109 = _3099 * _3041;
        _121 = _3109;
    }
    float _3111 = _121;
    int _3113 = ~_2999;
    int _3115 = _3113 + 1;
    int _3117 = _3115 + 1;
    float _3119 = fma(_3081, _3043, _3043);
    int _3121 = _3117;
    if (!_3017)
    {
        int _3123 = ~_2999;
        int _3125 = _3123 + 1;
        _3121 = _3125;
    }
    int _3127 = _3121;
    float _3129 = _3105 * _3107;
    bool _3131 = !_2899;
    int _3133 = _3131 ? 0 : 1;
    float _3135 = fma(_3073, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3119);
    float _3137 = -_2911;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3141 = _3093 * _3093;
    int _3143 = abs(_3133);
    float _3145 = fma(_3097, _3111, _3135);
    float _3147 = _3129 * (-2.0);
    float _3149 = fma(_3139, _3139, _3141);
    float _3151 = _2875 + (-0.5);
    float _3153 = _3145 * 0.15915493667125701904296875;
    float _3155 = float(_3143);
    float _3157 = fma(_3103, _3103, _3149);
    float _3159 = float(_3127);
    float _3161 = _2875 + _2873;
    float _3163 = fma(_3147, _3047, _3047);
    float _3165 = rsqrt(_3157);
    float _3167 = _2873 + (-0.5);
    float _3169 = _3155 * _3159;
    float _3171 = _3161 + (-1.0);
    float _3173 = fma(_3151, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3163);
    float _3175 = _3169 * (-2.0);
    float _3177 = fma(_2989, _3147, _2989);
    float _3179 = fma(_3171, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3181 = _3153 * 6.283185482025146484375;
    float _3183 = sin(_3181);
    float _3185 = fma(_3175, _3045, _3045);
    float _3187 = fma(_3177, _3111, _3173);
    float _3189 = fma(_3179, _3175, _3179);
    float _3191 = _2807 * 2.0;
    float _3193 = fma(_3167, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3185);
    float _3195 = _3187 * 0.15915493667125701904296875;
    bool _3197 = _2771 != 0.0;
    bool _3199 = isnan(_2771);
    bool _3201 = _3197 || _3199;
    bool _3203 = isnan(0.0);
    bool _3205 = _3201 || _3203;
    float _3207 = _3153 * 6.283185482025146484375;
    float _3209 = cos(_3207);
    float _3211 = fma(_3189, _3111, _3193);
    float _3213 = _3139 * _3165;
    float _3215 = -_3191;
    float _3217 = fma(_2909, _3215, _2909);
    float _3219 = _3103 * _3165;
    float _3221 = _3211 * 0.15915493667125701904296875;
    float _3223 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3225 = _3213 * _3223;
    float _3227 = _3093 * _3165;
    float _3229 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3231 = _3219 * _3229;
    float _3233 = _3195 * 6.283185482025146484375;
    float _3235 = sin(_3233);
    float _3237 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3239 = -_3225;
    float _3241 = fma(_3219, _3237, _3239);
    float _3243 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3245 = _3227 * _3243;
    float _3247 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3249 = -_3231;
    float _3251 = fma(_3227, _3247, _3249);
    float _3253 = _3241 * _3241;
    float _3255 = fma(_2807, 3.1415927410125732421875, _3217);
    bool _3257 = _2769 == 0.0;
    bool _3259 = !_3205;
    bool _3261 = _3257 && _3259;
    float _3263 = _3195 * 6.283185482025146484375;
    float _3265 = cos(_3263);
    float _3267 = fma(_3251, _3251, _3253);
    float _3269 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2771);
    float _3271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2769);
    float _3273 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2773);
    bool _3275 = _2773 == 0.0;
    bool _3277 = _3275 && _3261;
    float _3279 = _2913 * _3269;
    float _3281 = _2919 * _3271;
    float _3283 = _3221 * 6.283185482025146484375;
    float _3285 = cos(_3283);
    float _3287 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3289 = -_3245;
    float _3291 = fma(_3213, _3287, _3289);
    float _3293 = _2921 * _3273;
    float _3295 = _3209 * _3235;
    float _3297 = fma(_3291, _3291, _3267);
    float _3299 = _3183 * _3235;
    float _3301 = _3221 * 6.283185482025146484375;
    float _3303 = sin(_3301);
    float _3305 = _3209 * _3265;
    if (!_3277)
    {
        float _3307 = fma(_2771, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2941);
        _3003 = _3307;
    }
    float _3309 = _3003;
    float _3311 = rsqrt(_3297);
    float _3313 = _3183 * _3265;
    float _3315 = _3183 * _3285;
    float _3317 = _3285 * _3235;
    float _3319 = _3285 * _3265;
    float _3321 = _3209 * _3285;
    float _3323 = _3315 * _3279;
    float _3325 = fma(_3303, _3299, _3305);
    float _3327 = -_3295;
    float _3329 = fma(_3303, _3313, _3327);
    float _3331 = -_3313;
    float _3333 = fma(_3303, _3295, _3331);
    float _3335 = fma(_3303, _3305, _3299);
    float _3337 = _3325 * _3279;
    float _3339 = -_3303;
    float _3341 = fma(_3339, _3281, _3323);
    float _3343 = _3251 * _3311;
    float _3345 = _3241 * _3311;
    float _3347 = _3291 * _3311;
    float _3349 = fma(_3317, _3281, _3337);
    float _3351 = _3329 * _3279;
    float _3353 = _3219 * _3345;
    float _3355 = _3227 * _3343;
    float _3357 = fma(_3333, _3293, _3349);
    float _3359 = fma(_3319, _3281, _3351);
    float _3361 = -_3353;
    float _3363 = fma(_3227, _3347, _3361);
    float _3365 = -_3355;
    float _3367 = fma(_3213, _3345, _3365);
    float _3369 = _3255 * 0.15915493667125701904296875;
    float _3371 = fma(_3335, _3293, _3359);
    float _3373 = _3363 * _3357;
    float _3375 = _3367 * _3357;
    float _3377 = fma(_3321, _3293, _3341);
    float _3379 = _2939 * 6.283185482025146484375;
    float _3381 = cos(_3379);
    float _3383 = fma(_3343, _3371, _3373);
    float _3385 = fma(_3347, _3371, _3375);
    float _3387 = fma(_3213, _3377, _3383);
    float _3389 = fma(_3219, _3377, _3385);
    float _3391 = _3369 * 6.283185482025146484375;
    float _3393 = sin(_3391);
    float _3395 = _2911 + _3387;
    float _3397 = _2915 + _3389;
    float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3401 = _3395 + _3399;
    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3405 = _3397 + _3403;
    float _3407 = _2939 * 6.283185482025146484375;
    float _3409 = sin(_3407);
    float _3411 = _3401 * _3401;
    float _3413 = _3405 * _3405;
    float _3415 = _3411 + _3413;
    float _3417 = -_2739;
    float _3419 = fma(_3393, _3381, _3417);
    float _3421 = fma(_2733, _3419, _2739);
    float _3423 = -_2741;
    float _3425 = fma(_3393, _3409, _3423);
    float _3427 = _3213 * _3347;
    float _3429 = _3421;
    float _3431 = _3335;
    float _3433 = _3411;
    float _3435 = _3413;
    float _3437 = _3395;
    float _3439 = _3397;
    float _3441 = _3321;
    if (!_3277)
    {
        float _3443 = fma(_2769, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3421);
        _3429 = _3443;
    }
    float _3445 = _3429;
    float _3447 = _3325 * _3363;
    float _3449 = fma(_2733, _3425, _2741);
    float _3451 = -_3427;
    float _3453 = fma(_3219, _3343, _3451);
    float _3455 = sqrt(_3415);
    float _3457 = _3325 * _3367;
    float _3459 = _3449;
    if (!_3277)
    {
        float _3461 = fma(_2773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3449);
        _3459 = _3461;
    }
    float _3463 = _3459;
    float _3465 = _3325 * _3453;
    float _3467 = _3453 * _3357;
    float _3469 = fma(_3329, _3343, _3447);
    float _3471 = fma(_3329, _3347, _3457);
    float _3473 = fma(_3329, _3345, _3465);
    float _3475 = _3317 * _3367;
    float _3477 = _3333 * _3367;
    float _3479 = _3317 * _3363;
    float _3481 = fma(_3345, _3371, _3467);
    float _3483 = _3317 * _3453;
    float _3485 = _3333 * _3363;
    float _3487 = _3333 * _3453;
    float _3489 = fma(_3319, _3343, _3479);
    bool _3491 = _3455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3493 = fma(_3227, _3377, _3481);
    float _3495 = fma(_3319, _3345, _3483);
    float _3497 = fma(_3335, _3345, _3487);
    float _3499 = fma(_3315, _3213, _3469);
    float _3501 = _2949 + _3493;
    float _3503 = fma(_3319, _3347, _3475);
    float _3505 = fma(_3335, _3343, _3485);
    float _3507 = fma(_3335, _3347, _3477);
    float _3509 = fma(_3315, _3227, _3473);
    float _3511 = fma(_3315, _3219, _3471);
    if (!_3491)
    {
        _3431 = _3501;
    }
    float _3513 = _3431;
    bool _3515 = !_3491;
    float _3517 = _3513;
    if (!_3515)
    {
        float _3519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3521 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3523 = _3455 + _3521;
        float _3525 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3527 = rsqrt(_3415);
        float _3529 = _3523 * _3519;
        float _3531 = _3529 * 0.15915493667125701904296875;
        float _3533 = _3531 * 6.283185482025146484375;
        float _3535 = sin(_3533);
        float _3537 = _3531 * 6.283185482025146484375;
        float _3539 = cos(_3537);
        float _3541 = fma(_3535, _3525, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3543 = _3527 * _3541;
        float _3545 = _3539 + (-1.0);
        float _3547 = _3401 * _3543;
        float _3549 = _3405 * _3543;
        float _3551 = _3545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3553 = _3547 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3555 = _3547 * _3547;
        float _3557 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3559 = fma(_3501, _3539, _3551);
        float _3561 = _3549 * _3549;
        _3517 = _3559;
        _3433 = _3555;
        _3435 = _3561;
        _3437 = _3553;
        _3439 = _3557;
    }
    float _3563 = _3517;
    float _3565 = _3433;
    float _3567 = _3435;
    float _3569 = _3437;
    float _3571 = _3439;
    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3575 = _3563 + _3573;
    float _3577 = -_3303;
    float _3579 = fma(_3577, _3219, _3503);
    float _3581 = fma(_3321, _3219, _3507);
    float _3583 = -_3303;
    float _3585 = fma(_3583, _3213, _3489);
    float _3587 = fma(_3575, _3575, _3565);
    float _3589 = -_3303;
    float _3591 = fma(_3589, _3227, _3495);
    float _3593 = _3499 * _3309;
    float _3595 = _3509 * _3309;
    float _3597 = _3587 + _3567;
    float _3599 = _3511 * _3309;
    float _3601 = fma(_3321, _3213, _3505);
    float _3603 = fma(_3585, _3445, _3593);
    float _3605 = sqrt(_3597);
    float _3607 = fma(_3321, _3227, _3497);
    float _3609 = fma(_3591, _3445, _3595);
    float _3611 = fma(_3579, _3445, _3599);
    float _3613 = fma(_3601, _3463, _3603);
    out.m_71.x = _2581;
    out.m_71.y = _2583;
    float _3615 = fma(_3607, _3463, _3609);
    float _3617 = fma(_3581, _3463, _3611);
    out.m_73.x = _3613;
    out.m_73.y = _3615;
    out.m_73.z = _3617;
    bool _3619 = _3605 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3621 = isnan(_3605);
    bool _3623 = _3619 || _3621;
    bool _3625 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3627 = _3623 || _3625;
    if (!_3627)
    {
        _3441 = 1.0;
    }
    float _3629 = _3441;
    bool _3631 = !_3627;
    float _3633 = _3629;
    if (!_3631)
    {
        bool _3635 = _3605 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3637 = isnan(_3605);
        bool _3639 = _3635 || _3637;
        bool _3641 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3643 = _3639 || _3641;
        if (!_3643)
        {
            float _3645 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3647 = _3605 + _3645;
            float _3649 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3651 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3649;
            float _3653 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3655 = _3653 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3657 = 1.0 / _3651;
            float _3659 = _3647 * _3657;
            float _3661 = fma(_3659, _3655, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3633 = _3661;
            _3663 = true;
        }
        else
        {
            bool _3665 = _3605 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3667 = isnan(_3605);
            bool _3669 = _3665 || _3667;
            bool _3671 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3673 = _3669 || _3671;
            if (!_3673)
            {
                float _3675 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3677 = _3605 + _3675;
                float _3679 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3681 = _3679 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3683 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3685 = _3683 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3687 = 1.0 / _3681;
                float _3689 = _3677 * _3687;
                float _3691 = fma(_3689, _3685, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3633 = _3691;
                _3663 = true;
            }
            else
            {
                _3633 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3663 = false;
    float _3693 = _3633;
    float _3695 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3697 = _3563 + _3695;
    float _3699 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3701 = _3569 + _3699;
    float _3703 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3705 = _3571 + _3703;
    float _3707 = fma(_3697, _3693, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3709 = fma(_3701, _3693, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3711 = fma(_3705, _3693, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3715 = _3707 + _3713;
    float _3717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3719 = _3709 + _3717;
    float _3721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3723 = _3711 + _3721;
    float _3725 = _3715 * _3715;
    float _3727 = fma(_3719, _3719, _3725);
    float _3729 = fma(_3723, _3723, _3727);
    float _3731 = rsqrt(_3729);
    float _3733 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3735 = _3719 * _3733;
    float _3737 = _3723 * _3733;
    float _3739 = _3735 * _3735;
    float _3741 = _3737 * _3737;
    float _3743 = _3739 + _3741;
    float _3745 = sqrt(_3743);
    bool _3747 = _3745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3751 = _3745 + _3749;
    float _3753 = _3727;
    float _3755 = _3743;
    float _3757 = _3751;
    float _3759 = _3715;
    float _3761 = _3733;
    float _3763 = _3735;
    if (_3747)
    {
        float _3765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3753 = _3765;
    }
    float _3767 = _3753;
    if (_3747)
    {
        float _3769 = rsqrt(_3743);
        _3755 = _3769;
    }
    float _3771 = _3755;
    float _3773 = _3767;
    if (_3747)
    {
        float _3775 = _3751 * _3767;
        _3757 = _3775;
    }
    float _3777 = _3757;
    if (_3747)
    {
        float _3779 = _3777 * 0.15915493667125701904296875;
        _3773 = _3779;
    }
    float _3781 = _3773;
    float _3783 = _3723;
    float _3785 = _3781;
    if (_3747)
    {
        float _3787 = _3781 * 6.283185482025146484375;
        float _3789 = sin(_3787);
        _3783 = _3789;
    }
    float _3791 = _3783;
    float _3793 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3795 = precise::max(0.0, _3793);
    float _3797 = _3731;
    float _3799 = _3795;
    if (_3747)
    {
        float _3801 = _3781 * 6.283185482025146484375;
        float _3803 = cos(_3801);
        _3797 = _3803;
    }
    float _3805 = _3797;
    float _3807 = -_3733;
    float _3809 = -_3795;
    float _3811 = fma(_3715, _3807, _3809);
    if (_3747)
    {
        float _3813 = _3811 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3759 = _3813;
    }
    float _3815 = _3759;
    float _3817 = _3815;
    float _3819 = _3791;
    if (_3747)
    {
        float _3821 = fma(_3791, _3815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3817 = _3821;
    }
    float _3823 = _3817;
    float _3825 = _3823;
    if (!_3747)
    {
        _3819 = _3811;
    }
    float _3827 = _3819;
    float _3829 = _3827;
    float _3831 = _3805;
    if (_3747)
    {
        float _3833 = _3805 + (-1.0);
        _3799 = _3833;
    }
    float _3835 = _3799;
    float _3837 = _3835;
    if (_3747)
    {
        float _3839 = _3771 * _3823;
        _3761 = _3839;
    }
    float _3841 = _3761;
    if (!_3747)
    {
        _3825 = _3739;
    }
    float _3843 = _3825;
    float _3845 = sqrt(_3729);
    float _3847 = _3843;
    if (_3747)
    {
        float _3849 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3785 = _3849;
    }
    float _3851 = _3785;
    if (_3747)
    {
        float _3853 = _3735 * _3841;
        _3763 = _3853;
    }
    float _3855 = _3763;
    if (!_3747)
    {
        _3837 = _3737;
    }
    float _3857 = _3837;
    float _3859 = _3857;
    if (_3747)
    {
        float _3861 = _3737 * _3841;
        _3859 = _3861;
    }
    float _3863 = _3859;
    if (_3747)
    {
        float _3865 = fma(_3811, _3805, _3851);
        _3829 = _3865;
    }
    float _3867 = _3829;
    if (_3747)
    {
        float _3869 = _3855 * _3855;
        _3847 = _3869;
    }
    float _3871 = _3847;
    if (!_3747)
    {
        _3831 = _3741;
    }
    float _3873 = _3831;
    float _3875 = _3873;
    if (_3747)
    {
        float _3877 = _3863 * _3863;
        _3875 = _3877;
    }
    float _3879 = _3875;
    float _3881 = fma(_3867, _3867, _3871);
    float _3883 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3885 = _3881 + _3879;
    float _3887 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3891 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3889);
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3897 = rsqrt(_3885);
    float _3899 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3887);
    float _3901 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3903 = -_3893;
    float _3905 = _3903 + 1.0;
    float _3907 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3883);
    float _3909 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3899);
    float _3911 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3913 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3901);
    float _3915 = abs(_3905);
    float _3917 = log2(_3915);
    float _3919 = _3909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3921 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3911);
    float _3923 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3913);
    float _3925 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3927 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3921);
    float _3929 = _3923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3931 = _3897 * _3855;
    float _3933 = -_3925;
    float _3935 = fma(_3933, _3895, 1.0);
    float _3937 = _3927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3939 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3941 = _3897 * _3867;
    float _3943 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3945 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3907);
    float _3947 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3939);
    float _3949 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3951 = _3897 * _3863;
    float _3953 = -_3943;
    float _3955 = fma(_3941, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3953);
    float _3957 = _3945 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3959 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3947);
    float _3961 = log2(_3935);
    float _3963 = -_3951;
    float _3965 = fma(_3963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3955);
    float _3967 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3969 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3959);
    float _3971 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3973 = fma(_3965, -0.5, 0.5);
    float _3975 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3967);
    float _3977 = fma(_3965, 0.5, 0.5);
    float _3979 = exp2(_3949);
    float _3981 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3971);
    float _3983 = _3941 + 1.0;
    float _3985 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3975);
    float _3987 = fma(_3977, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3989 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3981);
    float _3991 = 1.0 / _3969;
    float _3993 = fma(_3977, _3987, -0.212114393711090087890625);
    float _3995 = fma(_3977, _3993, 1.570728778839111328125);
    float _3997 = sqrt(_3973);
    float _3999 = -_3941;
    float _4001 = fma(_3979, _3983, _3999);
    float _4003 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3985);
    float _4005 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3989);
    float _4007 = _3961 * 0.693147182464599609375;
    float _4009 = fma(_4001, 0.5, 0.5);
    float _4011 = _4003 * _3991;
    float _4013 = _4005 * _3991;
    float _4015 = _4007 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4017 = fma(_4011, 0.5, 0.5);
    float _4019 = fma(_4013, -0.5, 0.5);
    float _4021 = _3997 * 0.636619746685028076171875;
    float3 _10038 = float3(_4017, _4019, _4015);
    float _4023 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10038, float3(0.0), isnan(_10038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10038, float3(0.0), isnan(_10038)), level(0.0)).x;
    float3 _10049 = float3(_4017, _4019, _4015);
    float4 _4025 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10049, float3(0.0), isnan(_10049)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10049, float3(0.0), isnan(_10049)), level(0.0)).xyzw;
    float _4027 = _4025.x;
    float _4029 = _4025.y;
    float _4031 = _4025.z;
    float _4033 = _4025.w;
    float _4035 = -_3995;
    float _4037 = fma(_4021, _4035, 1.0);
    float2 _10070 = float2(_4037, _4009);
    float3 _4041 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10070, float2(0.0), isnan(_10070)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10070, float2(0.0), isnan(_10070)), level(0.0)).xyz;
    float _4043 = _4041.x;
    float _4045 = _4041.y;
    float _4047 = _4041.z;
    float _4049 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4051 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2911;
    out.m_75.y = _2949;
    out.m_75.z = _2915;
    float _4053 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4051);
    float _4055 = exp2(_4049);
    out.m_77.x = _3709;
    out.m_77.y = _3707;
    out.m_77.z = _3711;
    float _4057 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4053);
    float _4059 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4057);
    float _4061 = _4059 + _3969;
    out.gl_Position.x = _4003;
    out.gl_Position.y = _4005;
    out.gl_Position.z = _4059;
    out.gl_Position.w = _3969;
    float _4063 = _4061 * 0.5;
    float _4065 = -_4055;
    float _4067 = _4065 + 1.0;
    float _4069 = _4067 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _4063;
    out.m_79.w = _3969;
    float _4071 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4073 = -_4069;
    float _4075 = _4073 + 1.0;
    out.m_53.x = _4071;
    float _4077 = _4069 * _4023;
    float _4079 = _4033 * _4077;
    float _4081 = _4047 * _4077;
    float _4083 = fma(_4043, _4079, _4027);
    float _4085 = fma(_4045, _4079, _4029);
    float _4087 = _4033 * _4075;
    float _4089 = fma(_4033, _4081, _4031);
    out.m_81.x = _4083;
    out.m_81.y = _4085;
    out.m_81.z = _4089;
    out.m_81.w = _4087;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3663 = false;
    bool _2845 = false;
    bool _2655 = false;
    bool _1453 = false;
    bool _1079 = false;
    bool _905 = false;
    bool _693 = false;
    bool _519 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = in.m_48.w;
    float _105 = trunc(_101);
    int _107 = int(_105);
    float _109 = -_103;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = as_type<float>(_107);
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4158 = as_type<float>(_129);
        out.gl_Position.z = _4158;
    }
    if (!_115)
    {
        return out;
    }
    bool _133 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_103);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_53.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4213 = as_type<float>(_155);
        out.gl_Position.z = _4213;
    }
    if (_149)
    {
        return out;
    }
    float _157 = in.m_55.w;
    float _159 = 1.0 / _143;
    float _161 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_48.x;
    float _175 = in.m_48.y;
    float _177 = in.m_48.z;
    float _179 = in.m_46.x;
    float _181 = in.m_46.y;
    float _183 = in.m_46.z;
    float _185 = 0.0;
    float _187 = _161;
    if (!_171)
    {
        float _189 = _161 * _161;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _193;
    if (!_171)
    {
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    bool _201 = !_171;
    float _203 = _199;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _161 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _161);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_171;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _161 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _187 = _257;
    }
    float _259 = _187;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _263 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = fma(_259, _173, _263);
    float _271 = fma(_259, _175, _265);
    float _273 = fma(_259, _177, _267);
    float _275 = fma(_269, _157, _179);
    float _277 = fma(_271, _157, _181);
    float _279 = fma(_273, _157, _183);
    float _281 = _111 * _159;
    bool _283 = !_261;
    float _301;
    if (!_283)
    {
        float _285 = in.m_57.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        _301 = _281;
    }
    _303 = false;
    float _305 = _301;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _305 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _305 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _327;
    float _331 = 1.0 / _321;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _335 = 1.0 / _329;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = 1.0 / _325;
    float _343 = _309 * _331;
    bool _345 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _347 = isnan(_305);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = fma(_339, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_359, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _365 = _313 * _335;
    bool _367 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_305);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -_355;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _383;
    float _387 = _377 * _381;
    float _389 = fma(_385, _343, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _391 = _317 * _341;
    bool _393 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _395 = isnan(_305);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -_377;
    float _407 = _405 + 1.0;
    bool _409 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _411 = isnan(_305);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = -_403;
    float _431 = _429 + 1.0;
    float _433 = _403 * _407;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = fma(_427, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = _419 * _431;
    float _443 = -_419;
    float _445 = _443 + 1.0;
    float _447 = fma(_437, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _449 = fma(_423, _391, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _451 = _361 * _441;
    float _453 = _363 * _441;
    float _455 = _389 * _441;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].z, _455);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _467;
    float _471 = fma(_439, _433, _457);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _473;
    float _477 = fma(_465, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_469, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_447, _433, _459);
    float _483 = fma(_475, _365, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _485 = fma(_449, _433, _461);
    float _487 = fma(_477, _387, _471);
    float _489 = fma(_479, _387, _481);
    float _491 = fma(_483, _387, _485);
    float _493 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[146].x, _487);
    float _495 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[146].y, _489);
    float _497 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[146].z, _491);
    bool _499 = !_333;
    float _517;
    if (!_499)
    {
        float _501 = in.m_57.x;
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _281;
    }
    _519 = false;
    float _521 = _517;
    float _523 = in.m_55.x;
    float _525 = in.m_55.y;
    float _527 = in.m_55.z;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _531 = _521 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _533;
    bool _537 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _539 = 1.0 / _535;
    float _541 = _495 * _525;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _547 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _549 = isnan(_521);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _497 * _527;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _563 = _521 + _561;
    float _565 = 1.0 / _545;
    bool _567 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _569 = isnan(_521);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = _531 * _539;
    bool _581 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _583 = isnan(_521);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -_557;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _597;
    float _601 = _591 * _595;
    float _603 = -_591;
    float _605 = _603 + 1.0;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _611;
    float _615 = fma(_599, _579, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _617 = _577 * _605;
    float _619 = fma(_609, _579, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _621 = fma(_613, _579, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _623 = _563 * _565;
    float _625 = _615 * _617;
    float _627 = _619 * _617;
    float _629 = _621 * _617;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _643 = -_577;
    float _645 = _643 + 1.0;
    float _647 = fma(_633, _623, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _649 = fma(_637, _623, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _651 = fma(_641, _623, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _653 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[107].x, _627);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[107].y, _625);
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[107].z, _629);
    float _659 = _493 * _523;
    float _661 = fma(_647, _601, _653);
    float _663 = fma(_649, _601, _655);
    float _665 = fma(_651, _601, _657);
    float _667 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[109].x, _661);
    float _669 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[109].y, _663);
    float _671 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[109].z, _665);
    bool _673 = !_537;
    float _691;
    if (!_673)
    {
        float _675 = in.m_57.x;
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _679 = _675 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        _691 = _281;
    }
    _693 = false;
    float _695 = _691;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _699 = _695 + _697;
    float _701 = _667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _711 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _713 = isnan(_695);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _723;
    float _727 = 1.0 / _705;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _733 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _735 = isnan(_695);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _751 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _753 = isnan(_695);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _765 = 1.0 / _709;
    float _767 = -_743;
    float _769 = _767 + 1.0;
    bool _771 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _773 = _721 * _769;
    float _775 = _725 * _727;
    bool _777 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _779 = isnan(_695);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -_721;
    float _791 = _789 + 1.0;
    float _793 = 1.0 / _731;
    float _795 = fma(_775, _699, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _797;
    float _801 = _787 * _791;
    float _803 = -_787;
    float _805 = _803 + 1.0;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _811 = 1.0 / _749;
    float _813 = _761 * _805;
    float _815 = _809 * _765;
    float _817 = -_761;
    float _819 = _817 + 1.0;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _823 = _695 + _821;
    float _825 = _795 * _813;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = _695 + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _835 = _799 * _793;
    bool _837 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _839 = isnan(_695);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = fma(_815, _829, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _851 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[115].x, _825);
    float _853 = fma(_835, _823, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _857 = _695 + _855;
    float _859 = -_847;
    float _861 = _859 + 1.0;
    float _863 = fma(_849, _801, _851);
    float _865 = _833 * _811;
    float _867 = _743 * _861;
    float _869 = fma(_853, _773, _863);
    float _871 = fma(_865, _857, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _873 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = fma(_871, _867, _869);
    float _877 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[119].x, _875);
    float _881 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _879 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _877;
    out.m_59.y = _873;
    out.m_59.z = _881;
    out.m_59.w = _883;
    bool _885 = !_771;
    float _903;
    if (!_885)
    {
        float _887 = in.m_57.x;
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _891 = _887 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _895 = _893 * _889;
        float _897 = floor(_895);
        float _899 = -_897;
        float _901 = _895 + _899;
        _903 = _901;
        _905 = true;
    }
    else
    {
        _903 = _281;
    }
    _905 = false;
    float _907 = _903;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _911 = _907 + _909;
    bool _913 = _907 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _915 = isnan(_907);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _927 = _907 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _929;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _937 = 1.0 / _931;
    bool _939 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _941 = 1.0 / _935;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _943;
    float _947 = _911 * _937;
    bool _949 = _907 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _951 = isnan(_907);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -_923;
    float _963 = _961 + 1.0;
    bool _965 = _907 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _967 = isnan(_907);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = fma(_945, _947, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _979 = _975 * _963;
    float _981 = -_975;
    float _983 = _981 + 1.0;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _989;
    float _993 = _927 * _941;
    float _995 = _959 * _983;
    float _997 = fma(_987, _947, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _999 = fma(_991, _947, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1001 = -_959;
    float _1003 = _1001 + 1.0;
    float _1005 = _977 * _995;
    float _1007 = _997 * _995;
    float _1009 = _999 * _995;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1023 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1007);
    float _1025 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1005);
    float _1027 = fma(_1013, _993, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1029 = fma(_1017, _993, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1031 = fma(_1021, _993, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1033 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1009);
    float _1035 = fma(_1027, _979, _1023);
    float _1037 = fma(_1029, _979, _1025);
    float _1039 = fma(_1031, _979, _1033);
    float _1041 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1035);
    float _1043 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1037);
    float _1045 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1039);
    float _1047 = _1041 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1049 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1051 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1053;
    out.m_61.y = _1055;
    out.m_61.z = _1057;
    bool _1059 = !_939;
    float _1077;
    if (!_1059)
    {
        float _1061 = in.m_57.x;
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1065 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[14].x, _111);
        float _1069 = _1067 * _1063;
        float _1071 = floor(_1069);
        float _1073 = -_1071;
        float _1075 = _1069 + _1073;
        _1077 = _1075;
        _1079 = true;
    }
    else
    {
        _1077 = _281;
    }
    _1079 = false;
    float _1081 = _1077;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1085 = _1081 + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1089 = _1081 + _1087;
    bool _1091 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1093 = isnan(_1081);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1103;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1111;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1119 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1121 = isnan(_1081);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = 1.0 / _1109;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1135 = _1081 + _1133;
    bool _1137 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1139 = isnan(_1081);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = 1.0 / _1105;
    float _1151 = -_1129;
    float _1153 = _1151 + 1.0;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1155;
    bool _1159 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1161 = isnan(_1081);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1175 = _1147 * _1153;
    float _1177 = 1.0 / _1113;
    float _1179 = _1089 * _1131;
    bool _1181 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1183 = isnan(_1081);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1189 = _1185 || _1187;
    float _1191 = float(_1189);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1193;
    bool _1197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1199 = 1.0 / _1117;
    float _1201 = _1085 * _1149;
    float _1203 = -_1101;
    float _1205 = _1203 + 1.0;
    float _1207 = _1129 * _1205;
    bool _1209 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1211 = isnan(_1081);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1217 = _1213 || _1215;
    float _1219 = float(_1217);
    float _1221 = _1135 * _1177;
    float _1223 = -_1147;
    float _1225 = _1223 + 1.0;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1229 = _1081 + _1227;
    float _1231 = -_1191;
    float _1233 = _1231 + 1.0;
    float _1235 = 1.0 / _1157;
    float _1237 = _1191 * _1225;
    bool _1239 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1241 = isnan(_1081);
    bool _1243 = _1239 || _1241;
    bool _1245 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1247 = _1243 || _1245;
    float _1249 = float(_1247);
    float _1251 = _1219 * _1233;
    float _1253 = _1229 * _1199;
    float _1255 = -_1219;
    float _1257 = _1255 + 1.0;
    bool _1259 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1261 = isnan(_1081);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = -_1249;
    float _1273 = _1271 + 1.0;
    float _1275 = 1.0 / _1173;
    float _1277 = _1249 * _1257;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1281 = _1081 + _1279;
    float _1283 = _1269 * _1273;
    float _1285 = -_1269;
    float _1287 = _1285 + 1.0;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1293;
    float _1297 = _1169 * _1287;
    float _1299 = fma(_1291, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1305 = -_1169;
    float _1307 = _1305 + 1.0;
    float _1309 = 1.0 / _1195;
    float _1311 = _1299 * _1297;
    float _1313 = fma(_1303, _1179, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1315 = fma(_1295, _1221, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1317 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1311);
    float _1319 = _1281 * _1235;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1323 = _1081 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1327 = _1081 + _1325;
    float _1329 = fma(_1313, _1283, _1317);
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1335 = _1323 * _1275;
    float _1337 = fma(_1315, _1277, _1329);
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1339;
    float _1343 = fma(_1333, _1253, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1353 = fma(_1341, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1359 = fma(_1343, _1251, _1337);
    float _1361 = fma(_1347, _1319, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1363 = _1327 * _1309;
    float _1365 = fma(_1361, _1237, _1359);
    float _1367 = fma(_1357, _1335, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1369;
    float _1373 = _1353 * _1297;
    float _1375 = fma(_1351, _1179, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1377 = fma(_1367, _1175, _1365);
    float _1379 = fma(_1371, _1363, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1381 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1373);
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1391 = fma(_1379, _1207, _1377);
    float _1393 = fma(_1385, _1221, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1395 = fma(_1375, _1283, _1381);
    float _1397 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1391);
    float _1399 = fma(_1389, _1253, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1401;
    float _1405 = fma(_1393, _1277, _1395);
    out.m_63.y = _1397;
    float _1407 = fma(_1403, _1319, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1413 = fma(_1399, _1251, _1405);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1415;
    float _1419 = fma(_1411, _1335, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1421 = fma(_1407, _1237, _1413);
    float _1423 = fma(_1417, _1363, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1425 = fma(_1419, _1175, _1421);
    float _1427 = fma(_1423, _1207, _1425);
    float _1429 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1427);
    float _1431 = precise::clamp(_1429, 0.0, 1.0);
    bool _1433 = !_1197;
    float _1451;
    if (!_1433)
    {
        float _1435 = in.m_57.x;
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1439 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[14].y, _111);
        float _1443 = _1441 * _1437;
        float _1445 = floor(_1443);
        float _1447 = -_1445;
        float _1449 = _1443 + _1447;
        _1451 = _1449;
        _1453 = true;
    }
    else
    {
        _1451 = _281;
    }
    _1453 = false;
    float _1455 = _1451;
    int _1457 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1459 = _1457;
    int _1461 = 0;
    int _1463 = _96(_1459, _1461, (*spvDescriptorSet0.support_buffer));
    float _1465 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1467 = int(_1465);
    float _1469 = in.m_57.x;
    float _1471 = in.m_57.y;
    float _1473 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1475 = int(_1473);
    float _1477 = float(_1467);
    float _1479 = 1.0 / _1477;
    float _1481 = float(uint(_1475));
    int _1483 = ~_1475;
    int _1485 = _1483 + 1;
    int _1487 = ~_1475;
    int _1489 = _1487 + 1;
    float _1491 = 1.0 / _1481;
    bool _1493 = _1475 == 0;
    int _1495 = ~_1475;
    int _1497 = _1495 + 1;
    float _1499 = _111 * _1479;
    float _1501 = trunc(_1499);
    int _1503 = int(_1501);
    int _1505 = as_type<int>(_1491) + (-2);
    float _1507 = float(uint(_1503));
    float _1509 = as_type<float>(_1505) * _1507;
    float _1511 = trunc(_1509);
    float _1513 = precise::max(_1511, 0.0);
    uint _1516 = uint(_1513);
    int _1518 = _1485 * int(_1516);
    int _1520 = _1518 + _1503;
    float _1522 = float(_1475);
    float _1524 = float(uint(_1520));
    float _1526 = as_type<float>(_1505) * _1524;
    float _1528 = trunc(_1526);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1536 = _1534 != 0;
    bool _1538 = !_1536;
    float _1540 = _1538 ? 7.345489978790283203125 : 1.0;
    float _1542 = _1540 * _1469;
    int _1544 = int(_1516) + int(_1532);
    float _1546 = floor(_1542);
    float _1548 = float(_1503);
    int _1550 = _1489 * _1544;
    int _1552 = _1550 + _1503;
    bool _1554 = _1548 >= _1522;
    bool _1556 = isnan(_1548);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan(_1522);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    bool _1566 = uint(_1552) >= uint(_1475);
    float _1568 = trunc(_1564);
    int _1570 = int(_1568);
    bool _1572 = !_1566;
    int _1574 = _1572 ? 0 : (-1);
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1578 = _1576 != 0;
    int _1580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1582 = _1580 != 0;
    int _1584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1586 = _1584 != 0;
    float _1588 = -_1546;
    float _1590 = _1542 + _1588;
    int _1592 = ~_1544;
    int _1594 = _1592 + _1574;
    int _1596 = _1594 + 1;
    float _1598 = _111 * _1522;
    float _1600 = _1590 * _1522;
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1604 = _1602 != 0;
    int _1606 = _1475 * _1596;
    int _1608 = _1606 + _1503;
    float _1610 = _1598 * _159;
    int _1612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1614 = _1612 != 0;
    float _1616 = trunc(_1600);
    int _1618 = int(_1616);
    bool _1620 = !_1582;
    int _1622 = _1620 ? 0 : 1;
    int _1624 = ~_1570;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    bool _1630 = !_1493;
    int _1632 = _1630 ? _1608 : (-1);
    int _1634 = _1475 + (-1);
    float _1636 = trunc(_1610);
    int _1638 = int(_1636);
    int _1640 = abs(_1622);
    int _1642 = _1632 * _1628;
    bool _1644 = !_1614;
    int _1646 = _1644 ? 0 : 1;
    bool _1648 = !_1586;
    int _1650 = _1648 ? 0 : 1;
    int _1652 = _1570 * _1634;
    int _1654 = _1652 + _1642;
    bool _1656 = !_1578;
    int _1658 = _1656 ? 0 : 1;
    int _1660 = abs(_1646);
    int _1662 = abs(_1658);
    int _1664 = _1618 * _1660;
    int _1666 = _1664 + _1503;
    bool _1668 = !_1604;
    int _1670 = _1668 ? 0 : 1;
    int _1672 = abs(_1650);
    int _1674 = _1654 * _1640;
    int _1676 = abs(_1670);
    int _1678 = _1638 * _1662;
    int _1680 = _1678 + _1674;
    float _1682 = in.m_65.z;
    int _1684 = ~_1475;
    int _1686 = _1684 + 1;
    int _1688 = _1666 * _1672;
    int _1690 = _1688 + _1680;
    int _1692 = _1618 * _1676;
    int _1694 = _1692 + _1690;
    float _1696 = float(uint(_1694));
    float _1698 = as_type<float>(_1505) * _1696;
    float _1700 = trunc(_1698);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    float _1706 = trunc(_1682);
    int _1708 = int(_1706);
    int _1710 = _1686 * int(_1704);
    int _1712 = _1710 + _1694;
    float _1714 = float(uint(_1712));
    float _1716 = as_type<float>(_1505) * _1714;
    float _1718 = trunc(_1716);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = int(_1704) + int(_1722);
    int _1726 = _1497 * _1724;
    int _1728 = _1726 + _1694;
    int _1730 = _1463 + (-1);
    float _1732 = float(_1730);
    float _1734 = _1431 * _1732;
    float _1736 = trunc(_1734);
    int _1738 = int(_1736);
    int _1740 = _1738;
    int _1742 = 0;
    int _1744 = _97(_1740, _1742, (*spvDescriptorSet0.support_buffer));
    int _1746 = _1708;
    int _1748 = 0;
    int _1750 = _97(_1746, _1748, (*spvDescriptorSet0.support_buffer));
    float4 _1753 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1744, _1750)), 0).xyzw;
    float _1755 = _1753.x;
    float _1757 = _1753.y;
    float _1759 = _1753.z;
    float _1761 = _1753.w;
    bool _1763 = uint(_1728) >= uint(_1475);
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1767 = _1455 + _1765;
    int _1769 = ~_1475;
    int _1771 = _1769 + 1;
    bool _1773 = !_1763;
    int _1775 = _1773 ? 0 : (-1);
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1779 = _1777 != 0;
    int _1781 = ~_1724;
    int _1783 = _1781 + _1775;
    int _1785 = _1783 + 1;
    float _1787 = float(uint(_1666));
    int _1789 = _1475 * _1785;
    int _1791 = _1789 + _1694;
    float _1793 = as_type<float>(_1505) * _1787;
    int _1795 = ~_1475;
    int _1797 = _1795 + 1;
    bool _1799 = !_1493;
    int _1801 = _1799 ? _1791 : (-1);
    float _1803 = trunc(_1793);
    float _1805 = precise::max(_1803, 0.0);
    uint _1807 = uint(_1805);
    int _1809 = _1801 >> 31;
    int _1811 = _1801 & 3;
    bool _1813 = _1811 != 0;
    int _1815 = _1809 & 3;
    int _1817 = _1801 & 3;
    bool _1819 = _1817 != 0;
    int _1821 = _1801 + _1815;
    bool _1823 = uint(_1817) > 1u;
    int _1825 = _1821 >> 2;
    int _1827 = _1797 * int(_1807);
    int _1829 = _1827 + _1666;
    bool _1831 = _1817 != 3;
    int _1833 = _1825 << 4;
    int _1835 = _1833 + 368;
    float _1837 = float(uint(_1829));
    uint _1839 = uint(int(uint(_1835) >> uint(2)));
    uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
    int _1843 = int(_1839) & 3;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[int(_1841)][_1843];
    int _1847 = int(_1839) + 1;
    uint _1849 = uint(int(uint(_1847) >> uint(2)));
    int _1851 = _1847 & 3;
    float _1853 = (*spvDescriptorSet0.vp_c9)._m0[int(_1849)][_1851];
    float _1855 = as_type<float>(_1505) * _1837;
    int _1857 = _1813 ? 0 : 1;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1861 = _1859 != 0;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1865 = _1863 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _1867 = _1835 + 8;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[int(_1879)][_1881];
    float _1885 = trunc(_1855);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    bool _1891 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1893 = isnan(_1455);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    bool _1903 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1905 = isnan(_1455);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1917 = _1915 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1919 = 1.0 / _1865;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1923 = int(_1807) + int(_1889);
    float _1925 = 1.0 / _1917;
    int _1927 = ~_1857;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    int _1933 = _1931;
    if (!_1823)
    {
        int _1935 = ~_1857;
        int _1937 = _1935 + 1;
        _1933 = _1937;
    }
    int _1939 = _1933;
    int _1941 = _1771 * _1923;
    int _1943 = _1941 + _1666;
    bool _1945 = uint(_1817) >= 2u;
    int _1947 = abs(_1939);
    bool _1949 = uint(_1943) >= uint(_1475);
    int _1951 = ~_1947;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = _1945 ? 0 : 1;
    bool _1959 = !_1949;
    int _1961 = _1959 ? 0 : (-1);
    bool _1963 = _1817 != 3;
    int _1965 = ~_1957;
    int _1967 = _1965 + 1;
    int _1969 = _1967 + 1;
    int _1971 = _1955 * as_type<int>(_1853);
    bool _1973 = !_1819;
    int _1975 = _1973 ? 0 : 1;
    int _1977 = _1969;
    if (_1831)
    {
        int _1979 = ~_1957;
        int _1981 = _1979 + 1;
        _1977 = _1981;
    }
    int _1983 = _1977;
    float _1985 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1987 = abs(_1975);
    bool _1989 = !_1963;
    int _1991 = _1989 ? 0 : (-1);
    int _1993 = abs(_1983);
    int _1995 = abs(_1991);
    int _1997 = ~_1987;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = _2001 * as_type<int>(_1845);
    int _2005 = _2003 + _1971;
    int _2007 = ~_1993;
    int _2009 = _2007 + 1;
    int _2011 = _2009 + 1;
    float _2013 = -_1921;
    float _2015 = fma(_1985, 2.0, _2013);
    int _2017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2019 = _2017 != 0;
    float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2023 = _2021 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2025 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2027 = int(_2025);
    int _2029 = ~_1995;
    int _2031 = _2029 + 1;
    int _2033 = _2031 + 1;
    int _2035 = _2011 * as_type<int>(_1875);
    int _2037 = _2035 + _2005;
    int _2039 = ~_1923;
    int _2041 = _2039 + _1961;
    int _2043 = _2041 + 1;
    float _2045 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2047 = _2033 * as_type<int>(_1883);
    int _2049 = _2047 + _2037;
    bool _2051 = !_1779;
    int _2053 = _2051 ? 0 : 1;
    int _2055 = _1475 * _2043;
    int _2057 = _2055 + _1666;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2061 = _2059 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2063 = abs(_2053);
    float _2065 = 1.0 / _2023;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2069 = ~_2063;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2077 = _2075 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2079 = fma(_2045, -2.0, _2067);
    float _2081 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2083 = _2081 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    int _2085 = abs(_2027);
    float _2087 = 1.0 / _2061;
    int _2089 = _2049 * _2073;
    float _2091 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2079);
    float _2093 = float(uint(_2085));
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2099 = 1.0 / _2077;
    int _2101 = ~_2027;
    int _2103 = _2101 + 1;
    bool _2105 = _1471 > 0.5;
    bool _2107 = _2105 && _2019;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2111 = 1.0 / _2083;
    bool _2113 = !_1493;
    int _2115 = _2113 ? _2057 : (-1);
    float _2117 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2109);
    bool _2119 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2121 = isnan(_1455);
    bool _2123 = _2119 || _2121;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2127 = _2123 || _2125;
    float _2129 = float(_2127);
    int _2131 = _2115 * _2063;
    int _2133 = _2131 + _2089;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2135;
    float _2139 = 1.0 / _2093;
    float _2141 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2141;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2151 = _2149 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2153 = _2137 * _2099;
    float _2155 = _2143 * _2087;
    bool _2157 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2159 = isnan(_1455);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = _2151 * _2065;
    float _2171 = 1.0 / _2097;
    float _2173 = _2147 * _2111;
    int _2175 = abs(_2133);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2179 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2177;
    float _2181 = float(uint(_2027));
    float _2183 = fma(_2155, _1767, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2185 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2187 = isnan(_1455);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2193 = _2189 || _2191;
    float _2195 = float(_2193);
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2201 = as_type<int>(_2139) + (-2);
    float _2203 = 1.0 / _2181;
    float _2205 = float(uint(_2175));
    float _2207 = -_2167;
    float _2209 = _2207 + 1.0;
    bool _2211 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2213 = isnan(_1455);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = _2199 * _1919;
    float _2225 = float(uint(_2133));
    float _2227 = _2195 * _2209;
    float _2229 = _2179 * _2171;
    float _2231 = as_type<float>(_2201) * _2205;
    float _2233 = -_2195;
    float _2235 = _2233 + 1.0;
    float _2237 = -_2221;
    float _2239 = _2237 + 1.0;
    bool _2241 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2243 = isnan(_1455);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2249 = _2245 || _2247;
    float _2251 = float(_2249);
    float _2253 = _2221 * _2235;
    float _2255 = _2129 * _2239;
    float _2257 = -_2129;
    float _2259 = _2257 + 1.0;
    float _2261 = trunc(_2231);
    float _2263 = precise::max(_2261, 0.0);
    uint _2265 = uint(_2263);
    float _2267 = _2251 * _2259;
    int _2269 = as_type<int>(_2203) + (-2);
    float _2271 = -_2251;
    float _2273 = _2271 + 1.0;
    bool _2275 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2277 = isnan(_1455);
    bool _2279 = _2275 || _2277;
    bool _2281 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2283 = _2279 || _2281;
    float _2285 = float(_2283);
    float _2287 = as_type<float>(_2269) * _2225;
    float _2289 = -_1901;
    float _2291 = _2289 + 1.0;
    float _2293 = _1901 * _2273;
    float _2295 = _1913 * _2291;
    float _2297 = trunc(_2287);
    float _2299 = precise::max(_2297, 0.0);
    uint _2301 = uint(_2299);
    int _2303 = ~int(_2265);
    int _2305 = _2303 + 1;
    float _2307 = -_1913;
    float _2309 = _2307 + 1.0;
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2311;
    int _2315 = _2305 * _2085;
    int _2317 = _2315 + _2175;
    float _2319 = _2285 * _2309;
    float _2321 = _2313 * _1925;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2325 = _1455 + _2323;
    float _2327 = float(uint(_2317));
    float _2329 = _2183 * _2319;
    float _2331 = -_2285;
    float _2333 = _2331 + 1.0;
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2337 = _1455 + _2335;
    int _2339 = _2103 * int(_2301);
    int _2341 = _2339 + _2133;
    float _2343 = as_type<float>(_2201) * _2327;
    float _2345 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2347 = _1455 + _2345;
    float _2349 = fma(_2333, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2329);
    float _2351 = fma(_2173, _2337, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2353 = float(uint(_2341));
    float _2355 = trunc(_2343);
    float _2357 = precise::max(_2355, 0.0);
    uint _2359 = uint(_2357);
    float _2361 = fma(_2169, _2347, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2363 = fma(_2153, _2325, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2365 = as_type<float>(_2269) * _2353;
    float _2367 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2369 = _1455 + _2367;
    float _2371 = _2153;
    if (_1861)
    {
        float _2373 = in.m_57.x;
        _2371 = _2373;
    }
    float _2375 = _2371;
    float _2377 = fma(_2361, _2295, _2349);
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2381 = _1455 + _2379;
    float _2383 = fma(_2229, _2369, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2385 = trunc(_2365);
    float _2387 = precise::max(_2385, 0.0);
    uint _2389 = uint(_2387);
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2393 = _1455 + _2391;
    float _2395 = fma(_2363, _2293, _2377);
    float _2397 = fma(_2223, _2381, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2399 = fma(_2321, _2393, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _2401 = int(_2265) + int(_2359);
    float _2403 = in.m_65.x;
    float _2405 = fma(_2351, _2267, _2395);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2409 = ~_2401;
    int _2411 = _2409 + 1;
    float _2413 = fma(_2383, _2255, _2405);
    int _2415 = ~_2027;
    int _2417 = _2415 + 1;
    float _2419 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2407);
    float _2421 = fma(_2397, _2253, _2413);
    int _2423 = int(_2301) + int(_2389);
    float _2425 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2419);
    int _2427 = _2411 * _2085;
    int _2429 = _2427 + _2175;
    bool _2431 = _2375 > 0.5;
    bool _2433 = _2431 && _1861;
    int _2435 = _2417 * _2423;
    int _2437 = _2435 + _2133;
    float _2439 = fma(_2399, _2227, _2421);
    int _2441 = _2133 ^ _2027;
    float _2443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2445 = uint(_2429) >= uint(_2085);
    float _2447 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2439);
    bool _2449 = uint(_2437) >= uint(_2027);
    float _2451 = in.m_65.y;
    bool _2453 = !_2445;
    int _2455 = _2453 ? 0 : (-1);
    float _2457 = -_111;
    float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2015);
    uint _2461 = uint(int(uint(_2441) >> uint(31)));
    float _2463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2465 = !_2449;
    float _2467 = _2465 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    out.m_67.x = _2447;
    float _2469 = as_type<float>(_2411);
    float _2471 = _2467;
    if (_1861)
    {
        _2469 = _2403;
    }
    float _2473 = _2469;
    int _2475 = ~_2455;
    int _2477 = _2401 + _2475;
    int _2479 = _2477 + 1;
    int _2481 = ~int(_2461);
    int _2483 = _2481 + 1;
    float _2485 = _2473;
    if (_2433)
    {
        float _2487 = -_2473;
        float _2489 = _2487 + 1.0;
        _2485 = _2489;
    }
    float _2491 = _2485;
    int _2493 = ~_2423;
    int _2495 = _2493 + as_type<int>(_2467);
    int _2497 = _2495 + 1;
    float _2499 = _2443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2501 = _2479 ^ _2483;
    bool _2503 = _2027 == 0;
    bool _2505 = _2027 == 0;
    int _2507 = _2027 * _2497;
    int _2509 = _2507 + _2133;
    int _2511 = ~_2483;
    int _2513 = _2511 + _2501;
    int _2515 = _2513 + 1;
    float _2517 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2519 = as_type<int>(_2491);
    if (!_1861)
    {
        _2471 = _2403;
    }
    float _2521 = _2471;
    float _2523 = _2451;
    float _2525 = _2521;
    if (_2107)
    {
        float _2527 = -_2451;
        float _2529 = _2527 + 1.0;
        _2523 = _2529;
    }
    float _2531 = _2523;
    bool _2533 = !_2503;
    int _2535 = _2533 ? _2509 : (-1);
    bool _2537 = !_2505;
    int _2539 = _2537 ? _2515 : (-1);
    if (_1861)
    {
        _2525 = _2491;
    }
    float _2541 = _2525;
    uint _2543 = as_type<uint>(half2(float2(_1761, 0.0)));
    float _2545 = float(_2535);
    float _2547 = fma(_2499, _2541, -0.5);
    uint _2549 = extract_bits(_2543, 0u, 8u);
    int _2551 = int(_2549) & 255;
    uint _2553 = extract_bits(_2543, 8u, 8u);
    int _2555 = int(_2553) & 255;
    int _2557 = _2555 << 8;
    int _2559 = _2551 | _2557;
    float _2561 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2117);
    float _2563 = float(_2539);
    float _2565 = fma(_2499, _2545, _2459);
    bool _2567 = _2559 >= 32768;
    float _2569 = fma(_2517, _2531, -0.5);
    float _2571 = -_2091;
    float _2573 = fma(_2517, _2563, _2571);
    float _2575 = fma(_2561, _2547, _2565);
    float _2577 = fma(_2425, _2569, _2573);
    int _2579 = _1738 + 1;
    float _2581 = _2575 + 0.5;
    float _2583 = _2577 + 0.5;
    int _2585 = min(_1730, _2579);
    int _2587 = _2559 + (-1024);
    int _2589 = _2587;
    if (_2567)
    {
        int _2591 = ~_2559;
        int _2593 = _2591 + 33792;
        int _2595 = _2593 + 1;
        _2589 = _2595;
    }
    int _2597 = _2589;
    int _2599 = _2597 + 30719;
    float _2601 = float(_2599);
    float _2603 = fma(_2601, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2605 = abs(_2603);
    float _2607 = -_2605;
    float _2609 = _2607 + 1.0;
    float _2611 = abs(_2603);
    float _2613 = fma(_2611, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2615 = _2603 < 0.0;
    float _2617 = float(_2615);
    int _2619 = as_type<int>(_2609) + (-218103808);
    float _2621 = abs(_2603);
    float _2623 = fma(_2621, _2613, -0.212114393711090087890625);
    bool _2625 = uint(_2619) >= 1920991232u;
    float _2627 = abs(_2603);
    float _2629 = fma(_2627, _2623, 1.570728778839111328125);
    bool _2631 = !_2625;
    float _2653;
    if (!_2631)
    {
        int _2633 = as_type<int>(_2609);
        int _2635 = as_type<int>(_2531);
        int _2637 = as_type<int>(_2491);
        int _2639 = 13056;
        int _2641;
        int _2643;
        int _2645;
        int _2647;
        int _2649;
        int _2651;
        _94(_2633, _2635, _2637, _2639, _2641, _2643, _2645, _2647, _2649, _2651, out.gl_Position, out.gl_PointSize);
        _2653 = as_type<float>(_2641);
        _2519 = _2649;
        _2655 = true;
    }
    else
    {
        float _2657 = rsqrt(_2609);
        float _2659 = _2609 * _2657;
        float _2661 = _2657 * 0.5;
        float _2663 = -_2659;
        float _2665 = 0.0 + _2663;
        float _2667 = fma(_2661, _2665, 0.5);
        float _2669 = fma(_2659, _2667, _2659);
        float _2671 = -_2669;
        float _2673 = 0.0 + _2671;
        float _2675 = fma(_2669, _2673, _2609);
        float _2677 = fma(_2661, _2675, _2669);
        _2653 = _2677;
    }
    _2655 = false;
    float _2679 = _2653;
    int _2681 = _2519;
    int _2683 = _2585;
    int _2685 = 0;
    int _2687 = _97(_2683, _2685, (*spvDescriptorSet0.support_buffer));
    int _2689 = _1708;
    int _2691 = 0;
    int _2693 = _97(_2689, _2691, (*spvDescriptorSet0.support_buffer));
    float4 _2695 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2687, _2693)), 0).xyzw;
    float _2697 = _2695.x;
    float _2699 = _2695.y;
    float _2701 = _2695.z;
    float _2703 = _2695.w;
    float _2705 = _2629 * _2679;
    float _2707 = _2617 * 2.0;
    float _2709 = _2601 * 3.883221149444580078125;
    float _2711 = floor(_1734);
    float _2713 = -_2707;
    float _2715 = fma(_2705, _2713, _2705);
    float _2717 = _2709 * 0.15915493667125701904296875;
    float _2719 = fma(_2617, 3.1415927410125732421875, _2715);
    float _2721 = _2717 * 6.283185482025146484375;
    float _2723 = cos(_2721);
    float _2725 = _2719 * 0.15915493667125701904296875;
    float _2727 = _2725 * 6.283185482025146484375;
    float _2729 = sin(_2727);
    float _2731 = -_2711;
    float _2733 = _1734 + _2731;
    float _2735 = _2717 * 6.283185482025146484375;
    float _2737 = sin(_2735);
    float _2739 = _2729 * _2723;
    float _2741 = _2729 * _2737;
    uint _2743 = as_type<uint>(half2(float2(_2703, 0.0)));
    float _2745 = -_1755;
    float _2747 = _2745 + _2697;
    float _2749 = -_1757;
    float _2751 = _2749 + _2699;
    float _2753 = -_1759;
    float _2755 = _2753 + _2701;
    uint _2757 = extract_bits(_2743, 0u, 8u);
    int _2759 = int(_2757) & 255;
    uint _2761 = extract_bits(_2743, 8u, 8u);
    int _2763 = int(_2761) & 255;
    int _2765 = _2763 << 8;
    int _2767 = _2759 | _2765;
    float _2769 = fma(_2733, _2747, _1755);
    float _2771 = fma(_2733, _2751, _1757);
    float _2773 = fma(_2733, _2755, _1759);
    bool _2775 = _2767 >= 32768;
    int _2777 = _2767 + (-1024);
    int _2779 = _2777;
    if (_2775)
    {
        int _2781 = ~_2767;
        int _2783 = _2781 + 33792;
        int _2785 = _2783 + 1;
        _2779 = _2785;
    }
    int _2787 = _2779;
    int _2789 = _2787 + 30719;
    float _2791 = float(_2789);
    float _2793 = fma(_2791, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2795 = abs(_2793);
    float _2797 = -_2795;
    float _2799 = _2797 + 1.0;
    float _2801 = abs(_2793);
    float _2803 = fma(_2801, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2805 = _2793 < 0.0;
    float _2807 = float(_2805);
    int _2809 = as_type<int>(_2799) + (-218103808);
    float _2811 = abs(_2793);
    float _2813 = fma(_2811, _2803, -0.212114393711090087890625);
    bool _2815 = uint(_2809) >= 1920991232u;
    float _2817 = abs(_2793);
    float _2819 = fma(_2817, _2813, 1.570728778839111328125);
    bool _2821 = !_2815;
    float _2843;
    if (!_2821)
    {
        int _2823 = as_type<int>(_2799);
        int _2825 = as_type<int>(_2697);
        int _2827 = _2681;
        int _2829 = 13952;
        int _2831;
        int _2833;
        int _2835;
        int _2837;
        int _2839;
        int _2841;
        _94(_2823, _2825, _2827, _2829, _2831, _2833, _2835, _2837, _2839, _2841, out.gl_Position, out.gl_PointSize);
        _2843 = as_type<float>(_2831);
        _2845 = true;
    }
    else
    {
        float _2847 = rsqrt(_2799);
        float _2849 = _2799 * _2847;
        float _2851 = _2847 * 0.5;
        float _2853 = -_2849;
        float _2855 = 0.0 + _2853;
        float _2857 = fma(_2851, _2855, 0.5);
        float _2859 = fma(_2849, _2857, _2849);
        float _2861 = -_2859;
        float _2863 = 0.0 + _2861;
        float _2865 = fma(_2859, _2863, _2799);
        float _2867 = fma(_2851, _2865, _2859);
        _2843 = _2867;
    }
    _2845 = false;
    float _2869 = _2843;
    float _2871 = in.m_57.x;
    float _2873 = in.m_57.y;
    float _2875 = in.m_57.z;
    float _2877 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2879 = log2(_2877);
    float _2881 = _277 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2883 = _277 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2885 = _277 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2887 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2881);
    float _2889 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2883);
    float _2891 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2885);
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2895 = _2893 != 0;
    int _2897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2899 = _2897 != 0;
    int _2901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2903 = _2901 != 0;
    float _2905 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2887);
    float _2907 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2891);
    float _2909 = _2819 * _2869;
    float _2911 = _2905 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2913 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2915 = _2907 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2917 = _2879 * _111;
    float _2919 = _659 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2921 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2923 = _2791 * 3.883221149444580078125;
    float _2925 = -_2603;
    float _2927 = _2925 + _2793;
    float _2929 = exp2(_2917);
    float _2931 = _2875 * 2.0;
    float _2933 = _2871 * 2.0;
    float _2935 = _2873 * 2.0;
    float _2937 = _2875 + _2871;
    float _2939 = _2923 * 0.15915493667125701904296875;
    float _2941 = fma(_2733, _2927, _2603);
    float _2943 = floor(_2931);
    float _2945 = _2937 + (-1.0);
    float _2947 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2889);
    float _2949 = _2947 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2951 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2953 = isnan(1.0);
    bool _2955 = _2951 || _2953;
    bool _2957 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2959 = _2955 || _2957;
    float _2961 = floor(_2933);
    bool _2963 = _2943 > 0.0;
    float _2965 = floor(_2935);
    bool _2967 = _2943 >= 0.0;
    bool _2969 = isnan(_2943);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan(0.0);
    bool _2975 = _2971 || _2973;
    int _2977 = _2975 ? 0 : 1;
    bool _2979 = _2961 >= 0.0;
    bool _2981 = isnan(_2961);
    bool _2983 = _2979 || _2981;
    bool _2985 = isnan(0.0);
    bool _2987 = _2983 || _2985;
    float _2989 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _2991 = ~_2977;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    float _2997 = _2873 + _2871;
    int _2999 = _2987 ? 0 : 1;
    int _3001 = _2995;
    float _3003 = _2941;
    if (!_2963)
    {
        int _3005 = ~_2977;
        int _3007 = _3005 + 1;
        _3001 = _3007;
    }
    int _3009 = _3001;
    float _3011 = _2997 + (-1.0);
    bool _3013 = !_2895;
    int _3015 = _3013 ? 0 : 1;
    bool _3017 = _2961 > 0.0;
    float _3019 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3021 = 1.0 + _3019;
    bool _3023 = _2965 > 0.0;
    bool _3025 = _2965 >= 0.0;
    bool _3027 = isnan(_2965);
    bool _3029 = _3025 || _3027;
    bool _3031 = isnan(0.0);
    bool _3033 = _3029 || _3031;
    float _3035 = -_2929;
    float _3037 = _3035 + 1.0;
    int _3039 = abs(_3015);
    float _3041 = 1.0 / _3021;
    float _3043 = in.m_69.x;
    float _3045 = in.m_69.y;
    float _3047 = in.m_69.z;
    float _3049 = float(_3009);
    float _3051 = fma(_3011, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3053 = float(_3039);
    int _3055 = _3033 ? 0 : 1;
    bool _3057 = !_2903;
    int _3059 = _3057 ? 0 : 1;
    float _3061 = _3053 * _3049;
    bool _3063 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3065 = isnan(0.0);
    bool _3067 = _3063 || _3065;
    bool _3069 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3071 = _3067 || _3069;
    float _3073 = _2871 + (-0.5);
    int _3075 = ~_3055;
    int _3077 = _3075 + 1;
    int _3079 = _3077 + 1;
    float _3081 = _3061 * (-2.0);
    int _3083 = _3079;
    if (!_3023)
    {
        int _3085 = ~_3055;
        int _3087 = _3085 + 1;
        _3083 = _3087;
    }
    int _3089 = _3083;
    float _3091 = -_2949;
    float _3093 = _3091 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _3095 = abs(_3059);
    float _3097 = fma(_3051, _3081, _3051);
    float _3099 = _3071 ? _3037 : 0.0;
    float _3101 = -_2915;
    float _3103 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3105 = float(_3095);
    float _3107 = float(_3089);
    if (_2959)
    {
        float _3109 = _3099 * _3041;
        _121 = _3109;
    }
    float _3111 = _121;
    int _3113 = ~_2999;
    int _3115 = _3113 + 1;
    int _3117 = _3115 + 1;
    float _3119 = fma(_3081, _3043, _3043);
    int _3121 = _3117;
    if (!_3017)
    {
        int _3123 = ~_2999;
        int _3125 = _3123 + 1;
        _3121 = _3125;
    }
    int _3127 = _3121;
    float _3129 = _3105 * _3107;
    bool _3131 = !_2899;
    int _3133 = _3131 ? 0 : 1;
    float _3135 = fma(_3073, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3119);
    float _3137 = -_2911;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3141 = _3093 * _3093;
    int _3143 = abs(_3133);
    float _3145 = fma(_3097, _3111, _3135);
    float _3147 = _3129 * (-2.0);
    float _3149 = fma(_3139, _3139, _3141);
    float _3151 = _2875 + (-0.5);
    float _3153 = _3145 * 0.15915493667125701904296875;
    float _3155 = float(_3143);
    float _3157 = fma(_3103, _3103, _3149);
    float _3159 = float(_3127);
    float _3161 = _2875 + _2873;
    float _3163 = fma(_3147, _3047, _3047);
    float _3165 = rsqrt(_3157);
    float _3167 = _2873 + (-0.5);
    float _3169 = _3155 * _3159;
    float _3171 = _3161 + (-1.0);
    float _3173 = fma(_3151, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3163);
    float _3175 = _3169 * (-2.0);
    float _3177 = fma(_2989, _3147, _2989);
    float _3179 = fma(_3171, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3181 = _3153 * 6.283185482025146484375;
    float _3183 = sin(_3181);
    float _3185 = fma(_3175, _3045, _3045);
    float _3187 = fma(_3177, _3111, _3173);
    float _3189 = fma(_3179, _3175, _3179);
    float _3191 = _2807 * 2.0;
    float _3193 = fma(_3167, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3185);
    float _3195 = _3187 * 0.15915493667125701904296875;
    bool _3197 = _2771 != 0.0;
    bool _3199 = isnan(_2771);
    bool _3201 = _3197 || _3199;
    bool _3203 = isnan(0.0);
    bool _3205 = _3201 || _3203;
    float _3207 = _3153 * 6.283185482025146484375;
    float _3209 = cos(_3207);
    float _3211 = fma(_3189, _3111, _3193);
    float _3213 = _3139 * _3165;
    float _3215 = -_3191;
    float _3217 = fma(_2909, _3215, _2909);
    float _3219 = _3103 * _3165;
    float _3221 = _3211 * 0.15915493667125701904296875;
    float _3223 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3225 = _3213 * _3223;
    float _3227 = _3093 * _3165;
    float _3229 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3231 = _3219 * _3229;
    float _3233 = _3195 * 6.283185482025146484375;
    float _3235 = sin(_3233);
    float _3237 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3239 = -_3225;
    float _3241 = fma(_3219, _3237, _3239);
    float _3243 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3245 = _3227 * _3243;
    float _3247 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3249 = -_3231;
    float _3251 = fma(_3227, _3247, _3249);
    float _3253 = _3241 * _3241;
    float _3255 = fma(_2807, 3.1415927410125732421875, _3217);
    bool _3257 = _2769 == 0.0;
    bool _3259 = !_3205;
    bool _3261 = _3257 && _3259;
    float _3263 = _3195 * 6.283185482025146484375;
    float _3265 = cos(_3263);
    float _3267 = fma(_3251, _3251, _3253);
    float _3269 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2771);
    float _3271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2769);
    float _3273 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2773);
    bool _3275 = _2773 == 0.0;
    bool _3277 = _3275 && _3261;
    float _3279 = _2913 * _3269;
    float _3281 = _2919 * _3271;
    float _3283 = _3221 * 6.283185482025146484375;
    float _3285 = cos(_3283);
    float _3287 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3289 = -_3245;
    float _3291 = fma(_3213, _3287, _3289);
    float _3293 = _2921 * _3273;
    float _3295 = _3209 * _3235;
    float _3297 = fma(_3291, _3291, _3267);
    float _3299 = _3183 * _3235;
    float _3301 = _3221 * 6.283185482025146484375;
    float _3303 = sin(_3301);
    float _3305 = _3209 * _3265;
    if (!_3277)
    {
        float _3307 = fma(_2771, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2941);
        _3003 = _3307;
    }
    float _3309 = _3003;
    float _3311 = rsqrt(_3297);
    float _3313 = _3183 * _3265;
    float _3315 = _3183 * _3285;
    float _3317 = _3285 * _3235;
    float _3319 = _3285 * _3265;
    float _3321 = _3209 * _3285;
    float _3323 = _3315 * _3279;
    float _3325 = fma(_3303, _3299, _3305);
    float _3327 = -_3295;
    float _3329 = fma(_3303, _3313, _3327);
    float _3331 = -_3313;
    float _3333 = fma(_3303, _3295, _3331);
    float _3335 = fma(_3303, _3305, _3299);
    float _3337 = _3325 * _3279;
    float _3339 = -_3303;
    float _3341 = fma(_3339, _3281, _3323);
    float _3343 = _3251 * _3311;
    float _3345 = _3241 * _3311;
    float _3347 = _3291 * _3311;
    float _3349 = fma(_3317, _3281, _3337);
    float _3351 = _3329 * _3279;
    float _3353 = _3219 * _3345;
    float _3355 = _3227 * _3343;
    float _3357 = fma(_3333, _3293, _3349);
    float _3359 = fma(_3319, _3281, _3351);
    float _3361 = -_3353;
    float _3363 = fma(_3227, _3347, _3361);
    float _3365 = -_3355;
    float _3367 = fma(_3213, _3345, _3365);
    float _3369 = _3255 * 0.15915493667125701904296875;
    float _3371 = fma(_3335, _3293, _3359);
    float _3373 = _3363 * _3357;
    float _3375 = _3367 * _3357;
    float _3377 = fma(_3321, _3293, _3341);
    float _3379 = _2939 * 6.283185482025146484375;
    float _3381 = cos(_3379);
    float _3383 = fma(_3343, _3371, _3373);
    float _3385 = fma(_3347, _3371, _3375);
    float _3387 = fma(_3213, _3377, _3383);
    float _3389 = fma(_3219, _3377, _3385);
    float _3391 = _3369 * 6.283185482025146484375;
    float _3393 = sin(_3391);
    float _3395 = _2911 + _3387;
    float _3397 = _2915 + _3389;
    float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3401 = _3395 + _3399;
    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3405 = _3397 + _3403;
    float _3407 = _2939 * 6.283185482025146484375;
    float _3409 = sin(_3407);
    float _3411 = _3401 * _3401;
    float _3413 = _3405 * _3405;
    float _3415 = _3411 + _3413;
    float _3417 = -_2739;
    float _3419 = fma(_3393, _3381, _3417);
    float _3421 = fma(_2733, _3419, _2739);
    float _3423 = -_2741;
    float _3425 = fma(_3393, _3409, _3423);
    float _3427 = _3213 * _3347;
    float _3429 = _3421;
    float _3431 = _3335;
    float _3433 = _3411;
    float _3435 = _3413;
    float _3437 = _3395;
    float _3439 = _3397;
    float _3441 = _3321;
    if (!_3277)
    {
        float _3443 = fma(_2769, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3421);
        _3429 = _3443;
    }
    float _3445 = _3429;
    float _3447 = _3325 * _3363;
    float _3449 = fma(_2733, _3425, _2741);
    float _3451 = -_3427;
    float _3453 = fma(_3219, _3343, _3451);
    float _3455 = sqrt(_3415);
    float _3457 = _3325 * _3367;
    float _3459 = _3449;
    if (!_3277)
    {
        float _3461 = fma(_2773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3449);
        _3459 = _3461;
    }
    float _3463 = _3459;
    float _3465 = _3325 * _3453;
    float _3467 = _3453 * _3357;
    float _3469 = fma(_3329, _3343, _3447);
    float _3471 = fma(_3329, _3347, _3457);
    float _3473 = fma(_3329, _3345, _3465);
    float _3475 = _3317 * _3367;
    float _3477 = _3333 * _3367;
    float _3479 = _3317 * _3363;
    float _3481 = fma(_3345, _3371, _3467);
    float _3483 = _3317 * _3453;
    float _3485 = _3333 * _3363;
    float _3487 = _3333 * _3453;
    float _3489 = fma(_3319, _3343, _3479);
    bool _3491 = _3455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3493 = fma(_3227, _3377, _3481);
    float _3495 = fma(_3319, _3345, _3483);
    float _3497 = fma(_3335, _3345, _3487);
    float _3499 = fma(_3315, _3213, _3469);
    float _3501 = _2949 + _3493;
    float _3503 = fma(_3319, _3347, _3475);
    float _3505 = fma(_3335, _3343, _3485);
    float _3507 = fma(_3335, _3347, _3477);
    float _3509 = fma(_3315, _3227, _3473);
    float _3511 = fma(_3315, _3219, _3471);
    if (!_3491)
    {
        _3431 = _3501;
    }
    float _3513 = _3431;
    bool _3515 = !_3491;
    float _3517 = _3513;
    if (!_3515)
    {
        float _3519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3521 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3523 = _3455 + _3521;
        float _3525 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3527 = rsqrt(_3415);
        float _3529 = _3523 * _3519;
        float _3531 = _3529 * 0.15915493667125701904296875;
        float _3533 = _3531 * 6.283185482025146484375;
        float _3535 = sin(_3533);
        float _3537 = _3531 * 6.283185482025146484375;
        float _3539 = cos(_3537);
        float _3541 = fma(_3535, _3525, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3543 = _3527 * _3541;
        float _3545 = _3539 + (-1.0);
        float _3547 = _3401 * _3543;
        float _3549 = _3405 * _3543;
        float _3551 = _3545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3553 = _3547 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3555 = _3547 * _3547;
        float _3557 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3559 = fma(_3501, _3539, _3551);
        float _3561 = _3549 * _3549;
        _3517 = _3559;
        _3433 = _3555;
        _3435 = _3561;
        _3437 = _3553;
        _3439 = _3557;
    }
    float _3563 = _3517;
    float _3565 = _3433;
    float _3567 = _3435;
    float _3569 = _3437;
    float _3571 = _3439;
    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3575 = _3563 + _3573;
    float _3577 = -_3303;
    float _3579 = fma(_3577, _3219, _3503);
    float _3581 = fma(_3321, _3219, _3507);
    float _3583 = -_3303;
    float _3585 = fma(_3583, _3213, _3489);
    float _3587 = fma(_3575, _3575, _3565);
    float _3589 = -_3303;
    float _3591 = fma(_3589, _3227, _3495);
    float _3593 = _3499 * _3309;
    float _3595 = _3509 * _3309;
    float _3597 = _3587 + _3567;
    float _3599 = _3511 * _3309;
    float _3601 = fma(_3321, _3213, _3505);
    float _3603 = fma(_3585, _3445, _3593);
    float _3605 = sqrt(_3597);
    float _3607 = fma(_3321, _3227, _3497);
    float _3609 = fma(_3591, _3445, _3595);
    float _3611 = fma(_3579, _3445, _3599);
    float _3613 = fma(_3601, _3463, _3603);
    out.m_71.x = _2581;
    out.m_71.y = _2583;
    float _3615 = fma(_3607, _3463, _3609);
    float _3617 = fma(_3581, _3463, _3611);
    out.m_73.x = _3613;
    out.m_73.y = _3615;
    out.m_73.z = _3617;
    bool _3619 = _3605 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3621 = isnan(_3605);
    bool _3623 = _3619 || _3621;
    bool _3625 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3627 = _3623 || _3625;
    if (!_3627)
    {
        _3441 = 1.0;
    }
    float _3629 = _3441;
    bool _3631 = !_3627;
    float _3633 = _3629;
    if (!_3631)
    {
        bool _3635 = _3605 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3637 = isnan(_3605);
        bool _3639 = _3635 || _3637;
        bool _3641 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3643 = _3639 || _3641;
        if (!_3643)
        {
            float _3645 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3647 = _3605 + _3645;
            float _3649 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3651 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3649;
            float _3653 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3655 = _3653 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3657 = 1.0 / _3651;
            float _3659 = _3647 * _3657;
            float _3661 = fma(_3659, _3655, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3633 = _3661;
            _3663 = true;
        }
        else
        {
            bool _3665 = _3605 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3667 = isnan(_3605);
            bool _3669 = _3665 || _3667;
            bool _3671 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3673 = _3669 || _3671;
            if (!_3673)
            {
                float _3675 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3677 = _3605 + _3675;
                float _3679 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3681 = _3679 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3683 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3685 = _3683 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3687 = 1.0 / _3681;
                float _3689 = _3677 * _3687;
                float _3691 = fma(_3689, _3685, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3633 = _3691;
                _3663 = true;
            }
            else
            {
                _3633 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3663 = false;
    float _3693 = _3633;
    float _3695 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3697 = _3563 + _3695;
    float _3699 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3701 = _3569 + _3699;
    float _3703 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3705 = _3571 + _3703;
    float _3707 = fma(_3697, _3693, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3709 = fma(_3701, _3693, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3711 = fma(_3705, _3693, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3715 = _3707 + _3713;
    float _3717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3719 = _3709 + _3717;
    float _3721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3723 = _3711 + _3721;
    float _3725 = _3715 * _3715;
    float _3727 = fma(_3719, _3719, _3725);
    float _3729 = fma(_3723, _3723, _3727);
    float _3731 = rsqrt(_3729);
    float _3733 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3735 = _3719 * _3733;
    float _3737 = _3723 * _3733;
    float _3739 = _3735 * _3735;
    float _3741 = _3737 * _3737;
    float _3743 = _3739 + _3741;
    float _3745 = sqrt(_3743);
    bool _3747 = _3745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3751 = _3745 + _3749;
    float _3753 = _3727;
    float _3755 = _3743;
    float _3757 = _3751;
    float _3759 = _3715;
    float _3761 = _3733;
    float _3763 = _3735;
    if (_3747)
    {
        float _3765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3753 = _3765;
    }
    float _3767 = _3753;
    if (_3747)
    {
        float _3769 = rsqrt(_3743);
        _3755 = _3769;
    }
    float _3771 = _3755;
    float _3773 = _3767;
    if (_3747)
    {
        float _3775 = _3751 * _3767;
        _3757 = _3775;
    }
    float _3777 = _3757;
    if (_3747)
    {
        float _3779 = _3777 * 0.15915493667125701904296875;
        _3773 = _3779;
    }
    float _3781 = _3773;
    float _3783 = _3723;
    float _3785 = _3781;
    if (_3747)
    {
        float _3787 = _3781 * 6.283185482025146484375;
        float _3789 = sin(_3787);
        _3783 = _3789;
    }
    float _3791 = _3783;
    float _3793 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3795 = precise::max(0.0, _3793);
    float _3797 = _3731;
    float _3799 = _3795;
    if (_3747)
    {
        float _3801 = _3781 * 6.283185482025146484375;
        float _3803 = cos(_3801);
        _3797 = _3803;
    }
    float _3805 = _3797;
    float _3807 = -_3733;
    float _3809 = -_3795;
    float _3811 = fma(_3715, _3807, _3809);
    if (_3747)
    {
        float _3813 = _3811 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3759 = _3813;
    }
    float _3815 = _3759;
    float _3817 = _3815;
    float _3819 = _3791;
    if (_3747)
    {
        float _3821 = fma(_3791, _3815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3817 = _3821;
    }
    float _3823 = _3817;
    float _3825 = _3823;
    if (!_3747)
    {
        _3819 = _3811;
    }
    float _3827 = _3819;
    float _3829 = _3827;
    float _3831 = _3805;
    if (_3747)
    {
        float _3833 = _3805 + (-1.0);
        _3799 = _3833;
    }
    float _3835 = _3799;
    float _3837 = _3835;
    if (_3747)
    {
        float _3839 = _3771 * _3823;
        _3761 = _3839;
    }
    float _3841 = _3761;
    if (!_3747)
    {
        _3825 = _3739;
    }
    float _3843 = _3825;
    float _3845 = sqrt(_3729);
    float _3847 = _3843;
    if (_3747)
    {
        float _3849 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3785 = _3849;
    }
    float _3851 = _3785;
    if (_3747)
    {
        float _3853 = _3735 * _3841;
        _3763 = _3853;
    }
    float _3855 = _3763;
    if (!_3747)
    {
        _3837 = _3737;
    }
    float _3857 = _3837;
    float _3859 = _3857;
    if (_3747)
    {
        float _3861 = _3737 * _3841;
        _3859 = _3861;
    }
    float _3863 = _3859;
    if (_3747)
    {
        float _3865 = fma(_3811, _3805, _3851);
        _3829 = _3865;
    }
    float _3867 = _3829;
    if (_3747)
    {
        float _3869 = _3855 * _3855;
        _3847 = _3869;
    }
    float _3871 = _3847;
    if (!_3747)
    {
        _3831 = _3741;
    }
    float _3873 = _3831;
    float _3875 = _3873;
    if (_3747)
    {
        float _3877 = _3863 * _3863;
        _3875 = _3877;
    }
    float _3879 = _3875;
    float _3881 = fma(_3867, _3867, _3871);
    float _3883 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3885 = _3881 + _3879;
    float _3887 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3891 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3889);
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3897 = rsqrt(_3885);
    float _3899 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3887);
    float _3901 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3903 = -_3893;
    float _3905 = _3903 + 1.0;
    float _3907 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3883);
    float _3909 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3899);
    float _3911 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3913 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3901);
    float _3915 = abs(_3905);
    float _3917 = log2(_3915);
    float _3919 = _3909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3921 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3911);
    float _3923 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3913);
    float _3925 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3927 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3921);
    float _3929 = _3923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3931 = _3897 * _3855;
    float _3933 = -_3925;
    float _3935 = fma(_3933, _3895, 1.0);
    float _3937 = _3927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3939 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3941 = _3897 * _3867;
    float _3943 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3945 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3907);
    float _3947 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3939);
    float _3949 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3951 = _3897 * _3863;
    float _3953 = -_3943;
    float _3955 = fma(_3941, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3953);
    float _3957 = _3945 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3959 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3947);
    float _3961 = log2(_3935);
    float _3963 = -_3951;
    float _3965 = fma(_3963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3955);
    float _3967 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3969 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3959);
    float _3971 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3973 = fma(_3965, -0.5, 0.5);
    float _3975 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3967);
    float _3977 = fma(_3965, 0.5, 0.5);
    float _3979 = exp2(_3949);
    float _3981 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3971);
    float _3983 = _3941 + 1.0;
    float _3985 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3975);
    float _3987 = fma(_3977, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3989 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3981);
    float _3991 = 1.0 / _3969;
    float _3993 = fma(_3977, _3987, -0.212114393711090087890625);
    float _3995 = fma(_3977, _3993, 1.570728778839111328125);
    float _3997 = sqrt(_3973);
    float _3999 = -_3941;
    float _4001 = fma(_3979, _3983, _3999);
    float _4003 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3985);
    float _4005 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3989);
    float _4007 = _3961 * 0.693147182464599609375;
    float _4009 = fma(_4001, 0.5, 0.5);
    float _4011 = _4003 * _3991;
    float _4013 = _4005 * _3991;
    float _4015 = _4007 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4017 = fma(_4011, 0.5, 0.5);
    float _4019 = fma(_4013, -0.5, 0.5);
    float _4021 = _3997 * 0.636619746685028076171875;
    float3 _10038 = float3(_4017, _4019, _4015);
    float _4023 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10038, float3(0.0), isnan(_10038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10038, float3(0.0), isnan(_10038)), level(0.0)).x;
    float3 _10049 = float3(_4017, _4019, _4015);
    float4 _4025 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10049, float3(0.0), isnan(_10049)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10049, float3(0.0), isnan(_10049)), level(0.0)).xyzw;
    float _4027 = _4025.x;
    float _4029 = _4025.y;
    float _4031 = _4025.z;
    float _4033 = _4025.w;
    float _4035 = -_3995;
    float _4037 = fma(_4021, _4035, 1.0);
    float2 _10070 = float2(_4037, _4009);
    float3 _4041 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10070, float2(0.0), isnan(_10070)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10070, float2(0.0), isnan(_10070)), level(0.0)).xyz;
    float _4043 = _4041.x;
    float _4045 = _4041.y;
    float _4047 = _4041.z;
    float _4049 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4051 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2911;
    out.m_75.y = _2949;
    out.m_75.z = _2915;
    float _4053 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4051);
    float _4055 = exp2(_4049);
    out.m_77.x = _3709;
    out.m_77.y = _3707;
    out.m_77.z = _3711;
    float _4057 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4053);
    float _4059 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4057);
    float _4061 = _4059 + _3969;
    out.gl_Position.x = _4003;
    out.gl_Position.y = _4005;
    out.gl_Position.z = _4059;
    out.gl_Position.w = _3969;
    float _4063 = _4061 * 0.5;
    float _4065 = -_4055;
    float _4067 = _4065 + 1.0;
    float _4069 = _4067 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _4063;
    out.m_79.w = _3969;
    float _4071 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4073 = -_4069;
    float _4075 = _4073 + 1.0;
    out.m_53.x = _4071;
    float _4077 = _4069 * _4023;
    float _4079 = _4033 * _4077;
    float _4081 = _4047 * _4077;
    float _4083 = fma(_4043, _4079, _4027);
    float _4085 = fma(_4045, _4079, _4029);
    float _4087 = _4033 * _4075;
    float _4089 = fma(_4033, _4081, _4031);
    out.m_81.x = _4083;
    out.m_81.y = _4085;
    out.m_81.z = _4089;
    out.m_81.w = _4087;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3663 = false;
    bool _2845 = false;
    bool _2655 = false;
    bool _1453 = false;
    bool _1079 = false;
    bool _905 = false;
    bool _693 = false;
    bool _519 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = in.m_48.w;
    float _105 = trunc(_101);
    int _107 = int(_105);
    float _109 = -_103;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = as_type<float>(_107);
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4158 = as_type<float>(_129);
        out.gl_Position.z = _4158;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _133 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_103);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_53.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4213 = as_type<float>(_155);
        out.gl_Position.z = _4213;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = in.m_55.w;
    float _159 = 1.0 / _143;
    float _161 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_48.x;
    float _175 = in.m_48.y;
    float _177 = in.m_48.z;
    float _179 = in.m_46.x;
    float _181 = in.m_46.y;
    float _183 = in.m_46.z;
    float _185 = 0.0;
    float _187 = _161;
    if (!_171)
    {
        float _189 = _161 * _161;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _193;
    if (!_171)
    {
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    bool _201 = !_171;
    float _203 = _199;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _161 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _161);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_171;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _161 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _187 = _257;
    }
    float _259 = _187;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _263 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = fma(_259, _173, _263);
    float _271 = fma(_259, _175, _265);
    float _273 = fma(_259, _177, _267);
    float _275 = fma(_269, _157, _179);
    float _277 = fma(_271, _157, _181);
    float _279 = fma(_273, _157, _183);
    float _281 = _111 * _159;
    bool _283 = !_261;
    float _301;
    if (!_283)
    {
        float _285 = in.m_57.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        _301 = _281;
    }
    _303 = false;
    float _305 = _301;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _305 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _305 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _327;
    float _331 = 1.0 / _321;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _335 = 1.0 / _329;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = 1.0 / _325;
    float _343 = _309 * _331;
    bool _345 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _347 = isnan(_305);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = fma(_339, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_359, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _365 = _313 * _335;
    bool _367 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_305);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -_355;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _383;
    float _387 = _377 * _381;
    float _389 = fma(_385, _343, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _391 = _317 * _341;
    bool _393 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _395 = isnan(_305);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -_377;
    float _407 = _405 + 1.0;
    bool _409 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _411 = isnan(_305);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = -_403;
    float _431 = _429 + 1.0;
    float _433 = _403 * _407;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = fma(_427, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = _419 * _431;
    float _443 = -_419;
    float _445 = _443 + 1.0;
    float _447 = fma(_437, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _449 = fma(_423, _391, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _451 = _361 * _441;
    float _453 = _363 * _441;
    float _455 = _389 * _441;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].z, _455);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _467;
    float _471 = fma(_439, _433, _457);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _473;
    float _477 = fma(_465, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_469, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_447, _433, _459);
    float _483 = fma(_475, _365, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _485 = fma(_449, _433, _461);
    float _487 = fma(_477, _387, _471);
    float _489 = fma(_479, _387, _481);
    float _491 = fma(_483, _387, _485);
    float _493 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[146].x, _487);
    float _495 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[146].y, _489);
    float _497 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[146].z, _491);
    bool _499 = !_333;
    float _517;
    if (!_499)
    {
        float _501 = in.m_57.x;
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _281;
    }
    _519 = false;
    float _521 = _517;
    float _523 = in.m_55.x;
    float _525 = in.m_55.y;
    float _527 = in.m_55.z;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _531 = _521 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _533;
    bool _537 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _539 = 1.0 / _535;
    float _541 = _495 * _525;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _547 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _549 = isnan(_521);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _497 * _527;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _563 = _521 + _561;
    float _565 = 1.0 / _545;
    bool _567 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _569 = isnan(_521);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = _531 * _539;
    bool _581 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _583 = isnan(_521);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -_557;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _597;
    float _601 = _591 * _595;
    float _603 = -_591;
    float _605 = _603 + 1.0;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _611;
    float _615 = fma(_599, _579, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _617 = _577 * _605;
    float _619 = fma(_609, _579, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _621 = fma(_613, _579, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _623 = _563 * _565;
    float _625 = _615 * _617;
    float _627 = _619 * _617;
    float _629 = _621 * _617;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _643 = -_577;
    float _645 = _643 + 1.0;
    float _647 = fma(_633, _623, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _649 = fma(_637, _623, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _651 = fma(_641, _623, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _653 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[107].x, _627);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[107].y, _625);
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[107].z, _629);
    float _659 = _493 * _523;
    float _661 = fma(_647, _601, _653);
    float _663 = fma(_649, _601, _655);
    float _665 = fma(_651, _601, _657);
    float _667 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[109].x, _661);
    float _669 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[109].y, _663);
    float _671 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[109].z, _665);
    bool _673 = !_537;
    float _691;
    if (!_673)
    {
        float _675 = in.m_57.x;
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _679 = _675 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        _691 = _281;
    }
    _693 = false;
    float _695 = _691;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _699 = _695 + _697;
    float _701 = _667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _711 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _713 = isnan(_695);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _723;
    float _727 = 1.0 / _705;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _733 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _735 = isnan(_695);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _751 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _753 = isnan(_695);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _765 = 1.0 / _709;
    float _767 = -_743;
    float _769 = _767 + 1.0;
    bool _771 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _773 = _721 * _769;
    float _775 = _725 * _727;
    bool _777 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _779 = isnan(_695);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -_721;
    float _791 = _789 + 1.0;
    float _793 = 1.0 / _731;
    float _795 = fma(_775, _699, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _797;
    float _801 = _787 * _791;
    float _803 = -_787;
    float _805 = _803 + 1.0;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _811 = 1.0 / _749;
    float _813 = _761 * _805;
    float _815 = _809 * _765;
    float _817 = -_761;
    float _819 = _817 + 1.0;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _823 = _695 + _821;
    float _825 = _795 * _813;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = _695 + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _835 = _799 * _793;
    bool _837 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _839 = isnan(_695);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = fma(_815, _829, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _851 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[115].x, _825);
    float _853 = fma(_835, _823, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _857 = _695 + _855;
    float _859 = -_847;
    float _861 = _859 + 1.0;
    float _863 = fma(_849, _801, _851);
    float _865 = _833 * _811;
    float _867 = _743 * _861;
    float _869 = fma(_853, _773, _863);
    float _871 = fma(_865, _857, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _873 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = fma(_871, _867, _869);
    float _877 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[119].x, _875);
    float _881 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _879 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _877;
    out.m_59.y = _873;
    out.m_59.z = _881;
    out.m_59.w = _883;
    bool _885 = !_771;
    float _903;
    if (!_885)
    {
        float _887 = in.m_57.x;
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _891 = _887 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _895 = _893 * _889;
        float _897 = floor(_895);
        float _899 = -_897;
        float _901 = _895 + _899;
        _903 = _901;
        _905 = true;
    }
    else
    {
        _903 = _281;
    }
    _905 = false;
    float _907 = _903;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _911 = _907 + _909;
    bool _913 = _907 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _915 = isnan(_907);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _927 = _907 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _929;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _937 = 1.0 / _931;
    bool _939 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _941 = 1.0 / _935;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _943;
    float _947 = _911 * _937;
    bool _949 = _907 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _951 = isnan(_907);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -_923;
    float _963 = _961 + 1.0;
    bool _965 = _907 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _967 = isnan(_907);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = fma(_945, _947, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _979 = _975 * _963;
    float _981 = -_975;
    float _983 = _981 + 1.0;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _989;
    float _993 = _927 * _941;
    float _995 = _959 * _983;
    float _997 = fma(_987, _947, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _999 = fma(_991, _947, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1001 = -_959;
    float _1003 = _1001 + 1.0;
    float _1005 = _977 * _995;
    float _1007 = _997 * _995;
    float _1009 = _999 * _995;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1023 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1007);
    float _1025 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1005);
    float _1027 = fma(_1013, _993, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1029 = fma(_1017, _993, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1031 = fma(_1021, _993, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1033 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1009);
    float _1035 = fma(_1027, _979, _1023);
    float _1037 = fma(_1029, _979, _1025);
    float _1039 = fma(_1031, _979, _1033);
    float _1041 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1035);
    float _1043 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1037);
    float _1045 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1039);
    float _1047 = _1041 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1049 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1051 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1053;
    out.m_61.y = _1055;
    out.m_61.z = _1057;
    bool _1059 = !_939;
    float _1077;
    if (!_1059)
    {
        float _1061 = in.m_57.x;
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1065 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[14].x, _111);
        float _1069 = _1067 * _1063;
        float _1071 = floor(_1069);
        float _1073 = -_1071;
        float _1075 = _1069 + _1073;
        _1077 = _1075;
        _1079 = true;
    }
    else
    {
        _1077 = _281;
    }
    _1079 = false;
    float _1081 = _1077;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1085 = _1081 + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1089 = _1081 + _1087;
    bool _1091 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1093 = isnan(_1081);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1103;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1111;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1119 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1121 = isnan(_1081);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = 1.0 / _1109;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1135 = _1081 + _1133;
    bool _1137 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1139 = isnan(_1081);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = 1.0 / _1105;
    float _1151 = -_1129;
    float _1153 = _1151 + 1.0;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1155;
    bool _1159 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1161 = isnan(_1081);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1175 = _1147 * _1153;
    float _1177 = 1.0 / _1113;
    float _1179 = _1089 * _1131;
    bool _1181 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1183 = isnan(_1081);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1189 = _1185 || _1187;
    float _1191 = float(_1189);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1193;
    bool _1197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1199 = 1.0 / _1117;
    float _1201 = _1085 * _1149;
    float _1203 = -_1101;
    float _1205 = _1203 + 1.0;
    float _1207 = _1129 * _1205;
    bool _1209 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1211 = isnan(_1081);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1217 = _1213 || _1215;
    float _1219 = float(_1217);
    float _1221 = _1135 * _1177;
    float _1223 = -_1147;
    float _1225 = _1223 + 1.0;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1229 = _1081 + _1227;
    float _1231 = -_1191;
    float _1233 = _1231 + 1.0;
    float _1235 = 1.0 / _1157;
    float _1237 = _1191 * _1225;
    bool _1239 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1241 = isnan(_1081);
    bool _1243 = _1239 || _1241;
    bool _1245 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1247 = _1243 || _1245;
    float _1249 = float(_1247);
    float _1251 = _1219 * _1233;
    float _1253 = _1229 * _1199;
    float _1255 = -_1219;
    float _1257 = _1255 + 1.0;
    bool _1259 = _1081 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1261 = isnan(_1081);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = -_1249;
    float _1273 = _1271 + 1.0;
    float _1275 = 1.0 / _1173;
    float _1277 = _1249 * _1257;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1281 = _1081 + _1279;
    float _1283 = _1269 * _1273;
    float _1285 = -_1269;
    float _1287 = _1285 + 1.0;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1293;
    float _1297 = _1169 * _1287;
    float _1299 = fma(_1291, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1305 = -_1169;
    float _1307 = _1305 + 1.0;
    float _1309 = 1.0 / _1195;
    float _1311 = _1299 * _1297;
    float _1313 = fma(_1303, _1179, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1315 = fma(_1295, _1221, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1317 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1311);
    float _1319 = _1281 * _1235;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1323 = _1081 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1327 = _1081 + _1325;
    float _1329 = fma(_1313, _1283, _1317);
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1335 = _1323 * _1275;
    float _1337 = fma(_1315, _1277, _1329);
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1339;
    float _1343 = fma(_1333, _1253, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1353 = fma(_1341, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1359 = fma(_1343, _1251, _1337);
    float _1361 = fma(_1347, _1319, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1363 = _1327 * _1309;
    float _1365 = fma(_1361, _1237, _1359);
    float _1367 = fma(_1357, _1335, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1369;
    float _1373 = _1353 * _1297;
    float _1375 = fma(_1351, _1179, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1377 = fma(_1367, _1175, _1365);
    float _1379 = fma(_1371, _1363, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1381 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1373);
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1391 = fma(_1379, _1207, _1377);
    float _1393 = fma(_1385, _1221, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1395 = fma(_1375, _1283, _1381);
    float _1397 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1391);
    float _1399 = fma(_1389, _1253, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1401;
    float _1405 = fma(_1393, _1277, _1395);
    out.m_63.y = _1397;
    float _1407 = fma(_1403, _1319, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1413 = fma(_1399, _1251, _1405);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1415;
    float _1419 = fma(_1411, _1335, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1421 = fma(_1407, _1237, _1413);
    float _1423 = fma(_1417, _1363, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1425 = fma(_1419, _1175, _1421);
    float _1427 = fma(_1423, _1207, _1425);
    float _1429 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1427);
    float _1431 = precise::clamp(_1429, 0.0, 1.0);
    bool _1433 = !_1197;
    float _1451;
    if (!_1433)
    {
        float _1435 = in.m_57.x;
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1439 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[14].y, _111);
        float _1443 = _1441 * _1437;
        float _1445 = floor(_1443);
        float _1447 = -_1445;
        float _1449 = _1443 + _1447;
        _1451 = _1449;
        _1453 = true;
    }
    else
    {
        _1451 = _281;
    }
    _1453 = false;
    float _1455 = _1451;
    int _1457 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1459 = _1457;
    int _1461 = 0;
    int _1463 = _96(_1459, _1461, (*spvDescriptorSet0.support_buffer));
    float _1465 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1467 = int(_1465);
    float _1469 = in.m_57.x;
    float _1471 = in.m_57.y;
    float _1473 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1475 = int(_1473);
    float _1477 = float(_1467);
    float _1479 = 1.0 / _1477;
    float _1481 = float(uint(_1475));
    int _1483 = ~_1475;
    int _1485 = _1483 + 1;
    int _1487 = ~_1475;
    int _1489 = _1487 + 1;
    float _1491 = 1.0 / _1481;
    bool _1493 = _1475 == 0;
    int _1495 = ~_1475;
    int _1497 = _1495 + 1;
    float _1499 = _111 * _1479;
    float _1501 = trunc(_1499);
    int _1503 = int(_1501);
    int _1505 = as_type<int>(_1491) + (-2);
    float _1507 = float(uint(_1503));
    float _1509 = as_type<float>(_1505) * _1507;
    float _1511 = trunc(_1509);
    float _1513 = precise::max(_1511, 0.0);
    uint _1516 = uint(_1513);
    int _1518 = _1485 * int(_1516);
    int _1520 = _1518 + _1503;
    float _1522 = float(_1475);
    float _1524 = float(uint(_1520));
    float _1526 = as_type<float>(_1505) * _1524;
    float _1528 = trunc(_1526);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1536 = _1534 != 0;
    bool _1538 = !_1536;
    float _1540 = _1538 ? 7.345489978790283203125 : 1.0;
    float _1542 = _1540 * _1469;
    int _1544 = int(_1516) + int(_1532);
    float _1546 = floor(_1542);
    float _1548 = float(_1503);
    int _1550 = _1489 * _1544;
    int _1552 = _1550 + _1503;
    bool _1554 = _1548 >= _1522;
    bool _1556 = isnan(_1548);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan(_1522);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    bool _1566 = uint(_1552) >= uint(_1475);
    float _1568 = trunc(_1564);
    int _1570 = int(_1568);
    bool _1572 = !_1566;
    int _1574 = _1572 ? 0 : (-1);
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1578 = _1576 != 0;
    int _1580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1582 = _1580 != 0;
    int _1584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1586 = _1584 != 0;
    float _1588 = -_1546;
    float _1590 = _1542 + _1588;
    int _1592 = ~_1544;
    int _1594 = _1592 + _1574;
    int _1596 = _1594 + 1;
    float _1598 = _111 * _1522;
    float _1600 = _1590 * _1522;
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1604 = _1602 != 0;
    int _1606 = _1475 * _1596;
    int _1608 = _1606 + _1503;
    float _1610 = _1598 * _159;
    int _1612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1614 = _1612 != 0;
    float _1616 = trunc(_1600);
    int _1618 = int(_1616);
    bool _1620 = !_1582;
    int _1622 = _1620 ? 0 : 1;
    int _1624 = ~_1570;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    bool _1630 = !_1493;
    int _1632 = _1630 ? _1608 : (-1);
    int _1634 = _1475 + (-1);
    float _1636 = trunc(_1610);
    int _1638 = int(_1636);
    int _1640 = abs(_1622);
    int _1642 = _1632 * _1628;
    bool _1644 = !_1614;
    int _1646 = _1644 ? 0 : 1;
    bool _1648 = !_1586;
    int _1650 = _1648 ? 0 : 1;
    int _1652 = _1570 * _1634;
    int _1654 = _1652 + _1642;
    bool _1656 = !_1578;
    int _1658 = _1656 ? 0 : 1;
    int _1660 = abs(_1646);
    int _1662 = abs(_1658);
    int _1664 = _1618 * _1660;
    int _1666 = _1664 + _1503;
    bool _1668 = !_1604;
    int _1670 = _1668 ? 0 : 1;
    int _1672 = abs(_1650);
    int _1674 = _1654 * _1640;
    int _1676 = abs(_1670);
    int _1678 = _1638 * _1662;
    int _1680 = _1678 + _1674;
    float _1682 = in.m_65.z;
    int _1684 = ~_1475;
    int _1686 = _1684 + 1;
    int _1688 = _1666 * _1672;
    int _1690 = _1688 + _1680;
    int _1692 = _1618 * _1676;
    int _1694 = _1692 + _1690;
    float _1696 = float(uint(_1694));
    float _1698 = as_type<float>(_1505) * _1696;
    float _1700 = trunc(_1698);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    float _1706 = trunc(_1682);
    int _1708 = int(_1706);
    int _1710 = _1686 * int(_1704);
    int _1712 = _1710 + _1694;
    float _1714 = float(uint(_1712));
    float _1716 = as_type<float>(_1505) * _1714;
    float _1718 = trunc(_1716);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = int(_1704) + int(_1722);
    int _1726 = _1497 * _1724;
    int _1728 = _1726 + _1694;
    int _1730 = _1463 + (-1);
    float _1732 = float(_1730);
    float _1734 = _1431 * _1732;
    float _1736 = trunc(_1734);
    int _1738 = int(_1736);
    int _1740 = _1738;
    int _1742 = 0;
    int _1744 = _97(_1740, _1742, (*spvDescriptorSet0.support_buffer));
    int _1746 = _1708;
    int _1748 = 0;
    int _1750 = _97(_1746, _1748, (*spvDescriptorSet0.support_buffer));
    float4 _1753 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1744, _1750)), 0).xyzw;
    float _1755 = _1753.x;
    float _1757 = _1753.y;
    float _1759 = _1753.z;
    float _1761 = _1753.w;
    bool _1763 = uint(_1728) >= uint(_1475);
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1767 = _1455 + _1765;
    int _1769 = ~_1475;
    int _1771 = _1769 + 1;
    bool _1773 = !_1763;
    int _1775 = _1773 ? 0 : (-1);
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1779 = _1777 != 0;
    int _1781 = ~_1724;
    int _1783 = _1781 + _1775;
    int _1785 = _1783 + 1;
    float _1787 = float(uint(_1666));
    int _1789 = _1475 * _1785;
    int _1791 = _1789 + _1694;
    float _1793 = as_type<float>(_1505) * _1787;
    int _1795 = ~_1475;
    int _1797 = _1795 + 1;
    bool _1799 = !_1493;
    int _1801 = _1799 ? _1791 : (-1);
    float _1803 = trunc(_1793);
    float _1805 = precise::max(_1803, 0.0);
    uint _1807 = uint(_1805);
    int _1809 = _1801 >> 31;
    int _1811 = _1801 & 3;
    bool _1813 = _1811 != 0;
    int _1815 = _1809 & 3;
    int _1817 = _1801 & 3;
    bool _1819 = _1817 != 0;
    int _1821 = _1801 + _1815;
    bool _1823 = uint(_1817) > 1u;
    int _1825 = _1821 >> 2;
    int _1827 = _1797 * int(_1807);
    int _1829 = _1827 + _1666;
    bool _1831 = _1817 != 3;
    int _1833 = _1825 << 4;
    int _1835 = _1833 + 368;
    float _1837 = float(uint(_1829));
    uint _1839 = uint(int(uint(_1835) >> uint(2)));
    uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
    int _1843 = int(_1839) & 3;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[int(_1841)][_1843];
    int _1847 = int(_1839) + 1;
    uint _1849 = uint(int(uint(_1847) >> uint(2)));
    int _1851 = _1847 & 3;
    float _1853 = (*spvDescriptorSet0.vp_c9)._m0[int(_1849)][_1851];
    float _1855 = as_type<float>(_1505) * _1837;
    int _1857 = _1813 ? 0 : 1;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1861 = _1859 != 0;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1865 = _1863 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _1867 = _1835 + 8;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[int(_1879)][_1881];
    float _1885 = trunc(_1855);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    bool _1891 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1893 = isnan(_1455);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    bool _1903 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1905 = isnan(_1455);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1917 = _1915 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1919 = 1.0 / _1865;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1923 = int(_1807) + int(_1889);
    float _1925 = 1.0 / _1917;
    int _1927 = ~_1857;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    int _1933 = _1931;
    if (!_1823)
    {
        int _1935 = ~_1857;
        int _1937 = _1935 + 1;
        _1933 = _1937;
    }
    int _1939 = _1933;
    int _1941 = _1771 * _1923;
    int _1943 = _1941 + _1666;
    bool _1945 = uint(_1817) >= 2u;
    int _1947 = abs(_1939);
    bool _1949 = uint(_1943) >= uint(_1475);
    int _1951 = ~_1947;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = _1945 ? 0 : 1;
    bool _1959 = !_1949;
    int _1961 = _1959 ? 0 : (-1);
    bool _1963 = _1817 != 3;
    int _1965 = ~_1957;
    int _1967 = _1965 + 1;
    int _1969 = _1967 + 1;
    int _1971 = _1955 * as_type<int>(_1853);
    bool _1973 = !_1819;
    int _1975 = _1973 ? 0 : 1;
    int _1977 = _1969;
    if (_1831)
    {
        int _1979 = ~_1957;
        int _1981 = _1979 + 1;
        _1977 = _1981;
    }
    int _1983 = _1977;
    float _1985 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1987 = abs(_1975);
    bool _1989 = !_1963;
    int _1991 = _1989 ? 0 : (-1);
    int _1993 = abs(_1983);
    int _1995 = abs(_1991);
    int _1997 = ~_1987;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = _2001 * as_type<int>(_1845);
    int _2005 = _2003 + _1971;
    int _2007 = ~_1993;
    int _2009 = _2007 + 1;
    int _2011 = _2009 + 1;
    float _2013 = -_1921;
    float _2015 = fma(_1985, 2.0, _2013);
    int _2017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2019 = _2017 != 0;
    float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2023 = _2021 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2025 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2027 = int(_2025);
    int _2029 = ~_1995;
    int _2031 = _2029 + 1;
    int _2033 = _2031 + 1;
    int _2035 = _2011 * as_type<int>(_1875);
    int _2037 = _2035 + _2005;
    int _2039 = ~_1923;
    int _2041 = _2039 + _1961;
    int _2043 = _2041 + 1;
    float _2045 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2047 = _2033 * as_type<int>(_1883);
    int _2049 = _2047 + _2037;
    bool _2051 = !_1779;
    int _2053 = _2051 ? 0 : 1;
    int _2055 = _1475 * _2043;
    int _2057 = _2055 + _1666;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2061 = _2059 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2063 = abs(_2053);
    float _2065 = 1.0 / _2023;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2069 = ~_2063;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2077 = _2075 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2079 = fma(_2045, -2.0, _2067);
    float _2081 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2083 = _2081 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    int _2085 = abs(_2027);
    float _2087 = 1.0 / _2061;
    int _2089 = _2049 * _2073;
    float _2091 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2079);
    float _2093 = float(uint(_2085));
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2099 = 1.0 / _2077;
    int _2101 = ~_2027;
    int _2103 = _2101 + 1;
    bool _2105 = _1471 > 0.5;
    bool _2107 = _2105 && _2019;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2111 = 1.0 / _2083;
    bool _2113 = !_1493;
    int _2115 = _2113 ? _2057 : (-1);
    float _2117 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2109);
    bool _2119 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2121 = isnan(_1455);
    bool _2123 = _2119 || _2121;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2127 = _2123 || _2125;
    float _2129 = float(_2127);
    int _2131 = _2115 * _2063;
    int _2133 = _2131 + _2089;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2135;
    float _2139 = 1.0 / _2093;
    float _2141 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2141;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2151 = _2149 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2153 = _2137 * _2099;
    float _2155 = _2143 * _2087;
    bool _2157 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2159 = isnan(_1455);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = _2151 * _2065;
    float _2171 = 1.0 / _2097;
    float _2173 = _2147 * _2111;
    int _2175 = abs(_2133);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2179 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2177;
    float _2181 = float(uint(_2027));
    float _2183 = fma(_2155, _1767, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2185 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2187 = isnan(_1455);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2193 = _2189 || _2191;
    float _2195 = float(_2193);
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2201 = as_type<int>(_2139) + (-2);
    float _2203 = 1.0 / _2181;
    float _2205 = float(uint(_2175));
    float _2207 = -_2167;
    float _2209 = _2207 + 1.0;
    bool _2211 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2213 = isnan(_1455);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = _2199 * _1919;
    float _2225 = float(uint(_2133));
    float _2227 = _2195 * _2209;
    float _2229 = _2179 * _2171;
    float _2231 = as_type<float>(_2201) * _2205;
    float _2233 = -_2195;
    float _2235 = _2233 + 1.0;
    float _2237 = -_2221;
    float _2239 = _2237 + 1.0;
    bool _2241 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2243 = isnan(_1455);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2249 = _2245 || _2247;
    float _2251 = float(_2249);
    float _2253 = _2221 * _2235;
    float _2255 = _2129 * _2239;
    float _2257 = -_2129;
    float _2259 = _2257 + 1.0;
    float _2261 = trunc(_2231);
    float _2263 = precise::max(_2261, 0.0);
    uint _2265 = uint(_2263);
    float _2267 = _2251 * _2259;
    int _2269 = as_type<int>(_2203) + (-2);
    float _2271 = -_2251;
    float _2273 = _2271 + 1.0;
    bool _2275 = _1455 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2277 = isnan(_1455);
    bool _2279 = _2275 || _2277;
    bool _2281 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2283 = _2279 || _2281;
    float _2285 = float(_2283);
    float _2287 = as_type<float>(_2269) * _2225;
    float _2289 = -_1901;
    float _2291 = _2289 + 1.0;
    float _2293 = _1901 * _2273;
    float _2295 = _1913 * _2291;
    float _2297 = trunc(_2287);
    float _2299 = precise::max(_2297, 0.0);
    uint _2301 = uint(_2299);
    int _2303 = ~int(_2265);
    int _2305 = _2303 + 1;
    float _2307 = -_1913;
    float _2309 = _2307 + 1.0;
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2311;
    int _2315 = _2305 * _2085;
    int _2317 = _2315 + _2175;
    float _2319 = _2285 * _2309;
    float _2321 = _2313 * _1925;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2325 = _1455 + _2323;
    float _2327 = float(uint(_2317));
    float _2329 = _2183 * _2319;
    float _2331 = -_2285;
    float _2333 = _2331 + 1.0;
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2337 = _1455 + _2335;
    int _2339 = _2103 * int(_2301);
    int _2341 = _2339 + _2133;
    float _2343 = as_type<float>(_2201) * _2327;
    float _2345 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2347 = _1455 + _2345;
    float _2349 = fma(_2333, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2329);
    float _2351 = fma(_2173, _2337, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2353 = float(uint(_2341));
    float _2355 = trunc(_2343);
    float _2357 = precise::max(_2355, 0.0);
    uint _2359 = uint(_2357);
    float _2361 = fma(_2169, _2347, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2363 = fma(_2153, _2325, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2365 = as_type<float>(_2269) * _2353;
    float _2367 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2369 = _1455 + _2367;
    float _2371 = _2153;
    if (_1861)
    {
        float _2373 = in.m_57.x;
        _2371 = _2373;
    }
    float _2375 = _2371;
    float _2377 = fma(_2361, _2295, _2349);
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2381 = _1455 + _2379;
    float _2383 = fma(_2229, _2369, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2385 = trunc(_2365);
    float _2387 = precise::max(_2385, 0.0);
    uint _2389 = uint(_2387);
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2393 = _1455 + _2391;
    float _2395 = fma(_2363, _2293, _2377);
    float _2397 = fma(_2223, _2381, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2399 = fma(_2321, _2393, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _2401 = int(_2265) + int(_2359);
    float _2403 = in.m_65.x;
    float _2405 = fma(_2351, _2267, _2395);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2409 = ~_2401;
    int _2411 = _2409 + 1;
    float _2413 = fma(_2383, _2255, _2405);
    int _2415 = ~_2027;
    int _2417 = _2415 + 1;
    float _2419 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2407);
    float _2421 = fma(_2397, _2253, _2413);
    int _2423 = int(_2301) + int(_2389);
    float _2425 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2419);
    int _2427 = _2411 * _2085;
    int _2429 = _2427 + _2175;
    bool _2431 = _2375 > 0.5;
    bool _2433 = _2431 && _1861;
    int _2435 = _2417 * _2423;
    int _2437 = _2435 + _2133;
    float _2439 = fma(_2399, _2227, _2421);
    int _2441 = _2133 ^ _2027;
    float _2443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2445 = uint(_2429) >= uint(_2085);
    float _2447 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2439);
    bool _2449 = uint(_2437) >= uint(_2027);
    float _2451 = in.m_65.y;
    bool _2453 = !_2445;
    int _2455 = _2453 ? 0 : (-1);
    float _2457 = -_111;
    float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2015);
    uint _2461 = uint(int(uint(_2441) >> uint(31)));
    float _2463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2465 = !_2449;
    float _2467 = _2465 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    out.m_67.x = _2447;
    float _2469 = as_type<float>(_2411);
    float _2471 = _2467;
    if (_1861)
    {
        _2469 = _2403;
    }
    float _2473 = _2469;
    int _2475 = ~_2455;
    int _2477 = _2401 + _2475;
    int _2479 = _2477 + 1;
    int _2481 = ~int(_2461);
    int _2483 = _2481 + 1;
    float _2485 = _2473;
    if (_2433)
    {
        float _2487 = -_2473;
        float _2489 = _2487 + 1.0;
        _2485 = _2489;
    }
    float _2491 = _2485;
    int _2493 = ~_2423;
    int _2495 = _2493 + as_type<int>(_2467);
    int _2497 = _2495 + 1;
    float _2499 = _2443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2501 = _2479 ^ _2483;
    bool _2503 = _2027 == 0;
    bool _2505 = _2027 == 0;
    int _2507 = _2027 * _2497;
    int _2509 = _2507 + _2133;
    int _2511 = ~_2483;
    int _2513 = _2511 + _2501;
    int _2515 = _2513 + 1;
    float _2517 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2519 = as_type<int>(_2491);
    if (!_1861)
    {
        _2471 = _2403;
    }
    float _2521 = _2471;
    float _2523 = _2451;
    float _2525 = _2521;
    if (_2107)
    {
        float _2527 = -_2451;
        float _2529 = _2527 + 1.0;
        _2523 = _2529;
    }
    float _2531 = _2523;
    bool _2533 = !_2503;
    int _2535 = _2533 ? _2509 : (-1);
    bool _2537 = !_2505;
    int _2539 = _2537 ? _2515 : (-1);
    if (_1861)
    {
        _2525 = _2491;
    }
    float _2541 = _2525;
    uint _2543 = as_type<uint>(half2(float2(_1761, 0.0)));
    float _2545 = float(_2535);
    float _2547 = fma(_2499, _2541, -0.5);
    uint _2549 = extract_bits(_2543, 0u, 8u);
    int _2551 = int(_2549) & 255;
    uint _2553 = extract_bits(_2543, 8u, 8u);
    int _2555 = int(_2553) & 255;
    int _2557 = _2555 << 8;
    int _2559 = _2551 | _2557;
    float _2561 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2117);
    float _2563 = float(_2539);
    float _2565 = fma(_2499, _2545, _2459);
    bool _2567 = _2559 >= 32768;
    float _2569 = fma(_2517, _2531, -0.5);
    float _2571 = -_2091;
    float _2573 = fma(_2517, _2563, _2571);
    float _2575 = fma(_2561, _2547, _2565);
    float _2577 = fma(_2425, _2569, _2573);
    int _2579 = _1738 + 1;
    float _2581 = _2575 + 0.5;
    float _2583 = _2577 + 0.5;
    int _2585 = min(_1730, _2579);
    int _2587 = _2559 + (-1024);
    int _2589 = _2587;
    if (_2567)
    {
        int _2591 = ~_2559;
        int _2593 = _2591 + 33792;
        int _2595 = _2593 + 1;
        _2589 = _2595;
    }
    int _2597 = _2589;
    int _2599 = _2597 + 30719;
    float _2601 = float(_2599);
    float _2603 = fma(_2601, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2605 = abs(_2603);
    float _2607 = -_2605;
    float _2609 = _2607 + 1.0;
    float _2611 = abs(_2603);
    float _2613 = fma(_2611, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2615 = _2603 < 0.0;
    float _2617 = float(_2615);
    int _2619 = as_type<int>(_2609) + (-218103808);
    float _2621 = abs(_2603);
    float _2623 = fma(_2621, _2613, -0.212114393711090087890625);
    bool _2625 = uint(_2619) >= 1920991232u;
    float _2627 = abs(_2603);
    float _2629 = fma(_2627, _2623, 1.570728778839111328125);
    bool _2631 = !_2625;
    float _2653;
    if (!_2631)
    {
        int _2633 = as_type<int>(_2609);
        int _2635 = as_type<int>(_2531);
        int _2637 = as_type<int>(_2491);
        int _2639 = 13056;
        int _2641;
        int _2643;
        int _2645;
        int _2647;
        int _2649;
        int _2651;
        _94(_2633, _2635, _2637, _2639, _2641, _2643, _2645, _2647, _2649, _2651, out.gl_Position, out.gl_PointSize);
        _2653 = as_type<float>(_2641);
        _2519 = _2649;
        _2655 = true;
    }
    else
    {
        float _2657 = rsqrt(_2609);
        float _2659 = _2609 * _2657;
        float _2661 = _2657 * 0.5;
        float _2663 = -_2659;
        float _2665 = 0.0 + _2663;
        float _2667 = fma(_2661, _2665, 0.5);
        float _2669 = fma(_2659, _2667, _2659);
        float _2671 = -_2669;
        float _2673 = 0.0 + _2671;
        float _2675 = fma(_2669, _2673, _2609);
        float _2677 = fma(_2661, _2675, _2669);
        _2653 = _2677;
    }
    _2655 = false;
    float _2679 = _2653;
    int _2681 = _2519;
    int _2683 = _2585;
    int _2685 = 0;
    int _2687 = _97(_2683, _2685, (*spvDescriptorSet0.support_buffer));
    int _2689 = _1708;
    int _2691 = 0;
    int _2693 = _97(_2689, _2691, (*spvDescriptorSet0.support_buffer));
    float4 _2695 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2687, _2693)), 0).xyzw;
    float _2697 = _2695.x;
    float _2699 = _2695.y;
    float _2701 = _2695.z;
    float _2703 = _2695.w;
    float _2705 = _2629 * _2679;
    float _2707 = _2617 * 2.0;
    float _2709 = _2601 * 3.883221149444580078125;
    float _2711 = floor(_1734);
    float _2713 = -_2707;
    float _2715 = fma(_2705, _2713, _2705);
    float _2717 = _2709 * 0.15915493667125701904296875;
    float _2719 = fma(_2617, 3.1415927410125732421875, _2715);
    float _2721 = _2717 * 6.283185482025146484375;
    float _2723 = cos(_2721);
    float _2725 = _2719 * 0.15915493667125701904296875;
    float _2727 = _2725 * 6.283185482025146484375;
    float _2729 = sin(_2727);
    float _2731 = -_2711;
    float _2733 = _1734 + _2731;
    float _2735 = _2717 * 6.283185482025146484375;
    float _2737 = sin(_2735);
    float _2739 = _2729 * _2723;
    float _2741 = _2729 * _2737;
    uint _2743 = as_type<uint>(half2(float2(_2703, 0.0)));
    float _2745 = -_1755;
    float _2747 = _2745 + _2697;
    float _2749 = -_1757;
    float _2751 = _2749 + _2699;
    float _2753 = -_1759;
    float _2755 = _2753 + _2701;
    uint _2757 = extract_bits(_2743, 0u, 8u);
    int _2759 = int(_2757) & 255;
    uint _2761 = extract_bits(_2743, 8u, 8u);
    int _2763 = int(_2761) & 255;
    int _2765 = _2763 << 8;
    int _2767 = _2759 | _2765;
    float _2769 = fma(_2733, _2747, _1755);
    float _2771 = fma(_2733, _2751, _1757);
    float _2773 = fma(_2733, _2755, _1759);
    bool _2775 = _2767 >= 32768;
    int _2777 = _2767 + (-1024);
    int _2779 = _2777;
    if (_2775)
    {
        int _2781 = ~_2767;
        int _2783 = _2781 + 33792;
        int _2785 = _2783 + 1;
        _2779 = _2785;
    }
    int _2787 = _2779;
    int _2789 = _2787 + 30719;
    float _2791 = float(_2789);
    float _2793 = fma(_2791, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2795 = abs(_2793);
    float _2797 = -_2795;
    float _2799 = _2797 + 1.0;
    float _2801 = abs(_2793);
    float _2803 = fma(_2801, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2805 = _2793 < 0.0;
    float _2807 = float(_2805);
    int _2809 = as_type<int>(_2799) + (-218103808);
    float _2811 = abs(_2793);
    float _2813 = fma(_2811, _2803, -0.212114393711090087890625);
    bool _2815 = uint(_2809) >= 1920991232u;
    float _2817 = abs(_2793);
    float _2819 = fma(_2817, _2813, 1.570728778839111328125);
    bool _2821 = !_2815;
    float _2843;
    if (!_2821)
    {
        int _2823 = as_type<int>(_2799);
        int _2825 = as_type<int>(_2697);
        int _2827 = _2681;
        int _2829 = 13952;
        int _2831;
        int _2833;
        int _2835;
        int _2837;
        int _2839;
        int _2841;
        _94(_2823, _2825, _2827, _2829, _2831, _2833, _2835, _2837, _2839, _2841, out.gl_Position, out.gl_PointSize);
        _2843 = as_type<float>(_2831);
        _2845 = true;
    }
    else
    {
        float _2847 = rsqrt(_2799);
        float _2849 = _2799 * _2847;
        float _2851 = _2847 * 0.5;
        float _2853 = -_2849;
        float _2855 = 0.0 + _2853;
        float _2857 = fma(_2851, _2855, 0.5);
        float _2859 = fma(_2849, _2857, _2849);
        float _2861 = -_2859;
        float _2863 = 0.0 + _2861;
        float _2865 = fma(_2859, _2863, _2799);
        float _2867 = fma(_2851, _2865, _2859);
        _2843 = _2867;
    }
    _2845 = false;
    float _2869 = _2843;
    float _2871 = in.m_57.x;
    float _2873 = in.m_57.y;
    float _2875 = in.m_57.z;
    float _2877 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2879 = log2(_2877);
    float _2881 = _277 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2883 = _277 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2885 = _277 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2887 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2881);
    float _2889 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2883);
    float _2891 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2885);
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2895 = _2893 != 0;
    int _2897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2899 = _2897 != 0;
    int _2901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2903 = _2901 != 0;
    float _2905 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2887);
    float _2907 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2891);
    float _2909 = _2819 * _2869;
    float _2911 = _2905 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2913 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2915 = _2907 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2917 = _2879 * _111;
    float _2919 = _659 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2921 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2923 = _2791 * 3.883221149444580078125;
    float _2925 = -_2603;
    float _2927 = _2925 + _2793;
    float _2929 = exp2(_2917);
    float _2931 = _2875 * 2.0;
    float _2933 = _2871 * 2.0;
    float _2935 = _2873 * 2.0;
    float _2937 = _2875 + _2871;
    float _2939 = _2923 * 0.15915493667125701904296875;
    float _2941 = fma(_2733, _2927, _2603);
    float _2943 = floor(_2931);
    float _2945 = _2937 + (-1.0);
    float _2947 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2889);
    float _2949 = _2947 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2951 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2953 = isnan(1.0);
    bool _2955 = _2951 || _2953;
    bool _2957 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2959 = _2955 || _2957;
    float _2961 = floor(_2933);
    bool _2963 = _2943 > 0.0;
    float _2965 = floor(_2935);
    bool _2967 = _2943 >= 0.0;
    bool _2969 = isnan(_2943);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan(0.0);
    bool _2975 = _2971 || _2973;
    int _2977 = _2975 ? 0 : 1;
    bool _2979 = _2961 >= 0.0;
    bool _2981 = isnan(_2961);
    bool _2983 = _2979 || _2981;
    bool _2985 = isnan(0.0);
    bool _2987 = _2983 || _2985;
    float _2989 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _2991 = ~_2977;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    float _2997 = _2873 + _2871;
    int _2999 = _2987 ? 0 : 1;
    int _3001 = _2995;
    float _3003 = _2941;
    if (!_2963)
    {
        int _3005 = ~_2977;
        int _3007 = _3005 + 1;
        _3001 = _3007;
    }
    int _3009 = _3001;
    float _3011 = _2997 + (-1.0);
    bool _3013 = !_2895;
    int _3015 = _3013 ? 0 : 1;
    bool _3017 = _2961 > 0.0;
    float _3019 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3021 = 1.0 + _3019;
    bool _3023 = _2965 > 0.0;
    bool _3025 = _2965 >= 0.0;
    bool _3027 = isnan(_2965);
    bool _3029 = _3025 || _3027;
    bool _3031 = isnan(0.0);
    bool _3033 = _3029 || _3031;
    float _3035 = -_2929;
    float _3037 = _3035 + 1.0;
    int _3039 = abs(_3015);
    float _3041 = 1.0 / _3021;
    float _3043 = in.m_69.x;
    float _3045 = in.m_69.y;
    float _3047 = in.m_69.z;
    float _3049 = float(_3009);
    float _3051 = fma(_3011, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3053 = float(_3039);
    int _3055 = _3033 ? 0 : 1;
    bool _3057 = !_2903;
    int _3059 = _3057 ? 0 : 1;
    float _3061 = _3053 * _3049;
    bool _3063 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3065 = isnan(0.0);
    bool _3067 = _3063 || _3065;
    bool _3069 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3071 = _3067 || _3069;
    float _3073 = _2871 + (-0.5);
    int _3075 = ~_3055;
    int _3077 = _3075 + 1;
    int _3079 = _3077 + 1;
    float _3081 = _3061 * (-2.0);
    int _3083 = _3079;
    if (!_3023)
    {
        int _3085 = ~_3055;
        int _3087 = _3085 + 1;
        _3083 = _3087;
    }
    int _3089 = _3083;
    float _3091 = -_2949;
    float _3093 = _3091 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _3095 = abs(_3059);
    float _3097 = fma(_3051, _3081, _3051);
    float _3099 = _3071 ? _3037 : 0.0;
    float _3101 = -_2915;
    float _3103 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3105 = float(_3095);
    float _3107 = float(_3089);
    if (_2959)
    {
        float _3109 = _3099 * _3041;
        _121 = _3109;
    }
    float _3111 = _121;
    int _3113 = ~_2999;
    int _3115 = _3113 + 1;
    int _3117 = _3115 + 1;
    float _3119 = fma(_3081, _3043, _3043);
    int _3121 = _3117;
    if (!_3017)
    {
        int _3123 = ~_2999;
        int _3125 = _3123 + 1;
        _3121 = _3125;
    }
    int _3127 = _3121;
    float _3129 = _3105 * _3107;
    bool _3131 = !_2899;
    int _3133 = _3131 ? 0 : 1;
    float _3135 = fma(_3073, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3119);
    float _3137 = -_2911;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3141 = _3093 * _3093;
    int _3143 = abs(_3133);
    float _3145 = fma(_3097, _3111, _3135);
    float _3147 = _3129 * (-2.0);
    float _3149 = fma(_3139, _3139, _3141);
    float _3151 = _2875 + (-0.5);
    float _3153 = _3145 * 0.15915493667125701904296875;
    float _3155 = float(_3143);
    float _3157 = fma(_3103, _3103, _3149);
    float _3159 = float(_3127);
    float _3161 = _2875 + _2873;
    float _3163 = fma(_3147, _3047, _3047);
    float _3165 = rsqrt(_3157);
    float _3167 = _2873 + (-0.5);
    float _3169 = _3155 * _3159;
    float _3171 = _3161 + (-1.0);
    float _3173 = fma(_3151, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3163);
    float _3175 = _3169 * (-2.0);
    float _3177 = fma(_2989, _3147, _2989);
    float _3179 = fma(_3171, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3181 = _3153 * 6.283185482025146484375;
    float _3183 = sin(_3181);
    float _3185 = fma(_3175, _3045, _3045);
    float _3187 = fma(_3177, _3111, _3173);
    float _3189 = fma(_3179, _3175, _3179);
    float _3191 = _2807 * 2.0;
    float _3193 = fma(_3167, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3185);
    float _3195 = _3187 * 0.15915493667125701904296875;
    bool _3197 = _2771 != 0.0;
    bool _3199 = isnan(_2771);
    bool _3201 = _3197 || _3199;
    bool _3203 = isnan(0.0);
    bool _3205 = _3201 || _3203;
    float _3207 = _3153 * 6.283185482025146484375;
    float _3209 = cos(_3207);
    float _3211 = fma(_3189, _3111, _3193);
    float _3213 = _3139 * _3165;
    float _3215 = -_3191;
    float _3217 = fma(_2909, _3215, _2909);
    float _3219 = _3103 * _3165;
    float _3221 = _3211 * 0.15915493667125701904296875;
    float _3223 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3225 = _3213 * _3223;
    float _3227 = _3093 * _3165;
    float _3229 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3231 = _3219 * _3229;
    float _3233 = _3195 * 6.283185482025146484375;
    float _3235 = sin(_3233);
    float _3237 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3239 = -_3225;
    float _3241 = fma(_3219, _3237, _3239);
    float _3243 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3245 = _3227 * _3243;
    float _3247 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3249 = -_3231;
    float _3251 = fma(_3227, _3247, _3249);
    float _3253 = _3241 * _3241;
    float _3255 = fma(_2807, 3.1415927410125732421875, _3217);
    bool _3257 = _2769 == 0.0;
    bool _3259 = !_3205;
    bool _3261 = _3257 && _3259;
    float _3263 = _3195 * 6.283185482025146484375;
    float _3265 = cos(_3263);
    float _3267 = fma(_3251, _3251, _3253);
    float _3269 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2771);
    float _3271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2769);
    float _3273 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2773);
    bool _3275 = _2773 == 0.0;
    bool _3277 = _3275 && _3261;
    float _3279 = _2913 * _3269;
    float _3281 = _2919 * _3271;
    float _3283 = _3221 * 6.283185482025146484375;
    float _3285 = cos(_3283);
    float _3287 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3289 = -_3245;
    float _3291 = fma(_3213, _3287, _3289);
    float _3293 = _2921 * _3273;
    float _3295 = _3209 * _3235;
    float _3297 = fma(_3291, _3291, _3267);
    float _3299 = _3183 * _3235;
    float _3301 = _3221 * 6.283185482025146484375;
    float _3303 = sin(_3301);
    float _3305 = _3209 * _3265;
    if (!_3277)
    {
        float _3307 = fma(_2771, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2941);
        _3003 = _3307;
    }
    float _3309 = _3003;
    float _3311 = rsqrt(_3297);
    float _3313 = _3183 * _3265;
    float _3315 = _3183 * _3285;
    float _3317 = _3285 * _3235;
    float _3319 = _3285 * _3265;
    float _3321 = _3209 * _3285;
    float _3323 = _3315 * _3279;
    float _3325 = fma(_3303, _3299, _3305);
    float _3327 = -_3295;
    float _3329 = fma(_3303, _3313, _3327);
    float _3331 = -_3313;
    float _3333 = fma(_3303, _3295, _3331);
    float _3335 = fma(_3303, _3305, _3299);
    float _3337 = _3325 * _3279;
    float _3339 = -_3303;
    float _3341 = fma(_3339, _3281, _3323);
    float _3343 = _3251 * _3311;
    float _3345 = _3241 * _3311;
    float _3347 = _3291 * _3311;
    float _3349 = fma(_3317, _3281, _3337);
    float _3351 = _3329 * _3279;
    float _3353 = _3219 * _3345;
    float _3355 = _3227 * _3343;
    float _3357 = fma(_3333, _3293, _3349);
    float _3359 = fma(_3319, _3281, _3351);
    float _3361 = -_3353;
    float _3363 = fma(_3227, _3347, _3361);
    float _3365 = -_3355;
    float _3367 = fma(_3213, _3345, _3365);
    float _3369 = _3255 * 0.15915493667125701904296875;
    float _3371 = fma(_3335, _3293, _3359);
    float _3373 = _3363 * _3357;
    float _3375 = _3367 * _3357;
    float _3377 = fma(_3321, _3293, _3341);
    float _3379 = _2939 * 6.283185482025146484375;
    float _3381 = cos(_3379);
    float _3383 = fma(_3343, _3371, _3373);
    float _3385 = fma(_3347, _3371, _3375);
    float _3387 = fma(_3213, _3377, _3383);
    float _3389 = fma(_3219, _3377, _3385);
    float _3391 = _3369 * 6.283185482025146484375;
    float _3393 = sin(_3391);
    float _3395 = _2911 + _3387;
    float _3397 = _2915 + _3389;
    float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3401 = _3395 + _3399;
    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3405 = _3397 + _3403;
    float _3407 = _2939 * 6.283185482025146484375;
    float _3409 = sin(_3407);
    float _3411 = _3401 * _3401;
    float _3413 = _3405 * _3405;
    float _3415 = _3411 + _3413;
    float _3417 = -_2739;
    float _3419 = fma(_3393, _3381, _3417);
    float _3421 = fma(_2733, _3419, _2739);
    float _3423 = -_2741;
    float _3425 = fma(_3393, _3409, _3423);
    float _3427 = _3213 * _3347;
    float _3429 = _3421;
    float _3431 = _3335;
    float _3433 = _3411;
    float _3435 = _3413;
    float _3437 = _3395;
    float _3439 = _3397;
    float _3441 = _3321;
    if (!_3277)
    {
        float _3443 = fma(_2769, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3421);
        _3429 = _3443;
    }
    float _3445 = _3429;
    float _3447 = _3325 * _3363;
    float _3449 = fma(_2733, _3425, _2741);
    float _3451 = -_3427;
    float _3453 = fma(_3219, _3343, _3451);
    float _3455 = sqrt(_3415);
    float _3457 = _3325 * _3367;
    float _3459 = _3449;
    if (!_3277)
    {
        float _3461 = fma(_2773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3449);
        _3459 = _3461;
    }
    float _3463 = _3459;
    float _3465 = _3325 * _3453;
    float _3467 = _3453 * _3357;
    float _3469 = fma(_3329, _3343, _3447);
    float _3471 = fma(_3329, _3347, _3457);
    float _3473 = fma(_3329, _3345, _3465);
    float _3475 = _3317 * _3367;
    float _3477 = _3333 * _3367;
    float _3479 = _3317 * _3363;
    float _3481 = fma(_3345, _3371, _3467);
    float _3483 = _3317 * _3453;
    float _3485 = _3333 * _3363;
    float _3487 = _3333 * _3453;
    float _3489 = fma(_3319, _3343, _3479);
    bool _3491 = _3455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3493 = fma(_3227, _3377, _3481);
    float _3495 = fma(_3319, _3345, _3483);
    float _3497 = fma(_3335, _3345, _3487);
    float _3499 = fma(_3315, _3213, _3469);
    float _3501 = _2949 + _3493;
    float _3503 = fma(_3319, _3347, _3475);
    float _3505 = fma(_3335, _3343, _3485);
    float _3507 = fma(_3335, _3347, _3477);
    float _3509 = fma(_3315, _3227, _3473);
    float _3511 = fma(_3315, _3219, _3471);
    if (!_3491)
    {
        _3431 = _3501;
    }
    float _3513 = _3431;
    bool _3515 = !_3491;
    float _3517 = _3513;
    if (!_3515)
    {
        float _3519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3521 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3523 = _3455 + _3521;
        float _3525 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3527 = rsqrt(_3415);
        float _3529 = _3523 * _3519;
        float _3531 = _3529 * 0.15915493667125701904296875;
        float _3533 = _3531 * 6.283185482025146484375;
        float _3535 = sin(_3533);
        float _3537 = _3531 * 6.283185482025146484375;
        float _3539 = cos(_3537);
        float _3541 = fma(_3535, _3525, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3543 = _3527 * _3541;
        float _3545 = _3539 + (-1.0);
        float _3547 = _3401 * _3543;
        float _3549 = _3405 * _3543;
        float _3551 = _3545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3553 = _3547 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3555 = _3547 * _3547;
        float _3557 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3559 = fma(_3501, _3539, _3551);
        float _3561 = _3549 * _3549;
        _3517 = _3559;
        _3433 = _3555;
        _3435 = _3561;
        _3437 = _3553;
        _3439 = _3557;
    }
    float _3563 = _3517;
    float _3565 = _3433;
    float _3567 = _3435;
    float _3569 = _3437;
    float _3571 = _3439;
    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3575 = _3563 + _3573;
    float _3577 = -_3303;
    float _3579 = fma(_3577, _3219, _3503);
    float _3581 = fma(_3321, _3219, _3507);
    float _3583 = -_3303;
    float _3585 = fma(_3583, _3213, _3489);
    float _3587 = fma(_3575, _3575, _3565);
    float _3589 = -_3303;
    float _3591 = fma(_3589, _3227, _3495);
    float _3593 = _3499 * _3309;
    float _3595 = _3509 * _3309;
    float _3597 = _3587 + _3567;
    float _3599 = _3511 * _3309;
    float _3601 = fma(_3321, _3213, _3505);
    float _3603 = fma(_3585, _3445, _3593);
    float _3605 = sqrt(_3597);
    float _3607 = fma(_3321, _3227, _3497);
    float _3609 = fma(_3591, _3445, _3595);
    float _3611 = fma(_3579, _3445, _3599);
    float _3613 = fma(_3601, _3463, _3603);
    out.m_71.x = _2581;
    out.m_71.y = _2583;
    float _3615 = fma(_3607, _3463, _3609);
    float _3617 = fma(_3581, _3463, _3611);
    out.m_73.x = _3613;
    out.m_73.y = _3615;
    out.m_73.z = _3617;
    bool _3619 = _3605 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3621 = isnan(_3605);
    bool _3623 = _3619 || _3621;
    bool _3625 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3627 = _3623 || _3625;
    if (!_3627)
    {
        _3441 = 1.0;
    }
    float _3629 = _3441;
    bool _3631 = !_3627;
    float _3633 = _3629;
    if (!_3631)
    {
        bool _3635 = _3605 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3637 = isnan(_3605);
        bool _3639 = _3635 || _3637;
        bool _3641 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3643 = _3639 || _3641;
        if (!_3643)
        {
            float _3645 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3647 = _3605 + _3645;
            float _3649 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3651 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3649;
            float _3653 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3655 = _3653 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3657 = 1.0 / _3651;
            float _3659 = _3647 * _3657;
            float _3661 = fma(_3659, _3655, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3633 = _3661;
            _3663 = true;
        }
        else
        {
            bool _3665 = _3605 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3667 = isnan(_3605);
            bool _3669 = _3665 || _3667;
            bool _3671 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3673 = _3669 || _3671;
            if (!_3673)
            {
                float _3675 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3677 = _3605 + _3675;
                float _3679 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3681 = _3679 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3683 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3685 = _3683 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3687 = 1.0 / _3681;
                float _3689 = _3677 * _3687;
                float _3691 = fma(_3689, _3685, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3633 = _3691;
                _3663 = true;
            }
            else
            {
                _3633 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3663 = false;
    float _3693 = _3633;
    float _3695 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3697 = _3563 + _3695;
    float _3699 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3701 = _3569 + _3699;
    float _3703 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3705 = _3571 + _3703;
    float _3707 = fma(_3697, _3693, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3709 = fma(_3701, _3693, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3711 = fma(_3705, _3693, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3715 = _3707 + _3713;
    float _3717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3719 = _3709 + _3717;
    float _3721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3723 = _3711 + _3721;
    float _3725 = _3715 * _3715;
    float _3727 = fma(_3719, _3719, _3725);
    float _3729 = fma(_3723, _3723, _3727);
    float _3731 = rsqrt(_3729);
    float _3733 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3735 = _3719 * _3733;
    float _3737 = _3723 * _3733;
    float _3739 = _3735 * _3735;
    float _3741 = _3737 * _3737;
    float _3743 = _3739 + _3741;
    float _3745 = sqrt(_3743);
    bool _3747 = _3745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3751 = _3745 + _3749;
    float _3753 = _3727;
    float _3755 = _3743;
    float _3757 = _3751;
    float _3759 = _3715;
    float _3761 = _3733;
    float _3763 = _3735;
    if (_3747)
    {
        float _3765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3753 = _3765;
    }
    float _3767 = _3753;
    if (_3747)
    {
        float _3769 = rsqrt(_3743);
        _3755 = _3769;
    }
    float _3771 = _3755;
    float _3773 = _3767;
    if (_3747)
    {
        float _3775 = _3751 * _3767;
        _3757 = _3775;
    }
    float _3777 = _3757;
    if (_3747)
    {
        float _3779 = _3777 * 0.15915493667125701904296875;
        _3773 = _3779;
    }
    float _3781 = _3773;
    float _3783 = _3723;
    float _3785 = _3781;
    if (_3747)
    {
        float _3787 = _3781 * 6.283185482025146484375;
        float _3789 = sin(_3787);
        _3783 = _3789;
    }
    float _3791 = _3783;
    float _3793 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3795 = precise::max(0.0, _3793);
    float _3797 = _3731;
    float _3799 = _3795;
    if (_3747)
    {
        float _3801 = _3781 * 6.283185482025146484375;
        float _3803 = cos(_3801);
        _3797 = _3803;
    }
    float _3805 = _3797;
    float _3807 = -_3733;
    float _3809 = -_3795;
    float _3811 = fma(_3715, _3807, _3809);
    if (_3747)
    {
        float _3813 = _3811 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3759 = _3813;
    }
    float _3815 = _3759;
    float _3817 = _3815;
    float _3819 = _3791;
    if (_3747)
    {
        float _3821 = fma(_3791, _3815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3817 = _3821;
    }
    float _3823 = _3817;
    float _3825 = _3823;
    if (!_3747)
    {
        _3819 = _3811;
    }
    float _3827 = _3819;
    float _3829 = _3827;
    float _3831 = _3805;
    if (_3747)
    {
        float _3833 = _3805 + (-1.0);
        _3799 = _3833;
    }
    float _3835 = _3799;
    float _3837 = _3835;
    if (_3747)
    {
        float _3839 = _3771 * _3823;
        _3761 = _3839;
    }
    float _3841 = _3761;
    if (!_3747)
    {
        _3825 = _3739;
    }
    float _3843 = _3825;
    float _3845 = sqrt(_3729);
    float _3847 = _3843;
    if (_3747)
    {
        float _3849 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3785 = _3849;
    }
    float _3851 = _3785;
    if (_3747)
    {
        float _3853 = _3735 * _3841;
        _3763 = _3853;
    }
    float _3855 = _3763;
    if (!_3747)
    {
        _3837 = _3737;
    }
    float _3857 = _3837;
    float _3859 = _3857;
    if (_3747)
    {
        float _3861 = _3737 * _3841;
        _3859 = _3861;
    }
    float _3863 = _3859;
    if (_3747)
    {
        float _3865 = fma(_3811, _3805, _3851);
        _3829 = _3865;
    }
    float _3867 = _3829;
    if (_3747)
    {
        float _3869 = _3855 * _3855;
        _3847 = _3869;
    }
    float _3871 = _3847;
    if (!_3747)
    {
        _3831 = _3741;
    }
    float _3873 = _3831;
    float _3875 = _3873;
    if (_3747)
    {
        float _3877 = _3863 * _3863;
        _3875 = _3877;
    }
    float _3879 = _3875;
    float _3881 = fma(_3867, _3867, _3871);
    float _3883 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3885 = _3881 + _3879;
    float _3887 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3891 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3889);
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3897 = rsqrt(_3885);
    float _3899 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3887);
    float _3901 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3903 = -_3893;
    float _3905 = _3903 + 1.0;
    float _3907 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3883);
    float _3909 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3899);
    float _3911 = _3707 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3913 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3901);
    float _3915 = abs(_3905);
    float _3917 = log2(_3915);
    float _3919 = _3909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3921 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3911);
    float _3923 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3913);
    float _3925 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3927 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3921);
    float _3929 = _3923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3931 = _3897 * _3855;
    float _3933 = -_3925;
    float _3935 = fma(_3933, _3895, 1.0);
    float _3937 = _3927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3939 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3941 = _3897 * _3867;
    float _3943 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3945 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3907);
    float _3947 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3939);
    float _3949 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3951 = _3897 * _3863;
    float _3953 = -_3943;
    float _3955 = fma(_3941, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3953);
    float _3957 = _3945 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3959 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3947);
    float _3961 = log2(_3935);
    float _3963 = -_3951;
    float _3965 = fma(_3963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3955);
    float _3967 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3969 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3959);
    float _3971 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3973 = fma(_3965, -0.5, 0.5);
    float _3975 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3967);
    float _3977 = fma(_3965, 0.5, 0.5);
    float _3979 = exp2(_3949);
    float _3981 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3971);
    float _3983 = _3941 + 1.0;
    float _3985 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3975);
    float _3987 = fma(_3977, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3989 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3981);
    float _3991 = 1.0 / _3969;
    float _3993 = fma(_3977, _3987, -0.212114393711090087890625);
    float _3995 = fma(_3977, _3993, 1.570728778839111328125);
    float _3997 = sqrt(_3973);
    float _3999 = -_3941;
    float _4001 = fma(_3979, _3983, _3999);
    float _4003 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3985);
    float _4005 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3989);
    float _4007 = _3961 * 0.693147182464599609375;
    float _4009 = fma(_4001, 0.5, 0.5);
    float _4011 = _4003 * _3991;
    float _4013 = _4005 * _3991;
    float _4015 = _4007 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4017 = fma(_4011, 0.5, 0.5);
    float _4019 = fma(_4013, -0.5, 0.5);
    float _4021 = _3997 * 0.636619746685028076171875;
    float3 _10038 = float3(_4017, _4019, _4015);
    float _4023 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10038, float3(0.0), isnan(_10038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10038, float3(0.0), isnan(_10038)), level(0.0)).x;
    float3 _10049 = float3(_4017, _4019, _4015);
    float4 _4025 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10049, float3(0.0), isnan(_10049)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10049, float3(0.0), isnan(_10049)), level(0.0)).xyzw;
    float _4027 = _4025.x;
    float _4029 = _4025.y;
    float _4031 = _4025.z;
    float _4033 = _4025.w;
    float _4035 = -_3995;
    float _4037 = fma(_4021, _4035, 1.0);
    float2 _10070 = float2(_4037, _4009);
    float3 _4041 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10070, float2(0.0), isnan(_10070)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10070, float2(0.0), isnan(_10070)), level(0.0)).xyz;
    float _4043 = _4041.x;
    float _4045 = _4041.y;
    float _4047 = _4041.z;
    float _4049 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4051 = _3929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2911;
    out.m_75.y = _2949;
    out.m_75.z = _2915;
    float _4053 = fma(_3937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4051);
    float _4055 = exp2(_4049);
    out.m_77.x = _3709;
    out.m_77.y = _3707;
    out.m_77.z = _3711;
    float _4057 = fma(_3919, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4053);
    float _4059 = fma(_3957, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4057);
    float _4061 = _4059 + _3969;
    out.gl_Position.x = _4003;
    out.gl_Position.y = _4005;
    out.gl_Position.z = _4059;
    out.gl_Position.w = _3969;
    float _4063 = _4061 * 0.5;
    float _4065 = -_4055;
    float _4067 = _4065 + 1.0;
    float _4069 = _4067 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _4063;
    out.m_79.w = _3969;
    float _4071 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4073 = -_4069;
    float _4075 = _4073 + 1.0;
    out.m_53.x = _4071;
    float _4077 = _4069 * _4023;
    float _4079 = _4033 * _4077;
    float _4081 = _4047 * _4077;
    float _4083 = fma(_4043, _4079, _4027);
    float _4085 = fma(_4045, _4079, _4029);
    float _4087 = _4033 * _4075;
    float _4089 = fma(_4033, _4081, _4031);
    out.m_81.x = _4083;
    out.m_81.y = _4085;
    out.m_81.z = _4089;
    out.m_81.w = _4087;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

