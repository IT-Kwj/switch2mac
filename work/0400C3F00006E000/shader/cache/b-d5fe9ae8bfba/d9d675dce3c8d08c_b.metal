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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _638 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_638, float2(0.0), isnan(_638))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_638, float2(0.0), isnan(_638))).y;
    bool _65 = _61 >= 0.0;
    int _68 = as_type<int>(_61);
    int _70 = as_type<int>(_53);
    if (!_65)
    {
        _68 = 0;
        _70 = 0;
    }
    int _72 = _68;
    int _74 = _70;
    int _76 = 0;
    int _78 = 0;
    if (!_65)
    {
        _76 = 0;
        _78 = 0;
    }
    int _80 = _76;
    int _82 = _78;
    if (!_65)
    {
        out.m_34.x = as_type<float>(_72);
        out.m_34.y = as_type<float>(_74);
        out.m_34.z = as_type<float>(_80);
        out.m_34.w = as_type<float>(_82);
        return out;
    }
    bool _84 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
    bool _86 = !_84;
    float _88 = 0.0;
    float _90 = 0.0;
    float _92 = 0.0;
    float _94 = 0.0;
    int _96 = 0;
    int _98 = 0;
    int _100 = 0;
    int _102 = 0;
    int _104 = 0;
    int _106 = 0;
    int _108 = 0;
    int _110 = 0;
    if (!_86)
    {
        float2 _696 = float2(_57, _59);
        float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_696, float2(0.0), isnan(_696)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_696, float2(0.0), isnan(_696)), level(0.0)).w;
        int _114 = (-1) + as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
        int _116 = _114 + 1;
        float _118 = fma(_59, 2.0, -1.0);
        bool _120 = _116 > 3;
        float _122 = fma(_57, 2.0, -1.0);
        float _124 = _118 * (*spvDescriptorSet0.fp_c3)._m0[100].z;
        float _126 = _122 * (*spvDescriptorSet0.fp_c3)._m0[100].z;
        bool _128 = !_120;
        int _130 = 0;
        int _132 = 0;
        int _134 = -1;
        if (!_128)
        {
            float _136 = _112 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
            float _138 = _112 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
            int _140 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x) + (-3);
            _134 = 0;
            bool _142;
            do
            {
                int _144 = _130;
                float _146 = _88;
                float _148 = _90;
                float _150 = _92;
                float _152 = _94;
                int _154 = _144 << 4;
                uint _157 = uint(int(uint(_154) >> uint(2)));
                uint _159 = uint(int(uint(int(_157)) >> uint(2)));
                int _161 = int(_157) & 3;
                float _163 = (*spvDescriptorSet0.fp_c3)._m0[int(_159)][_161];
                int _165 = int(_157) + 1;
                uint _167 = uint(int(uint(_165) >> uint(2)));
                int _169 = _165 & 3;
                float _171 = (*spvDescriptorSet0.fp_c3)._m0[int(_167)][_169];
                int _173 = _154 + 16;
                uint _175 = uint(int(uint(_173) >> uint(2)));
                uint _177 = uint(int(uint(int(_175)) >> uint(2)));
                int _179 = int(_175) & 3;
                float _181 = (*spvDescriptorSet0.fp_c3)._m0[int(_177)][_179];
                int _183 = int(_175) + 1;
                uint _185 = uint(int(uint(_183) >> uint(2)));
                int _187 = _183 & 3;
                float _189 = (*spvDescriptorSet0.fp_c3)._m0[int(_185)][_187];
                int _191 = _154 + 32;
                uint _193 = uint(int(uint(_191) >> uint(2)));
                uint _195 = uint(int(uint(int(_193)) >> uint(2)));
                int _197 = int(_193) & 3;
                float _199 = (*spvDescriptorSet0.fp_c3)._m0[int(_195)][_197];
                int _201 = int(_193) + 1;
                uint _203 = uint(int(uint(_201) >> uint(2)));
                int _205 = _201 & 3;
                float _207 = (*spvDescriptorSet0.fp_c3)._m0[int(_203)][_205];
                int _209 = _154 + 48;
                uint _211 = uint(int(uint(_209) >> uint(2)));
                uint _213 = uint(int(uint(int(_211)) >> uint(2)));
                int _215 = int(_211) & 3;
                float _217 = (*spvDescriptorSet0.fp_c3)._m0[int(_213)][_215];
                int _219 = int(_211) + 1;
                uint _221 = uint(int(uint(_219) >> uint(2)));
                int _223 = _219 & 3;
                float _225 = (*spvDescriptorSet0.fp_c3)._m0[int(_221)][_223];
                float _227 = _124 * _171;
                float _229 = fma(_126, _163, _227);
                float _231 = _124 * _189;
                float _233 = abs(_229);
                float _235 = -_233;
                float _237 = _235 + 1.0;
                float _239 = fma(_126, _181, _231);
                float _241 = _237 * _136;
                float _243 = _237 * _138;
                float _245 = abs(_239);
                float _247 = -_245;
                float _249 = _247 + 1.0;
                float _251 = fma(_241, _163, _57);
                float _253 = _124 * _207;
                float _255 = fma(_243, _171, _59);
                float _257 = _249 * _138;
                float _259 = fma(_126, _199, _253);
                float _261 = _249 * _136;
                float _263 = _124 * _225;
                float _265 = fma(_257, _189, _59);
                float _267 = abs(_259);
                float _269 = -_267;
                float _271 = _269 + 1.0;
                float _273 = fma(_261, _181, _57);
                float _275 = fma(_126, _217, _263);
                float _277 = _271 * _136;
                float _279 = _271 * _138;
                float _281 = abs(_275);
                float _283 = -_281;
                float _285 = _283 + 1.0;
                float _287 = fma(_277, _199, _57);
                float _289 = _285 * _136;
                float _291 = _285 * _138;
                float _293 = fma(_279, _207, _59);
                float2 _978 = float2(_251, _255);
                float4 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_978, float2(0.0), isnan(_978)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_978, float2(0.0), isnan(_978)), level(0.0)).xyzw;
                float _298 = _296.x;
                float _300 = _296.y;
                float _302 = _296.z;
                float _304 = _296.w;
                float _306 = fma(_289, _217, _57);
                float _308 = fma(_291, _225, _59);
                float2 _1002 = float2(_273, _265);
                float4 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1002, float2(0.0), isnan(_1002)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1002, float2(0.0), isnan(_1002)), level(0.0)).xyzw;
                float _312 = _310.x;
                float _314 = _310.y;
                float _316 = _310.z;
                float _318 = _310.w;
                float2 _1018 = float2(_287, _293);
                float4 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1018, float2(0.0), isnan(_1018)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1018, float2(0.0), isnan(_1018)), level(0.0)).xyzw;
                float _322 = _320.x;
                float _324 = _320.y;
                float _326 = _320.z;
                float _328 = _320.w;
                float2 _1034 = float2(_306, _308);
                float4 _330 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1034, float2(0.0), isnan(_1034)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1034, float2(0.0), isnan(_1034)), level(0.0)).xyzw;
                float _332 = _330.x;
                float _334 = _330.y;
                float _336 = _330.z;
                float _338 = _330.w;
                int _340 = _144 + 4;
                bool _342 = _340 >= _140;
                float _344 = precise::max(_298, _146);
                float _346 = precise::max(_300, _148);
                float _348 = precise::max(_302, _150);
                float _350 = precise::max(_304, _152);
                float _352 = precise::max(_344, _312);
                float _354 = precise::max(_346, _314);
                float _356 = precise::max(_348, _316);
                float _358 = precise::max(_350, _318);
                float _360 = precise::max(_352, _322);
                float _362 = precise::max(_354, _324);
                float _364 = precise::max(_356, _326);
                float _366 = precise::max(_358, _328);
                float _368 = precise::max(_360, _332);
                float _370 = precise::max(_362, _334);
                float _372 = precise::max(_364, _336);
                float _374 = precise::max(_366, _338);
                _142 = !_342;
                _130 = _340;
                _88 = _368;
                _90 = _370;
                _92 = _372;
                _94 = _374;
                _132 = _340;
                _96 = as_type<int>(_368);
                _98 = as_type<int>(_370);
                _100 = as_type<int>(_372);
                _102 = as_type<int>(_374);
            } while (_142);
        }
        int _376 = _132;
        int _378 = _96;
        int _380 = _98;
        int _382 = _100;
        int _384 = _102;
        int _386 = _134;
        int _388 = ~_376;
        int _390 = _388 + as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
        int _392 = _390 + 1;
        bool _394 = _392 > 1;
        bool _396 = !_394;
        int _398 = _376;
        int _400 = _386;
        int _402 = _378;
        int _404 = _380;
        int _406 = _382;
        int _408 = _384;
        if (!_396)
        {
            int _410 = _376 << 4;
            uint _412 = uint(int(uint(_410) >> uint(2)));
            uint _414 = uint(int(uint(int(_412)) >> uint(2)));
            int _416 = int(_412) & 3;
            float _418 = (*spvDescriptorSet0.fp_c3)._m0[int(_414)][_416];
            int _420 = int(_412) + 1;
            uint _422 = uint(int(uint(_420) >> uint(2)));
            int _424 = _420 & 3;
            float _426 = (*spvDescriptorSet0.fp_c3)._m0[int(_422)][_424];
            int _428 = _410 + 16;
            uint _430 = uint(int(uint(_428) >> uint(2)));
            uint _432 = uint(int(uint(int(_430)) >> uint(2)));
            int _434 = int(_430) & 3;
            float _436 = (*spvDescriptorSet0.fp_c3)._m0[int(_432)][_434];
            int _438 = int(_430) + 1;
            uint _440 = uint(int(uint(_438) >> uint(2)));
            int _442 = _438 & 3;
            float _444 = (*spvDescriptorSet0.fp_c3)._m0[int(_440)][_442];
            float _446 = _124 * _426;
            float _448 = fma(_126, _418, _446);
            float _450 = _124 * _444;
            float _452 = abs(_448);
            float _454 = -_452;
            float _456 = _454 + 1.0;
            float _458 = fma(_126, _436, _450);
            float _460 = _112 * _456;
            float _462 = abs(_458);
            float _464 = -_462;
            float _466 = _464 + 1.0;
            float _468 = _460 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
            float _470 = _112 * _466;
            float _472 = _460 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
            float _474 = fma(_468, _426, _59);
            float _476 = _470 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
            float _478 = fma(_472, _418, _57);
            float _480 = _470 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
            float _482 = fma(_476, _436, _57);
            float _484 = fma(_480, _444, _59);
            float2 _1275 = float2(_478, _474);
            float4 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1275, float2(0.0), isnan(_1275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1275, float2(0.0), isnan(_1275)), level(0.0)).xyzw;
            float _488 = _486.x;
            float _490 = _486.y;
            float _492 = _486.z;
            float _494 = _486.w;
            float2 _1291 = float2(_482, _484);
            float4 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1291, float2(0.0), isnan(_1291)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1291, float2(0.0), isnan(_1291)), level(0.0)).xyzw;
            float _498 = _496.x;
            float _500 = _496.y;
            float _502 = _496.z;
            float _504 = _496.w;
            int _506 = _376 + 2;
            float _508 = precise::max(as_type<float>(_378), _488);
            float _510 = precise::max(as_type<float>(_380), _490);
            float _512 = precise::max(as_type<float>(_382), _492);
            float _514 = precise::max(as_type<float>(_384), _494);
            float _516 = precise::max(_508, _498);
            float _518 = precise::max(_510, _500);
            float _520 = precise::max(_512, _502);
            float _522 = precise::max(_514, _504);
            _398 = _506;
            _400 = 0;
            _402 = as_type<int>(_516);
            _404 = as_type<int>(_518);
            _406 = as_type<int>(_520);
            _408 = as_type<int>(_522);
        }
        int _524 = _398;
        int _526 = _400;
        int _528 = _402;
        int _530 = _404;
        int _532 = _406;
        int _534 = _408;
        bool _536 = _524 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
        int _538 = (_536 ? (-1) : 0) | _526;
        int _540 = ~_538;
        _104 = _528;
        _106 = _530;
        _108 = _532;
        _110 = _534;
        if (!(_540 != 0))
        {
            int _542 = _524 << 4;
            uint _544 = uint(int(uint(_542) >> uint(2)));
            uint _546 = uint(int(uint(int(_544)) >> uint(2)));
            int _548 = int(_544) & 3;
            float _550 = (*spvDescriptorSet0.fp_c3)._m0[int(_546)][_548];
            int _552 = int(_544) + 1;
            uint _554 = uint(int(uint(_552) >> uint(2)));
            int _556 = _552 & 3;
            float _558 = (*spvDescriptorSet0.fp_c3)._m0[int(_554)][_556];
            float _560 = _124 * _558;
            float _562 = fma(_126, _550, _560);
            float _564 = abs(_562);
            float _566 = -_564;
            float _568 = _566 + 1.0;
            float _570 = _112 * _568;
            float _572 = _570 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
            float _574 = _570 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
            float _576 = fma(_572, _550, _57);
            float _578 = fma(_574, _558, _59);
            float2 _1434 = float2(_576, _578);
            float4 _580 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1434, float2(0.0), isnan(_1434)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1434, float2(0.0), isnan(_1434)), level(0.0)).xyzw;
            float _582 = _580.x;
            float _584 = _580.y;
            float _586 = _580.z;
            float _588 = _580.w;
            float _590 = precise::max(as_type<float>(_528), _582);
            float _592 = precise::max(as_type<float>(_530), _584);
            float _594 = precise::max(as_type<float>(_532), _586);
            float _596 = precise::max(as_type<float>(_534), _588);
            _104 = as_type<int>(_590);
            _106 = as_type<int>(_592);
            _108 = as_type<int>(_594);
            _110 = as_type<int>(_596);
        }
    }
    int _598 = _104;
    int _600 = _106;
    int _602 = _108;
    int _604 = _110;
    out.m_34.x = as_type<float>(_598);
    out.m_34.y = as_type<float>(_600);
    out.m_34.z = as_type<float>(_602);
    out.m_34.w = as_type<float>(_604);
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _638 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_638, float2(0.0), isnan(_638))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_638, float2(0.0), isnan(_638))).y;
    bool _65 = _61 >= 0.0;
    int _68 = as_type<int>(_61);
    int _70 = as_type<int>(_53);
    if (!_65)
    {
        _68 = 0;
        _70 = 0;
    }
    int _72 = _68;
    int _74 = _70;
    int _76 = 0;
    int _78 = 0;
    if (!_65)
    {
        _76 = 0;
        _78 = 0;
    }
    int _80 = _76;
    int _82 = _78;
    if (!_65)
    {
        out.m_34.x = as_type<float>(_72);
        out.m_34.y = as_type<float>(_74);
        out.m_34.z = as_type<float>(_80);
        out.m_34.w = as_type<float>(_82);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    bool _84 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
    bool _86 = !_84;
    float _88 = 0.0;
    float _90 = 0.0;
    float _92 = 0.0;
    float _94 = 0.0;
    int _96 = 0;
    int _98 = 0;
    int _100 = 0;
    int _102 = 0;
    int _104 = 0;
    int _106 = 0;
    int _108 = 0;
    int _110 = 0;
    if (!_86)
    {
        float2 _696 = float2(_57, _59);
        float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_696, float2(0.0), isnan(_696)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_696, float2(0.0), isnan(_696)), level(0.0)).w;
        int _114 = (-1) + as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
        int _116 = _114 + 1;
        float _118 = fma(_59, 2.0, -1.0);
        bool _120 = _116 > 3;
        float _122 = fma(_57, 2.0, -1.0);
        float _124 = _118 * (*spvDescriptorSet0.fp_c3)._m0[100].z;
        float _126 = _122 * (*spvDescriptorSet0.fp_c3)._m0[100].z;
        bool _128 = !_120;
        int _130 = 0;
        int _132 = 0;
        int _134 = -1;
        if (!_128)
        {
            float _136 = _112 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
            float _138 = _112 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
            int _140 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x) + (-3);
            _134 = 0;
            bool _142;
            do
            {
                int _144 = _130;
                float _146 = _88;
                float _148 = _90;
                float _150 = _92;
                float _152 = _94;
                int _154 = _144 << 4;
                uint _157 = uint(int(uint(_154) >> uint(2)));
                uint _159 = uint(int(uint(int(_157)) >> uint(2)));
                int _161 = int(_157) & 3;
                float _163 = (*spvDescriptorSet0.fp_c3)._m0[int(_159)][_161];
                int _165 = int(_157) + 1;
                uint _167 = uint(int(uint(_165) >> uint(2)));
                int _169 = _165 & 3;
                float _171 = (*spvDescriptorSet0.fp_c3)._m0[int(_167)][_169];
                int _173 = _154 + 16;
                uint _175 = uint(int(uint(_173) >> uint(2)));
                uint _177 = uint(int(uint(int(_175)) >> uint(2)));
                int _179 = int(_175) & 3;
                float _181 = (*spvDescriptorSet0.fp_c3)._m0[int(_177)][_179];
                int _183 = int(_175) + 1;
                uint _185 = uint(int(uint(_183) >> uint(2)));
                int _187 = _183 & 3;
                float _189 = (*spvDescriptorSet0.fp_c3)._m0[int(_185)][_187];
                int _191 = _154 + 32;
                uint _193 = uint(int(uint(_191) >> uint(2)));
                uint _195 = uint(int(uint(int(_193)) >> uint(2)));
                int _197 = int(_193) & 3;
                float _199 = (*spvDescriptorSet0.fp_c3)._m0[int(_195)][_197];
                int _201 = int(_193) + 1;
                uint _203 = uint(int(uint(_201) >> uint(2)));
                int _205 = _201 & 3;
                float _207 = (*spvDescriptorSet0.fp_c3)._m0[int(_203)][_205];
                int _209 = _154 + 48;
                uint _211 = uint(int(uint(_209) >> uint(2)));
                uint _213 = uint(int(uint(int(_211)) >> uint(2)));
                int _215 = int(_211) & 3;
                float _217 = (*spvDescriptorSet0.fp_c3)._m0[int(_213)][_215];
                int _219 = int(_211) + 1;
                uint _221 = uint(int(uint(_219) >> uint(2)));
                int _223 = _219 & 3;
                float _225 = (*spvDescriptorSet0.fp_c3)._m0[int(_221)][_223];
                float _227 = _124 * _171;
                float _229 = fma(_126, _163, _227);
                float _231 = _124 * _189;
                float _233 = abs(_229);
                float _235 = -_233;
                float _237 = _235 + 1.0;
                float _239 = fma(_126, _181, _231);
                float _241 = _237 * _136;
                float _243 = _237 * _138;
                float _245 = abs(_239);
                float _247 = -_245;
                float _249 = _247 + 1.0;
                float _251 = fma(_241, _163, _57);
                float _253 = _124 * _207;
                float _255 = fma(_243, _171, _59);
                float _257 = _249 * _138;
                float _259 = fma(_126, _199, _253);
                float _261 = _249 * _136;
                float _263 = _124 * _225;
                float _265 = fma(_257, _189, _59);
                float _267 = abs(_259);
                float _269 = -_267;
                float _271 = _269 + 1.0;
                float _273 = fma(_261, _181, _57);
                float _275 = fma(_126, _217, _263);
                float _277 = _271 * _136;
                float _279 = _271 * _138;
                float _281 = abs(_275);
                float _283 = -_281;
                float _285 = _283 + 1.0;
                float _287 = fma(_277, _199, _57);
                float _289 = _285 * _136;
                float _291 = _285 * _138;
                float _293 = fma(_279, _207, _59);
                float2 _978 = float2(_251, _255);
                float4 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_978, float2(0.0), isnan(_978)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_978, float2(0.0), isnan(_978)), level(0.0)).xyzw;
                float _298 = _296.x;
                float _300 = _296.y;
                float _302 = _296.z;
                float _304 = _296.w;
                float _306 = fma(_289, _217, _57);
                float _308 = fma(_291, _225, _59);
                float2 _1002 = float2(_273, _265);
                float4 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1002, float2(0.0), isnan(_1002)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1002, float2(0.0), isnan(_1002)), level(0.0)).xyzw;
                float _312 = _310.x;
                float _314 = _310.y;
                float _316 = _310.z;
                float _318 = _310.w;
                float2 _1018 = float2(_287, _293);
                float4 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1018, float2(0.0), isnan(_1018)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1018, float2(0.0), isnan(_1018)), level(0.0)).xyzw;
                float _322 = _320.x;
                float _324 = _320.y;
                float _326 = _320.z;
                float _328 = _320.w;
                float2 _1034 = float2(_306, _308);
                float4 _330 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1034, float2(0.0), isnan(_1034)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1034, float2(0.0), isnan(_1034)), level(0.0)).xyzw;
                float _332 = _330.x;
                float _334 = _330.y;
                float _336 = _330.z;
                float _338 = _330.w;
                int _340 = _144 + 4;
                bool _342 = _340 >= _140;
                float _344 = precise::max(_298, _146);
                float _346 = precise::max(_300, _148);
                float _348 = precise::max(_302, _150);
                float _350 = precise::max(_304, _152);
                float _352 = precise::max(_344, _312);
                float _354 = precise::max(_346, _314);
                float _356 = precise::max(_348, _316);
                float _358 = precise::max(_350, _318);
                float _360 = precise::max(_352, _322);
                float _362 = precise::max(_354, _324);
                float _364 = precise::max(_356, _326);
                float _366 = precise::max(_358, _328);
                float _368 = precise::max(_360, _332);
                float _370 = precise::max(_362, _334);
                float _372 = precise::max(_364, _336);
                float _374 = precise::max(_366, _338);
                _142 = !_342;
                _130 = _340;
                _88 = _368;
                _90 = _370;
                _92 = _372;
                _94 = _374;
                _132 = _340;
                _96 = as_type<int>(_368);
                _98 = as_type<int>(_370);
                _100 = as_type<int>(_372);
                _102 = as_type<int>(_374);
            } while (_142);
        }
        int _376 = _132;
        int _378 = _96;
        int _380 = _98;
        int _382 = _100;
        int _384 = _102;
        int _386 = _134;
        int _388 = ~_376;
        int _390 = _388 + as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
        int _392 = _390 + 1;
        bool _394 = _392 > 1;
        bool _396 = !_394;
        int _398 = _376;
        int _400 = _386;
        int _402 = _378;
        int _404 = _380;
        int _406 = _382;
        int _408 = _384;
        if (!_396)
        {
            int _410 = _376 << 4;
            uint _412 = uint(int(uint(_410) >> uint(2)));
            uint _414 = uint(int(uint(int(_412)) >> uint(2)));
            int _416 = int(_412) & 3;
            float _418 = (*spvDescriptorSet0.fp_c3)._m0[int(_414)][_416];
            int _420 = int(_412) + 1;
            uint _422 = uint(int(uint(_420) >> uint(2)));
            int _424 = _420 & 3;
            float _426 = (*spvDescriptorSet0.fp_c3)._m0[int(_422)][_424];
            int _428 = _410 + 16;
            uint _430 = uint(int(uint(_428) >> uint(2)));
            uint _432 = uint(int(uint(int(_430)) >> uint(2)));
            int _434 = int(_430) & 3;
            float _436 = (*spvDescriptorSet0.fp_c3)._m0[int(_432)][_434];
            int _438 = int(_430) + 1;
            uint _440 = uint(int(uint(_438) >> uint(2)));
            int _442 = _438 & 3;
            float _444 = (*spvDescriptorSet0.fp_c3)._m0[int(_440)][_442];
            float _446 = _124 * _426;
            float _448 = fma(_126, _418, _446);
            float _450 = _124 * _444;
            float _452 = abs(_448);
            float _454 = -_452;
            float _456 = _454 + 1.0;
            float _458 = fma(_126, _436, _450);
            float _460 = _112 * _456;
            float _462 = abs(_458);
            float _464 = -_462;
            float _466 = _464 + 1.0;
            float _468 = _460 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
            float _470 = _112 * _466;
            float _472 = _460 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
            float _474 = fma(_468, _426, _59);
            float _476 = _470 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
            float _478 = fma(_472, _418, _57);
            float _480 = _470 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
            float _482 = fma(_476, _436, _57);
            float _484 = fma(_480, _444, _59);
            float2 _1275 = float2(_478, _474);
            float4 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1275, float2(0.0), isnan(_1275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1275, float2(0.0), isnan(_1275)), level(0.0)).xyzw;
            float _488 = _486.x;
            float _490 = _486.y;
            float _492 = _486.z;
            float _494 = _486.w;
            float2 _1291 = float2(_482, _484);
            float4 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1291, float2(0.0), isnan(_1291)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1291, float2(0.0), isnan(_1291)), level(0.0)).xyzw;
            float _498 = _496.x;
            float _500 = _496.y;
            float _502 = _496.z;
            float _504 = _496.w;
            int _506 = _376 + 2;
            float _508 = precise::max(as_type<float>(_378), _488);
            float _510 = precise::max(as_type<float>(_380), _490);
            float _512 = precise::max(as_type<float>(_382), _492);
            float _514 = precise::max(as_type<float>(_384), _494);
            float _516 = precise::max(_508, _498);
            float _518 = precise::max(_510, _500);
            float _520 = precise::max(_512, _502);
            float _522 = precise::max(_514, _504);
            _398 = _506;
            _400 = 0;
            _402 = as_type<int>(_516);
            _404 = as_type<int>(_518);
            _406 = as_type<int>(_520);
            _408 = as_type<int>(_522);
        }
        int _524 = _398;
        int _526 = _400;
        int _528 = _402;
        int _530 = _404;
        int _532 = _406;
        int _534 = _408;
        bool _536 = _524 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
        int _538 = (_536 ? (-1) : 0) | _526;
        int _540 = ~_538;
        _104 = _528;
        _106 = _530;
        _108 = _532;
        _110 = _534;
        if (!(_540 != 0))
        {
            int _542 = _524 << 4;
            uint _544 = uint(int(uint(_542) >> uint(2)));
            uint _546 = uint(int(uint(int(_544)) >> uint(2)));
            int _548 = int(_544) & 3;
            float _550 = (*spvDescriptorSet0.fp_c3)._m0[int(_546)][_548];
            int _552 = int(_544) + 1;
            uint _554 = uint(int(uint(_552) >> uint(2)));
            int _556 = _552 & 3;
            float _558 = (*spvDescriptorSet0.fp_c3)._m0[int(_554)][_556];
            float _560 = _124 * _558;
            float _562 = fma(_126, _550, _560);
            float _564 = abs(_562);
            float _566 = -_564;
            float _568 = _566 + 1.0;
            float _570 = _112 * _568;
            float _572 = _570 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
            float _574 = _570 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
            float _576 = fma(_572, _550, _57);
            float _578 = fma(_574, _558, _59);
            float2 _1434 = float2(_576, _578);
            float4 _580 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1434, float2(0.0), isnan(_1434)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1434, float2(0.0), isnan(_1434)), level(0.0)).xyzw;
            float _582 = _580.x;
            float _584 = _580.y;
            float _586 = _580.z;
            float _588 = _580.w;
            float _590 = precise::max(as_type<float>(_528), _582);
            float _592 = precise::max(as_type<float>(_530), _584);
            float _594 = precise::max(as_type<float>(_532), _586);
            float _596 = precise::max(as_type<float>(_534), _588);
            _104 = as_type<int>(_590);
            _106 = as_type<int>(_592);
            _108 = as_type<int>(_594);
            _110 = as_type<int>(_596);
        }
    }
    int _598 = _104;
    int _600 = _106;
    int _602 = _108;
    int _604 = _110;
    out.m_34.x = as_type<float>(_598);
    out.m_34.y = as_type<float>(_600);
    out.m_34.z = as_type<float>(_602);
    out.m_34.w = as_type<float>(_604);
    return main0_out_u{as_type<uint4>(out.m_34)};
}

