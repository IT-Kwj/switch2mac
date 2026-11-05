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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c4 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
    texture2d<float> vp_t_tcb_8 [[id(2)]];
    sampler vp_t_tcb_8Smplr [[id(3)]];
    sampler vp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_38 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_36 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_34 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_32 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_29 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_29.y;
    float _62 = in.m_29.z;
    float _64 = in.m_29.x;
    bool _68 = _60 >= 0.100000001490116119384765625;
    bool _70 = isnan(_60);
    bool _72 = _68 || _70;
    bool _74 = isnan(0.100000001490116119384765625);
    bool _76 = _72 || _74;
    float _78 = _60 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _80 = _60 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _82 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[32].x, _78);
    float _84 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[33].x, _80);
    float _86 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[32].z, _82);
    float _88 = 0.0;
    if (_76)
    {
        _88 = _60;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_76)
    {
        float _94 = _60 + (-0.007000000216066837310791015625);
        _92 = _94;
    }
    float _96 = _92;
    float _98 = 0.0;
    if (_76)
    {
        _98 = _62;
    }
    float _100 = _98;
    float _102 = _60 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _104 = _100;
    if (!_76)
    {
        float _106 = _62 * 1.0499999523162841796875;
        _104 = _106;
    }
    float _108 = _104;
    float _110 = 0.0;
    if (_76)
    {
        _110 = _64;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_76)
    {
        float _116 = _64 * 1.0499999523162841796875;
        _114 = _116;
    }
    float _118 = _114;
    float _120 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[34].x, _102);
    float _122 = _108 * _108;
    float _124 = _96 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _126 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[33].z, _84);
    float _128 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[34].z, _120);
    float _130 = fma(_118, _118, _122);
    float _132 = _96 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _134 = _96 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _136 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[5].x, _124);
    float _138 = _96 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _140 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[4].x, _132);
    float _142 = sqrt(_130);
    float _144 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[5].z, _136);
    float _146 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[7].x, _138);
    float _148 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[6].x, _134);
    float _150 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[4].z, _140);
    float _152 = _144 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _154 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[7].z, _146);
    float _156 = _126 * _126;
    float _158 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[6].z, _148);
    float _160 = _150 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _162 = _152 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _164 = fma(_86, _86, _156);
    float _166 = _158 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _168 = _154 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _170 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[11].x, _162);
    float _172 = fma(_128, _128, _164);
    bool _174 = _142 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _176 = isnan(_142);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _182 = _178 || _180;
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[11].z, _170);
    float _186 = rsqrt(_172);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[11].w, _184);
    float _190 = 0.0;
    float _192 = _188;
    if (_182)
    {
        _190 = _188;
    }
    float _194 = _190;
    float _196 = _194;
    if (!_182)
    {
        _196 = 0.0;
    }
    float _198 = _196;
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[40].x, _200);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _86 * _186;
    float _208 = _126 * _186;
    float _210 = _128 * _186;
    float _212 = -_204;
    float _214 = _212 + 1.0;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _218 = -_208;
    float _220 = -_216;
    float _222 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[42].y, _220);
    float _224 = abs(_214);
    float _226 = log2(_224);
    float _228 = -_210;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c4)._m0[42].z, _222);
    float _232 = fma(_230, -0.5, 0.5);
    float _234 = fma(_230, 0.5, 0.5);
    float _236 = fma(_234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _238 = sqrt(_232);
    float _240 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _242 = fma(_234, _236, -0.212114393711090087890625);
    float _244 = fma(_234, _242, 1.570728778839111328125);
    float _246 = exp2(_240);
    float _248 = _238 * 0.636619746685028076171875;
    float _250 = -_244;
    float _252 = fma(_248, _250, 1.0);
    float _254 = fma(_246, 0.5, 0.5);
    float2 _1026 = float2(_252, _254);
    float3 _258 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1026, float2(0.0), isnan(_1026)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1026, float2(0.0), isnan(_1026)), level(0.0)).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    float _266 = _118 + (-0.5);
    float _268 = _108 + (-0.5);
    bool _270 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _272 = isnan(0.0);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _278 = _274 || _276;
    out.m_32.x = _208;
    float _280 = _266 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _282 = _268 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _284 = _280 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _286 = _282 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _288 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _290 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _292 = fma(_284, 10.0, _290);
    float _294 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _296 = fma(2.0, _294, 0.5);
    float _298 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _300 = 0.0;
    if (_278)
    {
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _300 = _302;
    }
    float _304 = _300;
    float _306 = _292 * 0.15915493667125701904296875;
    float _308 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _310 = fma(_286, 10.0, _308);
    float _312 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[5].w, _298);
    float _314 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _316 = fma(2.0, _314, 0.5);
    float _318 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _320 = _310 * 0.15915493667125701904296875;
    float _322 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _324 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _326 = fma(_316, (*spvDescriptorSet0.vp_c4)._m0[5].w, _318);
    float _328 = _152 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _330 = _322 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _332 = _306 * 6.283185482025146484375;
    float _334 = sin(_332);
    float _336 = _324 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _338 = _152 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _340 = _152 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _342 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[10].x, _328);
    bool _344 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _352 = _348 || _350;
    float _354 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[8].x, _338);
    float _356 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[9].x, _340);
    float _358 = _320 * 6.283185482025146484375;
    float _360 = sin(_358);
    float _362 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[10].z, _342);
    float _364 = _338;
    int _367 = as_type<int>(_312);
    if (_278)
    {
        float _369 = _142 * _304;
        float _371 = precise::clamp(_369, 0.0, 1.0);
        _364 = _371;
    }
    float _373 = _364;
    out.m_34.x = _312;
    out.m_34.y = _326;
    out.m_34.z = _330;
    out.m_34.w = _336;
    float _375 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[8].z, _354);
    float _377 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[9].z, _356);
    float _379 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[10].w, _362);
    float _381 = _373;
    if (_278)
    {
        float _383 = -_373;
        float _385 = _383 + 1.0;
        _381 = _385;
    }
    float _387 = _381;
    float _389 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[8].w, _375);
    float _391 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[9].w, _377);
    float _393 = fma(_334, 0.0350000001490116119384765625, _284);
    float _395 = exp2(_288);
    int _397 = as_type<int>(_387);
    if (_278)
    {
        float _399 = _387 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _397 = as_type<int>(_399);
    }
    int _401 = _397;
    out.m_36.x = 0.0;
    bool _403 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _411 = _407 || _409;
    float _413 = fma(_360, -0.01750000007450580596923828125, _286);
    if (_278)
    {
        out.m_36.x = as_type<float>(_401);
    }
    bool _415 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _417 = isnan(0.0);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _423 = _419 || _421;
    bool _425 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _427 = isnan(0.0);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _433 = _429 || _431;
    float _435 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _437 = fma(_435, (*spvDescriptorSet0.vp_c4)._m0[45].y, _379);
    out.m_38.x = _393;
    out.m_38.y = _413;
    if (!_352)
    {
        _367 = 1065353216;
    }
    int _439 = _367;
    out.gl_Position.x = _389;
    out.gl_Position.y = _391;
    out.gl_Position.z = _437;
    out.gl_Position.w = _188;
    out.m_40.x = 1.0;
    bool _441 = !_352;
    int _443 = _439;
    float _445 = as_type<float>(_439);
    if (!_441)
    {
        float _447 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _449 = _108 + _447;
        float _451 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _453 = _118 + _451;
        float _455 = _449 * _449;
        float _457 = fma(_453, _453, _455);
        float _459 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _461 = sqrt(_457);
        bool _463 = _461 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _465 = isnan(_461);
        bool _467 = _463 || _465;
        bool _469 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _471 = _467 || _469;
        float _473 = _461 * _459;
        float _475 = _473;
        if (!_471)
        {
            float _477 = -_473;
            float _479 = _477 + 1.0;
            _475 = _479;
        }
        float _481 = _475;
        float _483 = _481;
        if (_471)
        {
            _443 = 1065353216;
        }
        int _485 = _443;
        int _487 = _485;
        if (!_471)
        {
            float _489 = _481 * _481;
            _483 = _489;
        }
        float _491 = _483;
        if (!_471)
        {
            float _493 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _487 = as_type<int>(_493);
        }
        int _495 = _487;
        _445 = as_type<float>(_495);
        if (!_471)
        {
            out.m_40.x = as_type<float>(_495);
        }
    }
    float _497 = _445;
    bool _499 = !_423;
    int _501 = as_type<int>(_497);
    float _503 = _497;
    if (!_499)
    {
        float _505 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _507 = _108 + _505;
        float _509 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _511 = _118 + _509;
        float _513 = _507 * _507;
        float _515 = fma(_511, _511, _513);
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _519 = sqrt(_515);
        bool _521 = _519 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _523 = isnan(_519);
        bool _525 = _521 || _523;
        bool _527 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _529 = _525 || _527;
        float _531 = _519 * _517;
        float _533 = _531;
        if (!_529)
        {
            float _535 = -_531;
            float _537 = _535 + 1.0;
            _533 = _537;
        }
        float _539 = _533;
        if (!_529)
        {
            float _541 = _539 * _539;
            _192 = _541;
        }
        float _543 = _192;
        if (!_529)
        {
            float _545 = fma(_543, (*spvDescriptorSet0.vp_c4)._m0[22].x, _497);
            _501 = as_type<int>(_545);
        }
        int _547 = _501;
        _503 = as_type<float>(_547);
        if (!_529)
        {
            out.m_40.x = as_type<float>(_547);
        }
    }
    float _549 = _503;
    float _551 = -_395;
    float _553 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _555 = precise::clamp(_553, 0.0, 1.0);
    bool _557 = !_411;
    int _559 = as_type<int>(_549);
    float _561 = _549;
    if (!_557)
    {
        float _563 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _565 = _108 + _563;
        float _567 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _569 = _118 + _567;
        float _571 = _565 * _565;
        float _573 = fma(_569, _569, _571);
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _577 = sqrt(_573);
        bool _579 = _577 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _581 = isnan(_577);
        bool _583 = _579 || _581;
        bool _585 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _587 = _583 || _585;
        float _589 = _577 * _575;
        float _591 = _589;
        if (!_587)
        {
            float _593 = -_589;
            float _595 = _593 + 1.0;
            _591 = _595;
        }
        float _597 = _591;
        float _599 = _597;
        if (!_587)
        {
            float _601 = _597 * _597;
            _599 = _601;
        }
        float _603 = _599;
        if (!_587)
        {
            float _605 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[23].x, _549);
            _559 = as_type<int>(_605);
        }
        int _607 = _559;
        _561 = as_type<float>(_607);
        if (!_587)
        {
            out.m_40.x = as_type<float>(_607);
        }
    }
    float _609 = _561;
    bool _611 = !_433;
    if (!_611)
    {
        float _613 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
        float _615 = _108 + _613;
        float _617 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
        float _619 = _118 + _617;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
        float _623 = _615 * _615;
        float _625 = fma(_619, _619, _623);
        float _627 = sqrt(_625);
        bool _629 = _627 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
        bool _631 = isnan(_627);
        bool _633 = _629 || _631;
        bool _635 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
        bool _637 = _633 || _635;
        float _639 = _627 * _621;
        float _641 = _639;
        if (!_637)
        {
            float _643 = -_639;
            float _645 = _643 + 1.0;
            _641 = _645;
        }
        float _647 = _641;
        float _649 = _647;
        if (!_637)
        {
            float _651 = _647 * _647;
            _649 = _651;
        }
        float _653 = _649;
        int _655 = as_type<int>(_653);
        if (!_637)
        {
            float _657 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[24].x, _609);
            _655 = as_type<int>(_657);
        }
        int _659 = _655;
        if (!_637)
        {
            out.m_40.x = as_type<float>(_659);
        }
    }
    float _661 = _555 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    float _663 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _665 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _667 = _264 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_42.x = _198;
    out.m_44.x = _661;
    out.m_46.x = _663;
    out.m_46.y = _665;
    out.m_46.z = _667;
    if (!_182)
    {
        out.gl_Position.w = 0.0;
    }
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_29.y;
    float _62 = in.m_29.z;
    float _64 = in.m_29.x;
    bool _68 = _60 >= 0.100000001490116119384765625;
    bool _70 = isnan(_60);
    bool _72 = _68 || _70;
    bool _74 = isnan(0.100000001490116119384765625);
    bool _76 = _72 || _74;
    float _78 = _60 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _80 = _60 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _82 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[32].x, _78);
    float _84 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[33].x, _80);
    float _86 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[32].z, _82);
    float _88 = 0.0;
    if (_76)
    {
        _88 = _60;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_76)
    {
        float _94 = _60 + (-0.007000000216066837310791015625);
        _92 = _94;
    }
    float _96 = _92;
    float _98 = 0.0;
    if (_76)
    {
        _98 = _62;
    }
    float _100 = _98;
    float _102 = _60 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _104 = _100;
    if (!_76)
    {
        float _106 = _62 * 1.0499999523162841796875;
        _104 = _106;
    }
    float _108 = _104;
    float _110 = 0.0;
    if (_76)
    {
        _110 = _64;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_76)
    {
        float _116 = _64 * 1.0499999523162841796875;
        _114 = _116;
    }
    float _118 = _114;
    float _120 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[34].x, _102);
    float _122 = _108 * _108;
    float _124 = _96 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _126 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[33].z, _84);
    float _128 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[34].z, _120);
    float _130 = fma(_118, _118, _122);
    float _132 = _96 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _134 = _96 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _136 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[5].x, _124);
    float _138 = _96 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _140 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[4].x, _132);
    float _142 = sqrt(_130);
    float _144 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[5].z, _136);
    float _146 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[7].x, _138);
    float _148 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[6].x, _134);
    float _150 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[4].z, _140);
    float _152 = _144 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _154 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[7].z, _146);
    float _156 = _126 * _126;
    float _158 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[6].z, _148);
    float _160 = _150 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _162 = _152 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _164 = fma(_86, _86, _156);
    float _166 = _158 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _168 = _154 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _170 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[11].x, _162);
    float _172 = fma(_128, _128, _164);
    bool _174 = _142 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _176 = isnan(_142);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _182 = _178 || _180;
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[11].z, _170);
    float _186 = rsqrt(_172);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[11].w, _184);
    float _190 = 0.0;
    float _192 = _188;
    if (_182)
    {
        _190 = _188;
    }
    float _194 = _190;
    float _196 = _194;
    if (!_182)
    {
        _196 = 0.0;
    }
    float _198 = _196;
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[40].x, _200);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _86 * _186;
    float _208 = _126 * _186;
    float _210 = _128 * _186;
    float _212 = -_204;
    float _214 = _212 + 1.0;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _218 = -_208;
    float _220 = -_216;
    float _222 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[42].y, _220);
    float _224 = abs(_214);
    float _226 = log2(_224);
    float _228 = -_210;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c4)._m0[42].z, _222);
    float _232 = fma(_230, -0.5, 0.5);
    float _234 = fma(_230, 0.5, 0.5);
    float _236 = fma(_234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _238 = sqrt(_232);
    float _240 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _242 = fma(_234, _236, -0.212114393711090087890625);
    float _244 = fma(_234, _242, 1.570728778839111328125);
    float _246 = exp2(_240);
    float _248 = _238 * 0.636619746685028076171875;
    float _250 = -_244;
    float _252 = fma(_248, _250, 1.0);
    float _254 = fma(_246, 0.5, 0.5);
    float2 _1026 = float2(_252, _254);
    float3 _258 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1026, float2(0.0), isnan(_1026)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1026, float2(0.0), isnan(_1026)), level(0.0)).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    float _266 = _118 + (-0.5);
    float _268 = _108 + (-0.5);
    bool _270 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _272 = isnan(0.0);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _278 = _274 || _276;
    out.m_32.x = _208;
    float _280 = _266 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _282 = _268 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _284 = _280 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _286 = _282 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _288 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _290 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _292 = fma(_284, 10.0, _290);
    float _294 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _296 = fma(2.0, _294, 0.5);
    float _298 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _300 = 0.0;
    if (_278)
    {
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _300 = _302;
    }
    float _304 = _300;
    float _306 = _292 * 0.15915493667125701904296875;
    float _308 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _310 = fma(_286, 10.0, _308);
    float _312 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[5].w, _298);
    float _314 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _316 = fma(2.0, _314, 0.5);
    float _318 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _320 = _310 * 0.15915493667125701904296875;
    float _322 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _324 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _326 = fma(_316, (*spvDescriptorSet0.vp_c4)._m0[5].w, _318);
    float _328 = _152 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _330 = _322 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _332 = _306 * 6.283185482025146484375;
    float _334 = sin(_332);
    float _336 = _324 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _338 = _152 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _340 = _152 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _342 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[10].x, _328);
    bool _344 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _352 = _348 || _350;
    float _354 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[8].x, _338);
    float _356 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[9].x, _340);
    float _358 = _320 * 6.283185482025146484375;
    float _360 = sin(_358);
    float _362 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[10].z, _342);
    float _364 = _338;
    int _367 = as_type<int>(_312);
    if (_278)
    {
        float _369 = _142 * _304;
        float _371 = precise::clamp(_369, 0.0, 1.0);
        _364 = _371;
    }
    float _373 = _364;
    out.m_34.x = _312;
    out.m_34.y = _326;
    out.m_34.z = _330;
    out.m_34.w = _336;
    float _375 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[8].z, _354);
    float _377 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[9].z, _356);
    float _379 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[10].w, _362);
    float _381 = _373;
    if (_278)
    {
        float _383 = -_373;
        float _385 = _383 + 1.0;
        _381 = _385;
    }
    float _387 = _381;
    float _389 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[8].w, _375);
    float _391 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[9].w, _377);
    float _393 = fma(_334, 0.0350000001490116119384765625, _284);
    float _395 = exp2(_288);
    int _397 = as_type<int>(_387);
    if (_278)
    {
        float _399 = _387 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _397 = as_type<int>(_399);
    }
    int _401 = _397;
    out.m_36.x = 0.0;
    bool _403 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _411 = _407 || _409;
    float _413 = fma(_360, -0.01750000007450580596923828125, _286);
    if (_278)
    {
        out.m_36.x = as_type<float>(_401);
    }
    bool _415 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _417 = isnan(0.0);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _423 = _419 || _421;
    bool _425 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _427 = isnan(0.0);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _433 = _429 || _431;
    float _435 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _437 = fma(_435, (*spvDescriptorSet0.vp_c4)._m0[45].y, _379);
    out.m_38.x = _393;
    out.m_38.y = _413;
    if (!_352)
    {
        _367 = 1065353216;
    }
    int _439 = _367;
    out.gl_Position.x = _389;
    out.gl_Position.y = _391;
    out.gl_Position.z = _437;
    out.gl_Position.w = _188;
    out.m_40.x = 1.0;
    bool _441 = !_352;
    int _443 = _439;
    float _445 = as_type<float>(_439);
    if (!_441)
    {
        float _447 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _449 = _108 + _447;
        float _451 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _453 = _118 + _451;
        float _455 = _449 * _449;
        float _457 = fma(_453, _453, _455);
        float _459 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _461 = sqrt(_457);
        bool _463 = _461 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _465 = isnan(_461);
        bool _467 = _463 || _465;
        bool _469 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _471 = _467 || _469;
        float _473 = _461 * _459;
        float _475 = _473;
        if (!_471)
        {
            float _477 = -_473;
            float _479 = _477 + 1.0;
            _475 = _479;
        }
        float _481 = _475;
        float _483 = _481;
        if (_471)
        {
            _443 = 1065353216;
        }
        int _485 = _443;
        int _487 = _485;
        if (!_471)
        {
            float _489 = _481 * _481;
            _483 = _489;
        }
        float _491 = _483;
        if (!_471)
        {
            float _493 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _487 = as_type<int>(_493);
        }
        int _495 = _487;
        _445 = as_type<float>(_495);
        if (!_471)
        {
            out.m_40.x = as_type<float>(_495);
        }
    }
    float _497 = _445;
    bool _499 = !_423;
    int _501 = as_type<int>(_497);
    float _503 = _497;
    if (!_499)
    {
        float _505 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _507 = _108 + _505;
        float _509 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _511 = _118 + _509;
        float _513 = _507 * _507;
        float _515 = fma(_511, _511, _513);
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _519 = sqrt(_515);
        bool _521 = _519 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _523 = isnan(_519);
        bool _525 = _521 || _523;
        bool _527 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _529 = _525 || _527;
        float _531 = _519 * _517;
        float _533 = _531;
        if (!_529)
        {
            float _535 = -_531;
            float _537 = _535 + 1.0;
            _533 = _537;
        }
        float _539 = _533;
        if (!_529)
        {
            float _541 = _539 * _539;
            _192 = _541;
        }
        float _543 = _192;
        if (!_529)
        {
            float _545 = fma(_543, (*spvDescriptorSet0.vp_c4)._m0[22].x, _497);
            _501 = as_type<int>(_545);
        }
        int _547 = _501;
        _503 = as_type<float>(_547);
        if (!_529)
        {
            out.m_40.x = as_type<float>(_547);
        }
    }
    float _549 = _503;
    float _551 = -_395;
    float _553 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _555 = precise::clamp(_553, 0.0, 1.0);
    bool _557 = !_411;
    int _559 = as_type<int>(_549);
    float _561 = _549;
    if (!_557)
    {
        float _563 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _565 = _108 + _563;
        float _567 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _569 = _118 + _567;
        float _571 = _565 * _565;
        float _573 = fma(_569, _569, _571);
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _577 = sqrt(_573);
        bool _579 = _577 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _581 = isnan(_577);
        bool _583 = _579 || _581;
        bool _585 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _587 = _583 || _585;
        float _589 = _577 * _575;
        float _591 = _589;
        if (!_587)
        {
            float _593 = -_589;
            float _595 = _593 + 1.0;
            _591 = _595;
        }
        float _597 = _591;
        float _599 = _597;
        if (!_587)
        {
            float _601 = _597 * _597;
            _599 = _601;
        }
        float _603 = _599;
        if (!_587)
        {
            float _605 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[23].x, _549);
            _559 = as_type<int>(_605);
        }
        int _607 = _559;
        _561 = as_type<float>(_607);
        if (!_587)
        {
            out.m_40.x = as_type<float>(_607);
        }
    }
    float _609 = _561;
    bool _611 = !_433;
    if (!_611)
    {
        float _613 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
        float _615 = _108 + _613;
        float _617 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
        float _619 = _118 + _617;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
        float _623 = _615 * _615;
        float _625 = fma(_619, _619, _623);
        float _627 = sqrt(_625);
        bool _629 = _627 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
        bool _631 = isnan(_627);
        bool _633 = _629 || _631;
        bool _635 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
        bool _637 = _633 || _635;
        float _639 = _627 * _621;
        float _641 = _639;
        if (!_637)
        {
            float _643 = -_639;
            float _645 = _643 + 1.0;
            _641 = _645;
        }
        float _647 = _641;
        float _649 = _647;
        if (!_637)
        {
            float _651 = _647 * _647;
            _649 = _651;
        }
        float _653 = _649;
        int _655 = as_type<int>(_653);
        if (!_637)
        {
            float _657 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[24].x, _609);
            _655 = as_type<int>(_657);
        }
        int _659 = _655;
        if (!_637)
        {
            out.m_40.x = as_type<float>(_659);
        }
    }
    float _661 = _555 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    float _663 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _665 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _667 = _264 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_42.x = _198;
    out.m_44.x = _661;
    out.m_46.x = _663;
    out.m_46.y = _665;
    out.m_46.z = _667;
    if (!_182)
    {
        out.gl_Position.w = 0.0;
    }
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
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_29.y;
    float _62 = in.m_29.z;
    float _64 = in.m_29.x;
    bool _68 = _60 >= 0.100000001490116119384765625;
    bool _70 = isnan(_60);
    bool _72 = _68 || _70;
    bool _74 = isnan(0.100000001490116119384765625);
    bool _76 = _72 || _74;
    float _78 = _60 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _80 = _60 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _82 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[32].x, _78);
    float _84 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[33].x, _80);
    float _86 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[32].z, _82);
    float _88 = 0.0;
    if (_76)
    {
        _88 = _60;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_76)
    {
        float _94 = _60 + (-0.007000000216066837310791015625);
        _92 = _94;
    }
    float _96 = _92;
    float _98 = 0.0;
    if (_76)
    {
        _98 = _62;
    }
    float _100 = _98;
    float _102 = _60 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _104 = _100;
    if (!_76)
    {
        float _106 = _62 * 1.0499999523162841796875;
        _104 = _106;
    }
    float _108 = _104;
    float _110 = 0.0;
    if (_76)
    {
        _110 = _64;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_76)
    {
        float _116 = _64 * 1.0499999523162841796875;
        _114 = _116;
    }
    float _118 = _114;
    float _120 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[34].x, _102);
    float _122 = _108 * _108;
    float _124 = _96 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _126 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[33].z, _84);
    float _128 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[34].z, _120);
    float _130 = fma(_118, _118, _122);
    float _132 = _96 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _134 = _96 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _136 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[5].x, _124);
    float _138 = _96 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _140 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[4].x, _132);
    float _142 = sqrt(_130);
    float _144 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[5].z, _136);
    float _146 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[7].x, _138);
    float _148 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[6].x, _134);
    float _150 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[4].z, _140);
    float _152 = _144 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _154 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[7].z, _146);
    float _156 = _126 * _126;
    float _158 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[6].z, _148);
    float _160 = _150 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _162 = _152 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _164 = fma(_86, _86, _156);
    float _166 = _158 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _168 = _154 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _170 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[11].x, _162);
    float _172 = fma(_128, _128, _164);
    bool _174 = _142 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _176 = isnan(_142);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _182 = _178 || _180;
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[11].z, _170);
    float _186 = rsqrt(_172);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[11].w, _184);
    float _190 = 0.0;
    float _192 = _188;
    if (_182)
    {
        _190 = _188;
    }
    float _194 = _190;
    float _196 = _194;
    if (!_182)
    {
        _196 = 0.0;
    }
    float _198 = _196;
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[40].x, _200);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _86 * _186;
    float _208 = _126 * _186;
    float _210 = _128 * _186;
    float _212 = -_204;
    float _214 = _212 + 1.0;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _218 = -_208;
    float _220 = -_216;
    float _222 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[42].y, _220);
    float _224 = abs(_214);
    float _226 = log2(_224);
    float _228 = -_210;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c4)._m0[42].z, _222);
    float _232 = fma(_230, -0.5, 0.5);
    float _234 = fma(_230, 0.5, 0.5);
    float _236 = fma(_234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _238 = sqrt(_232);
    float _240 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _242 = fma(_234, _236, -0.212114393711090087890625);
    float _244 = fma(_234, _242, 1.570728778839111328125);
    float _246 = exp2(_240);
    float _248 = _238 * 0.636619746685028076171875;
    float _250 = -_244;
    float _252 = fma(_248, _250, 1.0);
    float _254 = fma(_246, 0.5, 0.5);
    float2 _1026 = float2(_252, _254);
    float3 _258 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1026, float2(0.0), isnan(_1026)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1026, float2(0.0), isnan(_1026)), level(0.0)).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    float _266 = _118 + (-0.5);
    float _268 = _108 + (-0.5);
    bool _270 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _272 = isnan(0.0);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _278 = _274 || _276;
    out.m_32.x = _208;
    float _280 = _266 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _282 = _268 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _284 = _280 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _286 = _282 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _288 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _290 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _292 = fma(_284, 10.0, _290);
    float _294 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _296 = fma(2.0, _294, 0.5);
    float _298 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _300 = 0.0;
    if (_278)
    {
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _300 = _302;
    }
    float _304 = _300;
    float _306 = _292 * 0.15915493667125701904296875;
    float _308 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _310 = fma(_286, 10.0, _308);
    float _312 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[5].w, _298);
    float _314 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _316 = fma(2.0, _314, 0.5);
    float _318 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _320 = _310 * 0.15915493667125701904296875;
    float _322 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _324 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _326 = fma(_316, (*spvDescriptorSet0.vp_c4)._m0[5].w, _318);
    float _328 = _152 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _330 = _322 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _332 = _306 * 6.283185482025146484375;
    float _334 = sin(_332);
    float _336 = _324 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _338 = _152 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _340 = _152 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _342 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[10].x, _328);
    bool _344 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _352 = _348 || _350;
    float _354 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[8].x, _338);
    float _356 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[9].x, _340);
    float _358 = _320 * 6.283185482025146484375;
    float _360 = sin(_358);
    float _362 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[10].z, _342);
    float _364 = _338;
    int _367 = as_type<int>(_312);
    if (_278)
    {
        float _369 = _142 * _304;
        float _371 = precise::clamp(_369, 0.0, 1.0);
        _364 = _371;
    }
    float _373 = _364;
    out.m_34.x = _312;
    out.m_34.y = _326;
    out.m_34.z = _330;
    out.m_34.w = _336;
    float _375 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[8].z, _354);
    float _377 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[9].z, _356);
    float _379 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[10].w, _362);
    float _381 = _373;
    if (_278)
    {
        float _383 = -_373;
        float _385 = _383 + 1.0;
        _381 = _385;
    }
    float _387 = _381;
    float _389 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[8].w, _375);
    float _391 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[9].w, _377);
    float _393 = fma(_334, 0.0350000001490116119384765625, _284);
    float _395 = exp2(_288);
    int _397 = as_type<int>(_387);
    if (_278)
    {
        float _399 = _387 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _397 = as_type<int>(_399);
    }
    int _401 = _397;
    out.m_36.x = 0.0;
    bool _403 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _411 = _407 || _409;
    float _413 = fma(_360, -0.01750000007450580596923828125, _286);
    if (_278)
    {
        out.m_36.x = as_type<float>(_401);
    }
    bool _415 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _417 = isnan(0.0);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _423 = _419 || _421;
    bool _425 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _427 = isnan(0.0);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _433 = _429 || _431;
    float _435 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _437 = fma(_435, (*spvDescriptorSet0.vp_c4)._m0[45].y, _379);
    out.m_38.x = _393;
    out.m_38.y = _413;
    if (!_352)
    {
        _367 = 1065353216;
    }
    int _439 = _367;
    out.gl_Position.x = _389;
    out.gl_Position.y = _391;
    out.gl_Position.z = _437;
    out.gl_Position.w = _188;
    out.m_40.x = 1.0;
    bool _441 = !_352;
    int _443 = _439;
    float _445 = as_type<float>(_439);
    if (!_441)
    {
        float _447 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _449 = _108 + _447;
        float _451 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _453 = _118 + _451;
        float _455 = _449 * _449;
        float _457 = fma(_453, _453, _455);
        float _459 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _461 = sqrt(_457);
        bool _463 = _461 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _465 = isnan(_461);
        bool _467 = _463 || _465;
        bool _469 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _471 = _467 || _469;
        float _473 = _461 * _459;
        float _475 = _473;
        if (!_471)
        {
            float _477 = -_473;
            float _479 = _477 + 1.0;
            _475 = _479;
        }
        float _481 = _475;
        float _483 = _481;
        if (_471)
        {
            _443 = 1065353216;
        }
        int _485 = _443;
        int _487 = _485;
        if (!_471)
        {
            float _489 = _481 * _481;
            _483 = _489;
        }
        float _491 = _483;
        if (!_471)
        {
            float _493 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _487 = as_type<int>(_493);
        }
        int _495 = _487;
        _445 = as_type<float>(_495);
        if (!_471)
        {
            out.m_40.x = as_type<float>(_495);
        }
    }
    float _497 = _445;
    bool _499 = !_423;
    int _501 = as_type<int>(_497);
    float _503 = _497;
    if (!_499)
    {
        float _505 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _507 = _108 + _505;
        float _509 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _511 = _118 + _509;
        float _513 = _507 * _507;
        float _515 = fma(_511, _511, _513);
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _519 = sqrt(_515);
        bool _521 = _519 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _523 = isnan(_519);
        bool _525 = _521 || _523;
        bool _527 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _529 = _525 || _527;
        float _531 = _519 * _517;
        float _533 = _531;
        if (!_529)
        {
            float _535 = -_531;
            float _537 = _535 + 1.0;
            _533 = _537;
        }
        float _539 = _533;
        if (!_529)
        {
            float _541 = _539 * _539;
            _192 = _541;
        }
        float _543 = _192;
        if (!_529)
        {
            float _545 = fma(_543, (*spvDescriptorSet0.vp_c4)._m0[22].x, _497);
            _501 = as_type<int>(_545);
        }
        int _547 = _501;
        _503 = as_type<float>(_547);
        if (!_529)
        {
            out.m_40.x = as_type<float>(_547);
        }
    }
    float _549 = _503;
    float _551 = -_395;
    float _553 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _555 = precise::clamp(_553, 0.0, 1.0);
    bool _557 = !_411;
    int _559 = as_type<int>(_549);
    float _561 = _549;
    if (!_557)
    {
        float _563 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _565 = _108 + _563;
        float _567 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _569 = _118 + _567;
        float _571 = _565 * _565;
        float _573 = fma(_569, _569, _571);
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _577 = sqrt(_573);
        bool _579 = _577 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _581 = isnan(_577);
        bool _583 = _579 || _581;
        bool _585 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _587 = _583 || _585;
        float _589 = _577 * _575;
        float _591 = _589;
        if (!_587)
        {
            float _593 = -_589;
            float _595 = _593 + 1.0;
            _591 = _595;
        }
        float _597 = _591;
        float _599 = _597;
        if (!_587)
        {
            float _601 = _597 * _597;
            _599 = _601;
        }
        float _603 = _599;
        if (!_587)
        {
            float _605 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[23].x, _549);
            _559 = as_type<int>(_605);
        }
        int _607 = _559;
        _561 = as_type<float>(_607);
        if (!_587)
        {
            out.m_40.x = as_type<float>(_607);
        }
    }
    float _609 = _561;
    bool _611 = !_433;
    if (!_611)
    {
        float _613 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
        float _615 = _108 + _613;
        float _617 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
        float _619 = _118 + _617;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
        float _623 = _615 * _615;
        float _625 = fma(_619, _619, _623);
        float _627 = sqrt(_625);
        bool _629 = _627 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
        bool _631 = isnan(_627);
        bool _633 = _629 || _631;
        bool _635 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
        bool _637 = _633 || _635;
        float _639 = _627 * _621;
        float _641 = _639;
        if (!_637)
        {
            float _643 = -_639;
            float _645 = _643 + 1.0;
            _641 = _645;
        }
        float _647 = _641;
        float _649 = _647;
        if (!_637)
        {
            float _651 = _647 * _647;
            _649 = _651;
        }
        float _653 = _649;
        int _655 = as_type<int>(_653);
        if (!_637)
        {
            float _657 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[24].x, _609);
            _655 = as_type<int>(_657);
        }
        int _659 = _655;
        if (!_637)
        {
            out.m_40.x = as_type<float>(_659);
        }
    }
    float _661 = _555 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    float _663 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _665 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _667 = _264 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_42.x = _198;
    out.m_44.x = _661;
    out.m_46.x = _663;
    out.m_46.y = _665;
    out.m_46.z = _667;
    if (!_182)
    {
        out.gl_Position.w = 0.0;
    }
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

