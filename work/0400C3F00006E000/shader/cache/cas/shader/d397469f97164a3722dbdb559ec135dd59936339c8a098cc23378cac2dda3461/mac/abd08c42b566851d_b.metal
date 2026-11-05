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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
    float4 m_49 [[color(1)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_42 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_42.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_42.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _56;
    float _72 = _70 * _62;
    float _74 = _70 * _68;
    float2 _782 = float2(_72, _74);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_782, float2(0.0), isnan(_782))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_782, float2(0.0), isnan(_782))).x;
    float _78 = in.m_44.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_44.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _70 * _82;
    float _92 = _70 * _88;
    float _94 = -_76;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _98 = 1.0 / _96;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _102 = _98 * _100;
    float _104 = _102 * _90;
    float _106 = _102 * _92;
    float _108 = _104 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _110 = _104 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _112 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[32].x, _108);
    float _114 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[30].x, _110);
    float _116 = _104 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _118 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[32].z, _112);
    float _120 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[30].z, _114);
    float _122 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[31].x, _116);
    float _124 = _118 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _126 = _120 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _128 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[31].z, _122);
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _132 = _124 + _130;
    float _134 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _136 = _126 + _134;
    float _138 = _128 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _140 = _132 * _132;
    float _142 = fma(_136, _136, _140);
    float _144 = sqrt(_142);
    bool _148 = _144 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    bool _150 = !_148;
    float _152 = _126;
    float _154 = _124;
    float _156 = _138;
    float _158 = 0.0;
    if (!_150)
    {
        float _160 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _162 = _144 + _160;
        float _164 = _138 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _166 = rsqrt(_142);
        float _168 = -_138;
        float _170 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _172 = _168 + _170;
        float _174 = abs(_164);
        float _176 = abs(_162);
        float _178 = precise::max(_174, _176);
        bool _180 = _178 >= 16.0;
        float _182 = _172 * _172;
        float _184 = _136 * _166;
        float _186 = _132 * _166;
        float _188 = -_136;
        float _190 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[41].z, _188);
        float _192 = -_132;
        float _194 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[41].z, _192);
        float _196 = _162;
        float _198 = _164;
        if (_180)
        {
            float _200 = _162 * 0.0625;
            _196 = _200;
        }
        float _202 = _196;
        if (_180)
        {
            float _204 = _164 * 0.0625;
            _198 = _204;
        }
        float _206 = _198;
        float _208 = fma(_190, _190, _182);
        float _210 = abs(_202);
        bool _212 = _210 != 0.0;
        bool _214 = isnan(_210);
        bool _216 = _212 || _214;
        bool _218 = isnan(0.0);
        bool _220 = _216 || _218;
        float _222 = fma(_194, _194, _208);
        float _224 = abs(_206);
        bool _226 = _224 == 0.0;
        float _228 = abs(_206);
        bool _230 = _228 == 0.0;
        bool _232 = !_220;
        bool _234 = _230 && _232;
        float _236 = sqrt(_222);
        bool _238 = false;
        int _241 = as_type<int>(_208);
        if (_234)
        {
            bool _243 = as_type<int>(_206) >= 0;
            _238 = _243;
        }
        bool _245 = _238;
        int _247 = _245 ? (-1) : 0;
        if (_234)
        {
            int _249 = _245 ? 0 : 1078530011;
            _241 = _249;
        }
        int _251 = _241;
        int _253 = _251;
        if (_234)
        {
            int _255 = int(0x80000000) & as_type<int>(_202);
            int _257 = _251 | _255;
            _253 = _257;
        }
        int _259 = _253;
        bool _261 = !_220;
        bool _263 = _261 && _226;
        int _265 = _259;
        float _267 = as_type<float>(_259);
        _158 = _236;
        if (!_263)
        {
            float _269 = abs(_202);
            bool _271 = _269 != as_type<float>(0x7f800000u /* inf */);
            bool _273 = isnan(_269);
            bool _275 = _271 || _273;
            bool _277 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _279 = _275 || _277;
            float _281 = abs(_206);
            bool _283 = _281 == as_type<float>(0x7f800000u /* inf */);
            float _285 = abs(_206);
            bool _287 = _285 == as_type<float>(0x7f800000u /* inf */);
            bool _289 = !_279;
            bool _291 = _287 && _289;
            if (_291)
            {
                bool _293 = as_type<int>(_206) >= 0;
                _247 = _293 ? (-1) : 0;
            }
            int _295 = _247;
            if (_291)
            {
                _265 = 1075235812;
            }
            int _297 = _265;
            int _299 = _297;
            if (_291)
            {
                int _301 = ~_295;
                int _303 = (_301 != 0) ? _297 : 1061752795;
                _299 = _303;
            }
            int _305 = _299;
            float _307 = as_type<float>(_305);
            if (_291)
            {
                int _309 = int(0x80000000) & as_type<int>(_202);
                int _311 = _305 | _309;
                _307 = as_type<float>(_311);
            }
            float _313 = _307;
            bool _315 = !_279;
            bool _317 = _315 && _283;
            _267 = _313;
            if (!_317)
            {
                float _319 = abs(_202);
                float _321 = abs(_206);
                float _323 = precise::max(_319, _321);
                float _325 = abs(_202);
                float _327 = abs(_206);
                float _329 = precise::min(_325, _327);
                float _331 = 1.0 / _323;
                float _333 = abs(_202);
                float _335 = abs(_206);
                bool _337 = _333 > _335;
                bool _339 = as_type<int>(_206) >= 0;
                float _341 = _329 * _331;
                float _343 = abs(_202);
                float _345 = abs(_206);
                float _347 = _343 + _345;
                int _349 = as_type<int>(_202) & int(0x80000000);
                float _351 = _341 * _341;
                bool _353 = _347 > as_type<float>(0x7f800000u /* inf */);
                bool _355 = isnan(_347);
                bool _357 = _353 || _355;
                bool _359 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _361 = _357 || _359;
                float _363 = _351 + 11.33538818359375;
                float _365 = fma(_351, _363, 28.84246826171875);
                float _367 = fma(_351, _365, 19.6966705322265625);
                float _369 = fma(_351, -0.82336294651031494140625, -5.674867153167724609375);
                float _371 = fma(_351, _369, -6.565555095672607421875);
                float _373 = 1.0 / _367;
                float _375 = _351 * _371;
                float _377 = _341 * _375;
                float _379 = fma(_377, _373, _341);
                float _381 = _379;
                _267 = _347;
                if (_337)
                {
                    float _383 = -_379;
                    float _385 = _383 + 1.57079637050628662109375;
                    _381 = _385;
                }
                float _387 = _381;
                int _389 = as_type<int>(_387);
                if (!_339)
                {
                    float _391 = -_387;
                    float _393 = _391 + 3.1415927410125732421875;
                    _389 = as_type<int>(_393);
                }
                int _395 = _389;
                if (!_361)
                {
                    int _397 = _349 | _395;
                    _267 = as_type<float>(_397);
                }
            }
        }
        float _399 = _267;
        float _401 = fma(_399, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _403 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _405 = _236 + _403;
        float _407 = fma(_184, _401, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _409 = fma(_186, _401, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _152 = _407;
        _154 = _409;
        _156 = _405;
    }
    float _411 = _152;
    float _413 = _154;
    float _415 = _156;
    float _417 = _158;
    float _419 = fma(_411, 6.2500002968590706586837768554688e-05, 0.5);
    float _421 = fma(_413, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1317 = float2(_419, _421);
    float _423 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1317, float2(0.0), isnan(_1317))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1317, float2(0.0), isnan(_1317))).x;
    float _425 = _415 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _427 = _415 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _429 = fma(_411, (*spvDescriptorSet0.fp_c5)._m0[101].x, _425);
    float _431 = fma(_411, (*spvDescriptorSet0.fp_c5)._m0[102].x, _427);
    float _433 = fma(_413, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _435 = fma(_413, (*spvDescriptorSet0.fp_c5)._m0[101].z, _429);
    float _437 = fma(_413, (*spvDescriptorSet0.fp_c5)._m0[102].z, _431);
    float _439 = _435 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _441 = _437 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _443 = trunc(_439);
    int _445 = int(_443);
    float _447 = trunc(_441);
    int _449 = int(_447);
    int _451 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _453 = _445 + _451;
    int _455 = _453 + 1;
    bool _457 = _455 >= 0;
    int _459 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _461 = _449 + _459;
    int _463 = _461 + 1;
    bool _465 = _455 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _467 = !_457;
    bool _469 = _465 || _467;
    bool _471 = _463 < 0;
    bool _473 = _471 || _469;
    bool _475 = _463 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _477 = _475 || _473;
    int _479 = _455;
    int _481 = as_type<int>(_437);
    int _483 = _463;
    if (!_477)
    {
        int _485 = _463 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _487 = _485 + _455;
        _479 = _487;
    }
    int _489 = _479;
    float _491 = _417;
    if (!_477)
    {
        float _493 = floor(_441);
        _491 = _493;
    }
    float _495 = _491;
    if (!_477)
    {
        int _497 = _489 << 2;
        _481 = _497;
    }
    int _499 = _481;
    int _501 = _499;
    if (!_477)
    {
        int _503 = _489 >> 2;
        _483 = _503;
    }
    int _505 = _483;
    int _507 = _505;
    if (!_477)
    {
        int _509 = 12 & _499;
        _501 = _509;
    }
    int _511 = _501;
    if (!_477)
    {
        int _513 = _505 << 4;
        int _515 = _513 + _511;
        _507 = _515;
    }
    int _517 = _507;
    float _519 = as_type<float>(_511);
    if (!_477)
    {
        float _521 = floor(_439);
        _519 = _521;
    }
    float _523 = _519;
    float _525 = 0.0;
    if (!_477)
    {
        uint _528 = uint(int(uint(_517) >> uint(2)));
        uint _530 = uint(int(uint(int(_528)) >> uint(2)));
        int _532 = int(_528) & 3;
        float _534 = (*spvDescriptorSet0.fp_c5)._m0[int(_530)][_532];
        _525 = _534;
    }
    float _536 = _525;
    float _538 = 0.0;
    if (!_477)
    {
        float _540 = -_495;
        float _542 = _441 + _540;
        _538 = _542;
    }
    float _544 = _538;
    float _546 = fma(_411, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _548 = 0.0;
    if (!_477)
    {
        float _550 = -_523;
        float _552 = _439 + _550;
        _548 = _552;
    }
    float _554 = _548;
    float _556 = _536;
    if (!_477)
    {
        float _558 = rint(_536);
        float _560 = precise::max(_558, 0.0);
        uint _562 = uint(_560);
        uint _564 = clamp(_562, 0u, 65535u);
        _556 = as_type<float>(_564);
    }
    float _566 = _556;
    float2 _1565 = float2(_419, _421);
    float _568 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1565, float2(0.0), isnan(_1565)), level(_423)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1565, float2(0.0), isnan(_1565)), level(_423)).x;
    float2 _1574 = float2(_546, _433);
    float _570 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1574, float2(0.0), isnan(_1574))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1574, float2(0.0), isnan(_1574))).x;
    float _572 = _523;
    if (!_477)
    {
        float3 _1590 = float3(_554, _544, float(as_type<int>(_566)));
        float3 _1594 = select(_1590, float3(0.0), isnan(_1590));
        float _574 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1594.xy, uint(rint(_1594.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1594.xy, uint(rint(_1594.z)), level(0.0)).x;
        _572 = _574;
    }
    float _576 = _572;
    float _578 = abs(_102);
    float _580 = log2(_578);
    float _582 = _580 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _584 = exp2(_582);
    float _586 = fma(_584, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = fma(_588, -2.0, 3.0);
    float _592 = _588 * _588;
    float _594 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _596 = _592 * _590;
    float _598 = precise::max(0.0, _594);
    float _600 = -_596;
    float _602 = _600 + 1.0;
    float _604 = fma(_602, (*spvDescriptorSet0.fp_c3)._m0[44].w, _596);
    bool _606 = _102 >= (-8000.0);
    bool _608 = isnan(_102);
    bool _610 = _606 || _608;
    bool _612 = isnan(-8000.0);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _604 * _598;
    float _620 = _616 * _618;
    float _622 = _620 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _624 = abs(_568);
    float _626 = _624 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _628 = -_570;
    float _630 = _628 + 1.0;
    float _632 = -_626;
    float _634 = fma(_616, _632, 1.0);
    float _636 = _630 * _622;
    float _638 = precise::clamp(_636, 0.0, 1.0);
    float _640 = _616;
    if (_477)
    {
        _640 = 1.0;
    }
    float _642 = _640;
    float _644 = _642;
    if (!_477)
    {
        int _646 = _489 << 4;
        int _648 = _646 + 1648;
        int _650 = _517 + 8048;
        uint _652 = uint(int(uint(_650) >> uint(2)));
        uint _654 = uint(int(uint(int(_652)) >> uint(2)));
        int _656 = int(_652) & 3;
        float _658 = (*spvDescriptorSet0.fp_c5)._m0[int(_654)][_656];
        uint _660 = uint(int(uint(_648) >> uint(2)));
        uint _662 = uint(int(uint(int(_660)) >> uint(2)));
        int _664 = int(_660) & 3;
        float _666 = (*spvDescriptorSet0.fp_c5)._m0[int(_662)][_664];
        int _668 = int(_660) + 1;
        uint _670 = uint(int(uint(_668) >> uint(2)));
        int _672 = _668 & 3;
        float _674 = (*spvDescriptorSet0.fp_c5)._m0[int(_670)][_672];
        int _676 = _648 + 8;
        uint _678 = uint(int(uint(_676) >> uint(2)));
        uint _680 = uint(int(uint(int(_678)) >> uint(2)));
        int _682 = int(_678) & 3;
        float _684 = (*spvDescriptorSet0.fp_c5)._m0[int(_680)][_682];
        int _686 = int(_678) + 1;
        uint _688 = uint(int(uint(_686) >> uint(2)));
        int _690 = _686 & 3;
        float _692 = (*spvDescriptorSet0.fp_c5)._m0[int(_688)][_690];
        float _694 = 1.0 / _658;
        float _696 = _415 * _674;
        float _698 = fma(_411, _666, _696);
        float _700 = fma(_413, _684, _698);
        float _702 = _700 + _692;
        float _704 = precise::clamp(_702, 0.0, 1.0);
        float _706 = -_704;
        float _708 = _706 + _576;
        float _710 = _658 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _712 = fma(_694, (*spvDescriptorSet0.fp_c3)._m0[39].y, _708);
        float _714 = _710 * _712;
        float _716 = exp2(_714);
        float _718 = 0.0 + _716;
        float _720 = precise::clamp(_718, 0.0, 1.0);
        _644 = _720;
    }
    float _722 = _644;
    float _724 = precise::min(_722, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _726 = -_102;
    float _728 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _730 = _726 + _728;
    float _732 = -_638;
    float _734 = fma(_732, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _736 = precise::min(_634, 1.0);
    float _738 = _730 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _740 = precise::clamp(_738, 0.0, 1.0);
    float _742 = -_724;
    float _744 = _742 + 1.0;
    float _746 = precise::min(_736, _734);
    float _748 = fma(_740, _744, _724);
    out.m_47.x = 1.0;
    out.m_47.y = _748;
    out.m_47.z = 1.0;
    out.m_47.w = _746;
    out.m_49.x = 1.0;
    out.m_49.y = 0.5;
    out.m_49.z = 0.5;
    out.m_49.w = 1.0;
    return out;
}

