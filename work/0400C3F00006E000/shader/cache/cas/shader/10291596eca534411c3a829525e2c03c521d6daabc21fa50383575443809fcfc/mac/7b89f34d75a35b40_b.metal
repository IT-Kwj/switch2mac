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
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_37 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _49;
    float _77 = _75 * _55;
    float _79 = _75 * _61;
    float _81 = _75 * _67;
    float _83 = _75 * _73;
    float2 _632 = float2(_77, _79);
    float4 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_632, float2(0.0), isnan(_632))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_632, float2(0.0), isnan(_632))).xyzw;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float _94 = _86.w;
    float2 _651 = float2(_81, _83);
    float4 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_651, float2(0.0), isnan(_651))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_651, float2(0.0), isnan(_651))).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float _106 = in.m_37.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_37.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_39.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_39.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_39.w;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _144 = _75 * _110;
    float _146 = _75 * _116;
    bool _150 = _144 >= 0.5;
    bool _152 = isnan(_144);
    bool _154 = _150 || _152;
    bool _156 = isnan(0.5);
    bool _158 = _154 || _156;
    float _160 = fma(_146, 2.0, -1.0);
    bool _162 = _146 >= 0.5;
    bool _164 = isnan(_146);
    bool _166 = _162 || _164;
    bool _168 = isnan(0.5);
    bool _170 = _166 || _168;
    float _172 = float(_170);
    float _174 = _75 * _134;
    bool _176 = !_158;
    float _178 = _176 ? 0.0 : 2.0;
    int _181 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _183 = _181 != 0;
    float _185 = fma(_144, 2.0, -1.0);
    float _187 = _75 * _122;
    float _189 = _172 + _178;
    float _191 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _193 = trunc(_189);
    int _195 = int(_193);
    float _197 = _75 * _140;
    int _199 = _195 << 4;
    int _201 = _199 + 16;
    int _203 = _201 + 4;
    uint _206 = uint(int(uint(_203) >> uint(2)));
    uint _208 = uint(int(uint(int(_206)) >> uint(2)));
    int _210 = int(_206) & 3;
    float _212 = (*spvDescriptorSet0.fp_c4)._m0[int(_208)][_210];
    int _214 = _201 + 8;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    uint _218 = uint(int(uint(int(_216)) >> uint(2)));
    int _220 = int(_216) & 3;
    float _222 = (*spvDescriptorSet0.fp_c4)._m0[int(_218)][_220];
    int _224 = int(_216) + 1;
    uint _226 = uint(int(uint(_224) >> uint(2)));
    int _228 = _224 & 3;
    float _230 = (*spvDescriptorSet0.fp_c4)._m0[int(_226)][_228];
    float _232 = abs(_185);
    float _234 = -_230;
    float _236 = _232 + _234;
    float _238 = abs(_160);
    float _240 = -_222;
    float _242 = _238 + _240;
    float _244 = _75 * _128;
    float _246 = _236 * _191;
    float _248 = _242 * _142;
    float _250 = _88 * _98;
    float _252 = precise::max(0.0, _212);
    float _254 = _92 * _102;
    float _256 = precise::max(_94, _104);
    float _258 = _90 * _100;
    float _260 = _256;
    float _262 = _258;
    if (_183)
    {
        float _264 = precise::min(_94, _104);
        _260 = _264;
    }
    float _266 = _260;
    bool _268 = _252 >= 0.00999999977648258209228515625;
    bool _270 = isnan(_252);
    bool _272 = _268 || _270;
    bool _274 = isnan(0.00999999977648258209228515625);
    bool _276 = _272 || _274;
    float _278 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, _266, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _280 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _282 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _284 = _280 * _187;
    float _286 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _288 = precise::max(_248, _246);
    float _290 = _282 * _174;
    float _292 = _278 * _197;
    float _294 = _286 * _244;
    if (!_276)
    {
        bool _296 = _288 <= 0.0;
        float _298 = float(_296);
        _262 = _298;
    }
    float _300 = _262;
    bool _302 = !_276;
    float _304 = _300;
    float _306 = _300;
    if (!_302)
    {
        bool _308 = _248 > 0.001000000047497451305389404296875;
        bool _310 = isnan(_248);
        bool _312 = _308 || _310;
        bool _314 = isnan(0.001000000047497451305389404296875);
        bool _316 = _312 || _314;
        bool _318 = _246 <= 0.001000000047497451305389404296875;
        bool _320 = !_316;
        bool _322 = _318 || _320;
        float _324 = _100;
        if (_322)
        {
            float _326 = 1.0 / _252;
            _324 = _326;
        }
        float _328 = _324;
        if (_322)
        {
            float _330 = abs(_288);
            float _332 = _288 * _330;
            _304 = _332;
        }
        float _334 = _304;
        float _336 = _334;
        if (_322)
        {
            float _338 = -_334;
            float _340 = fma(_338, _328, _252);
            float _342 = precise::clamp(_340, 0.0, 1.0);
            _336 = _342;
        }
        float _344 = _336;
        _306 = _344;
        if (!_322)
        {
            uint _346 = uint(int(uint(_201) >> uint(2)));
            uint _348 = uint(int(uint(int(_346)) >> uint(2)));
            int _350 = int(_346) & 3;
            float _352 = (*spvDescriptorSet0.fp_c4)._m0[int(_348)][_350];
            bool _354 = _248 > _246;
            bool _356 = isnan(_248);
            bool _358 = _354 || _356;
            bool _360 = isnan(_246);
            bool _362 = _358 || _360;
            bool _364 = _352 < 1.0;
            bool _366 = !_362;
            bool _368 = _364 != _366;
            float _370 = _352 + (-1.0);
            float _372 = 1.0 / _352;
            float _374 = _368 ? _246 : _248;
            float _376 = _368 ? _248 : _246;
            float _378 = abs(_374);
            float _380 = log2(_378);
            float _382 = abs(_376);
            float _384 = log2(_382);
            float _386 = _370 * _380;
            float _388 = exp2(_386);
            float _390 = _370 * _384;
            float _392 = exp2(_390);
            float _394 = _374 * _388;
            float _396 = 1.0 / _388;
            float _398 = fma(_376, _392, _394);
            float _400 = abs(_398);
            float _402 = log2(_400);
            float _404 = _402 * _372;
            float _406 = -_404;
            float _408 = exp2(_406);
            float _410 = _252 * _408;
            float _412 = _392 + _388;
            float _414 = -_374;
            float _416 = fma(_374, _410, _414);
            float _418 = -_376;
            float _420 = fma(_376, _410, _418);
            float _422 = _412 * 0.5;
            float _424 = _392 * _396;
            float _426 = _388 * _416;
            float _428 = fma(_392, _420, _426);
            float _430 = _388 * 0.5;
            float _432 = abs(_428);
            bool _434 = _422 > _432;
            bool _436 = isnan(_422);
            bool _438 = _434 || _436;
            bool _440 = isnan(_432);
            bool _442 = _438 || _440;
            float _444 = fma(_392, -0.5, _430);
            bool _446 = _428 >= 0.0;
            float _448 = _430;
            float _450 = _396;
            float _452 = _402;
            float _454 = _422;
            float _456 = _424;
            float _458 = _428;
            if (!_442)
            {
                _448 = 1.0;
            }
            float _460 = _448;
            bool _462 = !_442;
            float _464 = _460;
            if (!_462)
            {
                float _466 = abs(_428);
                bool _468 = _466 >= _444;
                bool _470 = isnan(_466);
                bool _472 = _468 || _470;
                bool _474 = isnan(_444);
                bool _476 = _472 || _474;
                if (_476)
                {
                    float _478 = -_422;
                    float _480 = _478 + _444;
                    _450 = _480;
                }
                float _482 = _450;
                float _484 = _460;
                if (!_476)
                {
                    float _486 = 1.0 / _444;
                    _484 = _486;
                }
                float _488 = _484;
                if (!_476)
                {
                    float _490 = -_424;
                    float _492 = _490 + 1.0;
                    _452 = _492;
                }
                float _494 = _452;
                float _496 = _494;
                if (_476)
                {
                    float _498 = abs(_428);
                    float _500 = -_422;
                    float _502 = _498 + _500;
                    _454 = _502;
                }
                float _504 = _454;
                float _506 = _504;
                if (_476)
                {
                    float _508 = _424 * 0.5;
                    _456 = _508;
                }
                float _510 = _456;
                if (!_476)
                {
                    float _512 = abs(_428);
                    float _514 = _512 * _494;
                    _496 = _514;
                }
                float _516 = _496;
                float _518 = _516;
                if (!_476)
                {
                    _458 = 0.5;
                }
                float _520 = _458;
                float _522 = _482;
                float _524 = _520;
                if (_476)
                {
                    float _526 = 1.0 / _482;
                    _522 = _526;
                }
                float _528 = _522;
                float _530 = _488;
                if (!_476)
                {
                    float _532 = _516 * _488;
                    _518 = _532;
                }
                float _534 = _518;
                if (!_476)
                {
                    float _536 = fma(_534, _520, 0.5);
                    _530 = _536;
                }
                float _538 = _530;
                _464 = _538;
                if (_476)
                {
                    float _540 = _504 * _528;
                    _506 = _540;
                }
                float _542 = _506;
                if (_476)
                {
                    float _544 = _542 * _542;
                    _524 = _544;
                }
                float _546 = _524;
                if (_476)
                {
                    float _548 = -_510;
                    float _550 = fma(_548, _546, 1.0);
                    _464 = _550;
                }
            }
            float _552 = _464;
            _306 = _552;
            if (!_446)
            {
                float _554 = -_552;
                float _556 = _554 + 1.0;
                _306 = _556;
            }
        }
    }
    float _558 = _306;
    float _560 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _562 = 1.0 + _560;
    float _564 = _562 * _558;
    float _566 = _292 * _564;
    float _568 = precise::clamp(_566, 0.0, 1.0);
    bool _570 = _568 != 0.0;
    bool _572 = isnan(_568);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    if (_578)
    {
        out.m_42.x = _284;
        out.m_42.y = _294;
        out.m_42.z = _290;
        out.m_42.w = _568;
        return out;
    }
    discard_fragment();
    return out;
}

