#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
};

struct main0_out
{
    float4 m_52 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_62 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_44 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_46 [[attribute(8)]];
    float4 m_56 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _77(thread const int& _5096, thread const int& _5097, constant _10& support_buffer)
{
    float _5100 = as_type<float>(support_buffer._m4);
    int _5102 = _5097 + as_type<int>(_5100);
    int _5104 = 1 + _5102;
    float _5106 = support_buffer._m5[_5104].x;
    float _5108 = abs(_5106);
    bool _5110 = _5108 == 1.0;
    if (_5110)
    {
        return _5096;
    }
    float _5112 = float(_5096);
    float _5114 = _5112 / _5108;
    int _5116 = int(_5114);
    return _5116;
}

static inline __attribute__((always_inline))
int _78(thread const int& _5146, thread const int& _5147, constant _10& support_buffer)
{
    float _5150 = as_type<float>(support_buffer._m4);
    int _5152 = _5147 + as_type<int>(_5150);
    int _5154 = 1 + _5152;
    float _5156 = support_buffer._m5[_5154].x;
    bool _5158 = _5156 == 1.0;
    if (_5158)
    {
        return _5146;
    }
    float _5160 = float(_5146);
    float _5162 = _5160 * _5156;
    int _5164 = int(_5162);
    return _5164;
}

static inline __attribute__((always_inline))
void _75(thread int& _5093, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _5093 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1902 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_37.w;
    float _84 = trunc(_82);
    int _86 = int(_84);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_40.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2086 = as_type<float>(_102);
        out.gl_Position.z = _2086;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_42.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = _120;
    if (_116)
    {
        float _124 = float(_86);
        _94 = _124;
    }
    float _126 = _94;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_40.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _104 = as_type<int>(_138);
    }
    int _140 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2156 = as_type<float>(_140);
        out.gl_Position.z = _2156;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    int _142 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _144 = _142;
    int _146 = 0;
    int _148 = _77(_144, _146, (*spvDescriptorSet0.support_buffer));
    float _150 = in.m_44.z;
    float _152 = in.m_46.z;
    float _154 = _120 + _150;
    float _156 = _154 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _158 = trunc(_152);
    int _160 = int(_158);
    float _162 = float(_148);
    int _164 = abs(_148);
    bool _166 = _148 == 0;
    float _168 = _156 * _162;
    float _170 = float(uint(_164));
    float _172 = trunc(_168);
    int _174 = int(_172);
    float _176 = 1.0 / _170;
    int _178 = abs(_174);
    uint _181 = uint(int(uint(_174) >> uint(31)));
    float _183 = float(uint(_178));
    int _185 = ~int(_181);
    int _187 = _185 + 1;
    int _189 = as_type<int>(_176) + (-2);
    float _191 = as_type<float>(_189) * _183;
    float _193 = trunc(_191);
    float _195 = precise::max(_193, 0.0);
    uint _197 = uint(_195);
    int _199 = ~int(_197);
    int _201 = _199 + 1;
    int _203 = _201 * _164;
    int _205 = _203 + _178;
    float _207 = float(uint(_205));
    float _209 = as_type<float>(_189) * _207;
    float _211 = trunc(_209);
    float _213 = precise::max(_211, 0.0);
    uint _215 = uint(_213);
    int _217 = int(_197) + int(_215);
    int _219 = ~_217;
    int _221 = _219 + 1;
    int _223 = _221 * _164;
    int _225 = _223 + _178;
    bool _227 = uint(_225) >= uint(_164);
    bool _229 = !_227;
    int _231 = _229 ? 0 : (-1);
    int _233 = ~_217;
    int _235 = _233 + _231;
    int _237 = _235 + 1;
    int _239 = _237 * _164;
    int _241 = _239 + _178;
    int _243 = _241 ^ _187;
    int _245 = ~_187;
    int _247 = _245 + _243;
    int _249 = _247 + 1;
    bool _251 = !_166;
    int _253 = _251 ? _249 : (-1);
    int _255 = _253;
    int _257 = 0;
    int _259 = _78(_255, _257, (*spvDescriptorSet0.support_buffer));
    int _261 = _160;
    int _263 = 0;
    int _265 = _78(_261, _263, (*spvDescriptorSet0.support_buffer));
    float4 _268 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_259, _265)), 0).xyzw;
    float _270 = _268.x;
    float _272 = _268.y;
    float _274 = _268.z;
    float _276 = _268.w;
    float _278 = in.m_44.x;
    float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _282 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _284 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _286 = in.m_44.y;
    float _288 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _290 = in.m_46.x;
    float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _294 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _296 = _294 != 0;
    float _298 = in.m_46.y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _302 = _282 * _280;
    float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _308 = _306 != 0;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _314 = _312 != 0;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _318 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[20].x, _302);
    float _320 = _284 * _292;
    float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _324 = _286 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _326 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[20].y, _320);
    bool _328 = _278 > 0.5;
    bool _330 = _328 && _308;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _334 = fma(_324, -2.0, _316);
    float _336 = _318 * 6.283185482025146484375;
    float _338 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[78].w, _300);
    float _340 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[79].z, _332);
    bool _342 = _286 > 0.5;
    bool _344 = _342 && _314;
    float _346 = _336 * 0.15915493667125701904296875;
    float _348 = _326 * 6.283185482025146484375;
    float _350 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[79].x, _340);
    float _352 = floor(_326);
    float _354 = _348 * 0.15915493667125701904296875;
    float _356 = _278 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _358 = 0.0;
    float _360 = _350;
    float _362 = _298;
    if (_308)
    {
        _358 = _290;
    }
    float _364 = _358;
    float _366 = _350 * (-0.15915493667125701904296875);
    bool _368 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _372 = _368 || _370;
    bool _374 = isnan(1.0);
    bool _376 = _372 || _374;
    float _378 = -_310;
    float _380 = fma(_356, 2.0, _378);
    float _382 = floor(_318);
    float _384 = _364;
    if (_330)
    {
        float _386 = -_364;
        float _388 = _386 + 1.0;
        _384 = _388;
    }
    float _390 = _384;
    if (!_308)
    {
        _360 = _290;
    }
    float _392 = _360;
    float _394 = _304 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _396 = _322 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _398 = _392;
    float _400 = _394;
    if (_308)
    {
        _398 = _390;
    }
    float _402 = _398;
    if (_344)
    {
        float _404 = -_298;
        float _406 = _404 + 1.0;
        _362 = _406;
    }
    float _408 = _362;
    float _410 = _346 * 6.283185482025146484375;
    float _412 = cos(_410);
    float _414 = -_352;
    float _416 = _326 + _414;
    float _418 = fma(_394, _402, -0.5);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _422 = fma(_396, _408, -0.5);
    if (!_376)
    {
        float _424 = _288 * _288;
        float _426 = _424 * 0.5;
        _400 = _426;
    }
    float _428 = _400;
    float _430 = _354 * 6.283185482025146484375;
    float _432 = cos(_430);
    float _434 = -_382;
    float _436 = _318 + _434;
    float _438 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[78].z, _420);
    float _440 = _428;
    if (!_376)
    {
        float _442 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _440 = _442;
    }
    float _444 = _440;
    float _446 = _366 * 6.283185482025146484375;
    float _448 = sin(_446);
    float _450 = fma(_412, 0.5, 0.5);
    float _452 = _412;
    float _454 = _444;
    if (!_376)
    {
        _452 = _288;
    }
    float _456 = _452;
    float _458 = _366 * 6.283185482025146484375;
    float _460 = cos(_458);
    float _462 = fma(_432, 0.5, 0.5);
    float _464 = _448 * _422;
    bool _466 = !_376;
    float _468 = _456;
    if (!_466)
    {
        float _470 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _472 = log2(_470);
        float _474 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _476 = _474 + 1.0;
        float _478 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _480 = _288 * _472;
        float _482 = 1.0 / _476;
        float _484 = _478 * 0.693147182464599609375;
        float _486 = exp2(_480);
        float _488 = 1.0 / _484;
        float _490 = _486 + (-1.0);
        float _492 = -_490;
        float _494 = fma(_492, _488, _288);
        float _496 = _494 * _482;
        float _498 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _454 = _498;
    }
    float _500 = _454;
    bool _502 = !_376;
    if (!_502)
    {
        float _504 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _506 = log2(_504);
        float _508 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _510 = _508 + 1.0;
        float _512 = 1.0 / _510;
        float _514 = _288 * _506;
        float _516 = exp2(_514);
        float _518 = -_516;
        float _520 = _518 + 1.0;
        float _522 = _520 * _512;
        _468 = _522;
    }
    float _524 = _468;
    float _526 = _460 * _422;
    float _528 = -_464;
    float _530 = fma(_460, _418, _528);
    float _532 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _438);
    float _534 = fma(_448, _418, _526);
    bool _536 = _436 < 0.5;
    float _538 = float(_536);
    float _540 = in.m_42.x;
    float _542 = in.m_42.y;
    float _544 = in.m_42.z;
    float _546 = -_436;
    float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _550 = -_450;
    float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _554 = -_538;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _564 = _562 != 0;
    float _566 = -_120;
    float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[76].x, _380);
    bool _570 = _416 < 0.5;
    float _572 = float(_570);
    float _574 = -_416;
    float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _578 = !_296;
    int _580 = _578 ? 0 : 1;
    float _582 = -_462;
    float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _586 = !_560;
    int _588 = _586 ? 0 : 1;
    float _590 = -_572;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _594 = fma(_532, _530, _568);
    int _596 = abs(_580);
    float _598 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _334);
    int _600 = abs(_588);
    float _602 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _338);
    bool _604 = !_564;
    int _606 = _604 ? 0 : 1;
    float _608 = _500 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _610 = -_598;
    float _612 = fma(_602, _534, _610);
    int _614 = abs(_606);
    float _616 = fma(_524, _540, _608);
    float _618 = float(_600);
    float _620 = _500 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _622 = float(_596);
    float _624 = _500 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _626 = abs(_548);
    float _628 = _618 * _626;
    float _630 = abs(_576);
    float _632 = _618 * _630;
    int _634 = _253 + 1;
    float _636 = fma(_524, _544, _624);
    float _638 = float(_614);
    float _640 = fma(_622, _552, _628);
    float _642 = fma(_622, _584, _632);
    float _644 = fma(_524, _542, _620);
    uint _646 = as_type<uint>(half2(float2(_276, 0.0)));
    float _648 = abs(_556);
    float _650 = fma(_638, _648, _640);
    int _652 = abs(_634);
    float _654 = abs(_592);
    float _656 = fma(_638, _654, _642);
    uint _658 = extract_bits(_646, 0u, 8u);
    int _660 = int(_658) & 255;
    uint _662 = extract_bits(_646, 8u, 8u);
    int _664 = int(_662) & 255;
    int _666 = _664 << 8;
    int _668 = _660 | _666;
    float _670 = in.m_48.x;
    float _672 = in.m_48.y;
    float _674 = in.m_48.z;
    float _676 = in.m_48.w;
    float _678 = float(uint(_652));
    uint _680 = uint(int(uint(_634) >> uint(31)));
    float _682 = as_type<float>(_189) * _678;
    int _684 = ~int(_680);
    int _686 = _684 + 1;
    float _688 = trunc(_682);
    float _690 = precise::max(_688, 0.0);
    uint _692 = uint(_690);
    float _694 = _670 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _696 = _674 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _698 = ~int(_692);
    int _700 = _698 + 1;
    int _702 = _700 * _164;
    int _704 = _702 + _652;
    float _706 = float(uint(_704));
    float _708 = as_type<float>(_189) * _706;
    float _710 = in.m_37.x;
    float _712 = in.m_37.y;
    float _714 = in.m_37.z;
    float _716 = trunc(_708);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    int _722 = int(_692) + int(_720);
    int _724 = ~_722;
    int _726 = _724 + 1;
    float _728 = fma(_616, _676, _710);
    float _730 = fma(_644, _676, _712);
    float _732 = fma(_636, _676, _714);
    int _734 = _726 * _164;
    int _736 = _734 + _652;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _742 = uint(_736) >= uint(_164);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _748 = !_742;
    int _750 = _748 ? 0 : (-1);
    float _752 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _754 = _668 >= 32768;
    float _756 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _758 = ~_722;
    int _760 = _758 + _750;
    int _762 = _760 + 1;
    float _764 = _672 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _766 = _668 + (-1024);
    float _768 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _770 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _772 = _762 * _164;
    int _774 = _772 + _652;
    float _776 = _612 + 0.5;
    out.m_50.x = _756;
    out.m_50.y = _768;
    out.m_50.z = _770;
    int _778 = _774 ^ _686;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _782 = _766;
    if (_754)
    {
        int _784 = ~_668;
        int _786 = _784 + 33792;
        int _788 = _786 + 1;
        _782 = _788;
    }
    int _790 = _782;
    int _792 = ~_686;
    int _794 = _792 + _778;
    int _796 = _794 + 1;
    int _798 = _790 + 30719;
    float _800 = float(_798);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _804 = !_166;
    int _806 = _804 ? _796 : (-1);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _810 = fma(_800, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _812 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _816 = _594 + 0.5;
    float _818 = abs(_810);
    float _820 = -_818;
    float _822 = _820 + 1.0;
    out.m_52.x = _812;
    out.m_52.y = _814;
    out.m_52.z = _752;
    out.m_52.w = _780;
    int _824 = as_type<int>(_822) + (-218103808);
    bool _826 = uint(_824) >= 1920991232u;
    bool _828 = !_826;
    if (!_828)
    {
        int _830;
        _75(_830, out.gl_Position, out.gl_PointSize);
    }
    int _832 = _806;
    int _834 = 0;
    int _836 = _78(_832, _834, (*spvDescriptorSet0.support_buffer));
    int _838 = _160;
    int _840 = 0;
    int _842 = _78(_838, _840, (*spvDescriptorSet0.support_buffer));
    float4 _844 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_836, _842)), 0).xyzw;
    float _846 = _844.x;
    float _848 = _844.y;
    float _850 = _844.z;
    float _852 = _844.w;
    float _854 = floor(_168);
    float _856 = -_854;
    float _858 = _168 + _856;
    uint _860 = as_type<uint>(half2(float2(_852, 0.0)));
    float _862 = -_270;
    float _864 = _862 + _846;
    float _866 = -_272;
    float _868 = _866 + _848;
    uint _870 = extract_bits(_860, 0u, 8u);
    int _872 = int(_870) & 255;
    uint _874 = extract_bits(_860, 8u, 8u);
    int _876 = int(_874) & 255;
    int _878 = _876 << 8;
    int _880 = _872 | _878;
    float _882 = fma(_858, _864, _270);
    float _884 = fma(_858, _868, _272);
    bool _886 = _880 >= 32768;
    int _888 = _880 + (-1024);
    int _890 = _888;
    if (_886)
    {
        int _892 = ~_880;
        int _894 = _892 + 33792;
        int _896 = _894 + 1;
        _890 = _896;
    }
    int _898 = _890;
    int _900 = _898 + 30719;
    float _902 = float(_900);
    float _904 = fma(_902, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _906 = abs(_904);
    float _908 = -_906;
    float _910 = _908 + 1.0;
    int _912 = as_type<int>(_910) + (-218103808);
    bool _914 = uint(_912) >= 1920991232u;
    float _916 = -_274;
    float _918 = _916 + _850;
    float _920 = fma(_858, _918, _274);
    bool _922 = !_914;
    float _924 = _920;
    if (!_922)
    {
        int _926;
        _75(_926, out.gl_Position, out.gl_PointSize);
    }
    float _928 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _930 = log2(_928);
    float _932 = in.m_44.x;
    float _934 = in.m_44.y;
    float _936 = in.m_44.z;
    float _938 = _730 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _940 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    out.m_54.x = _816;
    out.m_54.y = _776;
    bool _950 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _952 = isnan(1.0);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _958 = _954 || _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _962 = 1.0 + _960;
    float _964 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[5].x, _938);
    float _966 = in.m_56.w;
    float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _970 = _930 * _120;
    float _972 = _730 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _974 = _730 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _976 = 1.0 / _962;
    float _978 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[5].z, _964);
    float _980 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[4].x, _972);
    float _982 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[6].x, _974);
    float _984 = _936 * 2.0;
    float _986 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[4].z, _980);
    float _988 = exp2(_970);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1000 = _998 != 0;
    float _1002 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1006 = _1004 != 0;
    float _1008 = _934 * 2.0;
    out.m_58.w = _966;
    bool _1010 = !_992;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = floor(_984);
    bool _1016 = !_996;
    int _1018 = _1016 ? 0 : 1;
    float _1020 = _986 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1022 = _936 + (-0.5);
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1026 = _1020 + _1024;
    float _1028 = -_988;
    float _1030 = _1028 + 1.0;
    float _1032 = floor(_1008);
    float _1034 = _948 ? _1030 : 0.0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1038 = _1036 != 0;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1042 = _1040 != 0;
    float _1044 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[6].z, _982);
    if (_958)
    {
        float _1046 = _1034 * _976;
        _122 = _1046;
    }
    float _1048 = _122;
    float _1050 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1052 = _1014 >= 0.0;
    bool _1054 = isnan(_1014);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1002);
    float _1064 = _932 * 2.0;
    float _1066 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1050);
    int _1068 = _1060 ? 0 : 1;
    float _1070 = _932 + _936;
    bool _1072 = _1014 > 0.0;
    float _1074 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1066);
    float _1076 = floor(_1064);
    float _1078 = _1070 + (-1.0);
    float _1080 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1082 = ~_1068;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1090 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1092 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1088);
    int _1094 = _1086;
    if (!_1072)
    {
        int _1096 = ~_1068;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = _934 + _932;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1106 = _1080 + _1104;
    bool _1108 = !_1000;
    int _1110 = _1108 ? 0 : 1;
    float _1112 = _1102 + (-1.0);
    bool _1114 = _1076 >= 0.0;
    bool _1116 = isnan(_1076);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    int _1124 = abs(_1110);
    float _1126 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1138 = _1136 != 0;
    int _1140 = _1122 ? 0 : 1;
    float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _1144 = _1032 >= 0.0;
    bool _1146 = isnan(_1032);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    bool _1154 = !_1130;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1152 ? 0 : 1;
    bool _1160 = _1076 > 0.0;
    bool _1162 = _1032 > 0.0;
    int _1164 = ~_1158;
    int _1166 = _1164 + 1;
    int _1168 = _1166 + 1;
    float _1170 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1062);
    float _1172 = _978 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1174 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1092);
    float _1176 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _1178 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1182 = _1172 + _1180;
    int _1184 = _1168;
    if (!_1162)
    {
        int _1186 = ~_1158;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    float _1192 = _1176 * _1142;
    float _1194 = _1178 * _968;
    float _1196 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1198 = _934 + _936;
    float _1200 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1192);
    float _1202 = _932 + (-0.5);
    float _1204 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1196);
    float _1206 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1194);
    float _1208 = floor(_1200);
    float _1210 = _1182 * _1182;
    float _1212 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1204);
    float _1214 = _934 + (-0.5);
    bool _1216 = !_1138;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = fma(_1026, _1026, _1210);
    int _1222 = abs(_1156);
    float _1224 = _1200 + 0.25;
    bool _1226 = _1212 >= 0.0;
    float _1228 = floor(_1206);
    float _1230 = in.m_60.x;
    float _1232 = in.m_60.y;
    float _1234 = in.m_60.z;
    int _1236 = abs(_1218);
    float _1238 = _1206 + 0.25;
    int _1240 = ~_1140;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    int _1246 = _1244;
    if (!_1160)
    {
        int _1248 = ~_1140;
        int _1250 = _1248 + 1;
        _1246 = _1250;
    }
    int _1252 = _1246;
    float _1254 = fma(_1106, _1106, _1220);
    float _1256 = float(_1100);
    float _1258 = -_1208;
    float _1260 = _1200 + _1258;
    float _1262 = float(_1222);
    float _1264 = floor(_1224);
    float _1266 = float(_1236);
    float _1268 = _1200 * 6.283185482025146484375;
    float _1270 = float(_1190);
    float _1272 = _1262 * _1256;
    bool _1274 = _1260 >= 0.5;
    bool _1276 = isnan(_1260);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.5);
    bool _1282 = _1278 || _1280;
    float _1284 = -_1228;
    float _1286 = _1206 + _1284;
    float _1288 = _1260;
    if (_1226)
    {
        _1288 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1290 = _1288;
    float _1292 = rsqrt(_1254);
    float _1294 = _1266 * _1270;
    float _1296 = _1206 * 6.283185482025146484375;
    float _1298 = _1272 * (-2.0);
    float _1300 = _1294 * (-2.0);
    int _1302 = as_type<int>(_1294);
    if (_1226)
    {
        float _1304 = _1290 * 5.0;
        _1302 = as_type<int>(_1304);
    }
    int _1306 = _1302;
    float _1308 = floor(_1238);
    float _1310 = fma(_1300, _1234, _1234);
    float _1312 = fma(_1090, _1300, _1090);
    bool _1314 = !_1282;
    float _1316 = _1314 ? 0.5 : (-0.5);
    if (_1226)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3884 = as_type<float>(_1306);
        out.gl_Position.z = _3884;
    }
    float _1318 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1310);
    bool _1320 = _1286 >= 0.5;
    bool _1322 = isnan(_1286);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.5);
    bool _1328 = _1324 || _1326;
    float _1330 = -_1264;
    float _1332 = _1224 + _1330;
    float _1334 = _1182 * _1292;
    int _1336 = abs(_1018);
    float _1338 = _1026 * _1292;
    float _1340 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1342 = _1340 * 2.0;
    float _1344 = -_1334;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1348 = fma(_1312, _1048, _1318);
    float _1350 = -_1338;
    float _1352 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1026);
    float _1354 = _1332;
    if (_1226)
    {
        out.m_40.x = 0.0;
    }
    float _1356 = _1268 * 0.15915493667125701904296875;
    float _1358 = float(_1336);
    float _1360 = _1346 * _1346;
    int _1362 = abs(_1012);
    float _1364 = -_1308;
    float _1366 = _1238 + _1364;
    bool _1368 = !_1038;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_1352, _1352, _1360);
    float _1374 = _1356 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = _1358 * _1342;
    float _1380 = _1296 * 0.15915493667125701904296875;
    float _1382 = _1106 * _1292;
    bool _1384 = _1332 > 0.5;
    int _1386 = abs(_1370);
    float _1388 = -_1382;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1106);
    float _1392 = _1380 * 6.283185482025146484375;
    float _1394 = sin(_1392);
    bool _1396 = !_1328;
    float _1398 = _1396 ? 0.5 : (-0.5);
    float _1400 = fma(_1390, _1390, _1372);
    bool _1402 = !_1006;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = float(_1386);
    float _1408 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1410 = rsqrt(_1074);
    bool _1412 = _1366 > 0.5;
    float _1414 = _1366;
    if (_1384)
    {
        float _1416 = -_1332;
        float _1418 = _1416 + 1.0;
        _1354 = _1418;
    }
    float _1420 = _1354;
    float _1422 = float(_1362);
    float _1424 = fma(_1420, 4.0, -1.0);
    float _1426 = fma(_1422, _1408, _1378);
    float _1428 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1430 = _1428 * 2.0;
    float _1432 = rsqrt(_1174);
    float _1434 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1436 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1438 = _1406 * _1430;
    int _1440 = abs(_1404);
    if (_1412)
    {
        float _1442 = -_1366;
        float _1444 = _1442 + 1.0;
        _1414 = _1444;
    }
    float _1446 = _1414;
    bool _1448 = !_1042;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = sqrt(_1400);
    float _1454 = float(_1440);
    float _1456 = fma(_1446, 4.0, -1.0);
    float _1458 = float(_1124);
    int _1460 = abs(_1450);
    float _1462 = fma(_1454, _1434, _1438);
    bool _1464 = !_1134;
    int _1466 = _1464 ? 0 : 1;
    float _1468 = rsqrt(_1170);
    float _1470 = fma(_1458, _1436, _1426);
    float _1472 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1474 = abs(_1466);
    float _1476 = fma(_1126, _1298, _1126);
    float _1478 = float(_1460);
    float _1480 = fma(_1470, 3.1415927410125732421875, _1230);
    float _1482 = sqrt(_1170);
    float _1484 = fma(_1478, _1472, _1462);
    float _1486 = fma(_1480, _1298, _1480);
    if (_1226)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1488 = -_1334;
    float _1490 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1172);
    float _1492 = float(_1252);
    float _1494 = -_1338;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1020);
    float _1498 = float(_1474);
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1502 = _1490 + _1500;
    float _1504 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1486);
    float _1506 = -_1382;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1512 = _1496 + _1510;
    float _1514 = _1498 * _1492;
    float _1516 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = fma(_1484, 3.1415927410125732421875, _1232);
    float _1524 = _1198 + (-1.0);
    float _1526 = _1514 * (-2.0);
    float _1528 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1516);
    float _1530 = fma(_1476, _1048, _1504);
    float _1532 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1534 = fma(_1522, _1526, _1522);
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1528);
    float _1538 = _1348 * 0.15915493667125701904296875;
    float _1540 = fma(_1532, _1526, _1532);
    float _1542 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1534);
    float _1544 = _1530 * 0.15915493667125701904296875;
    bool _1546 = _1536 >= 0.0;
    float _1548 = _884 * _1410;
    float _1550 = fma(_1540, _1048, _1542);
    float _1552 = _1538 * 6.283185482025146484375;
    float _1554 = sin(_1552);
    float _1556 = _920 * _1432;
    float _1558 = _650 * _694;
    float _1560 = _1550 * 0.15915493667125701904296875;
    float _1562 = _656 * _764;
    float _1564 = _1482 * _1548;
    float _1566 = _882 * _1468;
    float _1568 = _1538 * 6.283185482025146484375;
    float _1570 = cos(_1568);
    float _1572 = _1292 * _1452;
    if (_1546)
    {
        _924 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1574 = _924;
    float _1576 = _1558 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1578 = _1562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1580 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1582 = _1482 * _1566;
    int _1584 = as_type<int>(_1574);
    if (_1546)
    {
        float _1586 = _1574 * 5.0;
        _1584 = as_type<int>(_1586);
    }
    int _1588 = _1584;
    float _1590 = _1544 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = _1482 * _1556;
    if (_1546)
    {
        out.m_40.x = 0.0;
    }
    float _1596 = _1576 * _1572;
    float _1598 = _1578 * _1572;
    float _1600 = _1580 * _1572;
    if (_1546)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4317 = as_type<float>(_1588);
        out.gl_Position.z = _4317;
    }
    float _1602 = _1544 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    float _1606 = _1560 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    float _1610 = _1592 * _1554;
    float _1612 = _1592 * _1570;
    float _1614 = _1560 * 6.283185482025146484375;
    float _1616 = sin(_1614);
    float _1618 = _1604 * _1554;
    float _1620 = _1608 * _1554;
    float _1622 = _1604 * _1570;
    float _1624 = _1608 * _1570;
    float _1626 = _1592 * _1608;
    if (_1546)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1628 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1564);
    float _1630 = _1604 * _1608;
    float _1632 = -_1618;
    float _1634 = fma(_1616, _1612, _1632);
    float _1636 = -_1612;
    float _1638 = fma(_1616, _1618, _1636);
    float _1640 = _1598 * _1628;
    float _1642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1582);
    float _1644 = fma(_1616, _1610, _1622);
    float _1646 = fma(_1616, _1622, _1610);
    float _1648 = _1634 * _1640;
    float _1650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1594);
    float _1652 = _1596 * _1642;
    float _1654 = _1644 * _1640;
    float _1656 = _1626 * _1640;
    float _1658 = _1600 * _1650;
    float _1660 = fma(_1624, _1652, _1648);
    float _1662 = fma(_1620, _1652, _1654);
    float _1664 = -_1616;
    float _1666 = fma(_1664, _1652, _1656);
    float _1668 = fma(_1646, _1658, _1660);
    float _1670 = fma(_1638, _1658, _1662);
    float _1672 = fma(_1630, _1658, _1666);
    float _1674 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1676 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1678 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1682 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1684 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1676);
    float _1686 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1678);
    float _1688 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1680);
    float _1690 = _1674 * _1674;
    float _1692 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1684);
    float _1694 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1686);
    float _1696 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1688);
    float _1698 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1700 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1702 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1706 = fma(_1682, _1682, _1690);
    float _1708 = _1700 * _1700;
    float _1710 = fma(_1698, _1698, _1706);
    float _1712 = fma(_1702, _1702, _1708);
    float _1714 = rsqrt(_1710);
    float _1716 = fma(_1704, _1704, _1712);
    float _1718 = rsqrt(_1716);
    float _1720 = _1674 * _1714;
    float _1722 = sqrt(_1710);
    float _1724 = _1682 * _1714;
    float _1726 = _1698 * _1714;
    float _1728 = _1700 * _1718;
    float _1730 = _1702 * _1718;
    float _1732 = _1720 * _1728;
    float _1734 = fma(_1724, _1730, _1732);
    float _1736 = _1704 * _1718;
    float _1738 = fma(_1726, _1736, _1734);
    float _1740 = _1738 * _1722;
    float _1742 = fma(_1724, _1740, _1702);
    float _1744 = fma(_1726, _1740, _1704);
    float _1746 = fma(_1720, _1740, _1700);
    float _1748 = _1020 + _1742;
    float _1750 = _1080 + _1744;
    float _1752 = _1172 + _1746;
    float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1756 = _1748 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1760 = _1750 + _1758;
    float _1762 = _1756 * _1756;
    float _1764 = _1760 * _1760;
    float _1766 = _1762 + _1764;
    float _1768 = sqrt(_1766);
    bool _1770 = _1768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = _1740;
    float _1774 = _1700;
    float _1776 = _1762;
    float _1778 = _1748;
    float _1780 = _1750;
    if (!_1770)
    {
        _1772 = _1764;
    }
    float _1782 = _1772;
    float _1784 = _1782;
    if (!_1770)
    {
        _1774 = _1752;
    }
    float _1786 = _1774;
    bool _1788 = !_1770;
    float _1790 = _1786;
    if (!_1788)
    {
        float _1792 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1796 = _1768 + _1794;
        float _1798 = _1752 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1800 = rsqrt(_1766);
        float _1802 = _1796 * _1792;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1804 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = _1804 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        float _1814 = fma(_1808, _1798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1816 = _1800 * _1814;
        float _1818 = _1812 + (-1.0);
        float _1820 = _1760 * _1816;
        float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1824 = _1756 * _1816;
        float _1826 = fma(_1752, _1812, _1822);
        float _1828 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1830 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1832 = _1824 * _1824;
        float _1834 = _1820 * _1820;
        _1790 = _1826;
        _1776 = _1832;
        _1784 = _1834;
        _1778 = _1828;
        _1780 = _1830;
    }
    float _1836 = _1790;
    float _1838 = _1776;
    float _1840 = _1784;
    float _1842 = _1778;
    float _1844 = _1780;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1848 = _1836 + _1846;
    out.m_52.x = _812;
    out.m_52.y = _814;
    out.m_52.z = _752;
    out.m_52.w = _780;
    float _1850 = fma(_1848, _1848, _1838);
    out.m_50.x = _756;
    out.m_50.y = _768;
    out.m_50.z = _770;
    float _1852 = _1850 + _1840;
    float _1854 = sqrt(_1852);
    bool _1856 = _1854 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1858 = isnan(_1854);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1864 = _1860 || _1862;
    float _1866 = _1838;
    if (!_1864)
    {
        _1866 = 1.0;
    }
    float _1868 = _1866;
    bool _1870 = !_1864;
    float _1872 = _1868;
    if (!_1870)
    {
        bool _1874 = _1854 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1876 = isnan(_1854);
        bool _1878 = _1874 || _1876;
        bool _1880 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1882 = _1878 || _1880;
        if (!_1882)
        {
            float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1886 = _1854 + _1884;
            float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1890 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1888;
            float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1894 = _1892 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1896 = 1.0 / _1890;
            float _1898 = _1886 * _1896;
            float _1900 = fma(_1898, _1894, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1872 = _1900;
            _1902 = true;
        }
        else
        {
            bool _1904 = _1854 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1906 = isnan(_1854);
            bool _1908 = _1904 || _1906;
            bool _1910 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1912 = _1908 || _1910;
            if (!_1912)
            {
                float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1916 = _1854 + _1914;
                float _1918 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1920 = _1918 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1922 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1924 = _1922 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1926 = 1.0 / _1920;
                float _1928 = _1916 * _1926;
                float _1930 = fma(_1928, _1924, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1872 = _1930;
                _1902 = true;
            }
            else
            {
                _1872 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1902 = false;
    float _1932 = _1872;
    float _1934 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1936 = _1836 + _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1940 = _1842 + _1938;
    float _1942 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1944 = _1844 + _1942;
    out.m_40.x = 1.0;
    float _1946 = fma(_1936, _1932, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1948 = fma(_1940, _1932, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1950 = fma(_1944, _1932, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1952 = -_1334;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1946);
    float _1956 = -_1338;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1948);
    float _1960 = -_1382;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _1964 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1968 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1970 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1972 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1974 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1966);
    float _1976 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1968);
    float _1978 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1970);
    float _1980 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1972);
    float _1982 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1974);
    float _1984 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1976);
    float _1986 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1978);
    float _1988 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1990 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1992 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1996 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2002 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2004 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1996);
    float _2006 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1998);
    float _2008 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2000);
    float _2010 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2002);
    float _2012 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2004);
    float _2014 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2006);
    float _2016 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2008);
    float _2018 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2010);
    float _2020 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2012);
    float _2022 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2024 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2014);
    float _2026 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2016);
    float _2028 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2018);
    out.m_62.w = _2022;
    out.gl_Position.x = _2024;
    out.gl_Position.y = _2026;
    out.gl_Position.z = _2020;
    out.gl_Position.w = _2028;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1902 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_37.w;
    float _84 = trunc(_82);
    int _86 = int(_84);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_40.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2086 = as_type<float>(_102);
        out.gl_Position.z = _2086;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_42.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = _120;
    if (_116)
    {
        float _124 = float(_86);
        _94 = _124;
    }
    float _126 = _94;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_40.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _104 = as_type<int>(_138);
    }
    int _140 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2156 = as_type<float>(_140);
        out.gl_Position.z = _2156;
    }
    if (_132)
    {
        return out;
    }
    int _142 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _144 = _142;
    int _146 = 0;
    int _148 = _77(_144, _146, (*spvDescriptorSet0.support_buffer));
    float _150 = in.m_44.z;
    float _152 = in.m_46.z;
    float _154 = _120 + _150;
    float _156 = _154 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _158 = trunc(_152);
    int _160 = int(_158);
    float _162 = float(_148);
    int _164 = abs(_148);
    bool _166 = _148 == 0;
    float _168 = _156 * _162;
    float _170 = float(uint(_164));
    float _172 = trunc(_168);
    int _174 = int(_172);
    float _176 = 1.0 / _170;
    int _178 = abs(_174);
    uint _181 = uint(int(uint(_174) >> uint(31)));
    float _183 = float(uint(_178));
    int _185 = ~int(_181);
    int _187 = _185 + 1;
    int _189 = as_type<int>(_176) + (-2);
    float _191 = as_type<float>(_189) * _183;
    float _193 = trunc(_191);
    float _195 = precise::max(_193, 0.0);
    uint _197 = uint(_195);
    int _199 = ~int(_197);
    int _201 = _199 + 1;
    int _203 = _201 * _164;
    int _205 = _203 + _178;
    float _207 = float(uint(_205));
    float _209 = as_type<float>(_189) * _207;
    float _211 = trunc(_209);
    float _213 = precise::max(_211, 0.0);
    uint _215 = uint(_213);
    int _217 = int(_197) + int(_215);
    int _219 = ~_217;
    int _221 = _219 + 1;
    int _223 = _221 * _164;
    int _225 = _223 + _178;
    bool _227 = uint(_225) >= uint(_164);
    bool _229 = !_227;
    int _231 = _229 ? 0 : (-1);
    int _233 = ~_217;
    int _235 = _233 + _231;
    int _237 = _235 + 1;
    int _239 = _237 * _164;
    int _241 = _239 + _178;
    int _243 = _241 ^ _187;
    int _245 = ~_187;
    int _247 = _245 + _243;
    int _249 = _247 + 1;
    bool _251 = !_166;
    int _253 = _251 ? _249 : (-1);
    int _255 = _253;
    int _257 = 0;
    int _259 = _78(_255, _257, (*spvDescriptorSet0.support_buffer));
    int _261 = _160;
    int _263 = 0;
    int _265 = _78(_261, _263, (*spvDescriptorSet0.support_buffer));
    float4 _268 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_259, _265)), 0).xyzw;
    float _270 = _268.x;
    float _272 = _268.y;
    float _274 = _268.z;
    float _276 = _268.w;
    float _278 = in.m_44.x;
    float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _282 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _284 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _286 = in.m_44.y;
    float _288 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _290 = in.m_46.x;
    float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _294 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _296 = _294 != 0;
    float _298 = in.m_46.y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _302 = _282 * _280;
    float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _308 = _306 != 0;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _314 = _312 != 0;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _318 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[20].x, _302);
    float _320 = _284 * _292;
    float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _324 = _286 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _326 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[20].y, _320);
    bool _328 = _278 > 0.5;
    bool _330 = _328 && _308;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _334 = fma(_324, -2.0, _316);
    float _336 = _318 * 6.283185482025146484375;
    float _338 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[78].w, _300);
    float _340 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[79].z, _332);
    bool _342 = _286 > 0.5;
    bool _344 = _342 && _314;
    float _346 = _336 * 0.15915493667125701904296875;
    float _348 = _326 * 6.283185482025146484375;
    float _350 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[79].x, _340);
    float _352 = floor(_326);
    float _354 = _348 * 0.15915493667125701904296875;
    float _356 = _278 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _358 = 0.0;
    float _360 = _350;
    float _362 = _298;
    if (_308)
    {
        _358 = _290;
    }
    float _364 = _358;
    float _366 = _350 * (-0.15915493667125701904296875);
    bool _368 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _372 = _368 || _370;
    bool _374 = isnan(1.0);
    bool _376 = _372 || _374;
    float _378 = -_310;
    float _380 = fma(_356, 2.0, _378);
    float _382 = floor(_318);
    float _384 = _364;
    if (_330)
    {
        float _386 = -_364;
        float _388 = _386 + 1.0;
        _384 = _388;
    }
    float _390 = _384;
    if (!_308)
    {
        _360 = _290;
    }
    float _392 = _360;
    float _394 = _304 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _396 = _322 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _398 = _392;
    float _400 = _394;
    if (_308)
    {
        _398 = _390;
    }
    float _402 = _398;
    if (_344)
    {
        float _404 = -_298;
        float _406 = _404 + 1.0;
        _362 = _406;
    }
    float _408 = _362;
    float _410 = _346 * 6.283185482025146484375;
    float _412 = cos(_410);
    float _414 = -_352;
    float _416 = _326 + _414;
    float _418 = fma(_394, _402, -0.5);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _422 = fma(_396, _408, -0.5);
    if (!_376)
    {
        float _424 = _288 * _288;
        float _426 = _424 * 0.5;
        _400 = _426;
    }
    float _428 = _400;
    float _430 = _354 * 6.283185482025146484375;
    float _432 = cos(_430);
    float _434 = -_382;
    float _436 = _318 + _434;
    float _438 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[78].z, _420);
    float _440 = _428;
    if (!_376)
    {
        float _442 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _440 = _442;
    }
    float _444 = _440;
    float _446 = _366 * 6.283185482025146484375;
    float _448 = sin(_446);
    float _450 = fma(_412, 0.5, 0.5);
    float _452 = _412;
    float _454 = _444;
    if (!_376)
    {
        _452 = _288;
    }
    float _456 = _452;
    float _458 = _366 * 6.283185482025146484375;
    float _460 = cos(_458);
    float _462 = fma(_432, 0.5, 0.5);
    float _464 = _448 * _422;
    bool _466 = !_376;
    float _468 = _456;
    if (!_466)
    {
        float _470 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _472 = log2(_470);
        float _474 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _476 = _474 + 1.0;
        float _478 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _480 = _288 * _472;
        float _482 = 1.0 / _476;
        float _484 = _478 * 0.693147182464599609375;
        float _486 = exp2(_480);
        float _488 = 1.0 / _484;
        float _490 = _486 + (-1.0);
        float _492 = -_490;
        float _494 = fma(_492, _488, _288);
        float _496 = _494 * _482;
        float _498 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _454 = _498;
    }
    float _500 = _454;
    bool _502 = !_376;
    if (!_502)
    {
        float _504 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _506 = log2(_504);
        float _508 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _510 = _508 + 1.0;
        float _512 = 1.0 / _510;
        float _514 = _288 * _506;
        float _516 = exp2(_514);
        float _518 = -_516;
        float _520 = _518 + 1.0;
        float _522 = _520 * _512;
        _468 = _522;
    }
    float _524 = _468;
    float _526 = _460 * _422;
    float _528 = -_464;
    float _530 = fma(_460, _418, _528);
    float _532 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _438);
    float _534 = fma(_448, _418, _526);
    bool _536 = _436 < 0.5;
    float _538 = float(_536);
    float _540 = in.m_42.x;
    float _542 = in.m_42.y;
    float _544 = in.m_42.z;
    float _546 = -_436;
    float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _550 = -_450;
    float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _554 = -_538;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _564 = _562 != 0;
    float _566 = -_120;
    float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[76].x, _380);
    bool _570 = _416 < 0.5;
    float _572 = float(_570);
    float _574 = -_416;
    float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _578 = !_296;
    int _580 = _578 ? 0 : 1;
    float _582 = -_462;
    float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _586 = !_560;
    int _588 = _586 ? 0 : 1;
    float _590 = -_572;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _594 = fma(_532, _530, _568);
    int _596 = abs(_580);
    float _598 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _334);
    int _600 = abs(_588);
    float _602 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _338);
    bool _604 = !_564;
    int _606 = _604 ? 0 : 1;
    float _608 = _500 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _610 = -_598;
    float _612 = fma(_602, _534, _610);
    int _614 = abs(_606);
    float _616 = fma(_524, _540, _608);
    float _618 = float(_600);
    float _620 = _500 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _622 = float(_596);
    float _624 = _500 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _626 = abs(_548);
    float _628 = _618 * _626;
    float _630 = abs(_576);
    float _632 = _618 * _630;
    int _634 = _253 + 1;
    float _636 = fma(_524, _544, _624);
    float _638 = float(_614);
    float _640 = fma(_622, _552, _628);
    float _642 = fma(_622, _584, _632);
    float _644 = fma(_524, _542, _620);
    uint _646 = as_type<uint>(half2(float2(_276, 0.0)));
    float _648 = abs(_556);
    float _650 = fma(_638, _648, _640);
    int _652 = abs(_634);
    float _654 = abs(_592);
    float _656 = fma(_638, _654, _642);
    uint _658 = extract_bits(_646, 0u, 8u);
    int _660 = int(_658) & 255;
    uint _662 = extract_bits(_646, 8u, 8u);
    int _664 = int(_662) & 255;
    int _666 = _664 << 8;
    int _668 = _660 | _666;
    float _670 = in.m_48.x;
    float _672 = in.m_48.y;
    float _674 = in.m_48.z;
    float _676 = in.m_48.w;
    float _678 = float(uint(_652));
    uint _680 = uint(int(uint(_634) >> uint(31)));
    float _682 = as_type<float>(_189) * _678;
    int _684 = ~int(_680);
    int _686 = _684 + 1;
    float _688 = trunc(_682);
    float _690 = precise::max(_688, 0.0);
    uint _692 = uint(_690);
    float _694 = _670 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _696 = _674 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _698 = ~int(_692);
    int _700 = _698 + 1;
    int _702 = _700 * _164;
    int _704 = _702 + _652;
    float _706 = float(uint(_704));
    float _708 = as_type<float>(_189) * _706;
    float _710 = in.m_37.x;
    float _712 = in.m_37.y;
    float _714 = in.m_37.z;
    float _716 = trunc(_708);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    int _722 = int(_692) + int(_720);
    int _724 = ~_722;
    int _726 = _724 + 1;
    float _728 = fma(_616, _676, _710);
    float _730 = fma(_644, _676, _712);
    float _732 = fma(_636, _676, _714);
    int _734 = _726 * _164;
    int _736 = _734 + _652;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _742 = uint(_736) >= uint(_164);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _748 = !_742;
    int _750 = _748 ? 0 : (-1);
    float _752 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _754 = _668 >= 32768;
    float _756 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _758 = ~_722;
    int _760 = _758 + _750;
    int _762 = _760 + 1;
    float _764 = _672 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _766 = _668 + (-1024);
    float _768 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _770 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _772 = _762 * _164;
    int _774 = _772 + _652;
    float _776 = _612 + 0.5;
    out.m_50.x = _756;
    out.m_50.y = _768;
    out.m_50.z = _770;
    int _778 = _774 ^ _686;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _782 = _766;
    if (_754)
    {
        int _784 = ~_668;
        int _786 = _784 + 33792;
        int _788 = _786 + 1;
        _782 = _788;
    }
    int _790 = _782;
    int _792 = ~_686;
    int _794 = _792 + _778;
    int _796 = _794 + 1;
    int _798 = _790 + 30719;
    float _800 = float(_798);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _804 = !_166;
    int _806 = _804 ? _796 : (-1);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _810 = fma(_800, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _812 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _816 = _594 + 0.5;
    float _818 = abs(_810);
    float _820 = -_818;
    float _822 = _820 + 1.0;
    out.m_52.x = _812;
    out.m_52.y = _814;
    out.m_52.z = _752;
    out.m_52.w = _780;
    int _824 = as_type<int>(_822) + (-218103808);
    bool _826 = uint(_824) >= 1920991232u;
    bool _828 = !_826;
    if (!_828)
    {
        int _830;
        _75(_830, out.gl_Position, out.gl_PointSize);
    }
    int _832 = _806;
    int _834 = 0;
    int _836 = _78(_832, _834, (*spvDescriptorSet0.support_buffer));
    int _838 = _160;
    int _840 = 0;
    int _842 = _78(_838, _840, (*spvDescriptorSet0.support_buffer));
    float4 _844 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_836, _842)), 0).xyzw;
    float _846 = _844.x;
    float _848 = _844.y;
    float _850 = _844.z;
    float _852 = _844.w;
    float _854 = floor(_168);
    float _856 = -_854;
    float _858 = _168 + _856;
    uint _860 = as_type<uint>(half2(float2(_852, 0.0)));
    float _862 = -_270;
    float _864 = _862 + _846;
    float _866 = -_272;
    float _868 = _866 + _848;
    uint _870 = extract_bits(_860, 0u, 8u);
    int _872 = int(_870) & 255;
    uint _874 = extract_bits(_860, 8u, 8u);
    int _876 = int(_874) & 255;
    int _878 = _876 << 8;
    int _880 = _872 | _878;
    float _882 = fma(_858, _864, _270);
    float _884 = fma(_858, _868, _272);
    bool _886 = _880 >= 32768;
    int _888 = _880 + (-1024);
    int _890 = _888;
    if (_886)
    {
        int _892 = ~_880;
        int _894 = _892 + 33792;
        int _896 = _894 + 1;
        _890 = _896;
    }
    int _898 = _890;
    int _900 = _898 + 30719;
    float _902 = float(_900);
    float _904 = fma(_902, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _906 = abs(_904);
    float _908 = -_906;
    float _910 = _908 + 1.0;
    int _912 = as_type<int>(_910) + (-218103808);
    bool _914 = uint(_912) >= 1920991232u;
    float _916 = -_274;
    float _918 = _916 + _850;
    float _920 = fma(_858, _918, _274);
    bool _922 = !_914;
    float _924 = _920;
    if (!_922)
    {
        int _926;
        _75(_926, out.gl_Position, out.gl_PointSize);
    }
    float _928 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _930 = log2(_928);
    float _932 = in.m_44.x;
    float _934 = in.m_44.y;
    float _936 = in.m_44.z;
    float _938 = _730 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _940 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    out.m_54.x = _816;
    out.m_54.y = _776;
    bool _950 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _952 = isnan(1.0);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _958 = _954 || _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _962 = 1.0 + _960;
    float _964 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[5].x, _938);
    float _966 = in.m_56.w;
    float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _970 = _930 * _120;
    float _972 = _730 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _974 = _730 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _976 = 1.0 / _962;
    float _978 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[5].z, _964);
    float _980 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[4].x, _972);
    float _982 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[6].x, _974);
    float _984 = _936 * 2.0;
    float _986 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[4].z, _980);
    float _988 = exp2(_970);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1000 = _998 != 0;
    float _1002 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1006 = _1004 != 0;
    float _1008 = _934 * 2.0;
    out.m_58.w = _966;
    bool _1010 = !_992;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = floor(_984);
    bool _1016 = !_996;
    int _1018 = _1016 ? 0 : 1;
    float _1020 = _986 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1022 = _936 + (-0.5);
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1026 = _1020 + _1024;
    float _1028 = -_988;
    float _1030 = _1028 + 1.0;
    float _1032 = floor(_1008);
    float _1034 = _948 ? _1030 : 0.0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1038 = _1036 != 0;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1042 = _1040 != 0;
    float _1044 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[6].z, _982);
    if (_958)
    {
        float _1046 = _1034 * _976;
        _122 = _1046;
    }
    float _1048 = _122;
    float _1050 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1052 = _1014 >= 0.0;
    bool _1054 = isnan(_1014);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1002);
    float _1064 = _932 * 2.0;
    float _1066 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1050);
    int _1068 = _1060 ? 0 : 1;
    float _1070 = _932 + _936;
    bool _1072 = _1014 > 0.0;
    float _1074 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1066);
    float _1076 = floor(_1064);
    float _1078 = _1070 + (-1.0);
    float _1080 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1082 = ~_1068;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1090 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1092 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1088);
    int _1094 = _1086;
    if (!_1072)
    {
        int _1096 = ~_1068;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = _934 + _932;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1106 = _1080 + _1104;
    bool _1108 = !_1000;
    int _1110 = _1108 ? 0 : 1;
    float _1112 = _1102 + (-1.0);
    bool _1114 = _1076 >= 0.0;
    bool _1116 = isnan(_1076);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    int _1124 = abs(_1110);
    float _1126 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1138 = _1136 != 0;
    int _1140 = _1122 ? 0 : 1;
    float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _1144 = _1032 >= 0.0;
    bool _1146 = isnan(_1032);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    bool _1154 = !_1130;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1152 ? 0 : 1;
    bool _1160 = _1076 > 0.0;
    bool _1162 = _1032 > 0.0;
    int _1164 = ~_1158;
    int _1166 = _1164 + 1;
    int _1168 = _1166 + 1;
    float _1170 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1062);
    float _1172 = _978 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1174 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1092);
    float _1176 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _1178 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1182 = _1172 + _1180;
    int _1184 = _1168;
    if (!_1162)
    {
        int _1186 = ~_1158;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    float _1192 = _1176 * _1142;
    float _1194 = _1178 * _968;
    float _1196 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1198 = _934 + _936;
    float _1200 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1192);
    float _1202 = _932 + (-0.5);
    float _1204 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1196);
    float _1206 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1194);
    float _1208 = floor(_1200);
    float _1210 = _1182 * _1182;
    float _1212 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1204);
    float _1214 = _934 + (-0.5);
    bool _1216 = !_1138;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = fma(_1026, _1026, _1210);
    int _1222 = abs(_1156);
    float _1224 = _1200 + 0.25;
    bool _1226 = _1212 >= 0.0;
    float _1228 = floor(_1206);
    float _1230 = in.m_60.x;
    float _1232 = in.m_60.y;
    float _1234 = in.m_60.z;
    int _1236 = abs(_1218);
    float _1238 = _1206 + 0.25;
    int _1240 = ~_1140;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    int _1246 = _1244;
    if (!_1160)
    {
        int _1248 = ~_1140;
        int _1250 = _1248 + 1;
        _1246 = _1250;
    }
    int _1252 = _1246;
    float _1254 = fma(_1106, _1106, _1220);
    float _1256 = float(_1100);
    float _1258 = -_1208;
    float _1260 = _1200 + _1258;
    float _1262 = float(_1222);
    float _1264 = floor(_1224);
    float _1266 = float(_1236);
    float _1268 = _1200 * 6.283185482025146484375;
    float _1270 = float(_1190);
    float _1272 = _1262 * _1256;
    bool _1274 = _1260 >= 0.5;
    bool _1276 = isnan(_1260);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.5);
    bool _1282 = _1278 || _1280;
    float _1284 = -_1228;
    float _1286 = _1206 + _1284;
    float _1288 = _1260;
    if (_1226)
    {
        _1288 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1290 = _1288;
    float _1292 = rsqrt(_1254);
    float _1294 = _1266 * _1270;
    float _1296 = _1206 * 6.283185482025146484375;
    float _1298 = _1272 * (-2.0);
    float _1300 = _1294 * (-2.0);
    int _1302 = as_type<int>(_1294);
    if (_1226)
    {
        float _1304 = _1290 * 5.0;
        _1302 = as_type<int>(_1304);
    }
    int _1306 = _1302;
    float _1308 = floor(_1238);
    float _1310 = fma(_1300, _1234, _1234);
    float _1312 = fma(_1090, _1300, _1090);
    bool _1314 = !_1282;
    float _1316 = _1314 ? 0.5 : (-0.5);
    if (_1226)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3884 = as_type<float>(_1306);
        out.gl_Position.z = _3884;
    }
    float _1318 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1310);
    bool _1320 = _1286 >= 0.5;
    bool _1322 = isnan(_1286);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.5);
    bool _1328 = _1324 || _1326;
    float _1330 = -_1264;
    float _1332 = _1224 + _1330;
    float _1334 = _1182 * _1292;
    int _1336 = abs(_1018);
    float _1338 = _1026 * _1292;
    float _1340 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1342 = _1340 * 2.0;
    float _1344 = -_1334;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1348 = fma(_1312, _1048, _1318);
    float _1350 = -_1338;
    float _1352 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1026);
    float _1354 = _1332;
    if (_1226)
    {
        out.m_40.x = 0.0;
    }
    float _1356 = _1268 * 0.15915493667125701904296875;
    float _1358 = float(_1336);
    float _1360 = _1346 * _1346;
    int _1362 = abs(_1012);
    float _1364 = -_1308;
    float _1366 = _1238 + _1364;
    bool _1368 = !_1038;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_1352, _1352, _1360);
    float _1374 = _1356 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = _1358 * _1342;
    float _1380 = _1296 * 0.15915493667125701904296875;
    float _1382 = _1106 * _1292;
    bool _1384 = _1332 > 0.5;
    int _1386 = abs(_1370);
    float _1388 = -_1382;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1106);
    float _1392 = _1380 * 6.283185482025146484375;
    float _1394 = sin(_1392);
    bool _1396 = !_1328;
    float _1398 = _1396 ? 0.5 : (-0.5);
    float _1400 = fma(_1390, _1390, _1372);
    bool _1402 = !_1006;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = float(_1386);
    float _1408 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1410 = rsqrt(_1074);
    bool _1412 = _1366 > 0.5;
    float _1414 = _1366;
    if (_1384)
    {
        float _1416 = -_1332;
        float _1418 = _1416 + 1.0;
        _1354 = _1418;
    }
    float _1420 = _1354;
    float _1422 = float(_1362);
    float _1424 = fma(_1420, 4.0, -1.0);
    float _1426 = fma(_1422, _1408, _1378);
    float _1428 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1430 = _1428 * 2.0;
    float _1432 = rsqrt(_1174);
    float _1434 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1436 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1438 = _1406 * _1430;
    int _1440 = abs(_1404);
    if (_1412)
    {
        float _1442 = -_1366;
        float _1444 = _1442 + 1.0;
        _1414 = _1444;
    }
    float _1446 = _1414;
    bool _1448 = !_1042;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = sqrt(_1400);
    float _1454 = float(_1440);
    float _1456 = fma(_1446, 4.0, -1.0);
    float _1458 = float(_1124);
    int _1460 = abs(_1450);
    float _1462 = fma(_1454, _1434, _1438);
    bool _1464 = !_1134;
    int _1466 = _1464 ? 0 : 1;
    float _1468 = rsqrt(_1170);
    float _1470 = fma(_1458, _1436, _1426);
    float _1472 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1474 = abs(_1466);
    float _1476 = fma(_1126, _1298, _1126);
    float _1478 = float(_1460);
    float _1480 = fma(_1470, 3.1415927410125732421875, _1230);
    float _1482 = sqrt(_1170);
    float _1484 = fma(_1478, _1472, _1462);
    float _1486 = fma(_1480, _1298, _1480);
    if (_1226)
    {
        return out;
    }
    float _1488 = -_1334;
    float _1490 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1172);
    float _1492 = float(_1252);
    float _1494 = -_1338;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1020);
    float _1498 = float(_1474);
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1502 = _1490 + _1500;
    float _1504 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1486);
    float _1506 = -_1382;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1512 = _1496 + _1510;
    float _1514 = _1498 * _1492;
    float _1516 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = fma(_1484, 3.1415927410125732421875, _1232);
    float _1524 = _1198 + (-1.0);
    float _1526 = _1514 * (-2.0);
    float _1528 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1516);
    float _1530 = fma(_1476, _1048, _1504);
    float _1532 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1534 = fma(_1522, _1526, _1522);
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1528);
    float _1538 = _1348 * 0.15915493667125701904296875;
    float _1540 = fma(_1532, _1526, _1532);
    float _1542 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1534);
    float _1544 = _1530 * 0.15915493667125701904296875;
    bool _1546 = _1536 >= 0.0;
    float _1548 = _884 * _1410;
    float _1550 = fma(_1540, _1048, _1542);
    float _1552 = _1538 * 6.283185482025146484375;
    float _1554 = sin(_1552);
    float _1556 = _920 * _1432;
    float _1558 = _650 * _694;
    float _1560 = _1550 * 0.15915493667125701904296875;
    float _1562 = _656 * _764;
    float _1564 = _1482 * _1548;
    float _1566 = _882 * _1468;
    float _1568 = _1538 * 6.283185482025146484375;
    float _1570 = cos(_1568);
    float _1572 = _1292 * _1452;
    if (_1546)
    {
        _924 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1574 = _924;
    float _1576 = _1558 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1578 = _1562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1580 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1582 = _1482 * _1566;
    int _1584 = as_type<int>(_1574);
    if (_1546)
    {
        float _1586 = _1574 * 5.0;
        _1584 = as_type<int>(_1586);
    }
    int _1588 = _1584;
    float _1590 = _1544 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = _1482 * _1556;
    if (_1546)
    {
        out.m_40.x = 0.0;
    }
    float _1596 = _1576 * _1572;
    float _1598 = _1578 * _1572;
    float _1600 = _1580 * _1572;
    if (_1546)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4317 = as_type<float>(_1588);
        out.gl_Position.z = _4317;
    }
    float _1602 = _1544 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    float _1606 = _1560 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    float _1610 = _1592 * _1554;
    float _1612 = _1592 * _1570;
    float _1614 = _1560 * 6.283185482025146484375;
    float _1616 = sin(_1614);
    float _1618 = _1604 * _1554;
    float _1620 = _1608 * _1554;
    float _1622 = _1604 * _1570;
    float _1624 = _1608 * _1570;
    float _1626 = _1592 * _1608;
    if (_1546)
    {
        return out;
    }
    float _1628 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1564);
    float _1630 = _1604 * _1608;
    float _1632 = -_1618;
    float _1634 = fma(_1616, _1612, _1632);
    float _1636 = -_1612;
    float _1638 = fma(_1616, _1618, _1636);
    float _1640 = _1598 * _1628;
    float _1642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1582);
    float _1644 = fma(_1616, _1610, _1622);
    float _1646 = fma(_1616, _1622, _1610);
    float _1648 = _1634 * _1640;
    float _1650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1594);
    float _1652 = _1596 * _1642;
    float _1654 = _1644 * _1640;
    float _1656 = _1626 * _1640;
    float _1658 = _1600 * _1650;
    float _1660 = fma(_1624, _1652, _1648);
    float _1662 = fma(_1620, _1652, _1654);
    float _1664 = -_1616;
    float _1666 = fma(_1664, _1652, _1656);
    float _1668 = fma(_1646, _1658, _1660);
    float _1670 = fma(_1638, _1658, _1662);
    float _1672 = fma(_1630, _1658, _1666);
    float _1674 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1676 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1678 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1682 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1684 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1676);
    float _1686 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1678);
    float _1688 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1680);
    float _1690 = _1674 * _1674;
    float _1692 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1684);
    float _1694 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1686);
    float _1696 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1688);
    float _1698 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1700 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1702 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1706 = fma(_1682, _1682, _1690);
    float _1708 = _1700 * _1700;
    float _1710 = fma(_1698, _1698, _1706);
    float _1712 = fma(_1702, _1702, _1708);
    float _1714 = rsqrt(_1710);
    float _1716 = fma(_1704, _1704, _1712);
    float _1718 = rsqrt(_1716);
    float _1720 = _1674 * _1714;
    float _1722 = sqrt(_1710);
    float _1724 = _1682 * _1714;
    float _1726 = _1698 * _1714;
    float _1728 = _1700 * _1718;
    float _1730 = _1702 * _1718;
    float _1732 = _1720 * _1728;
    float _1734 = fma(_1724, _1730, _1732);
    float _1736 = _1704 * _1718;
    float _1738 = fma(_1726, _1736, _1734);
    float _1740 = _1738 * _1722;
    float _1742 = fma(_1724, _1740, _1702);
    float _1744 = fma(_1726, _1740, _1704);
    float _1746 = fma(_1720, _1740, _1700);
    float _1748 = _1020 + _1742;
    float _1750 = _1080 + _1744;
    float _1752 = _1172 + _1746;
    float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1756 = _1748 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1760 = _1750 + _1758;
    float _1762 = _1756 * _1756;
    float _1764 = _1760 * _1760;
    float _1766 = _1762 + _1764;
    float _1768 = sqrt(_1766);
    bool _1770 = _1768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = _1740;
    float _1774 = _1700;
    float _1776 = _1762;
    float _1778 = _1748;
    float _1780 = _1750;
    if (!_1770)
    {
        _1772 = _1764;
    }
    float _1782 = _1772;
    float _1784 = _1782;
    if (!_1770)
    {
        _1774 = _1752;
    }
    float _1786 = _1774;
    bool _1788 = !_1770;
    float _1790 = _1786;
    if (!_1788)
    {
        float _1792 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1796 = _1768 + _1794;
        float _1798 = _1752 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1800 = rsqrt(_1766);
        float _1802 = _1796 * _1792;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1804 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = _1804 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        float _1814 = fma(_1808, _1798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1816 = _1800 * _1814;
        float _1818 = _1812 + (-1.0);
        float _1820 = _1760 * _1816;
        float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1824 = _1756 * _1816;
        float _1826 = fma(_1752, _1812, _1822);
        float _1828 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1830 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1832 = _1824 * _1824;
        float _1834 = _1820 * _1820;
        _1790 = _1826;
        _1776 = _1832;
        _1784 = _1834;
        _1778 = _1828;
        _1780 = _1830;
    }
    float _1836 = _1790;
    float _1838 = _1776;
    float _1840 = _1784;
    float _1842 = _1778;
    float _1844 = _1780;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1848 = _1836 + _1846;
    out.m_52.x = _812;
    out.m_52.y = _814;
    out.m_52.z = _752;
    out.m_52.w = _780;
    float _1850 = fma(_1848, _1848, _1838);
    out.m_50.x = _756;
    out.m_50.y = _768;
    out.m_50.z = _770;
    float _1852 = _1850 + _1840;
    float _1854 = sqrt(_1852);
    bool _1856 = _1854 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1858 = isnan(_1854);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1864 = _1860 || _1862;
    float _1866 = _1838;
    if (!_1864)
    {
        _1866 = 1.0;
    }
    float _1868 = _1866;
    bool _1870 = !_1864;
    float _1872 = _1868;
    if (!_1870)
    {
        bool _1874 = _1854 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1876 = isnan(_1854);
        bool _1878 = _1874 || _1876;
        bool _1880 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1882 = _1878 || _1880;
        if (!_1882)
        {
            float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1886 = _1854 + _1884;
            float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1890 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1888;
            float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1894 = _1892 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1896 = 1.0 / _1890;
            float _1898 = _1886 * _1896;
            float _1900 = fma(_1898, _1894, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1872 = _1900;
            _1902 = true;
        }
        else
        {
            bool _1904 = _1854 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1906 = isnan(_1854);
            bool _1908 = _1904 || _1906;
            bool _1910 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1912 = _1908 || _1910;
            if (!_1912)
            {
                float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1916 = _1854 + _1914;
                float _1918 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1920 = _1918 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1922 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1924 = _1922 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1926 = 1.0 / _1920;
                float _1928 = _1916 * _1926;
                float _1930 = fma(_1928, _1924, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1872 = _1930;
                _1902 = true;
            }
            else
            {
                _1872 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1902 = false;
    float _1932 = _1872;
    float _1934 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1936 = _1836 + _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1940 = _1842 + _1938;
    float _1942 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1944 = _1844 + _1942;
    out.m_40.x = 1.0;
    float _1946 = fma(_1936, _1932, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1948 = fma(_1940, _1932, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1950 = fma(_1944, _1932, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1952 = -_1334;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1946);
    float _1956 = -_1338;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1948);
    float _1960 = -_1382;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _1964 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1968 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1970 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1972 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1974 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1966);
    float _1976 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1968);
    float _1978 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1970);
    float _1980 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1972);
    float _1982 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1974);
    float _1984 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1976);
    float _1986 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1978);
    float _1988 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1990 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1992 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1996 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2002 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2004 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1996);
    float _2006 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1998);
    float _2008 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2000);
    float _2010 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2002);
    float _2012 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2004);
    float _2014 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2006);
    float _2016 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2008);
    float _2018 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2010);
    float _2020 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2012);
    float _2022 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2024 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2014);
    float _2026 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2016);
    float _2028 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2018);
    out.m_62.w = _2022;
    out.gl_Position.x = _2024;
    out.gl_Position.y = _2026;
    out.gl_Position.z = _2020;
    out.gl_Position.w = _2028;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1902 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_37.w;
    float _84 = trunc(_82);
    int _86 = int(_84);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_40.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2086 = as_type<float>(_102);
        out.gl_Position.z = _2086;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_42.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = _120;
    if (_116)
    {
        float _124 = float(_86);
        _94 = _124;
    }
    float _126 = _94;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_40.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _104 = as_type<int>(_138);
    }
    int _140 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2156 = as_type<float>(_140);
        out.gl_Position.z = _2156;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    int _142 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _144 = _142;
    int _146 = 0;
    int _148 = _77(_144, _146, (*spvDescriptorSet0.support_buffer));
    float _150 = in.m_44.z;
    float _152 = in.m_46.z;
    float _154 = _120 + _150;
    float _156 = _154 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _158 = trunc(_152);
    int _160 = int(_158);
    float _162 = float(_148);
    int _164 = abs(_148);
    bool _166 = _148 == 0;
    float _168 = _156 * _162;
    float _170 = float(uint(_164));
    float _172 = trunc(_168);
    int _174 = int(_172);
    float _176 = 1.0 / _170;
    int _178 = abs(_174);
    uint _181 = uint(int(uint(_174) >> uint(31)));
    float _183 = float(uint(_178));
    int _185 = ~int(_181);
    int _187 = _185 + 1;
    int _189 = as_type<int>(_176) + (-2);
    float _191 = as_type<float>(_189) * _183;
    float _193 = trunc(_191);
    float _195 = precise::max(_193, 0.0);
    uint _197 = uint(_195);
    int _199 = ~int(_197);
    int _201 = _199 + 1;
    int _203 = _201 * _164;
    int _205 = _203 + _178;
    float _207 = float(uint(_205));
    float _209 = as_type<float>(_189) * _207;
    float _211 = trunc(_209);
    float _213 = precise::max(_211, 0.0);
    uint _215 = uint(_213);
    int _217 = int(_197) + int(_215);
    int _219 = ~_217;
    int _221 = _219 + 1;
    int _223 = _221 * _164;
    int _225 = _223 + _178;
    bool _227 = uint(_225) >= uint(_164);
    bool _229 = !_227;
    int _231 = _229 ? 0 : (-1);
    int _233 = ~_217;
    int _235 = _233 + _231;
    int _237 = _235 + 1;
    int _239 = _237 * _164;
    int _241 = _239 + _178;
    int _243 = _241 ^ _187;
    int _245 = ~_187;
    int _247 = _245 + _243;
    int _249 = _247 + 1;
    bool _251 = !_166;
    int _253 = _251 ? _249 : (-1);
    int _255 = _253;
    int _257 = 0;
    int _259 = _78(_255, _257, (*spvDescriptorSet0.support_buffer));
    int _261 = _160;
    int _263 = 0;
    int _265 = _78(_261, _263, (*spvDescriptorSet0.support_buffer));
    float4 _268 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_259, _265)), 0).xyzw;
    float _270 = _268.x;
    float _272 = _268.y;
    float _274 = _268.z;
    float _276 = _268.w;
    float _278 = in.m_44.x;
    float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _282 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _284 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _286 = in.m_44.y;
    float _288 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _290 = in.m_46.x;
    float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _294 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _296 = _294 != 0;
    float _298 = in.m_46.y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _302 = _282 * _280;
    float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _308 = _306 != 0;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _314 = _312 != 0;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _318 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[20].x, _302);
    float _320 = _284 * _292;
    float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _324 = _286 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _326 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[20].y, _320);
    bool _328 = _278 > 0.5;
    bool _330 = _328 && _308;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _334 = fma(_324, -2.0, _316);
    float _336 = _318 * 6.283185482025146484375;
    float _338 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[78].w, _300);
    float _340 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[79].z, _332);
    bool _342 = _286 > 0.5;
    bool _344 = _342 && _314;
    float _346 = _336 * 0.15915493667125701904296875;
    float _348 = _326 * 6.283185482025146484375;
    float _350 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[79].x, _340);
    float _352 = floor(_326);
    float _354 = _348 * 0.15915493667125701904296875;
    float _356 = _278 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _358 = 0.0;
    float _360 = _350;
    float _362 = _298;
    if (_308)
    {
        _358 = _290;
    }
    float _364 = _358;
    float _366 = _350 * (-0.15915493667125701904296875);
    bool _368 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _372 = _368 || _370;
    bool _374 = isnan(1.0);
    bool _376 = _372 || _374;
    float _378 = -_310;
    float _380 = fma(_356, 2.0, _378);
    float _382 = floor(_318);
    float _384 = _364;
    if (_330)
    {
        float _386 = -_364;
        float _388 = _386 + 1.0;
        _384 = _388;
    }
    float _390 = _384;
    if (!_308)
    {
        _360 = _290;
    }
    float _392 = _360;
    float _394 = _304 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _396 = _322 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _398 = _392;
    float _400 = _394;
    if (_308)
    {
        _398 = _390;
    }
    float _402 = _398;
    if (_344)
    {
        float _404 = -_298;
        float _406 = _404 + 1.0;
        _362 = _406;
    }
    float _408 = _362;
    float _410 = _346 * 6.283185482025146484375;
    float _412 = cos(_410);
    float _414 = -_352;
    float _416 = _326 + _414;
    float _418 = fma(_394, _402, -0.5);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _422 = fma(_396, _408, -0.5);
    if (!_376)
    {
        float _424 = _288 * _288;
        float _426 = _424 * 0.5;
        _400 = _426;
    }
    float _428 = _400;
    float _430 = _354 * 6.283185482025146484375;
    float _432 = cos(_430);
    float _434 = -_382;
    float _436 = _318 + _434;
    float _438 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[78].z, _420);
    float _440 = _428;
    if (!_376)
    {
        float _442 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _440 = _442;
    }
    float _444 = _440;
    float _446 = _366 * 6.283185482025146484375;
    float _448 = sin(_446);
    float _450 = fma(_412, 0.5, 0.5);
    float _452 = _412;
    float _454 = _444;
    if (!_376)
    {
        _452 = _288;
    }
    float _456 = _452;
    float _458 = _366 * 6.283185482025146484375;
    float _460 = cos(_458);
    float _462 = fma(_432, 0.5, 0.5);
    float _464 = _448 * _422;
    bool _466 = !_376;
    float _468 = _456;
    if (!_466)
    {
        float _470 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _472 = log2(_470);
        float _474 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _476 = _474 + 1.0;
        float _478 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _480 = _288 * _472;
        float _482 = 1.0 / _476;
        float _484 = _478 * 0.693147182464599609375;
        float _486 = exp2(_480);
        float _488 = 1.0 / _484;
        float _490 = _486 + (-1.0);
        float _492 = -_490;
        float _494 = fma(_492, _488, _288);
        float _496 = _494 * _482;
        float _498 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _454 = _498;
    }
    float _500 = _454;
    bool _502 = !_376;
    if (!_502)
    {
        float _504 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _506 = log2(_504);
        float _508 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _510 = _508 + 1.0;
        float _512 = 1.0 / _510;
        float _514 = _288 * _506;
        float _516 = exp2(_514);
        float _518 = -_516;
        float _520 = _518 + 1.0;
        float _522 = _520 * _512;
        _468 = _522;
    }
    float _524 = _468;
    float _526 = _460 * _422;
    float _528 = -_464;
    float _530 = fma(_460, _418, _528);
    float _532 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _438);
    float _534 = fma(_448, _418, _526);
    bool _536 = _436 < 0.5;
    float _538 = float(_536);
    float _540 = in.m_42.x;
    float _542 = in.m_42.y;
    float _544 = in.m_42.z;
    float _546 = -_436;
    float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _550 = -_450;
    float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _554 = -_538;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _564 = _562 != 0;
    float _566 = -_120;
    float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[76].x, _380);
    bool _570 = _416 < 0.5;
    float _572 = float(_570);
    float _574 = -_416;
    float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _578 = !_296;
    int _580 = _578 ? 0 : 1;
    float _582 = -_462;
    float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _586 = !_560;
    int _588 = _586 ? 0 : 1;
    float _590 = -_572;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _594 = fma(_532, _530, _568);
    int _596 = abs(_580);
    float _598 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _334);
    int _600 = abs(_588);
    float _602 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _338);
    bool _604 = !_564;
    int _606 = _604 ? 0 : 1;
    float _608 = _500 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _610 = -_598;
    float _612 = fma(_602, _534, _610);
    int _614 = abs(_606);
    float _616 = fma(_524, _540, _608);
    float _618 = float(_600);
    float _620 = _500 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _622 = float(_596);
    float _624 = _500 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _626 = abs(_548);
    float _628 = _618 * _626;
    float _630 = abs(_576);
    float _632 = _618 * _630;
    int _634 = _253 + 1;
    float _636 = fma(_524, _544, _624);
    float _638 = float(_614);
    float _640 = fma(_622, _552, _628);
    float _642 = fma(_622, _584, _632);
    float _644 = fma(_524, _542, _620);
    uint _646 = as_type<uint>(half2(float2(_276, 0.0)));
    float _648 = abs(_556);
    float _650 = fma(_638, _648, _640);
    int _652 = abs(_634);
    float _654 = abs(_592);
    float _656 = fma(_638, _654, _642);
    uint _658 = extract_bits(_646, 0u, 8u);
    int _660 = int(_658) & 255;
    uint _662 = extract_bits(_646, 8u, 8u);
    int _664 = int(_662) & 255;
    int _666 = _664 << 8;
    int _668 = _660 | _666;
    float _670 = in.m_48.x;
    float _672 = in.m_48.y;
    float _674 = in.m_48.z;
    float _676 = in.m_48.w;
    float _678 = float(uint(_652));
    uint _680 = uint(int(uint(_634) >> uint(31)));
    float _682 = as_type<float>(_189) * _678;
    int _684 = ~int(_680);
    int _686 = _684 + 1;
    float _688 = trunc(_682);
    float _690 = precise::max(_688, 0.0);
    uint _692 = uint(_690);
    float _694 = _670 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _696 = _674 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _698 = ~int(_692);
    int _700 = _698 + 1;
    int _702 = _700 * _164;
    int _704 = _702 + _652;
    float _706 = float(uint(_704));
    float _708 = as_type<float>(_189) * _706;
    float _710 = in.m_37.x;
    float _712 = in.m_37.y;
    float _714 = in.m_37.z;
    float _716 = trunc(_708);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    int _722 = int(_692) + int(_720);
    int _724 = ~_722;
    int _726 = _724 + 1;
    float _728 = fma(_616, _676, _710);
    float _730 = fma(_644, _676, _712);
    float _732 = fma(_636, _676, _714);
    int _734 = _726 * _164;
    int _736 = _734 + _652;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _742 = uint(_736) >= uint(_164);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _748 = !_742;
    int _750 = _748 ? 0 : (-1);
    float _752 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _754 = _668 >= 32768;
    float _756 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _758 = ~_722;
    int _760 = _758 + _750;
    int _762 = _760 + 1;
    float _764 = _672 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _766 = _668 + (-1024);
    float _768 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _770 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _772 = _762 * _164;
    int _774 = _772 + _652;
    float _776 = _612 + 0.5;
    out.m_50.x = _756;
    out.m_50.y = _768;
    out.m_50.z = _770;
    int _778 = _774 ^ _686;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _782 = _766;
    if (_754)
    {
        int _784 = ~_668;
        int _786 = _784 + 33792;
        int _788 = _786 + 1;
        _782 = _788;
    }
    int _790 = _782;
    int _792 = ~_686;
    int _794 = _792 + _778;
    int _796 = _794 + 1;
    int _798 = _790 + 30719;
    float _800 = float(_798);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _804 = !_166;
    int _806 = _804 ? _796 : (-1);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _810 = fma(_800, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _812 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _816 = _594 + 0.5;
    float _818 = abs(_810);
    float _820 = -_818;
    float _822 = _820 + 1.0;
    out.m_52.x = _812;
    out.m_52.y = _814;
    out.m_52.z = _752;
    out.m_52.w = _780;
    int _824 = as_type<int>(_822) + (-218103808);
    bool _826 = uint(_824) >= 1920991232u;
    bool _828 = !_826;
    if (!_828)
    {
        int _830;
        _75(_830, out.gl_Position, out.gl_PointSize);
    }
    int _832 = _806;
    int _834 = 0;
    int _836 = _78(_832, _834, (*spvDescriptorSet0.support_buffer));
    int _838 = _160;
    int _840 = 0;
    int _842 = _78(_838, _840, (*spvDescriptorSet0.support_buffer));
    float4 _844 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_836, _842)), 0).xyzw;
    float _846 = _844.x;
    float _848 = _844.y;
    float _850 = _844.z;
    float _852 = _844.w;
    float _854 = floor(_168);
    float _856 = -_854;
    float _858 = _168 + _856;
    uint _860 = as_type<uint>(half2(float2(_852, 0.0)));
    float _862 = -_270;
    float _864 = _862 + _846;
    float _866 = -_272;
    float _868 = _866 + _848;
    uint _870 = extract_bits(_860, 0u, 8u);
    int _872 = int(_870) & 255;
    uint _874 = extract_bits(_860, 8u, 8u);
    int _876 = int(_874) & 255;
    int _878 = _876 << 8;
    int _880 = _872 | _878;
    float _882 = fma(_858, _864, _270);
    float _884 = fma(_858, _868, _272);
    bool _886 = _880 >= 32768;
    int _888 = _880 + (-1024);
    int _890 = _888;
    if (_886)
    {
        int _892 = ~_880;
        int _894 = _892 + 33792;
        int _896 = _894 + 1;
        _890 = _896;
    }
    int _898 = _890;
    int _900 = _898 + 30719;
    float _902 = float(_900);
    float _904 = fma(_902, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _906 = abs(_904);
    float _908 = -_906;
    float _910 = _908 + 1.0;
    int _912 = as_type<int>(_910) + (-218103808);
    bool _914 = uint(_912) >= 1920991232u;
    float _916 = -_274;
    float _918 = _916 + _850;
    float _920 = fma(_858, _918, _274);
    bool _922 = !_914;
    float _924 = _920;
    if (!_922)
    {
        int _926;
        _75(_926, out.gl_Position, out.gl_PointSize);
    }
    float _928 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _930 = log2(_928);
    float _932 = in.m_44.x;
    float _934 = in.m_44.y;
    float _936 = in.m_44.z;
    float _938 = _730 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _940 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    out.m_54.x = _816;
    out.m_54.y = _776;
    bool _950 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _952 = isnan(1.0);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _958 = _954 || _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _962 = 1.0 + _960;
    float _964 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[5].x, _938);
    float _966 = in.m_56.w;
    float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _970 = _930 * _120;
    float _972 = _730 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _974 = _730 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _976 = 1.0 / _962;
    float _978 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[5].z, _964);
    float _980 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[4].x, _972);
    float _982 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[6].x, _974);
    float _984 = _936 * 2.0;
    float _986 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[4].z, _980);
    float _988 = exp2(_970);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1000 = _998 != 0;
    float _1002 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1006 = _1004 != 0;
    float _1008 = _934 * 2.0;
    out.m_58.w = _966;
    bool _1010 = !_992;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = floor(_984);
    bool _1016 = !_996;
    int _1018 = _1016 ? 0 : 1;
    float _1020 = _986 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1022 = _936 + (-0.5);
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1026 = _1020 + _1024;
    float _1028 = -_988;
    float _1030 = _1028 + 1.0;
    float _1032 = floor(_1008);
    float _1034 = _948 ? _1030 : 0.0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1038 = _1036 != 0;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1042 = _1040 != 0;
    float _1044 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[6].z, _982);
    if (_958)
    {
        float _1046 = _1034 * _976;
        _122 = _1046;
    }
    float _1048 = _122;
    float _1050 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1052 = _1014 >= 0.0;
    bool _1054 = isnan(_1014);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1002);
    float _1064 = _932 * 2.0;
    float _1066 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1050);
    int _1068 = _1060 ? 0 : 1;
    float _1070 = _932 + _936;
    bool _1072 = _1014 > 0.0;
    float _1074 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1066);
    float _1076 = floor(_1064);
    float _1078 = _1070 + (-1.0);
    float _1080 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1082 = ~_1068;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1090 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1092 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1088);
    int _1094 = _1086;
    if (!_1072)
    {
        int _1096 = ~_1068;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = _934 + _932;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1106 = _1080 + _1104;
    bool _1108 = !_1000;
    int _1110 = _1108 ? 0 : 1;
    float _1112 = _1102 + (-1.0);
    bool _1114 = _1076 >= 0.0;
    bool _1116 = isnan(_1076);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    int _1124 = abs(_1110);
    float _1126 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1138 = _1136 != 0;
    int _1140 = _1122 ? 0 : 1;
    float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _1144 = _1032 >= 0.0;
    bool _1146 = isnan(_1032);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    bool _1154 = !_1130;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1152 ? 0 : 1;
    bool _1160 = _1076 > 0.0;
    bool _1162 = _1032 > 0.0;
    int _1164 = ~_1158;
    int _1166 = _1164 + 1;
    int _1168 = _1166 + 1;
    float _1170 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1062);
    float _1172 = _978 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1174 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1092);
    float _1176 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _1178 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1182 = _1172 + _1180;
    int _1184 = _1168;
    if (!_1162)
    {
        int _1186 = ~_1158;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    float _1192 = _1176 * _1142;
    float _1194 = _1178 * _968;
    float _1196 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1198 = _934 + _936;
    float _1200 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1192);
    float _1202 = _932 + (-0.5);
    float _1204 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1196);
    float _1206 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1194);
    float _1208 = floor(_1200);
    float _1210 = _1182 * _1182;
    float _1212 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1204);
    float _1214 = _934 + (-0.5);
    bool _1216 = !_1138;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = fma(_1026, _1026, _1210);
    int _1222 = abs(_1156);
    float _1224 = _1200 + 0.25;
    bool _1226 = _1212 >= 0.0;
    float _1228 = floor(_1206);
    float _1230 = in.m_60.x;
    float _1232 = in.m_60.y;
    float _1234 = in.m_60.z;
    int _1236 = abs(_1218);
    float _1238 = _1206 + 0.25;
    int _1240 = ~_1140;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    int _1246 = _1244;
    if (!_1160)
    {
        int _1248 = ~_1140;
        int _1250 = _1248 + 1;
        _1246 = _1250;
    }
    int _1252 = _1246;
    float _1254 = fma(_1106, _1106, _1220);
    float _1256 = float(_1100);
    float _1258 = -_1208;
    float _1260 = _1200 + _1258;
    float _1262 = float(_1222);
    float _1264 = floor(_1224);
    float _1266 = float(_1236);
    float _1268 = _1200 * 6.283185482025146484375;
    float _1270 = float(_1190);
    float _1272 = _1262 * _1256;
    bool _1274 = _1260 >= 0.5;
    bool _1276 = isnan(_1260);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.5);
    bool _1282 = _1278 || _1280;
    float _1284 = -_1228;
    float _1286 = _1206 + _1284;
    float _1288 = _1260;
    if (_1226)
    {
        _1288 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1290 = _1288;
    float _1292 = rsqrt(_1254);
    float _1294 = _1266 * _1270;
    float _1296 = _1206 * 6.283185482025146484375;
    float _1298 = _1272 * (-2.0);
    float _1300 = _1294 * (-2.0);
    int _1302 = as_type<int>(_1294);
    if (_1226)
    {
        float _1304 = _1290 * 5.0;
        _1302 = as_type<int>(_1304);
    }
    int _1306 = _1302;
    float _1308 = floor(_1238);
    float _1310 = fma(_1300, _1234, _1234);
    float _1312 = fma(_1090, _1300, _1090);
    bool _1314 = !_1282;
    float _1316 = _1314 ? 0.5 : (-0.5);
    if (_1226)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3884 = as_type<float>(_1306);
        out.gl_Position.z = _3884;
    }
    float _1318 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1310);
    bool _1320 = _1286 >= 0.5;
    bool _1322 = isnan(_1286);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.5);
    bool _1328 = _1324 || _1326;
    float _1330 = -_1264;
    float _1332 = _1224 + _1330;
    float _1334 = _1182 * _1292;
    int _1336 = abs(_1018);
    float _1338 = _1026 * _1292;
    float _1340 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1342 = _1340 * 2.0;
    float _1344 = -_1334;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1348 = fma(_1312, _1048, _1318);
    float _1350 = -_1338;
    float _1352 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1026);
    float _1354 = _1332;
    if (_1226)
    {
        out.m_40.x = 0.0;
    }
    float _1356 = _1268 * 0.15915493667125701904296875;
    float _1358 = float(_1336);
    float _1360 = _1346 * _1346;
    int _1362 = abs(_1012);
    float _1364 = -_1308;
    float _1366 = _1238 + _1364;
    bool _1368 = !_1038;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_1352, _1352, _1360);
    float _1374 = _1356 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = _1358 * _1342;
    float _1380 = _1296 * 0.15915493667125701904296875;
    float _1382 = _1106 * _1292;
    bool _1384 = _1332 > 0.5;
    int _1386 = abs(_1370);
    float _1388 = -_1382;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1106);
    float _1392 = _1380 * 6.283185482025146484375;
    float _1394 = sin(_1392);
    bool _1396 = !_1328;
    float _1398 = _1396 ? 0.5 : (-0.5);
    float _1400 = fma(_1390, _1390, _1372);
    bool _1402 = !_1006;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = float(_1386);
    float _1408 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1410 = rsqrt(_1074);
    bool _1412 = _1366 > 0.5;
    float _1414 = _1366;
    if (_1384)
    {
        float _1416 = -_1332;
        float _1418 = _1416 + 1.0;
        _1354 = _1418;
    }
    float _1420 = _1354;
    float _1422 = float(_1362);
    float _1424 = fma(_1420, 4.0, -1.0);
    float _1426 = fma(_1422, _1408, _1378);
    float _1428 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1430 = _1428 * 2.0;
    float _1432 = rsqrt(_1174);
    float _1434 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1436 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1438 = _1406 * _1430;
    int _1440 = abs(_1404);
    if (_1412)
    {
        float _1442 = -_1366;
        float _1444 = _1442 + 1.0;
        _1414 = _1444;
    }
    float _1446 = _1414;
    bool _1448 = !_1042;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = sqrt(_1400);
    float _1454 = float(_1440);
    float _1456 = fma(_1446, 4.0, -1.0);
    float _1458 = float(_1124);
    int _1460 = abs(_1450);
    float _1462 = fma(_1454, _1434, _1438);
    bool _1464 = !_1134;
    int _1466 = _1464 ? 0 : 1;
    float _1468 = rsqrt(_1170);
    float _1470 = fma(_1458, _1436, _1426);
    float _1472 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1474 = abs(_1466);
    float _1476 = fma(_1126, _1298, _1126);
    float _1478 = float(_1460);
    float _1480 = fma(_1470, 3.1415927410125732421875, _1230);
    float _1482 = sqrt(_1170);
    float _1484 = fma(_1478, _1472, _1462);
    float _1486 = fma(_1480, _1298, _1480);
    if (_1226)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1488 = -_1334;
    float _1490 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1172);
    float _1492 = float(_1252);
    float _1494 = -_1338;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1020);
    float _1498 = float(_1474);
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1502 = _1490 + _1500;
    float _1504 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1486);
    float _1506 = -_1382;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1512 = _1496 + _1510;
    float _1514 = _1498 * _1492;
    float _1516 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = fma(_1484, 3.1415927410125732421875, _1232);
    float _1524 = _1198 + (-1.0);
    float _1526 = _1514 * (-2.0);
    float _1528 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1516);
    float _1530 = fma(_1476, _1048, _1504);
    float _1532 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1534 = fma(_1522, _1526, _1522);
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1528);
    float _1538 = _1348 * 0.15915493667125701904296875;
    float _1540 = fma(_1532, _1526, _1532);
    float _1542 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1534);
    float _1544 = _1530 * 0.15915493667125701904296875;
    bool _1546 = _1536 >= 0.0;
    float _1548 = _884 * _1410;
    float _1550 = fma(_1540, _1048, _1542);
    float _1552 = _1538 * 6.283185482025146484375;
    float _1554 = sin(_1552);
    float _1556 = _920 * _1432;
    float _1558 = _650 * _694;
    float _1560 = _1550 * 0.15915493667125701904296875;
    float _1562 = _656 * _764;
    float _1564 = _1482 * _1548;
    float _1566 = _882 * _1468;
    float _1568 = _1538 * 6.283185482025146484375;
    float _1570 = cos(_1568);
    float _1572 = _1292 * _1452;
    if (_1546)
    {
        _924 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1574 = _924;
    float _1576 = _1558 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1578 = _1562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1580 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1582 = _1482 * _1566;
    int _1584 = as_type<int>(_1574);
    if (_1546)
    {
        float _1586 = _1574 * 5.0;
        _1584 = as_type<int>(_1586);
    }
    int _1588 = _1584;
    float _1590 = _1544 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = _1482 * _1556;
    if (_1546)
    {
        out.m_40.x = 0.0;
    }
    float _1596 = _1576 * _1572;
    float _1598 = _1578 * _1572;
    float _1600 = _1580 * _1572;
    if (_1546)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4317 = as_type<float>(_1588);
        out.gl_Position.z = _4317;
    }
    float _1602 = _1544 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    float _1606 = _1560 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    float _1610 = _1592 * _1554;
    float _1612 = _1592 * _1570;
    float _1614 = _1560 * 6.283185482025146484375;
    float _1616 = sin(_1614);
    float _1618 = _1604 * _1554;
    float _1620 = _1608 * _1554;
    float _1622 = _1604 * _1570;
    float _1624 = _1608 * _1570;
    float _1626 = _1592 * _1608;
    if (_1546)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1628 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1564);
    float _1630 = _1604 * _1608;
    float _1632 = -_1618;
    float _1634 = fma(_1616, _1612, _1632);
    float _1636 = -_1612;
    float _1638 = fma(_1616, _1618, _1636);
    float _1640 = _1598 * _1628;
    float _1642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1582);
    float _1644 = fma(_1616, _1610, _1622);
    float _1646 = fma(_1616, _1622, _1610);
    float _1648 = _1634 * _1640;
    float _1650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1594);
    float _1652 = _1596 * _1642;
    float _1654 = _1644 * _1640;
    float _1656 = _1626 * _1640;
    float _1658 = _1600 * _1650;
    float _1660 = fma(_1624, _1652, _1648);
    float _1662 = fma(_1620, _1652, _1654);
    float _1664 = -_1616;
    float _1666 = fma(_1664, _1652, _1656);
    float _1668 = fma(_1646, _1658, _1660);
    float _1670 = fma(_1638, _1658, _1662);
    float _1672 = fma(_1630, _1658, _1666);
    float _1674 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1676 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1678 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1682 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1684 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1676);
    float _1686 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1678);
    float _1688 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1680);
    float _1690 = _1674 * _1674;
    float _1692 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1684);
    float _1694 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1686);
    float _1696 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1688);
    float _1698 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1700 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1702 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1706 = fma(_1682, _1682, _1690);
    float _1708 = _1700 * _1700;
    float _1710 = fma(_1698, _1698, _1706);
    float _1712 = fma(_1702, _1702, _1708);
    float _1714 = rsqrt(_1710);
    float _1716 = fma(_1704, _1704, _1712);
    float _1718 = rsqrt(_1716);
    float _1720 = _1674 * _1714;
    float _1722 = sqrt(_1710);
    float _1724 = _1682 * _1714;
    float _1726 = _1698 * _1714;
    float _1728 = _1700 * _1718;
    float _1730 = _1702 * _1718;
    float _1732 = _1720 * _1728;
    float _1734 = fma(_1724, _1730, _1732);
    float _1736 = _1704 * _1718;
    float _1738 = fma(_1726, _1736, _1734);
    float _1740 = _1738 * _1722;
    float _1742 = fma(_1724, _1740, _1702);
    float _1744 = fma(_1726, _1740, _1704);
    float _1746 = fma(_1720, _1740, _1700);
    float _1748 = _1020 + _1742;
    float _1750 = _1080 + _1744;
    float _1752 = _1172 + _1746;
    float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1756 = _1748 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1760 = _1750 + _1758;
    float _1762 = _1756 * _1756;
    float _1764 = _1760 * _1760;
    float _1766 = _1762 + _1764;
    float _1768 = sqrt(_1766);
    bool _1770 = _1768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = _1740;
    float _1774 = _1700;
    float _1776 = _1762;
    float _1778 = _1748;
    float _1780 = _1750;
    if (!_1770)
    {
        _1772 = _1764;
    }
    float _1782 = _1772;
    float _1784 = _1782;
    if (!_1770)
    {
        _1774 = _1752;
    }
    float _1786 = _1774;
    bool _1788 = !_1770;
    float _1790 = _1786;
    if (!_1788)
    {
        float _1792 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1796 = _1768 + _1794;
        float _1798 = _1752 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1800 = rsqrt(_1766);
        float _1802 = _1796 * _1792;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1804 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = _1804 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        float _1814 = fma(_1808, _1798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1816 = _1800 * _1814;
        float _1818 = _1812 + (-1.0);
        float _1820 = _1760 * _1816;
        float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1824 = _1756 * _1816;
        float _1826 = fma(_1752, _1812, _1822);
        float _1828 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1830 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1832 = _1824 * _1824;
        float _1834 = _1820 * _1820;
        _1790 = _1826;
        _1776 = _1832;
        _1784 = _1834;
        _1778 = _1828;
        _1780 = _1830;
    }
    float _1836 = _1790;
    float _1838 = _1776;
    float _1840 = _1784;
    float _1842 = _1778;
    float _1844 = _1780;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1848 = _1836 + _1846;
    out.m_52.x = _812;
    out.m_52.y = _814;
    out.m_52.z = _752;
    out.m_52.w = _780;
    float _1850 = fma(_1848, _1848, _1838);
    out.m_50.x = _756;
    out.m_50.y = _768;
    out.m_50.z = _770;
    float _1852 = _1850 + _1840;
    float _1854 = sqrt(_1852);
    bool _1856 = _1854 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1858 = isnan(_1854);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1864 = _1860 || _1862;
    float _1866 = _1838;
    if (!_1864)
    {
        _1866 = 1.0;
    }
    float _1868 = _1866;
    bool _1870 = !_1864;
    float _1872 = _1868;
    if (!_1870)
    {
        bool _1874 = _1854 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1876 = isnan(_1854);
        bool _1878 = _1874 || _1876;
        bool _1880 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1882 = _1878 || _1880;
        if (!_1882)
        {
            float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1886 = _1854 + _1884;
            float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1890 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1888;
            float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1894 = _1892 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1896 = 1.0 / _1890;
            float _1898 = _1886 * _1896;
            float _1900 = fma(_1898, _1894, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1872 = _1900;
            _1902 = true;
        }
        else
        {
            bool _1904 = _1854 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1906 = isnan(_1854);
            bool _1908 = _1904 || _1906;
            bool _1910 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1912 = _1908 || _1910;
            if (!_1912)
            {
                float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1916 = _1854 + _1914;
                float _1918 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1920 = _1918 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1922 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1924 = _1922 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1926 = 1.0 / _1920;
                float _1928 = _1916 * _1926;
                float _1930 = fma(_1928, _1924, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1872 = _1930;
                _1902 = true;
            }
            else
            {
                _1872 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1902 = false;
    float _1932 = _1872;
    float _1934 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1936 = _1836 + _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1940 = _1842 + _1938;
    float _1942 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1944 = _1844 + _1942;
    out.m_40.x = 1.0;
    float _1946 = fma(_1936, _1932, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1948 = fma(_1940, _1932, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1950 = fma(_1944, _1932, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1952 = -_1334;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1946);
    float _1956 = -_1338;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1948);
    float _1960 = -_1382;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _1964 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1968 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1970 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1972 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1974 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1966);
    float _1976 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1968);
    float _1978 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1970);
    float _1980 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1972);
    float _1982 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1974);
    float _1984 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1976);
    float _1986 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1978);
    float _1988 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1990 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1992 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1996 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2002 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2004 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1996);
    float _2006 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1998);
    float _2008 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2000);
    float _2010 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2002);
    float _2012 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2004);
    float _2014 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2006);
    float _2016 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2008);
    float _2018 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2010);
    float _2020 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2012);
    float _2022 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2024 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2014);
    float _2026 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2016);
    float _2028 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2018);
    out.m_62.w = _2022;
    out.gl_Position.x = _2024;
    out.gl_Position.y = _2026;
    out.gl_Position.z = _2020;
    out.gl_Position.w = _2028;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

