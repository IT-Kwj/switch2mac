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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _440 = false;
    bool _168 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1965 = as_type<float>(_104);
        out.gl_Position.z = _1965;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    float _110 = float(_90);
    float _112 = -_108;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_108);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    bool _126 = _114 >= _110;
    bool _128 = !_124;
    bool _130 = _126 || _128;
    float _132 = _108;
    float _134 = _114;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2030 = as_type<float>(_140);
        out.gl_Position.z = _2030;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = 1.0 / _110;
    bool _144 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _146 = _114 * _142;
    bool _148 = !_144;
    float _166;
    if (!_148)
    {
        float _150 = in.m_49.x;
        float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _154 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _156 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _158 = _156 * _152;
        float _160 = floor(_158);
        float _162 = -_160;
        float _164 = _158 + _162;
        _166 = _164;
        _168 = true;
    }
    else
    {
        _166 = _146;
    }
    _168 = false;
    float _170 = _166;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _174 = _170 + _172;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _178 = _170 + _176;
    bool _180 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _182 = isnan(_170);
    bool _184 = _180 || _182;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _188 = _184 || _186;
    float _190 = float(_188);
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _198 = _196 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _170 + _208;
    float _212 = 1.0 / _198;
    float _214 = 1.0 / _194;
    bool _216 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _218 = isnan(_170);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    bool _228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _230 = 1.0 / _202;
    float _232 = 1.0 / _206;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _170 + _234;
    float _238 = _174 * _214;
    bool _240 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _242 = isnan(_170);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = _236 * _212;
    float _254 = -_190;
    float _256 = _254 + 1.0;
    float _258 = _178 * _230;
    bool _260 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _262 = isnan(_170);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = _250 * _256;
    float _278 = -_250;
    float _280 = _278 + 1.0;
    float _282 = -_270;
    float _284 = _282 + 1.0;
    float _286 = fma(_274, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = _210 * _232;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    float _298 = _270 * _280;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = fma(_292, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _306 = fma(_296, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _308 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_170);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _328 = fma(_302, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _330 = _318 * _284;
    float _332 = -_318;
    float _334 = _332 + 1.0;
    float _336 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_326, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = _226 * _334;
    float _342 = -_226;
    float _344 = _342 + 1.0;
    float _346 = _286 * _340;
    float _348 = _304 * _340;
    float _350 = _306 * _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].x, _346);
    float _358 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].y, _348);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].z, _350);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_354, _238, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_336, _330, _356);
    float _374 = fma(_328, _330, _358);
    float _376 = fma(_362, _238, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_338, _330, _364);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _388 = fma(_368, _238, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _394 = fma(_370, _298, _372);
    float _396 = fma(_382, _252, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _398 = fma(_386, _252, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _400 = fma(_376, _298, _374);
    float _402 = fma(_392, _252, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _404 = fma(_388, _298, _378);
    float _406 = fma(_396, _276, _394);
    float _408 = fma(_398, _276, _400);
    float _410 = fma(_402, _276, _404);
    float _412 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[147].x, _406);
    float _414 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[147].y, _408);
    float _416 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[147].z, _410);
    bool _418 = !_228;
    int _420 = as_type<int>(_374);
    float _438;
    if (!_418)
    {
        float _422 = in.m_49.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _430 = _428 * _424;
        float _432 = floor(_430);
        float _434 = -_432;
        float _436 = _430 + _434;
        _438 = _436;
        _440 = true;
    }
    else
    {
        _438 = _146;
    }
    _440 = false;
    float _442 = _438;
    float _444 = in.m_51.x;
    float _446 = in.m_51.y;
    float _448 = in.m_51.z;
    float _450 = in.m_49.z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _454 = abs(_446);
    float _456 = precise::max(0.0, _454);
    float _458 = precise::min(_456, 0.15600000321865081787109375);
    float _460 = _458 * 6.41025638580322265625;
    float _462 = _146 * _460;
    float _464 = _462 * 0.75;
    float _466 = _464 * 0.15915493667125701904296875;
    float _468 = in.m_49.x;
    float _470 = in.m_49.y;
    float _472 = _466 * 6.283185482025146484375;
    float _474 = sin(_472);
    float _476 = _466 * 6.283185482025146484375;
    float _478 = cos(_476);
    float _480 = _474 * _448;
    float _482 = _470 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _484 = _478 * _448;
    float _486 = -_480;
    float _488 = fma(_478, _444, _486);
    float _490 = _450 * 2.0;
    float _492 = _470 * 2.0;
    float _494 = fma(_474, _444, _484);
    float _496 = fma(_482, -2.0, _452);
    float _498 = floor(_492);
    float _500 = _494 * 0.0625;
    float _502 = abs(_488);
    float _504 = abs(_494);
    float _506 = precise::max(_502, _504);
    bool _508 = _506 >= 16.0;
    float _510 = _488 * 0.0625;
    float _512 = floor(_490);
    float _514 = _508 ? _500 : _494;
    float _516 = _508 ? _510 : _488;
    float _518 = _468 * 2.0;
    float _520 = abs(_514);
    bool _522 = _520 != 0.0;
    bool _524 = isnan(_520);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = abs(_516);
    bool _534 = _532 == 0.0;
    float _536 = floor(_518);
    float _538 = abs(_516);
    bool _540 = _538 == 0.0;
    bool _542 = !_530;
    bool _544 = _540 && _542;
    bool _546 = _512 > 0.0;
    bool _548 = _512 >= 0.0;
    bool _550 = isnan(_512);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _560 = _468 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _562 = false;
    if (_544)
    {
        bool _564 = as_type<int>(_516) >= 0;
        _562 = _564;
    }
    bool _566 = _562;
    float _568 = -_558;
    float _570 = fma(_560, 2.0, _568);
    int _572 = _566 ? (-1) : 0;
    if (_544)
    {
        int _574 = _566 ? 0 : 1078530011;
        _420 = _574;
    }
    int _576 = _420;
    int _578 = _576;
    if (_544)
    {
        int _580 = int(0x80000000) & as_type<int>(_514);
        int _582 = _576 | _580;
        _578 = _582;
    }
    int _584 = _578;
    bool _586 = !_530;
    bool _588 = _586 && _534;
    int _590 = _584;
    float _592 = as_type<float>(_584);
    if (!_588)
    {
        float _594 = abs(_514);
        bool _596 = _594 != as_type<float>(0x7f800000u /* inf */);
        bool _598 = isnan(_594);
        bool _600 = _596 || _598;
        bool _602 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _604 = _600 || _602;
        float _606 = abs(_516);
        bool _608 = _606 == as_type<float>(0x7f800000u /* inf */);
        float _610 = abs(_516);
        bool _612 = _610 == as_type<float>(0x7f800000u /* inf */);
        bool _614 = !_604;
        bool _616 = _612 && _614;
        if (_616)
        {
            bool _618 = as_type<int>(_516) >= 0;
            _572 = _618 ? (-1) : 0;
        }
        int _620 = _572;
        if (_616)
        {
            _590 = 1075235812;
        }
        int _622 = _590;
        int _624 = _622;
        if (_616)
        {
            int _626 = ~_620;
            int _628 = (_626 != 0) ? _622 : 1061752795;
            _624 = _628;
        }
        int _630 = _624;
        float _632 = as_type<float>(_630);
        if (_616)
        {
            int _634 = int(0x80000000) & as_type<int>(_514);
            int _636 = _630 | _634;
            _632 = as_type<float>(_636);
        }
        float _638 = _632;
        bool _640 = !_604;
        bool _642 = _640 && _608;
        _592 = _638;
        if (!_642)
        {
            float _644 = abs(_514);
            float _646 = abs(_516);
            float _648 = precise::max(_644, _646);
            float _650 = abs(_514);
            float _652 = abs(_516);
            float _654 = precise::min(_650, _652);
            float _656 = 1.0 / _648;
            float _658 = abs(_514);
            float _660 = abs(_516);
            bool _662 = _658 > _660;
            bool _664 = as_type<int>(_516) >= 0;
            float _666 = _654 * _656;
            int _668 = as_type<int>(_514) & int(0x80000000);
            float _670 = _666 * _666;
            float _672 = _670 + 11.33538818359375;
            float _674 = fma(_670, _672, 28.84246826171875);
            float _676 = fma(_670, _674, 19.6966705322265625);
            float _678 = fma(_670, -0.82336294651031494140625, -5.674867153167724609375);
            float _680 = abs(_514);
            float _682 = abs(_516);
            float _684 = _680 + _682;
            float _686 = fma(_670, _678, -6.565555095672607421875);
            float _688 = 1.0 / _676;
            bool _690 = _684 > as_type<float>(0x7f800000u /* inf */);
            bool _692 = isnan(_684);
            bool _694 = _690 || _692;
            bool _696 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _698 = _694 || _696;
            float _700 = _670 * _686;
            float _702 = _666 * _700;
            float _704 = fma(_702, _688, _666);
            float _706 = _704;
            _592 = _684;
            if (_662)
            {
                float _708 = -_704;
                float _710 = _708 + 1.57079637050628662109375;
                _706 = _710;
            }
            float _712 = _706;
            int _714 = as_type<int>(_712);
            if (!_664)
            {
                float _716 = -_712;
                float _718 = _716 + 3.1415927410125732421875;
                _714 = as_type<int>(_718);
            }
            int _720 = _714;
            if (!_698)
            {
                int _722 = _668 | _720;
                _592 = as_type<float>(_722);
            }
        }
    }
    float _724 = _592;
    float _726 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _728 = log2(_726);
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _740 = _738 != 0;
    float _742 = _470 + _468;
    int _744 = _556 ? 0 : 1;
    bool _746 = _536 >= 0.0;
    bool _748 = isnan(_536);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    float _756 = _742 + (-1.0);
    bool _758 = _536 > 0.0;
    bool _760 = !_732;
    int _762 = _760 ? 0 : 1;
    int _764 = ~_744;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    int _770 = _754 ? 0 : 1;
    int _772 = _768;
    if (!_546)
    {
        int _774 = ~_744;
        int _776 = _774 + 1;
        _772 = _776;
    }
    int _778 = _772;
    bool _780 = _498 > 0.0;
    bool _782 = _498 >= 0.0;
    bool _784 = isnan(_498);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = _728 * _114;
    int _794 = abs(_762);
    float _796 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _798 = float(_778);
    float _800 = float(_794);
    float _802 = exp2(_792);
    int _804 = ~_770;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = _800 * _798;
    int _812 = _808;
    if (!_758)
    {
        int _814 = ~_770;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = in.m_53.x;
    float _822 = in.m_53.y;
    float _824 = in.m_53.z;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _828 = 1.0 + _826;
    float _830 = _810 * (-2.0);
    bool _832 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _834 = isnan(1.0);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _840 = _836 || _838;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = 1.0 / _828;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _848 = !_736;
    int _850 = _848 ? 0 : 1;
    float _852 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _854 = -_802;
    float _856 = _854 + 1.0;
    bool _858 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[78].z, _846);
    float _870 = -_114;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[76].x, _570);
    int _874 = abs(_850);
    float _876 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _852);
    float _878 = _866 ? _856 : 0.0;
    float _880 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _496);
    float _882 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.100000016391277313232421875;
    float _884 = float(_818);
    float _886 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _868);
    float _888 = float(_874);
    float _890 = fma(_724, 3.0, _882);
    if (_840)
    {
        float _892 = _878 * _844;
        _134 = _892;
    }
    float _894 = _134;
    bool _896 = !_740;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_830, _820, _820);
    float _902 = _888 * _884;
    float _904 = _468 + (-0.5);
    int _906 = _790 ? 0 : 1;
    float _908 = _470 + _450;
    int _910 = abs(_898);
    float _912 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[196].x, _900);
    float _914 = _908 + (-1.0);
    int _916 = ~_906;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = _890 * 0.15915493667125701904296875;
    int _924 = _920;
    if (!_780)
    {
        int _926 = ~_906;
        int _928 = _926 + 1;
        _924 = _928;
    }
    int _930 = _924;
    float _932 = _902 * (-2.0);
    float _934 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _936 = float(_910);
    float _938 = _470 + (-0.5);
    float _940 = float(_930);
    float _942 = fma(_796, _830, _796);
    float _944 = fma(_932, _822, _822);
    float _946 = fma(_934, _932, _934);
    float _948 = _450 + _468;
    float _950 = fma(_942, _894, _912);
    float _952 = _936 * _940;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].y, _944);
    float _956 = _948 + (-1.0);
    float _958 = in.m_55.x;
    float _960 = in.m_55.y;
    float _962 = in.m_55.z;
    float _964 = _950 * 0.15915493667125701904296875;
    float _966 = _952 * (-2.0);
    float _968 = _922 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = fma(_946, _894, _954);
    float _974 = _450 + (-0.5);
    float _976 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _978 = fma(_966, _824, _824);
    float _980 = _972 * 0.15915493667125701904296875;
    float _982 = fma(_976, _966, _976);
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[196].z, _978);
    float _986 = _964 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _494);
    float _992 = fma(_982, _894, _984);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _488);
    float _996 = _992 * 0.15915493667125701904296875;
    float _998 = _964 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = _970 * 0.0500000007450580596923828125;
    float _1004 = _414 * _960;
    float _1006 = _412 * _958;
    float _1008 = fma(_146, _1002, _446);
    float _1010 = _416 * _962;
    float _1012 = in.m_42.x;
    float _1014 = in.m_42.y;
    float _1016 = in.m_42.z;
    float _1018 = _980 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    float _1022 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1024 = _1004 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1008);
    float _1028 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = _994 * _1022;
    float _1032 = _1026 * _1024;
    float _1034 = _980 * 6.283185482025146484375;
    float _1036 = cos(_1034);
    float _1038 = _990 * _1028;
    float _1040 = _996 * 6.283185482025146484375;
    float _1042 = sin(_1040);
    float _1044 = _988 * _1020;
    float _1046 = _996 * 6.283185482025146484375;
    float _1048 = cos(_1046);
    float _1050 = _1000 * _1036;
    float _1052 = _988 * _1036;
    float _1054 = fma(_1042, _1050, _1044);
    float _1056 = fma(_1042, _1044, _1050);
    float _1058 = _1000 * _1020;
    float _1060 = _1048 * _1032;
    float _1062 = _1020 * _1048;
    float _1064 = _1036 * _1048;
    float _1066 = -_1058;
    float _1068 = fma(_1042, _1052, _1066);
    float _1070 = _1000 * _1060;
    float _1072 = _988 * _1060;
    float _1074 = -_1032;
    float _1076 = _1042 * _1074;
    float _1078 = -_1052;
    float _1080 = fma(_1042, _1058, _1078);
    float _1082 = fma(_1054, _1030, _1070);
    float _1084 = fma(_1068, _1030, _1072);
    float _1086 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1088 = fma(_1064, _1030, _1076);
    float _1090 = fma(_1080, _1038, _1082);
    float _1092 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1094 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1086);
    float _1096 = fma(_1062, _1038, _1088);
    float _1098 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1100 = fma(_1056, _1038, _1084);
    float _1102 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1094);
    float _1104 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1092);
    float _1106 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1098);
    float _1110 = _1102 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1112 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1104);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1106);
    float _1116 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1108);
    float _1118 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1120 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1114);
    float _1124 = _1110 + _1116;
    float _1126 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1118);
    float _1128 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1130 = _1120 + _1122;
    float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1134 = _1124 + _1132;
    float _1136 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1126);
    float _1138 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1128);
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1142 = _1130 + _1140;
    float _1144 = _1134 * _1134;
    float _1146 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1148 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1138);
    float _1150 = fma(_1142, _1142, _1144);
    float _1152 = _1146 + _1148;
    float _1154 = sqrt(_1150);
    bool _1156 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1158 = _1144;
    float _1160 = _1128;
    float _1162 = _1130;
    float _1164 = _1154;
    float _1166 = _1062;
    float _1168 = _1124;
    float _1170 = _1110;
    if (!_1156)
    {
        _1158 = _1124;
    }
    float _1172 = _1158;
    float _1174 = _1172;
    if (!_1156)
    {
        _1160 = _1152;
    }
    float _1176 = _1160;
    bool _1178 = !_1156;
    float _1180 = _1176;
    if (!_1178)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1186 = _1154 + _1184;
        float _1188 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1190 = rsqrt(_1150);
        float _1192 = _1186 * _1182;
        float _1194 = _1192 * 0.15915493667125701904296875;
        float _1196 = _1194 * 6.283185482025146484375;
        float _1198 = cos(_1196);
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        float _1204 = _1198 + (-1.0);
        float _1206 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = fma(_1202, _1188, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1210 = fma(_1152, _1198, _1206);
        float _1212 = _1190 * _1208;
        float _1214 = fma(_1142, _1212, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1216 = fma(_1134, _1212, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1180 = _1210;
        _1162 = _1214;
        _1174 = _1216;
        _1164 = _1186;
    }
    float _1218 = _1180;
    float _1220 = _1162;
    float _1222 = _1174;
    float _1224 = _1164;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1218 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1232 = _1220 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1222 + _1234;
    float _1238 = _1228 * _1228;
    float _1240 = fma(_1232, _1232, _1238);
    float _1242 = fma(_1236, _1236, _1240);
    float _1244 = rsqrt(_1242);
    float _1246 = sqrt(_1242);
    float _1248 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1250 = _1232 * _1248;
    float _1252 = _1236 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 + _1256;
    float _1260 = sqrt(_1258);
    bool _1262 = _1260 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = _1260 + _1264;
    float _1268 = _1244;
    float _1270 = _1258;
    float _1272 = _1266;
    float _1274 = _1224;
    float _1276 = _1228;
    if (_1262)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1278;
    }
    float _1280 = _1268;
    if (_1262)
    {
        float _1282 = rsqrt(_1258);
        _1270 = _1282;
    }
    float _1284 = _1270;
    float _1286 = _1284;
    if (_1262)
    {
        float _1288 = _1266 * _1280;
        _1272 = _1288;
    }
    float _1290 = _1272;
    if (_1262)
    {
        float _1292 = _1290 * 0.15915493667125701904296875;
        _1274 = _1292;
    }
    float _1294 = _1274;
    float _1296 = _1236;
    if (_1262)
    {
        float _1298 = _1294 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        _1296 = _1300;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1306 = precise::max(0.0, _1304);
    float _1308 = _1280;
    float _1310 = _1306;
    if (_1262)
    {
        float _1312 = _1294 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        _1308 = _1314;
    }
    float _1316 = _1308;
    float _1318 = -_1248;
    float _1320 = -_1306;
    float _1322 = fma(_1228, _1318, _1320);
    if (_1262)
    {
        float _1324 = _1322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1276 = _1324;
    }
    float _1326 = _1276;
    float _1328 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1330 = _1326;
    float _1332 = _1302;
    if (_1262)
    {
        float _1334 = fma(_1302, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1330 = _1334;
    }
    float _1336 = _1330;
    float _1338 = _1336;
    if (!_1262)
    {
        _1332 = _1250;
    }
    float _1340 = _1332;
    float _1342 = _1340;
    float _1344 = _1316;
    if (_1262)
    {
        float _1346 = _1316 + (-1.0);
        _1310 = _1346;
    }
    float _1348 = _1310;
    float _1350 = _1348;
    if (_1262)
    {
        float _1352 = _1284 * _1336;
        _1166 = _1352;
    }
    float _1354 = _1166;
    if (!_1262)
    {
        _1338 = _1322;
    }
    float _1356 = _1338;
    float _1358 = _1356;
    if (_1262)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1168 = _1360;
    }
    float _1362 = _1168;
    if (_1262)
    {
        float _1364 = _1250 * _1354;
        _1342 = _1364;
    }
    float _1366 = _1342;
    if (!_1262)
    {
        _1350 = _1252;
    }
    float _1368 = _1350;
    float _1370 = _1368;
    if (_1262)
    {
        float _1372 = _1252 * _1354;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1262)
    {
        _1286 = _1254;
    }
    float _1376 = _1286;
    float _1378 = _1376;
    if (_1262)
    {
        float _1380 = fma(_1322, _1316, _1362);
        _1358 = _1380;
    }
    float _1382 = _1358;
    if (_1262)
    {
        float _1384 = _1366 * _1366;
        _1378 = _1384;
    }
    float _1386 = _1378;
    if (!_1262)
    {
        _1344 = _1256;
    }
    float _1388 = _1344;
    float _1390 = _1388;
    if (_1262)
    {
        float _1392 = _1374 * _1374;
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = fma(_1382, _1382, _1386);
    float _1398 = _1396 + _1394;
    float _1400 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1328);
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1404 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1402);
    float _1406 = precise::clamp(_1404, 0.0, 1.0);
    float _1408 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = rsqrt(_1398);
    float _1412 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1400);
    float _1414 = -_1406;
    float _1416 = _1414 + 1.0;
    float _1418 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1420 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1408);
    float _1422 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1424 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1426 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1418);
    float _1428 = abs(_1416);
    float _1430 = log2(_1428);
    float _1432 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1434 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1422);
    float _1436 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1426);
    float _1438 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1442 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1434);
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1446 = _1410 * _1366;
    float _1448 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1450 = _1410 * _1382;
    float _1452 = _1410 * _1374;
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1448);
    float _1458 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1460 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1462 = -_1454;
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1462);
    float _1466 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1456);
    float _1470 = -_1458;
    float _1472 = fma(_1470, _1424, 1.0);
    float _1474 = -_1452;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1464);
    float _1478 = exp2(_1466);
    float _1480 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1468);
    float _1482 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1484 = fma(_1476, -0.5, 0.5);
    float _1486 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1488 = fma(_1476, 0.5, 0.5);
    float _1490 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1482);
    float _1492 = _1450 + 1.0;
    float _1494 = log2(_1472);
    float _1496 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1486);
    float _1498 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1500 = fma(_1488, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1502 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1496);
    float _1504 = fma(_1488, _1500, -0.212114393711090087890625);
    float _1506 = 1.0 / _1480;
    float _1508 = -_1450;
    float _1510 = fma(_1478, _1492, _1508);
    float _1512 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1498);
    float _1514 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1516 = fma(_1488, _1504, 1.570728778839111328125);
    float _1518 = fma(_1510, 0.5, 0.5);
    float _1520 = sqrt(_1484);
    float _1522 = _1494 * 0.693147182464599609375;
    float _1524 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1526 = _1512 * _1506;
    float _1528 = _1514 * _1506;
    float _1530 = fma(_1526, 0.5, 0.5);
    float _1532 = fma(_1528, -0.5, 0.5);
    float _1534 = _1520 * 0.636619746685028076171875;
    float3 _4219 = float3(_1530, _1532, _1524);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4219, float3(0.0), isnan(_4219)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4219, float3(0.0), isnan(_4219)), level(0.0)).x;
    float3 _4230 = float3(_1530, _1532, _1524);
    float4 _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4230, float3(0.0), isnan(_4230)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4230, float3(0.0), isnan(_4230)), level(0.0)).xyzw;
    float _1541 = _1539.x;
    float _1543 = _1539.y;
    float _1545 = _1539.z;
    float _1547 = _1539.w;
    float _1549 = -_1516;
    float _1551 = fma(_1534, _1549, 1.0);
    float2 _4252 = float2(_1551, _1518);
    float3 _1555 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4252, float2(0.0), isnan(_4252)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4252, float2(0.0), isnan(_4252)), level(0.0)).xyz;
    float _1557 = _1555.x;
    float _1559 = _1555.y;
    float _1561 = _1555.z;
    float _1563 = in.m_57.y;
    float _1565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1567 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1575 = _1573 != 0;
    float _1577 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1581 = _1579 != 0;
    float _1583 = 1.0 / _1571;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1589 = in.m_57.x;
    bool _1591 = _470 > 0.5;
    float _1593 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1577);
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1595;
    float _1599 = 1.0 / _1587;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1605 = 0.0;
    if (_1581)
    {
        float _1607 = in.m_49.x;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = -_1563;
    float _1613 = _1611 + 1.0;
    float _1615 = _1597 * _1583;
    float _1617 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1619 = exp2(_1567);
    float _1621 = _1563;
    if (_1575)
    {
        float _1623 = _1591 ? _1613 : _1563;
        _1621 = _1623;
    }
    float _1625 = _1621;
    float _1627 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1629 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1617);
    bool _1631 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1633 = isnan(0.5);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1639 = _1635 || _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1643 = _442 + _1641;
    float _1645 = fma(_1627, _1625, -0.5);
    float _1647 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1629);
    float _1649 = _1603 * _1599;
    float _1651 = fma(_1615, _1643, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1653 = -_880;
    float _1655 = fma(_876, _1645, _1653);
    float _1657 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1659 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1661 = isnan(_442);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1673 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1675 = isnan(_442);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1681 = _1677 || _1679;
    float _1683 = float(_1681);
    float _1685 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1657);
    bool _1687 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1689 = isnan(_442);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = -_1669;
    float _1701 = _1699 + 1.0;
    float _1703 = 1.0 / _1671;
    float _1705 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1685);
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1709 = _442 + _1707;
    float _1711 = _1683 * _1701;
    float _1713 = -_1683;
    float _1715 = _1713 + 1.0;
    float _1717 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1719 = _1609 > 0.5;
    bool _1721 = _1719 && _1581;
    float _1723 = fma(_1649, _1709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1725 = _1697 * _1715;
    float _1727 = -_1697;
    float _1729 = _1727 + 1.0;
    float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1733 = _1717 + _1671;
    float _1735 = _1651 * _1725;
    float _1737 = _1725;
    float _1739 = _1647;
    float _1741 = _1711;
    float _1743 = _1723;
    float _1745 = _1669;
    if (!_1639)
    {
        _1737 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1747 = _1737;
    float _1749 = in.m_59.w;
    if (_1581)
    {
        _1739 = _1589;
    }
    float _1751 = _1739;
    float _1753 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1735);
    float _1755 = _1733 * _1703;
    float _1757 = _1755 * 0.5;
    float _1759 = _1757;
    float _1761 = _1751;
    if (!_1581)
    {
        _1170 = _1589;
    }
    float _1763 = _1170;
    float _1765 = -_1619;
    float _1767 = _1765 + 1.0;
    float _1769 = fma(_1723, _1711, _1753);
    float _1771 = _1763;
    if (!_1639)
    {
        _1741 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1773 = _1741;
    if (!_1639)
    {
        float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1777 = fma(_1757, _1747, _1775);
        _1759 = _1777;
    }
    float _1779 = _1759;
    if (_1721)
    {
        float _1781 = -_1751;
        float _1783 = _1781 + 1.0;
        _1761 = _1783;
    }
    float _1785 = _1761;
    float _1787 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1769);
    if (!_1639)
    {
        float _1789 = -_1773;
        float _1791 = _1789 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1743 = _1791;
    }
    float _1793 = _1743;
    float _1795 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1797 = _1779;
    if (!_1639)
    {
        float _1799 = 1.0 / _1779;
        _1797 = _1799;
    }
    float _1801 = _1797;
    if (_1581)
    {
        _1771 = _1785;
    }
    float _1803 = _1771;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1807 = _1655 + 0.5;
    if (_1639)
    {
        _1745 = 1.0;
    }
    float _1809 = _1745;
    float _1811 = fma(_1795, _1803, -0.5);
    float _1813 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1815 = _1793;
    float _1817 = _1809;
    if (!_1639)
    {
        float _1819 = 1.0 / _1793;
        _1815 = _1819;
    }
    float _1821 = _1815;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1825 = fma(_886, _1811, _872);
    float _1827 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1593);
    float _1829 = _1825 + 0.5;
    float _1831 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1835 = _1825;
    if (!_1639)
    {
        float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1839 = -_1773;
        float _1841 = fma(_1801, _1837, _1839);
        _1835 = _1841;
    }
    float _1843 = _1835;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1847 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1827);
    out.m_61.w = _1749;
    if (!_1639)
    {
        float _1851 = _1843 * _1821;
        float _1853 = precise::clamp(_1851, 0.0, 1.0);
        _1817 = _1853;
    }
    float _1855 = _1817;
    float _1857 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_63.x = _1847;
    out.m_63.y = _1813;
    out.m_63.z = _1831;
    out.m_63.w = _1845;
    float _1859 = _1855 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1861 = _1855 > 0.0;
    bool _1863 = isnan(_1855);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan(0.0);
    bool _1869 = _1865 || _1867;
    float _1871 = _1849 + _1480;
    out.gl_Position.x = _1512;
    out.gl_Position.y = _1514;
    out.gl_Position.z = _1849;
    out.gl_Position.w = _1480;
    float _1873 = _1859 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1875 = _1871 * 0.5;
    out.m_65.x = _1829;
    out.m_65.y = _1807;
    out.m_67.z = _1875;
    out.m_67.w = _1480;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1881 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1885 = _1877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1887 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _1873;
    float _1889 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1885;
    out.m_69.y = _1887;
    out.m_69.z = _1889;
    out.m_69.w = _1881;
    float _1891 = _1857 * _1536;
    float _1893 = _1547 * _1891;
    float _1895 = _1561 * _1891;
    float _1897 = -_1857;
    float _1899 = _1897 + 1.0;
    float _1901 = fma(_1557, _1893, _1541);
    float _1903 = fma(_1559, _1893, _1543);
    float _1905 = fma(_1547, _1895, _1545);
    float _1907 = _1547 * _1899;
    out.m_71.x = _1901;
    out.m_71.y = _1903;
    out.m_71.z = _1905;
    out.m_71.w = _1907;
    if (_1869)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1909 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1909;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _440 = false;
    bool _168 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1965 = as_type<float>(_104);
        out.gl_Position.z = _1965;
    }
    if (!_94)
    {
        return out;
    }
    float _108 = in.m_47.w;
    float _110 = float(_90);
    float _112 = -_108;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_108);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    bool _126 = _114 >= _110;
    bool _128 = !_124;
    bool _130 = _126 || _128;
    float _132 = _108;
    float _134 = _114;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2030 = as_type<float>(_140);
        out.gl_Position.z = _2030;
    }
    if (_130)
    {
        return out;
    }
    float _142 = 1.0 / _110;
    bool _144 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _146 = _114 * _142;
    bool _148 = !_144;
    float _166;
    if (!_148)
    {
        float _150 = in.m_49.x;
        float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _154 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _156 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _158 = _156 * _152;
        float _160 = floor(_158);
        float _162 = -_160;
        float _164 = _158 + _162;
        _166 = _164;
        _168 = true;
    }
    else
    {
        _166 = _146;
    }
    _168 = false;
    float _170 = _166;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _174 = _170 + _172;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _178 = _170 + _176;
    bool _180 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _182 = isnan(_170);
    bool _184 = _180 || _182;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _188 = _184 || _186;
    float _190 = float(_188);
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _198 = _196 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _170 + _208;
    float _212 = 1.0 / _198;
    float _214 = 1.0 / _194;
    bool _216 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _218 = isnan(_170);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    bool _228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _230 = 1.0 / _202;
    float _232 = 1.0 / _206;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _170 + _234;
    float _238 = _174 * _214;
    bool _240 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _242 = isnan(_170);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = _236 * _212;
    float _254 = -_190;
    float _256 = _254 + 1.0;
    float _258 = _178 * _230;
    bool _260 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _262 = isnan(_170);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = _250 * _256;
    float _278 = -_250;
    float _280 = _278 + 1.0;
    float _282 = -_270;
    float _284 = _282 + 1.0;
    float _286 = fma(_274, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = _210 * _232;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    float _298 = _270 * _280;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = fma(_292, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _306 = fma(_296, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _308 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_170);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _328 = fma(_302, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _330 = _318 * _284;
    float _332 = -_318;
    float _334 = _332 + 1.0;
    float _336 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_326, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = _226 * _334;
    float _342 = -_226;
    float _344 = _342 + 1.0;
    float _346 = _286 * _340;
    float _348 = _304 * _340;
    float _350 = _306 * _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].x, _346);
    float _358 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].y, _348);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].z, _350);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_354, _238, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_336, _330, _356);
    float _374 = fma(_328, _330, _358);
    float _376 = fma(_362, _238, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_338, _330, _364);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _388 = fma(_368, _238, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _394 = fma(_370, _298, _372);
    float _396 = fma(_382, _252, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _398 = fma(_386, _252, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _400 = fma(_376, _298, _374);
    float _402 = fma(_392, _252, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _404 = fma(_388, _298, _378);
    float _406 = fma(_396, _276, _394);
    float _408 = fma(_398, _276, _400);
    float _410 = fma(_402, _276, _404);
    float _412 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[147].x, _406);
    float _414 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[147].y, _408);
    float _416 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[147].z, _410);
    bool _418 = !_228;
    int _420 = as_type<int>(_374);
    float _438;
    if (!_418)
    {
        float _422 = in.m_49.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _430 = _428 * _424;
        float _432 = floor(_430);
        float _434 = -_432;
        float _436 = _430 + _434;
        _438 = _436;
        _440 = true;
    }
    else
    {
        _438 = _146;
    }
    _440 = false;
    float _442 = _438;
    float _444 = in.m_51.x;
    float _446 = in.m_51.y;
    float _448 = in.m_51.z;
    float _450 = in.m_49.z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _454 = abs(_446);
    float _456 = precise::max(0.0, _454);
    float _458 = precise::min(_456, 0.15600000321865081787109375);
    float _460 = _458 * 6.41025638580322265625;
    float _462 = _146 * _460;
    float _464 = _462 * 0.75;
    float _466 = _464 * 0.15915493667125701904296875;
    float _468 = in.m_49.x;
    float _470 = in.m_49.y;
    float _472 = _466 * 6.283185482025146484375;
    float _474 = sin(_472);
    float _476 = _466 * 6.283185482025146484375;
    float _478 = cos(_476);
    float _480 = _474 * _448;
    float _482 = _470 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _484 = _478 * _448;
    float _486 = -_480;
    float _488 = fma(_478, _444, _486);
    float _490 = _450 * 2.0;
    float _492 = _470 * 2.0;
    float _494 = fma(_474, _444, _484);
    float _496 = fma(_482, -2.0, _452);
    float _498 = floor(_492);
    float _500 = _494 * 0.0625;
    float _502 = abs(_488);
    float _504 = abs(_494);
    float _506 = precise::max(_502, _504);
    bool _508 = _506 >= 16.0;
    float _510 = _488 * 0.0625;
    float _512 = floor(_490);
    float _514 = _508 ? _500 : _494;
    float _516 = _508 ? _510 : _488;
    float _518 = _468 * 2.0;
    float _520 = abs(_514);
    bool _522 = _520 != 0.0;
    bool _524 = isnan(_520);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = abs(_516);
    bool _534 = _532 == 0.0;
    float _536 = floor(_518);
    float _538 = abs(_516);
    bool _540 = _538 == 0.0;
    bool _542 = !_530;
    bool _544 = _540 && _542;
    bool _546 = _512 > 0.0;
    bool _548 = _512 >= 0.0;
    bool _550 = isnan(_512);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _560 = _468 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _562 = false;
    if (_544)
    {
        bool _564 = as_type<int>(_516) >= 0;
        _562 = _564;
    }
    bool _566 = _562;
    float _568 = -_558;
    float _570 = fma(_560, 2.0, _568);
    int _572 = _566 ? (-1) : 0;
    if (_544)
    {
        int _574 = _566 ? 0 : 1078530011;
        _420 = _574;
    }
    int _576 = _420;
    int _578 = _576;
    if (_544)
    {
        int _580 = int(0x80000000) & as_type<int>(_514);
        int _582 = _576 | _580;
        _578 = _582;
    }
    int _584 = _578;
    bool _586 = !_530;
    bool _588 = _586 && _534;
    int _590 = _584;
    float _592 = as_type<float>(_584);
    if (!_588)
    {
        float _594 = abs(_514);
        bool _596 = _594 != as_type<float>(0x7f800000u /* inf */);
        bool _598 = isnan(_594);
        bool _600 = _596 || _598;
        bool _602 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _604 = _600 || _602;
        float _606 = abs(_516);
        bool _608 = _606 == as_type<float>(0x7f800000u /* inf */);
        float _610 = abs(_516);
        bool _612 = _610 == as_type<float>(0x7f800000u /* inf */);
        bool _614 = !_604;
        bool _616 = _612 && _614;
        if (_616)
        {
            bool _618 = as_type<int>(_516) >= 0;
            _572 = _618 ? (-1) : 0;
        }
        int _620 = _572;
        if (_616)
        {
            _590 = 1075235812;
        }
        int _622 = _590;
        int _624 = _622;
        if (_616)
        {
            int _626 = ~_620;
            int _628 = (_626 != 0) ? _622 : 1061752795;
            _624 = _628;
        }
        int _630 = _624;
        float _632 = as_type<float>(_630);
        if (_616)
        {
            int _634 = int(0x80000000) & as_type<int>(_514);
            int _636 = _630 | _634;
            _632 = as_type<float>(_636);
        }
        float _638 = _632;
        bool _640 = !_604;
        bool _642 = _640 && _608;
        _592 = _638;
        if (!_642)
        {
            float _644 = abs(_514);
            float _646 = abs(_516);
            float _648 = precise::max(_644, _646);
            float _650 = abs(_514);
            float _652 = abs(_516);
            float _654 = precise::min(_650, _652);
            float _656 = 1.0 / _648;
            float _658 = abs(_514);
            float _660 = abs(_516);
            bool _662 = _658 > _660;
            bool _664 = as_type<int>(_516) >= 0;
            float _666 = _654 * _656;
            int _668 = as_type<int>(_514) & int(0x80000000);
            float _670 = _666 * _666;
            float _672 = _670 + 11.33538818359375;
            float _674 = fma(_670, _672, 28.84246826171875);
            float _676 = fma(_670, _674, 19.6966705322265625);
            float _678 = fma(_670, -0.82336294651031494140625, -5.674867153167724609375);
            float _680 = abs(_514);
            float _682 = abs(_516);
            float _684 = _680 + _682;
            float _686 = fma(_670, _678, -6.565555095672607421875);
            float _688 = 1.0 / _676;
            bool _690 = _684 > as_type<float>(0x7f800000u /* inf */);
            bool _692 = isnan(_684);
            bool _694 = _690 || _692;
            bool _696 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _698 = _694 || _696;
            float _700 = _670 * _686;
            float _702 = _666 * _700;
            float _704 = fma(_702, _688, _666);
            float _706 = _704;
            _592 = _684;
            if (_662)
            {
                float _708 = -_704;
                float _710 = _708 + 1.57079637050628662109375;
                _706 = _710;
            }
            float _712 = _706;
            int _714 = as_type<int>(_712);
            if (!_664)
            {
                float _716 = -_712;
                float _718 = _716 + 3.1415927410125732421875;
                _714 = as_type<int>(_718);
            }
            int _720 = _714;
            if (!_698)
            {
                int _722 = _668 | _720;
                _592 = as_type<float>(_722);
            }
        }
    }
    float _724 = _592;
    float _726 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _728 = log2(_726);
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _740 = _738 != 0;
    float _742 = _470 + _468;
    int _744 = _556 ? 0 : 1;
    bool _746 = _536 >= 0.0;
    bool _748 = isnan(_536);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    float _756 = _742 + (-1.0);
    bool _758 = _536 > 0.0;
    bool _760 = !_732;
    int _762 = _760 ? 0 : 1;
    int _764 = ~_744;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    int _770 = _754 ? 0 : 1;
    int _772 = _768;
    if (!_546)
    {
        int _774 = ~_744;
        int _776 = _774 + 1;
        _772 = _776;
    }
    int _778 = _772;
    bool _780 = _498 > 0.0;
    bool _782 = _498 >= 0.0;
    bool _784 = isnan(_498);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = _728 * _114;
    int _794 = abs(_762);
    float _796 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _798 = float(_778);
    float _800 = float(_794);
    float _802 = exp2(_792);
    int _804 = ~_770;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = _800 * _798;
    int _812 = _808;
    if (!_758)
    {
        int _814 = ~_770;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = in.m_53.x;
    float _822 = in.m_53.y;
    float _824 = in.m_53.z;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _828 = 1.0 + _826;
    float _830 = _810 * (-2.0);
    bool _832 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _834 = isnan(1.0);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _840 = _836 || _838;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = 1.0 / _828;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _848 = !_736;
    int _850 = _848 ? 0 : 1;
    float _852 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _854 = -_802;
    float _856 = _854 + 1.0;
    bool _858 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[78].z, _846);
    float _870 = -_114;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[76].x, _570);
    int _874 = abs(_850);
    float _876 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _852);
    float _878 = _866 ? _856 : 0.0;
    float _880 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _496);
    float _882 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.100000016391277313232421875;
    float _884 = float(_818);
    float _886 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _868);
    float _888 = float(_874);
    float _890 = fma(_724, 3.0, _882);
    if (_840)
    {
        float _892 = _878 * _844;
        _134 = _892;
    }
    float _894 = _134;
    bool _896 = !_740;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_830, _820, _820);
    float _902 = _888 * _884;
    float _904 = _468 + (-0.5);
    int _906 = _790 ? 0 : 1;
    float _908 = _470 + _450;
    int _910 = abs(_898);
    float _912 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[196].x, _900);
    float _914 = _908 + (-1.0);
    int _916 = ~_906;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = _890 * 0.15915493667125701904296875;
    int _924 = _920;
    if (!_780)
    {
        int _926 = ~_906;
        int _928 = _926 + 1;
        _924 = _928;
    }
    int _930 = _924;
    float _932 = _902 * (-2.0);
    float _934 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _936 = float(_910);
    float _938 = _470 + (-0.5);
    float _940 = float(_930);
    float _942 = fma(_796, _830, _796);
    float _944 = fma(_932, _822, _822);
    float _946 = fma(_934, _932, _934);
    float _948 = _450 + _468;
    float _950 = fma(_942, _894, _912);
    float _952 = _936 * _940;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].y, _944);
    float _956 = _948 + (-1.0);
    float _958 = in.m_55.x;
    float _960 = in.m_55.y;
    float _962 = in.m_55.z;
    float _964 = _950 * 0.15915493667125701904296875;
    float _966 = _952 * (-2.0);
    float _968 = _922 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = fma(_946, _894, _954);
    float _974 = _450 + (-0.5);
    float _976 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _978 = fma(_966, _824, _824);
    float _980 = _972 * 0.15915493667125701904296875;
    float _982 = fma(_976, _966, _976);
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[196].z, _978);
    float _986 = _964 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _494);
    float _992 = fma(_982, _894, _984);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _488);
    float _996 = _992 * 0.15915493667125701904296875;
    float _998 = _964 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = _970 * 0.0500000007450580596923828125;
    float _1004 = _414 * _960;
    float _1006 = _412 * _958;
    float _1008 = fma(_146, _1002, _446);
    float _1010 = _416 * _962;
    float _1012 = in.m_42.x;
    float _1014 = in.m_42.y;
    float _1016 = in.m_42.z;
    float _1018 = _980 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    float _1022 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1024 = _1004 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1008);
    float _1028 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = _994 * _1022;
    float _1032 = _1026 * _1024;
    float _1034 = _980 * 6.283185482025146484375;
    float _1036 = cos(_1034);
    float _1038 = _990 * _1028;
    float _1040 = _996 * 6.283185482025146484375;
    float _1042 = sin(_1040);
    float _1044 = _988 * _1020;
    float _1046 = _996 * 6.283185482025146484375;
    float _1048 = cos(_1046);
    float _1050 = _1000 * _1036;
    float _1052 = _988 * _1036;
    float _1054 = fma(_1042, _1050, _1044);
    float _1056 = fma(_1042, _1044, _1050);
    float _1058 = _1000 * _1020;
    float _1060 = _1048 * _1032;
    float _1062 = _1020 * _1048;
    float _1064 = _1036 * _1048;
    float _1066 = -_1058;
    float _1068 = fma(_1042, _1052, _1066);
    float _1070 = _1000 * _1060;
    float _1072 = _988 * _1060;
    float _1074 = -_1032;
    float _1076 = _1042 * _1074;
    float _1078 = -_1052;
    float _1080 = fma(_1042, _1058, _1078);
    float _1082 = fma(_1054, _1030, _1070);
    float _1084 = fma(_1068, _1030, _1072);
    float _1086 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1088 = fma(_1064, _1030, _1076);
    float _1090 = fma(_1080, _1038, _1082);
    float _1092 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1094 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1086);
    float _1096 = fma(_1062, _1038, _1088);
    float _1098 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1100 = fma(_1056, _1038, _1084);
    float _1102 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1094);
    float _1104 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1092);
    float _1106 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1098);
    float _1110 = _1102 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1112 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1104);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1106);
    float _1116 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1108);
    float _1118 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1120 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1114);
    float _1124 = _1110 + _1116;
    float _1126 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1118);
    float _1128 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1130 = _1120 + _1122;
    float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1134 = _1124 + _1132;
    float _1136 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1126);
    float _1138 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1128);
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1142 = _1130 + _1140;
    float _1144 = _1134 * _1134;
    float _1146 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1148 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1138);
    float _1150 = fma(_1142, _1142, _1144);
    float _1152 = _1146 + _1148;
    float _1154 = sqrt(_1150);
    bool _1156 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1158 = _1144;
    float _1160 = _1128;
    float _1162 = _1130;
    float _1164 = _1154;
    float _1166 = _1062;
    float _1168 = _1124;
    float _1170 = _1110;
    if (!_1156)
    {
        _1158 = _1124;
    }
    float _1172 = _1158;
    float _1174 = _1172;
    if (!_1156)
    {
        _1160 = _1152;
    }
    float _1176 = _1160;
    bool _1178 = !_1156;
    float _1180 = _1176;
    if (!_1178)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1186 = _1154 + _1184;
        float _1188 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1190 = rsqrt(_1150);
        float _1192 = _1186 * _1182;
        float _1194 = _1192 * 0.15915493667125701904296875;
        float _1196 = _1194 * 6.283185482025146484375;
        float _1198 = cos(_1196);
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        float _1204 = _1198 + (-1.0);
        float _1206 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = fma(_1202, _1188, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1210 = fma(_1152, _1198, _1206);
        float _1212 = _1190 * _1208;
        float _1214 = fma(_1142, _1212, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1216 = fma(_1134, _1212, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1180 = _1210;
        _1162 = _1214;
        _1174 = _1216;
        _1164 = _1186;
    }
    float _1218 = _1180;
    float _1220 = _1162;
    float _1222 = _1174;
    float _1224 = _1164;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1218 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1232 = _1220 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1222 + _1234;
    float _1238 = _1228 * _1228;
    float _1240 = fma(_1232, _1232, _1238);
    float _1242 = fma(_1236, _1236, _1240);
    float _1244 = rsqrt(_1242);
    float _1246 = sqrt(_1242);
    float _1248 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1250 = _1232 * _1248;
    float _1252 = _1236 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 + _1256;
    float _1260 = sqrt(_1258);
    bool _1262 = _1260 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = _1260 + _1264;
    float _1268 = _1244;
    float _1270 = _1258;
    float _1272 = _1266;
    float _1274 = _1224;
    float _1276 = _1228;
    if (_1262)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1278;
    }
    float _1280 = _1268;
    if (_1262)
    {
        float _1282 = rsqrt(_1258);
        _1270 = _1282;
    }
    float _1284 = _1270;
    float _1286 = _1284;
    if (_1262)
    {
        float _1288 = _1266 * _1280;
        _1272 = _1288;
    }
    float _1290 = _1272;
    if (_1262)
    {
        float _1292 = _1290 * 0.15915493667125701904296875;
        _1274 = _1292;
    }
    float _1294 = _1274;
    float _1296 = _1236;
    if (_1262)
    {
        float _1298 = _1294 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        _1296 = _1300;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1306 = precise::max(0.0, _1304);
    float _1308 = _1280;
    float _1310 = _1306;
    if (_1262)
    {
        float _1312 = _1294 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        _1308 = _1314;
    }
    float _1316 = _1308;
    float _1318 = -_1248;
    float _1320 = -_1306;
    float _1322 = fma(_1228, _1318, _1320);
    if (_1262)
    {
        float _1324 = _1322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1276 = _1324;
    }
    float _1326 = _1276;
    float _1328 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1330 = _1326;
    float _1332 = _1302;
    if (_1262)
    {
        float _1334 = fma(_1302, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1330 = _1334;
    }
    float _1336 = _1330;
    float _1338 = _1336;
    if (!_1262)
    {
        _1332 = _1250;
    }
    float _1340 = _1332;
    float _1342 = _1340;
    float _1344 = _1316;
    if (_1262)
    {
        float _1346 = _1316 + (-1.0);
        _1310 = _1346;
    }
    float _1348 = _1310;
    float _1350 = _1348;
    if (_1262)
    {
        float _1352 = _1284 * _1336;
        _1166 = _1352;
    }
    float _1354 = _1166;
    if (!_1262)
    {
        _1338 = _1322;
    }
    float _1356 = _1338;
    float _1358 = _1356;
    if (_1262)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1168 = _1360;
    }
    float _1362 = _1168;
    if (_1262)
    {
        float _1364 = _1250 * _1354;
        _1342 = _1364;
    }
    float _1366 = _1342;
    if (!_1262)
    {
        _1350 = _1252;
    }
    float _1368 = _1350;
    float _1370 = _1368;
    if (_1262)
    {
        float _1372 = _1252 * _1354;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1262)
    {
        _1286 = _1254;
    }
    float _1376 = _1286;
    float _1378 = _1376;
    if (_1262)
    {
        float _1380 = fma(_1322, _1316, _1362);
        _1358 = _1380;
    }
    float _1382 = _1358;
    if (_1262)
    {
        float _1384 = _1366 * _1366;
        _1378 = _1384;
    }
    float _1386 = _1378;
    if (!_1262)
    {
        _1344 = _1256;
    }
    float _1388 = _1344;
    float _1390 = _1388;
    if (_1262)
    {
        float _1392 = _1374 * _1374;
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = fma(_1382, _1382, _1386);
    float _1398 = _1396 + _1394;
    float _1400 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1328);
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1404 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1402);
    float _1406 = precise::clamp(_1404, 0.0, 1.0);
    float _1408 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = rsqrt(_1398);
    float _1412 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1400);
    float _1414 = -_1406;
    float _1416 = _1414 + 1.0;
    float _1418 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1420 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1408);
    float _1422 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1424 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1426 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1418);
    float _1428 = abs(_1416);
    float _1430 = log2(_1428);
    float _1432 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1434 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1422);
    float _1436 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1426);
    float _1438 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1442 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1434);
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1446 = _1410 * _1366;
    float _1448 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1450 = _1410 * _1382;
    float _1452 = _1410 * _1374;
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1448);
    float _1458 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1460 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1462 = -_1454;
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1462);
    float _1466 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1456);
    float _1470 = -_1458;
    float _1472 = fma(_1470, _1424, 1.0);
    float _1474 = -_1452;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1464);
    float _1478 = exp2(_1466);
    float _1480 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1468);
    float _1482 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1484 = fma(_1476, -0.5, 0.5);
    float _1486 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1488 = fma(_1476, 0.5, 0.5);
    float _1490 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1482);
    float _1492 = _1450 + 1.0;
    float _1494 = log2(_1472);
    float _1496 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1486);
    float _1498 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1500 = fma(_1488, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1502 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1496);
    float _1504 = fma(_1488, _1500, -0.212114393711090087890625);
    float _1506 = 1.0 / _1480;
    float _1508 = -_1450;
    float _1510 = fma(_1478, _1492, _1508);
    float _1512 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1498);
    float _1514 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1516 = fma(_1488, _1504, 1.570728778839111328125);
    float _1518 = fma(_1510, 0.5, 0.5);
    float _1520 = sqrt(_1484);
    float _1522 = _1494 * 0.693147182464599609375;
    float _1524 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1526 = _1512 * _1506;
    float _1528 = _1514 * _1506;
    float _1530 = fma(_1526, 0.5, 0.5);
    float _1532 = fma(_1528, -0.5, 0.5);
    float _1534 = _1520 * 0.636619746685028076171875;
    float3 _4219 = float3(_1530, _1532, _1524);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4219, float3(0.0), isnan(_4219)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4219, float3(0.0), isnan(_4219)), level(0.0)).x;
    float3 _4230 = float3(_1530, _1532, _1524);
    float4 _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4230, float3(0.0), isnan(_4230)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4230, float3(0.0), isnan(_4230)), level(0.0)).xyzw;
    float _1541 = _1539.x;
    float _1543 = _1539.y;
    float _1545 = _1539.z;
    float _1547 = _1539.w;
    float _1549 = -_1516;
    float _1551 = fma(_1534, _1549, 1.0);
    float2 _4252 = float2(_1551, _1518);
    float3 _1555 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4252, float2(0.0), isnan(_4252)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4252, float2(0.0), isnan(_4252)), level(0.0)).xyz;
    float _1557 = _1555.x;
    float _1559 = _1555.y;
    float _1561 = _1555.z;
    float _1563 = in.m_57.y;
    float _1565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1567 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1575 = _1573 != 0;
    float _1577 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1581 = _1579 != 0;
    float _1583 = 1.0 / _1571;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1589 = in.m_57.x;
    bool _1591 = _470 > 0.5;
    float _1593 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1577);
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1595;
    float _1599 = 1.0 / _1587;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1605 = 0.0;
    if (_1581)
    {
        float _1607 = in.m_49.x;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = -_1563;
    float _1613 = _1611 + 1.0;
    float _1615 = _1597 * _1583;
    float _1617 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1619 = exp2(_1567);
    float _1621 = _1563;
    if (_1575)
    {
        float _1623 = _1591 ? _1613 : _1563;
        _1621 = _1623;
    }
    float _1625 = _1621;
    float _1627 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1629 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1617);
    bool _1631 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1633 = isnan(0.5);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1639 = _1635 || _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1643 = _442 + _1641;
    float _1645 = fma(_1627, _1625, -0.5);
    float _1647 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1629);
    float _1649 = _1603 * _1599;
    float _1651 = fma(_1615, _1643, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1653 = -_880;
    float _1655 = fma(_876, _1645, _1653);
    float _1657 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1659 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1661 = isnan(_442);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1673 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1675 = isnan(_442);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1681 = _1677 || _1679;
    float _1683 = float(_1681);
    float _1685 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1657);
    bool _1687 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1689 = isnan(_442);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = -_1669;
    float _1701 = _1699 + 1.0;
    float _1703 = 1.0 / _1671;
    float _1705 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1685);
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1709 = _442 + _1707;
    float _1711 = _1683 * _1701;
    float _1713 = -_1683;
    float _1715 = _1713 + 1.0;
    float _1717 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1719 = _1609 > 0.5;
    bool _1721 = _1719 && _1581;
    float _1723 = fma(_1649, _1709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1725 = _1697 * _1715;
    float _1727 = -_1697;
    float _1729 = _1727 + 1.0;
    float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1733 = _1717 + _1671;
    float _1735 = _1651 * _1725;
    float _1737 = _1725;
    float _1739 = _1647;
    float _1741 = _1711;
    float _1743 = _1723;
    float _1745 = _1669;
    if (!_1639)
    {
        _1737 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1747 = _1737;
    float _1749 = in.m_59.w;
    if (_1581)
    {
        _1739 = _1589;
    }
    float _1751 = _1739;
    float _1753 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1735);
    float _1755 = _1733 * _1703;
    float _1757 = _1755 * 0.5;
    float _1759 = _1757;
    float _1761 = _1751;
    if (!_1581)
    {
        _1170 = _1589;
    }
    float _1763 = _1170;
    float _1765 = -_1619;
    float _1767 = _1765 + 1.0;
    float _1769 = fma(_1723, _1711, _1753);
    float _1771 = _1763;
    if (!_1639)
    {
        _1741 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1773 = _1741;
    if (!_1639)
    {
        float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1777 = fma(_1757, _1747, _1775);
        _1759 = _1777;
    }
    float _1779 = _1759;
    if (_1721)
    {
        float _1781 = -_1751;
        float _1783 = _1781 + 1.0;
        _1761 = _1783;
    }
    float _1785 = _1761;
    float _1787 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1769);
    if (!_1639)
    {
        float _1789 = -_1773;
        float _1791 = _1789 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1743 = _1791;
    }
    float _1793 = _1743;
    float _1795 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1797 = _1779;
    if (!_1639)
    {
        float _1799 = 1.0 / _1779;
        _1797 = _1799;
    }
    float _1801 = _1797;
    if (_1581)
    {
        _1771 = _1785;
    }
    float _1803 = _1771;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1807 = _1655 + 0.5;
    if (_1639)
    {
        _1745 = 1.0;
    }
    float _1809 = _1745;
    float _1811 = fma(_1795, _1803, -0.5);
    float _1813 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1815 = _1793;
    float _1817 = _1809;
    if (!_1639)
    {
        float _1819 = 1.0 / _1793;
        _1815 = _1819;
    }
    float _1821 = _1815;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1825 = fma(_886, _1811, _872);
    float _1827 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1593);
    float _1829 = _1825 + 0.5;
    float _1831 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1835 = _1825;
    if (!_1639)
    {
        float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1839 = -_1773;
        float _1841 = fma(_1801, _1837, _1839);
        _1835 = _1841;
    }
    float _1843 = _1835;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1847 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1827);
    out.m_61.w = _1749;
    if (!_1639)
    {
        float _1851 = _1843 * _1821;
        float _1853 = precise::clamp(_1851, 0.0, 1.0);
        _1817 = _1853;
    }
    float _1855 = _1817;
    float _1857 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_63.x = _1847;
    out.m_63.y = _1813;
    out.m_63.z = _1831;
    out.m_63.w = _1845;
    float _1859 = _1855 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1861 = _1855 > 0.0;
    bool _1863 = isnan(_1855);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan(0.0);
    bool _1869 = _1865 || _1867;
    float _1871 = _1849 + _1480;
    out.gl_Position.x = _1512;
    out.gl_Position.y = _1514;
    out.gl_Position.z = _1849;
    out.gl_Position.w = _1480;
    float _1873 = _1859 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1875 = _1871 * 0.5;
    out.m_65.x = _1829;
    out.m_65.y = _1807;
    out.m_67.z = _1875;
    out.m_67.w = _1480;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1881 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1885 = _1877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1887 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _1873;
    float _1889 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1885;
    out.m_69.y = _1887;
    out.m_69.z = _1889;
    out.m_69.w = _1881;
    float _1891 = _1857 * _1536;
    float _1893 = _1547 * _1891;
    float _1895 = _1561 * _1891;
    float _1897 = -_1857;
    float _1899 = _1897 + 1.0;
    float _1901 = fma(_1557, _1893, _1541);
    float _1903 = fma(_1559, _1893, _1543);
    float _1905 = fma(_1547, _1895, _1545);
    float _1907 = _1547 * _1899;
    out.m_71.x = _1901;
    out.m_71.y = _1903;
    out.m_71.z = _1905;
    out.m_71.w = _1907;
    if (_1869)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1909 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1909;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _440 = false;
    bool _168 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1965 = as_type<float>(_104);
        out.gl_Position.z = _1965;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    float _110 = float(_90);
    float _112 = -_108;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_108);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    bool _126 = _114 >= _110;
    bool _128 = !_124;
    bool _130 = _126 || _128;
    float _132 = _108;
    float _134 = _114;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2030 = as_type<float>(_140);
        out.gl_Position.z = _2030;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = 1.0 / _110;
    bool _144 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _146 = _114 * _142;
    bool _148 = !_144;
    float _166;
    if (!_148)
    {
        float _150 = in.m_49.x;
        float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _154 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _156 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _158 = _156 * _152;
        float _160 = floor(_158);
        float _162 = -_160;
        float _164 = _158 + _162;
        _166 = _164;
        _168 = true;
    }
    else
    {
        _166 = _146;
    }
    _168 = false;
    float _170 = _166;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _174 = _170 + _172;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _178 = _170 + _176;
    bool _180 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _182 = isnan(_170);
    bool _184 = _180 || _182;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _188 = _184 || _186;
    float _190 = float(_188);
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _198 = _196 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _170 + _208;
    float _212 = 1.0 / _198;
    float _214 = 1.0 / _194;
    bool _216 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _218 = isnan(_170);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    bool _228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _230 = 1.0 / _202;
    float _232 = 1.0 / _206;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _170 + _234;
    float _238 = _174 * _214;
    bool _240 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _242 = isnan(_170);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = _236 * _212;
    float _254 = -_190;
    float _256 = _254 + 1.0;
    float _258 = _178 * _230;
    bool _260 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _262 = isnan(_170);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = _250 * _256;
    float _278 = -_250;
    float _280 = _278 + 1.0;
    float _282 = -_270;
    float _284 = _282 + 1.0;
    float _286 = fma(_274, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = _210 * _232;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    float _298 = _270 * _280;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = fma(_292, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _306 = fma(_296, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _308 = _170 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_170);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _328 = fma(_302, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _330 = _318 * _284;
    float _332 = -_318;
    float _334 = _332 + 1.0;
    float _336 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_326, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = _226 * _334;
    float _342 = -_226;
    float _344 = _342 + 1.0;
    float _346 = _286 * _340;
    float _348 = _304 * _340;
    float _350 = _306 * _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].x, _346);
    float _358 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].y, _348);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].z, _350);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_354, _238, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_336, _330, _356);
    float _374 = fma(_328, _330, _358);
    float _376 = fma(_362, _238, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_338, _330, _364);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _388 = fma(_368, _238, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _394 = fma(_370, _298, _372);
    float _396 = fma(_382, _252, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _398 = fma(_386, _252, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _400 = fma(_376, _298, _374);
    float _402 = fma(_392, _252, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _404 = fma(_388, _298, _378);
    float _406 = fma(_396, _276, _394);
    float _408 = fma(_398, _276, _400);
    float _410 = fma(_402, _276, _404);
    float _412 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[147].x, _406);
    float _414 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[147].y, _408);
    float _416 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[147].z, _410);
    bool _418 = !_228;
    int _420 = as_type<int>(_374);
    float _438;
    if (!_418)
    {
        float _422 = in.m_49.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _430 = _428 * _424;
        float _432 = floor(_430);
        float _434 = -_432;
        float _436 = _430 + _434;
        _438 = _436;
        _440 = true;
    }
    else
    {
        _438 = _146;
    }
    _440 = false;
    float _442 = _438;
    float _444 = in.m_51.x;
    float _446 = in.m_51.y;
    float _448 = in.m_51.z;
    float _450 = in.m_49.z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _454 = abs(_446);
    float _456 = precise::max(0.0, _454);
    float _458 = precise::min(_456, 0.15600000321865081787109375);
    float _460 = _458 * 6.41025638580322265625;
    float _462 = _146 * _460;
    float _464 = _462 * 0.75;
    float _466 = _464 * 0.15915493667125701904296875;
    float _468 = in.m_49.x;
    float _470 = in.m_49.y;
    float _472 = _466 * 6.283185482025146484375;
    float _474 = sin(_472);
    float _476 = _466 * 6.283185482025146484375;
    float _478 = cos(_476);
    float _480 = _474 * _448;
    float _482 = _470 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _484 = _478 * _448;
    float _486 = -_480;
    float _488 = fma(_478, _444, _486);
    float _490 = _450 * 2.0;
    float _492 = _470 * 2.0;
    float _494 = fma(_474, _444, _484);
    float _496 = fma(_482, -2.0, _452);
    float _498 = floor(_492);
    float _500 = _494 * 0.0625;
    float _502 = abs(_488);
    float _504 = abs(_494);
    float _506 = precise::max(_502, _504);
    bool _508 = _506 >= 16.0;
    float _510 = _488 * 0.0625;
    float _512 = floor(_490);
    float _514 = _508 ? _500 : _494;
    float _516 = _508 ? _510 : _488;
    float _518 = _468 * 2.0;
    float _520 = abs(_514);
    bool _522 = _520 != 0.0;
    bool _524 = isnan(_520);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = abs(_516);
    bool _534 = _532 == 0.0;
    float _536 = floor(_518);
    float _538 = abs(_516);
    bool _540 = _538 == 0.0;
    bool _542 = !_530;
    bool _544 = _540 && _542;
    bool _546 = _512 > 0.0;
    bool _548 = _512 >= 0.0;
    bool _550 = isnan(_512);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _560 = _468 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _562 = false;
    if (_544)
    {
        bool _564 = as_type<int>(_516) >= 0;
        _562 = _564;
    }
    bool _566 = _562;
    float _568 = -_558;
    float _570 = fma(_560, 2.0, _568);
    int _572 = _566 ? (-1) : 0;
    if (_544)
    {
        int _574 = _566 ? 0 : 1078530011;
        _420 = _574;
    }
    int _576 = _420;
    int _578 = _576;
    if (_544)
    {
        int _580 = int(0x80000000) & as_type<int>(_514);
        int _582 = _576 | _580;
        _578 = _582;
    }
    int _584 = _578;
    bool _586 = !_530;
    bool _588 = _586 && _534;
    int _590 = _584;
    float _592 = as_type<float>(_584);
    if (!_588)
    {
        float _594 = abs(_514);
        bool _596 = _594 != as_type<float>(0x7f800000u /* inf */);
        bool _598 = isnan(_594);
        bool _600 = _596 || _598;
        bool _602 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _604 = _600 || _602;
        float _606 = abs(_516);
        bool _608 = _606 == as_type<float>(0x7f800000u /* inf */);
        float _610 = abs(_516);
        bool _612 = _610 == as_type<float>(0x7f800000u /* inf */);
        bool _614 = !_604;
        bool _616 = _612 && _614;
        if (_616)
        {
            bool _618 = as_type<int>(_516) >= 0;
            _572 = _618 ? (-1) : 0;
        }
        int _620 = _572;
        if (_616)
        {
            _590 = 1075235812;
        }
        int _622 = _590;
        int _624 = _622;
        if (_616)
        {
            int _626 = ~_620;
            int _628 = (_626 != 0) ? _622 : 1061752795;
            _624 = _628;
        }
        int _630 = _624;
        float _632 = as_type<float>(_630);
        if (_616)
        {
            int _634 = int(0x80000000) & as_type<int>(_514);
            int _636 = _630 | _634;
            _632 = as_type<float>(_636);
        }
        float _638 = _632;
        bool _640 = !_604;
        bool _642 = _640 && _608;
        _592 = _638;
        if (!_642)
        {
            float _644 = abs(_514);
            float _646 = abs(_516);
            float _648 = precise::max(_644, _646);
            float _650 = abs(_514);
            float _652 = abs(_516);
            float _654 = precise::min(_650, _652);
            float _656 = 1.0 / _648;
            float _658 = abs(_514);
            float _660 = abs(_516);
            bool _662 = _658 > _660;
            bool _664 = as_type<int>(_516) >= 0;
            float _666 = _654 * _656;
            int _668 = as_type<int>(_514) & int(0x80000000);
            float _670 = _666 * _666;
            float _672 = _670 + 11.33538818359375;
            float _674 = fma(_670, _672, 28.84246826171875);
            float _676 = fma(_670, _674, 19.6966705322265625);
            float _678 = fma(_670, -0.82336294651031494140625, -5.674867153167724609375);
            float _680 = abs(_514);
            float _682 = abs(_516);
            float _684 = _680 + _682;
            float _686 = fma(_670, _678, -6.565555095672607421875);
            float _688 = 1.0 / _676;
            bool _690 = _684 > as_type<float>(0x7f800000u /* inf */);
            bool _692 = isnan(_684);
            bool _694 = _690 || _692;
            bool _696 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _698 = _694 || _696;
            float _700 = _670 * _686;
            float _702 = _666 * _700;
            float _704 = fma(_702, _688, _666);
            float _706 = _704;
            _592 = _684;
            if (_662)
            {
                float _708 = -_704;
                float _710 = _708 + 1.57079637050628662109375;
                _706 = _710;
            }
            float _712 = _706;
            int _714 = as_type<int>(_712);
            if (!_664)
            {
                float _716 = -_712;
                float _718 = _716 + 3.1415927410125732421875;
                _714 = as_type<int>(_718);
            }
            int _720 = _714;
            if (!_698)
            {
                int _722 = _668 | _720;
                _592 = as_type<float>(_722);
            }
        }
    }
    float _724 = _592;
    float _726 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _728 = log2(_726);
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _740 = _738 != 0;
    float _742 = _470 + _468;
    int _744 = _556 ? 0 : 1;
    bool _746 = _536 >= 0.0;
    bool _748 = isnan(_536);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    float _756 = _742 + (-1.0);
    bool _758 = _536 > 0.0;
    bool _760 = !_732;
    int _762 = _760 ? 0 : 1;
    int _764 = ~_744;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    int _770 = _754 ? 0 : 1;
    int _772 = _768;
    if (!_546)
    {
        int _774 = ~_744;
        int _776 = _774 + 1;
        _772 = _776;
    }
    int _778 = _772;
    bool _780 = _498 > 0.0;
    bool _782 = _498 >= 0.0;
    bool _784 = isnan(_498);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = _728 * _114;
    int _794 = abs(_762);
    float _796 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _798 = float(_778);
    float _800 = float(_794);
    float _802 = exp2(_792);
    int _804 = ~_770;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = _800 * _798;
    int _812 = _808;
    if (!_758)
    {
        int _814 = ~_770;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = in.m_53.x;
    float _822 = in.m_53.y;
    float _824 = in.m_53.z;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _828 = 1.0 + _826;
    float _830 = _810 * (-2.0);
    bool _832 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _834 = isnan(1.0);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _840 = _836 || _838;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = 1.0 / _828;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _848 = !_736;
    int _850 = _848 ? 0 : 1;
    float _852 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _854 = -_802;
    float _856 = _854 + 1.0;
    bool _858 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[78].z, _846);
    float _870 = -_114;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[76].x, _570);
    int _874 = abs(_850);
    float _876 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _852);
    float _878 = _866 ? _856 : 0.0;
    float _880 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _496);
    float _882 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.100000016391277313232421875;
    float _884 = float(_818);
    float _886 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _868);
    float _888 = float(_874);
    float _890 = fma(_724, 3.0, _882);
    if (_840)
    {
        float _892 = _878 * _844;
        _134 = _892;
    }
    float _894 = _134;
    bool _896 = !_740;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_830, _820, _820);
    float _902 = _888 * _884;
    float _904 = _468 + (-0.5);
    int _906 = _790 ? 0 : 1;
    float _908 = _470 + _450;
    int _910 = abs(_898);
    float _912 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[196].x, _900);
    float _914 = _908 + (-1.0);
    int _916 = ~_906;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = _890 * 0.15915493667125701904296875;
    int _924 = _920;
    if (!_780)
    {
        int _926 = ~_906;
        int _928 = _926 + 1;
        _924 = _928;
    }
    int _930 = _924;
    float _932 = _902 * (-2.0);
    float _934 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _936 = float(_910);
    float _938 = _470 + (-0.5);
    float _940 = float(_930);
    float _942 = fma(_796, _830, _796);
    float _944 = fma(_932, _822, _822);
    float _946 = fma(_934, _932, _934);
    float _948 = _450 + _468;
    float _950 = fma(_942, _894, _912);
    float _952 = _936 * _940;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].y, _944);
    float _956 = _948 + (-1.0);
    float _958 = in.m_55.x;
    float _960 = in.m_55.y;
    float _962 = in.m_55.z;
    float _964 = _950 * 0.15915493667125701904296875;
    float _966 = _952 * (-2.0);
    float _968 = _922 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = fma(_946, _894, _954);
    float _974 = _450 + (-0.5);
    float _976 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _978 = fma(_966, _824, _824);
    float _980 = _972 * 0.15915493667125701904296875;
    float _982 = fma(_976, _966, _976);
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[196].z, _978);
    float _986 = _964 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _494);
    float _992 = fma(_982, _894, _984);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _488);
    float _996 = _992 * 0.15915493667125701904296875;
    float _998 = _964 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = _970 * 0.0500000007450580596923828125;
    float _1004 = _414 * _960;
    float _1006 = _412 * _958;
    float _1008 = fma(_146, _1002, _446);
    float _1010 = _416 * _962;
    float _1012 = in.m_42.x;
    float _1014 = in.m_42.y;
    float _1016 = in.m_42.z;
    float _1018 = _980 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    float _1022 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1024 = _1004 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1008);
    float _1028 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = _994 * _1022;
    float _1032 = _1026 * _1024;
    float _1034 = _980 * 6.283185482025146484375;
    float _1036 = cos(_1034);
    float _1038 = _990 * _1028;
    float _1040 = _996 * 6.283185482025146484375;
    float _1042 = sin(_1040);
    float _1044 = _988 * _1020;
    float _1046 = _996 * 6.283185482025146484375;
    float _1048 = cos(_1046);
    float _1050 = _1000 * _1036;
    float _1052 = _988 * _1036;
    float _1054 = fma(_1042, _1050, _1044);
    float _1056 = fma(_1042, _1044, _1050);
    float _1058 = _1000 * _1020;
    float _1060 = _1048 * _1032;
    float _1062 = _1020 * _1048;
    float _1064 = _1036 * _1048;
    float _1066 = -_1058;
    float _1068 = fma(_1042, _1052, _1066);
    float _1070 = _1000 * _1060;
    float _1072 = _988 * _1060;
    float _1074 = -_1032;
    float _1076 = _1042 * _1074;
    float _1078 = -_1052;
    float _1080 = fma(_1042, _1058, _1078);
    float _1082 = fma(_1054, _1030, _1070);
    float _1084 = fma(_1068, _1030, _1072);
    float _1086 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1088 = fma(_1064, _1030, _1076);
    float _1090 = fma(_1080, _1038, _1082);
    float _1092 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1094 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1086);
    float _1096 = fma(_1062, _1038, _1088);
    float _1098 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1100 = fma(_1056, _1038, _1084);
    float _1102 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1094);
    float _1104 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1092);
    float _1106 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1098);
    float _1110 = _1102 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1112 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1104);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1106);
    float _1116 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1108);
    float _1118 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1120 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1114);
    float _1124 = _1110 + _1116;
    float _1126 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1118);
    float _1128 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1130 = _1120 + _1122;
    float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1134 = _1124 + _1132;
    float _1136 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1126);
    float _1138 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1128);
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1142 = _1130 + _1140;
    float _1144 = _1134 * _1134;
    float _1146 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1148 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1138);
    float _1150 = fma(_1142, _1142, _1144);
    float _1152 = _1146 + _1148;
    float _1154 = sqrt(_1150);
    bool _1156 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1158 = _1144;
    float _1160 = _1128;
    float _1162 = _1130;
    float _1164 = _1154;
    float _1166 = _1062;
    float _1168 = _1124;
    float _1170 = _1110;
    if (!_1156)
    {
        _1158 = _1124;
    }
    float _1172 = _1158;
    float _1174 = _1172;
    if (!_1156)
    {
        _1160 = _1152;
    }
    float _1176 = _1160;
    bool _1178 = !_1156;
    float _1180 = _1176;
    if (!_1178)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1186 = _1154 + _1184;
        float _1188 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1190 = rsqrt(_1150);
        float _1192 = _1186 * _1182;
        float _1194 = _1192 * 0.15915493667125701904296875;
        float _1196 = _1194 * 6.283185482025146484375;
        float _1198 = cos(_1196);
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        float _1204 = _1198 + (-1.0);
        float _1206 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = fma(_1202, _1188, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1210 = fma(_1152, _1198, _1206);
        float _1212 = _1190 * _1208;
        float _1214 = fma(_1142, _1212, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1216 = fma(_1134, _1212, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1180 = _1210;
        _1162 = _1214;
        _1174 = _1216;
        _1164 = _1186;
    }
    float _1218 = _1180;
    float _1220 = _1162;
    float _1222 = _1174;
    float _1224 = _1164;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1218 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1232 = _1220 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1222 + _1234;
    float _1238 = _1228 * _1228;
    float _1240 = fma(_1232, _1232, _1238);
    float _1242 = fma(_1236, _1236, _1240);
    float _1244 = rsqrt(_1242);
    float _1246 = sqrt(_1242);
    float _1248 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1250 = _1232 * _1248;
    float _1252 = _1236 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 + _1256;
    float _1260 = sqrt(_1258);
    bool _1262 = _1260 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = _1260 + _1264;
    float _1268 = _1244;
    float _1270 = _1258;
    float _1272 = _1266;
    float _1274 = _1224;
    float _1276 = _1228;
    if (_1262)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1278;
    }
    float _1280 = _1268;
    if (_1262)
    {
        float _1282 = rsqrt(_1258);
        _1270 = _1282;
    }
    float _1284 = _1270;
    float _1286 = _1284;
    if (_1262)
    {
        float _1288 = _1266 * _1280;
        _1272 = _1288;
    }
    float _1290 = _1272;
    if (_1262)
    {
        float _1292 = _1290 * 0.15915493667125701904296875;
        _1274 = _1292;
    }
    float _1294 = _1274;
    float _1296 = _1236;
    if (_1262)
    {
        float _1298 = _1294 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        _1296 = _1300;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1306 = precise::max(0.0, _1304);
    float _1308 = _1280;
    float _1310 = _1306;
    if (_1262)
    {
        float _1312 = _1294 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        _1308 = _1314;
    }
    float _1316 = _1308;
    float _1318 = -_1248;
    float _1320 = -_1306;
    float _1322 = fma(_1228, _1318, _1320);
    if (_1262)
    {
        float _1324 = _1322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1276 = _1324;
    }
    float _1326 = _1276;
    float _1328 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1330 = _1326;
    float _1332 = _1302;
    if (_1262)
    {
        float _1334 = fma(_1302, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1330 = _1334;
    }
    float _1336 = _1330;
    float _1338 = _1336;
    if (!_1262)
    {
        _1332 = _1250;
    }
    float _1340 = _1332;
    float _1342 = _1340;
    float _1344 = _1316;
    if (_1262)
    {
        float _1346 = _1316 + (-1.0);
        _1310 = _1346;
    }
    float _1348 = _1310;
    float _1350 = _1348;
    if (_1262)
    {
        float _1352 = _1284 * _1336;
        _1166 = _1352;
    }
    float _1354 = _1166;
    if (!_1262)
    {
        _1338 = _1322;
    }
    float _1356 = _1338;
    float _1358 = _1356;
    if (_1262)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1168 = _1360;
    }
    float _1362 = _1168;
    if (_1262)
    {
        float _1364 = _1250 * _1354;
        _1342 = _1364;
    }
    float _1366 = _1342;
    if (!_1262)
    {
        _1350 = _1252;
    }
    float _1368 = _1350;
    float _1370 = _1368;
    if (_1262)
    {
        float _1372 = _1252 * _1354;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1262)
    {
        _1286 = _1254;
    }
    float _1376 = _1286;
    float _1378 = _1376;
    if (_1262)
    {
        float _1380 = fma(_1322, _1316, _1362);
        _1358 = _1380;
    }
    float _1382 = _1358;
    if (_1262)
    {
        float _1384 = _1366 * _1366;
        _1378 = _1384;
    }
    float _1386 = _1378;
    if (!_1262)
    {
        _1344 = _1256;
    }
    float _1388 = _1344;
    float _1390 = _1388;
    if (_1262)
    {
        float _1392 = _1374 * _1374;
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = fma(_1382, _1382, _1386);
    float _1398 = _1396 + _1394;
    float _1400 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1328);
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1404 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1402);
    float _1406 = precise::clamp(_1404, 0.0, 1.0);
    float _1408 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = rsqrt(_1398);
    float _1412 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1400);
    float _1414 = -_1406;
    float _1416 = _1414 + 1.0;
    float _1418 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1420 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1408);
    float _1422 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1424 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1426 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1418);
    float _1428 = abs(_1416);
    float _1430 = log2(_1428);
    float _1432 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1434 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1422);
    float _1436 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1426);
    float _1438 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1442 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1434);
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1446 = _1410 * _1366;
    float _1448 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1450 = _1410 * _1382;
    float _1452 = _1410 * _1374;
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1448);
    float _1458 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1460 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1462 = -_1454;
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1462);
    float _1466 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1456);
    float _1470 = -_1458;
    float _1472 = fma(_1470, _1424, 1.0);
    float _1474 = -_1452;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1464);
    float _1478 = exp2(_1466);
    float _1480 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1468);
    float _1482 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1484 = fma(_1476, -0.5, 0.5);
    float _1486 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1488 = fma(_1476, 0.5, 0.5);
    float _1490 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1482);
    float _1492 = _1450 + 1.0;
    float _1494 = log2(_1472);
    float _1496 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1486);
    float _1498 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1500 = fma(_1488, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1502 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1496);
    float _1504 = fma(_1488, _1500, -0.212114393711090087890625);
    float _1506 = 1.0 / _1480;
    float _1508 = -_1450;
    float _1510 = fma(_1478, _1492, _1508);
    float _1512 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1498);
    float _1514 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1516 = fma(_1488, _1504, 1.570728778839111328125);
    float _1518 = fma(_1510, 0.5, 0.5);
    float _1520 = sqrt(_1484);
    float _1522 = _1494 * 0.693147182464599609375;
    float _1524 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1526 = _1512 * _1506;
    float _1528 = _1514 * _1506;
    float _1530 = fma(_1526, 0.5, 0.5);
    float _1532 = fma(_1528, -0.5, 0.5);
    float _1534 = _1520 * 0.636619746685028076171875;
    float3 _4219 = float3(_1530, _1532, _1524);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4219, float3(0.0), isnan(_4219)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4219, float3(0.0), isnan(_4219)), level(0.0)).x;
    float3 _4230 = float3(_1530, _1532, _1524);
    float4 _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4230, float3(0.0), isnan(_4230)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4230, float3(0.0), isnan(_4230)), level(0.0)).xyzw;
    float _1541 = _1539.x;
    float _1543 = _1539.y;
    float _1545 = _1539.z;
    float _1547 = _1539.w;
    float _1549 = -_1516;
    float _1551 = fma(_1534, _1549, 1.0);
    float2 _4252 = float2(_1551, _1518);
    float3 _1555 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4252, float2(0.0), isnan(_4252)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4252, float2(0.0), isnan(_4252)), level(0.0)).xyz;
    float _1557 = _1555.x;
    float _1559 = _1555.y;
    float _1561 = _1555.z;
    float _1563 = in.m_57.y;
    float _1565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1567 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1575 = _1573 != 0;
    float _1577 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1581 = _1579 != 0;
    float _1583 = 1.0 / _1571;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1589 = in.m_57.x;
    bool _1591 = _470 > 0.5;
    float _1593 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1577);
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1595;
    float _1599 = 1.0 / _1587;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1605 = 0.0;
    if (_1581)
    {
        float _1607 = in.m_49.x;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = -_1563;
    float _1613 = _1611 + 1.0;
    float _1615 = _1597 * _1583;
    float _1617 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1619 = exp2(_1567);
    float _1621 = _1563;
    if (_1575)
    {
        float _1623 = _1591 ? _1613 : _1563;
        _1621 = _1623;
    }
    float _1625 = _1621;
    float _1627 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1629 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1617);
    bool _1631 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1633 = isnan(0.5);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1639 = _1635 || _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1643 = _442 + _1641;
    float _1645 = fma(_1627, _1625, -0.5);
    float _1647 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1629);
    float _1649 = _1603 * _1599;
    float _1651 = fma(_1615, _1643, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1653 = -_880;
    float _1655 = fma(_876, _1645, _1653);
    float _1657 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1659 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1661 = isnan(_442);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1673 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1675 = isnan(_442);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1681 = _1677 || _1679;
    float _1683 = float(_1681);
    float _1685 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1657);
    bool _1687 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1689 = isnan(_442);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = -_1669;
    float _1701 = _1699 + 1.0;
    float _1703 = 1.0 / _1671;
    float _1705 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1685);
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1709 = _442 + _1707;
    float _1711 = _1683 * _1701;
    float _1713 = -_1683;
    float _1715 = _1713 + 1.0;
    float _1717 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1719 = _1609 > 0.5;
    bool _1721 = _1719 && _1581;
    float _1723 = fma(_1649, _1709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1725 = _1697 * _1715;
    float _1727 = -_1697;
    float _1729 = _1727 + 1.0;
    float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1733 = _1717 + _1671;
    float _1735 = _1651 * _1725;
    float _1737 = _1725;
    float _1739 = _1647;
    float _1741 = _1711;
    float _1743 = _1723;
    float _1745 = _1669;
    if (!_1639)
    {
        _1737 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1747 = _1737;
    float _1749 = in.m_59.w;
    if (_1581)
    {
        _1739 = _1589;
    }
    float _1751 = _1739;
    float _1753 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1735);
    float _1755 = _1733 * _1703;
    float _1757 = _1755 * 0.5;
    float _1759 = _1757;
    float _1761 = _1751;
    if (!_1581)
    {
        _1170 = _1589;
    }
    float _1763 = _1170;
    float _1765 = -_1619;
    float _1767 = _1765 + 1.0;
    float _1769 = fma(_1723, _1711, _1753);
    float _1771 = _1763;
    if (!_1639)
    {
        _1741 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1773 = _1741;
    if (!_1639)
    {
        float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1777 = fma(_1757, _1747, _1775);
        _1759 = _1777;
    }
    float _1779 = _1759;
    if (_1721)
    {
        float _1781 = -_1751;
        float _1783 = _1781 + 1.0;
        _1761 = _1783;
    }
    float _1785 = _1761;
    float _1787 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1769);
    if (!_1639)
    {
        float _1789 = -_1773;
        float _1791 = _1789 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1743 = _1791;
    }
    float _1793 = _1743;
    float _1795 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1797 = _1779;
    if (!_1639)
    {
        float _1799 = 1.0 / _1779;
        _1797 = _1799;
    }
    float _1801 = _1797;
    if (_1581)
    {
        _1771 = _1785;
    }
    float _1803 = _1771;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1807 = _1655 + 0.5;
    if (_1639)
    {
        _1745 = 1.0;
    }
    float _1809 = _1745;
    float _1811 = fma(_1795, _1803, -0.5);
    float _1813 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1815 = _1793;
    float _1817 = _1809;
    if (!_1639)
    {
        float _1819 = 1.0 / _1793;
        _1815 = _1819;
    }
    float _1821 = _1815;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1825 = fma(_886, _1811, _872);
    float _1827 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1593);
    float _1829 = _1825 + 0.5;
    float _1831 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1835 = _1825;
    if (!_1639)
    {
        float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1839 = -_1773;
        float _1841 = fma(_1801, _1837, _1839);
        _1835 = _1841;
    }
    float _1843 = _1835;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1847 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1827);
    out.m_61.w = _1749;
    if (!_1639)
    {
        float _1851 = _1843 * _1821;
        float _1853 = precise::clamp(_1851, 0.0, 1.0);
        _1817 = _1853;
    }
    float _1855 = _1817;
    float _1857 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_63.x = _1847;
    out.m_63.y = _1813;
    out.m_63.z = _1831;
    out.m_63.w = _1845;
    float _1859 = _1855 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1861 = _1855 > 0.0;
    bool _1863 = isnan(_1855);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan(0.0);
    bool _1869 = _1865 || _1867;
    float _1871 = _1849 + _1480;
    out.gl_Position.x = _1512;
    out.gl_Position.y = _1514;
    out.gl_Position.z = _1849;
    out.gl_Position.w = _1480;
    float _1873 = _1859 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1875 = _1871 * 0.5;
    out.m_65.x = _1829;
    out.m_65.y = _1807;
    out.m_67.z = _1875;
    out.m_67.w = _1480;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1881 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1885 = _1877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1887 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _1873;
    float _1889 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1885;
    out.m_69.y = _1887;
    out.m_69.z = _1889;
    out.m_69.w = _1881;
    float _1891 = _1857 * _1536;
    float _1893 = _1547 * _1891;
    float _1895 = _1561 * _1891;
    float _1897 = -_1857;
    float _1899 = _1897 + 1.0;
    float _1901 = fma(_1557, _1893, _1541);
    float _1903 = fma(_1559, _1893, _1543);
    float _1905 = fma(_1547, _1895, _1545);
    float _1907 = _1547 * _1899;
    out.m_71.x = _1901;
    out.m_71.y = _1903;
    out.m_71.z = _1905;
    out.m_71.w = _1907;
    if (_1869)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1909 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1909;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

