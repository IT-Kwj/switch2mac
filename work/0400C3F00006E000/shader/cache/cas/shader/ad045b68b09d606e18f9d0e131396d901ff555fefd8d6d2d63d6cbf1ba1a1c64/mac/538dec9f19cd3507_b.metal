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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
    float4 m_43 [[color(1)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _50 = gl_FragCoord.w;
    float _52 = in.m_36.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_36.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _640 = float2(_66, _68);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_640, float2(0.0), isnan(_640))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_640, float2(0.0), isnan(_640))).x;
    float _72 = in.m_38.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_38.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = _64 * _76;
    float _86 = _64 * _82;
    float _88 = -_70;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _92 = 1.0 / _90;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _96 = _92 * _94;
    float _98 = _96 * _84;
    float _100 = _96 * _86;
    float _102 = _98 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _106 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[32].x, _102);
    float _108 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[30].x, _104);
    float _110 = _98 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _112 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[32].z, _106);
    float _114 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[30].z, _108);
    float _116 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[31].x, _110);
    float _118 = _112 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _120 = _114 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _122 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[31].z, _116);
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _126 = _118 + _124;
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _130 = _120 + _128;
    float _132 = _122 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _134 = _126 * _126;
    float _136 = fma(_130, _130, _134);
    float _138 = sqrt(_136);
    bool _142 = _138 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    bool _144 = !_142;
    float _146 = _132;
    float _148 = _120;
    float _150 = _118;
    float _152 = _96;
    if (!_144)
    {
        float _154 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _156 = _138 + _154;
        float _158 = _132 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _160 = rsqrt(_136);
        float _162 = -_132;
        float _164 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _166 = _162 + _164;
        float _168 = abs(_158);
        float _170 = abs(_156);
        float _172 = precise::max(_168, _170);
        bool _174 = _172 >= 16.0;
        float _176 = _166 * _166;
        float _178 = _130 * _160;
        float _180 = _126 * _160;
        float _182 = -_130;
        float _184 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[41].z, _182);
        float _186 = -_126;
        float _188 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[41].z, _186);
        float _190 = _156;
        float _192 = _158;
        if (_174)
        {
            float _194 = _156 * 0.0625;
            _190 = _194;
        }
        float _196 = _190;
        if (_174)
        {
            float _198 = _158 * 0.0625;
            _192 = _198;
        }
        float _200 = _192;
        float _202 = fma(_184, _184, _176);
        float _204 = abs(_196);
        bool _206 = _204 != 0.0;
        bool _208 = isnan(_204);
        bool _210 = _206 || _208;
        bool _212 = isnan(0.0);
        bool _214 = _210 || _212;
        float _216 = fma(_188, _188, _202);
        float _218 = abs(_200);
        bool _220 = _218 == 0.0;
        float _222 = abs(_200);
        bool _224 = _222 == 0.0;
        bool _226 = !_214;
        bool _228 = _224 && _226;
        float _230 = sqrt(_216);
        bool _232 = false;
        int _235 = as_type<int>(_202);
        if (_228)
        {
            bool _237 = as_type<int>(_200) >= 0;
            _232 = _237;
        }
        bool _239 = _232;
        int _241 = _239 ? (-1) : 0;
        if (_228)
        {
            int _243 = _239 ? 0 : 1078530011;
            _235 = _243;
        }
        int _245 = _235;
        int _247 = _245;
        if (_228)
        {
            int _249 = int(0x80000000) & as_type<int>(_196);
            int _251 = _245 | _249;
            _247 = _251;
        }
        int _253 = _247;
        bool _255 = !_214;
        bool _257 = _255 && _220;
        int _259 = _253;
        float _261 = as_type<float>(_253);
        if (!_257)
        {
            float _263 = abs(_196);
            bool _265 = _263 != as_type<float>(0x7f800000u /* inf */);
            bool _267 = isnan(_263);
            bool _269 = _265 || _267;
            bool _271 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _273 = _269 || _271;
            float _275 = abs(_200);
            bool _277 = _275 == as_type<float>(0x7f800000u /* inf */);
            float _279 = abs(_200);
            bool _281 = _279 == as_type<float>(0x7f800000u /* inf */);
            bool _283 = !_273;
            bool _285 = _281 && _283;
            if (_285)
            {
                bool _287 = as_type<int>(_200) >= 0;
                _241 = _287 ? (-1) : 0;
            }
            int _289 = _241;
            if (_285)
            {
                _259 = 1075235812;
            }
            int _291 = _259;
            int _293 = _291;
            if (_285)
            {
                int _295 = ~_289;
                int _297 = (_295 != 0) ? _291 : 1061752795;
                _293 = _297;
            }
            int _299 = _293;
            float _301 = as_type<float>(_299);
            if (_285)
            {
                int _303 = int(0x80000000) & as_type<int>(_196);
                int _305 = _299 | _303;
                _301 = as_type<float>(_305);
            }
            float _307 = _301;
            bool _309 = !_273;
            bool _311 = _309 && _277;
            _261 = _307;
            if (!_311)
            {
                float _313 = abs(_196);
                float _315 = abs(_200);
                float _317 = precise::max(_313, _315);
                float _319 = abs(_196);
                float _321 = abs(_200);
                float _323 = precise::min(_319, _321);
                float _325 = 1.0 / _317;
                float _327 = abs(_196);
                float _329 = abs(_200);
                bool _331 = _327 > _329;
                bool _333 = as_type<int>(_200) >= 0;
                float _335 = _323 * _325;
                float _337 = abs(_196);
                float _339 = abs(_200);
                float _341 = _337 + _339;
                int _343 = as_type<int>(_196) & int(0x80000000);
                float _345 = _335 * _335;
                bool _347 = _341 > as_type<float>(0x7f800000u /* inf */);
                bool _349 = isnan(_341);
                bool _351 = _347 || _349;
                bool _353 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _355 = _351 || _353;
                float _357 = _345 + 11.33538818359375;
                float _359 = fma(_345, _357, 28.84246826171875);
                float _361 = fma(_345, _359, 19.6966705322265625);
                float _363 = fma(_345, -0.82336294651031494140625, -5.674867153167724609375);
                float _365 = fma(_345, _363, -6.565555095672607421875);
                float _367 = 1.0 / _361;
                float _369 = _345 * _365;
                float _371 = _335 * _369;
                float _373 = fma(_371, _367, _335);
                float _375 = _373;
                _261 = _341;
                if (_331)
                {
                    float _377 = -_373;
                    float _379 = _377 + 1.57079637050628662109375;
                    _375 = _379;
                }
                float _381 = _375;
                int _383 = as_type<int>(_381);
                if (!_333)
                {
                    float _385 = -_381;
                    float _387 = _385 + 3.1415927410125732421875;
                    _383 = as_type<int>(_387);
                }
                int _389 = _383;
                if (!_355)
                {
                    int _391 = _343 | _389;
                    _261 = as_type<float>(_391);
                }
            }
        }
        float _393 = _261;
        float _395 = fma(_393, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _397 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _399 = _230 + _397;
        float _401 = fma(_178, _395, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _403 = fma(_180, _395, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _146 = _399;
        _148 = _401;
        _150 = _403;
    }
    float _405 = _146;
    float _407 = _148;
    float _409 = _150;
    float _411 = _405 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _413 = _405 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _415 = -_96;
    float _417 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _419 = _415 + _417;
    float _421 = fma(_407, (*spvDescriptorSet0.fp_c5)._m0[101].x, _411);
    float _423 = fma(_407, (*spvDescriptorSet0.fp_c5)._m0[102].x, _413);
    float _425 = fma(_409, (*spvDescriptorSet0.fp_c5)._m0[101].z, _421);
    float _427 = fma(_409, (*spvDescriptorSet0.fp_c5)._m0[102].z, _423);
    float _429 = _425 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _431 = _427 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _433 = trunc(_429);
    int _435 = int(_433);
    float _437 = trunc(_431);
    int _439 = int(_437);
    int _441 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _443 = _435 + _441;
    int _445 = _443 + 1;
    bool _447 = _445 >= 0;
    int _449 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _451 = _439 + _449;
    int _453 = _451 + 1;
    bool _455 = _445 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _457 = !_447;
    bool _459 = _455 || _457;
    bool _461 = _453 < 0;
    bool _463 = _461 || _459;
    bool _465 = _453 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _467 = _465 || _463;
    if (_467)
    {
        _152 = 1.0;
    }
    float _469 = _152;
    float _471 = _469;
    if (!_467)
    {
        int _473 = _453 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _475 = _473 + _445;
        float _477 = floor(_431);
        int _479 = _475 << 2;
        int _481 = _475 >> 2;
        int _483 = 12 & _479;
        int _485 = _481 << 4;
        int _487 = _485 + _483;
        float _489 = floor(_429);
        uint _492 = uint(int(uint(_487) >> uint(2)));
        uint _494 = uint(int(uint(int(_492)) >> uint(2)));
        int _496 = int(_492) & 3;
        float _498 = (*spvDescriptorSet0.fp_c5)._m0[int(_494)][_496];
        float _500 = -_477;
        float _502 = _431 + _500;
        float _504 = -_489;
        float _506 = _429 + _504;
        float _508 = rint(_498);
        float _510 = precise::max(_508, 0.0);
        uint _512 = uint(_510);
        uint _514 = clamp(_512, 0u, 65535u);
        float3 _1339 = float3(_506, _502, float(int(_514)));
        float3 _1343 = select(_1339, float3(0.0), isnan(_1339));
        float _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1343.xy, uint(rint(_1343.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1343.xy, uint(rint(_1343.z)), level(0.0)).x;
        int _518 = _475 << 4;
        int _520 = _518 + 1648;
        int _522 = _487 + 8048;
        uint _524 = uint(int(uint(_522) >> uint(2)));
        uint _526 = uint(int(uint(int(_524)) >> uint(2)));
        int _528 = int(_524) & 3;
        float _530 = (*spvDescriptorSet0.fp_c5)._m0[int(_526)][_528];
        uint _532 = uint(int(uint(_520) >> uint(2)));
        uint _534 = uint(int(uint(int(_532)) >> uint(2)));
        int _536 = int(_532) & 3;
        float _538 = (*spvDescriptorSet0.fp_c5)._m0[int(_534)][_536];
        int _540 = int(_532) + 1;
        uint _542 = uint(int(uint(_540) >> uint(2)));
        int _544 = _540 & 3;
        float _546 = (*spvDescriptorSet0.fp_c5)._m0[int(_542)][_544];
        int _548 = _520 + 8;
        uint _550 = uint(int(uint(_548) >> uint(2)));
        uint _552 = uint(int(uint(int(_550)) >> uint(2)));
        int _554 = int(_550) & 3;
        float _556 = (*spvDescriptorSet0.fp_c5)._m0[int(_552)][_554];
        int _558 = int(_550) + 1;
        uint _560 = uint(int(uint(_558) >> uint(2)));
        int _562 = _558 & 3;
        float _564 = (*spvDescriptorSet0.fp_c5)._m0[int(_560)][_562];
        float _566 = _530 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _568 = _405 * _546;
        float _570 = fma(_407, _538, _568);
        float _572 = 1.0 / _530;
        float _574 = fma(_409, _556, _570);
        float _576 = _574 + _564;
        float _578 = precise::clamp(_576, 0.0, 1.0);
        float _580 = -_578;
        float _582 = _580 + _516;
        float _584 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[39].y, _582);
        float _586 = _566 * _584;
        float _588 = exp2(_586);
        float _590 = 0.0 + _588;
        float _592 = precise::clamp(_590, 0.0, 1.0);
        _471 = _592;
    }
    float _594 = _471;
    float _596 = precise::min(_594, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _598 = _419 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _600 = precise::clamp(_598, 0.0, 1.0);
    float _602 = -_596;
    float _604 = _602 + 1.0;
    float _606 = fma(_600, _604, _596);
    out.m_41.x = 1.0;
    out.m_41.y = _606;
    out.m_41.z = 1.0;
    out.m_41.w = 1.0;
    out.m_43.x = 1.0;
    out.m_43.y = 0.5;
    out.m_43.z = 0.5;
    out.m_43.w = 1.0;
    return out;
}

