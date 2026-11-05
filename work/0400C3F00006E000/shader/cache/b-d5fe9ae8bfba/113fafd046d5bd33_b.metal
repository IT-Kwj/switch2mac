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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_41 [[user(locn2), flat]];
    float4 m_60 [[user(locn3), flat]];
    float4 m_58 [[user(locn5), flat]];
    float4 m_56 [[user(locn6)]];
    float4 m_64 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
    float4 m_62 [[user(locn9)]];
    float4 m_39 [[user(locn10)]];
    float4 m_51 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_39.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.y;
    float _87 = 1.0 / _71;
    float _89 = _87 * _77;
    float _91 = _87 * _83;
    float _93 = _89 + (-0.5);
    float _95 = _91 + (-0.5);
    float _97 = abs(_93);
    float _99 = abs(_95);
    float _101 = precise::max(_97, _99);
    bool _105 = _101 >= 16.0;
    float _107 = _93;
    float _109 = _95;
    if (_105)
    {
        float _111 = fma(_89, 0.0625, -0.03125);
        _107 = _111;
    }
    float _113 = _107;
    if (_105)
    {
        float _115 = fma(_91, 0.0625, -0.03125);
        _109 = _115;
    }
    float _117 = _109;
    float _119 = -_91;
    float _121 = _119 + 0.5;
    float _123 = -_89;
    float _125 = _123 + 0.5;
    float _127 = abs(_113);
    bool _129 = _127 != 0.0;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan(0.0);
    bool _137 = _133 || _135;
    float _139 = _121 * _121;
    float _141 = abs(_117);
    bool _143 = _141 == 0.0;
    float _145 = abs(_117);
    bool _147 = _145 == 0.0;
    bool _149 = !_137;
    bool _151 = _147 && _149;
    float _153 = fma(_125, _125, _139);
    float _155 = sqrt(_153);
    bool _157 = false;
    int _160 = as_type<int>(_139);
    if (_151)
    {
        bool _162 = as_type<int>(_117) >= 0;
        _157 = _162;
    }
    bool _164 = _157;
    int _166 = _164 ? (-1) : 0;
    if (_151)
    {
        int _168 = _164 ? 0 : 1078530011;
        _160 = _168;
    }
    int _170 = _160;
    int _172 = _170;
    if (_151)
    {
        int _174 = int(0x80000000) & as_type<int>(_113);
        int _176 = _170 | _174;
        _172 = _176;
    }
    int _178 = _172;
    bool _180 = !_137;
    bool _182 = _180 && _143;
    int _184 = _178;
    float _186 = as_type<float>(_178);
    if (!_182)
    {
        float _188 = abs(_113);
        bool _190 = _188 != as_type<float>(0x7f800000u /* inf */);
        bool _192 = isnan(_188);
        bool _194 = _190 || _192;
        bool _196 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _198 = _194 || _196;
        float _200 = abs(_117);
        bool _202 = _200 == as_type<float>(0x7f800000u /* inf */);
        float _204 = abs(_117);
        bool _206 = _204 == as_type<float>(0x7f800000u /* inf */);
        bool _208 = !_198;
        bool _210 = _206 && _208;
        if (_210)
        {
            bool _212 = as_type<int>(_117) >= 0;
            _166 = _212 ? (-1) : 0;
        }
        int _214 = _166;
        if (_210)
        {
            _184 = 1075235812;
        }
        int _216 = _184;
        int _218 = _216;
        if (_210)
        {
            int _220 = ~_214;
            int _222 = (_220 != 0) ? _216 : 1061752795;
            _218 = _222;
        }
        int _224 = _218;
        float _226 = as_type<float>(_224);
        if (_210)
        {
            int _228 = int(0x80000000) & as_type<int>(_113);
            int _230 = _224 | _228;
            _226 = as_type<float>(_230);
        }
        float _232 = _226;
        bool _234 = !_198;
        bool _236 = _234 && _202;
        _186 = _232;
        if (!_236)
        {
            float _238 = abs(_113);
            float _240 = abs(_117);
            float _242 = precise::max(_238, _240);
            float _244 = abs(_113);
            float _246 = abs(_117);
            float _248 = precise::min(_244, _246);
            float _250 = 1.0 / _242;
            float _252 = abs(_113);
            float _254 = abs(_117);
            bool _256 = _252 > _254;
            bool _258 = as_type<int>(_117) >= 0;
            float _260 = _248 * _250;
            float _262 = _260 * _260;
            float _264 = _262 + 11.33538818359375;
            float _266 = fma(_262, _264, 28.84246826171875);
            float _268 = fma(_262, _266, 19.6966705322265625);
            float _270 = fma(_262, -0.82336294651031494140625, -5.674867153167724609375);
            float _272 = fma(_262, _270, -6.565555095672607421875);
            float _274 = 1.0 / _268;
            float _276 = _262 * _272;
            float _278 = abs(_113);
            float _280 = abs(_117);
            float _282 = _278 + _280;
            int _284 = as_type<int>(_113) & int(0x80000000);
            float _286 = _260 * _276;
            bool _288 = _282 > as_type<float>(0x7f800000u /* inf */);
            bool _290 = isnan(_282);
            bool _292 = _288 || _290;
            bool _294 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _296 = _292 || _294;
            float _298 = fma(_286, _274, _260);
            float _300 = _298;
            _186 = _282;
            if (_256)
            {
                float _302 = -_298;
                float _304 = _302 + 1.57079637050628662109375;
                _300 = _304;
            }
            float _306 = _300;
            int _308 = as_type<int>(_306);
            if (!_258)
            {
                float _310 = -_306;
                float _312 = _310 + 3.1415927410125732421875;
                _308 = as_type<int>(_312);
            }
            int _314 = _308;
            if (!_296)
            {
                int _316 = _284 | _314;
                _186 = as_type<float>(_316);
            }
        }
    }
    float _318 = _186;
    float _320 = _85 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _322 = fma(_318, 0.15915493667125701904296875, 0.5);
    float _324 = fma(_155, (*spvDescriptorSet0.fp_c9)._m0[191].x, _320);
    float _326 = _322 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _328 = _326 + _324;
    float2 _1104 = float2(_326, _328);
    float _330 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1104, float2(0.0), isnan(_1104))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1104, float2(0.0), isnan(_1104))).w;
    float _332 = in.m_43.w;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_43.z;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = _87 * _336;
    float _346 = _87 * _342;
    float _348 = fma(_330, 0.0199999995529651641845703125, _344);
    float2 _1139;
    _1139.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_346, _348));
    _1139.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_346, _348));
    float _350 = _1139.x;
    float _352 = _350 * 256.0;
    int _354 = int(_352);
    float _356 = float(uint(_354));
    float _358 = _356 * 0.00390625;
    float _360 = precise::min(_358, 2.0);
    float2 _1158 = float2(_346, _348);
    float _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1158, float2(0.0), isnan(_1158)), level(_360)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1158, float2(0.0), isnan(_1158)), level(_360)).w;
    float _364 = in.m_45.w;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = in.m_47.w;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_49.x;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = precise::max(0.0, _155);
    float _384 = precise::min(_382, 0.5);
    float _386 = fma(_384, -2.0, 1.0);
    float _388 = _386 * _386;
    float _390 = _87 * _368;
    float _392 = _87 * _374;
    float _394 = in.m_51.y;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = _87 * _398;
    float _402 = _330 + _362;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = -_390;
    float _408 = fma(_404, _388, _406);
    float _410 = _392 * _408;
    float _412 = _87 * _380;
    float _414 = 0.0 + _410;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _416 * _412;
    bool _420 = _418 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _422 = isnan(_418);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _428 = _424 || _426;
    float _430 = in.m_51.w;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    if (!_428)
    {
        discard_fragment();
    }
    float _436 = in.m_51.x;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = _87 * _434;
    float _444 = 1.0 / _442;
    float _446 = _87 * _440;
    float _448 = _446 * _444;
    float _450 = _400 * _444;
    float2 _1286 = float2(_448, _450);
    float _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1286, float2(0.0), isnan(_1286))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1286, float2(0.0), isnan(_1286))).x;
    float _454 = in.m_47.x;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_47.y;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_45.x;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_47.z;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = in.m_45.y;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = in.m_45.z;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = _87 * _458;
    float _492 = _87 * _464;
    float _494 = _87 * _470;
    float _496 = _87 * _476;
    float _498 = _87 * _482;
    float _500 = _87 * _488;
    float _502 = -_490;
    float _504 = _502 + _494;
    float _506 = -_492;
    float _508 = _506 + _498;
    float _510 = -_496;
    float _512 = _510 + _500;
    float _514 = fma(_362, _504, _490);
    float _516 = fma(_362, _508, _492);
    float _518 = fma(_362, _512, _496);
    if (!_428)
    {
        out.m_54.x = _514;
        out.m_54.y = _516;
        out.m_54.z = _518;
        out.m_54.w = _410;
        return out;
    }
    float _520 = in.m_56.y;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = in.m_56.x;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = in.m_58.y;
    float _534 = in.m_58.x;
    float _536 = in.m_56.z;
    float _538 = gl_FragCoord.w;
    float _540 = _536 * _538;
    float _542 = in.m_51.z;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = in.m_58.z;
    float _550 = in.m_60.x;
    bool _552 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _554 = _87 * _524;
    float _556 = _87 * _530;
    float _558 = -_532;
    float _560 = _554 + _558;
    float _562 = -_534;
    float _564 = _556 + _562;
    float _566 = _87 * _540;
    float _568 = _550 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _570 = _560 * _560;
    float _572 = _87 * _546;
    float _574 = -_548;
    float _576 = _566 + _574;
    float _578 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _580 = fma(_452, (*spvDescriptorSet0.fp_c8)._m0[30].w, _578);
    float _582 = fma(_564, _564, _570);
    float _584 = _572 * _444;
    float _586 = in.m_62.w;
    float _588 = gl_FragCoord.w;
    float _590 = _586 * _588;
    float _592 = 1.0 / _580;
    float _594 = fma(_576, _576, _582);
    float _596 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _598 = fma(_584, (*spvDescriptorSet0.fp_c8)._m0[30].w, _596);
    float _600 = in.m_64.w;
    float _602 = gl_FragCoord.w;
    float _604 = _600 * _602;
    float _606 = in.m_64.y;
    float _608 = gl_FragCoord.w;
    float _610 = _606 * _608;
    float _612 = -_594;
    float _614 = fma(_568, _568, _612);
    float _616 = _516 * 0.715200006961822509765625;
    float _618 = in.m_64.z;
    float _620 = gl_FragCoord.w;
    float _622 = _618 * _620;
    float _624 = 1.0 / _598;
    float _626 = precise::max(0.0, _614);
    float _628 = fma(_514, 0.2125999927520751953125, _616);
    float _630 = fma(_518, 0.072200000286102294921875, _628);
    float _632 = sqrt(_626);
    float _634 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _636 = _624 * _634;
    float _638 = 1.0 / _630;
    float _640 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _642 = -_636;
    float _644 = fma(_592, _640, _642);
    float _646 = _598;
    if (_552)
    {
        float _648 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _650 = _636 + _648;
        _646 = _650;
    }
    float _652 = _646;
    float _654 = _87 * _590;
    float _656 = _632 + _644;
    float _658 = in.m_64.x;
    float _660 = gl_FragCoord.w;
    float _662 = _658 * _660;
    float _664 = -_654;
    float _666 = _656 + _664;
    float _668 = _666 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _670 = _638 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _672 = precise::clamp(_670, 0.0, 1.0);
    float _674 = _668 * (-1.44269502162933349609375);
    float _676 = fma(_672, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _678 = _87 * _604;
    float _680 = exp2(_674);
    float _682 = _676 * _678;
    float _684 = _87 * _610;
    float _686 = fma(_516, _682, _684);
    float _688 = -_680;
    float _690 = _688 + 1.0;
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = _418 * _692;
    float _696 = precise::clamp(_694, 0.0, 1.0);
    float _698 = _692;
    float _700 = _696;
    if (_552)
    {
        float _702 = _652 * 8.0;
        float _704 = precise::clamp(_702, 0.0, 1.0);
        _698 = _704;
    }
    float _706 = _698;
    float _708 = _87 * _662;
    float _710 = _87 * _622;
    if (_552)
    {
        float _712 = _696 * _706;
        _700 = _712;
    }
    float _714 = _700;
    float _716 = fma(_514, _682, _708);
    float _718 = fma(_518, _682, _710);
    float _720 = 0.0 + _714;
    float _722 = precise::clamp(_720, 0.0, 1.0);
    out.m_54.x = _716;
    out.m_54.y = _686;
    out.m_54.z = _718;
    out.m_54.w = _722;
    return out;
}

