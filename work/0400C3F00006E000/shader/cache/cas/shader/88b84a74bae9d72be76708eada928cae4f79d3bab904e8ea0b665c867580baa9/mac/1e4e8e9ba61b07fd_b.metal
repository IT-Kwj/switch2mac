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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_37 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _47;
    float _75 = _73 * _53;
    float _77 = _73 * _59;
    float _79 = _73 * _65;
    float _81 = _73 * _71;
    float2 _590 = float2(_75, _77);
    float4 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_590, float2(0.0), isnan(_590))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_590, float2(0.0), isnan(_590))).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float2 _609 = float2(_79, _81);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_609, float2(0.0), isnan(_609))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float _104 = in.m_37.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_37.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _118 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _120 = _73 * _108;
    float _122 = _73 * _114;
    bool _126 = _120 >= 0.5;
    bool _128 = isnan(_120);
    bool _130 = _126 || _128;
    bool _132 = isnan(0.5);
    bool _134 = _130 || _132;
    float _136 = fma(_122, 2.0, -1.0);
    bool _138 = _122 >= 0.5;
    bool _140 = isnan(_122);
    bool _142 = _138 || _140;
    bool _144 = isnan(0.5);
    bool _146 = _142 || _144;
    float _148 = float(_146);
    float _150 = fma(_120, 2.0, -1.0);
    bool _152 = !_134;
    float _154 = _152 ? 0.0 : 2.0;
    int _157 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _159 = _157 != 0;
    float _161 = _148 + _154;
    float _163 = trunc(_161);
    int _165 = int(_163);
    int _167 = _165 << 4;
    int _169 = _167 + 16;
    int _171 = _169 + 4;
    uint _174 = uint(int(uint(_171) >> uint(2)));
    uint _176 = uint(int(uint(int(_174)) >> uint(2)));
    int _178 = int(_174) & 3;
    float _180 = (*spvDescriptorSet0.fp_c4)._m0[int(_176)][_178];
    int _182 = _169 + 8;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    uint _186 = uint(int(uint(int(_184)) >> uint(2)));
    int _188 = int(_184) & 3;
    float _190 = (*spvDescriptorSet0.fp_c4)._m0[int(_186)][_188];
    int _192 = int(_184) + 1;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    int _196 = _192 & 3;
    float _198 = (*spvDescriptorSet0.fp_c4)._m0[int(_194)][_196];
    float _200 = precise::max(0.0, _180);
    bool _202 = _200 >= 0.00999999977648258209228515625;
    bool _204 = isnan(_200);
    bool _206 = _202 || _204;
    bool _208 = isnan(0.00999999977648258209228515625);
    bool _210 = _206 || _208;
    float _212 = abs(_136);
    float _214 = -_190;
    float _216 = _212 + _214;
    float _218 = abs(_150);
    float _220 = -_198;
    float _222 = _218 + _220;
    float _224 = _216 * _116;
    float _226 = _222 * _118;
    float _228 = _88 * _98;
    float _230 = _86 * _96;
    float _232 = precise::max(_92, _102);
    float _234 = _90 * _100;
    float _236 = _232;
    float _238 = _230;
    if (_159)
    {
        float _240 = precise::min(_92, _102);
        _236 = _240;
    }
    float _242 = _236;
    float _244 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _246 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _248 = precise::max(_224, _226);
    float _250 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _252 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, _242, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _254 = _248;
    if (!_210)
    {
        bool _256 = _248 <= 0.0;
        float _258 = float(_256);
        _238 = _258;
    }
    float _260 = _238;
    bool _262 = !_210;
    float _264 = _260;
    if (!_262)
    {
        bool _266 = _224 > 0.001000000047497451305389404296875;
        bool _268 = isnan(_224);
        bool _270 = _266 || _268;
        bool _272 = isnan(0.001000000047497451305389404296875);
        bool _274 = _270 || _272;
        bool _276 = _226 <= 0.001000000047497451305389404296875;
        bool _278 = !_274;
        bool _280 = _276 || _278;
        float _282 = _260;
        if (_280)
        {
            float _284 = 1.0 / _200;
            _282 = _284;
        }
        float _286 = _282;
        if (_280)
        {
            float _288 = abs(_248);
            float _290 = _248 * _288;
            _254 = _290;
        }
        float _292 = _254;
        float _294 = _286;
        if (_280)
        {
            float _296 = -_292;
            float _298 = fma(_296, _286, _200);
            float _300 = precise::clamp(_298, 0.0, 1.0);
            _294 = _300;
        }
        float _302 = _294;
        _264 = _302;
        if (!_280)
        {
            uint _304 = uint(int(uint(_169) >> uint(2)));
            uint _306 = uint(int(uint(int(_304)) >> uint(2)));
            int _308 = int(_304) & 3;
            float _310 = (*spvDescriptorSet0.fp_c4)._m0[int(_306)][_308];
            bool _312 = _224 > _226;
            bool _314 = isnan(_224);
            bool _316 = _312 || _314;
            bool _318 = isnan(_226);
            bool _320 = _316 || _318;
            bool _322 = _310 < 1.0;
            bool _324 = !_320;
            bool _326 = _322 != _324;
            float _328 = _310 + (-1.0);
            float _330 = 1.0 / _310;
            float _332 = _326 ? _226 : _224;
            float _334 = _326 ? _224 : _226;
            float _336 = abs(_332);
            float _338 = log2(_336);
            float _340 = abs(_334);
            float _342 = log2(_340);
            float _344 = _328 * _338;
            float _346 = exp2(_344);
            float _348 = _328 * _342;
            float _350 = exp2(_348);
            float _352 = _332 * _346;
            float _354 = 1.0 / _346;
            float _356 = fma(_334, _350, _352);
            float _358 = abs(_356);
            float _360 = log2(_358);
            float _362 = _350 * _354;
            float _364 = _360 * _330;
            float _366 = -_364;
            float _368 = exp2(_366);
            float _370 = _200 * _368;
            float _372 = _350 + _346;
            float _374 = -_332;
            float _376 = fma(_332, _370, _374);
            float _378 = -_334;
            float _380 = fma(_334, _370, _378);
            float _382 = _372 * 0.5;
            float _384 = _346 * _376;
            float _386 = fma(_350, _380, _384);
            float _388 = _346 * 0.5;
            float _390 = abs(_386);
            bool _392 = _382 > _390;
            bool _394 = isnan(_382);
            bool _396 = _392 || _394;
            bool _398 = isnan(_390);
            bool _400 = _396 || _398;
            float _402 = fma(_350, -0.5, _388);
            bool _404 = _386 >= 0.0;
            float _406 = _388;
            float _408 = _372;
            float _410 = _360;
            float _412 = _382;
            float _414 = _362;
            float _416 = _386;
            if (!_400)
            {
                _406 = 1.0;
            }
            float _418 = _406;
            bool _420 = !_400;
            float _422 = _418;
            if (!_420)
            {
                float _424 = abs(_386);
                bool _426 = _424 >= _402;
                bool _428 = isnan(_424);
                bool _430 = _426 || _428;
                bool _432 = isnan(_402);
                bool _434 = _430 || _432;
                if (_434)
                {
                    float _436 = -_382;
                    float _438 = _436 + _402;
                    _408 = _438;
                }
                float _440 = _408;
                float _442 = _418;
                if (!_434)
                {
                    float _444 = 1.0 / _402;
                    _442 = _444;
                }
                float _446 = _442;
                if (!_434)
                {
                    float _448 = -_362;
                    float _450 = _448 + 1.0;
                    _410 = _450;
                }
                float _452 = _410;
                float _454 = _452;
                if (_434)
                {
                    float _456 = abs(_386);
                    float _458 = -_382;
                    float _460 = _456 + _458;
                    _412 = _460;
                }
                float _462 = _412;
                float _464 = _462;
                if (_434)
                {
                    float _466 = _362 * 0.5;
                    _414 = _466;
                }
                float _468 = _414;
                if (!_434)
                {
                    float _470 = abs(_386);
                    float _472 = _470 * _452;
                    _454 = _472;
                }
                float _474 = _454;
                float _476 = _474;
                if (!_434)
                {
                    _416 = 0.5;
                }
                float _478 = _416;
                float _480 = _440;
                if (_434)
                {
                    float _482 = 1.0 / _440;
                    _480 = _482;
                }
                float _484 = _480;
                float _486 = _446;
                if (!_434)
                {
                    float _488 = _474 * _446;
                    _476 = _488;
                }
                float _490 = _476;
                if (!_434)
                {
                    float _492 = fma(_490, _478, 0.5);
                    _486 = _492;
                }
                float _494 = _486;
                _422 = _494;
                if (_434)
                {
                    float _496 = _462 * _484;
                    _464 = _496;
                }
                float _498 = _464;
                float _500 = _498;
                if (_434)
                {
                    float _502 = _498 * _498;
                    _500 = _502;
                }
                float _504 = _500;
                if (_434)
                {
                    float _506 = -_468;
                    float _508 = fma(_506, _504, 1.0);
                    _422 = _508;
                }
            }
            float _510 = _422;
            _264 = _510;
            if (!_404)
            {
                float _512 = -_510;
                float _514 = _512 + 1.0;
                _264 = _514;
            }
        }
    }
    float _516 = _264;
    float _518 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _520 = 1.0 + _518;
    float _522 = _520 * _516;
    float _524 = _252 * _522;
    float _526 = precise::clamp(_524, 0.0, 1.0);
    bool _528 = _526 != 0.0;
    bool _530 = isnan(_526);
    bool _532 = _528 || _530;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    if (_536)
    {
        out.m_40.x = _244;
        out.m_40.y = _246;
        out.m_40.z = _250;
        out.m_40.w = _526;
        return out;
    }
    discard_fragment();
    return out;
}

