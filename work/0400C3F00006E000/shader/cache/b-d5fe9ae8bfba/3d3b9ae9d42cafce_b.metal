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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _564 = float2(_61, _63);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_564, float2(0.0), isnan(_564))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = in.m_33.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_33.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_35.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_35.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_35.z;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_35.w;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _114 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _116 = _59 * _80;
    float _118 = _59 * _86;
    bool _122 = _116 >= 0.5;
    bool _124 = isnan(_116);
    bool _126 = _122 || _124;
    bool _128 = isnan(0.5);
    bool _130 = _126 || _128;
    float _132 = fma(_118, 2.0, -1.0);
    bool _134 = _118 >= 0.5;
    bool _136 = isnan(_118);
    bool _138 = _134 || _136;
    bool _140 = isnan(0.5);
    bool _142 = _138 || _140;
    float _144 = float(_142);
    float _146 = fma(_116, 2.0, -1.0);
    bool _148 = !_130;
    float _150 = _148 ? 0.0 : 2.0;
    float _152 = _59 * _98;
    float _154 = _144 + _150;
    float _156 = trunc(_154);
    int _159 = int(_156);
    float _161 = _59 * _92;
    int _163 = _159 << 4;
    int _165 = _163 + 16;
    int _167 = _165 + 8;
    uint _170 = uint(int(uint(_167) >> uint(2)));
    uint _172 = uint(int(uint(int(_170)) >> uint(2)));
    int _174 = int(_170) & 3;
    float _176 = (*spvDescriptorSet0.fp_c4)._m0[int(_172)][_174];
    int _178 = int(_170) + 1;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    int _182 = _178 & 3;
    float _184 = (*spvDescriptorSet0.fp_c4)._m0[int(_180)][_182];
    int _186 = _165 + 4;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    uint _190 = uint(int(uint(int(_188)) >> uint(2)));
    int _192 = int(_188) & 3;
    float _194 = (*spvDescriptorSet0.fp_c4)._m0[int(_190)][_192];
    float _196 = abs(_146);
    float _198 = -_184;
    float _200 = _196 + _198;
    float _202 = abs(_132);
    float _204 = -_176;
    float _206 = _202 + _204;
    float _208 = _59 * _104;
    float _210 = _59 * _110;
    float _212 = precise::max(0.0, _194);
    float _214 = _206 * _112;
    float _216 = _200 * _114;
    bool _218 = _212 >= 0.00999999977648258209228515625;
    bool _220 = isnan(_212);
    bool _222 = _218 || _220;
    bool _224 = isnan(0.00999999977648258209228515625);
    bool _226 = _222 || _224;
    float _228 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _230 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _232 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _234 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _236 = _228 * _161;
    float _238 = precise::max(_214, _216);
    float _240 = _230 * _152;
    float _242 = _232 * _208;
    float _244 = _234 * _210;
    float _246 = _232;
    float _248 = _238;
    if (!_226)
    {
        bool _250 = _238 <= 0.0;
        float _252 = float(_250);
        _246 = _252;
    }
    float _254 = _246;
    bool _256 = !_226;
    float _258 = _254;
    if (!_256)
    {
        bool _260 = _214 > 0.001000000047497451305389404296875;
        bool _262 = isnan(_214);
        bool _264 = _260 || _262;
        bool _266 = isnan(0.001000000047497451305389404296875);
        bool _268 = _264 || _266;
        bool _270 = _216 <= 0.001000000047497451305389404296875;
        bool _272 = !_268;
        bool _274 = _270 || _272;
        float _276 = _254;
        if (_274)
        {
            float _278 = 1.0 / _212;
            _276 = _278;
        }
        float _280 = _276;
        if (_274)
        {
            float _282 = abs(_238);
            float _284 = _238 * _282;
            _248 = _284;
        }
        float _286 = _248;
        float _288 = _280;
        if (_274)
        {
            float _290 = -_286;
            float _292 = fma(_290, _280, _212);
            float _294 = precise::clamp(_292, 0.0, 1.0);
            _288 = _294;
        }
        float _296 = _288;
        _258 = _296;
        if (!_274)
        {
            uint _298 = uint(int(uint(_165) >> uint(2)));
            uint _300 = uint(int(uint(int(_298)) >> uint(2)));
            int _302 = int(_298) & 3;
            float _304 = (*spvDescriptorSet0.fp_c4)._m0[int(_300)][_302];
            bool _306 = _214 > _216;
            bool _308 = isnan(_214);
            bool _310 = _306 || _308;
            bool _312 = isnan(_216);
            bool _314 = _310 || _312;
            bool _316 = _304 < 1.0;
            bool _318 = !_314;
            bool _320 = _316 != _318;
            float _322 = _304 + (-1.0);
            float _324 = 1.0 / _304;
            float _326 = _320 ? _216 : _214;
            float _328 = _320 ? _214 : _216;
            float _330 = abs(_326);
            float _332 = log2(_330);
            float _334 = abs(_328);
            float _336 = log2(_334);
            float _338 = _322 * _332;
            float _340 = exp2(_338);
            float _342 = _322 * _336;
            float _344 = exp2(_342);
            float _346 = _326 * _340;
            float _348 = 1.0 / _340;
            float _350 = fma(_328, _344, _346);
            float _352 = abs(_350);
            float _354 = log2(_352);
            float _356 = _354 * _324;
            float _358 = -_356;
            float _360 = exp2(_358);
            float _362 = _212 * _360;
            float _364 = -_326;
            float _366 = fma(_326, _362, _364);
            float _368 = _344 + _340;
            float _370 = -_328;
            float _372 = fma(_328, _362, _370);
            float _374 = _340 * _366;
            float _376 = _368 * 0.5;
            float _378 = _340 * 0.5;
            float _380 = fma(_344, _372, _374);
            float _382 = _344 * _348;
            float _384 = fma(_344, -0.5, _378);
            float _386 = abs(_380);
            bool _388 = _376 > _386;
            bool _390 = isnan(_376);
            bool _392 = _388 || _390;
            bool _394 = isnan(_386);
            bool _396 = _392 || _394;
            bool _398 = _380 >= 0.0;
            float _400 = _378;
            float _402 = _348;
            float _404 = _354;
            float _406 = _376;
            float _408 = _340;
            float _410 = _382;
            if (!_396)
            {
                _400 = 1.0;
            }
            float _412 = _400;
            bool _414 = !_396;
            float _416 = _412;
            if (!_414)
            {
                float _418 = abs(_380);
                bool _420 = _418 >= _384;
                bool _422 = isnan(_418);
                bool _424 = _420 || _422;
                bool _426 = isnan(_384);
                bool _428 = _424 || _426;
                if (_428)
                {
                    float _430 = -_376;
                    float _432 = _430 + _384;
                    _402 = _432;
                }
                float _434 = _402;
                float _436 = _412;
                if (!_428)
                {
                    float _438 = 1.0 / _384;
                    _436 = _438;
                }
                float _440 = _436;
                if (!_428)
                {
                    float _442 = -_382;
                    float _444 = _442 + 1.0;
                    _404 = _444;
                }
                float _446 = _404;
                float _448 = _446;
                if (_428)
                {
                    float _450 = abs(_380);
                    float _452 = -_376;
                    float _454 = _450 + _452;
                    _406 = _454;
                }
                float _456 = _406;
                float _458 = _456;
                if (!_428)
                {
                    _408 = 0.5;
                }
                float _460 = _408;
                if (_428)
                {
                    float _462 = _382 * 0.5;
                    _410 = _462;
                }
                float _464 = _410;
                if (!_428)
                {
                    float _466 = abs(_380);
                    float _468 = _466 * _446;
                    _448 = _468;
                }
                float _470 = _448;
                float _472 = _434;
                float _474 = _470;
                if (_428)
                {
                    float _476 = 1.0 / _434;
                    _472 = _476;
                }
                float _478 = _472;
                float _480 = _440;
                if (!_428)
                {
                    float _482 = _470 * _440;
                    _474 = _482;
                }
                float _484 = _474;
                if (!_428)
                {
                    float _486 = fma(_484, _460, 0.5);
                    _480 = _486;
                }
                float _488 = _480;
                _416 = _488;
                if (_428)
                {
                    float _490 = _456 * _478;
                    _458 = _490;
                }
                float _492 = _458;
                float _494 = _492;
                if (_428)
                {
                    float _496 = _492 * _492;
                    _494 = _496;
                }
                float _498 = _494;
                if (_428)
                {
                    float _500 = -_464;
                    float _502 = fma(_500, _498, 1.0);
                    _416 = _502;
                }
            }
            float _504 = _416;
            _258 = _504;
            if (!_398)
            {
                float _506 = -_504;
                float _508 = _506 + 1.0;
                _258 = _508;
            }
        }
    }
    float _510 = _258;
    float _512 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _514 = 1.0 + _512;
    float _516 = _514 * _510;
    float _518 = _244 * _516;
    float _520 = precise::clamp(_518, 0.0, 1.0);
    bool _522 = _520 != 0.0;
    bool _524 = isnan(_520);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    if (_530)
    {
        out.m_38.x = _236;
        out.m_38.y = _240;
        out.m_38.z = _242;
        out.m_38.w = _520;
        return out;
    }
    discard_fragment();
    return out;
}

