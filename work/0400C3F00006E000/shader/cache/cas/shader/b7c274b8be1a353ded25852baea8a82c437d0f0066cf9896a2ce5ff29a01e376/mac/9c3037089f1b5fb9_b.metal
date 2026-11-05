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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c11 [[id(2)]];
    constant _16* fp_c7 [[id(3)]];
    constant _16* fp_c9 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_43 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_39 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_37.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_37.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _53;
    float _81 = _79 * _59;
    float _83 = _79 * _65;
    float _85 = _79 * _71;
    float _87 = _79 * _77;
    float2 _733 = float2(_81, _83);
    float2 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_733, float2(0.0), isnan(_733))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_733, float2(0.0), isnan(_733))).xy;
    float _93 = _91.x;
    float _95 = _91.y;
    float2 _748 = float2(_85, _87);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_748, float2(0.0), isnan(_748))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_748, float2(0.0), isnan(_748))).x;
    float _99 = in.m_39.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_41.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_41.z;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = fma((*spvDescriptorSet0.fp_c11)._m0[40].x, (*spvDescriptorSet0.fp_c7)._m0[1].y, (*spvDescriptorSet0.fp_c7)._m0[1].w);
    float _119 = in.m_41.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = fma((*spvDescriptorSet0.fp_c11)._m0[40].x, (*spvDescriptorSet0.fp_c7)._m0[0].y, (*spvDescriptorSet0.fp_c7)._m0[0].w);
    float _127 = in.m_43.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = -_117;
    float _135 = _133 + (*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _137 = fma((*spvDescriptorSet0.fp_c11)._m0[40].x, (*spvDescriptorSet0.fp_c7)._m0[2].y, (*spvDescriptorSet0.fp_c7)._m0[2].w);
    float _139 = -_125;
    float _141 = _139 + (*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _143 = in.m_39.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _135 * _135;
    float _151 = -_137;
    float _153 = _151 + (*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _155 = in.m_43.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = fma(_141, _141, _149);
    float _163 = -(*spvDescriptorSet0.fp_c11)._m0[24].x;
    float _165 = _87 + _163;
    int _168 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    float _170 = fma(_153, _153, _161);
    float _172 = _165 * 6.283185482025146484375;
    float _174 = rsqrt(_170);
    float _176 = _172 * 0.15915493667125701904296875;
    float _178 = _79 * _109;
    float _180 = _176 * 6.283185482025146484375;
    float _182 = sin(_180);
    float _184 = _79 * _123;
    float _186 = _79 * _131;
    float _188 = _141 * _174;
    float _190 = _135 * _174;
    float _192 = _153 * _174;
    float _194 = _79 * _147;
    float _196 = in.m_43.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_39.z;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = _188 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _210 = _192 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _212 = _190 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _214 = _79 * _103;
    float _216 = -_208;
    float _218 = fma(_190, (*spvDescriptorSet0.fp_c4)._m0[1].x, _216);
    float _220 = -_210;
    float _222 = fma(_188, (*spvDescriptorSet0.fp_c4)._m0[1].z, _220);
    float _224 = -_212;
    float _226 = fma(_192, (*spvDescriptorSet0.fp_c4)._m0[1].y, _224);
    float _228 = -_117;
    float _230 = _194 + _228;
    float _232 = _188 * _218;
    float _234 = _192 * _222;
    float _236 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _238 = _194 + _236;
    float _240 = -_232;
    float _242 = fma(_192, _226, _240);
    float _244 = -_125;
    float _246 = _214 + _244;
    float _248 = -_234;
    float _250 = fma(_190, _218, _248);
    float _252 = _190 * _226;
    float _254 = _242 * _230;
    float _256 = _222 * _230;
    float _258 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _260 = _214 + _258;
    float _262 = -_252;
    float _264 = fma(_188, _222, _262);
    float _266 = (*spvDescriptorSet0.fp_c11)._m0[24].x * 0.15915493667125701904296875;
    float _268 = fma(_226, _246, _256);
    float _270 = (*spvDescriptorSet0.fp_c11)._m0[24].x * 6.283185482025146484375;
    float _272 = _79 * _115;
    float _274 = _178 * _178;
    float _276 = fma(_250, _246, _254);
    float _278 = _270 * (*spvDescriptorSet0.fp_c11)._m0[40].y;
    float _280 = _238 * _238;
    float _282 = fma(_184, _184, _274);
    float _284 = _79 * _159;
    float _286 = _79 * _200;
    float _288 = _278 * 0.15915493667125701904296875;
    float _290 = _79 * _206;
    float _292 = fma(_272, _272, _282);
    float _294 = _286 * _286;
    float _296 = _288 * 6.283185482025146484375;
    float _298 = sin(_296);
    float _300 = in.m_43.w;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _308 = _290 + _306;
    float _310 = fma(_186, _186, _294);
    float _312 = -_137;
    float _314 = _290 + _312;
    float _316 = _270 * (*spvDescriptorSet0.fp_c11)._m0[40].z;
    float _318 = fma(_284, _284, _310);
    float _320 = rsqrt(_292);
    float _322 = fma(_260, _260, _280);
    float _324 = fma(_264, _314, _276);
    float _326 = fma(_218, _314, _268);
    float _328 = _316 * 0.15915493667125701904296875;
    float _330 = fma(_308, _308, _322);
    float _332 = _324 * _324;
    float _334 = _278 * 1.67999994754791259765625;
    float _336 = rsqrt(_318);
    float _338 = fma(_326, _326, _332);
    float _340 = _316 * 1.67999994754791259765625;
    float _342 = _334 * 0.15915493667125701904296875;
    float _344 = sqrt(_330);
    float _346 = _184 * _320;
    float _348 = _272 * _320;
    float _350 = _178 * _320;
    float _352 = _284 * _336;
    float _354 = _286 * _336;
    float _356 = _186 * _336;
    float _358 = _79 * _304;
    float _360 = _346 * _352;
    float _362 = _348 * _354;
    float _364 = sqrt(_338);
    float _366 = spvFAdd(_344, 9.9999997473787516355514526367188e-06);
    float _368 = -_360;
    float _370 = fma(_348, _356, _368);
    float _372 = _350 * _356;
    float _374 = -_362;
    float _376 = fma(_350, _352, _374);
    float _378 = _340 * 0.15915493667125701904296875;
    float _380 = _358 * _370;
    float _382 = 1.0 / _366;
    float _384 = -_372;
    float _386 = fma(_346, _354, _384);
    float _388 = _358 * _376;
    float _390 = _380 * _380;
    float _392 = _358 * _386;
    float _394 = fma(_388, _388, _390);
    float _396 = _328 * 6.283185482025146484375;
    float _398 = sin(_396);
    float _400 = fma(_392, _392, _394);
    float _402 = _260 * _382;
    float _404 = _238 * _382;
    float _406 = _308 * _382;
    float _408 = _364 * 2.0;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _378 * 6.283185482025146484375;
    float _414 = sin(_412);
    float _416 = -_410;
    float _418 = _416 + 1.0;
    float _420 = rsqrt(_400);
    float _422 = abs(_418);
    float _424 = log2(_422);
    float _426 = _398 + _414;
    float _428 = _342 * 6.283185482025146484375;
    float _430 = sin(_428);
    float _432 = _266 * 6.283185482025146484375;
    float _434 = sin(_432);
    float _436 = _298 + _430;
    float _438 = fma(_95, 2.007874011993408203125, -1.007874011993408203125);
    float _440 = fma(_93, 2.007874011993408203125, -1.007874011993408203125);
    float _442 = abs(_97);
    float _444 = log2(_442);
    float _446 = _438 * _438;
    float _448 = _438 * _420;
    float _450 = fma(_426, 0.125, 2.25);
    float _452 = fma(_440, _440, _446);
    float _454 = _380 * _448;
    float _456 = _450 * _424;
    float _458 = -_452;
    float _460 = _458 + 1.0;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = fma(_354, _440, _454);
    float _466 = _388 * _448;
    float _468 = _392 * _448;
    float _470 = fma(_434, 0.25, 0.75);
    float _472 = fma(_436, 0.25, 0.5);
    float _474 = sqrt(_462);
    float _476 = fma(_356, _440, _466);
    float _478 = fma(_352, _440, _468);
    float _480 = fma(_426, 0.25, 1.5);
    float _482 = _480 * _444;
    float _484 = exp2(_456);
    float _486 = -(*spvDescriptorSet0.fp_c11)._m0[17].y;
    float _488 = _486 + (*spvDescriptorSet0.fp_c11)._m0[15].y;
    float _490 = -(*spvDescriptorSet0.fp_c11)._m0[17].x;
    float _492 = _490 + (*spvDescriptorSet0.fp_c11)._m0[15].x;
    float _494 = fma(_472, _488, (*spvDescriptorSet0.fp_c11)._m0[17].y);
    float _496 = fma(_472, _492, (*spvDescriptorSet0.fp_c11)._m0[17].x);
    float _498 = fma(_350, _474, _464);
    float _500 = fma(_346, _474, _476);
    float _502 = fma(_348, _474, _478);
    float _504 = exp2(_482);
    float _506 = _498 * _498;
    float _508 = fma(_500, _500, _506);
    float _510 = _470 * _484;
    float _512 = -(*spvDescriptorSet0.fp_c11)._m0[17].z;
    float _514 = _512 + (*spvDescriptorSet0.fp_c11)._m0[15].z;
    float _516 = fma(_502, _502, _508);
    float _518 = _494 * _510;
    float _520 = fma(_472, _514, (*spvDescriptorSet0.fp_c11)._m0[17].z);
    float _522 = _496 * _510;
    float _524 = rsqrt(_516);
    float _526 = _520 * _510;
    float _528 = _498 * _524;
    float _530 = _500 * _524;
    float _532 = _502 * _524;
    float _534 = _404 * _528;
    int _536 = _168 & 31;
    uint _539 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_536)));
    bool _543 = uint(_536) < 32u;
    int _545 = _543 ? int(_539) : 0;
    float _547 = fma(_402, _530, _534);
    float _549 = fma(_182, 0.550000011920928955078125, 0.4500000178813934326171875);
    int _551 = _545 & 255;
    float _553 = fma(_406, _532, _547);
    float _555 = _504 * _549;
    bool _557 = _551 != 255;
    float _559 = abs(_553);
    float _561 = -_559;
    float _563 = _561 + 1.0;
    float _565 = _563 * _563;
    float _567 = fma(_565, (*spvDescriptorSet0.fp_c11)._m0[16].y, _518);
    float _569 = fma(_565, (*spvDescriptorSet0.fp_c11)._m0[16].x, _522);
    float _571 = fma(_565, (*spvDescriptorSet0.fp_c11)._m0[16].z, _526);
    float _573 = fma(_555, (*spvDescriptorSet0.fp_c11)._m0[18].y, _567);
    bool _575 = !_557;
    if (!_575)
    {
        bool _577 = _551 != 0;
        if (!_577)
        {
            discard_fragment();
        }
        if (!_577)
        {
            out.m_46.x = 0.0;
            out.m_46.y = 0.0;
            out.m_46.z = 0.0;
            out.m_46.w = 0.0;
            return out;
        }
        float _579 = gl_FragCoord.x;
        float _581 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _583 = _579 / _581;
        float _585 = gl_FragCoord.y;
        float _587 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _589 = _585 / _587;
        float _591 = trunc(_583);
        float _593 = precise::max(_591, 0.0);
        uint _595 = uint(_593);
        float _597 = trunc(_589);
        float _599 = precise::max(_597, 0.0);
        uint _601 = uint(_599);
        uint _603 = uint(int(uint(int(_595)) >> uint(1)));
        uint _605 = uint(int(uint(int(_601)) >> uint(1)));
        int _607 = int(_603) ^ int(_605);
        int _609 = _607 << 16;
        int _611 = _609 ^ int(_603);
        int _613 = 983055 & _611;
        int _615 = _613 << 6;
        int _617 = _615 + _613;
        int _619 = _617 & 13369548;
        uint _621 = uint(int(uint(_619) >> uint(3)));
        int _623 = _619 | int(_621);
        int _625 = _623 & 5570560;
        int _627 = _623 & 85;
        uint _629 = uint(int(uint(_625) >> uint(15)));
        int _631 = int(_629) + _627;
        bool _633 = uint(_551) >= uint(_631);
        if (!_633)
        {
            discard_fragment();
        }
        if (!_633)
        {
            out.m_46.x = 0.0;
            out.m_46.y = 0.0;
            out.m_46.z = 0.0;
            out.m_46.w = 0.0;
            return out;
        }
    }
    float _635 = fma(_555, (*spvDescriptorSet0.fp_c11)._m0[18].x, _569);
    float _637 = _573 * (*spvDescriptorSet0.fp_c11)._m0[40].w;
    float _639 = fma(_555, (*spvDescriptorSet0.fp_c11)._m0[18].z, _571);
    float _641 = _635 * (*spvDescriptorSet0.fp_c11)._m0[40].w;
    float _643 = _637 * 0.715200006961822509765625;
    float _645 = _639 * (*spvDescriptorSet0.fp_c11)._m0[40].w;
    float _647 = (*spvDescriptorSet0.fp_c9)._m0[38].y + (*spvDescriptorSet0.fp_c9)._m0[38].x;
    float _649 = fma(_641, 0.2125999927520751953125, _643);
    float _651 = fma(_645, 0.072200000286102294921875, _649);
    float _653 = 1.0 / _651;
    float _655 = _653 * (*spvDescriptorSet0.fp_c9)._m0[38].z;
    float _657 = _647 * _655;
    float _659 = precise::clamp(_657, 0.0, 1.0);
    float _661 = fma(_659, (*spvDescriptorSet0.fp_c9)._m0[40].y, (*spvDescriptorSet0.fp_c9)._m0[40].x);
    float _663 = precise::min(_655, _661);
    float _665 = _663 * (*spvDescriptorSet0.fp_c9)._m0[38].y;
    float _667 = fma(_661, (*spvDescriptorSet0.fp_c9)._m0[38].x, _665);
    float _669 = _641 * _667;
    float _671 = _637 * _667;
    float _673 = _645 * _667;
    float _675 = precise::max(0.0, _669);
    float _677 = precise::max(0.0, _671);
    float _679 = precise::max(0.0, _673);
    out.m_46.x = _675;
    out.m_46.y = _677;
    out.m_46.z = _679;
    out.m_46.w = 1.0;
    return out;
}

