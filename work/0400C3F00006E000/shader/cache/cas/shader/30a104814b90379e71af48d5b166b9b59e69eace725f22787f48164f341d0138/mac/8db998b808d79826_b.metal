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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_79 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_83 [[user(locn12)]];
    float4 m_81 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 m_91 [[user(locn15)]];
    float4 m_87 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad9 [[user(locn9)]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad9 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_124)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_134);
        out.gl_Position.z = _2781;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _138 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_111);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_116);
    bool _150 = _120 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _136 = as_type<int>(_160);
    }
    int _162 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2837 = as_type<float>(_162);
        out.gl_Position.z = _2837;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_55.z;
    float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _168 = log2(_166);
    float _170 = in.m_55.x;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _174 = _172 != 0;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _182 = _180 != 0;
    float _184 = in.m_55.y;
    float _186 = in.m_46.x;
    float _188 = in.m_46.y;
    float _190 = in.m_46.z;
    float _192 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _194 = _120 * _168;
    float _196 = -_192;
    float _198 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _196);
    float _200 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _202 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _204 = _164 * 2.0;
    float _206 = -_200;
    float _208 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _206);
    float _210 = -_202;
    float _212 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _210);
    float _214 = floor(_204);
    float _216 = _170 * 2.0;
    float _218 = _184 + _164;
    float _220 = floor(_216);
    float _222 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _224 = _184 * 2.0;
    float _226 = _218 + (-1.0);
    float _228 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _222);
    float _230 = _198 * _198;
    float _232 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _234 = exp2(_194);
    bool _236 = _214 > 0.0;
    float _238 = _184 + _170;
    bool _240 = _214 >= 0.0;
    bool _242 = isnan(_214);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    float _250 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _228);
    float _252 = _238 + (-1.0);
    int _254 = _248 ? 0 : 1;
    float _256 = floor(_224);
    bool _258 = _220 > 0.0;
    float _260 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _262 = ~_254;
    int _264 = _262 + 1;
    int _266 = _264 + 1;
    float _268 = _188 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _270 = _220 >= 0.0;
    bool _272 = isnan(_220);
    bool _274 = _270 || _272;
    bool _276 = isnan(0.0);
    bool _278 = _274 || _276;
    float _280 = fma(_208, _208, _230);
    int _282 = _266;
    bool _284 = _278;
    float _286 = _164;
    float _288 = _170;
    if (!_236)
    {
        int _290 = ~_254;
        int _292 = _290 + 1;
        _282 = _292;
    }
    int _294 = _282;
    float _296 = -_234;
    float _298 = _296 + 1.0;
    float _300 = _188 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _310 = _306 || _308;
    float _312 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].x, _268);
    bool _314 = !_174;
    int _316 = _314 ? 0 : 1;
    float _318 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    bool _320 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _322 = isnan(1.0);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _328 = _324 || _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _332 = 1.0 + _330;
    float _334 = _310 ? _298 : 0.0;
    float _336 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[6].z, _318);
    bool _338 = _256 > 0.0;
    float _340 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    bool _342 = _256 >= 0.0;
    bool _344 = isnan(_256);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = 1.0 / _332;
    int _354 = abs(_316);
    float _356 = _336 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _358 = float(_294);
    float _360 = fma(_212, _212, _280);
    float _362 = float(_354);
    float _364 = -_356;
    float _366 = _364 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _368 = _278 ? 0 : 1;
    float _370 = rsqrt(_250);
    float _372 = _340 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _374 = _362 * _358;
    int _376 = _350 ? 0 : 1;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _380 = _372 + _378;
    int _382 = ~_368;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    bool _388 = !_178;
    int _390 = _388 ? 0 : 1;
    float _392 = _334 * _352;
    int _394 = _386;
    float _396 = _380;
    float _398 = _366;
    if (!_258)
    {
        int _400 = ~_368;
        int _402 = _400 + 1;
        _394 = _402;
    }
    int _404 = _394;
    float _406 = _374 * (-2.0);
    float _408 = abs(_380);
    float _410 = abs(_366);
    float _412 = precise::max(_408, _410);
    float _414 = _170 * 6.283185482025146484375;
    int _416 = ~_376;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    float _422 = rsqrt(_360);
    int _424 = abs(_390);
    int _426 = _420;
    if (!_338)
    {
        int _428 = ~_376;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = fma(_260, _406, _260);
    bool _436 = _412 >= 16.0;
    float _438 = fma(_120, 0.02999999932944774627685546875, _414);
    float _440 = float(_424);
    float _442 = _170 + (-0.5);
    float _444 = float(_404);
    float _446 = _438 * 0.15915493667125701904296875;
    bool _448 = !_328;
    float _450 = _448 ? _120 : _392;
    float _452 = _442 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _454 = float(_432);
    float _456 = _440 * _444;
    float _458 = _370 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _460 = fma(_450, _434, _452);
    bool _462 = !_182;
    int _464 = _462 ? 0 : 1;
    if (_436)
    {
        float _466 = _380 * 0.0625;
        _396 = _466;
    }
    float _468 = _396;
    float _470 = _458 * (-0.699999988079071044921875);
    float _472 = _366 * 0.0625;
    int _474 = abs(_464);
    float _476 = _170 + _164;
    float _478 = in.m_57.x;
    float _480 = in.m_57.y;
    float _482 = in.m_57.z;
    float _484 = _470 * 0.15915493667125701904296875;
    float _486 = _436 ? _472 : _366;
    float _488 = _476 + (-1.0);
    float _490 = abs(_468);
    bool _492 = _490 != 0.0;
    bool _494 = isnan(_490);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = in.m_59.x;
    float _504 = in.m_59.y;
    float _506 = in.m_59.z;
    float _508 = float(_474);
    float _510 = _460 * 0.15915493667125701904296875;
    float _512 = abs(_486);
    bool _514 = _512 == 0.0;
    bool _516 = !_500;
    bool _518 = _514 && _516;
    float _520 = _456 * (-2.0);
    float _522 = abs(_486);
    bool _524 = _522 == 0.0;
    float _526 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _528 = _446 * 6.283185482025146484375;
    float _530 = sin(_528);
    float _532 = _508 * _454;
    float _534 = fma(_232, _520, _232);
    float _536 = _164 + (-0.5);
    float _538 = _184 + (-0.5);
    float _540 = _532 * (-2.0);
    float _542 = _536 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _544 = _484 * 6.283185482025146484375;
    float _546 = sin(_544);
    float _548 = _538;
    if (_518)
    {
        bool _550 = as_type<int>(_486) >= 0;
        _284 = _550;
    }
    bool _552 = _284;
    float _554 = fma(_526, _540, _526);
    float _556 = _538 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _558 = 0;
    int _560 = _552 ? (-1) : 0;
    int _562 = as_type<int>(_554);
    if (_518)
    {
        int _564 = _552 ? 0 : 1078530011;
        _558 = _564;
    }
    int _566 = _558;
    float _568 = fma(_450, _554, _542);
    float _570 = fma(_450, _534, _556);
    float _572 = _510 * 6.283185482025146484375;
    float _574 = sin(_572);
    if (_518)
    {
        int _576 = int(0x80000000) & as_type<int>(_468);
        int _578 = _566 | _576;
        _548 = as_type<float>(_578);
    }
    float _580 = _548;
    float _582 = _510 * 6.283185482025146484375;
    float _584 = cos(_582);
    bool _586 = !_500;
    bool _588 = _586 && _524;
    float _590 = _580;
    float _592 = _580;
    if (!_588)
    {
        float _594 = abs(_468);
        bool _596 = _594 != as_type<float>(0x7f800000u /* inf */);
        bool _598 = isnan(_594);
        bool _600 = _596 || _598;
        bool _602 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _604 = _600 || _602;
        float _606 = abs(_486);
        bool _608 = _606 == as_type<float>(0x7f800000u /* inf */);
        float _610 = abs(_486);
        bool _612 = _610 == as_type<float>(0x7f800000u /* inf */);
        bool _614 = !_604;
        bool _616 = _612 && _614;
        if (_616)
        {
            bool _618 = as_type<int>(_486) >= 0;
            _560 = _618 ? (-1) : 0;
        }
        int _620 = _560;
        if (_616)
        {
            _562 = 1075235812;
        }
        int _622 = _562;
        int _624 = _622;
        if (_616)
        {
            int _626 = ~_620;
            int _628 = (_626 != 0) ? _622 : 1061752795;
            _624 = _628;
        }
        int _630 = _624;
        if (_616)
        {
            int _632 = int(0x80000000) & as_type<int>(_468);
            int _634 = _630 | _632;
            _590 = as_type<float>(_634);
        }
        float _636 = _590;
        bool _638 = !_604;
        bool _640 = _638 && _608;
        _592 = _636;
        if (!_640)
        {
            float _642 = abs(_468);
            float _644 = abs(_486);
            float _646 = precise::max(_642, _644);
            float _648 = abs(_468);
            float _650 = abs(_486);
            float _652 = precise::min(_648, _650);
            float _654 = 1.0 / _646;
            float _656 = abs(_468);
            float _658 = abs(_486);
            bool _660 = _656 > _658;
            bool _662 = as_type<int>(_486) >= 0;
            float _664 = abs(_468);
            float _666 = abs(_486);
            float _668 = _664 + _666;
            bool _670 = _668 > as_type<float>(0x7f800000u /* inf */);
            bool _672 = isnan(_668);
            bool _674 = _670 || _672;
            bool _676 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _678 = _674 || _676;
            float _680 = _652 * _654;
            float _682 = _680 * _680;
            float _684 = _682 + 11.33538818359375;
            float _686 = fma(_682, _684, 28.84246826171875);
            float _688 = fma(_682, _686, 19.6966705322265625);
            float _690 = fma(_682, -0.82336294651031494140625, -5.674867153167724609375);
            float _692 = fma(_682, _690, -6.565555095672607421875);
            float _694 = 1.0 / _688;
            float _696 = _682 * _692;
            float _698 = _680 * _696;
            float _700 = fma(_698, _694, _680);
            int _702 = as_type<int>(_468) & int(0x80000000);
            float _704 = _700;
            _592 = _668;
            if (_660)
            {
                float _706 = -_700;
                float _708 = _706 + 1.57079637050628662109375;
                _704 = _708;
            }
            float _710 = _704;
            int _712 = as_type<int>(_710);
            if (!_662)
            {
                float _714 = -_710;
                float _716 = _714 + 3.1415927410125732421875;
                _712 = as_type<int>(_716);
            }
            int _718 = _712;
            if (!_678)
            {
                int _720 = _702 | _718;
                _592 = as_type<float>(_720);
            }
        }
    }
    float _722 = _592;
    float _724 = -_722;
    float _726 = _570 + _724;
    float _728 = _188 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _730 = in.m_61.y;
    float _732 = _726 * 0.15915493667125701904296875;
    float _734 = _568 * 0.15915493667125701904296875;
    float _736 = _502 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _738 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].x, _728);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _742 = fma(_740, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _744 = _734 * 6.283185482025146484375;
    float _746 = cos(_744);
    float _748 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = _504 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _478);
    float _754 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[5].z, _738);
    float _756 = _506 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _480);
    float _760 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _762 = _732 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _752 * _748;
    float _768 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _770 = _198 * _422;
    float _772 = _758 * _760;
    float _774 = _208 * _422;
    float _776 = _212 * _422;
    float _778 = -_730;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _782 = _732 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _770 * _770;
    float _788 = _574 * _746;
    float _790 = _530 * _780;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _482);
    float _794 = fma(_774, _774, _786);
    float _796 = _584 * _746;
    float _798 = _754 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = _734 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _574 * _764;
    float _806 = _764 * _746;
    float _808 = _792 * _768;
    float _810 = _742 * _790;
    float _812 = _584 * _784;
    float _814 = _574 * _784;
    float _816 = _784 * _746;
    float _818 = fma(_776, _776, _794);
    float _820 = _484 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _584 * _764;
    float _826 = _796 * _772;
    float _828 = _788 * _772;
    float _830 = fma(_802, _812, _804);
    float _832 = fma(_802, _804, _812);
    float _834 = -_772;
    float _836 = _802 * _834;
    float _838 = -_824;
    float _840 = fma(_802, _814, _838);
    float _842 = rsqrt(_818);
    float _844 = -_814;
    float _846 = fma(_802, _824, _844);
    float _848 = fma(_816, _766, _836);
    float _850 = fma(_830, _766, _826);
    float _852 = fma(_840, _766, _828);
    float _854 = fma(_806, _808, _848);
    float _856 = fma(_846, _808, _850);
    float _858 = fma(_832, _808, _852);
    float _860 = -_822;
    float _862 = _860 + 1.0;
    float _864 = _372 + _854;
    float _866 = _798 + _856;
    float _868 = _356 + _858;
    float _870 = fma(_774, _810, _864);
    float _872 = fma(_770, _810, _866);
    float _874 = _774 * _842;
    float _876 = _770 * _842;
    float _878 = _776 * _842;
    float _880 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _882 = _872 + _880;
    float _884 = _874 * _546;
    float _886 = _876 * _546;
    float _888 = _878 * _546;
    float _890 = _874 * _862;
    float _892 = _876 * _862;
    float _894 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _896 = _870 + _894;
    float _898 = fma(_776, _810, _868);
    float _900 = fma(_876, _890, _888);
    float _902 = fma(_876, _892, _822);
    float _904 = -_888;
    float _906 = fma(_876, _890, _904);
    float _908 = fma(_874, _890, _822);
    float _910 = -_886;
    float _912 = fma(_878, _890, _910);
    float _914 = fma(_878, _890, _886);
    float _916 = _902 * _882;
    float _918 = fma(_878, _892, _884);
    float _920 = -_884;
    float _922 = fma(_878, _892, _920);
    float _924 = _906 * _882;
    float _926 = fma(_900, _896, _916);
    float _928 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _930 = _898 + _928;
    float _932 = _878 * _878;
    float _934 = _918 * _882;
    float _936 = fma(_908, _896, _924);
    float _938 = fma(_922, _930, _926);
    float _940 = fma(_862, _932, _822);
    float _942 = fma(_912, _896, _934);
    float _944 = fma(_914, _930, _936);
    float _946 = _938 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _948 = _938 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _950 = fma(_940, _930, _942);
    float _952 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].y, _946);
    float _954 = _938 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].x, _948);
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _960 = _958 != 0;
    float _962 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].y, _952);
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].z, _954);
    float _966 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].x, _956);
    float _968 = _962 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _970 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].z, _964);
    float _972 = _966 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _974 = _968 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _976 = _970 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _978 = _968 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _980 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[10].x, _974);
    float _982 = _822;
    float _984 = _976;
    float _986 = _972;
    float _988 = _764;
    if (!_960)
    {
        _982 = 0.0;
    }
    float _990 = _982;
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[8].x, _978);
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[10].z, _980);
    float _996 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].z, _992);
    float _998 = _994 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1000 = _996 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1004 = _998 + _1002;
    bool _1006 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.5);
    bool _1014 = _1010 || _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1018 = _1000 + _1016;
    float _1020 = _1004 * _1004;
    float _1022 = fma(_1018, _1018, _1020);
    float _1024 = _968 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1026 = sqrt(_1022);
    float _1028 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1024);
    float _1030 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1028);
    float _1032 = _1028;
    float _1034 = _990;
    float _1036 = _998;
    float _1038 = _1000;
    float _1040 = _1022;
    if (!_960)
    {
        _1032 = 0.0;
    }
    float _1042 = _1032;
    float _1044 = _1042;
    if (!_960)
    {
        _984 = 0.0;
    }
    float _1046 = _984;
    float _1048 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1050 = _1026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1052 = !_960;
    float _1054 = _1046;
    float _1056 = _1048;
    bool _1058 = _1050;
    if (!_1052)
    {
        float _1060 = -_798;
        float _1062 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1064 = -_372;
        float _1066 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1068 = _1062 * _1062;
        float _1070 = fma(_1066, _1066, _1068);
        float _1072 = fma(_366, _366, _1070);
        float _1074 = rsqrt(_1072);
        float _1076 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1078 = _1066 * _1076;
        float _1080 = _1062 * _1076;
        float _1082 = _366 * _1076;
        _1044 = _1078;
        _1054 = _1080;
        _1034 = _1082;
    }
    float _1084 = _1044;
    float _1086 = _1054;
    float _1088 = _1034;
    if (!_1050)
    {
        _986 = _1048;
    }
    float _1090 = _986;
    bool _1092 = !_1050;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1026 + _1098;
        float _1102 = rsqrt(_1022);
        float _1104 = _1100 * _1096;
        float _1106 = _1048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = _1104 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = fma(_1116, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1124 = fma(_1048, _1112, _1120);
        float _1126 = _1102 * _1122;
        float _1128 = fma(_1018, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_1004, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1094 = _1124;
        _1036 = _1130;
        _1038 = _1128;
        _1040 = _1102;
        _398 = _1108;
    }
    float _1132 = _1094;
    float _1134 = _1036;
    float _1136 = _1038;
    float _1138 = _1040;
    float _1140 = _398;
    float _1142 = _372 + _1084;
    float _1144 = _1086 + _1132;
    float _1146 = _1088 + _1134;
    float _1148 = _1084 + _1136;
    float _1150 = _798 + _1086;
    float _1152 = _356 + _1088;
    float _1154 = _1144;
    float _1156 = _1148;
    float _1158 = _1146;
    float _1160 = _1138;
    float _1162 = _1136;
    float _1164 = _1140;
    if (!_1014)
    {
        float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1168 = _1150 + _1166;
        float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1172 = _1142 + _1170;
        float _1174 = -_372;
        float _1176 = _1174 + _1136;
        float _1178 = -_798;
        float _1180 = _1178 + _1132;
        float _1182 = _1168 * _1168;
        float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1186 = _1152 + _1184;
        float _1188 = -_356;
        float _1190 = _1188 + _1134;
        float _1192 = fma(_1172, _1172, _1182);
        float _1194 = fma(_1186, _1186, _1192);
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1198 = sqrt(_1194);
        float _1200 = precise::min(_1198, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1202 = _1200 * _1196;
        float _1204 = fma(_1176, _1202, _1142);
        float _1206 = fma(_1180, _1202, _1150);
        float _1208 = fma(_1190, _1202, _1152);
        _1154 = _1206;
        _1156 = _1204;
        _1158 = _1208;
        _1056 = _1182;
        _1160 = _1198;
        _1162 = _1176;
    }
    float _1210 = _1154;
    float _1212 = _1156;
    float _1214 = _1158;
    float _1216 = _1056;
    float _1218 = _1160;
    float _1220 = _1162;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1224 = _1210 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1228 = _1212 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1232 = _1214 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1238 = fma(_1228, _1228, _1234);
    float _1240 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1236);
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1244 = fma(_1232, _1232, _1238);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1228 * _1250;
    float _1254 = _1232 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1220;
    float _1274 = _1268;
    float _1276 = _1216;
    float _1278 = _1218;
    float _1280 = _1228;
    float _1282 = _1224;
    if (_1264)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1284;
    }
    float _1286 = _1270;
    if (_1264)
    {
        float _1288 = rsqrt(_1260);
        _1272 = _1288;
    }
    float _1290 = _1272;
    float _1292 = _1290;
    if (_1264)
    {
        float _1294 = _1268 * _1286;
        _1274 = _1294;
    }
    float _1296 = _1274;
    if (_1264)
    {
        float _1298 = _1296 * 0.15915493667125701904296875;
        _1276 = _1298;
    }
    float _1300 = _1276;
    float _1302 = _1286;
    float _1304 = _1300;
    if (_1264)
    {
        float _1306 = _1300 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        _1302 = _1308;
    }
    float _1310 = _1302;
    float _1312 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1314 = precise::max(0.0, _1312);
    float _1316 = _930;
    if (_1264)
    {
        float _1318 = _1300 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        _1316 = _1320;
    }
    float _1322 = _1316;
    float _1324 = -_1250;
    float _1326 = -_1314;
    float _1328 = fma(_1224, _1324, _1326);
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1264)
    {
        float _1332 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1278 = _1332;
    }
    float _1334 = _1278;
    float _1336 = _1334;
    if (!_1264)
    {
        _1304 = _1328;
    }
    float _1338 = _1304;
    float _1340 = fma(_1142, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1342 = _1338;
    if (_1264)
    {
        float _1344 = fma(_1310, _1334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1344;
    }
    float _1346 = _1164;
    float _1348 = floor(_1340);
    float _1350 = _1346;
    if (_1264)
    {
        float _1352 = _1322 + (-1.0);
        _1336 = _1352;
    }
    float _1354 = _1336;
    float _1356 = _1354;
    if (_1264)
    {
        float _1358 = _1290 * _1346;
        _988 = _1358;
    }
    float _1360 = _988;
    if (!_1264)
    {
        _1292 = _1252;
    }
    float _1362 = _1292;
    float _1364 = _1362;
    if (_1264)
    {
        float _1366 = _1354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1330 = _1366;
    }
    float _1368 = _1330;
    float _1370 = _1368;
    if (_1264)
    {
        float _1372 = _1252 * _1360;
        _1364 = _1372;
    }
    float _1374 = _1364;
    if (!_1264)
    {
        _1350 = _1254;
    }
    float _1376 = _1350;
    float _1378 = _1376;
    if (_1264)
    {
        float _1380 = _1254 * _1360;
        _1378 = _1380;
    }
    float _1382 = _1378;
    if (!_1264)
    {
        _1356 = _1256;
    }
    float _1384 = _1356;
    float _1386 = _1384;
    if (_1264)
    {
        float _1388 = fma(_1328, _1322, _1368);
        _1342 = _1388;
    }
    float _1390 = _1342;
    if (_1264)
    {
        float _1392 = _1374 * _1374;
        _1386 = _1392;
    }
    float _1394 = _1386;
    if (!_1264)
    {
        _1370 = _1258;
    }
    float _1396 = _1370;
    float _1398 = _1396;
    if (_1264)
    {
        float _1400 = _1382 * _1382;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1406 = fma(_1390, _1390, _1394);
    float _1408 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1410 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1404);
    float _1414 = _1406 + _1402;
    float _1416 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1408);
    float _1418 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1412);
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1424 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1422);
    float _1426 = precise::clamp(_1424, 0.0, 1.0);
    float _1428 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1416);
    float _1430 = rsqrt(_1414);
    float _1432 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1434 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1436 = -_1426;
    float _1438 = _1436 + 1.0;
    float _1440 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1446 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1240);
    float _1448 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1450 = abs(_1438);
    float _1452 = log2(_1450);
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1444);
    float _1456 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1458 = -_1448;
    float _1460 = fma(_1458, _1242, 1.0);
    float _1462 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1454);
    float _1464 = _1430 * _1374;
    float _1466 = _1430 * _1382;
    float _1468 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    float _1470 = _1430 * _1390;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1474 = fma(_1152, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1476 = -_1348;
    float _1478 = _1340 + _1476;
    float _1480 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = -_1472;
    float _1484 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = floor(_1474);
    float _1488 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1490 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1492 = -_1466;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1496 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = _1470 + 1.0;
    float _1500 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1502 = fma(_1494, -0.5, 0.5);
    float _1504 = exp2(_1488);
    float _1506 = fma(_1494, 0.5, 0.5);
    float _1508 = fma(_1506, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1510 = sqrt(_1502);
    float _1512 = -_1486;
    float _1514 = _1474 + _1512;
    float _1516 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1518 = fma(_1506, _1508, -0.212114393711090087890625);
    float _1520 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1516);
    float _1522 = fma(_1506, _1518, 1.570728778839111328125);
    float _1524 = log2(_1460);
    float _1526 = -_1470;
    float _1528 = fma(_1504, _1498, _1526);
    float _1530 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1532 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1520);
    float _1534 = 1.0 / _1468;
    float _1536 = _1510 * 0.636619746685028076171875;
    float _1538 = -_1522;
    float _1540 = fma(_1536, _1538, 1.0);
    float _1542 = fma(_1528, 0.5, 0.5);
    float _1544 = _1524 * 0.693147182464599609375;
    float2 _4967 = float2(_1478, _1514);
    float _1546 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4967, float2(0.0), isnan(_4967)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4967, float2(0.0), isnan(_4967)), level(0.0)).x;
    float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1550 = _1530 * _1534;
    float _1552 = _1532 * _1534;
    float _1554 = fma(_1550, 0.5, 0.5);
    float _1556 = fma(_1552, -0.5, 0.5);
    float3 _4992 = float3(_1554, _1556, _1548);
    float _1558 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4992, float3(0.0), isnan(_4992)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4992, float3(0.0), isnan(_4992)), level(0.0)).x;
    float3 _5003 = float3(_1554, _1556, _1548);
    float4 _1561 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5003, float3(0.0), isnan(_5003)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5003, float3(0.0), isnan(_5003)), level(0.0)).xyzw;
    float _1563 = _1561.x;
    float _1565 = _1561.y;
    float _1567 = _1561.z;
    float _1569 = _1561.w;
    float2 _5019 = float2(_1540, _1542);
    float3 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5019, float2(0.0), isnan(_5019)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5019, float2(0.0), isnan(_5019)), level(0.0)).xyz;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = in.m_61.x;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1585 = _1583 != 0;
    float _1587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1589 = in.m_55.w;
    bool _1591 = _184 > 0.5;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1595 = _1593 != 0;
    out.m_63.y = _730;
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1599 = _1597 != 0;
    float _1601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1603 = -_730;
    float _1605 = _1603 + 1.0;
    out.m_65.x = _1228;
    out.m_65.y = _1224;
    out.m_65.z = _1232;
    float _1607 = _1468;
    if (_1585)
    {
        bool _1609 = _170 > 0.5;
        _1058 = _1609;
    }
    bool _1611 = _1058;
    bool _1613 = _164 > 0.5;
    float _1615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1617 = 0;
    float _1619 = _1581;
    if (_1585)
    {
        float _1621 = -_1581;
        float _1623 = _1621 + 1.0;
        _1617 = as_type<int>(_1623);
    }
    int _1625 = _1617;
    float _1627 = 0.0;
    if (!_1585)
    {
        _1627 = _1581;
    }
    float _1629 = _1627;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1635 = _1629;
    if (_1585)
    {
        float _1637 = _1611 ? as_type<float>(_1625) : _1581;
        _1635 = _1637;
    }
    float _1639 = _1635;
    int _1641 = 0;
    if (_1599)
    {
        float _1643 = -_1581;
        float _1645 = _1643 + 1.0;
        _1641 = as_type<int>(_1645);
    }
    int _1647 = _1641;
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1651 = _1649 != 0;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1655 = _1591 ? as_type<int>(_1605) : as_type<int>(_730);
    bool _1657 = _1589 > 0.5;
    float _1659 = _1651 ? as_type<float>(_1655) : _730;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1663 = _1657 ? as_type<int>(_1605) : as_type<int>(_730);
    float _1665 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1669 = _1667 != 0;
    int _1671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1673 = _1671 != 0;
    float _1675 = fma(_1665, -2.0, _1661);
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1679 = _1677 != 0;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1683 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1685 = _1613 ? as_type<int>(_1605) : as_type<int>(_730);
    float _1687 = -_1681;
    float _1689 = fma(_1683, 2.0, _1687);
    float _1691 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1693 = _1601;
    float _1695 = _1691;
    float _1697 = _1661;
    if (!_1595)
    {
        _1693 = _184;
    }
    float _1699 = _1693;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1703 = _1673 ? as_type<float>(_1685) : _730;
    int _1705 = 0;
    float _1707 = _1699;
    if (_1669)
    {
        float _1709 = -_1581;
        float _1711 = _1709 + 1.0;
        _1705 = as_type<int>(_1711);
    }
    int _1713 = _1705;
    bool _1715 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(0.5);
    bool _1723 = _1719 || _1721;
    float _1725 = fma(_1691, _1659, -0.5);
    if (_1595)
    {
        _1695 = _170;
    }
    float _1727 = _1695;
    float _1729 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1701);
    float _1731 = _1727;
    if (!_1595)
    {
        _1697 = _1699;
    }
    float _1733 = _1697;
    float _1735 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1631);
    float _1737 = _1733;
    if (_1595)
    {
        _1707 = _184;
    }
    float _1739 = _1707;
    float _1741 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1729);
    float _1743 = _1741;
    float _1745 = _1739;
    if (!_1595)
    {
        _1731 = _164;
    }
    float _1747 = _1731;
    float _1749 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1675);
    float _1751 = _1679 ? as_type<float>(_1663) : _730;
    float _1753 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1755 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1759 = -_1749;
    float _1761 = fma(_1741, _1725, _1759);
    float _1763 = fma(_1755, _1703, -0.5);
    float _1765 = -_1757;
    float _1767 = fma(_1753, 2.0, _1765);
    bool _1769 = _480 != 0.0;
    bool _1771 = isnan(_480);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan(0.0);
    bool _1777 = _1773 || _1775;
    float _1779 = in.m_67.x;
    float _1781 = in.m_67.y;
    float _1783 = in.m_67.z;
    if (_1595)
    {
        _1737 = _170;
    }
    float _1785 = _1737;
    float _1787 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1789 = _478 == 0.0;
    bool _1791 = !_1777;
    bool _1793 = _1789 && _1791;
    float _1795 = -_120;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1767);
    float _1799 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1787);
    float _1801 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1803 = _482 == 0.0;
    bool _1805 = _1803 && _1793;
    float _1807 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1809 = _1785;
    if (!_1669)
    {
        _1743 = _1581;
    }
    float _1811 = _1743;
    float _1813 = -_1653;
    float _1815 = fma(_1801, 2.0, _1813);
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1819 = _1811;
    float _1821 = _1817;
    if (_1669)
    {
        float _1823 = _1613 ? as_type<float>(_1713) : _1581;
        _1819 = _1823;
    }
    float _1825 = _1819;
    float _1827 = -_120;
    float _1829 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1815);
    float _1831 = 0.0;
    if (!_1595)
    {
        _1831 = _164;
    }
    float _1833 = _1831;
    float _1835 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1837 = _1833;
    float _1839 = _1835;
    if (_1599)
    {
        float _1841 = _1591 ? as_type<float>(_1647) : _1581;
        _1619 = _1841;
    }
    float _1843 = _1619;
    float _1845 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1817);
    if (_1595)
    {
        _1837 = _1739;
    }
    float _1847 = _1837;
    float _1849 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1835);
    if (_1595)
    {
        _286 = _1739;
    }
    float _1851 = _286;
    float _1853 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1845);
    float _1855 = _1851;
    if (_1805)
    {
        _1839 = _1779;
    }
    float _1857 = _1839;
    float _1859 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1861 = _1857;
    if (!_1595)
    {
        _1745 = _170;
    }
    float _1863 = _1745;
    float _1865 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1849);
    if (_1805)
    {
        _288 = _1857;
    }
    float _1867 = _288;
    float _1869 = _1867;
    if (!_1805)
    {
        _1861 = _1779;
    }
    float _1871 = _1861;
    float _1873 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1805)
    {
        _1821 = _1783;
    }
    float _1875 = _1821;
    float _1877 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1879 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1881 = _1875;
    if (!_1805)
    {
        float _1883 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1871);
        _1869 = _1883;
    }
    float _1885 = _1869;
    if (_1805)
    {
        _1809 = _1875;
    }
    float _1887 = _1809;
    float _1889 = fma(_1877, _1843, -0.5);
    float _1891 = _1887;
    if (!_1805)
    {
        _1881 = _1783;
    }
    float _1893 = _1881;
    float _1895 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1897 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1879);
    float _1899 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_1805)
    {
        float _1901 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1893);
        _1891 = _1901;
    }
    float _1903 = _1891;
    float _1905 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1897);
    float _1907 = 0.0;
    if (_1805)
    {
        _1907 = _1781;
    }
    float _1909 = _1907;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1913 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1899);
    float _1915 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1917 = fma(_1873, _1639, -0.5);
    float _1919 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1911);
    float _1921 = _1909;
    if (_1805)
    {
        _1855 = _1909;
    }
    float _1923 = _1855;
    float _1925 = 1.0 / _1915;
    float _1927 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1929 = _1923;
    if (!_1805)
    {
        _1921 = _1781;
    }
    float _1931 = _1921;
    float _1933 = fma(_1853, _1889, _1797);
    float _1935 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1805)
    {
        float _1937 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1931);
        _1929 = _1937;
    }
    float _1939 = _1929;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1943 = _1935 + _1915;
    float _1945 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1947 = -_120;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1689);
    float _1951 = fma(_1895, -2.0, _1941);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1955 = in.m_69.x;
    float _1957 = in.m_69.y;
    float _1959 = in.m_69.z;
    float _1961 = in.m_69.w;
    float _1963 = _1943 * _1925;
    float _1965 = _1963 * 0.5;
    float _1967 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1799);
    float _1969 = fma(_1945, -2.0, _1953);
    float _1971 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1735);
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1975 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1973);
    float _1977 = fma(_1967, _1859, _1829);
    float _1979 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1969);
    float _1981 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1919);
    float _1983 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1951);
    float _1985 = _1933 + 0.5;
    float _1987 = 1.0 / _1975;
    float _1989 = -_1979;
    float _1991 = fma(_1971, _1763, _1989);
    float _1993 = _1761 + 0.5;
    float _1995 = -_1983;
    float _1997 = fma(_1981, _1807, _1995);
    float _1999 = fma(_1865, _1917, _1949);
    float _2001 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1723)
    {
        _1280 = 1.0;
    }
    float _2003 = _1280;
    float _2005 = _1997 + 0.5;
    float _2007 = _1999 + 0.5;
    float _2009 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2001);
    float _2011 = _2003;
    if (_1723)
    {
        _1282 = 1.0;
    }
    float _2013 = _1282;
    float _2015 = _1955 * _1931;
    float _2017 = _1959 * _1871;
    float _2019 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2009);
    float _2021 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2023 = _1987 * _2021;
    float _2025 = -_2015;
    float _2027 = fma(_1957, _1871, _2025);
    float _2029 = -_2017;
    float _2031 = fma(_1955, _1893, _2029);
    float _2033 = _1957 * _1893;
    float _2035 = abs(_2023);
    float _2037 = log2(_2035);
    float _2039 = _2027 * _1961;
    float _2041 = -_2033;
    float _2043 = fma(_1959, _1931, _2041);
    float _2045 = _2031 * _1961;
    float _2047 = _1977 + 0.5;
    float _2049 = _2043 * _1961;
    float _2051 = _1991 + 0.5;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_71.x = _1985;
    out.m_71.y = _2051;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2061 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2063 = -_2045;
    float _2065 = _802 * _2063;
    float _2067 = _796 * _2045;
    float _2069 = _788 * _2045;
    out.m_73.x = _2007;
    out.m_73.y = _1993;
    out.m_73.z = _2047;
    out.m_73.w = _2005;
    float _2071 = fma(_816, _2049, _2065);
    float _2073 = exp2(_2061);
    float _2075 = fma(_830, _2049, _2067);
    float _2077 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2083 = fma(_840, _2049, _2069);
    float _2085 = -_1939;
    float _2087 = _802 * _2085;
    float _2089 = _788 * _1939;
    float _2091 = in.m_75.x;
    float _2093 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2019);
    float _2095 = fma(_816, _1885, _2087);
    float _2097 = fma(_840, _1885, _2089);
    float _2099 = -_1957;
    float _2101 = _802 * _2099;
    float _2103 = _788 * _1957;
    out.m_77.x = _2079;
    out.m_77.y = _2077;
    out.m_77.z = _2081;
    out.m_77.w = _2059;
    float _2105 = _796 * _1939;
    float _2107 = _796 * _1957;
    float _2109 = fma(_816, _1955, _2101);
    float _2111 = fma(_840, _1955, _2103);
    float _2113 = fma(_806, _2039, _2071);
    float _2115 = fma(_846, _2039, _2075);
    float _2117 = fma(_832, _2039, _2083);
    float _2119 = fma(_830, _1955, _2107);
    float _2121 = fma(_806, _1959, _2109);
    out.gl_Position.x = _1530;
    out.gl_Position.y = _1532;
    out.gl_Position.z = _2093;
    out.gl_Position.w = _1468;
    float _2123 = fma(_830, _1885, _2105);
    float _2125 = fma(_846, _1959, _2119);
    float _2127 = fma(_832, _1959, _2111);
    out.m_79.x = _2113;
    out.m_79.y = _2115;
    out.m_79.z = _2117;
    float _2129 = fma(_2073, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2131 = precise::clamp(_2129, 0.0, 1.0);
    out.m_81.x = _2121;
    out.m_81.y = _2125;
    out.m_81.z = _2127;
    float _2133 = fma(_2131, -2.0, 3.0);
    float _2135 = _2131 * _2131;
    float _2137 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2139 = _2135 * _2133;
    float _2141 = -_2139;
    float _2143 = _2141 + 1.0;
    float _2145 = exp2(_2137);
    float _2147 = _1468 * 0.5;
    float _2149 = _2093 + _1468;
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2139);
    float _2153 = fma(_1532, -0.5, _2147);
    float _2155 = _1530 + _1468;
    bool _2157 = _2023 <= 8000.0;
    bool _2159 = isnan(_2023);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan(8000.0);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = _2149 * 0.5;
    float _2171 = _2155 * 0.5;
    float _2173 = _2013;
    float _2175 = _2093;
    if (!_1723)
    {
        float _2177 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2179 = _2177 * 0.15915493667125701904296875;
        float _2181 = _2179 * 6.283185482025146484375;
        float _2183 = cos(_2181);
        float _2185 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2187 = _2185 * 0.15915493667125701904296875;
        float _2189 = _2179 * 6.283185482025146484375;
        float _2191 = sin(_2189);
        float _2193 = 1.0 / _2183;
        float _2195 = _2187 * 6.283185482025146484375;
        float _2197 = cos(_2195);
        float _2199 = _2191 * _2193;
        float _2201 = _2187 * 6.283185482025146484375;
        float _2203 = sin(_2201);
        float _2205 = _2197 * _2199;
        float _2207 = 1.0 / _2205;
        float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2211 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2209;
        float _2213 = 1.0 / _2211;
        float _2215 = _2203 * _2207;
        float _2217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2219 = fma(_2023, _2215, _2217);
        float _2221 = _2219 * _2213;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        _2173 = _2223;
        _2175 = _2219;
        _1607 = _2193;
    }
    float _2225 = _2173;
    float _2227 = _2175;
    float _2229 = _1607;
    float _2231 = _2227;
    float _2233 = _2229;
    if (!_1723)
    {
        float _2235 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2237 = _2235 * 0.15915493667125701904296875;
        float _2239 = _2237 * 6.283185482025146484375;
        float _2241 = cos(_2239);
        float _2243 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2245 = _2243 * 0.15915493667125701904296875;
        float _2247 = _2237 * 6.283185482025146484375;
        float _2249 = sin(_2247);
        float _2251 = 1.0 / _2241;
        float _2253 = _2245 * 6.283185482025146484375;
        float _2255 = cos(_2253);
        float _2257 = _2249 * _2251;
        float _2259 = _2245 * 6.283185482025146484375;
        float _2261 = sin(_2259);
        float _2263 = _2255 * _2257;
        float _2265 = 1.0 / _2263;
        float _2267 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2269 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2267;
        float _2271 = 1.0 / _2269;
        float _2273 = _2261 * _2265;
        float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2277 = fma(_2023, _2273, _2275);
        float _2279 = _2277 * _2271;
        float _2281 = precise::clamp(_2279, 0.0, 1.0);
        float _2283 = -_2281;
        float _2285 = _2283 + 1.0;
        _2011 = _2285;
        _2231 = _2245;
        _2233 = _2237;
    }
    float _2287 = _2011;
    float _2289 = _2231;
    float _2291 = _2233;
    float _2293 = _2167 * _2151;
    float _2295 = -_2145;
    float _2297 = _2295 + 1.0;
    float _2299 = fma(_806, _1903, _2095);
    float _2301 = -_1546;
    float _2303 = _2301 + 1.0;
    float _2305 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2307 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2309 = fma(_846, _1903, _2123);
    float _2311 = _2303 * _2305;
    float _2313 = precise::clamp(_2311, 0.0, 1.0);
    float _2315 = _2307 * _1558;
    float _2317 = -_2307;
    float _2319 = _2317 + 1.0;
    float _2321 = fma(_832, _1903, _2097);
    float _2323 = -_2313;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2327 = _1569 * _2315;
    float _2329 = _1579 * _2315;
    out.m_83.x = _1212;
    out.m_83.y = _1210;
    out.m_83.z = _1214;
    float _2331 = _2325 * _2091;
    float _2333 = fma(_1575, _2327, _1563);
    float _2335 = fma(_1577, _2327, _1565);
    float _2337 = _1569 * _2319;
    float _2339 = fma(_1569, _2329, _1567);
    out.m_85.x = _2299;
    out.m_85.y = _2309;
    out.m_85.z = _2321;
    bool _2341 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2343 = isnan(_1248);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2349 = _2345 || _2347;
    float _2351 = _2331 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2333;
    out.m_87.y = _2335;
    out.m_87.z = _2339;
    out.m_87.w = _2337;
    out.m_89.x = _2171;
    out.m_89.y = _2153;
    out.m_89.z = _2169;
    out.m_89.w = _1468;
    out.m_91.x = _2351;
    float _2353 = _2291;
    float _2355 = _2289;
    float _2357 = _2307;
    float _2359 = _2319;
    float _2361 = _2313;
    float _2363 = _2351;
    if (!_2349)
    {
        _2353 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2365 = _2353;
    float _2367 = _2365;
    float _2369 = _2365;
    if (!_2349)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2371 = _2355;
    float _2373 = _2371;
    float _2375 = _2371;
    if (!_2349)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2377 = _2357;
    float _2379 = _2377;
    float _2381 = _2377;
    if (!_2349)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2383 = _2359;
    float _2385 = _2225 * _2287;
    float _2387 = _2383;
    float _2389 = _2383;
    if (!_2349)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2391 = _2361;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2349)
    {
        _2363 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2397 = _2363;
    float _2399 = _2385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2401 = !_2349;
    float _2403 = _2397;
    float _2405 = _2397;
    if (!_2401)
    {
        bool _2407 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2409 = isnan(_1248);
        bool _2411 = _2407 || _2409;
        bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2415 = _2411 || _2413;
        if (!_2415)
        {
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2419 = _1248 + _2417;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2423 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2421;
            float _2425 = 1.0 / _2423;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2447 = _2419 * _2425;
            float _2449 = precise::clamp(_2447, 0.0, 1.0);
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2455 = fma(_2449, _2429, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2457 = fma(_2449, _2453, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2459 = fma(_2449, _2433, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2461 = fma(_2449, _2437, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2463 = fma(_2449, _2441, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2465 = fma(_2449, _2445, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2375 = _2457;
            _2395 = _2463;
            _2369 = _2455;
            _2389 = _2461;
            _2381 = _2459;
            _2405 = _2465;
            _2467 = true;
        }
        else
        {
            bool _2469 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2471 = isnan(_1248);
            bool _2473 = _2469 || _2471;
            bool _2475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2477 = _2473 || _2475;
            if (!_2477)
            {
                _2367 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2479 = _2367;
            _2369 = _2479;
            if (!_2477)
            {
                _2373 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2481 = _2373;
            _2375 = _2481;
            if (!_2477)
            {
                _2379 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2483 = _2379;
            _2381 = _2483;
            if (!_2477)
            {
                _2387 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2485 = _2387;
            _2389 = _2485;
            if (!_2477)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2487 = _2393;
            _2395 = _2487;
            if (!_2477)
            {
                _2403 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2489 = _2403;
            bool _2491 = !_2477;
            _2405 = _2489;
            if (!_2491)
            {
                bool _2493 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2495 = isnan(_1248);
                bool _2497 = _2493 || _2495;
                bool _2499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2501 = _2497 || _2499;
                if (!_2501)
                {
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2505 = _1248 + _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2509 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2507;
                    float _2511 = 1.0 / _2509;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2523 = _2521 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2533 = _2505 * _2511;
                    float _2535 = precise::clamp(_2533, 0.0, 1.0);
                    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2541 = fma(_2535, _2515, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2543 = fma(_2535, _2539, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2545 = fma(_2535, _2519, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2547 = fma(_2535, _2523, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2549 = fma(_2535, _2527, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2551 = fma(_2535, _2531, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2375 = _2543;
                    _2395 = _2549;
                    _2369 = _2541;
                    _2389 = _2547;
                    _2381 = _2545;
                    _2405 = _2551;
                    _2467 = true;
                }
                else
                {
                    _2375 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2369 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2389 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2381 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2405 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2467 = false;
    float _2553 = _2375;
    float _2555 = _2395;
    float _2557 = _2369;
    float _2559 = _2389;
    float _2561 = _2381;
    float _2563 = _2405;
    float _2565 = fma(_2309, -0.5, 0.5);
    float _2567 = precise::clamp(_2565, 0.0, 1.0);
    float _2569 = -_2553;
    float _2571 = _2569 + _2555;
    float _2573 = _2399 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2575 = -_2557;
    float _2577 = _2575 + _2559;
    out.m_93.x = 0.0;
    float _2579 = fma(_2567, _2571, _2553);
    float _2581 = fma(_2567, _2577, _2557);
    out.m_53.x = _2573;
    float _2583 = -_2561;
    float _2585 = _2583 + _2563;
    float _2587 = _2579 * 0.586610972881317138671875;
    bool _2589 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2591 = fma(_2567, _2585, _2561);
    float _2593 = fma(_2581, 0.298911988735198974609375, _2587);
    bool _2595 = _2225 > 0.0;
    bool _2597 = isnan(_2225);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan(0.0);
    bool _2603 = _2599 || _2601;
    float _2605 = fma(_2591, 0.114477999508380889892578125, _2593);
    bool _2607 = _2287 <= 0.0;
    bool _2609 = !_2603;
    bool _2611 = _2607 || _2609;
    float _2613 = -_2605;
    float _2615 = _2581 + _2613;
    float _2617 = -_2605;
    float _2619 = _2579 + _2617;
    float _2621 = -_2605;
    float _2623 = _2591 + _2621;
    float _2625 = fma(_2615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2605);
    float _2627 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2605);
    float _2629 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2605);
    bool _2631 = !_2589;
    if (!_2631)
    {
        float _2633 = -_1210;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2637 = -_1212;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2641 = -_1214;
        float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2645 = _2635 * _2635;
        float _2647 = fma(_2639, _2639, _2645);
        float _2649 = fma(_2643, _2643, _2647);
        float _2651 = sqrt(_2649);
        float _2653 = rsqrt(_2649);
        float _2655 = -_2651;
        float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2659 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2661 = precise::clamp(_2659, 0.0, 1.0);
        float _2663 = _2639 * _2653;
        float _2665 = _2635 * _2653;
        float _2667 = abs(_2661);
        float _2669 = log2(_2667);
        float _2671 = _2643 * _2653;
        float _2673 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2675 = _2309 * _2665;
        float _2677 = -_2665;
        float _2679 = -_2673;
        float _2681 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2679);
        float _2683 = fma(_2299, _2663, _2675);
        float _2685 = -_2671;
        float _2687 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2681);
        float _2689 = fma(_2321, _2671, _2683);
        float _2691 = precise::clamp(_2689, 0.0, 1.0);
        float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2695 = _2687 + _2693;
        float _2697 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        float _2703 = exp2(_2697);
        float _2705 = _2703 * _2701;
        float _2707 = _2691 * _2705;
        float _2709 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2711 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2713 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2709;
        out.m_93.y = _2711;
        out.m_93.z = _2713;
    }
    out.m_95.x = _2625;
    out.m_95.y = _2627;
    out.m_95.z = _2629;
    if (!_2611)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2715 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2715;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad9 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_124)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_134);
        out.gl_Position.z = _2781;
    }
    if (!_124)
    {
        return out;
    }
    bool _138 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_111);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_116);
    bool _150 = _120 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _136 = as_type<int>(_160);
    }
    int _162 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2837 = as_type<float>(_162);
        out.gl_Position.z = _2837;
    }
    if (_154)
    {
        return out;
    }
    float _164 = in.m_55.z;
    float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _168 = log2(_166);
    float _170 = in.m_55.x;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _174 = _172 != 0;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _182 = _180 != 0;
    float _184 = in.m_55.y;
    float _186 = in.m_46.x;
    float _188 = in.m_46.y;
    float _190 = in.m_46.z;
    float _192 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _194 = _120 * _168;
    float _196 = -_192;
    float _198 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _196);
    float _200 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _202 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _204 = _164 * 2.0;
    float _206 = -_200;
    float _208 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _206);
    float _210 = -_202;
    float _212 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _210);
    float _214 = floor(_204);
    float _216 = _170 * 2.0;
    float _218 = _184 + _164;
    float _220 = floor(_216);
    float _222 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _224 = _184 * 2.0;
    float _226 = _218 + (-1.0);
    float _228 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _222);
    float _230 = _198 * _198;
    float _232 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _234 = exp2(_194);
    bool _236 = _214 > 0.0;
    float _238 = _184 + _170;
    bool _240 = _214 >= 0.0;
    bool _242 = isnan(_214);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    float _250 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _228);
    float _252 = _238 + (-1.0);
    int _254 = _248 ? 0 : 1;
    float _256 = floor(_224);
    bool _258 = _220 > 0.0;
    float _260 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _262 = ~_254;
    int _264 = _262 + 1;
    int _266 = _264 + 1;
    float _268 = _188 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _270 = _220 >= 0.0;
    bool _272 = isnan(_220);
    bool _274 = _270 || _272;
    bool _276 = isnan(0.0);
    bool _278 = _274 || _276;
    float _280 = fma(_208, _208, _230);
    int _282 = _266;
    bool _284 = _278;
    float _286 = _164;
    float _288 = _170;
    if (!_236)
    {
        int _290 = ~_254;
        int _292 = _290 + 1;
        _282 = _292;
    }
    int _294 = _282;
    float _296 = -_234;
    float _298 = _296 + 1.0;
    float _300 = _188 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _310 = _306 || _308;
    float _312 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].x, _268);
    bool _314 = !_174;
    int _316 = _314 ? 0 : 1;
    float _318 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    bool _320 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _322 = isnan(1.0);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _328 = _324 || _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _332 = 1.0 + _330;
    float _334 = _310 ? _298 : 0.0;
    float _336 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[6].z, _318);
    bool _338 = _256 > 0.0;
    float _340 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    bool _342 = _256 >= 0.0;
    bool _344 = isnan(_256);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = 1.0 / _332;
    int _354 = abs(_316);
    float _356 = _336 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _358 = float(_294);
    float _360 = fma(_212, _212, _280);
    float _362 = float(_354);
    float _364 = -_356;
    float _366 = _364 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _368 = _278 ? 0 : 1;
    float _370 = rsqrt(_250);
    float _372 = _340 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _374 = _362 * _358;
    int _376 = _350 ? 0 : 1;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _380 = _372 + _378;
    int _382 = ~_368;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    bool _388 = !_178;
    int _390 = _388 ? 0 : 1;
    float _392 = _334 * _352;
    int _394 = _386;
    float _396 = _380;
    float _398 = _366;
    if (!_258)
    {
        int _400 = ~_368;
        int _402 = _400 + 1;
        _394 = _402;
    }
    int _404 = _394;
    float _406 = _374 * (-2.0);
    float _408 = abs(_380);
    float _410 = abs(_366);
    float _412 = precise::max(_408, _410);
    float _414 = _170 * 6.283185482025146484375;
    int _416 = ~_376;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    float _422 = rsqrt(_360);
    int _424 = abs(_390);
    int _426 = _420;
    if (!_338)
    {
        int _428 = ~_376;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = fma(_260, _406, _260);
    bool _436 = _412 >= 16.0;
    float _438 = fma(_120, 0.02999999932944774627685546875, _414);
    float _440 = float(_424);
    float _442 = _170 + (-0.5);
    float _444 = float(_404);
    float _446 = _438 * 0.15915493667125701904296875;
    bool _448 = !_328;
    float _450 = _448 ? _120 : _392;
    float _452 = _442 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _454 = float(_432);
    float _456 = _440 * _444;
    float _458 = _370 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _460 = fma(_450, _434, _452);
    bool _462 = !_182;
    int _464 = _462 ? 0 : 1;
    if (_436)
    {
        float _466 = _380 * 0.0625;
        _396 = _466;
    }
    float _468 = _396;
    float _470 = _458 * (-0.699999988079071044921875);
    float _472 = _366 * 0.0625;
    int _474 = abs(_464);
    float _476 = _170 + _164;
    float _478 = in.m_57.x;
    float _480 = in.m_57.y;
    float _482 = in.m_57.z;
    float _484 = _470 * 0.15915493667125701904296875;
    float _486 = _436 ? _472 : _366;
    float _488 = _476 + (-1.0);
    float _490 = abs(_468);
    bool _492 = _490 != 0.0;
    bool _494 = isnan(_490);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = in.m_59.x;
    float _504 = in.m_59.y;
    float _506 = in.m_59.z;
    float _508 = float(_474);
    float _510 = _460 * 0.15915493667125701904296875;
    float _512 = abs(_486);
    bool _514 = _512 == 0.0;
    bool _516 = !_500;
    bool _518 = _514 && _516;
    float _520 = _456 * (-2.0);
    float _522 = abs(_486);
    bool _524 = _522 == 0.0;
    float _526 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _528 = _446 * 6.283185482025146484375;
    float _530 = sin(_528);
    float _532 = _508 * _454;
    float _534 = fma(_232, _520, _232);
    float _536 = _164 + (-0.5);
    float _538 = _184 + (-0.5);
    float _540 = _532 * (-2.0);
    float _542 = _536 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _544 = _484 * 6.283185482025146484375;
    float _546 = sin(_544);
    float _548 = _538;
    if (_518)
    {
        bool _550 = as_type<int>(_486) >= 0;
        _284 = _550;
    }
    bool _552 = _284;
    float _554 = fma(_526, _540, _526);
    float _556 = _538 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _558 = 0;
    int _560 = _552 ? (-1) : 0;
    int _562 = as_type<int>(_554);
    if (_518)
    {
        int _564 = _552 ? 0 : 1078530011;
        _558 = _564;
    }
    int _566 = _558;
    float _568 = fma(_450, _554, _542);
    float _570 = fma(_450, _534, _556);
    float _572 = _510 * 6.283185482025146484375;
    float _574 = sin(_572);
    if (_518)
    {
        int _576 = int(0x80000000) & as_type<int>(_468);
        int _578 = _566 | _576;
        _548 = as_type<float>(_578);
    }
    float _580 = _548;
    float _582 = _510 * 6.283185482025146484375;
    float _584 = cos(_582);
    bool _586 = !_500;
    bool _588 = _586 && _524;
    float _590 = _580;
    float _592 = _580;
    if (!_588)
    {
        float _594 = abs(_468);
        bool _596 = _594 != as_type<float>(0x7f800000u /* inf */);
        bool _598 = isnan(_594);
        bool _600 = _596 || _598;
        bool _602 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _604 = _600 || _602;
        float _606 = abs(_486);
        bool _608 = _606 == as_type<float>(0x7f800000u /* inf */);
        float _610 = abs(_486);
        bool _612 = _610 == as_type<float>(0x7f800000u /* inf */);
        bool _614 = !_604;
        bool _616 = _612 && _614;
        if (_616)
        {
            bool _618 = as_type<int>(_486) >= 0;
            _560 = _618 ? (-1) : 0;
        }
        int _620 = _560;
        if (_616)
        {
            _562 = 1075235812;
        }
        int _622 = _562;
        int _624 = _622;
        if (_616)
        {
            int _626 = ~_620;
            int _628 = (_626 != 0) ? _622 : 1061752795;
            _624 = _628;
        }
        int _630 = _624;
        if (_616)
        {
            int _632 = int(0x80000000) & as_type<int>(_468);
            int _634 = _630 | _632;
            _590 = as_type<float>(_634);
        }
        float _636 = _590;
        bool _638 = !_604;
        bool _640 = _638 && _608;
        _592 = _636;
        if (!_640)
        {
            float _642 = abs(_468);
            float _644 = abs(_486);
            float _646 = precise::max(_642, _644);
            float _648 = abs(_468);
            float _650 = abs(_486);
            float _652 = precise::min(_648, _650);
            float _654 = 1.0 / _646;
            float _656 = abs(_468);
            float _658 = abs(_486);
            bool _660 = _656 > _658;
            bool _662 = as_type<int>(_486) >= 0;
            float _664 = abs(_468);
            float _666 = abs(_486);
            float _668 = _664 + _666;
            bool _670 = _668 > as_type<float>(0x7f800000u /* inf */);
            bool _672 = isnan(_668);
            bool _674 = _670 || _672;
            bool _676 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _678 = _674 || _676;
            float _680 = _652 * _654;
            float _682 = _680 * _680;
            float _684 = _682 + 11.33538818359375;
            float _686 = fma(_682, _684, 28.84246826171875);
            float _688 = fma(_682, _686, 19.6966705322265625);
            float _690 = fma(_682, -0.82336294651031494140625, -5.674867153167724609375);
            float _692 = fma(_682, _690, -6.565555095672607421875);
            float _694 = 1.0 / _688;
            float _696 = _682 * _692;
            float _698 = _680 * _696;
            float _700 = fma(_698, _694, _680);
            int _702 = as_type<int>(_468) & int(0x80000000);
            float _704 = _700;
            _592 = _668;
            if (_660)
            {
                float _706 = -_700;
                float _708 = _706 + 1.57079637050628662109375;
                _704 = _708;
            }
            float _710 = _704;
            int _712 = as_type<int>(_710);
            if (!_662)
            {
                float _714 = -_710;
                float _716 = _714 + 3.1415927410125732421875;
                _712 = as_type<int>(_716);
            }
            int _718 = _712;
            if (!_678)
            {
                int _720 = _702 | _718;
                _592 = as_type<float>(_720);
            }
        }
    }
    float _722 = _592;
    float _724 = -_722;
    float _726 = _570 + _724;
    float _728 = _188 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _730 = in.m_61.y;
    float _732 = _726 * 0.15915493667125701904296875;
    float _734 = _568 * 0.15915493667125701904296875;
    float _736 = _502 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _738 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].x, _728);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _742 = fma(_740, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _744 = _734 * 6.283185482025146484375;
    float _746 = cos(_744);
    float _748 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = _504 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _478);
    float _754 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[5].z, _738);
    float _756 = _506 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _480);
    float _760 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _762 = _732 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _752 * _748;
    float _768 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _770 = _198 * _422;
    float _772 = _758 * _760;
    float _774 = _208 * _422;
    float _776 = _212 * _422;
    float _778 = -_730;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _782 = _732 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _770 * _770;
    float _788 = _574 * _746;
    float _790 = _530 * _780;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _482);
    float _794 = fma(_774, _774, _786);
    float _796 = _584 * _746;
    float _798 = _754 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = _734 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _574 * _764;
    float _806 = _764 * _746;
    float _808 = _792 * _768;
    float _810 = _742 * _790;
    float _812 = _584 * _784;
    float _814 = _574 * _784;
    float _816 = _784 * _746;
    float _818 = fma(_776, _776, _794);
    float _820 = _484 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _584 * _764;
    float _826 = _796 * _772;
    float _828 = _788 * _772;
    float _830 = fma(_802, _812, _804);
    float _832 = fma(_802, _804, _812);
    float _834 = -_772;
    float _836 = _802 * _834;
    float _838 = -_824;
    float _840 = fma(_802, _814, _838);
    float _842 = rsqrt(_818);
    float _844 = -_814;
    float _846 = fma(_802, _824, _844);
    float _848 = fma(_816, _766, _836);
    float _850 = fma(_830, _766, _826);
    float _852 = fma(_840, _766, _828);
    float _854 = fma(_806, _808, _848);
    float _856 = fma(_846, _808, _850);
    float _858 = fma(_832, _808, _852);
    float _860 = -_822;
    float _862 = _860 + 1.0;
    float _864 = _372 + _854;
    float _866 = _798 + _856;
    float _868 = _356 + _858;
    float _870 = fma(_774, _810, _864);
    float _872 = fma(_770, _810, _866);
    float _874 = _774 * _842;
    float _876 = _770 * _842;
    float _878 = _776 * _842;
    float _880 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _882 = _872 + _880;
    float _884 = _874 * _546;
    float _886 = _876 * _546;
    float _888 = _878 * _546;
    float _890 = _874 * _862;
    float _892 = _876 * _862;
    float _894 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _896 = _870 + _894;
    float _898 = fma(_776, _810, _868);
    float _900 = fma(_876, _890, _888);
    float _902 = fma(_876, _892, _822);
    float _904 = -_888;
    float _906 = fma(_876, _890, _904);
    float _908 = fma(_874, _890, _822);
    float _910 = -_886;
    float _912 = fma(_878, _890, _910);
    float _914 = fma(_878, _890, _886);
    float _916 = _902 * _882;
    float _918 = fma(_878, _892, _884);
    float _920 = -_884;
    float _922 = fma(_878, _892, _920);
    float _924 = _906 * _882;
    float _926 = fma(_900, _896, _916);
    float _928 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _930 = _898 + _928;
    float _932 = _878 * _878;
    float _934 = _918 * _882;
    float _936 = fma(_908, _896, _924);
    float _938 = fma(_922, _930, _926);
    float _940 = fma(_862, _932, _822);
    float _942 = fma(_912, _896, _934);
    float _944 = fma(_914, _930, _936);
    float _946 = _938 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _948 = _938 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _950 = fma(_940, _930, _942);
    float _952 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].y, _946);
    float _954 = _938 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].x, _948);
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _960 = _958 != 0;
    float _962 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].y, _952);
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].z, _954);
    float _966 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].x, _956);
    float _968 = _962 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _970 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].z, _964);
    float _972 = _966 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _974 = _968 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _976 = _970 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _978 = _968 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _980 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[10].x, _974);
    float _982 = _822;
    float _984 = _976;
    float _986 = _972;
    float _988 = _764;
    if (!_960)
    {
        _982 = 0.0;
    }
    float _990 = _982;
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[8].x, _978);
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[10].z, _980);
    float _996 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].z, _992);
    float _998 = _994 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1000 = _996 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1004 = _998 + _1002;
    bool _1006 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.5);
    bool _1014 = _1010 || _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1018 = _1000 + _1016;
    float _1020 = _1004 * _1004;
    float _1022 = fma(_1018, _1018, _1020);
    float _1024 = _968 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1026 = sqrt(_1022);
    float _1028 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1024);
    float _1030 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1028);
    float _1032 = _1028;
    float _1034 = _990;
    float _1036 = _998;
    float _1038 = _1000;
    float _1040 = _1022;
    if (!_960)
    {
        _1032 = 0.0;
    }
    float _1042 = _1032;
    float _1044 = _1042;
    if (!_960)
    {
        _984 = 0.0;
    }
    float _1046 = _984;
    float _1048 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1050 = _1026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1052 = !_960;
    float _1054 = _1046;
    float _1056 = _1048;
    bool _1058 = _1050;
    if (!_1052)
    {
        float _1060 = -_798;
        float _1062 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1064 = -_372;
        float _1066 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1068 = _1062 * _1062;
        float _1070 = fma(_1066, _1066, _1068);
        float _1072 = fma(_366, _366, _1070);
        float _1074 = rsqrt(_1072);
        float _1076 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1078 = _1066 * _1076;
        float _1080 = _1062 * _1076;
        float _1082 = _366 * _1076;
        _1044 = _1078;
        _1054 = _1080;
        _1034 = _1082;
    }
    float _1084 = _1044;
    float _1086 = _1054;
    float _1088 = _1034;
    if (!_1050)
    {
        _986 = _1048;
    }
    float _1090 = _986;
    bool _1092 = !_1050;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1026 + _1098;
        float _1102 = rsqrt(_1022);
        float _1104 = _1100 * _1096;
        float _1106 = _1048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = _1104 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = fma(_1116, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1124 = fma(_1048, _1112, _1120);
        float _1126 = _1102 * _1122;
        float _1128 = fma(_1018, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_1004, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1094 = _1124;
        _1036 = _1130;
        _1038 = _1128;
        _1040 = _1102;
        _398 = _1108;
    }
    float _1132 = _1094;
    float _1134 = _1036;
    float _1136 = _1038;
    float _1138 = _1040;
    float _1140 = _398;
    float _1142 = _372 + _1084;
    float _1144 = _1086 + _1132;
    float _1146 = _1088 + _1134;
    float _1148 = _1084 + _1136;
    float _1150 = _798 + _1086;
    float _1152 = _356 + _1088;
    float _1154 = _1144;
    float _1156 = _1148;
    float _1158 = _1146;
    float _1160 = _1138;
    float _1162 = _1136;
    float _1164 = _1140;
    if (!_1014)
    {
        float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1168 = _1150 + _1166;
        float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1172 = _1142 + _1170;
        float _1174 = -_372;
        float _1176 = _1174 + _1136;
        float _1178 = -_798;
        float _1180 = _1178 + _1132;
        float _1182 = _1168 * _1168;
        float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1186 = _1152 + _1184;
        float _1188 = -_356;
        float _1190 = _1188 + _1134;
        float _1192 = fma(_1172, _1172, _1182);
        float _1194 = fma(_1186, _1186, _1192);
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1198 = sqrt(_1194);
        float _1200 = precise::min(_1198, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1202 = _1200 * _1196;
        float _1204 = fma(_1176, _1202, _1142);
        float _1206 = fma(_1180, _1202, _1150);
        float _1208 = fma(_1190, _1202, _1152);
        _1154 = _1206;
        _1156 = _1204;
        _1158 = _1208;
        _1056 = _1182;
        _1160 = _1198;
        _1162 = _1176;
    }
    float _1210 = _1154;
    float _1212 = _1156;
    float _1214 = _1158;
    float _1216 = _1056;
    float _1218 = _1160;
    float _1220 = _1162;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1224 = _1210 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1228 = _1212 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1232 = _1214 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1238 = fma(_1228, _1228, _1234);
    float _1240 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1236);
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1244 = fma(_1232, _1232, _1238);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1228 * _1250;
    float _1254 = _1232 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1220;
    float _1274 = _1268;
    float _1276 = _1216;
    float _1278 = _1218;
    float _1280 = _1228;
    float _1282 = _1224;
    if (_1264)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1284;
    }
    float _1286 = _1270;
    if (_1264)
    {
        float _1288 = rsqrt(_1260);
        _1272 = _1288;
    }
    float _1290 = _1272;
    float _1292 = _1290;
    if (_1264)
    {
        float _1294 = _1268 * _1286;
        _1274 = _1294;
    }
    float _1296 = _1274;
    if (_1264)
    {
        float _1298 = _1296 * 0.15915493667125701904296875;
        _1276 = _1298;
    }
    float _1300 = _1276;
    float _1302 = _1286;
    float _1304 = _1300;
    if (_1264)
    {
        float _1306 = _1300 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        _1302 = _1308;
    }
    float _1310 = _1302;
    float _1312 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1314 = precise::max(0.0, _1312);
    float _1316 = _930;
    if (_1264)
    {
        float _1318 = _1300 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        _1316 = _1320;
    }
    float _1322 = _1316;
    float _1324 = -_1250;
    float _1326 = -_1314;
    float _1328 = fma(_1224, _1324, _1326);
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1264)
    {
        float _1332 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1278 = _1332;
    }
    float _1334 = _1278;
    float _1336 = _1334;
    if (!_1264)
    {
        _1304 = _1328;
    }
    float _1338 = _1304;
    float _1340 = fma(_1142, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1342 = _1338;
    if (_1264)
    {
        float _1344 = fma(_1310, _1334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1344;
    }
    float _1346 = _1164;
    float _1348 = floor(_1340);
    float _1350 = _1346;
    if (_1264)
    {
        float _1352 = _1322 + (-1.0);
        _1336 = _1352;
    }
    float _1354 = _1336;
    float _1356 = _1354;
    if (_1264)
    {
        float _1358 = _1290 * _1346;
        _988 = _1358;
    }
    float _1360 = _988;
    if (!_1264)
    {
        _1292 = _1252;
    }
    float _1362 = _1292;
    float _1364 = _1362;
    if (_1264)
    {
        float _1366 = _1354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1330 = _1366;
    }
    float _1368 = _1330;
    float _1370 = _1368;
    if (_1264)
    {
        float _1372 = _1252 * _1360;
        _1364 = _1372;
    }
    float _1374 = _1364;
    if (!_1264)
    {
        _1350 = _1254;
    }
    float _1376 = _1350;
    float _1378 = _1376;
    if (_1264)
    {
        float _1380 = _1254 * _1360;
        _1378 = _1380;
    }
    float _1382 = _1378;
    if (!_1264)
    {
        _1356 = _1256;
    }
    float _1384 = _1356;
    float _1386 = _1384;
    if (_1264)
    {
        float _1388 = fma(_1328, _1322, _1368);
        _1342 = _1388;
    }
    float _1390 = _1342;
    if (_1264)
    {
        float _1392 = _1374 * _1374;
        _1386 = _1392;
    }
    float _1394 = _1386;
    if (!_1264)
    {
        _1370 = _1258;
    }
    float _1396 = _1370;
    float _1398 = _1396;
    if (_1264)
    {
        float _1400 = _1382 * _1382;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1406 = fma(_1390, _1390, _1394);
    float _1408 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1410 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1404);
    float _1414 = _1406 + _1402;
    float _1416 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1408);
    float _1418 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1412);
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1424 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1422);
    float _1426 = precise::clamp(_1424, 0.0, 1.0);
    float _1428 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1416);
    float _1430 = rsqrt(_1414);
    float _1432 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1434 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1436 = -_1426;
    float _1438 = _1436 + 1.0;
    float _1440 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1446 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1240);
    float _1448 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1450 = abs(_1438);
    float _1452 = log2(_1450);
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1444);
    float _1456 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1458 = -_1448;
    float _1460 = fma(_1458, _1242, 1.0);
    float _1462 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1454);
    float _1464 = _1430 * _1374;
    float _1466 = _1430 * _1382;
    float _1468 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    float _1470 = _1430 * _1390;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1474 = fma(_1152, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1476 = -_1348;
    float _1478 = _1340 + _1476;
    float _1480 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = -_1472;
    float _1484 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = floor(_1474);
    float _1488 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1490 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1492 = -_1466;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1496 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = _1470 + 1.0;
    float _1500 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1502 = fma(_1494, -0.5, 0.5);
    float _1504 = exp2(_1488);
    float _1506 = fma(_1494, 0.5, 0.5);
    float _1508 = fma(_1506, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1510 = sqrt(_1502);
    float _1512 = -_1486;
    float _1514 = _1474 + _1512;
    float _1516 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1518 = fma(_1506, _1508, -0.212114393711090087890625);
    float _1520 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1516);
    float _1522 = fma(_1506, _1518, 1.570728778839111328125);
    float _1524 = log2(_1460);
    float _1526 = -_1470;
    float _1528 = fma(_1504, _1498, _1526);
    float _1530 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1532 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1520);
    float _1534 = 1.0 / _1468;
    float _1536 = _1510 * 0.636619746685028076171875;
    float _1538 = -_1522;
    float _1540 = fma(_1536, _1538, 1.0);
    float _1542 = fma(_1528, 0.5, 0.5);
    float _1544 = _1524 * 0.693147182464599609375;
    float2 _4967 = float2(_1478, _1514);
    float _1546 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4967, float2(0.0), isnan(_4967)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4967, float2(0.0), isnan(_4967)), level(0.0)).x;
    float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1550 = _1530 * _1534;
    float _1552 = _1532 * _1534;
    float _1554 = fma(_1550, 0.5, 0.5);
    float _1556 = fma(_1552, -0.5, 0.5);
    float3 _4992 = float3(_1554, _1556, _1548);
    float _1558 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4992, float3(0.0), isnan(_4992)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4992, float3(0.0), isnan(_4992)), level(0.0)).x;
    float3 _5003 = float3(_1554, _1556, _1548);
    float4 _1561 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5003, float3(0.0), isnan(_5003)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5003, float3(0.0), isnan(_5003)), level(0.0)).xyzw;
    float _1563 = _1561.x;
    float _1565 = _1561.y;
    float _1567 = _1561.z;
    float _1569 = _1561.w;
    float2 _5019 = float2(_1540, _1542);
    float3 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5019, float2(0.0), isnan(_5019)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5019, float2(0.0), isnan(_5019)), level(0.0)).xyz;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = in.m_61.x;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1585 = _1583 != 0;
    float _1587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1589 = in.m_55.w;
    bool _1591 = _184 > 0.5;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1595 = _1593 != 0;
    out.m_63.y = _730;
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1599 = _1597 != 0;
    float _1601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1603 = -_730;
    float _1605 = _1603 + 1.0;
    out.m_65.x = _1228;
    out.m_65.y = _1224;
    out.m_65.z = _1232;
    float _1607 = _1468;
    if (_1585)
    {
        bool _1609 = _170 > 0.5;
        _1058 = _1609;
    }
    bool _1611 = _1058;
    bool _1613 = _164 > 0.5;
    float _1615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1617 = 0;
    float _1619 = _1581;
    if (_1585)
    {
        float _1621 = -_1581;
        float _1623 = _1621 + 1.0;
        _1617 = as_type<int>(_1623);
    }
    int _1625 = _1617;
    float _1627 = 0.0;
    if (!_1585)
    {
        _1627 = _1581;
    }
    float _1629 = _1627;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1635 = _1629;
    if (_1585)
    {
        float _1637 = _1611 ? as_type<float>(_1625) : _1581;
        _1635 = _1637;
    }
    float _1639 = _1635;
    int _1641 = 0;
    if (_1599)
    {
        float _1643 = -_1581;
        float _1645 = _1643 + 1.0;
        _1641 = as_type<int>(_1645);
    }
    int _1647 = _1641;
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1651 = _1649 != 0;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1655 = _1591 ? as_type<int>(_1605) : as_type<int>(_730);
    bool _1657 = _1589 > 0.5;
    float _1659 = _1651 ? as_type<float>(_1655) : _730;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1663 = _1657 ? as_type<int>(_1605) : as_type<int>(_730);
    float _1665 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1669 = _1667 != 0;
    int _1671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1673 = _1671 != 0;
    float _1675 = fma(_1665, -2.0, _1661);
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1679 = _1677 != 0;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1683 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1685 = _1613 ? as_type<int>(_1605) : as_type<int>(_730);
    float _1687 = -_1681;
    float _1689 = fma(_1683, 2.0, _1687);
    float _1691 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1693 = _1601;
    float _1695 = _1691;
    float _1697 = _1661;
    if (!_1595)
    {
        _1693 = _184;
    }
    float _1699 = _1693;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1703 = _1673 ? as_type<float>(_1685) : _730;
    int _1705 = 0;
    float _1707 = _1699;
    if (_1669)
    {
        float _1709 = -_1581;
        float _1711 = _1709 + 1.0;
        _1705 = as_type<int>(_1711);
    }
    int _1713 = _1705;
    bool _1715 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(0.5);
    bool _1723 = _1719 || _1721;
    float _1725 = fma(_1691, _1659, -0.5);
    if (_1595)
    {
        _1695 = _170;
    }
    float _1727 = _1695;
    float _1729 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1701);
    float _1731 = _1727;
    if (!_1595)
    {
        _1697 = _1699;
    }
    float _1733 = _1697;
    float _1735 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1631);
    float _1737 = _1733;
    if (_1595)
    {
        _1707 = _184;
    }
    float _1739 = _1707;
    float _1741 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1729);
    float _1743 = _1741;
    float _1745 = _1739;
    if (!_1595)
    {
        _1731 = _164;
    }
    float _1747 = _1731;
    float _1749 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1675);
    float _1751 = _1679 ? as_type<float>(_1663) : _730;
    float _1753 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1755 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1759 = -_1749;
    float _1761 = fma(_1741, _1725, _1759);
    float _1763 = fma(_1755, _1703, -0.5);
    float _1765 = -_1757;
    float _1767 = fma(_1753, 2.0, _1765);
    bool _1769 = _480 != 0.0;
    bool _1771 = isnan(_480);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan(0.0);
    bool _1777 = _1773 || _1775;
    float _1779 = in.m_67.x;
    float _1781 = in.m_67.y;
    float _1783 = in.m_67.z;
    if (_1595)
    {
        _1737 = _170;
    }
    float _1785 = _1737;
    float _1787 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1789 = _478 == 0.0;
    bool _1791 = !_1777;
    bool _1793 = _1789 && _1791;
    float _1795 = -_120;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1767);
    float _1799 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1787);
    float _1801 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1803 = _482 == 0.0;
    bool _1805 = _1803 && _1793;
    float _1807 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1809 = _1785;
    if (!_1669)
    {
        _1743 = _1581;
    }
    float _1811 = _1743;
    float _1813 = -_1653;
    float _1815 = fma(_1801, 2.0, _1813);
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1819 = _1811;
    float _1821 = _1817;
    if (_1669)
    {
        float _1823 = _1613 ? as_type<float>(_1713) : _1581;
        _1819 = _1823;
    }
    float _1825 = _1819;
    float _1827 = -_120;
    float _1829 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1815);
    float _1831 = 0.0;
    if (!_1595)
    {
        _1831 = _164;
    }
    float _1833 = _1831;
    float _1835 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1837 = _1833;
    float _1839 = _1835;
    if (_1599)
    {
        float _1841 = _1591 ? as_type<float>(_1647) : _1581;
        _1619 = _1841;
    }
    float _1843 = _1619;
    float _1845 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1817);
    if (_1595)
    {
        _1837 = _1739;
    }
    float _1847 = _1837;
    float _1849 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1835);
    if (_1595)
    {
        _286 = _1739;
    }
    float _1851 = _286;
    float _1853 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1845);
    float _1855 = _1851;
    if (_1805)
    {
        _1839 = _1779;
    }
    float _1857 = _1839;
    float _1859 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1861 = _1857;
    if (!_1595)
    {
        _1745 = _170;
    }
    float _1863 = _1745;
    float _1865 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1849);
    if (_1805)
    {
        _288 = _1857;
    }
    float _1867 = _288;
    float _1869 = _1867;
    if (!_1805)
    {
        _1861 = _1779;
    }
    float _1871 = _1861;
    float _1873 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1805)
    {
        _1821 = _1783;
    }
    float _1875 = _1821;
    float _1877 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1879 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1881 = _1875;
    if (!_1805)
    {
        float _1883 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1871);
        _1869 = _1883;
    }
    float _1885 = _1869;
    if (_1805)
    {
        _1809 = _1875;
    }
    float _1887 = _1809;
    float _1889 = fma(_1877, _1843, -0.5);
    float _1891 = _1887;
    if (!_1805)
    {
        _1881 = _1783;
    }
    float _1893 = _1881;
    float _1895 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1897 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1879);
    float _1899 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_1805)
    {
        float _1901 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1893);
        _1891 = _1901;
    }
    float _1903 = _1891;
    float _1905 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1897);
    float _1907 = 0.0;
    if (_1805)
    {
        _1907 = _1781;
    }
    float _1909 = _1907;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1913 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1899);
    float _1915 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1917 = fma(_1873, _1639, -0.5);
    float _1919 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1911);
    float _1921 = _1909;
    if (_1805)
    {
        _1855 = _1909;
    }
    float _1923 = _1855;
    float _1925 = 1.0 / _1915;
    float _1927 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1929 = _1923;
    if (!_1805)
    {
        _1921 = _1781;
    }
    float _1931 = _1921;
    float _1933 = fma(_1853, _1889, _1797);
    float _1935 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1805)
    {
        float _1937 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1931);
        _1929 = _1937;
    }
    float _1939 = _1929;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1943 = _1935 + _1915;
    float _1945 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1947 = -_120;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1689);
    float _1951 = fma(_1895, -2.0, _1941);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1955 = in.m_69.x;
    float _1957 = in.m_69.y;
    float _1959 = in.m_69.z;
    float _1961 = in.m_69.w;
    float _1963 = _1943 * _1925;
    float _1965 = _1963 * 0.5;
    float _1967 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1799);
    float _1969 = fma(_1945, -2.0, _1953);
    float _1971 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1735);
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1975 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1973);
    float _1977 = fma(_1967, _1859, _1829);
    float _1979 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1969);
    float _1981 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1919);
    float _1983 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1951);
    float _1985 = _1933 + 0.5;
    float _1987 = 1.0 / _1975;
    float _1989 = -_1979;
    float _1991 = fma(_1971, _1763, _1989);
    float _1993 = _1761 + 0.5;
    float _1995 = -_1983;
    float _1997 = fma(_1981, _1807, _1995);
    float _1999 = fma(_1865, _1917, _1949);
    float _2001 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1723)
    {
        _1280 = 1.0;
    }
    float _2003 = _1280;
    float _2005 = _1997 + 0.5;
    float _2007 = _1999 + 0.5;
    float _2009 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2001);
    float _2011 = _2003;
    if (_1723)
    {
        _1282 = 1.0;
    }
    float _2013 = _1282;
    float _2015 = _1955 * _1931;
    float _2017 = _1959 * _1871;
    float _2019 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2009);
    float _2021 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2023 = _1987 * _2021;
    float _2025 = -_2015;
    float _2027 = fma(_1957, _1871, _2025);
    float _2029 = -_2017;
    float _2031 = fma(_1955, _1893, _2029);
    float _2033 = _1957 * _1893;
    float _2035 = abs(_2023);
    float _2037 = log2(_2035);
    float _2039 = _2027 * _1961;
    float _2041 = -_2033;
    float _2043 = fma(_1959, _1931, _2041);
    float _2045 = _2031 * _1961;
    float _2047 = _1977 + 0.5;
    float _2049 = _2043 * _1961;
    float _2051 = _1991 + 0.5;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_71.x = _1985;
    out.m_71.y = _2051;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2061 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2063 = -_2045;
    float _2065 = _802 * _2063;
    float _2067 = _796 * _2045;
    float _2069 = _788 * _2045;
    out.m_73.x = _2007;
    out.m_73.y = _1993;
    out.m_73.z = _2047;
    out.m_73.w = _2005;
    float _2071 = fma(_816, _2049, _2065);
    float _2073 = exp2(_2061);
    float _2075 = fma(_830, _2049, _2067);
    float _2077 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2083 = fma(_840, _2049, _2069);
    float _2085 = -_1939;
    float _2087 = _802 * _2085;
    float _2089 = _788 * _1939;
    float _2091 = in.m_75.x;
    float _2093 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2019);
    float _2095 = fma(_816, _1885, _2087);
    float _2097 = fma(_840, _1885, _2089);
    float _2099 = -_1957;
    float _2101 = _802 * _2099;
    float _2103 = _788 * _1957;
    out.m_77.x = _2079;
    out.m_77.y = _2077;
    out.m_77.z = _2081;
    out.m_77.w = _2059;
    float _2105 = _796 * _1939;
    float _2107 = _796 * _1957;
    float _2109 = fma(_816, _1955, _2101);
    float _2111 = fma(_840, _1955, _2103);
    float _2113 = fma(_806, _2039, _2071);
    float _2115 = fma(_846, _2039, _2075);
    float _2117 = fma(_832, _2039, _2083);
    float _2119 = fma(_830, _1955, _2107);
    float _2121 = fma(_806, _1959, _2109);
    out.gl_Position.x = _1530;
    out.gl_Position.y = _1532;
    out.gl_Position.z = _2093;
    out.gl_Position.w = _1468;
    float _2123 = fma(_830, _1885, _2105);
    float _2125 = fma(_846, _1959, _2119);
    float _2127 = fma(_832, _1959, _2111);
    out.m_79.x = _2113;
    out.m_79.y = _2115;
    out.m_79.z = _2117;
    float _2129 = fma(_2073, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2131 = precise::clamp(_2129, 0.0, 1.0);
    out.m_81.x = _2121;
    out.m_81.y = _2125;
    out.m_81.z = _2127;
    float _2133 = fma(_2131, -2.0, 3.0);
    float _2135 = _2131 * _2131;
    float _2137 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2139 = _2135 * _2133;
    float _2141 = -_2139;
    float _2143 = _2141 + 1.0;
    float _2145 = exp2(_2137);
    float _2147 = _1468 * 0.5;
    float _2149 = _2093 + _1468;
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2139);
    float _2153 = fma(_1532, -0.5, _2147);
    float _2155 = _1530 + _1468;
    bool _2157 = _2023 <= 8000.0;
    bool _2159 = isnan(_2023);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan(8000.0);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = _2149 * 0.5;
    float _2171 = _2155 * 0.5;
    float _2173 = _2013;
    float _2175 = _2093;
    if (!_1723)
    {
        float _2177 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2179 = _2177 * 0.15915493667125701904296875;
        float _2181 = _2179 * 6.283185482025146484375;
        float _2183 = cos(_2181);
        float _2185 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2187 = _2185 * 0.15915493667125701904296875;
        float _2189 = _2179 * 6.283185482025146484375;
        float _2191 = sin(_2189);
        float _2193 = 1.0 / _2183;
        float _2195 = _2187 * 6.283185482025146484375;
        float _2197 = cos(_2195);
        float _2199 = _2191 * _2193;
        float _2201 = _2187 * 6.283185482025146484375;
        float _2203 = sin(_2201);
        float _2205 = _2197 * _2199;
        float _2207 = 1.0 / _2205;
        float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2211 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2209;
        float _2213 = 1.0 / _2211;
        float _2215 = _2203 * _2207;
        float _2217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2219 = fma(_2023, _2215, _2217);
        float _2221 = _2219 * _2213;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        _2173 = _2223;
        _2175 = _2219;
        _1607 = _2193;
    }
    float _2225 = _2173;
    float _2227 = _2175;
    float _2229 = _1607;
    float _2231 = _2227;
    float _2233 = _2229;
    if (!_1723)
    {
        float _2235 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2237 = _2235 * 0.15915493667125701904296875;
        float _2239 = _2237 * 6.283185482025146484375;
        float _2241 = cos(_2239);
        float _2243 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2245 = _2243 * 0.15915493667125701904296875;
        float _2247 = _2237 * 6.283185482025146484375;
        float _2249 = sin(_2247);
        float _2251 = 1.0 / _2241;
        float _2253 = _2245 * 6.283185482025146484375;
        float _2255 = cos(_2253);
        float _2257 = _2249 * _2251;
        float _2259 = _2245 * 6.283185482025146484375;
        float _2261 = sin(_2259);
        float _2263 = _2255 * _2257;
        float _2265 = 1.0 / _2263;
        float _2267 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2269 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2267;
        float _2271 = 1.0 / _2269;
        float _2273 = _2261 * _2265;
        float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2277 = fma(_2023, _2273, _2275);
        float _2279 = _2277 * _2271;
        float _2281 = precise::clamp(_2279, 0.0, 1.0);
        float _2283 = -_2281;
        float _2285 = _2283 + 1.0;
        _2011 = _2285;
        _2231 = _2245;
        _2233 = _2237;
    }
    float _2287 = _2011;
    float _2289 = _2231;
    float _2291 = _2233;
    float _2293 = _2167 * _2151;
    float _2295 = -_2145;
    float _2297 = _2295 + 1.0;
    float _2299 = fma(_806, _1903, _2095);
    float _2301 = -_1546;
    float _2303 = _2301 + 1.0;
    float _2305 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2307 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2309 = fma(_846, _1903, _2123);
    float _2311 = _2303 * _2305;
    float _2313 = precise::clamp(_2311, 0.0, 1.0);
    float _2315 = _2307 * _1558;
    float _2317 = -_2307;
    float _2319 = _2317 + 1.0;
    float _2321 = fma(_832, _1903, _2097);
    float _2323 = -_2313;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2327 = _1569 * _2315;
    float _2329 = _1579 * _2315;
    out.m_83.x = _1212;
    out.m_83.y = _1210;
    out.m_83.z = _1214;
    float _2331 = _2325 * _2091;
    float _2333 = fma(_1575, _2327, _1563);
    float _2335 = fma(_1577, _2327, _1565);
    float _2337 = _1569 * _2319;
    float _2339 = fma(_1569, _2329, _1567);
    out.m_85.x = _2299;
    out.m_85.y = _2309;
    out.m_85.z = _2321;
    bool _2341 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2343 = isnan(_1248);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2349 = _2345 || _2347;
    float _2351 = _2331 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2333;
    out.m_87.y = _2335;
    out.m_87.z = _2339;
    out.m_87.w = _2337;
    out.m_89.x = _2171;
    out.m_89.y = _2153;
    out.m_89.z = _2169;
    out.m_89.w = _1468;
    out.m_91.x = _2351;
    float _2353 = _2291;
    float _2355 = _2289;
    float _2357 = _2307;
    float _2359 = _2319;
    float _2361 = _2313;
    float _2363 = _2351;
    if (!_2349)
    {
        _2353 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2365 = _2353;
    float _2367 = _2365;
    float _2369 = _2365;
    if (!_2349)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2371 = _2355;
    float _2373 = _2371;
    float _2375 = _2371;
    if (!_2349)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2377 = _2357;
    float _2379 = _2377;
    float _2381 = _2377;
    if (!_2349)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2383 = _2359;
    float _2385 = _2225 * _2287;
    float _2387 = _2383;
    float _2389 = _2383;
    if (!_2349)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2391 = _2361;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2349)
    {
        _2363 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2397 = _2363;
    float _2399 = _2385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2401 = !_2349;
    float _2403 = _2397;
    float _2405 = _2397;
    if (!_2401)
    {
        bool _2407 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2409 = isnan(_1248);
        bool _2411 = _2407 || _2409;
        bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2415 = _2411 || _2413;
        if (!_2415)
        {
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2419 = _1248 + _2417;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2423 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2421;
            float _2425 = 1.0 / _2423;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2447 = _2419 * _2425;
            float _2449 = precise::clamp(_2447, 0.0, 1.0);
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2455 = fma(_2449, _2429, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2457 = fma(_2449, _2453, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2459 = fma(_2449, _2433, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2461 = fma(_2449, _2437, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2463 = fma(_2449, _2441, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2465 = fma(_2449, _2445, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2375 = _2457;
            _2395 = _2463;
            _2369 = _2455;
            _2389 = _2461;
            _2381 = _2459;
            _2405 = _2465;
            _2467 = true;
        }
        else
        {
            bool _2469 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2471 = isnan(_1248);
            bool _2473 = _2469 || _2471;
            bool _2475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2477 = _2473 || _2475;
            if (!_2477)
            {
                _2367 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2479 = _2367;
            _2369 = _2479;
            if (!_2477)
            {
                _2373 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2481 = _2373;
            _2375 = _2481;
            if (!_2477)
            {
                _2379 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2483 = _2379;
            _2381 = _2483;
            if (!_2477)
            {
                _2387 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2485 = _2387;
            _2389 = _2485;
            if (!_2477)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2487 = _2393;
            _2395 = _2487;
            if (!_2477)
            {
                _2403 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2489 = _2403;
            bool _2491 = !_2477;
            _2405 = _2489;
            if (!_2491)
            {
                bool _2493 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2495 = isnan(_1248);
                bool _2497 = _2493 || _2495;
                bool _2499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2501 = _2497 || _2499;
                if (!_2501)
                {
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2505 = _1248 + _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2509 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2507;
                    float _2511 = 1.0 / _2509;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2523 = _2521 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2533 = _2505 * _2511;
                    float _2535 = precise::clamp(_2533, 0.0, 1.0);
                    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2541 = fma(_2535, _2515, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2543 = fma(_2535, _2539, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2545 = fma(_2535, _2519, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2547 = fma(_2535, _2523, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2549 = fma(_2535, _2527, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2551 = fma(_2535, _2531, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2375 = _2543;
                    _2395 = _2549;
                    _2369 = _2541;
                    _2389 = _2547;
                    _2381 = _2545;
                    _2405 = _2551;
                    _2467 = true;
                }
                else
                {
                    _2375 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2369 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2389 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2381 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2405 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2467 = false;
    float _2553 = _2375;
    float _2555 = _2395;
    float _2557 = _2369;
    float _2559 = _2389;
    float _2561 = _2381;
    float _2563 = _2405;
    float _2565 = fma(_2309, -0.5, 0.5);
    float _2567 = precise::clamp(_2565, 0.0, 1.0);
    float _2569 = -_2553;
    float _2571 = _2569 + _2555;
    float _2573 = _2399 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2575 = -_2557;
    float _2577 = _2575 + _2559;
    out.m_93.x = 0.0;
    float _2579 = fma(_2567, _2571, _2553);
    float _2581 = fma(_2567, _2577, _2557);
    out.m_53.x = _2573;
    float _2583 = -_2561;
    float _2585 = _2583 + _2563;
    float _2587 = _2579 * 0.586610972881317138671875;
    bool _2589 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2591 = fma(_2567, _2585, _2561);
    float _2593 = fma(_2581, 0.298911988735198974609375, _2587);
    bool _2595 = _2225 > 0.0;
    bool _2597 = isnan(_2225);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan(0.0);
    bool _2603 = _2599 || _2601;
    float _2605 = fma(_2591, 0.114477999508380889892578125, _2593);
    bool _2607 = _2287 <= 0.0;
    bool _2609 = !_2603;
    bool _2611 = _2607 || _2609;
    float _2613 = -_2605;
    float _2615 = _2581 + _2613;
    float _2617 = -_2605;
    float _2619 = _2579 + _2617;
    float _2621 = -_2605;
    float _2623 = _2591 + _2621;
    float _2625 = fma(_2615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2605);
    float _2627 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2605);
    float _2629 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2605);
    bool _2631 = !_2589;
    if (!_2631)
    {
        float _2633 = -_1210;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2637 = -_1212;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2641 = -_1214;
        float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2645 = _2635 * _2635;
        float _2647 = fma(_2639, _2639, _2645);
        float _2649 = fma(_2643, _2643, _2647);
        float _2651 = sqrt(_2649);
        float _2653 = rsqrt(_2649);
        float _2655 = -_2651;
        float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2659 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2661 = precise::clamp(_2659, 0.0, 1.0);
        float _2663 = _2639 * _2653;
        float _2665 = _2635 * _2653;
        float _2667 = abs(_2661);
        float _2669 = log2(_2667);
        float _2671 = _2643 * _2653;
        float _2673 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2675 = _2309 * _2665;
        float _2677 = -_2665;
        float _2679 = -_2673;
        float _2681 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2679);
        float _2683 = fma(_2299, _2663, _2675);
        float _2685 = -_2671;
        float _2687 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2681);
        float _2689 = fma(_2321, _2671, _2683);
        float _2691 = precise::clamp(_2689, 0.0, 1.0);
        float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2695 = _2687 + _2693;
        float _2697 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        float _2703 = exp2(_2697);
        float _2705 = _2703 * _2701;
        float _2707 = _2691 * _2705;
        float _2709 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2711 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2713 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2709;
        out.m_93.y = _2711;
        out.m_93.z = _2713;
    }
    out.m_95.x = _2625;
    out.m_95.y = _2627;
    out.m_95.z = _2629;
    if (!_2611)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2715 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2715;
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
    out.dm_pad9 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_124)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_134);
        out.gl_Position.z = _2781;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _138 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_111);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_116);
    bool _150 = _120 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _136 = as_type<int>(_160);
    }
    int _162 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2837 = as_type<float>(_162);
        out.gl_Position.z = _2837;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_55.z;
    float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _168 = log2(_166);
    float _170 = in.m_55.x;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _174 = _172 != 0;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _182 = _180 != 0;
    float _184 = in.m_55.y;
    float _186 = in.m_46.x;
    float _188 = in.m_46.y;
    float _190 = in.m_46.z;
    float _192 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _194 = _120 * _168;
    float _196 = -_192;
    float _198 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _196);
    float _200 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _202 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _204 = _164 * 2.0;
    float _206 = -_200;
    float _208 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _206);
    float _210 = -_202;
    float _212 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _210);
    float _214 = floor(_204);
    float _216 = _170 * 2.0;
    float _218 = _184 + _164;
    float _220 = floor(_216);
    float _222 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _224 = _184 * 2.0;
    float _226 = _218 + (-1.0);
    float _228 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _222);
    float _230 = _198 * _198;
    float _232 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _234 = exp2(_194);
    bool _236 = _214 > 0.0;
    float _238 = _184 + _170;
    bool _240 = _214 >= 0.0;
    bool _242 = isnan(_214);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    float _250 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _228);
    float _252 = _238 + (-1.0);
    int _254 = _248 ? 0 : 1;
    float _256 = floor(_224);
    bool _258 = _220 > 0.0;
    float _260 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _262 = ~_254;
    int _264 = _262 + 1;
    int _266 = _264 + 1;
    float _268 = _188 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _270 = _220 >= 0.0;
    bool _272 = isnan(_220);
    bool _274 = _270 || _272;
    bool _276 = isnan(0.0);
    bool _278 = _274 || _276;
    float _280 = fma(_208, _208, _230);
    int _282 = _266;
    bool _284 = _278;
    float _286 = _164;
    float _288 = _170;
    if (!_236)
    {
        int _290 = ~_254;
        int _292 = _290 + 1;
        _282 = _292;
    }
    int _294 = _282;
    float _296 = -_234;
    float _298 = _296 + 1.0;
    float _300 = _188 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _310 = _306 || _308;
    float _312 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].x, _268);
    bool _314 = !_174;
    int _316 = _314 ? 0 : 1;
    float _318 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    bool _320 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _322 = isnan(1.0);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _328 = _324 || _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _332 = 1.0 + _330;
    float _334 = _310 ? _298 : 0.0;
    float _336 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[6].z, _318);
    bool _338 = _256 > 0.0;
    float _340 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    bool _342 = _256 >= 0.0;
    bool _344 = isnan(_256);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = 1.0 / _332;
    int _354 = abs(_316);
    float _356 = _336 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _358 = float(_294);
    float _360 = fma(_212, _212, _280);
    float _362 = float(_354);
    float _364 = -_356;
    float _366 = _364 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _368 = _278 ? 0 : 1;
    float _370 = rsqrt(_250);
    float _372 = _340 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _374 = _362 * _358;
    int _376 = _350 ? 0 : 1;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _380 = _372 + _378;
    int _382 = ~_368;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    bool _388 = !_178;
    int _390 = _388 ? 0 : 1;
    float _392 = _334 * _352;
    int _394 = _386;
    float _396 = _380;
    float _398 = _366;
    if (!_258)
    {
        int _400 = ~_368;
        int _402 = _400 + 1;
        _394 = _402;
    }
    int _404 = _394;
    float _406 = _374 * (-2.0);
    float _408 = abs(_380);
    float _410 = abs(_366);
    float _412 = precise::max(_408, _410);
    float _414 = _170 * 6.283185482025146484375;
    int _416 = ~_376;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    float _422 = rsqrt(_360);
    int _424 = abs(_390);
    int _426 = _420;
    if (!_338)
    {
        int _428 = ~_376;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = fma(_260, _406, _260);
    bool _436 = _412 >= 16.0;
    float _438 = fma(_120, 0.02999999932944774627685546875, _414);
    float _440 = float(_424);
    float _442 = _170 + (-0.5);
    float _444 = float(_404);
    float _446 = _438 * 0.15915493667125701904296875;
    bool _448 = !_328;
    float _450 = _448 ? _120 : _392;
    float _452 = _442 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _454 = float(_432);
    float _456 = _440 * _444;
    float _458 = _370 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _460 = fma(_450, _434, _452);
    bool _462 = !_182;
    int _464 = _462 ? 0 : 1;
    if (_436)
    {
        float _466 = _380 * 0.0625;
        _396 = _466;
    }
    float _468 = _396;
    float _470 = _458 * (-0.699999988079071044921875);
    float _472 = _366 * 0.0625;
    int _474 = abs(_464);
    float _476 = _170 + _164;
    float _478 = in.m_57.x;
    float _480 = in.m_57.y;
    float _482 = in.m_57.z;
    float _484 = _470 * 0.15915493667125701904296875;
    float _486 = _436 ? _472 : _366;
    float _488 = _476 + (-1.0);
    float _490 = abs(_468);
    bool _492 = _490 != 0.0;
    bool _494 = isnan(_490);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = in.m_59.x;
    float _504 = in.m_59.y;
    float _506 = in.m_59.z;
    float _508 = float(_474);
    float _510 = _460 * 0.15915493667125701904296875;
    float _512 = abs(_486);
    bool _514 = _512 == 0.0;
    bool _516 = !_500;
    bool _518 = _514 && _516;
    float _520 = _456 * (-2.0);
    float _522 = abs(_486);
    bool _524 = _522 == 0.0;
    float _526 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _528 = _446 * 6.283185482025146484375;
    float _530 = sin(_528);
    float _532 = _508 * _454;
    float _534 = fma(_232, _520, _232);
    float _536 = _164 + (-0.5);
    float _538 = _184 + (-0.5);
    float _540 = _532 * (-2.0);
    float _542 = _536 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _544 = _484 * 6.283185482025146484375;
    float _546 = sin(_544);
    float _548 = _538;
    if (_518)
    {
        bool _550 = as_type<int>(_486) >= 0;
        _284 = _550;
    }
    bool _552 = _284;
    float _554 = fma(_526, _540, _526);
    float _556 = _538 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _558 = 0;
    int _560 = _552 ? (-1) : 0;
    int _562 = as_type<int>(_554);
    if (_518)
    {
        int _564 = _552 ? 0 : 1078530011;
        _558 = _564;
    }
    int _566 = _558;
    float _568 = fma(_450, _554, _542);
    float _570 = fma(_450, _534, _556);
    float _572 = _510 * 6.283185482025146484375;
    float _574 = sin(_572);
    if (_518)
    {
        int _576 = int(0x80000000) & as_type<int>(_468);
        int _578 = _566 | _576;
        _548 = as_type<float>(_578);
    }
    float _580 = _548;
    float _582 = _510 * 6.283185482025146484375;
    float _584 = cos(_582);
    bool _586 = !_500;
    bool _588 = _586 && _524;
    float _590 = _580;
    float _592 = _580;
    if (!_588)
    {
        float _594 = abs(_468);
        bool _596 = _594 != as_type<float>(0x7f800000u /* inf */);
        bool _598 = isnan(_594);
        bool _600 = _596 || _598;
        bool _602 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _604 = _600 || _602;
        float _606 = abs(_486);
        bool _608 = _606 == as_type<float>(0x7f800000u /* inf */);
        float _610 = abs(_486);
        bool _612 = _610 == as_type<float>(0x7f800000u /* inf */);
        bool _614 = !_604;
        bool _616 = _612 && _614;
        if (_616)
        {
            bool _618 = as_type<int>(_486) >= 0;
            _560 = _618 ? (-1) : 0;
        }
        int _620 = _560;
        if (_616)
        {
            _562 = 1075235812;
        }
        int _622 = _562;
        int _624 = _622;
        if (_616)
        {
            int _626 = ~_620;
            int _628 = (_626 != 0) ? _622 : 1061752795;
            _624 = _628;
        }
        int _630 = _624;
        if (_616)
        {
            int _632 = int(0x80000000) & as_type<int>(_468);
            int _634 = _630 | _632;
            _590 = as_type<float>(_634);
        }
        float _636 = _590;
        bool _638 = !_604;
        bool _640 = _638 && _608;
        _592 = _636;
        if (!_640)
        {
            float _642 = abs(_468);
            float _644 = abs(_486);
            float _646 = precise::max(_642, _644);
            float _648 = abs(_468);
            float _650 = abs(_486);
            float _652 = precise::min(_648, _650);
            float _654 = 1.0 / _646;
            float _656 = abs(_468);
            float _658 = abs(_486);
            bool _660 = _656 > _658;
            bool _662 = as_type<int>(_486) >= 0;
            float _664 = abs(_468);
            float _666 = abs(_486);
            float _668 = _664 + _666;
            bool _670 = _668 > as_type<float>(0x7f800000u /* inf */);
            bool _672 = isnan(_668);
            bool _674 = _670 || _672;
            bool _676 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _678 = _674 || _676;
            float _680 = _652 * _654;
            float _682 = _680 * _680;
            float _684 = _682 + 11.33538818359375;
            float _686 = fma(_682, _684, 28.84246826171875);
            float _688 = fma(_682, _686, 19.6966705322265625);
            float _690 = fma(_682, -0.82336294651031494140625, -5.674867153167724609375);
            float _692 = fma(_682, _690, -6.565555095672607421875);
            float _694 = 1.0 / _688;
            float _696 = _682 * _692;
            float _698 = _680 * _696;
            float _700 = fma(_698, _694, _680);
            int _702 = as_type<int>(_468) & int(0x80000000);
            float _704 = _700;
            _592 = _668;
            if (_660)
            {
                float _706 = -_700;
                float _708 = _706 + 1.57079637050628662109375;
                _704 = _708;
            }
            float _710 = _704;
            int _712 = as_type<int>(_710);
            if (!_662)
            {
                float _714 = -_710;
                float _716 = _714 + 3.1415927410125732421875;
                _712 = as_type<int>(_716);
            }
            int _718 = _712;
            if (!_678)
            {
                int _720 = _702 | _718;
                _592 = as_type<float>(_720);
            }
        }
    }
    float _722 = _592;
    float _724 = -_722;
    float _726 = _570 + _724;
    float _728 = _188 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _730 = in.m_61.y;
    float _732 = _726 * 0.15915493667125701904296875;
    float _734 = _568 * 0.15915493667125701904296875;
    float _736 = _502 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _738 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].x, _728);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _742 = fma(_740, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _744 = _734 * 6.283185482025146484375;
    float _746 = cos(_744);
    float _748 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = _504 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _478);
    float _754 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[5].z, _738);
    float _756 = _506 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _480);
    float _760 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _762 = _732 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _752 * _748;
    float _768 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _770 = _198 * _422;
    float _772 = _758 * _760;
    float _774 = _208 * _422;
    float _776 = _212 * _422;
    float _778 = -_730;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _782 = _732 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _770 * _770;
    float _788 = _574 * _746;
    float _790 = _530 * _780;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _482);
    float _794 = fma(_774, _774, _786);
    float _796 = _584 * _746;
    float _798 = _754 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = _734 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _574 * _764;
    float _806 = _764 * _746;
    float _808 = _792 * _768;
    float _810 = _742 * _790;
    float _812 = _584 * _784;
    float _814 = _574 * _784;
    float _816 = _784 * _746;
    float _818 = fma(_776, _776, _794);
    float _820 = _484 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _584 * _764;
    float _826 = _796 * _772;
    float _828 = _788 * _772;
    float _830 = fma(_802, _812, _804);
    float _832 = fma(_802, _804, _812);
    float _834 = -_772;
    float _836 = _802 * _834;
    float _838 = -_824;
    float _840 = fma(_802, _814, _838);
    float _842 = rsqrt(_818);
    float _844 = -_814;
    float _846 = fma(_802, _824, _844);
    float _848 = fma(_816, _766, _836);
    float _850 = fma(_830, _766, _826);
    float _852 = fma(_840, _766, _828);
    float _854 = fma(_806, _808, _848);
    float _856 = fma(_846, _808, _850);
    float _858 = fma(_832, _808, _852);
    float _860 = -_822;
    float _862 = _860 + 1.0;
    float _864 = _372 + _854;
    float _866 = _798 + _856;
    float _868 = _356 + _858;
    float _870 = fma(_774, _810, _864);
    float _872 = fma(_770, _810, _866);
    float _874 = _774 * _842;
    float _876 = _770 * _842;
    float _878 = _776 * _842;
    float _880 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _882 = _872 + _880;
    float _884 = _874 * _546;
    float _886 = _876 * _546;
    float _888 = _878 * _546;
    float _890 = _874 * _862;
    float _892 = _876 * _862;
    float _894 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _896 = _870 + _894;
    float _898 = fma(_776, _810, _868);
    float _900 = fma(_876, _890, _888);
    float _902 = fma(_876, _892, _822);
    float _904 = -_888;
    float _906 = fma(_876, _890, _904);
    float _908 = fma(_874, _890, _822);
    float _910 = -_886;
    float _912 = fma(_878, _890, _910);
    float _914 = fma(_878, _890, _886);
    float _916 = _902 * _882;
    float _918 = fma(_878, _892, _884);
    float _920 = -_884;
    float _922 = fma(_878, _892, _920);
    float _924 = _906 * _882;
    float _926 = fma(_900, _896, _916);
    float _928 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _930 = _898 + _928;
    float _932 = _878 * _878;
    float _934 = _918 * _882;
    float _936 = fma(_908, _896, _924);
    float _938 = fma(_922, _930, _926);
    float _940 = fma(_862, _932, _822);
    float _942 = fma(_912, _896, _934);
    float _944 = fma(_914, _930, _936);
    float _946 = _938 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _948 = _938 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _950 = fma(_940, _930, _942);
    float _952 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].y, _946);
    float _954 = _938 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].x, _948);
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _960 = _958 != 0;
    float _962 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].y, _952);
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].z, _954);
    float _966 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].x, _956);
    float _968 = _962 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _970 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].z, _964);
    float _972 = _966 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _974 = _968 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _976 = _970 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _978 = _968 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _980 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[10].x, _974);
    float _982 = _822;
    float _984 = _976;
    float _986 = _972;
    float _988 = _764;
    if (!_960)
    {
        _982 = 0.0;
    }
    float _990 = _982;
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[8].x, _978);
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[10].z, _980);
    float _996 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].z, _992);
    float _998 = _994 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1000 = _996 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1004 = _998 + _1002;
    bool _1006 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.5);
    bool _1014 = _1010 || _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1018 = _1000 + _1016;
    float _1020 = _1004 * _1004;
    float _1022 = fma(_1018, _1018, _1020);
    float _1024 = _968 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1026 = sqrt(_1022);
    float _1028 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1024);
    float _1030 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1028);
    float _1032 = _1028;
    float _1034 = _990;
    float _1036 = _998;
    float _1038 = _1000;
    float _1040 = _1022;
    if (!_960)
    {
        _1032 = 0.0;
    }
    float _1042 = _1032;
    float _1044 = _1042;
    if (!_960)
    {
        _984 = 0.0;
    }
    float _1046 = _984;
    float _1048 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1050 = _1026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1052 = !_960;
    float _1054 = _1046;
    float _1056 = _1048;
    bool _1058 = _1050;
    if (!_1052)
    {
        float _1060 = -_798;
        float _1062 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1064 = -_372;
        float _1066 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1068 = _1062 * _1062;
        float _1070 = fma(_1066, _1066, _1068);
        float _1072 = fma(_366, _366, _1070);
        float _1074 = rsqrt(_1072);
        float _1076 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1078 = _1066 * _1076;
        float _1080 = _1062 * _1076;
        float _1082 = _366 * _1076;
        _1044 = _1078;
        _1054 = _1080;
        _1034 = _1082;
    }
    float _1084 = _1044;
    float _1086 = _1054;
    float _1088 = _1034;
    if (!_1050)
    {
        _986 = _1048;
    }
    float _1090 = _986;
    bool _1092 = !_1050;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1026 + _1098;
        float _1102 = rsqrt(_1022);
        float _1104 = _1100 * _1096;
        float _1106 = _1048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = _1104 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = fma(_1116, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1124 = fma(_1048, _1112, _1120);
        float _1126 = _1102 * _1122;
        float _1128 = fma(_1018, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_1004, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1094 = _1124;
        _1036 = _1130;
        _1038 = _1128;
        _1040 = _1102;
        _398 = _1108;
    }
    float _1132 = _1094;
    float _1134 = _1036;
    float _1136 = _1038;
    float _1138 = _1040;
    float _1140 = _398;
    float _1142 = _372 + _1084;
    float _1144 = _1086 + _1132;
    float _1146 = _1088 + _1134;
    float _1148 = _1084 + _1136;
    float _1150 = _798 + _1086;
    float _1152 = _356 + _1088;
    float _1154 = _1144;
    float _1156 = _1148;
    float _1158 = _1146;
    float _1160 = _1138;
    float _1162 = _1136;
    float _1164 = _1140;
    if (!_1014)
    {
        float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1168 = _1150 + _1166;
        float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1172 = _1142 + _1170;
        float _1174 = -_372;
        float _1176 = _1174 + _1136;
        float _1178 = -_798;
        float _1180 = _1178 + _1132;
        float _1182 = _1168 * _1168;
        float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1186 = _1152 + _1184;
        float _1188 = -_356;
        float _1190 = _1188 + _1134;
        float _1192 = fma(_1172, _1172, _1182);
        float _1194 = fma(_1186, _1186, _1192);
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1198 = sqrt(_1194);
        float _1200 = precise::min(_1198, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1202 = _1200 * _1196;
        float _1204 = fma(_1176, _1202, _1142);
        float _1206 = fma(_1180, _1202, _1150);
        float _1208 = fma(_1190, _1202, _1152);
        _1154 = _1206;
        _1156 = _1204;
        _1158 = _1208;
        _1056 = _1182;
        _1160 = _1198;
        _1162 = _1176;
    }
    float _1210 = _1154;
    float _1212 = _1156;
    float _1214 = _1158;
    float _1216 = _1056;
    float _1218 = _1160;
    float _1220 = _1162;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1224 = _1210 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1228 = _1212 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1232 = _1214 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1238 = fma(_1228, _1228, _1234);
    float _1240 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1236);
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1244 = fma(_1232, _1232, _1238);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1228 * _1250;
    float _1254 = _1232 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1220;
    float _1274 = _1268;
    float _1276 = _1216;
    float _1278 = _1218;
    float _1280 = _1228;
    float _1282 = _1224;
    if (_1264)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1284;
    }
    float _1286 = _1270;
    if (_1264)
    {
        float _1288 = rsqrt(_1260);
        _1272 = _1288;
    }
    float _1290 = _1272;
    float _1292 = _1290;
    if (_1264)
    {
        float _1294 = _1268 * _1286;
        _1274 = _1294;
    }
    float _1296 = _1274;
    if (_1264)
    {
        float _1298 = _1296 * 0.15915493667125701904296875;
        _1276 = _1298;
    }
    float _1300 = _1276;
    float _1302 = _1286;
    float _1304 = _1300;
    if (_1264)
    {
        float _1306 = _1300 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        _1302 = _1308;
    }
    float _1310 = _1302;
    float _1312 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1314 = precise::max(0.0, _1312);
    float _1316 = _930;
    if (_1264)
    {
        float _1318 = _1300 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        _1316 = _1320;
    }
    float _1322 = _1316;
    float _1324 = -_1250;
    float _1326 = -_1314;
    float _1328 = fma(_1224, _1324, _1326);
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1264)
    {
        float _1332 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1278 = _1332;
    }
    float _1334 = _1278;
    float _1336 = _1334;
    if (!_1264)
    {
        _1304 = _1328;
    }
    float _1338 = _1304;
    float _1340 = fma(_1142, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1342 = _1338;
    if (_1264)
    {
        float _1344 = fma(_1310, _1334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1344;
    }
    float _1346 = _1164;
    float _1348 = floor(_1340);
    float _1350 = _1346;
    if (_1264)
    {
        float _1352 = _1322 + (-1.0);
        _1336 = _1352;
    }
    float _1354 = _1336;
    float _1356 = _1354;
    if (_1264)
    {
        float _1358 = _1290 * _1346;
        _988 = _1358;
    }
    float _1360 = _988;
    if (!_1264)
    {
        _1292 = _1252;
    }
    float _1362 = _1292;
    float _1364 = _1362;
    if (_1264)
    {
        float _1366 = _1354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1330 = _1366;
    }
    float _1368 = _1330;
    float _1370 = _1368;
    if (_1264)
    {
        float _1372 = _1252 * _1360;
        _1364 = _1372;
    }
    float _1374 = _1364;
    if (!_1264)
    {
        _1350 = _1254;
    }
    float _1376 = _1350;
    float _1378 = _1376;
    if (_1264)
    {
        float _1380 = _1254 * _1360;
        _1378 = _1380;
    }
    float _1382 = _1378;
    if (!_1264)
    {
        _1356 = _1256;
    }
    float _1384 = _1356;
    float _1386 = _1384;
    if (_1264)
    {
        float _1388 = fma(_1328, _1322, _1368);
        _1342 = _1388;
    }
    float _1390 = _1342;
    if (_1264)
    {
        float _1392 = _1374 * _1374;
        _1386 = _1392;
    }
    float _1394 = _1386;
    if (!_1264)
    {
        _1370 = _1258;
    }
    float _1396 = _1370;
    float _1398 = _1396;
    if (_1264)
    {
        float _1400 = _1382 * _1382;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1406 = fma(_1390, _1390, _1394);
    float _1408 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1410 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1404);
    float _1414 = _1406 + _1402;
    float _1416 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1408);
    float _1418 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1412);
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1424 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1422);
    float _1426 = precise::clamp(_1424, 0.0, 1.0);
    float _1428 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1416);
    float _1430 = rsqrt(_1414);
    float _1432 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1434 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1436 = -_1426;
    float _1438 = _1436 + 1.0;
    float _1440 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1446 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1240);
    float _1448 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1450 = abs(_1438);
    float _1452 = log2(_1450);
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1444);
    float _1456 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1458 = -_1448;
    float _1460 = fma(_1458, _1242, 1.0);
    float _1462 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1454);
    float _1464 = _1430 * _1374;
    float _1466 = _1430 * _1382;
    float _1468 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    float _1470 = _1430 * _1390;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1474 = fma(_1152, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1476 = -_1348;
    float _1478 = _1340 + _1476;
    float _1480 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = -_1472;
    float _1484 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = floor(_1474);
    float _1488 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1490 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1492 = -_1466;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1496 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = _1470 + 1.0;
    float _1500 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1502 = fma(_1494, -0.5, 0.5);
    float _1504 = exp2(_1488);
    float _1506 = fma(_1494, 0.5, 0.5);
    float _1508 = fma(_1506, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1510 = sqrt(_1502);
    float _1512 = -_1486;
    float _1514 = _1474 + _1512;
    float _1516 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1518 = fma(_1506, _1508, -0.212114393711090087890625);
    float _1520 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1516);
    float _1522 = fma(_1506, _1518, 1.570728778839111328125);
    float _1524 = log2(_1460);
    float _1526 = -_1470;
    float _1528 = fma(_1504, _1498, _1526);
    float _1530 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1532 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1520);
    float _1534 = 1.0 / _1468;
    float _1536 = _1510 * 0.636619746685028076171875;
    float _1538 = -_1522;
    float _1540 = fma(_1536, _1538, 1.0);
    float _1542 = fma(_1528, 0.5, 0.5);
    float _1544 = _1524 * 0.693147182464599609375;
    float2 _4967 = float2(_1478, _1514);
    float _1546 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4967, float2(0.0), isnan(_4967)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4967, float2(0.0), isnan(_4967)), level(0.0)).x;
    float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1550 = _1530 * _1534;
    float _1552 = _1532 * _1534;
    float _1554 = fma(_1550, 0.5, 0.5);
    float _1556 = fma(_1552, -0.5, 0.5);
    float3 _4992 = float3(_1554, _1556, _1548);
    float _1558 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4992, float3(0.0), isnan(_4992)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4992, float3(0.0), isnan(_4992)), level(0.0)).x;
    float3 _5003 = float3(_1554, _1556, _1548);
    float4 _1561 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5003, float3(0.0), isnan(_5003)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5003, float3(0.0), isnan(_5003)), level(0.0)).xyzw;
    float _1563 = _1561.x;
    float _1565 = _1561.y;
    float _1567 = _1561.z;
    float _1569 = _1561.w;
    float2 _5019 = float2(_1540, _1542);
    float3 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5019, float2(0.0), isnan(_5019)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5019, float2(0.0), isnan(_5019)), level(0.0)).xyz;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = in.m_61.x;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1585 = _1583 != 0;
    float _1587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1589 = in.m_55.w;
    bool _1591 = _184 > 0.5;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1595 = _1593 != 0;
    out.m_63.y = _730;
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1599 = _1597 != 0;
    float _1601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1603 = -_730;
    float _1605 = _1603 + 1.0;
    out.m_65.x = _1228;
    out.m_65.y = _1224;
    out.m_65.z = _1232;
    float _1607 = _1468;
    if (_1585)
    {
        bool _1609 = _170 > 0.5;
        _1058 = _1609;
    }
    bool _1611 = _1058;
    bool _1613 = _164 > 0.5;
    float _1615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1617 = 0;
    float _1619 = _1581;
    if (_1585)
    {
        float _1621 = -_1581;
        float _1623 = _1621 + 1.0;
        _1617 = as_type<int>(_1623);
    }
    int _1625 = _1617;
    float _1627 = 0.0;
    if (!_1585)
    {
        _1627 = _1581;
    }
    float _1629 = _1627;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1635 = _1629;
    if (_1585)
    {
        float _1637 = _1611 ? as_type<float>(_1625) : _1581;
        _1635 = _1637;
    }
    float _1639 = _1635;
    int _1641 = 0;
    if (_1599)
    {
        float _1643 = -_1581;
        float _1645 = _1643 + 1.0;
        _1641 = as_type<int>(_1645);
    }
    int _1647 = _1641;
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1651 = _1649 != 0;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1655 = _1591 ? as_type<int>(_1605) : as_type<int>(_730);
    bool _1657 = _1589 > 0.5;
    float _1659 = _1651 ? as_type<float>(_1655) : _730;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1663 = _1657 ? as_type<int>(_1605) : as_type<int>(_730);
    float _1665 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1669 = _1667 != 0;
    int _1671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1673 = _1671 != 0;
    float _1675 = fma(_1665, -2.0, _1661);
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1679 = _1677 != 0;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1683 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1685 = _1613 ? as_type<int>(_1605) : as_type<int>(_730);
    float _1687 = -_1681;
    float _1689 = fma(_1683, 2.0, _1687);
    float _1691 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1693 = _1601;
    float _1695 = _1691;
    float _1697 = _1661;
    if (!_1595)
    {
        _1693 = _184;
    }
    float _1699 = _1693;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1703 = _1673 ? as_type<float>(_1685) : _730;
    int _1705 = 0;
    float _1707 = _1699;
    if (_1669)
    {
        float _1709 = -_1581;
        float _1711 = _1709 + 1.0;
        _1705 = as_type<int>(_1711);
    }
    int _1713 = _1705;
    bool _1715 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(0.5);
    bool _1723 = _1719 || _1721;
    float _1725 = fma(_1691, _1659, -0.5);
    if (_1595)
    {
        _1695 = _170;
    }
    float _1727 = _1695;
    float _1729 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1701);
    float _1731 = _1727;
    if (!_1595)
    {
        _1697 = _1699;
    }
    float _1733 = _1697;
    float _1735 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1631);
    float _1737 = _1733;
    if (_1595)
    {
        _1707 = _184;
    }
    float _1739 = _1707;
    float _1741 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1729);
    float _1743 = _1741;
    float _1745 = _1739;
    if (!_1595)
    {
        _1731 = _164;
    }
    float _1747 = _1731;
    float _1749 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1675);
    float _1751 = _1679 ? as_type<float>(_1663) : _730;
    float _1753 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1755 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1759 = -_1749;
    float _1761 = fma(_1741, _1725, _1759);
    float _1763 = fma(_1755, _1703, -0.5);
    float _1765 = -_1757;
    float _1767 = fma(_1753, 2.0, _1765);
    bool _1769 = _480 != 0.0;
    bool _1771 = isnan(_480);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan(0.0);
    bool _1777 = _1773 || _1775;
    float _1779 = in.m_67.x;
    float _1781 = in.m_67.y;
    float _1783 = in.m_67.z;
    if (_1595)
    {
        _1737 = _170;
    }
    float _1785 = _1737;
    float _1787 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1789 = _478 == 0.0;
    bool _1791 = !_1777;
    bool _1793 = _1789 && _1791;
    float _1795 = -_120;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1767);
    float _1799 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1787);
    float _1801 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1803 = _482 == 0.0;
    bool _1805 = _1803 && _1793;
    float _1807 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1809 = _1785;
    if (!_1669)
    {
        _1743 = _1581;
    }
    float _1811 = _1743;
    float _1813 = -_1653;
    float _1815 = fma(_1801, 2.0, _1813);
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1819 = _1811;
    float _1821 = _1817;
    if (_1669)
    {
        float _1823 = _1613 ? as_type<float>(_1713) : _1581;
        _1819 = _1823;
    }
    float _1825 = _1819;
    float _1827 = -_120;
    float _1829 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1815);
    float _1831 = 0.0;
    if (!_1595)
    {
        _1831 = _164;
    }
    float _1833 = _1831;
    float _1835 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1837 = _1833;
    float _1839 = _1835;
    if (_1599)
    {
        float _1841 = _1591 ? as_type<float>(_1647) : _1581;
        _1619 = _1841;
    }
    float _1843 = _1619;
    float _1845 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1817);
    if (_1595)
    {
        _1837 = _1739;
    }
    float _1847 = _1837;
    float _1849 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1835);
    if (_1595)
    {
        _286 = _1739;
    }
    float _1851 = _286;
    float _1853 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1845);
    float _1855 = _1851;
    if (_1805)
    {
        _1839 = _1779;
    }
    float _1857 = _1839;
    float _1859 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1861 = _1857;
    if (!_1595)
    {
        _1745 = _170;
    }
    float _1863 = _1745;
    float _1865 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1849);
    if (_1805)
    {
        _288 = _1857;
    }
    float _1867 = _288;
    float _1869 = _1867;
    if (!_1805)
    {
        _1861 = _1779;
    }
    float _1871 = _1861;
    float _1873 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1805)
    {
        _1821 = _1783;
    }
    float _1875 = _1821;
    float _1877 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1879 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1881 = _1875;
    if (!_1805)
    {
        float _1883 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1871);
        _1869 = _1883;
    }
    float _1885 = _1869;
    if (_1805)
    {
        _1809 = _1875;
    }
    float _1887 = _1809;
    float _1889 = fma(_1877, _1843, -0.5);
    float _1891 = _1887;
    if (!_1805)
    {
        _1881 = _1783;
    }
    float _1893 = _1881;
    float _1895 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1897 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1879);
    float _1899 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_1805)
    {
        float _1901 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1893);
        _1891 = _1901;
    }
    float _1903 = _1891;
    float _1905 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1897);
    float _1907 = 0.0;
    if (_1805)
    {
        _1907 = _1781;
    }
    float _1909 = _1907;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1913 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1899);
    float _1915 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1917 = fma(_1873, _1639, -0.5);
    float _1919 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1911);
    float _1921 = _1909;
    if (_1805)
    {
        _1855 = _1909;
    }
    float _1923 = _1855;
    float _1925 = 1.0 / _1915;
    float _1927 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1929 = _1923;
    if (!_1805)
    {
        _1921 = _1781;
    }
    float _1931 = _1921;
    float _1933 = fma(_1853, _1889, _1797);
    float _1935 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1805)
    {
        float _1937 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1931);
        _1929 = _1937;
    }
    float _1939 = _1929;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1943 = _1935 + _1915;
    float _1945 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1947 = -_120;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1689);
    float _1951 = fma(_1895, -2.0, _1941);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1955 = in.m_69.x;
    float _1957 = in.m_69.y;
    float _1959 = in.m_69.z;
    float _1961 = in.m_69.w;
    float _1963 = _1943 * _1925;
    float _1965 = _1963 * 0.5;
    float _1967 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1799);
    float _1969 = fma(_1945, -2.0, _1953);
    float _1971 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1735);
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1975 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1973);
    float _1977 = fma(_1967, _1859, _1829);
    float _1979 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1969);
    float _1981 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1919);
    float _1983 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1951);
    float _1985 = _1933 + 0.5;
    float _1987 = 1.0 / _1975;
    float _1989 = -_1979;
    float _1991 = fma(_1971, _1763, _1989);
    float _1993 = _1761 + 0.5;
    float _1995 = -_1983;
    float _1997 = fma(_1981, _1807, _1995);
    float _1999 = fma(_1865, _1917, _1949);
    float _2001 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1723)
    {
        _1280 = 1.0;
    }
    float _2003 = _1280;
    float _2005 = _1997 + 0.5;
    float _2007 = _1999 + 0.5;
    float _2009 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2001);
    float _2011 = _2003;
    if (_1723)
    {
        _1282 = 1.0;
    }
    float _2013 = _1282;
    float _2015 = _1955 * _1931;
    float _2017 = _1959 * _1871;
    float _2019 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2009);
    float _2021 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2023 = _1987 * _2021;
    float _2025 = -_2015;
    float _2027 = fma(_1957, _1871, _2025);
    float _2029 = -_2017;
    float _2031 = fma(_1955, _1893, _2029);
    float _2033 = _1957 * _1893;
    float _2035 = abs(_2023);
    float _2037 = log2(_2035);
    float _2039 = _2027 * _1961;
    float _2041 = -_2033;
    float _2043 = fma(_1959, _1931, _2041);
    float _2045 = _2031 * _1961;
    float _2047 = _1977 + 0.5;
    float _2049 = _2043 * _1961;
    float _2051 = _1991 + 0.5;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_71.x = _1985;
    out.m_71.y = _2051;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2061 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2063 = -_2045;
    float _2065 = _802 * _2063;
    float _2067 = _796 * _2045;
    float _2069 = _788 * _2045;
    out.m_73.x = _2007;
    out.m_73.y = _1993;
    out.m_73.z = _2047;
    out.m_73.w = _2005;
    float _2071 = fma(_816, _2049, _2065);
    float _2073 = exp2(_2061);
    float _2075 = fma(_830, _2049, _2067);
    float _2077 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2083 = fma(_840, _2049, _2069);
    float _2085 = -_1939;
    float _2087 = _802 * _2085;
    float _2089 = _788 * _1939;
    float _2091 = in.m_75.x;
    float _2093 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2019);
    float _2095 = fma(_816, _1885, _2087);
    float _2097 = fma(_840, _1885, _2089);
    float _2099 = -_1957;
    float _2101 = _802 * _2099;
    float _2103 = _788 * _1957;
    out.m_77.x = _2079;
    out.m_77.y = _2077;
    out.m_77.z = _2081;
    out.m_77.w = _2059;
    float _2105 = _796 * _1939;
    float _2107 = _796 * _1957;
    float _2109 = fma(_816, _1955, _2101);
    float _2111 = fma(_840, _1955, _2103);
    float _2113 = fma(_806, _2039, _2071);
    float _2115 = fma(_846, _2039, _2075);
    float _2117 = fma(_832, _2039, _2083);
    float _2119 = fma(_830, _1955, _2107);
    float _2121 = fma(_806, _1959, _2109);
    out.gl_Position.x = _1530;
    out.gl_Position.y = _1532;
    out.gl_Position.z = _2093;
    out.gl_Position.w = _1468;
    float _2123 = fma(_830, _1885, _2105);
    float _2125 = fma(_846, _1959, _2119);
    float _2127 = fma(_832, _1959, _2111);
    out.m_79.x = _2113;
    out.m_79.y = _2115;
    out.m_79.z = _2117;
    float _2129 = fma(_2073, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2131 = precise::clamp(_2129, 0.0, 1.0);
    out.m_81.x = _2121;
    out.m_81.y = _2125;
    out.m_81.z = _2127;
    float _2133 = fma(_2131, -2.0, 3.0);
    float _2135 = _2131 * _2131;
    float _2137 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2139 = _2135 * _2133;
    float _2141 = -_2139;
    float _2143 = _2141 + 1.0;
    float _2145 = exp2(_2137);
    float _2147 = _1468 * 0.5;
    float _2149 = _2093 + _1468;
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2139);
    float _2153 = fma(_1532, -0.5, _2147);
    float _2155 = _1530 + _1468;
    bool _2157 = _2023 <= 8000.0;
    bool _2159 = isnan(_2023);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan(8000.0);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = _2149 * 0.5;
    float _2171 = _2155 * 0.5;
    float _2173 = _2013;
    float _2175 = _2093;
    if (!_1723)
    {
        float _2177 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2179 = _2177 * 0.15915493667125701904296875;
        float _2181 = _2179 * 6.283185482025146484375;
        float _2183 = cos(_2181);
        float _2185 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2187 = _2185 * 0.15915493667125701904296875;
        float _2189 = _2179 * 6.283185482025146484375;
        float _2191 = sin(_2189);
        float _2193 = 1.0 / _2183;
        float _2195 = _2187 * 6.283185482025146484375;
        float _2197 = cos(_2195);
        float _2199 = _2191 * _2193;
        float _2201 = _2187 * 6.283185482025146484375;
        float _2203 = sin(_2201);
        float _2205 = _2197 * _2199;
        float _2207 = 1.0 / _2205;
        float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2211 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2209;
        float _2213 = 1.0 / _2211;
        float _2215 = _2203 * _2207;
        float _2217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2219 = fma(_2023, _2215, _2217);
        float _2221 = _2219 * _2213;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        _2173 = _2223;
        _2175 = _2219;
        _1607 = _2193;
    }
    float _2225 = _2173;
    float _2227 = _2175;
    float _2229 = _1607;
    float _2231 = _2227;
    float _2233 = _2229;
    if (!_1723)
    {
        float _2235 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2237 = _2235 * 0.15915493667125701904296875;
        float _2239 = _2237 * 6.283185482025146484375;
        float _2241 = cos(_2239);
        float _2243 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2245 = _2243 * 0.15915493667125701904296875;
        float _2247 = _2237 * 6.283185482025146484375;
        float _2249 = sin(_2247);
        float _2251 = 1.0 / _2241;
        float _2253 = _2245 * 6.283185482025146484375;
        float _2255 = cos(_2253);
        float _2257 = _2249 * _2251;
        float _2259 = _2245 * 6.283185482025146484375;
        float _2261 = sin(_2259);
        float _2263 = _2255 * _2257;
        float _2265 = 1.0 / _2263;
        float _2267 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2269 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2267;
        float _2271 = 1.0 / _2269;
        float _2273 = _2261 * _2265;
        float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2277 = fma(_2023, _2273, _2275);
        float _2279 = _2277 * _2271;
        float _2281 = precise::clamp(_2279, 0.0, 1.0);
        float _2283 = -_2281;
        float _2285 = _2283 + 1.0;
        _2011 = _2285;
        _2231 = _2245;
        _2233 = _2237;
    }
    float _2287 = _2011;
    float _2289 = _2231;
    float _2291 = _2233;
    float _2293 = _2167 * _2151;
    float _2295 = -_2145;
    float _2297 = _2295 + 1.0;
    float _2299 = fma(_806, _1903, _2095);
    float _2301 = -_1546;
    float _2303 = _2301 + 1.0;
    float _2305 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2307 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2309 = fma(_846, _1903, _2123);
    float _2311 = _2303 * _2305;
    float _2313 = precise::clamp(_2311, 0.0, 1.0);
    float _2315 = _2307 * _1558;
    float _2317 = -_2307;
    float _2319 = _2317 + 1.0;
    float _2321 = fma(_832, _1903, _2097);
    float _2323 = -_2313;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2327 = _1569 * _2315;
    float _2329 = _1579 * _2315;
    out.m_83.x = _1212;
    out.m_83.y = _1210;
    out.m_83.z = _1214;
    float _2331 = _2325 * _2091;
    float _2333 = fma(_1575, _2327, _1563);
    float _2335 = fma(_1577, _2327, _1565);
    float _2337 = _1569 * _2319;
    float _2339 = fma(_1569, _2329, _1567);
    out.m_85.x = _2299;
    out.m_85.y = _2309;
    out.m_85.z = _2321;
    bool _2341 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2343 = isnan(_1248);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2349 = _2345 || _2347;
    float _2351 = _2331 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2333;
    out.m_87.y = _2335;
    out.m_87.z = _2339;
    out.m_87.w = _2337;
    out.m_89.x = _2171;
    out.m_89.y = _2153;
    out.m_89.z = _2169;
    out.m_89.w = _1468;
    out.m_91.x = _2351;
    float _2353 = _2291;
    float _2355 = _2289;
    float _2357 = _2307;
    float _2359 = _2319;
    float _2361 = _2313;
    float _2363 = _2351;
    if (!_2349)
    {
        _2353 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2365 = _2353;
    float _2367 = _2365;
    float _2369 = _2365;
    if (!_2349)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2371 = _2355;
    float _2373 = _2371;
    float _2375 = _2371;
    if (!_2349)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2377 = _2357;
    float _2379 = _2377;
    float _2381 = _2377;
    if (!_2349)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2383 = _2359;
    float _2385 = _2225 * _2287;
    float _2387 = _2383;
    float _2389 = _2383;
    if (!_2349)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2391 = _2361;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2349)
    {
        _2363 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2397 = _2363;
    float _2399 = _2385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2401 = !_2349;
    float _2403 = _2397;
    float _2405 = _2397;
    if (!_2401)
    {
        bool _2407 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2409 = isnan(_1248);
        bool _2411 = _2407 || _2409;
        bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2415 = _2411 || _2413;
        if (!_2415)
        {
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2419 = _1248 + _2417;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2423 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2421;
            float _2425 = 1.0 / _2423;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2447 = _2419 * _2425;
            float _2449 = precise::clamp(_2447, 0.0, 1.0);
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2455 = fma(_2449, _2429, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2457 = fma(_2449, _2453, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2459 = fma(_2449, _2433, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2461 = fma(_2449, _2437, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2463 = fma(_2449, _2441, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2465 = fma(_2449, _2445, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2375 = _2457;
            _2395 = _2463;
            _2369 = _2455;
            _2389 = _2461;
            _2381 = _2459;
            _2405 = _2465;
            _2467 = true;
        }
        else
        {
            bool _2469 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2471 = isnan(_1248);
            bool _2473 = _2469 || _2471;
            bool _2475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2477 = _2473 || _2475;
            if (!_2477)
            {
                _2367 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2479 = _2367;
            _2369 = _2479;
            if (!_2477)
            {
                _2373 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2481 = _2373;
            _2375 = _2481;
            if (!_2477)
            {
                _2379 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2483 = _2379;
            _2381 = _2483;
            if (!_2477)
            {
                _2387 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2485 = _2387;
            _2389 = _2485;
            if (!_2477)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2487 = _2393;
            _2395 = _2487;
            if (!_2477)
            {
                _2403 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2489 = _2403;
            bool _2491 = !_2477;
            _2405 = _2489;
            if (!_2491)
            {
                bool _2493 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2495 = isnan(_1248);
                bool _2497 = _2493 || _2495;
                bool _2499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2501 = _2497 || _2499;
                if (!_2501)
                {
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2505 = _1248 + _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2509 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2507;
                    float _2511 = 1.0 / _2509;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2523 = _2521 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2533 = _2505 * _2511;
                    float _2535 = precise::clamp(_2533, 0.0, 1.0);
                    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2541 = fma(_2535, _2515, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2543 = fma(_2535, _2539, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2545 = fma(_2535, _2519, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2547 = fma(_2535, _2523, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2549 = fma(_2535, _2527, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2551 = fma(_2535, _2531, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2375 = _2543;
                    _2395 = _2549;
                    _2369 = _2541;
                    _2389 = _2547;
                    _2381 = _2545;
                    _2405 = _2551;
                    _2467 = true;
                }
                else
                {
                    _2375 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2369 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2389 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2381 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2405 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2467 = false;
    float _2553 = _2375;
    float _2555 = _2395;
    float _2557 = _2369;
    float _2559 = _2389;
    float _2561 = _2381;
    float _2563 = _2405;
    float _2565 = fma(_2309, -0.5, 0.5);
    float _2567 = precise::clamp(_2565, 0.0, 1.0);
    float _2569 = -_2553;
    float _2571 = _2569 + _2555;
    float _2573 = _2399 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2575 = -_2557;
    float _2577 = _2575 + _2559;
    out.m_93.x = 0.0;
    float _2579 = fma(_2567, _2571, _2553);
    float _2581 = fma(_2567, _2577, _2557);
    out.m_53.x = _2573;
    float _2583 = -_2561;
    float _2585 = _2583 + _2563;
    float _2587 = _2579 * 0.586610972881317138671875;
    bool _2589 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2591 = fma(_2567, _2585, _2561);
    float _2593 = fma(_2581, 0.298911988735198974609375, _2587);
    bool _2595 = _2225 > 0.0;
    bool _2597 = isnan(_2225);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan(0.0);
    bool _2603 = _2599 || _2601;
    float _2605 = fma(_2591, 0.114477999508380889892578125, _2593);
    bool _2607 = _2287 <= 0.0;
    bool _2609 = !_2603;
    bool _2611 = _2607 || _2609;
    float _2613 = -_2605;
    float _2615 = _2581 + _2613;
    float _2617 = -_2605;
    float _2619 = _2579 + _2617;
    float _2621 = -_2605;
    float _2623 = _2591 + _2621;
    float _2625 = fma(_2615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2605);
    float _2627 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2605);
    float _2629 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2605);
    bool _2631 = !_2589;
    if (!_2631)
    {
        float _2633 = -_1210;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2637 = -_1212;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2641 = -_1214;
        float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2645 = _2635 * _2635;
        float _2647 = fma(_2639, _2639, _2645);
        float _2649 = fma(_2643, _2643, _2647);
        float _2651 = sqrt(_2649);
        float _2653 = rsqrt(_2649);
        float _2655 = -_2651;
        float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2659 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2661 = precise::clamp(_2659, 0.0, 1.0);
        float _2663 = _2639 * _2653;
        float _2665 = _2635 * _2653;
        float _2667 = abs(_2661);
        float _2669 = log2(_2667);
        float _2671 = _2643 * _2653;
        float _2673 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2675 = _2309 * _2665;
        float _2677 = -_2665;
        float _2679 = -_2673;
        float _2681 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2679);
        float _2683 = fma(_2299, _2663, _2675);
        float _2685 = -_2671;
        float _2687 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2681);
        float _2689 = fma(_2321, _2671, _2683);
        float _2691 = precise::clamp(_2689, 0.0, 1.0);
        float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2695 = _2687 + _2693;
        float _2697 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        float _2703 = exp2(_2697);
        float _2705 = _2703 * _2701;
        float _2707 = _2691 * _2705;
        float _2709 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2711 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2713 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2709;
        out.m_93.y = _2711;
        out.m_93.z = _2713;
    }
    out.m_95.x = _2625;
    out.m_95.y = _2627;
    out.m_95.z = _2629;
    if (!_2611)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2715 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2715;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

