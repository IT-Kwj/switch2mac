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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
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
    float4 m_63 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _98(thread const int& _6524, thread const int& _6525, constant _10& support_buffer)
{
    float _6528 = as_type<float>(support_buffer._m4);
    int _6530 = _6525 + as_type<int>(_6528);
    int _6532 = 1 + _6530;
    float _6534 = support_buffer._m5[_6532].x;
    float _6536 = abs(_6534);
    bool _6538 = _6536 == 1.0;
    if (_6538)
    {
        return _6524;
    }
    float _6540 = float(_6524);
    float _6542 = _6540 / _6536;
    int _6544 = int(_6542);
    return _6544;
}

static inline __attribute__((always_inline))
int _99(thread const int& _6574, thread const int& _6575, constant _10& support_buffer)
{
    float _6578 = as_type<float>(support_buffer._m4);
    int _6580 = _6575 + as_type<int>(_6578);
    int _6582 = 1 + _6580;
    float _6584 = support_buffer._m5[_6582].x;
    bool _6586 = _6584 == 1.0;
    if (_6586)
    {
        return _6574;
    }
    float _6588 = float(_6574);
    float _6590 = _6588 * _6584;
    int _6592 = int(_6590);
    return _6592;
}

static inline __attribute__((always_inline))
void _96(thread const int& _6208, thread const int& _6209, thread const int& _6210, thread const int& _6211, thread const int& _6212, thread int& _6213, thread int& _6214, thread int& _6215, thread int& _6216, thread int& _6217, thread int& _6218, thread int& _6219, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _6222 = _6211;
    int _6224 = _6209;
    int _6226 = _6210;
    float _6228 = 0.0 + as_type<float>(_6208);
    bool _6230 = _6228 != 0.0;
    bool _6232 = isnan(_6228);
    bool _6234 = _6230 || _6232;
    bool _6236 = isnan(0.0);
    bool _6238 = _6234 || _6236;
    int _6240 = as_type<int>(_6228);
    int _6242 = _6238 ? (-1) : 0;
    if (!_6238)
    {
        float _6244 = as_type<float>(_6208) * 1.0;
        _6222 = as_type<int>(_6244);
    }
    int _6246 = _6222;
    bool _6248 = !_6238;
    int _6250 = _6246;
    int _6252 = _6246;
    if (!_6248)
    {
        bool _6254 = _6228 >= 0.0;
        bool _6256 = isnan(_6228);
        bool _6258 = _6254 || _6256;
        bool _6260 = isnan(0.0);
        bool _6262 = _6258 || _6260;
        _6242 = _6262 ? (-1) : 0;
        if (!_6262)
        {
            _6250 = 2147483647;
        }
        int _6264 = _6250;
        bool _6266 = !_6262;
        int _6268 = _6264;
        _6252 = _6264;
        if (!_6266)
        {
            float _6270 = abs(as_type<float>(_6208));
            float _6272 = 0.0 + _6270;
            bool _6274 = _6272 > as_type<float>(0x7f800000u /* inf */);
            bool _6276 = isnan(_6272);
            bool _6278 = _6274 || _6276;
            bool _6280 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _6282 = _6278 || _6280;
            _6240 = as_type<int>(_6272);
            _6242 = _6282 ? (-1) : 0;
            if (_6282)
            {
                float _6284 = as_type<float>(_6208) + 1.0;
                _6268 = as_type<int>(_6284);
            }
            int _6286 = _6268;
            int _6288 = _6286;
            _6252 = _6286;
            if (!_6282)
            {
                bool _6290 = _6272 != as_type<float>(0x7f800000u /* inf */);
                bool _6292 = isnan(_6272);
                bool _6294 = _6290 || _6292;
                bool _6296 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _6298 = _6294 || _6296;
                _6242 = _6298 ? (-1) : 0;
                if (!_6298)
                {
                    _6288 = _6208;
                }
                int _6300 = _6288;
                bool _6302 = !_6298;
                _6252 = _6300;
                if (!_6302)
                {
                    float _6304 = as_type<float>(_6208) * 18446744073709551616.0;
                    float _6306 = rsqrt(_6304);
                    float _6308 = _6304 * _6306;
                    float _6310 = _6306 * 0.5;
                    float _6312 = -_6308;
                    float _6314 = 0.0 + _6312;
                    float _6316 = fma(_6310, _6314, 0.5);
                    float _6318 = fma(_6308, _6316, _6308);
                    float _6320 = -_6318;
                    float _6322 = 0.0 + _6320;
                    float _6324 = fma(_6318, _6322, _6304);
                    float _6326 = fma(_6310, _6324, _6318);
                    float _6328 = _6326 * 2.3283064365386962890625e-10;
                    _6240 = as_type<int>(_6326);
                    _6224 = as_type<int>(_6314);
                    _6226 = as_type<int>(_6318);
                    _6252 = as_type<int>(_6328);
                }
            }
        }
    }
    int _6330 = _6240;
    int _6332 = _6224;
    int _6334 = _6226;
    int _6336 = _6252;
    int _6338 = _6242;
    _6213 = _6212;
    _6214 = 0;
    _6215 = _6330;
    _6216 = _6332;
    _6217 = _6334;
    _6218 = _6336;
    _6219 = _6338;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2297 = false;
    bool _923 = false;
    bool _731 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2546 = as_type<float>(_125);
        out.gl_Position.z = _2546;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    if (_155)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _115;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2615 = as_type<float>(_161);
        out.gl_Position.z = _2615;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    int _163 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _165 = _163;
    int _167 = 0;
    int _169 = _98(_165, _167, (*spvDescriptorSet0.support_buffer));
    float _171 = _143 * 0.0500000007450580596923828125;
    float _173 = in.m_53.z;
    float _175 = trunc(_173);
    int _177 = int(_175);
    float _179 = float(_169);
    int _181 = abs(_169);
    bool _183 = _169 == 0;
    float _185 = _171 * _179;
    float _187 = float(uint(_181));
    float _189 = trunc(_185);
    int _191 = int(_189);
    float _193 = 1.0 / _187;
    int _195 = abs(_191);
    uint _198 = uint(int(uint(_191) >> uint(31)));
    float _200 = float(uint(_195));
    int _202 = ~int(_198);
    int _204 = _202 + 1;
    int _206 = as_type<int>(_193) + (-2);
    float _208 = as_type<float>(_206) * _200;
    float _210 = trunc(_208);
    float _212 = precise::max(_210, 0.0);
    uint _214 = uint(_212);
    int _216 = ~int(_214);
    int _218 = _216 + 1;
    int _220 = _218 * _181;
    int _222 = _220 + _195;
    float _224 = float(uint(_222));
    float _226 = as_type<float>(_206) * _224;
    float _228 = trunc(_226);
    float _230 = precise::max(_228, 0.0);
    uint _232 = uint(_230);
    int _234 = int(_214) + int(_232);
    int _236 = ~_234;
    int _238 = _236 + 1;
    int _240 = _238 * _181;
    int _242 = _240 + _195;
    bool _244 = uint(_242) >= uint(_181);
    bool _246 = !_244;
    int _248 = _246 ? 0 : (-1);
    int _250 = ~_234;
    int _252 = _250 + _248;
    int _254 = _252 + 1;
    int _256 = _254 * _181;
    int _258 = _256 + _195;
    int _260 = _258 ^ _204;
    int _262 = ~_204;
    int _264 = _262 + _260;
    int _266 = _264 + 1;
    bool _268 = !_183;
    int _270 = _268 ? _266 : (-1);
    int _272 = _270;
    int _274 = 0;
    int _276 = _99(_272, _274, (*spvDescriptorSet0.support_buffer));
    int _278 = _177;
    int _280 = 0;
    int _282 = _99(_278, _280, (*spvDescriptorSet0.support_buffer));
    float4 _285 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_276, _282)), 0).xyzw;
    float _287 = _285.x;
    float _289 = _285.y;
    float _291 = _285.z;
    float _293 = _285.w;
    float _295 = in.m_55.w;
    float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _301 = _299 != 0;
    float _303 = in.m_53.y;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _307 = _305 != 0;
    float _309 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _313 = _311 != 0;
    float _315 = in.m_53.x;
    float _317 = in.m_57.w;
    float _319 = as_type<float>(_204);
    float _321 = _303;
    if (_301)
    {
        float _323 = in.m_55.z;
        _319 = _323;
    }
    float _325 = _319;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _329 = _297 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _331 = 0.0;
    if (!_307)
    {
        float _333 = in.m_55.z;
        _331 = _333;
    }
    float _335 = _331;
    bool _337 = _295 > 0.5;
    bool _339 = _337 && _313;
    float _341 = 0.0;
    float _343 = _295;
    if (!_307)
    {
        float _345 = in.m_55.y;
        _341 = _345;
    }
    float _347 = _341;
    float _349 = _315;
    if (_301)
    {
        _343 = _315;
    }
    float _351 = _343;
    float _353 = _351;
    if (_339)
    {
        float _355 = -_303;
        float _357 = _355 + 1.0;
        _321 = _357;
    }
    float _359 = _321;
    bool _361 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _365 = _361 || _363;
    bool _367 = isnan(1.0);
    bool _369 = _365 || _367;
    bool _371 = _325 > 0.5;
    bool _373 = _371 && _301;
    float _375 = fma(_329, _359, -0.5);
    float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _379 = 0.0;
    float _381 = _335;
    if (!_307)
    {
        _379 = _335;
    }
    float _383 = _379;
    float _385 = _347;
    float _387 = _383;
    if (_307)
    {
        float _389 = in.m_55.x;
        float _391 = in.m_55.y;
        _385 = _389;
        _387 = _391;
    }
    float _393 = _385;
    float _395 = _387;
    if (_373)
    {
        float _397 = -_351;
        float _399 = _397 + 1.0;
        _353 = _399;
    }
    float _401 = _353;
    if (_301)
    {
        _349 = _401;
    }
    float _403 = _349;
    float _405 = _377 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _407 = in.m_51.x;
    float _409 = in.m_51.y;
    float _411 = in.m_51.z;
    float _413 = fma(_405, _403, -0.5);
    float _415 = in.m_46.x;
    float _417 = in.m_46.y;
    float _419 = in.m_46.z;
    float _421 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[83].z, _327);
    float _423 = _393 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _427 = _423;
    if (_307)
    {
        _381 = _395;
    }
    float _429 = _381;
    float _431 = _395 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _437 = -_425;
    float _439 = fma(_423, 2.0, _437);
    float _441 = _429;
    if (!_369)
    {
        float _443 = _309 * _309;
        float _445 = _443 * 0.5;
        _427 = _445;
    }
    float _447 = _427;
    float _449 = fma(_431, -2.0, _433);
    float _451 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[83].w, _435);
    float _453 = _447;
    if (!_369)
    {
        _441 = _309;
    }
    float _455 = _441;
    float _457 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _421);
    float _459 = -_143;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[81].x, _439);
    float _463 = _455;
    if (!_369)
    {
        float _465 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _453 = _465;
    }
    float _467 = _453;
    bool _469 = !_369;
    float _471 = _467;
    int _473 = 0;
    if (!_469)
    {
        float _475 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _477 = log2(_475);
        float _479 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _481 = _479 + 1.0;
        float _483 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _485 = _309 * _477;
        float _487 = 1.0 / _481;
        float _489 = _483 * 0.693147182464599609375;
        float _491 = exp2(_485);
        float _493 = 1.0 / _489;
        float _495 = _491 + (-1.0);
        float _497 = -_495;
        float _499 = fma(_497, _493, _309);
        float _501 = _499 * _487;
        float _503 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _471 = _503;
        _473 = as_type<int>(_487);
    }
    float _505 = _471;
    int _507 = _473;
    bool _509 = !_369;
    if (!_509)
    {
        float _511 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _513 = log2(_511);
        float _515 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _517 = _515 + 1.0;
        float _519 = 1.0 / _517;
        float _521 = _309 * _513;
        float _523 = exp2(_521);
        float _525 = -_523;
        float _527 = _525 + 1.0;
        float _529 = _527 * _519;
        _463 = _529;
    }
    float _531 = _463;
    float _533 = fma(_457, _413, _461);
    float _535 = _505 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _537 = _505 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _539 = _270 + 1;
    float _541 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _449);
    float _543 = _505 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _545 = fma(_531, _407, _535);
    float _547 = fma(_531, _409, _537);
    int _549 = abs(_539);
    float _551 = fma(_531, _411, _543);
    float _553 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _451);
    float _555 = fma(_547, _317, _417);
    float _557 = float(uint(_549));
    float _559 = -_541;
    float _561 = fma(_553, _375, _559);
    float _563 = fma(_545, _317, _415);
    float _565 = fma(_551, _317, _419);
    float _567 = as_type<float>(_206) * _557;
    uint _569 = as_type<uint>(half2(float2(_293, 0.0)));
    uint _571 = uint(int(uint(_539) >> uint(31)));
    uint _573 = extract_bits(_569, 0u, 8u);
    int _575 = int(_573) & 255;
    uint _577 = extract_bits(_569, 8u, 8u);
    int _579 = int(_577) & 255;
    int _581 = _579 << 8;
    int _583 = _575 | _581;
    float _585 = trunc(_567);
    float _587 = precise::max(_585, 0.0);
    uint _589 = uint(_587);
    int _591 = ~int(_571);
    int _593 = _591 + 1;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _597 = ~int(_589);
    int _599 = _597 + 1;
    int _601 = _599 * _181;
    int _603 = _601 + _549;
    float _605 = float(uint(_603));
    float _607 = as_type<float>(_206) * _605;
    float _609 = _533 + 0.5;
    float _611 = trunc(_607);
    float _613 = precise::max(_611, 0.0);
    uint _615 = uint(_613);
    int _617 = int(_589) + int(_615);
    int _619 = ~_617;
    int _621 = _619 + 1;
    int _623 = _621 * _181;
    int _625 = _623 + _549;
    bool _627 = uint(_625) >= uint(_181);
    bool _629 = !_627;
    int _631 = _629 ? 0 : (-1);
    bool _633 = _583 >= 32768;
    int _635 = ~_617;
    int _637 = _635 + _631;
    int _639 = _637 + 1;
    int _641 = _639 * _181;
    int _643 = _641 + _549;
    float _645 = _561 + 0.5;
    int _647 = _643 ^ _593;
    int _649 = ~_593;
    int _651 = _649 + _647;
    int _653 = _651 + 1;
    int _655 = _583 + (-1024);
    int _657 = _655;
    if (_633)
    {
        int _659 = ~_583;
        int _661 = _659 + 33792;
        int _663 = _661 + 1;
        _657 = _663;
    }
    int _665 = _657;
    int _667 = _665 + 30719;
    bool _669 = !_183;
    int _671 = _669 ? _653 : (-1);
    float _673 = float(_667);
    float _675 = fma(_673, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _677 = abs(_675);
    float _679 = -_677;
    float _681 = _679 + 1.0;
    float _683 = abs(_675);
    float _685 = fma(_683, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _687 = _675 < 0.0;
    float _689 = float(_687);
    int _691 = as_type<int>(_681) + (-218103808);
    float _693 = abs(_675);
    float _695 = fma(_693, _685, -0.212114393711090087890625);
    bool _697 = uint(_691) >= 1920991232u;
    float _699 = abs(_675);
    float _701 = fma(_699, _695, 1.570728778839111328125);
    bool _703 = !_697;
    float _729;
    if (!_703)
    {
        int _705 = as_type<int>(_681);
        int _707 = as_type<int>(_681);
        int _709 = as_type<int>(_607);
        int _711 = _507;
        int _713 = 3024;
        int _715;
        int _717;
        int _719;
        int _721;
        int _723;
        int _725;
        int _727;
        _96(_705, _707, _709, _711, _713, _715, _717, _719, _721, _723, _725, _727, out.gl_Position, out.gl_PointSize);
        _729 = as_type<float>(_725);
        _731 = true;
    }
    else
    {
        float _733 = rsqrt(_681);
        float _735 = _681 * _733;
        float _737 = _733 * 0.5;
        float _739 = -_735;
        float _741 = 0.0 + _739;
        float _743 = fma(_737, _741, 0.5);
        float _745 = fma(_735, _743, _735);
        float _747 = -_745;
        float _749 = 0.0 + _747;
        float _751 = fma(_745, _749, _681);
        float _753 = fma(_737, _751, _745);
        _729 = _753;
    }
    _731 = false;
    float _755 = _729;
    int _757 = _671;
    int _759 = 0;
    int _761 = _99(_757, _759, (*spvDescriptorSet0.support_buffer));
    int _763 = _177;
    int _765 = 0;
    int _767 = _99(_763, _765, (*spvDescriptorSet0.support_buffer));
    float4 _769 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_761, _767)), 0).xyzw;
    float _771 = _769.x;
    float _773 = _769.y;
    float _775 = _769.z;
    float _777 = _769.w;
    float _779 = _701 * _755;
    float _781 = _689 * 2.0;
    float _783 = _673 * 3.883221149444580078125;
    float _785 = floor(_185);
    float _787 = -_781;
    float _789 = fma(_779, _787, _779);
    float _791 = _783 * 0.15915493667125701904296875;
    float _793 = fma(_689, 3.1415927410125732421875, _789);
    float _795 = _791 * 6.283185482025146484375;
    float _797 = cos(_795);
    float _799 = _793 * 0.15915493667125701904296875;
    float _801 = _799 * 6.283185482025146484375;
    float _803 = sin(_801);
    float _805 = -_785;
    float _807 = _185 + _805;
    float _809 = _791 * 6.283185482025146484375;
    float _811 = sin(_809);
    float _813 = _803 * _797;
    float _815 = _803 * _811;
    uint _817 = as_type<uint>(half2(float2(_777, 0.0)));
    float _819 = -_287;
    float _821 = _819 + _771;
    uint _823 = extract_bits(_817, 0u, 8u);
    int _825 = int(_823) & 255;
    uint _827 = extract_bits(_817, 8u, 8u);
    int _829 = int(_827) & 255;
    int _831 = _829 << 8;
    int _833 = _825 | _831;
    float _835 = fma(_807, _821, _287);
    bool _837 = _833 >= 32768;
    int _839 = _833 + (-1024);
    int _841 = _839;
    if (_837)
    {
        int _843 = ~_833;
        int _845 = _843 + 33792;
        int _847 = _845 + 1;
        _841 = _847;
    }
    int _849 = _841;
    int _851 = _849 + 30719;
    float _853 = float(_851);
    float _855 = -_289;
    float _857 = _855 + _773;
    float _859 = fma(_853, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _861 = fma(_807, _857, _289);
    float _863 = abs(_859);
    float _865 = -_863;
    float _867 = _865 + 1.0;
    float _869 = abs(_859);
    float _871 = fma(_869, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _873 = _859 < 0.0;
    float _875 = float(_873);
    int _877 = as_type<int>(_867) + (-218103808);
    float _879 = abs(_859);
    float _881 = fma(_879, _871, -0.212114393711090087890625);
    bool _883 = uint(_877) >= 1920991232u;
    float _885 = -_291;
    float _887 = _885 + _775;
    float _889 = abs(_859);
    float _891 = fma(_889, _881, 1.570728778839111328125);
    float _893 = fma(_807, _887, _291);
    bool _895 = !_883;
    float _921;
    if (!_895)
    {
        int _897 = as_type<int>(_867);
        int _899 = as_type<int>(_821);
        int _901 = as_type<int>(_773);
        int _903 = as_type<int>(_779);
        int _905 = 3920;
        int _907;
        int _909;
        int _911;
        int _913;
        int _915;
        int _917;
        int _919;
        _96(_897, _899, _901, _903, _905, _907, _909, _911, _913, _915, _917, _919, out.gl_Position, out.gl_PointSize);
        _921 = as_type<float>(_917);
        _923 = true;
    }
    else
    {
        float _925 = rsqrt(_867);
        float _927 = _867 * _925;
        float _929 = _925 * 0.5;
        float _931 = -_927;
        float _933 = 0.0 + _931;
        float _935 = fma(_929, _933, 0.5);
        float _937 = fma(_927, _935, _927);
        float _939 = -_937;
        float _941 = 0.0 + _939;
        float _943 = fma(_937, _941, _867);
        float _945 = fma(_929, _943, _937);
        _921 = _945;
    }
    _923 = false;
    float _947 = _921;
    float _949 = in.m_55.x;
    float _951 = in.m_55.y;
    float _953 = in.m_55.z;
    float _955 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _957 = log2(_955);
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _969 = _967 != 0;
    bool _971 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _973 = isnan(0.0);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _979 = _975 || _977;
    float _981 = _957 * _143;
    float _983 = exp2(_981);
    float _985 = _953 * 2.0;
    float _987 = _949 * 2.0;
    float _989 = _951 + _953;
    float _991 = _951 * 2.0;
    float _993 = floor(_987);
    float _995 = _989 + (-1.0);
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1001 = 1.0 + _999;
    float _1003 = floor(_985);
    float _1005 = -_983;
    float _1007 = _1005 + 1.0;
    float _1009 = _979 ? _1007 : 0.0;
    float _1011 = floor(_991);
    bool _1013 = _993 >= 0.0;
    bool _1015 = isnan(_993);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan(0.0);
    bool _1021 = _1017 || _1019;
    int _1023 = _1021 ? 0 : 1;
    bool _1025 = _1003 > 0.0;
    float _1027 = 1.0 / _1001;
    bool _1029 = _1003 >= 0.0;
    bool _1031 = isnan(_1003);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    float _1039 = _951 + _949;
    float _1041 = _951 + (-0.5);
    int _1043 = _1037 ? 0 : 1;
    float _1045 = _1039 + (-1.0);
    bool _1047 = _993 > 0.0;
    bool _1049 = !_961;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1055 = ~_1043;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    int _1061 = _1059;
    if (!_1025)
    {
        int _1063 = ~_1043;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    float _1069 = in.m_59.x;
    float _1071 = in.m_59.y;
    float _1073 = in.m_59.z;
    int _1075 = abs(_1051);
    bool _1077 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1079 = isnan(1.0);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1085 = _1081 || _1083;
    float _1087 = float(_1075);
    float _1089 = float(_1067);
    bool _1091 = !_965;
    int _1093 = _1091 ? 0 : 1;
    bool _1095 = _1011 > 0.0;
    float _1097 = _1087 * _1089;
    int _1099 = abs(_1093);
    bool _1101 = _1011 >= 0.0;
    bool _1103 = isnan(_1011);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    if (_1085)
    {
        float _1111 = _1009 * _1027;
        _145 = _1111;
    }
    float _1113 = _145;
    int _1115 = ~_1023;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    float _1121 = _949 + (-0.5);
    int _1123 = _1119;
    if (!_1047)
    {
        int _1125 = ~_1023;
        int _1127 = _1125 + 1;
        _1123 = _1127;
    }
    int _1129 = _1123;
    float _1131 = _1097 * (-2.0);
    float _1133 = _949 + _953;
    int _1135 = _1109 ? 0 : 1;
    float _1137 = fma(_1131, _1069, _1069);
    float _1139 = float(_1099);
    float _1141 = fma(_1053, _1131, _1053);
    float _1143 = float(_1129);
    float _1145 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1137);
    bool _1147 = !_969;
    int _1149 = _1147 ? 0 : 1;
    float _1151 = _1133 + (-1.0);
    int _1153 = ~_1135;
    int _1155 = _1153 + 1;
    int _1157 = _1155 + 1;
    float _1159 = _1139 * _1143;
    float _1161 = fma(_1141, _1113, _1145);
    int _1163 = abs(_1149);
    float _1165 = in.m_57.x;
    float _1167 = in.m_57.y;
    float _1169 = in.m_57.z;
    int _1171 = _1157;
    if (!_1095)
    {
        int _1173 = ~_1135;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    float _1179 = _1159 * (-2.0);
    float _1181 = _1161 * 0.15915493667125701904296875;
    float _1183 = float(_1163);
    float _1185 = _953 + (-0.5);
    float _1187 = fma(_1179, _1071, _1071);
    float _1189 = float(_1177);
    float _1191 = fma(_997, _1179, _997);
    float _1193 = _1181 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1187);
    float _1199 = _1183 * _1189;
    float _1201 = fma(_1191, _1113, _1197);
    float _1203 = _1199 * (-2.0);
    float _1205 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1207 = _1201 * 0.15915493667125701904296875;
    float _1209 = _1181 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = fma(_1203, _1073, _1073);
    float _1215 = fma(_1205, _1203, _1205);
    float _1217 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1213);
    float _1219 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1221 = _1207 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = fma(_1215, _1113, _1217);
    float _1227 = in.m_53.y;
    float _1229 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1231 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1233 = _1225 * 0.15915493667125701904296875;
    float _1235 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _861);
    float _1237 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1239 = _1207 * 6.283185482025146484375;
    float _1241 = cos(_1239);
    float _1243 = _1229 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1245 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _835);
    float _1247 = _1231 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1249 = _1235 * _1243;
    float _1251 = _1245 * _1237;
    float _1253 = _555 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1255 = _1233 * 6.283185482025146484375;
    float _1257 = cos(_1255);
    float _1259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _893);
    float _1261 = _1195 * _1223;
    float _1263 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1265 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1253);
    float _1267 = _1259 * _1247;
    float _1269 = _1211 * _1223;
    float _1271 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1263);
    float _1273 = _1233 * 6.283185482025146484375;
    float _1275 = sin(_1273);
    float _1277 = _1211 * _1241;
    float _1279 = _1195 * _1241;
    float _1281 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1271);
    float _1283 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1265);
    bool _1285 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1287 = isnan(0.5);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1293 = _1289 || _1291;
    float _1295 = _1223 * _1257;
    float _1297 = -_1227;
    float _1299 = _1297 + 0.85000002384185791015625;
    float _1301 = precise::clamp(_1299, 0.0, 1.0);
    float _1303 = _1211 * _1257;
    float _1305 = _1195 * _1257;
    float _1307 = _1241 * _1257;
    float _1309 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1311 = _1303 * _1249;
    float _1313 = rsqrt(_1281);
    float _1315 = fma(_1275, _1277, _1261);
    float _1317 = fma(_1275, _1261, _1277);
    float _1319 = -_1269;
    float _1321 = fma(_1275, _1279, _1319);
    float _1323 = -_1249;
    float _1325 = _1275 * _1323;
    float _1327 = -_1279;
    float _1329 = fma(_1275, _1269, _1327);
    float _1331 = _1305 * _1249;
    float _1333 = _1309 * 0.15915493667125701904296875;
    float _1335 = fma(_1315, _1251, _1311);
    float _1337 = fma(_1307, _1251, _1325);
    float _1339 = fma(_1321, _1251, _1331);
    float _1341 = _1333 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    float _1345 = fma(_1329, _1267, _1335);
    float _1347 = fma(_1295, _1267, _1337);
    float _1349 = fma(_1317, _1267, _1339);
    float _1351 = _555 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1353 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1355 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1357 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1359 = _1333 * 6.283185482025146484375;
    float _1361 = sin(_1359);
    float _1363 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1353);
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1355);
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1357);
    float _1369 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[8].x;
    float _1371 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1363);
    float _1373 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1365);
    float _1375 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1351);
    float _1377 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1379 = -_1343;
    float _1381 = _1379 + 1.0;
    float _1383 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1367);
    float _1385 = _555 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1387 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1389 = _1377 * _1381;
    float _1391 = _1369 * _1381;
    float _1393 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1385);
    float _1395 = _1369 * _1361;
    float _1397 = _1387 * _1387;
    float _1399 = _1387 * _1361;
    float _1401 = _1377 * _1361;
    float _1403 = fma(_1387, _1389, _1395);
    float _1405 = fma(_1381, _1397, _1343);
    float _1407 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1375);
    float _1409 = -_1399;
    float _1411 = fma(_1377, _1391, _1409);
    float _1413 = -_1401;
    float _1415 = fma(_1387, _1391, _1413);
    float _1417 = _1373 * _1403;
    float _1419 = fma(_1369, _1391, _1343);
    float _1421 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1393);
    float _1423 = _1373 * _1411;
    float _1425 = fma(_1371, _1415, _1417);
    float _1427 = fma(_1387, _1391, _1401);
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1431 = fma(_1371, _1419, _1423);
    float _1433 = fma(_1383, _1405, _1425);
    float _1435 = _1407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1437 = _1283 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1439 = fma(_1383, _1427, _1431);
    float _1441 = _1429 + _1433;
    float _1443 = fma(_1377, _1389, _1343);
    float _1445 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1447 = _1435 + _1439;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1451 = _1441 + _1449;
    float _1453 = fma(_1377, _1391, _1399);
    float _1455 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1445);
    float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1459 = _1447 + _1457;
    float _1461 = _1451 * _1451;
    float _1463 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1465 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1455);
    float _1467 = -_1395;
    float _1469 = fma(_1387, _1389, _1467);
    float _1471 = fma(_1459, _1459, _1461);
    float _1473 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1463);
    float _1475 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1477 = sqrt(_1471);
    float _1479 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1473);
    float _1481 = _1373 * _1443;
    float _1483 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1485 = fma(_1371, _1453, _1481);
    float _1487 = 1.0 / _1475;
    float _1489 = _1483 + _1475;
    float _1491 = fma(_1383, _1469, _1485);
    float _1493 = _1437 + _1491;
    float _1495 = _1437;
    float _1497 = _1491;
    float _1499 = _1373;
    float _1501 = _1383;
    float _1503 = _1471;
    float _1505 = _1459;
    float _1507 = _1479;
    if (_1293)
    {
        _1495 = 1.0;
    }
    float _1509 = _1495;
    bool _1511 = _1477 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1513 = _1489 * _1487;
    float _1515 = _1513 * 0.5;
    float _1517 = _1509;
    if (!_1511)
    {
        _1497 = _1447;
    }
    float _1519 = _1497;
    float _1521 = _1519;
    if (!_1511)
    {
        _1499 = _1441;
    }
    float _1523 = _1499;
    float _1525 = _1523;
    if (!_1511)
    {
        _1501 = _1493;
    }
    float _1527 = _1501;
    bool _1529 = !_1511;
    float _1531 = _1527;
    if (!_1529)
    {
        float _1533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1537 = _1477 + _1535;
        float _1539 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1541 = rsqrt(_1471);
        float _1543 = _1537 * _1533;
        float _1545 = _1543 * 0.15915493667125701904296875;
        float _1547 = _1545 * 6.283185482025146484375;
        float _1549 = cos(_1547);
        float _1551 = _1545 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = _1549 + (-1.0);
        float _1557 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = fma(_1553, _1539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1561 = fma(_1493, _1549, _1557);
        float _1563 = _1541 * _1559;
        float _1565 = fma(_1459, _1563, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1567 = fma(_1451, _1563, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1531 = _1561;
        _1521 = _1565;
        _1525 = _1567;
        _1503 = _1541;
    }
    float _1569 = _1531;
    float _1571 = _1521;
    float _1573 = _1525;
    float _1575 = _1503;
    if (!_1293)
    {
        float _1577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1585 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1583);
        float _1587 = _1579 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = _1581 * 0.15915493667125701904296875;
        float _1593 = _1579 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        float _1597 = 1.0 / _1589;
        float _1599 = _1591 * 6.283185482025146484375;
        float _1601 = cos(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = _1591 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        float _1609 = _1601 * _1603;
        float _1611 = 1.0 / _1585;
        float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1615 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1613;
        float _1617 = 1.0 / _1609;
        float _1619 = 1.0 / _1615;
        float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1623 = _1611 * _1621;
        float _1625 = _1607 * _1617;
        float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1629 = fma(_1625, _1623, _1627);
        float _1631 = _1629 * _1619;
        float _1633 = precise::clamp(_1631, 0.0, 1.0);
        _1505 = _1619;
        _1517 = _1633;
    }
    float _1635 = _1505;
    float _1637 = _1517;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1641 = _1569 + _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1645 = _1571 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1649 = _1573 + _1647;
    float _1651 = _1641 * _1641;
    float _1653 = fma(_1645, _1645, _1651);
    float _1655 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1657 = fma(_1649, _1649, _1653);
    float _1659 = rsqrt(_1657);
    float _1661 = sqrt(_1657);
    float _1663 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1665 = _1645 * _1663;
    float _1667 = _1649 * _1663;
    float _1669 = _1665 * _1665;
    float _1671 = _1667 * _1667;
    float _1673 = _1669 + _1671;
    float _1675 = sqrt(_1673);
    bool _1677 = _1675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1681 = _1675 + _1679;
    float _1683 = _1635;
    float _1685 = _1673;
    float _1687 = _1681;
    float _1689 = _1655;
    float _1691 = _1665;
    float _1693 = _1667;
    float _1695 = _1669;
    float _1697 = _1671;
    if (_1677)
    {
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1699;
    }
    float _1701 = _1683;
    if (_1677)
    {
        float _1703 = rsqrt(_1673);
        _1685 = _1703;
    }
    float _1705 = _1685;
    if (_1677)
    {
        float _1707 = _1681 * _1701;
        _1687 = _1707;
    }
    float _1709 = _1687;
    float _1711 = precise::max(0.0, _1655);
    float _1713 = _1711;
    if (_1677)
    {
        float _1715 = _1709 * 0.15915493667125701904296875;
        _1507 = _1715;
    }
    float _1717 = _1507;
    float _1719 = -_1663;
    float _1721 = -_1711;
    float _1723 = fma(_1641, _1719, _1721);
    float _1725 = _1575;
    float _1727 = _1723;
    if (_1677)
    {
        float _1729 = _1717 * 6.283185482025146484375;
        float _1731 = sin(_1729);
        _1725 = _1731;
    }
    float _1733 = _1725;
    if (_1677)
    {
        float _1735 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1713 = _1735;
    }
    float _1737 = _1713;
    float _1739 = _1709;
    float _1741 = _1737;
    if (_1677)
    {
        float _1743 = _1717 * 6.283185482025146484375;
        float _1745 = cos(_1743);
        _1739 = _1745;
    }
    float _1747 = _1739;
    float _1749 = _1733;
    if (_1677)
    {
        float _1751 = fma(_1733, _1737, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1749 = _1751;
    }
    float _1753 = _1749;
    float _1755 = _1753;
    if (_1677)
    {
        float _1757 = _1705 * _1753;
        _1755 = _1757;
    }
    float _1759 = _1755;
    if (_1677)
    {
        float _1761 = _1747 + (-1.0);
        _1689 = _1761;
    }
    float _1763 = _1689;
    if (_1677)
    {
        float _1765 = _1665 * _1759;
        _1691 = _1765;
    }
    float _1767 = _1691;
    if (_1677)
    {
        float _1769 = _1667 * _1759;
        _1693 = _1769;
    }
    float _1771 = _1693;
    float _1773 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1677)
    {
        float _1775 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1741 = _1775;
    }
    float _1777 = _1741;
    if (_1677)
    {
        float _1779 = _1767 * _1767;
        _1695 = _1779;
    }
    float _1781 = _1695;
    if (_1677)
    {
        float _1783 = _1771 * _1771;
        _1697 = _1783;
    }
    float _1785 = _1697;
    if (_1677)
    {
        float _1787 = fma(_1723, _1747, _1777);
        _1727 = _1787;
    }
    float _1789 = _1727;
    float _1791 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1793 = fma(_1789, _1789, _1781);
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1797 = fma(_1661, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1795);
    float _1799 = precise::clamp(_1797, 0.0, 1.0);
    float _1801 = _1793 + _1785;
    float _1803 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1791);
    float _1805 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1807 = -_1799;
    float _1809 = _1807 + 1.0;
    float _1811 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1813 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1803);
    float _1815 = rsqrt(_1801);
    float _1817 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1819 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1805);
    float _1821 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1823 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1811);
    float _1825 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1817);
    float _1827 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1819);
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1831 = abs(_1809);
    float _1833 = log2(_1831);
    float _1835 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1825);
    float _1837 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1839 = -_1829;
    float _1841 = fma(_1839, _1773, 1.0);
    float _1843 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1823);
    float _1845 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1847 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1849 = _1815 * _1767;
    float _1851 = _1815 * _1789;
    float _1853 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1847);
    float _1855 = _1815 * _1771;
    float _1857 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1859 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1861 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1853);
    float _1863 = log2(_1841);
    float _1865 = -_1857;
    float _1867 = fma(_1851, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1865);
    float _1869 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1871 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1861);
    float _1873 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1875 = -_1855;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1867);
    float _1879 = exp2(_1869);
    float _1881 = fma(_1877, -0.5, 0.5);
    float _1883 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1885 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1873);
    float _1887 = fma(_1877, 0.5, 0.5);
    float _1889 = _1851 + 1.0;
    float _1891 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1883);
    float _1893 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1885);
    float _1895 = 1.0 / _1871;
    float _1897 = fma(_1887, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1899 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1891);
    float _1901 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1893);
    float _1903 = fma(_1887, _1897, -0.212114393711090087890625);
    float _1905 = sqrt(_1881);
    float _1907 = -_1851;
    float _1909 = fma(_1879, _1889, _1907);
    float _1911 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1899);
    float _1913 = _1863 * 0.693147182464599609375;
    float _1915 = fma(_1887, _1903, 1.570728778839111328125);
    float _1917 = fma(_1909, 0.5, 0.5);
    float _1919 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1921 = _1901 * _1895;
    float _1923 = _1911 * _1895;
    float _1925 = fma(_1921, 0.5, 0.5);
    float _1927 = fma(_1923, -0.5, 0.5);
    float _1929 = _1905 * 0.636619746685028076171875;
    float3 _5170 = float3(_1925, _1927, _1919);
    float _1931 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5170, float3(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5170, float3(0.0), isnan(_5170)), level(0.0)).x;
    float _1933 = -_1915;
    float _1935 = fma(_1929, _1933, 1.0);
    float3 _5186 = float3(_1925, _1927, _1919);
    float4 _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5186, float3(0.0), isnan(_5186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5186, float3(0.0), isnan(_5186)), level(0.0)).xyzw;
    float _1939 = _1937.x;
    float _1941 = _1937.y;
    float _1943 = _1937.z;
    float _1945 = _1937.w;
    float2 _5202 = float2(_1935, _1917);
    float3 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5202, float2(0.0), isnan(_5202)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5202, float2(0.0), isnan(_5202)), level(0.0)).xyz;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _891 * _947;
    float _1959 = _875 * 2.0;
    float _1961 = _853 * 3.883221149444580078125;
    bool _1963 = _861 != 0.0;
    bool _1965 = isnan(_861);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(0.0);
    bool _1971 = _1967 || _1969;
    out.m_61.z = _609;
    out.m_61.w = _645;
    float _1973 = -_1959;
    float _1975 = fma(_1957, _1973, _1957);
    float _1977 = _1961 * 0.15915493667125701904296875;
    bool _1979 = _835 == 0.0;
    bool _1981 = !_1971;
    bool _1983 = _1979 && _1981;
    float _1985 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1987 = fma(_875, 3.1415927410125732421875, _1975);
    float _1989 = _1977 * 6.283185482025146484375;
    float _1991 = sin(_1989);
    float _1993 = -_675;
    float _1995 = _1993 + _859;
    bool _1997 = _893 == 0.0;
    bool _1999 = _1997 && _1983;
    float _2001 = _1987 * 0.15915493667125701904296875;
    out.m_63.w = _595;
    float _2003 = fma(_807, _1995, _675);
    float _2005 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2007 = _1977 * 6.283185482025146484375;
    float _2009 = cos(_2007);
    float _2011 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2003);
    float _2013 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2005);
    out.m_65.x = _1571;
    out.m_65.y = _1569;
    out.m_65.z = _1573;
    float _2015 = _1999 ? _2003 : _2011;
    float _2017 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2013);
    float _2019 = _2001 * 6.283185482025146484375;
    float _2021 = sin(_2019);
    float _2023 = _2003;
    float _2025 = _1911;
    float _2027 = _1901;
    if (!_1999)
    {
        _2023 = _2011;
    }
    float _2029 = _2023;
    float _2031 = exp2(_1985);
    float _2033 = -_815;
    float _2035 = fma(_2021, _1991, _2033);
    float _2037 = _2015 * _2015;
    float _2039 = -_813;
    float _2041 = fma(_2021, _2009, _2039);
    float _2043 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2045 = fma(_807, _2035, _815);
    float _2047 = in.m_67.w;
    float _2049 = fma(_807, _2041, _813);
    float _2051 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2045);
    float _2053 = -_2029;
    float _2055 = _1275 * _2053;
    float _2057 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2043);
    float _2059 = _2049;
    float _2061 = _2045;
    if (!_1999)
    {
        float _2063 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2049);
        _2059 = _2063;
    }
    float _2065 = _2059;
    float _2067 = -_2031;
    float _2069 = _2067 + 1.0;
    float _2071 = _1999 ? _2045 : _2051;
    if (!_1999)
    {
        _2061 = _2051;
    }
    float _2073 = _2061;
    float _2075 = _1303 * _2029;
    float _2077 = fma(_1307, _2065, _2055);
    float _2079 = fma(_2071, _2071, _2037);
    float _2081 = _1305 * _2029;
    float _2083 = fma(_1315, _2065, _2075);
    bool _2085 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2087 = isnan(_1661);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2093 = _2089 || _2091;
    float _2095 = rsqrt(_2079);
    float _2097 = fma(_1329, _2073, _2083);
    out.m_69.w = _2047;
    float _2099 = _2097 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2101 = _2015 * _2095;
    float _2103 = _2071 * _2095;
    float _2105 = -_2101;
    float _2107 = _1295 * _2105;
    float _2109 = fma(_1295, _2073, _2077);
    float _2111 = -_2101;
    float _2113 = _1329 * _2111;
    float _2115 = -_2101;
    float _2117 = _1317 * _2115;
    float _2119 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2121 = -_1275;
    float _2123 = fma(_2121, _2103, _2107);
    float _2125 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2127 = fma(_1321, _2065, _2081);
    float _2129 = fma(_1303, _2103, _2113);
    float _2131 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2119);
    float _2133 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2125);
    float _2135 = fma(_1305, _2103, _2117);
    float _2137 = fma(_1317, _2073, _2127);
    float _2139 = _2097 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2141 = _2097 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2143 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2145 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2147 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2149 = fma(_1321, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2057);
    float _2151 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2099);
    float _2153 = fma(_1321, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2131);
    float _2155 = fma(_1321, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2133);
    float _2157 = fma(_2123, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2143);
    float _2159 = fma(_2123, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2145);
    float _2161 = fma(_2123, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2147);
    float _2163 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2139);
    float _2165 = fma(_2137, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2151);
    out.m_71.x = _2153;
    out.m_71.y = _2149;
    out.m_71.z = _2155;
    float _2167 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2141);
    float _2169 = _2165 * _1443;
    float _2171 = _2165 * _1403;
    float _2173 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2157);
    float _2175 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2159);
    float _2177 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2161);
    float _2179 = fma(_2137, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2163);
    float _2181 = _2165 * _1411;
    float _2183 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2017);
    float _2185 = fma(_2137, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2167);
    out.m_73.x = _2173;
    out.m_73.y = _2175;
    out.m_73.z = _2177;
    float _2187 = fma(_2179, _1419, _2181);
    float _2189 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2191 = fma(_2179, _1453, _2169);
    float _2193 = fma(_2179, _1415, _2171);
    float _2195 = _2183 + _1871;
    float _2197 = _1901 + _1871;
    float _2199 = _1871 * 0.5;
    float _2201 = -_2189;
    float _2203 = _2201 + 1.0;
    float _2205 = _2195 * 0.5;
    float _2207 = _2197 * 0.5;
    float _2209 = fma(_1911, -0.5, _2199);
    float _2211 = fma(_2185, _1427, _2187);
    float _2213 = fma(_2185, _1469, _2191);
    float _2215 = fma(_2185, _1405, _2193);
    out.gl_Position.x = _1901;
    out.gl_Position.y = _1911;
    out.gl_Position.z = _2183;
    out.gl_Position.w = _1871;
    float _2217 = _2185;
    if (!_2093)
    {
        _2217 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2219 = _2217;
    out.m_75.x = _2207;
    out.m_75.y = _2209;
    out.m_75.z = _2205;
    out.m_75.w = _1871;
    out.m_77.x = _2211;
    out.m_77.y = _2213;
    out.m_77.z = _2215;
    float _2221 = _2219;
    float _2223 = _2219;
    if (!_2093)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2225 = _2025;
    float _2227 = _2225;
    float _2229 = _2225;
    if (!_2093)
    {
        _2027 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2231 = _2027;
    float _2233 = _2189 * _1931;
    float _2235 = _1945 * _2233;
    float _2237 = _1945 * _2203;
    float _2239 = _1955 * _2233;
    float _2241 = fma(_1951, _2235, _1939);
    float _2243 = fma(_1953, _2235, _1941);
    float _2245 = _1637 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2247 = fma(_1945, _2239, _1943);
    out.m_79.x = _2241;
    out.m_79.y = _2243;
    out.m_79.z = _2247;
    out.m_79.w = _2237;
    bool _2249 = !_2093;
    float _2251 = _2231;
    float _2253 = _2231;
    if (!_2249)
    {
        bool _2255 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2257 = isnan(_1661);
        bool _2259 = _2255 || _2257;
        bool _2261 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2263 = _2259 || _2261;
        if (!_2263)
        {
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2267 = _1661 + _2265;
            float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2271 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2269;
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2281 = 1.0 / _2271;
            float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2287 = _2267 * _2281;
            float _2289 = precise::clamp(_2287, 0.0, 1.0);
            float _2291 = fma(_2289, _2275, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2293 = fma(_2289, _2279, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2295 = fma(_2289, _2285, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2253 = _2293;
            _2229 = _2291;
            _2223 = _2295;
            _2297 = true;
        }
        else
        {
            bool _2299 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2301 = isnan(_1661);
            bool _2303 = _2299 || _2301;
            bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2307 = _2303 || _2305;
            if (!_2307)
            {
                _2227 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2309 = _2227;
            _2229 = _2309;
            if (!_2307)
            {
                _2251 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2311 = _2251;
            _2253 = _2311;
            if (!_2307)
            {
                _2221 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2313 = _2221;
            bool _2315 = !_2307;
            _2223 = _2313;
            if (!_2315)
            {
                bool _2317 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2319 = isnan(_1661);
                bool _2321 = _2317 || _2319;
                bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2325 = _2321 || _2323;
                if (!_2325)
                {
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2329 = _1661 + _2327;
                    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2331;
                    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2343 = 1.0 / _2333;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2349 = _2329 * _2343;
                    float _2351 = precise::clamp(_2349, 0.0, 1.0);
                    float _2353 = fma(_2351, _2337, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2355 = fma(_2351, _2341, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2357 = fma(_2351, _2347, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2253 = _2355;
                    _2229 = _2353;
                    _2223 = _2357;
                    _2297 = true;
                }
                else
                {
                    _2253 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2229 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2223 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2297 = false;
    float _2359 = _2253;
    float _2361 = _2229;
    float _2363 = _2223;
    float _2365 = _2245 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = 0.0;
    float _2367 = _2359 * 0.586610972881317138671875;
    bool _2369 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2365;
    float _2371 = fma(_2361, 0.298911988735198974609375, _2367);
    bool _2373 = _1637 > 0.0;
    bool _2375 = isnan(_1637);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = fma(_2363, 0.114477999508380889892578125, _2371);
    float _2385 = -_2383;
    float _2387 = _2385 + _2361;
    float _2389 = -_2383;
    float _2391 = _2389 + _2359;
    float _2393 = -_2383;
    float _2395 = _2393 + _2363;
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2399 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    bool _2403 = !_2369;
    if (!_2403)
    {
        float _2405 = -_1569;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2409 = -_1571;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2413 = -_1573;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2417 = _2407 * _2407;
        float _2419 = fma(_2411, _2411, _2417);
        float _2421 = fma(_2415, _2415, _2419);
        float _2423 = sqrt(_2421);
        float _2425 = rsqrt(_2421);
        float _2427 = -_2423;
        float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2433 = precise::clamp(_2431, 0.0, 1.0);
        float _2435 = _2411 * _2425;
        float _2437 = _2407 * _2425;
        float _2439 = abs(_2433);
        float _2441 = log2(_2439);
        float _2443 = _2415 * _2425;
        float _2445 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2447 = _2213 * _2437;
        float _2449 = -_2437;
        float _2451 = -_2445;
        float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2451);
        float _2455 = fma(_2211, _2435, _2447);
        float _2457 = -_2443;
        float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2453);
        float _2461 = fma(_2215, _2443, _2455);
        float _2463 = precise::clamp(_2461, 0.0, 1.0);
        float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2467 = _2459 + _2465;
        float _2469 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        float _2475 = exp2(_2469);
        float _2477 = _2475 * _2473;
        float _2479 = _2463 * _2477;
        float _2481 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2483 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2485 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _2481;
        out.m_81.y = _2483;
        out.m_81.z = _2485;
    }
    out.m_83.x = _2397;
    out.m_83.y = _2399;
    out.m_83.z = _2401;
    if (_2381)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2297 = false;
    bool _923 = false;
    bool _731 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2546 = as_type<float>(_125);
        out.gl_Position.z = _2546;
    }
    if (!_111)
    {
        return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    if (_155)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _115;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2615 = as_type<float>(_161);
        out.gl_Position.z = _2615;
    }
    if (_155)
    {
        return out;
    }
    int _163 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _165 = _163;
    int _167 = 0;
    int _169 = _98(_165, _167, (*spvDescriptorSet0.support_buffer));
    float _171 = _143 * 0.0500000007450580596923828125;
    float _173 = in.m_53.z;
    float _175 = trunc(_173);
    int _177 = int(_175);
    float _179 = float(_169);
    int _181 = abs(_169);
    bool _183 = _169 == 0;
    float _185 = _171 * _179;
    float _187 = float(uint(_181));
    float _189 = trunc(_185);
    int _191 = int(_189);
    float _193 = 1.0 / _187;
    int _195 = abs(_191);
    uint _198 = uint(int(uint(_191) >> uint(31)));
    float _200 = float(uint(_195));
    int _202 = ~int(_198);
    int _204 = _202 + 1;
    int _206 = as_type<int>(_193) + (-2);
    float _208 = as_type<float>(_206) * _200;
    float _210 = trunc(_208);
    float _212 = precise::max(_210, 0.0);
    uint _214 = uint(_212);
    int _216 = ~int(_214);
    int _218 = _216 + 1;
    int _220 = _218 * _181;
    int _222 = _220 + _195;
    float _224 = float(uint(_222));
    float _226 = as_type<float>(_206) * _224;
    float _228 = trunc(_226);
    float _230 = precise::max(_228, 0.0);
    uint _232 = uint(_230);
    int _234 = int(_214) + int(_232);
    int _236 = ~_234;
    int _238 = _236 + 1;
    int _240 = _238 * _181;
    int _242 = _240 + _195;
    bool _244 = uint(_242) >= uint(_181);
    bool _246 = !_244;
    int _248 = _246 ? 0 : (-1);
    int _250 = ~_234;
    int _252 = _250 + _248;
    int _254 = _252 + 1;
    int _256 = _254 * _181;
    int _258 = _256 + _195;
    int _260 = _258 ^ _204;
    int _262 = ~_204;
    int _264 = _262 + _260;
    int _266 = _264 + 1;
    bool _268 = !_183;
    int _270 = _268 ? _266 : (-1);
    int _272 = _270;
    int _274 = 0;
    int _276 = _99(_272, _274, (*spvDescriptorSet0.support_buffer));
    int _278 = _177;
    int _280 = 0;
    int _282 = _99(_278, _280, (*spvDescriptorSet0.support_buffer));
    float4 _285 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_276, _282)), 0).xyzw;
    float _287 = _285.x;
    float _289 = _285.y;
    float _291 = _285.z;
    float _293 = _285.w;
    float _295 = in.m_55.w;
    float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _301 = _299 != 0;
    float _303 = in.m_53.y;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _307 = _305 != 0;
    float _309 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _313 = _311 != 0;
    float _315 = in.m_53.x;
    float _317 = in.m_57.w;
    float _319 = as_type<float>(_204);
    float _321 = _303;
    if (_301)
    {
        float _323 = in.m_55.z;
        _319 = _323;
    }
    float _325 = _319;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _329 = _297 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _331 = 0.0;
    if (!_307)
    {
        float _333 = in.m_55.z;
        _331 = _333;
    }
    float _335 = _331;
    bool _337 = _295 > 0.5;
    bool _339 = _337 && _313;
    float _341 = 0.0;
    float _343 = _295;
    if (!_307)
    {
        float _345 = in.m_55.y;
        _341 = _345;
    }
    float _347 = _341;
    float _349 = _315;
    if (_301)
    {
        _343 = _315;
    }
    float _351 = _343;
    float _353 = _351;
    if (_339)
    {
        float _355 = -_303;
        float _357 = _355 + 1.0;
        _321 = _357;
    }
    float _359 = _321;
    bool _361 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _365 = _361 || _363;
    bool _367 = isnan(1.0);
    bool _369 = _365 || _367;
    bool _371 = _325 > 0.5;
    bool _373 = _371 && _301;
    float _375 = fma(_329, _359, -0.5);
    float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _379 = 0.0;
    float _381 = _335;
    if (!_307)
    {
        _379 = _335;
    }
    float _383 = _379;
    float _385 = _347;
    float _387 = _383;
    if (_307)
    {
        float _389 = in.m_55.x;
        float _391 = in.m_55.y;
        _385 = _389;
        _387 = _391;
    }
    float _393 = _385;
    float _395 = _387;
    if (_373)
    {
        float _397 = -_351;
        float _399 = _397 + 1.0;
        _353 = _399;
    }
    float _401 = _353;
    if (_301)
    {
        _349 = _401;
    }
    float _403 = _349;
    float _405 = _377 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _407 = in.m_51.x;
    float _409 = in.m_51.y;
    float _411 = in.m_51.z;
    float _413 = fma(_405, _403, -0.5);
    float _415 = in.m_46.x;
    float _417 = in.m_46.y;
    float _419 = in.m_46.z;
    float _421 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[83].z, _327);
    float _423 = _393 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _427 = _423;
    if (_307)
    {
        _381 = _395;
    }
    float _429 = _381;
    float _431 = _395 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _437 = -_425;
    float _439 = fma(_423, 2.0, _437);
    float _441 = _429;
    if (!_369)
    {
        float _443 = _309 * _309;
        float _445 = _443 * 0.5;
        _427 = _445;
    }
    float _447 = _427;
    float _449 = fma(_431, -2.0, _433);
    float _451 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[83].w, _435);
    float _453 = _447;
    if (!_369)
    {
        _441 = _309;
    }
    float _455 = _441;
    float _457 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _421);
    float _459 = -_143;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[81].x, _439);
    float _463 = _455;
    if (!_369)
    {
        float _465 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _453 = _465;
    }
    float _467 = _453;
    bool _469 = !_369;
    float _471 = _467;
    int _473 = 0;
    if (!_469)
    {
        float _475 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _477 = log2(_475);
        float _479 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _481 = _479 + 1.0;
        float _483 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _485 = _309 * _477;
        float _487 = 1.0 / _481;
        float _489 = _483 * 0.693147182464599609375;
        float _491 = exp2(_485);
        float _493 = 1.0 / _489;
        float _495 = _491 + (-1.0);
        float _497 = -_495;
        float _499 = fma(_497, _493, _309);
        float _501 = _499 * _487;
        float _503 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _471 = _503;
        _473 = as_type<int>(_487);
    }
    float _505 = _471;
    int _507 = _473;
    bool _509 = !_369;
    if (!_509)
    {
        float _511 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _513 = log2(_511);
        float _515 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _517 = _515 + 1.0;
        float _519 = 1.0 / _517;
        float _521 = _309 * _513;
        float _523 = exp2(_521);
        float _525 = -_523;
        float _527 = _525 + 1.0;
        float _529 = _527 * _519;
        _463 = _529;
    }
    float _531 = _463;
    float _533 = fma(_457, _413, _461);
    float _535 = _505 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _537 = _505 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _539 = _270 + 1;
    float _541 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _449);
    float _543 = _505 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _545 = fma(_531, _407, _535);
    float _547 = fma(_531, _409, _537);
    int _549 = abs(_539);
    float _551 = fma(_531, _411, _543);
    float _553 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _451);
    float _555 = fma(_547, _317, _417);
    float _557 = float(uint(_549));
    float _559 = -_541;
    float _561 = fma(_553, _375, _559);
    float _563 = fma(_545, _317, _415);
    float _565 = fma(_551, _317, _419);
    float _567 = as_type<float>(_206) * _557;
    uint _569 = as_type<uint>(half2(float2(_293, 0.0)));
    uint _571 = uint(int(uint(_539) >> uint(31)));
    uint _573 = extract_bits(_569, 0u, 8u);
    int _575 = int(_573) & 255;
    uint _577 = extract_bits(_569, 8u, 8u);
    int _579 = int(_577) & 255;
    int _581 = _579 << 8;
    int _583 = _575 | _581;
    float _585 = trunc(_567);
    float _587 = precise::max(_585, 0.0);
    uint _589 = uint(_587);
    int _591 = ~int(_571);
    int _593 = _591 + 1;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _597 = ~int(_589);
    int _599 = _597 + 1;
    int _601 = _599 * _181;
    int _603 = _601 + _549;
    float _605 = float(uint(_603));
    float _607 = as_type<float>(_206) * _605;
    float _609 = _533 + 0.5;
    float _611 = trunc(_607);
    float _613 = precise::max(_611, 0.0);
    uint _615 = uint(_613);
    int _617 = int(_589) + int(_615);
    int _619 = ~_617;
    int _621 = _619 + 1;
    int _623 = _621 * _181;
    int _625 = _623 + _549;
    bool _627 = uint(_625) >= uint(_181);
    bool _629 = !_627;
    int _631 = _629 ? 0 : (-1);
    bool _633 = _583 >= 32768;
    int _635 = ~_617;
    int _637 = _635 + _631;
    int _639 = _637 + 1;
    int _641 = _639 * _181;
    int _643 = _641 + _549;
    float _645 = _561 + 0.5;
    int _647 = _643 ^ _593;
    int _649 = ~_593;
    int _651 = _649 + _647;
    int _653 = _651 + 1;
    int _655 = _583 + (-1024);
    int _657 = _655;
    if (_633)
    {
        int _659 = ~_583;
        int _661 = _659 + 33792;
        int _663 = _661 + 1;
        _657 = _663;
    }
    int _665 = _657;
    int _667 = _665 + 30719;
    bool _669 = !_183;
    int _671 = _669 ? _653 : (-1);
    float _673 = float(_667);
    float _675 = fma(_673, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _677 = abs(_675);
    float _679 = -_677;
    float _681 = _679 + 1.0;
    float _683 = abs(_675);
    float _685 = fma(_683, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _687 = _675 < 0.0;
    float _689 = float(_687);
    int _691 = as_type<int>(_681) + (-218103808);
    float _693 = abs(_675);
    float _695 = fma(_693, _685, -0.212114393711090087890625);
    bool _697 = uint(_691) >= 1920991232u;
    float _699 = abs(_675);
    float _701 = fma(_699, _695, 1.570728778839111328125);
    bool _703 = !_697;
    float _729;
    if (!_703)
    {
        int _705 = as_type<int>(_681);
        int _707 = as_type<int>(_681);
        int _709 = as_type<int>(_607);
        int _711 = _507;
        int _713 = 3024;
        int _715;
        int _717;
        int _719;
        int _721;
        int _723;
        int _725;
        int _727;
        _96(_705, _707, _709, _711, _713, _715, _717, _719, _721, _723, _725, _727, out.gl_Position, out.gl_PointSize);
        _729 = as_type<float>(_725);
        _731 = true;
    }
    else
    {
        float _733 = rsqrt(_681);
        float _735 = _681 * _733;
        float _737 = _733 * 0.5;
        float _739 = -_735;
        float _741 = 0.0 + _739;
        float _743 = fma(_737, _741, 0.5);
        float _745 = fma(_735, _743, _735);
        float _747 = -_745;
        float _749 = 0.0 + _747;
        float _751 = fma(_745, _749, _681);
        float _753 = fma(_737, _751, _745);
        _729 = _753;
    }
    _731 = false;
    float _755 = _729;
    int _757 = _671;
    int _759 = 0;
    int _761 = _99(_757, _759, (*spvDescriptorSet0.support_buffer));
    int _763 = _177;
    int _765 = 0;
    int _767 = _99(_763, _765, (*spvDescriptorSet0.support_buffer));
    float4 _769 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_761, _767)), 0).xyzw;
    float _771 = _769.x;
    float _773 = _769.y;
    float _775 = _769.z;
    float _777 = _769.w;
    float _779 = _701 * _755;
    float _781 = _689 * 2.0;
    float _783 = _673 * 3.883221149444580078125;
    float _785 = floor(_185);
    float _787 = -_781;
    float _789 = fma(_779, _787, _779);
    float _791 = _783 * 0.15915493667125701904296875;
    float _793 = fma(_689, 3.1415927410125732421875, _789);
    float _795 = _791 * 6.283185482025146484375;
    float _797 = cos(_795);
    float _799 = _793 * 0.15915493667125701904296875;
    float _801 = _799 * 6.283185482025146484375;
    float _803 = sin(_801);
    float _805 = -_785;
    float _807 = _185 + _805;
    float _809 = _791 * 6.283185482025146484375;
    float _811 = sin(_809);
    float _813 = _803 * _797;
    float _815 = _803 * _811;
    uint _817 = as_type<uint>(half2(float2(_777, 0.0)));
    float _819 = -_287;
    float _821 = _819 + _771;
    uint _823 = extract_bits(_817, 0u, 8u);
    int _825 = int(_823) & 255;
    uint _827 = extract_bits(_817, 8u, 8u);
    int _829 = int(_827) & 255;
    int _831 = _829 << 8;
    int _833 = _825 | _831;
    float _835 = fma(_807, _821, _287);
    bool _837 = _833 >= 32768;
    int _839 = _833 + (-1024);
    int _841 = _839;
    if (_837)
    {
        int _843 = ~_833;
        int _845 = _843 + 33792;
        int _847 = _845 + 1;
        _841 = _847;
    }
    int _849 = _841;
    int _851 = _849 + 30719;
    float _853 = float(_851);
    float _855 = -_289;
    float _857 = _855 + _773;
    float _859 = fma(_853, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _861 = fma(_807, _857, _289);
    float _863 = abs(_859);
    float _865 = -_863;
    float _867 = _865 + 1.0;
    float _869 = abs(_859);
    float _871 = fma(_869, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _873 = _859 < 0.0;
    float _875 = float(_873);
    int _877 = as_type<int>(_867) + (-218103808);
    float _879 = abs(_859);
    float _881 = fma(_879, _871, -0.212114393711090087890625);
    bool _883 = uint(_877) >= 1920991232u;
    float _885 = -_291;
    float _887 = _885 + _775;
    float _889 = abs(_859);
    float _891 = fma(_889, _881, 1.570728778839111328125);
    float _893 = fma(_807, _887, _291);
    bool _895 = !_883;
    float _921;
    if (!_895)
    {
        int _897 = as_type<int>(_867);
        int _899 = as_type<int>(_821);
        int _901 = as_type<int>(_773);
        int _903 = as_type<int>(_779);
        int _905 = 3920;
        int _907;
        int _909;
        int _911;
        int _913;
        int _915;
        int _917;
        int _919;
        _96(_897, _899, _901, _903, _905, _907, _909, _911, _913, _915, _917, _919, out.gl_Position, out.gl_PointSize);
        _921 = as_type<float>(_917);
        _923 = true;
    }
    else
    {
        float _925 = rsqrt(_867);
        float _927 = _867 * _925;
        float _929 = _925 * 0.5;
        float _931 = -_927;
        float _933 = 0.0 + _931;
        float _935 = fma(_929, _933, 0.5);
        float _937 = fma(_927, _935, _927);
        float _939 = -_937;
        float _941 = 0.0 + _939;
        float _943 = fma(_937, _941, _867);
        float _945 = fma(_929, _943, _937);
        _921 = _945;
    }
    _923 = false;
    float _947 = _921;
    float _949 = in.m_55.x;
    float _951 = in.m_55.y;
    float _953 = in.m_55.z;
    float _955 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _957 = log2(_955);
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _969 = _967 != 0;
    bool _971 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _973 = isnan(0.0);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _979 = _975 || _977;
    float _981 = _957 * _143;
    float _983 = exp2(_981);
    float _985 = _953 * 2.0;
    float _987 = _949 * 2.0;
    float _989 = _951 + _953;
    float _991 = _951 * 2.0;
    float _993 = floor(_987);
    float _995 = _989 + (-1.0);
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1001 = 1.0 + _999;
    float _1003 = floor(_985);
    float _1005 = -_983;
    float _1007 = _1005 + 1.0;
    float _1009 = _979 ? _1007 : 0.0;
    float _1011 = floor(_991);
    bool _1013 = _993 >= 0.0;
    bool _1015 = isnan(_993);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan(0.0);
    bool _1021 = _1017 || _1019;
    int _1023 = _1021 ? 0 : 1;
    bool _1025 = _1003 > 0.0;
    float _1027 = 1.0 / _1001;
    bool _1029 = _1003 >= 0.0;
    bool _1031 = isnan(_1003);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    float _1039 = _951 + _949;
    float _1041 = _951 + (-0.5);
    int _1043 = _1037 ? 0 : 1;
    float _1045 = _1039 + (-1.0);
    bool _1047 = _993 > 0.0;
    bool _1049 = !_961;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1055 = ~_1043;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    int _1061 = _1059;
    if (!_1025)
    {
        int _1063 = ~_1043;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    float _1069 = in.m_59.x;
    float _1071 = in.m_59.y;
    float _1073 = in.m_59.z;
    int _1075 = abs(_1051);
    bool _1077 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1079 = isnan(1.0);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1085 = _1081 || _1083;
    float _1087 = float(_1075);
    float _1089 = float(_1067);
    bool _1091 = !_965;
    int _1093 = _1091 ? 0 : 1;
    bool _1095 = _1011 > 0.0;
    float _1097 = _1087 * _1089;
    int _1099 = abs(_1093);
    bool _1101 = _1011 >= 0.0;
    bool _1103 = isnan(_1011);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    if (_1085)
    {
        float _1111 = _1009 * _1027;
        _145 = _1111;
    }
    float _1113 = _145;
    int _1115 = ~_1023;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    float _1121 = _949 + (-0.5);
    int _1123 = _1119;
    if (!_1047)
    {
        int _1125 = ~_1023;
        int _1127 = _1125 + 1;
        _1123 = _1127;
    }
    int _1129 = _1123;
    float _1131 = _1097 * (-2.0);
    float _1133 = _949 + _953;
    int _1135 = _1109 ? 0 : 1;
    float _1137 = fma(_1131, _1069, _1069);
    float _1139 = float(_1099);
    float _1141 = fma(_1053, _1131, _1053);
    float _1143 = float(_1129);
    float _1145 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1137);
    bool _1147 = !_969;
    int _1149 = _1147 ? 0 : 1;
    float _1151 = _1133 + (-1.0);
    int _1153 = ~_1135;
    int _1155 = _1153 + 1;
    int _1157 = _1155 + 1;
    float _1159 = _1139 * _1143;
    float _1161 = fma(_1141, _1113, _1145);
    int _1163 = abs(_1149);
    float _1165 = in.m_57.x;
    float _1167 = in.m_57.y;
    float _1169 = in.m_57.z;
    int _1171 = _1157;
    if (!_1095)
    {
        int _1173 = ~_1135;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    float _1179 = _1159 * (-2.0);
    float _1181 = _1161 * 0.15915493667125701904296875;
    float _1183 = float(_1163);
    float _1185 = _953 + (-0.5);
    float _1187 = fma(_1179, _1071, _1071);
    float _1189 = float(_1177);
    float _1191 = fma(_997, _1179, _997);
    float _1193 = _1181 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1187);
    float _1199 = _1183 * _1189;
    float _1201 = fma(_1191, _1113, _1197);
    float _1203 = _1199 * (-2.0);
    float _1205 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1207 = _1201 * 0.15915493667125701904296875;
    float _1209 = _1181 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = fma(_1203, _1073, _1073);
    float _1215 = fma(_1205, _1203, _1205);
    float _1217 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1213);
    float _1219 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1221 = _1207 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = fma(_1215, _1113, _1217);
    float _1227 = in.m_53.y;
    float _1229 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1231 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1233 = _1225 * 0.15915493667125701904296875;
    float _1235 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _861);
    float _1237 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1239 = _1207 * 6.283185482025146484375;
    float _1241 = cos(_1239);
    float _1243 = _1229 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1245 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _835);
    float _1247 = _1231 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1249 = _1235 * _1243;
    float _1251 = _1245 * _1237;
    float _1253 = _555 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1255 = _1233 * 6.283185482025146484375;
    float _1257 = cos(_1255);
    float _1259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _893);
    float _1261 = _1195 * _1223;
    float _1263 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1265 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1253);
    float _1267 = _1259 * _1247;
    float _1269 = _1211 * _1223;
    float _1271 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1263);
    float _1273 = _1233 * 6.283185482025146484375;
    float _1275 = sin(_1273);
    float _1277 = _1211 * _1241;
    float _1279 = _1195 * _1241;
    float _1281 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1271);
    float _1283 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1265);
    bool _1285 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1287 = isnan(0.5);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1293 = _1289 || _1291;
    float _1295 = _1223 * _1257;
    float _1297 = -_1227;
    float _1299 = _1297 + 0.85000002384185791015625;
    float _1301 = precise::clamp(_1299, 0.0, 1.0);
    float _1303 = _1211 * _1257;
    float _1305 = _1195 * _1257;
    float _1307 = _1241 * _1257;
    float _1309 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1311 = _1303 * _1249;
    float _1313 = rsqrt(_1281);
    float _1315 = fma(_1275, _1277, _1261);
    float _1317 = fma(_1275, _1261, _1277);
    float _1319 = -_1269;
    float _1321 = fma(_1275, _1279, _1319);
    float _1323 = -_1249;
    float _1325 = _1275 * _1323;
    float _1327 = -_1279;
    float _1329 = fma(_1275, _1269, _1327);
    float _1331 = _1305 * _1249;
    float _1333 = _1309 * 0.15915493667125701904296875;
    float _1335 = fma(_1315, _1251, _1311);
    float _1337 = fma(_1307, _1251, _1325);
    float _1339 = fma(_1321, _1251, _1331);
    float _1341 = _1333 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    float _1345 = fma(_1329, _1267, _1335);
    float _1347 = fma(_1295, _1267, _1337);
    float _1349 = fma(_1317, _1267, _1339);
    float _1351 = _555 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1353 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1355 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1357 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1359 = _1333 * 6.283185482025146484375;
    float _1361 = sin(_1359);
    float _1363 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1353);
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1355);
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1357);
    float _1369 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[8].x;
    float _1371 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1363);
    float _1373 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1365);
    float _1375 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1351);
    float _1377 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1379 = -_1343;
    float _1381 = _1379 + 1.0;
    float _1383 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1367);
    float _1385 = _555 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1387 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1389 = _1377 * _1381;
    float _1391 = _1369 * _1381;
    float _1393 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1385);
    float _1395 = _1369 * _1361;
    float _1397 = _1387 * _1387;
    float _1399 = _1387 * _1361;
    float _1401 = _1377 * _1361;
    float _1403 = fma(_1387, _1389, _1395);
    float _1405 = fma(_1381, _1397, _1343);
    float _1407 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1375);
    float _1409 = -_1399;
    float _1411 = fma(_1377, _1391, _1409);
    float _1413 = -_1401;
    float _1415 = fma(_1387, _1391, _1413);
    float _1417 = _1373 * _1403;
    float _1419 = fma(_1369, _1391, _1343);
    float _1421 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1393);
    float _1423 = _1373 * _1411;
    float _1425 = fma(_1371, _1415, _1417);
    float _1427 = fma(_1387, _1391, _1401);
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1431 = fma(_1371, _1419, _1423);
    float _1433 = fma(_1383, _1405, _1425);
    float _1435 = _1407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1437 = _1283 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1439 = fma(_1383, _1427, _1431);
    float _1441 = _1429 + _1433;
    float _1443 = fma(_1377, _1389, _1343);
    float _1445 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1447 = _1435 + _1439;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1451 = _1441 + _1449;
    float _1453 = fma(_1377, _1391, _1399);
    float _1455 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1445);
    float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1459 = _1447 + _1457;
    float _1461 = _1451 * _1451;
    float _1463 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1465 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1455);
    float _1467 = -_1395;
    float _1469 = fma(_1387, _1389, _1467);
    float _1471 = fma(_1459, _1459, _1461);
    float _1473 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1463);
    float _1475 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1477 = sqrt(_1471);
    float _1479 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1473);
    float _1481 = _1373 * _1443;
    float _1483 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1485 = fma(_1371, _1453, _1481);
    float _1487 = 1.0 / _1475;
    float _1489 = _1483 + _1475;
    float _1491 = fma(_1383, _1469, _1485);
    float _1493 = _1437 + _1491;
    float _1495 = _1437;
    float _1497 = _1491;
    float _1499 = _1373;
    float _1501 = _1383;
    float _1503 = _1471;
    float _1505 = _1459;
    float _1507 = _1479;
    if (_1293)
    {
        _1495 = 1.0;
    }
    float _1509 = _1495;
    bool _1511 = _1477 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1513 = _1489 * _1487;
    float _1515 = _1513 * 0.5;
    float _1517 = _1509;
    if (!_1511)
    {
        _1497 = _1447;
    }
    float _1519 = _1497;
    float _1521 = _1519;
    if (!_1511)
    {
        _1499 = _1441;
    }
    float _1523 = _1499;
    float _1525 = _1523;
    if (!_1511)
    {
        _1501 = _1493;
    }
    float _1527 = _1501;
    bool _1529 = !_1511;
    float _1531 = _1527;
    if (!_1529)
    {
        float _1533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1537 = _1477 + _1535;
        float _1539 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1541 = rsqrt(_1471);
        float _1543 = _1537 * _1533;
        float _1545 = _1543 * 0.15915493667125701904296875;
        float _1547 = _1545 * 6.283185482025146484375;
        float _1549 = cos(_1547);
        float _1551 = _1545 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = _1549 + (-1.0);
        float _1557 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = fma(_1553, _1539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1561 = fma(_1493, _1549, _1557);
        float _1563 = _1541 * _1559;
        float _1565 = fma(_1459, _1563, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1567 = fma(_1451, _1563, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1531 = _1561;
        _1521 = _1565;
        _1525 = _1567;
        _1503 = _1541;
    }
    float _1569 = _1531;
    float _1571 = _1521;
    float _1573 = _1525;
    float _1575 = _1503;
    if (!_1293)
    {
        float _1577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1585 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1583);
        float _1587 = _1579 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = _1581 * 0.15915493667125701904296875;
        float _1593 = _1579 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        float _1597 = 1.0 / _1589;
        float _1599 = _1591 * 6.283185482025146484375;
        float _1601 = cos(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = _1591 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        float _1609 = _1601 * _1603;
        float _1611 = 1.0 / _1585;
        float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1615 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1613;
        float _1617 = 1.0 / _1609;
        float _1619 = 1.0 / _1615;
        float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1623 = _1611 * _1621;
        float _1625 = _1607 * _1617;
        float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1629 = fma(_1625, _1623, _1627);
        float _1631 = _1629 * _1619;
        float _1633 = precise::clamp(_1631, 0.0, 1.0);
        _1505 = _1619;
        _1517 = _1633;
    }
    float _1635 = _1505;
    float _1637 = _1517;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1641 = _1569 + _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1645 = _1571 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1649 = _1573 + _1647;
    float _1651 = _1641 * _1641;
    float _1653 = fma(_1645, _1645, _1651);
    float _1655 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1657 = fma(_1649, _1649, _1653);
    float _1659 = rsqrt(_1657);
    float _1661 = sqrt(_1657);
    float _1663 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1665 = _1645 * _1663;
    float _1667 = _1649 * _1663;
    float _1669 = _1665 * _1665;
    float _1671 = _1667 * _1667;
    float _1673 = _1669 + _1671;
    float _1675 = sqrt(_1673);
    bool _1677 = _1675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1681 = _1675 + _1679;
    float _1683 = _1635;
    float _1685 = _1673;
    float _1687 = _1681;
    float _1689 = _1655;
    float _1691 = _1665;
    float _1693 = _1667;
    float _1695 = _1669;
    float _1697 = _1671;
    if (_1677)
    {
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1699;
    }
    float _1701 = _1683;
    if (_1677)
    {
        float _1703 = rsqrt(_1673);
        _1685 = _1703;
    }
    float _1705 = _1685;
    if (_1677)
    {
        float _1707 = _1681 * _1701;
        _1687 = _1707;
    }
    float _1709 = _1687;
    float _1711 = precise::max(0.0, _1655);
    float _1713 = _1711;
    if (_1677)
    {
        float _1715 = _1709 * 0.15915493667125701904296875;
        _1507 = _1715;
    }
    float _1717 = _1507;
    float _1719 = -_1663;
    float _1721 = -_1711;
    float _1723 = fma(_1641, _1719, _1721);
    float _1725 = _1575;
    float _1727 = _1723;
    if (_1677)
    {
        float _1729 = _1717 * 6.283185482025146484375;
        float _1731 = sin(_1729);
        _1725 = _1731;
    }
    float _1733 = _1725;
    if (_1677)
    {
        float _1735 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1713 = _1735;
    }
    float _1737 = _1713;
    float _1739 = _1709;
    float _1741 = _1737;
    if (_1677)
    {
        float _1743 = _1717 * 6.283185482025146484375;
        float _1745 = cos(_1743);
        _1739 = _1745;
    }
    float _1747 = _1739;
    float _1749 = _1733;
    if (_1677)
    {
        float _1751 = fma(_1733, _1737, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1749 = _1751;
    }
    float _1753 = _1749;
    float _1755 = _1753;
    if (_1677)
    {
        float _1757 = _1705 * _1753;
        _1755 = _1757;
    }
    float _1759 = _1755;
    if (_1677)
    {
        float _1761 = _1747 + (-1.0);
        _1689 = _1761;
    }
    float _1763 = _1689;
    if (_1677)
    {
        float _1765 = _1665 * _1759;
        _1691 = _1765;
    }
    float _1767 = _1691;
    if (_1677)
    {
        float _1769 = _1667 * _1759;
        _1693 = _1769;
    }
    float _1771 = _1693;
    float _1773 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1677)
    {
        float _1775 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1741 = _1775;
    }
    float _1777 = _1741;
    if (_1677)
    {
        float _1779 = _1767 * _1767;
        _1695 = _1779;
    }
    float _1781 = _1695;
    if (_1677)
    {
        float _1783 = _1771 * _1771;
        _1697 = _1783;
    }
    float _1785 = _1697;
    if (_1677)
    {
        float _1787 = fma(_1723, _1747, _1777);
        _1727 = _1787;
    }
    float _1789 = _1727;
    float _1791 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1793 = fma(_1789, _1789, _1781);
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1797 = fma(_1661, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1795);
    float _1799 = precise::clamp(_1797, 0.0, 1.0);
    float _1801 = _1793 + _1785;
    float _1803 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1791);
    float _1805 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1807 = -_1799;
    float _1809 = _1807 + 1.0;
    float _1811 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1813 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1803);
    float _1815 = rsqrt(_1801);
    float _1817 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1819 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1805);
    float _1821 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1823 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1811);
    float _1825 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1817);
    float _1827 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1819);
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1831 = abs(_1809);
    float _1833 = log2(_1831);
    float _1835 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1825);
    float _1837 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1839 = -_1829;
    float _1841 = fma(_1839, _1773, 1.0);
    float _1843 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1823);
    float _1845 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1847 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1849 = _1815 * _1767;
    float _1851 = _1815 * _1789;
    float _1853 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1847);
    float _1855 = _1815 * _1771;
    float _1857 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1859 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1861 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1853);
    float _1863 = log2(_1841);
    float _1865 = -_1857;
    float _1867 = fma(_1851, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1865);
    float _1869 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1871 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1861);
    float _1873 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1875 = -_1855;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1867);
    float _1879 = exp2(_1869);
    float _1881 = fma(_1877, -0.5, 0.5);
    float _1883 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1885 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1873);
    float _1887 = fma(_1877, 0.5, 0.5);
    float _1889 = _1851 + 1.0;
    float _1891 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1883);
    float _1893 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1885);
    float _1895 = 1.0 / _1871;
    float _1897 = fma(_1887, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1899 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1891);
    float _1901 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1893);
    float _1903 = fma(_1887, _1897, -0.212114393711090087890625);
    float _1905 = sqrt(_1881);
    float _1907 = -_1851;
    float _1909 = fma(_1879, _1889, _1907);
    float _1911 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1899);
    float _1913 = _1863 * 0.693147182464599609375;
    float _1915 = fma(_1887, _1903, 1.570728778839111328125);
    float _1917 = fma(_1909, 0.5, 0.5);
    float _1919 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1921 = _1901 * _1895;
    float _1923 = _1911 * _1895;
    float _1925 = fma(_1921, 0.5, 0.5);
    float _1927 = fma(_1923, -0.5, 0.5);
    float _1929 = _1905 * 0.636619746685028076171875;
    float3 _5170 = float3(_1925, _1927, _1919);
    float _1931 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5170, float3(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5170, float3(0.0), isnan(_5170)), level(0.0)).x;
    float _1933 = -_1915;
    float _1935 = fma(_1929, _1933, 1.0);
    float3 _5186 = float3(_1925, _1927, _1919);
    float4 _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5186, float3(0.0), isnan(_5186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5186, float3(0.0), isnan(_5186)), level(0.0)).xyzw;
    float _1939 = _1937.x;
    float _1941 = _1937.y;
    float _1943 = _1937.z;
    float _1945 = _1937.w;
    float2 _5202 = float2(_1935, _1917);
    float3 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5202, float2(0.0), isnan(_5202)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5202, float2(0.0), isnan(_5202)), level(0.0)).xyz;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _891 * _947;
    float _1959 = _875 * 2.0;
    float _1961 = _853 * 3.883221149444580078125;
    bool _1963 = _861 != 0.0;
    bool _1965 = isnan(_861);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(0.0);
    bool _1971 = _1967 || _1969;
    out.m_61.z = _609;
    out.m_61.w = _645;
    float _1973 = -_1959;
    float _1975 = fma(_1957, _1973, _1957);
    float _1977 = _1961 * 0.15915493667125701904296875;
    bool _1979 = _835 == 0.0;
    bool _1981 = !_1971;
    bool _1983 = _1979 && _1981;
    float _1985 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1987 = fma(_875, 3.1415927410125732421875, _1975);
    float _1989 = _1977 * 6.283185482025146484375;
    float _1991 = sin(_1989);
    float _1993 = -_675;
    float _1995 = _1993 + _859;
    bool _1997 = _893 == 0.0;
    bool _1999 = _1997 && _1983;
    float _2001 = _1987 * 0.15915493667125701904296875;
    out.m_63.w = _595;
    float _2003 = fma(_807, _1995, _675);
    float _2005 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2007 = _1977 * 6.283185482025146484375;
    float _2009 = cos(_2007);
    float _2011 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2003);
    float _2013 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2005);
    out.m_65.x = _1571;
    out.m_65.y = _1569;
    out.m_65.z = _1573;
    float _2015 = _1999 ? _2003 : _2011;
    float _2017 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2013);
    float _2019 = _2001 * 6.283185482025146484375;
    float _2021 = sin(_2019);
    float _2023 = _2003;
    float _2025 = _1911;
    float _2027 = _1901;
    if (!_1999)
    {
        _2023 = _2011;
    }
    float _2029 = _2023;
    float _2031 = exp2(_1985);
    float _2033 = -_815;
    float _2035 = fma(_2021, _1991, _2033);
    float _2037 = _2015 * _2015;
    float _2039 = -_813;
    float _2041 = fma(_2021, _2009, _2039);
    float _2043 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2045 = fma(_807, _2035, _815);
    float _2047 = in.m_67.w;
    float _2049 = fma(_807, _2041, _813);
    float _2051 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2045);
    float _2053 = -_2029;
    float _2055 = _1275 * _2053;
    float _2057 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2043);
    float _2059 = _2049;
    float _2061 = _2045;
    if (!_1999)
    {
        float _2063 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2049);
        _2059 = _2063;
    }
    float _2065 = _2059;
    float _2067 = -_2031;
    float _2069 = _2067 + 1.0;
    float _2071 = _1999 ? _2045 : _2051;
    if (!_1999)
    {
        _2061 = _2051;
    }
    float _2073 = _2061;
    float _2075 = _1303 * _2029;
    float _2077 = fma(_1307, _2065, _2055);
    float _2079 = fma(_2071, _2071, _2037);
    float _2081 = _1305 * _2029;
    float _2083 = fma(_1315, _2065, _2075);
    bool _2085 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2087 = isnan(_1661);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2093 = _2089 || _2091;
    float _2095 = rsqrt(_2079);
    float _2097 = fma(_1329, _2073, _2083);
    out.m_69.w = _2047;
    float _2099 = _2097 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2101 = _2015 * _2095;
    float _2103 = _2071 * _2095;
    float _2105 = -_2101;
    float _2107 = _1295 * _2105;
    float _2109 = fma(_1295, _2073, _2077);
    float _2111 = -_2101;
    float _2113 = _1329 * _2111;
    float _2115 = -_2101;
    float _2117 = _1317 * _2115;
    float _2119 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2121 = -_1275;
    float _2123 = fma(_2121, _2103, _2107);
    float _2125 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2127 = fma(_1321, _2065, _2081);
    float _2129 = fma(_1303, _2103, _2113);
    float _2131 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2119);
    float _2133 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2125);
    float _2135 = fma(_1305, _2103, _2117);
    float _2137 = fma(_1317, _2073, _2127);
    float _2139 = _2097 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2141 = _2097 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2143 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2145 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2147 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2149 = fma(_1321, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2057);
    float _2151 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2099);
    float _2153 = fma(_1321, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2131);
    float _2155 = fma(_1321, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2133);
    float _2157 = fma(_2123, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2143);
    float _2159 = fma(_2123, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2145);
    float _2161 = fma(_2123, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2147);
    float _2163 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2139);
    float _2165 = fma(_2137, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2151);
    out.m_71.x = _2153;
    out.m_71.y = _2149;
    out.m_71.z = _2155;
    float _2167 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2141);
    float _2169 = _2165 * _1443;
    float _2171 = _2165 * _1403;
    float _2173 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2157);
    float _2175 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2159);
    float _2177 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2161);
    float _2179 = fma(_2137, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2163);
    float _2181 = _2165 * _1411;
    float _2183 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2017);
    float _2185 = fma(_2137, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2167);
    out.m_73.x = _2173;
    out.m_73.y = _2175;
    out.m_73.z = _2177;
    float _2187 = fma(_2179, _1419, _2181);
    float _2189 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2191 = fma(_2179, _1453, _2169);
    float _2193 = fma(_2179, _1415, _2171);
    float _2195 = _2183 + _1871;
    float _2197 = _1901 + _1871;
    float _2199 = _1871 * 0.5;
    float _2201 = -_2189;
    float _2203 = _2201 + 1.0;
    float _2205 = _2195 * 0.5;
    float _2207 = _2197 * 0.5;
    float _2209 = fma(_1911, -0.5, _2199);
    float _2211 = fma(_2185, _1427, _2187);
    float _2213 = fma(_2185, _1469, _2191);
    float _2215 = fma(_2185, _1405, _2193);
    out.gl_Position.x = _1901;
    out.gl_Position.y = _1911;
    out.gl_Position.z = _2183;
    out.gl_Position.w = _1871;
    float _2217 = _2185;
    if (!_2093)
    {
        _2217 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2219 = _2217;
    out.m_75.x = _2207;
    out.m_75.y = _2209;
    out.m_75.z = _2205;
    out.m_75.w = _1871;
    out.m_77.x = _2211;
    out.m_77.y = _2213;
    out.m_77.z = _2215;
    float _2221 = _2219;
    float _2223 = _2219;
    if (!_2093)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2225 = _2025;
    float _2227 = _2225;
    float _2229 = _2225;
    if (!_2093)
    {
        _2027 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2231 = _2027;
    float _2233 = _2189 * _1931;
    float _2235 = _1945 * _2233;
    float _2237 = _1945 * _2203;
    float _2239 = _1955 * _2233;
    float _2241 = fma(_1951, _2235, _1939);
    float _2243 = fma(_1953, _2235, _1941);
    float _2245 = _1637 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2247 = fma(_1945, _2239, _1943);
    out.m_79.x = _2241;
    out.m_79.y = _2243;
    out.m_79.z = _2247;
    out.m_79.w = _2237;
    bool _2249 = !_2093;
    float _2251 = _2231;
    float _2253 = _2231;
    if (!_2249)
    {
        bool _2255 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2257 = isnan(_1661);
        bool _2259 = _2255 || _2257;
        bool _2261 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2263 = _2259 || _2261;
        if (!_2263)
        {
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2267 = _1661 + _2265;
            float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2271 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2269;
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2281 = 1.0 / _2271;
            float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2287 = _2267 * _2281;
            float _2289 = precise::clamp(_2287, 0.0, 1.0);
            float _2291 = fma(_2289, _2275, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2293 = fma(_2289, _2279, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2295 = fma(_2289, _2285, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2253 = _2293;
            _2229 = _2291;
            _2223 = _2295;
            _2297 = true;
        }
        else
        {
            bool _2299 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2301 = isnan(_1661);
            bool _2303 = _2299 || _2301;
            bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2307 = _2303 || _2305;
            if (!_2307)
            {
                _2227 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2309 = _2227;
            _2229 = _2309;
            if (!_2307)
            {
                _2251 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2311 = _2251;
            _2253 = _2311;
            if (!_2307)
            {
                _2221 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2313 = _2221;
            bool _2315 = !_2307;
            _2223 = _2313;
            if (!_2315)
            {
                bool _2317 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2319 = isnan(_1661);
                bool _2321 = _2317 || _2319;
                bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2325 = _2321 || _2323;
                if (!_2325)
                {
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2329 = _1661 + _2327;
                    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2331;
                    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2343 = 1.0 / _2333;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2349 = _2329 * _2343;
                    float _2351 = precise::clamp(_2349, 0.0, 1.0);
                    float _2353 = fma(_2351, _2337, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2355 = fma(_2351, _2341, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2357 = fma(_2351, _2347, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2253 = _2355;
                    _2229 = _2353;
                    _2223 = _2357;
                    _2297 = true;
                }
                else
                {
                    _2253 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2229 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2223 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2297 = false;
    float _2359 = _2253;
    float _2361 = _2229;
    float _2363 = _2223;
    float _2365 = _2245 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = 0.0;
    float _2367 = _2359 * 0.586610972881317138671875;
    bool _2369 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2365;
    float _2371 = fma(_2361, 0.298911988735198974609375, _2367);
    bool _2373 = _1637 > 0.0;
    bool _2375 = isnan(_1637);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = fma(_2363, 0.114477999508380889892578125, _2371);
    float _2385 = -_2383;
    float _2387 = _2385 + _2361;
    float _2389 = -_2383;
    float _2391 = _2389 + _2359;
    float _2393 = -_2383;
    float _2395 = _2393 + _2363;
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2399 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    bool _2403 = !_2369;
    if (!_2403)
    {
        float _2405 = -_1569;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2409 = -_1571;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2413 = -_1573;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2417 = _2407 * _2407;
        float _2419 = fma(_2411, _2411, _2417);
        float _2421 = fma(_2415, _2415, _2419);
        float _2423 = sqrt(_2421);
        float _2425 = rsqrt(_2421);
        float _2427 = -_2423;
        float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2433 = precise::clamp(_2431, 0.0, 1.0);
        float _2435 = _2411 * _2425;
        float _2437 = _2407 * _2425;
        float _2439 = abs(_2433);
        float _2441 = log2(_2439);
        float _2443 = _2415 * _2425;
        float _2445 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2447 = _2213 * _2437;
        float _2449 = -_2437;
        float _2451 = -_2445;
        float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2451);
        float _2455 = fma(_2211, _2435, _2447);
        float _2457 = -_2443;
        float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2453);
        float _2461 = fma(_2215, _2443, _2455);
        float _2463 = precise::clamp(_2461, 0.0, 1.0);
        float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2467 = _2459 + _2465;
        float _2469 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        float _2475 = exp2(_2469);
        float _2477 = _2475 * _2473;
        float _2479 = _2463 * _2477;
        float _2481 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2483 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2485 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _2481;
        out.m_81.y = _2483;
        out.m_81.z = _2485;
    }
    out.m_83.x = _2397;
    out.m_83.y = _2399;
    out.m_83.z = _2401;
    if (_2381)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2297 = false;
    bool _923 = false;
    bool _731 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2546 = as_type<float>(_125);
        out.gl_Position.z = _2546;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    if (_155)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _115;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2615 = as_type<float>(_161);
        out.gl_Position.z = _2615;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    int _163 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _165 = _163;
    int _167 = 0;
    int _169 = _98(_165, _167, (*spvDescriptorSet0.support_buffer));
    float _171 = _143 * 0.0500000007450580596923828125;
    float _173 = in.m_53.z;
    float _175 = trunc(_173);
    int _177 = int(_175);
    float _179 = float(_169);
    int _181 = abs(_169);
    bool _183 = _169 == 0;
    float _185 = _171 * _179;
    float _187 = float(uint(_181));
    float _189 = trunc(_185);
    int _191 = int(_189);
    float _193 = 1.0 / _187;
    int _195 = abs(_191);
    uint _198 = uint(int(uint(_191) >> uint(31)));
    float _200 = float(uint(_195));
    int _202 = ~int(_198);
    int _204 = _202 + 1;
    int _206 = as_type<int>(_193) + (-2);
    float _208 = as_type<float>(_206) * _200;
    float _210 = trunc(_208);
    float _212 = precise::max(_210, 0.0);
    uint _214 = uint(_212);
    int _216 = ~int(_214);
    int _218 = _216 + 1;
    int _220 = _218 * _181;
    int _222 = _220 + _195;
    float _224 = float(uint(_222));
    float _226 = as_type<float>(_206) * _224;
    float _228 = trunc(_226);
    float _230 = precise::max(_228, 0.0);
    uint _232 = uint(_230);
    int _234 = int(_214) + int(_232);
    int _236 = ~_234;
    int _238 = _236 + 1;
    int _240 = _238 * _181;
    int _242 = _240 + _195;
    bool _244 = uint(_242) >= uint(_181);
    bool _246 = !_244;
    int _248 = _246 ? 0 : (-1);
    int _250 = ~_234;
    int _252 = _250 + _248;
    int _254 = _252 + 1;
    int _256 = _254 * _181;
    int _258 = _256 + _195;
    int _260 = _258 ^ _204;
    int _262 = ~_204;
    int _264 = _262 + _260;
    int _266 = _264 + 1;
    bool _268 = !_183;
    int _270 = _268 ? _266 : (-1);
    int _272 = _270;
    int _274 = 0;
    int _276 = _99(_272, _274, (*spvDescriptorSet0.support_buffer));
    int _278 = _177;
    int _280 = 0;
    int _282 = _99(_278, _280, (*spvDescriptorSet0.support_buffer));
    float4 _285 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_276, _282)), 0).xyzw;
    float _287 = _285.x;
    float _289 = _285.y;
    float _291 = _285.z;
    float _293 = _285.w;
    float _295 = in.m_55.w;
    float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _301 = _299 != 0;
    float _303 = in.m_53.y;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _307 = _305 != 0;
    float _309 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _313 = _311 != 0;
    float _315 = in.m_53.x;
    float _317 = in.m_57.w;
    float _319 = as_type<float>(_204);
    float _321 = _303;
    if (_301)
    {
        float _323 = in.m_55.z;
        _319 = _323;
    }
    float _325 = _319;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _329 = _297 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _331 = 0.0;
    if (!_307)
    {
        float _333 = in.m_55.z;
        _331 = _333;
    }
    float _335 = _331;
    bool _337 = _295 > 0.5;
    bool _339 = _337 && _313;
    float _341 = 0.0;
    float _343 = _295;
    if (!_307)
    {
        float _345 = in.m_55.y;
        _341 = _345;
    }
    float _347 = _341;
    float _349 = _315;
    if (_301)
    {
        _343 = _315;
    }
    float _351 = _343;
    float _353 = _351;
    if (_339)
    {
        float _355 = -_303;
        float _357 = _355 + 1.0;
        _321 = _357;
    }
    float _359 = _321;
    bool _361 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _365 = _361 || _363;
    bool _367 = isnan(1.0);
    bool _369 = _365 || _367;
    bool _371 = _325 > 0.5;
    bool _373 = _371 && _301;
    float _375 = fma(_329, _359, -0.5);
    float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _379 = 0.0;
    float _381 = _335;
    if (!_307)
    {
        _379 = _335;
    }
    float _383 = _379;
    float _385 = _347;
    float _387 = _383;
    if (_307)
    {
        float _389 = in.m_55.x;
        float _391 = in.m_55.y;
        _385 = _389;
        _387 = _391;
    }
    float _393 = _385;
    float _395 = _387;
    if (_373)
    {
        float _397 = -_351;
        float _399 = _397 + 1.0;
        _353 = _399;
    }
    float _401 = _353;
    if (_301)
    {
        _349 = _401;
    }
    float _403 = _349;
    float _405 = _377 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _407 = in.m_51.x;
    float _409 = in.m_51.y;
    float _411 = in.m_51.z;
    float _413 = fma(_405, _403, -0.5);
    float _415 = in.m_46.x;
    float _417 = in.m_46.y;
    float _419 = in.m_46.z;
    float _421 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[83].z, _327);
    float _423 = _393 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _427 = _423;
    if (_307)
    {
        _381 = _395;
    }
    float _429 = _381;
    float _431 = _395 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _437 = -_425;
    float _439 = fma(_423, 2.0, _437);
    float _441 = _429;
    if (!_369)
    {
        float _443 = _309 * _309;
        float _445 = _443 * 0.5;
        _427 = _445;
    }
    float _447 = _427;
    float _449 = fma(_431, -2.0, _433);
    float _451 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[83].w, _435);
    float _453 = _447;
    if (!_369)
    {
        _441 = _309;
    }
    float _455 = _441;
    float _457 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _421);
    float _459 = -_143;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[81].x, _439);
    float _463 = _455;
    if (!_369)
    {
        float _465 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _453 = _465;
    }
    float _467 = _453;
    bool _469 = !_369;
    float _471 = _467;
    int _473 = 0;
    if (!_469)
    {
        float _475 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _477 = log2(_475);
        float _479 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _481 = _479 + 1.0;
        float _483 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _485 = _309 * _477;
        float _487 = 1.0 / _481;
        float _489 = _483 * 0.693147182464599609375;
        float _491 = exp2(_485);
        float _493 = 1.0 / _489;
        float _495 = _491 + (-1.0);
        float _497 = -_495;
        float _499 = fma(_497, _493, _309);
        float _501 = _499 * _487;
        float _503 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _471 = _503;
        _473 = as_type<int>(_487);
    }
    float _505 = _471;
    int _507 = _473;
    bool _509 = !_369;
    if (!_509)
    {
        float _511 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _513 = log2(_511);
        float _515 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _517 = _515 + 1.0;
        float _519 = 1.0 / _517;
        float _521 = _309 * _513;
        float _523 = exp2(_521);
        float _525 = -_523;
        float _527 = _525 + 1.0;
        float _529 = _527 * _519;
        _463 = _529;
    }
    float _531 = _463;
    float _533 = fma(_457, _413, _461);
    float _535 = _505 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _537 = _505 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _539 = _270 + 1;
    float _541 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _449);
    float _543 = _505 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _545 = fma(_531, _407, _535);
    float _547 = fma(_531, _409, _537);
    int _549 = abs(_539);
    float _551 = fma(_531, _411, _543);
    float _553 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _451);
    float _555 = fma(_547, _317, _417);
    float _557 = float(uint(_549));
    float _559 = -_541;
    float _561 = fma(_553, _375, _559);
    float _563 = fma(_545, _317, _415);
    float _565 = fma(_551, _317, _419);
    float _567 = as_type<float>(_206) * _557;
    uint _569 = as_type<uint>(half2(float2(_293, 0.0)));
    uint _571 = uint(int(uint(_539) >> uint(31)));
    uint _573 = extract_bits(_569, 0u, 8u);
    int _575 = int(_573) & 255;
    uint _577 = extract_bits(_569, 8u, 8u);
    int _579 = int(_577) & 255;
    int _581 = _579 << 8;
    int _583 = _575 | _581;
    float _585 = trunc(_567);
    float _587 = precise::max(_585, 0.0);
    uint _589 = uint(_587);
    int _591 = ~int(_571);
    int _593 = _591 + 1;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _597 = ~int(_589);
    int _599 = _597 + 1;
    int _601 = _599 * _181;
    int _603 = _601 + _549;
    float _605 = float(uint(_603));
    float _607 = as_type<float>(_206) * _605;
    float _609 = _533 + 0.5;
    float _611 = trunc(_607);
    float _613 = precise::max(_611, 0.0);
    uint _615 = uint(_613);
    int _617 = int(_589) + int(_615);
    int _619 = ~_617;
    int _621 = _619 + 1;
    int _623 = _621 * _181;
    int _625 = _623 + _549;
    bool _627 = uint(_625) >= uint(_181);
    bool _629 = !_627;
    int _631 = _629 ? 0 : (-1);
    bool _633 = _583 >= 32768;
    int _635 = ~_617;
    int _637 = _635 + _631;
    int _639 = _637 + 1;
    int _641 = _639 * _181;
    int _643 = _641 + _549;
    float _645 = _561 + 0.5;
    int _647 = _643 ^ _593;
    int _649 = ~_593;
    int _651 = _649 + _647;
    int _653 = _651 + 1;
    int _655 = _583 + (-1024);
    int _657 = _655;
    if (_633)
    {
        int _659 = ~_583;
        int _661 = _659 + 33792;
        int _663 = _661 + 1;
        _657 = _663;
    }
    int _665 = _657;
    int _667 = _665 + 30719;
    bool _669 = !_183;
    int _671 = _669 ? _653 : (-1);
    float _673 = float(_667);
    float _675 = fma(_673, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _677 = abs(_675);
    float _679 = -_677;
    float _681 = _679 + 1.0;
    float _683 = abs(_675);
    float _685 = fma(_683, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _687 = _675 < 0.0;
    float _689 = float(_687);
    int _691 = as_type<int>(_681) + (-218103808);
    float _693 = abs(_675);
    float _695 = fma(_693, _685, -0.212114393711090087890625);
    bool _697 = uint(_691) >= 1920991232u;
    float _699 = abs(_675);
    float _701 = fma(_699, _695, 1.570728778839111328125);
    bool _703 = !_697;
    float _729;
    if (!_703)
    {
        int _705 = as_type<int>(_681);
        int _707 = as_type<int>(_681);
        int _709 = as_type<int>(_607);
        int _711 = _507;
        int _713 = 3024;
        int _715;
        int _717;
        int _719;
        int _721;
        int _723;
        int _725;
        int _727;
        _96(_705, _707, _709, _711, _713, _715, _717, _719, _721, _723, _725, _727, out.gl_Position, out.gl_PointSize);
        _729 = as_type<float>(_725);
        _731 = true;
    }
    else
    {
        float _733 = rsqrt(_681);
        float _735 = _681 * _733;
        float _737 = _733 * 0.5;
        float _739 = -_735;
        float _741 = 0.0 + _739;
        float _743 = fma(_737, _741, 0.5);
        float _745 = fma(_735, _743, _735);
        float _747 = -_745;
        float _749 = 0.0 + _747;
        float _751 = fma(_745, _749, _681);
        float _753 = fma(_737, _751, _745);
        _729 = _753;
    }
    _731 = false;
    float _755 = _729;
    int _757 = _671;
    int _759 = 0;
    int _761 = _99(_757, _759, (*spvDescriptorSet0.support_buffer));
    int _763 = _177;
    int _765 = 0;
    int _767 = _99(_763, _765, (*spvDescriptorSet0.support_buffer));
    float4 _769 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_761, _767)), 0).xyzw;
    float _771 = _769.x;
    float _773 = _769.y;
    float _775 = _769.z;
    float _777 = _769.w;
    float _779 = _701 * _755;
    float _781 = _689 * 2.0;
    float _783 = _673 * 3.883221149444580078125;
    float _785 = floor(_185);
    float _787 = -_781;
    float _789 = fma(_779, _787, _779);
    float _791 = _783 * 0.15915493667125701904296875;
    float _793 = fma(_689, 3.1415927410125732421875, _789);
    float _795 = _791 * 6.283185482025146484375;
    float _797 = cos(_795);
    float _799 = _793 * 0.15915493667125701904296875;
    float _801 = _799 * 6.283185482025146484375;
    float _803 = sin(_801);
    float _805 = -_785;
    float _807 = _185 + _805;
    float _809 = _791 * 6.283185482025146484375;
    float _811 = sin(_809);
    float _813 = _803 * _797;
    float _815 = _803 * _811;
    uint _817 = as_type<uint>(half2(float2(_777, 0.0)));
    float _819 = -_287;
    float _821 = _819 + _771;
    uint _823 = extract_bits(_817, 0u, 8u);
    int _825 = int(_823) & 255;
    uint _827 = extract_bits(_817, 8u, 8u);
    int _829 = int(_827) & 255;
    int _831 = _829 << 8;
    int _833 = _825 | _831;
    float _835 = fma(_807, _821, _287);
    bool _837 = _833 >= 32768;
    int _839 = _833 + (-1024);
    int _841 = _839;
    if (_837)
    {
        int _843 = ~_833;
        int _845 = _843 + 33792;
        int _847 = _845 + 1;
        _841 = _847;
    }
    int _849 = _841;
    int _851 = _849 + 30719;
    float _853 = float(_851);
    float _855 = -_289;
    float _857 = _855 + _773;
    float _859 = fma(_853, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _861 = fma(_807, _857, _289);
    float _863 = abs(_859);
    float _865 = -_863;
    float _867 = _865 + 1.0;
    float _869 = abs(_859);
    float _871 = fma(_869, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _873 = _859 < 0.0;
    float _875 = float(_873);
    int _877 = as_type<int>(_867) + (-218103808);
    float _879 = abs(_859);
    float _881 = fma(_879, _871, -0.212114393711090087890625);
    bool _883 = uint(_877) >= 1920991232u;
    float _885 = -_291;
    float _887 = _885 + _775;
    float _889 = abs(_859);
    float _891 = fma(_889, _881, 1.570728778839111328125);
    float _893 = fma(_807, _887, _291);
    bool _895 = !_883;
    float _921;
    if (!_895)
    {
        int _897 = as_type<int>(_867);
        int _899 = as_type<int>(_821);
        int _901 = as_type<int>(_773);
        int _903 = as_type<int>(_779);
        int _905 = 3920;
        int _907;
        int _909;
        int _911;
        int _913;
        int _915;
        int _917;
        int _919;
        _96(_897, _899, _901, _903, _905, _907, _909, _911, _913, _915, _917, _919, out.gl_Position, out.gl_PointSize);
        _921 = as_type<float>(_917);
        _923 = true;
    }
    else
    {
        float _925 = rsqrt(_867);
        float _927 = _867 * _925;
        float _929 = _925 * 0.5;
        float _931 = -_927;
        float _933 = 0.0 + _931;
        float _935 = fma(_929, _933, 0.5);
        float _937 = fma(_927, _935, _927);
        float _939 = -_937;
        float _941 = 0.0 + _939;
        float _943 = fma(_937, _941, _867);
        float _945 = fma(_929, _943, _937);
        _921 = _945;
    }
    _923 = false;
    float _947 = _921;
    float _949 = in.m_55.x;
    float _951 = in.m_55.y;
    float _953 = in.m_55.z;
    float _955 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _957 = log2(_955);
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _969 = _967 != 0;
    bool _971 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _973 = isnan(0.0);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _979 = _975 || _977;
    float _981 = _957 * _143;
    float _983 = exp2(_981);
    float _985 = _953 * 2.0;
    float _987 = _949 * 2.0;
    float _989 = _951 + _953;
    float _991 = _951 * 2.0;
    float _993 = floor(_987);
    float _995 = _989 + (-1.0);
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1001 = 1.0 + _999;
    float _1003 = floor(_985);
    float _1005 = -_983;
    float _1007 = _1005 + 1.0;
    float _1009 = _979 ? _1007 : 0.0;
    float _1011 = floor(_991);
    bool _1013 = _993 >= 0.0;
    bool _1015 = isnan(_993);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan(0.0);
    bool _1021 = _1017 || _1019;
    int _1023 = _1021 ? 0 : 1;
    bool _1025 = _1003 > 0.0;
    float _1027 = 1.0 / _1001;
    bool _1029 = _1003 >= 0.0;
    bool _1031 = isnan(_1003);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    float _1039 = _951 + _949;
    float _1041 = _951 + (-0.5);
    int _1043 = _1037 ? 0 : 1;
    float _1045 = _1039 + (-1.0);
    bool _1047 = _993 > 0.0;
    bool _1049 = !_961;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1055 = ~_1043;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    int _1061 = _1059;
    if (!_1025)
    {
        int _1063 = ~_1043;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    float _1069 = in.m_59.x;
    float _1071 = in.m_59.y;
    float _1073 = in.m_59.z;
    int _1075 = abs(_1051);
    bool _1077 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1079 = isnan(1.0);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1085 = _1081 || _1083;
    float _1087 = float(_1075);
    float _1089 = float(_1067);
    bool _1091 = !_965;
    int _1093 = _1091 ? 0 : 1;
    bool _1095 = _1011 > 0.0;
    float _1097 = _1087 * _1089;
    int _1099 = abs(_1093);
    bool _1101 = _1011 >= 0.0;
    bool _1103 = isnan(_1011);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    if (_1085)
    {
        float _1111 = _1009 * _1027;
        _145 = _1111;
    }
    float _1113 = _145;
    int _1115 = ~_1023;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    float _1121 = _949 + (-0.5);
    int _1123 = _1119;
    if (!_1047)
    {
        int _1125 = ~_1023;
        int _1127 = _1125 + 1;
        _1123 = _1127;
    }
    int _1129 = _1123;
    float _1131 = _1097 * (-2.0);
    float _1133 = _949 + _953;
    int _1135 = _1109 ? 0 : 1;
    float _1137 = fma(_1131, _1069, _1069);
    float _1139 = float(_1099);
    float _1141 = fma(_1053, _1131, _1053);
    float _1143 = float(_1129);
    float _1145 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1137);
    bool _1147 = !_969;
    int _1149 = _1147 ? 0 : 1;
    float _1151 = _1133 + (-1.0);
    int _1153 = ~_1135;
    int _1155 = _1153 + 1;
    int _1157 = _1155 + 1;
    float _1159 = _1139 * _1143;
    float _1161 = fma(_1141, _1113, _1145);
    int _1163 = abs(_1149);
    float _1165 = in.m_57.x;
    float _1167 = in.m_57.y;
    float _1169 = in.m_57.z;
    int _1171 = _1157;
    if (!_1095)
    {
        int _1173 = ~_1135;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    float _1179 = _1159 * (-2.0);
    float _1181 = _1161 * 0.15915493667125701904296875;
    float _1183 = float(_1163);
    float _1185 = _953 + (-0.5);
    float _1187 = fma(_1179, _1071, _1071);
    float _1189 = float(_1177);
    float _1191 = fma(_997, _1179, _997);
    float _1193 = _1181 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1187);
    float _1199 = _1183 * _1189;
    float _1201 = fma(_1191, _1113, _1197);
    float _1203 = _1199 * (-2.0);
    float _1205 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1207 = _1201 * 0.15915493667125701904296875;
    float _1209 = _1181 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = fma(_1203, _1073, _1073);
    float _1215 = fma(_1205, _1203, _1205);
    float _1217 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1213);
    float _1219 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1221 = _1207 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = fma(_1215, _1113, _1217);
    float _1227 = in.m_53.y;
    float _1229 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1231 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1233 = _1225 * 0.15915493667125701904296875;
    float _1235 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _861);
    float _1237 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1239 = _1207 * 6.283185482025146484375;
    float _1241 = cos(_1239);
    float _1243 = _1229 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1245 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _835);
    float _1247 = _1231 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1249 = _1235 * _1243;
    float _1251 = _1245 * _1237;
    float _1253 = _555 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1255 = _1233 * 6.283185482025146484375;
    float _1257 = cos(_1255);
    float _1259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _893);
    float _1261 = _1195 * _1223;
    float _1263 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1265 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1253);
    float _1267 = _1259 * _1247;
    float _1269 = _1211 * _1223;
    float _1271 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1263);
    float _1273 = _1233 * 6.283185482025146484375;
    float _1275 = sin(_1273);
    float _1277 = _1211 * _1241;
    float _1279 = _1195 * _1241;
    float _1281 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1271);
    float _1283 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1265);
    bool _1285 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1287 = isnan(0.5);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1293 = _1289 || _1291;
    float _1295 = _1223 * _1257;
    float _1297 = -_1227;
    float _1299 = _1297 + 0.85000002384185791015625;
    float _1301 = precise::clamp(_1299, 0.0, 1.0);
    float _1303 = _1211 * _1257;
    float _1305 = _1195 * _1257;
    float _1307 = _1241 * _1257;
    float _1309 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1311 = _1303 * _1249;
    float _1313 = rsqrt(_1281);
    float _1315 = fma(_1275, _1277, _1261);
    float _1317 = fma(_1275, _1261, _1277);
    float _1319 = -_1269;
    float _1321 = fma(_1275, _1279, _1319);
    float _1323 = -_1249;
    float _1325 = _1275 * _1323;
    float _1327 = -_1279;
    float _1329 = fma(_1275, _1269, _1327);
    float _1331 = _1305 * _1249;
    float _1333 = _1309 * 0.15915493667125701904296875;
    float _1335 = fma(_1315, _1251, _1311);
    float _1337 = fma(_1307, _1251, _1325);
    float _1339 = fma(_1321, _1251, _1331);
    float _1341 = _1333 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    float _1345 = fma(_1329, _1267, _1335);
    float _1347 = fma(_1295, _1267, _1337);
    float _1349 = fma(_1317, _1267, _1339);
    float _1351 = _555 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1353 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1355 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1357 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1359 = _1333 * 6.283185482025146484375;
    float _1361 = sin(_1359);
    float _1363 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1353);
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1355);
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1357);
    float _1369 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[8].x;
    float _1371 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1363);
    float _1373 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1365);
    float _1375 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1351);
    float _1377 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1379 = -_1343;
    float _1381 = _1379 + 1.0;
    float _1383 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1367);
    float _1385 = _555 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1387 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1389 = _1377 * _1381;
    float _1391 = _1369 * _1381;
    float _1393 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1385);
    float _1395 = _1369 * _1361;
    float _1397 = _1387 * _1387;
    float _1399 = _1387 * _1361;
    float _1401 = _1377 * _1361;
    float _1403 = fma(_1387, _1389, _1395);
    float _1405 = fma(_1381, _1397, _1343);
    float _1407 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1375);
    float _1409 = -_1399;
    float _1411 = fma(_1377, _1391, _1409);
    float _1413 = -_1401;
    float _1415 = fma(_1387, _1391, _1413);
    float _1417 = _1373 * _1403;
    float _1419 = fma(_1369, _1391, _1343);
    float _1421 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1393);
    float _1423 = _1373 * _1411;
    float _1425 = fma(_1371, _1415, _1417);
    float _1427 = fma(_1387, _1391, _1401);
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1431 = fma(_1371, _1419, _1423);
    float _1433 = fma(_1383, _1405, _1425);
    float _1435 = _1407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1437 = _1283 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1439 = fma(_1383, _1427, _1431);
    float _1441 = _1429 + _1433;
    float _1443 = fma(_1377, _1389, _1343);
    float _1445 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1447 = _1435 + _1439;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1451 = _1441 + _1449;
    float _1453 = fma(_1377, _1391, _1399);
    float _1455 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1445);
    float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1459 = _1447 + _1457;
    float _1461 = _1451 * _1451;
    float _1463 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1465 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1455);
    float _1467 = -_1395;
    float _1469 = fma(_1387, _1389, _1467);
    float _1471 = fma(_1459, _1459, _1461);
    float _1473 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1463);
    float _1475 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1477 = sqrt(_1471);
    float _1479 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1473);
    float _1481 = _1373 * _1443;
    float _1483 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1485 = fma(_1371, _1453, _1481);
    float _1487 = 1.0 / _1475;
    float _1489 = _1483 + _1475;
    float _1491 = fma(_1383, _1469, _1485);
    float _1493 = _1437 + _1491;
    float _1495 = _1437;
    float _1497 = _1491;
    float _1499 = _1373;
    float _1501 = _1383;
    float _1503 = _1471;
    float _1505 = _1459;
    float _1507 = _1479;
    if (_1293)
    {
        _1495 = 1.0;
    }
    float _1509 = _1495;
    bool _1511 = _1477 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1513 = _1489 * _1487;
    float _1515 = _1513 * 0.5;
    float _1517 = _1509;
    if (!_1511)
    {
        _1497 = _1447;
    }
    float _1519 = _1497;
    float _1521 = _1519;
    if (!_1511)
    {
        _1499 = _1441;
    }
    float _1523 = _1499;
    float _1525 = _1523;
    if (!_1511)
    {
        _1501 = _1493;
    }
    float _1527 = _1501;
    bool _1529 = !_1511;
    float _1531 = _1527;
    if (!_1529)
    {
        float _1533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1537 = _1477 + _1535;
        float _1539 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1541 = rsqrt(_1471);
        float _1543 = _1537 * _1533;
        float _1545 = _1543 * 0.15915493667125701904296875;
        float _1547 = _1545 * 6.283185482025146484375;
        float _1549 = cos(_1547);
        float _1551 = _1545 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = _1549 + (-1.0);
        float _1557 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = fma(_1553, _1539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1561 = fma(_1493, _1549, _1557);
        float _1563 = _1541 * _1559;
        float _1565 = fma(_1459, _1563, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1567 = fma(_1451, _1563, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1531 = _1561;
        _1521 = _1565;
        _1525 = _1567;
        _1503 = _1541;
    }
    float _1569 = _1531;
    float _1571 = _1521;
    float _1573 = _1525;
    float _1575 = _1503;
    if (!_1293)
    {
        float _1577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1585 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1583);
        float _1587 = _1579 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = _1581 * 0.15915493667125701904296875;
        float _1593 = _1579 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        float _1597 = 1.0 / _1589;
        float _1599 = _1591 * 6.283185482025146484375;
        float _1601 = cos(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = _1591 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        float _1609 = _1601 * _1603;
        float _1611 = 1.0 / _1585;
        float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1615 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1613;
        float _1617 = 1.0 / _1609;
        float _1619 = 1.0 / _1615;
        float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1623 = _1611 * _1621;
        float _1625 = _1607 * _1617;
        float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1629 = fma(_1625, _1623, _1627);
        float _1631 = _1629 * _1619;
        float _1633 = precise::clamp(_1631, 0.0, 1.0);
        _1505 = _1619;
        _1517 = _1633;
    }
    float _1635 = _1505;
    float _1637 = _1517;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1641 = _1569 + _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1645 = _1571 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1649 = _1573 + _1647;
    float _1651 = _1641 * _1641;
    float _1653 = fma(_1645, _1645, _1651);
    float _1655 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1657 = fma(_1649, _1649, _1653);
    float _1659 = rsqrt(_1657);
    float _1661 = sqrt(_1657);
    float _1663 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1665 = _1645 * _1663;
    float _1667 = _1649 * _1663;
    float _1669 = _1665 * _1665;
    float _1671 = _1667 * _1667;
    float _1673 = _1669 + _1671;
    float _1675 = sqrt(_1673);
    bool _1677 = _1675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1681 = _1675 + _1679;
    float _1683 = _1635;
    float _1685 = _1673;
    float _1687 = _1681;
    float _1689 = _1655;
    float _1691 = _1665;
    float _1693 = _1667;
    float _1695 = _1669;
    float _1697 = _1671;
    if (_1677)
    {
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1699;
    }
    float _1701 = _1683;
    if (_1677)
    {
        float _1703 = rsqrt(_1673);
        _1685 = _1703;
    }
    float _1705 = _1685;
    if (_1677)
    {
        float _1707 = _1681 * _1701;
        _1687 = _1707;
    }
    float _1709 = _1687;
    float _1711 = precise::max(0.0, _1655);
    float _1713 = _1711;
    if (_1677)
    {
        float _1715 = _1709 * 0.15915493667125701904296875;
        _1507 = _1715;
    }
    float _1717 = _1507;
    float _1719 = -_1663;
    float _1721 = -_1711;
    float _1723 = fma(_1641, _1719, _1721);
    float _1725 = _1575;
    float _1727 = _1723;
    if (_1677)
    {
        float _1729 = _1717 * 6.283185482025146484375;
        float _1731 = sin(_1729);
        _1725 = _1731;
    }
    float _1733 = _1725;
    if (_1677)
    {
        float _1735 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1713 = _1735;
    }
    float _1737 = _1713;
    float _1739 = _1709;
    float _1741 = _1737;
    if (_1677)
    {
        float _1743 = _1717 * 6.283185482025146484375;
        float _1745 = cos(_1743);
        _1739 = _1745;
    }
    float _1747 = _1739;
    float _1749 = _1733;
    if (_1677)
    {
        float _1751 = fma(_1733, _1737, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1749 = _1751;
    }
    float _1753 = _1749;
    float _1755 = _1753;
    if (_1677)
    {
        float _1757 = _1705 * _1753;
        _1755 = _1757;
    }
    float _1759 = _1755;
    if (_1677)
    {
        float _1761 = _1747 + (-1.0);
        _1689 = _1761;
    }
    float _1763 = _1689;
    if (_1677)
    {
        float _1765 = _1665 * _1759;
        _1691 = _1765;
    }
    float _1767 = _1691;
    if (_1677)
    {
        float _1769 = _1667 * _1759;
        _1693 = _1769;
    }
    float _1771 = _1693;
    float _1773 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1677)
    {
        float _1775 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1741 = _1775;
    }
    float _1777 = _1741;
    if (_1677)
    {
        float _1779 = _1767 * _1767;
        _1695 = _1779;
    }
    float _1781 = _1695;
    if (_1677)
    {
        float _1783 = _1771 * _1771;
        _1697 = _1783;
    }
    float _1785 = _1697;
    if (_1677)
    {
        float _1787 = fma(_1723, _1747, _1777);
        _1727 = _1787;
    }
    float _1789 = _1727;
    float _1791 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1793 = fma(_1789, _1789, _1781);
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1797 = fma(_1661, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1795);
    float _1799 = precise::clamp(_1797, 0.0, 1.0);
    float _1801 = _1793 + _1785;
    float _1803 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1791);
    float _1805 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1807 = -_1799;
    float _1809 = _1807 + 1.0;
    float _1811 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1813 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1803);
    float _1815 = rsqrt(_1801);
    float _1817 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1819 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1805);
    float _1821 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1823 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1811);
    float _1825 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1817);
    float _1827 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1819);
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1831 = abs(_1809);
    float _1833 = log2(_1831);
    float _1835 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1825);
    float _1837 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1839 = -_1829;
    float _1841 = fma(_1839, _1773, 1.0);
    float _1843 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1823);
    float _1845 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1847 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1849 = _1815 * _1767;
    float _1851 = _1815 * _1789;
    float _1853 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1847);
    float _1855 = _1815 * _1771;
    float _1857 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1859 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1861 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1853);
    float _1863 = log2(_1841);
    float _1865 = -_1857;
    float _1867 = fma(_1851, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1865);
    float _1869 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1871 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1861);
    float _1873 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1875 = -_1855;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1867);
    float _1879 = exp2(_1869);
    float _1881 = fma(_1877, -0.5, 0.5);
    float _1883 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1885 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1873);
    float _1887 = fma(_1877, 0.5, 0.5);
    float _1889 = _1851 + 1.0;
    float _1891 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1883);
    float _1893 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1885);
    float _1895 = 1.0 / _1871;
    float _1897 = fma(_1887, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1899 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1891);
    float _1901 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1893);
    float _1903 = fma(_1887, _1897, -0.212114393711090087890625);
    float _1905 = sqrt(_1881);
    float _1907 = -_1851;
    float _1909 = fma(_1879, _1889, _1907);
    float _1911 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1899);
    float _1913 = _1863 * 0.693147182464599609375;
    float _1915 = fma(_1887, _1903, 1.570728778839111328125);
    float _1917 = fma(_1909, 0.5, 0.5);
    float _1919 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1921 = _1901 * _1895;
    float _1923 = _1911 * _1895;
    float _1925 = fma(_1921, 0.5, 0.5);
    float _1927 = fma(_1923, -0.5, 0.5);
    float _1929 = _1905 * 0.636619746685028076171875;
    float3 _5170 = float3(_1925, _1927, _1919);
    float _1931 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5170, float3(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5170, float3(0.0), isnan(_5170)), level(0.0)).x;
    float _1933 = -_1915;
    float _1935 = fma(_1929, _1933, 1.0);
    float3 _5186 = float3(_1925, _1927, _1919);
    float4 _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5186, float3(0.0), isnan(_5186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5186, float3(0.0), isnan(_5186)), level(0.0)).xyzw;
    float _1939 = _1937.x;
    float _1941 = _1937.y;
    float _1943 = _1937.z;
    float _1945 = _1937.w;
    float2 _5202 = float2(_1935, _1917);
    float3 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5202, float2(0.0), isnan(_5202)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5202, float2(0.0), isnan(_5202)), level(0.0)).xyz;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _891 * _947;
    float _1959 = _875 * 2.0;
    float _1961 = _853 * 3.883221149444580078125;
    bool _1963 = _861 != 0.0;
    bool _1965 = isnan(_861);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(0.0);
    bool _1971 = _1967 || _1969;
    out.m_61.z = _609;
    out.m_61.w = _645;
    float _1973 = -_1959;
    float _1975 = fma(_1957, _1973, _1957);
    float _1977 = _1961 * 0.15915493667125701904296875;
    bool _1979 = _835 == 0.0;
    bool _1981 = !_1971;
    bool _1983 = _1979 && _1981;
    float _1985 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1987 = fma(_875, 3.1415927410125732421875, _1975);
    float _1989 = _1977 * 6.283185482025146484375;
    float _1991 = sin(_1989);
    float _1993 = -_675;
    float _1995 = _1993 + _859;
    bool _1997 = _893 == 0.0;
    bool _1999 = _1997 && _1983;
    float _2001 = _1987 * 0.15915493667125701904296875;
    out.m_63.w = _595;
    float _2003 = fma(_807, _1995, _675);
    float _2005 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2007 = _1977 * 6.283185482025146484375;
    float _2009 = cos(_2007);
    float _2011 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2003);
    float _2013 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2005);
    out.m_65.x = _1571;
    out.m_65.y = _1569;
    out.m_65.z = _1573;
    float _2015 = _1999 ? _2003 : _2011;
    float _2017 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2013);
    float _2019 = _2001 * 6.283185482025146484375;
    float _2021 = sin(_2019);
    float _2023 = _2003;
    float _2025 = _1911;
    float _2027 = _1901;
    if (!_1999)
    {
        _2023 = _2011;
    }
    float _2029 = _2023;
    float _2031 = exp2(_1985);
    float _2033 = -_815;
    float _2035 = fma(_2021, _1991, _2033);
    float _2037 = _2015 * _2015;
    float _2039 = -_813;
    float _2041 = fma(_2021, _2009, _2039);
    float _2043 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2045 = fma(_807, _2035, _815);
    float _2047 = in.m_67.w;
    float _2049 = fma(_807, _2041, _813);
    float _2051 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2045);
    float _2053 = -_2029;
    float _2055 = _1275 * _2053;
    float _2057 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2043);
    float _2059 = _2049;
    float _2061 = _2045;
    if (!_1999)
    {
        float _2063 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2049);
        _2059 = _2063;
    }
    float _2065 = _2059;
    float _2067 = -_2031;
    float _2069 = _2067 + 1.0;
    float _2071 = _1999 ? _2045 : _2051;
    if (!_1999)
    {
        _2061 = _2051;
    }
    float _2073 = _2061;
    float _2075 = _1303 * _2029;
    float _2077 = fma(_1307, _2065, _2055);
    float _2079 = fma(_2071, _2071, _2037);
    float _2081 = _1305 * _2029;
    float _2083 = fma(_1315, _2065, _2075);
    bool _2085 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2087 = isnan(_1661);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2093 = _2089 || _2091;
    float _2095 = rsqrt(_2079);
    float _2097 = fma(_1329, _2073, _2083);
    out.m_69.w = _2047;
    float _2099 = _2097 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2101 = _2015 * _2095;
    float _2103 = _2071 * _2095;
    float _2105 = -_2101;
    float _2107 = _1295 * _2105;
    float _2109 = fma(_1295, _2073, _2077);
    float _2111 = -_2101;
    float _2113 = _1329 * _2111;
    float _2115 = -_2101;
    float _2117 = _1317 * _2115;
    float _2119 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2121 = -_1275;
    float _2123 = fma(_2121, _2103, _2107);
    float _2125 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2127 = fma(_1321, _2065, _2081);
    float _2129 = fma(_1303, _2103, _2113);
    float _2131 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2119);
    float _2133 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2125);
    float _2135 = fma(_1305, _2103, _2117);
    float _2137 = fma(_1317, _2073, _2127);
    float _2139 = _2097 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2141 = _2097 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2143 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2145 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2147 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2149 = fma(_1321, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2057);
    float _2151 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2099);
    float _2153 = fma(_1321, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2131);
    float _2155 = fma(_1321, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2133);
    float _2157 = fma(_2123, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2143);
    float _2159 = fma(_2123, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2145);
    float _2161 = fma(_2123, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2147);
    float _2163 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2139);
    float _2165 = fma(_2137, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2151);
    out.m_71.x = _2153;
    out.m_71.y = _2149;
    out.m_71.z = _2155;
    float _2167 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2141);
    float _2169 = _2165 * _1443;
    float _2171 = _2165 * _1403;
    float _2173 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2157);
    float _2175 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2159);
    float _2177 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2161);
    float _2179 = fma(_2137, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2163);
    float _2181 = _2165 * _1411;
    float _2183 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2017);
    float _2185 = fma(_2137, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2167);
    out.m_73.x = _2173;
    out.m_73.y = _2175;
    out.m_73.z = _2177;
    float _2187 = fma(_2179, _1419, _2181);
    float _2189 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2191 = fma(_2179, _1453, _2169);
    float _2193 = fma(_2179, _1415, _2171);
    float _2195 = _2183 + _1871;
    float _2197 = _1901 + _1871;
    float _2199 = _1871 * 0.5;
    float _2201 = -_2189;
    float _2203 = _2201 + 1.0;
    float _2205 = _2195 * 0.5;
    float _2207 = _2197 * 0.5;
    float _2209 = fma(_1911, -0.5, _2199);
    float _2211 = fma(_2185, _1427, _2187);
    float _2213 = fma(_2185, _1469, _2191);
    float _2215 = fma(_2185, _1405, _2193);
    out.gl_Position.x = _1901;
    out.gl_Position.y = _1911;
    out.gl_Position.z = _2183;
    out.gl_Position.w = _1871;
    float _2217 = _2185;
    if (!_2093)
    {
        _2217 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2219 = _2217;
    out.m_75.x = _2207;
    out.m_75.y = _2209;
    out.m_75.z = _2205;
    out.m_75.w = _1871;
    out.m_77.x = _2211;
    out.m_77.y = _2213;
    out.m_77.z = _2215;
    float _2221 = _2219;
    float _2223 = _2219;
    if (!_2093)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2225 = _2025;
    float _2227 = _2225;
    float _2229 = _2225;
    if (!_2093)
    {
        _2027 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2231 = _2027;
    float _2233 = _2189 * _1931;
    float _2235 = _1945 * _2233;
    float _2237 = _1945 * _2203;
    float _2239 = _1955 * _2233;
    float _2241 = fma(_1951, _2235, _1939);
    float _2243 = fma(_1953, _2235, _1941);
    float _2245 = _1637 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2247 = fma(_1945, _2239, _1943);
    out.m_79.x = _2241;
    out.m_79.y = _2243;
    out.m_79.z = _2247;
    out.m_79.w = _2237;
    bool _2249 = !_2093;
    float _2251 = _2231;
    float _2253 = _2231;
    if (!_2249)
    {
        bool _2255 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2257 = isnan(_1661);
        bool _2259 = _2255 || _2257;
        bool _2261 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2263 = _2259 || _2261;
        if (!_2263)
        {
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2267 = _1661 + _2265;
            float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2271 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2269;
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2281 = 1.0 / _2271;
            float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2287 = _2267 * _2281;
            float _2289 = precise::clamp(_2287, 0.0, 1.0);
            float _2291 = fma(_2289, _2275, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2293 = fma(_2289, _2279, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2295 = fma(_2289, _2285, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2253 = _2293;
            _2229 = _2291;
            _2223 = _2295;
            _2297 = true;
        }
        else
        {
            bool _2299 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2301 = isnan(_1661);
            bool _2303 = _2299 || _2301;
            bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2307 = _2303 || _2305;
            if (!_2307)
            {
                _2227 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2309 = _2227;
            _2229 = _2309;
            if (!_2307)
            {
                _2251 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2311 = _2251;
            _2253 = _2311;
            if (!_2307)
            {
                _2221 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2313 = _2221;
            bool _2315 = !_2307;
            _2223 = _2313;
            if (!_2315)
            {
                bool _2317 = _1661 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2319 = isnan(_1661);
                bool _2321 = _2317 || _2319;
                bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2325 = _2321 || _2323;
                if (!_2325)
                {
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2329 = _1661 + _2327;
                    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2331;
                    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2343 = 1.0 / _2333;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2349 = _2329 * _2343;
                    float _2351 = precise::clamp(_2349, 0.0, 1.0);
                    float _2353 = fma(_2351, _2337, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2355 = fma(_2351, _2341, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2357 = fma(_2351, _2347, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2253 = _2355;
                    _2229 = _2353;
                    _2223 = _2357;
                    _2297 = true;
                }
                else
                {
                    _2253 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2229 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2223 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2297 = false;
    float _2359 = _2253;
    float _2361 = _2229;
    float _2363 = _2223;
    float _2365 = _2245 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = 0.0;
    float _2367 = _2359 * 0.586610972881317138671875;
    bool _2369 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2365;
    float _2371 = fma(_2361, 0.298911988735198974609375, _2367);
    bool _2373 = _1637 > 0.0;
    bool _2375 = isnan(_1637);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = fma(_2363, 0.114477999508380889892578125, _2371);
    float _2385 = -_2383;
    float _2387 = _2385 + _2361;
    float _2389 = -_2383;
    float _2391 = _2389 + _2359;
    float _2393 = -_2383;
    float _2395 = _2393 + _2363;
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2399 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    bool _2403 = !_2369;
    if (!_2403)
    {
        float _2405 = -_1569;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2409 = -_1571;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2413 = -_1573;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2417 = _2407 * _2407;
        float _2419 = fma(_2411, _2411, _2417);
        float _2421 = fma(_2415, _2415, _2419);
        float _2423 = sqrt(_2421);
        float _2425 = rsqrt(_2421);
        float _2427 = -_2423;
        float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2433 = precise::clamp(_2431, 0.0, 1.0);
        float _2435 = _2411 * _2425;
        float _2437 = _2407 * _2425;
        float _2439 = abs(_2433);
        float _2441 = log2(_2439);
        float _2443 = _2415 * _2425;
        float _2445 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2447 = _2213 * _2437;
        float _2449 = -_2437;
        float _2451 = -_2445;
        float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2451);
        float _2455 = fma(_2211, _2435, _2447);
        float _2457 = -_2443;
        float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2453);
        float _2461 = fma(_2215, _2443, _2455);
        float _2463 = precise::clamp(_2461, 0.0, 1.0);
        float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2467 = _2459 + _2465;
        float _2469 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        float _2475 = exp2(_2469);
        float _2477 = _2475 * _2473;
        float _2479 = _2463 * _2477;
        float _2481 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2483 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2485 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _2481;
        out.m_81.y = _2483;
        out.m_81.z = _2485;
    }
    out.m_83.x = _2397;
    out.m_83.y = _2399;
    out.m_83.z = _2401;
    if (_2381)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

