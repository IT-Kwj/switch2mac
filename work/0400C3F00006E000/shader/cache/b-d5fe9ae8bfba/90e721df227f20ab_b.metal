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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_79 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_65 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_67 [[attribute(11)]];
    float4 m_53 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1516 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_114);
        out.gl_Position.z = _2011;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _106 = _136;
    }
    float _138 = _106;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2081 = as_type<float>(_152);
        out.gl_Position.z = _2081;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.y;
    float _156 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _158 = log2(_156);
    float _160 = in.m_51.x;
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _166 = _164 != 0;
    float _168 = in.m_51.z;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = _158 * _132;
    float _186 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _188 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _190 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _192 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _194 = exp2(_184);
    float _196 = fma(_190, -2.0, _162);
    float _198 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _200 = _160 * 2.0;
    float _202 = _168 * 2.0;
    float _204 = -_170;
    float _206 = fma(_198, 2.0, _204);
    float _208 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _192);
    float _210 = fma(200.0, _160, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _212 = _172 * 100.0;
    float _214 = floor(_202);
    float _216 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _208);
    float _218 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _220 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[193].z, _210);
    float _222 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _224 = floor(_200);
    float _226 = _154 * 2.0;
    float _228 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _230 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _176);
    float _232 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _234 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _236 = floor(_226);
    float _238 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _232);
    bool _240 = _214 > 0.0;
    float _242 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    bool _244 = _214 >= 0.0;
    bool _246 = isnan(_214);
    bool _248 = _244 || _246;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    float _254 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _238);
    bool _256 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _258 = isnan(1.0);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _264 = _260 || _262;
    float _266 = fma(_160, 6.283185482025146484375, _242);
    bool _268 = _224 > 0.0;
    float _270 = in.m_57.x;
    float _272 = in.m_57.y;
    float _274 = in.m_57.z;
    bool _276 = _224 >= 0.0;
    bool _278 = isnan(_224);
    bool _280 = _276 || _278;
    bool _282 = isnan(0.0);
    bool _284 = _280 || _282;
    float _286 = _266 * 0.15915493667125701904296875;
    int _288 = _252 ? 0 : 1;
    float _290 = in.m_59.x;
    float _292 = in.m_59.y;
    float _294 = in.m_59.z;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _298 = 1.0 + _296;
    float _300 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _234);
    bool _302 = _236 > 0.0;
    float _304 = in.m_61.x;
    float _306 = in.m_61.y;
    float _308 = in.m_61.z;
    bool _310 = _236 >= 0.0;
    bool _312 = isnan(_236);
    bool _314 = _310 || _312;
    bool _316 = isnan(0.0);
    bool _318 = _314 || _316;
    float _320 = _286 * 6.283185482025146484375;
    float _322 = sin(_320);
    int _324 = _284 ? 0 : 1;
    bool _326 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _330 = _326 || _328;
    bool _332 = isnan(1.0);
    bool _334 = _330 || _332;
    int _336 = ~_288;
    int _338 = _336 + 1;
    int _340 = _338 + 1;
    int _342 = _318 ? 0 : 1;
    float _344 = 1.0 / _298;
    int _346 = _340;
    float _348 = _188;
    float _350 = _216;
    float _352 = _174;
    float _354 = _154;
    float _356 = _168;
    if (!_240)
    {
        int _358 = ~_288;
        int _360 = _358 + 1;
        _346 = _360;
    }
    int _362 = _346;
    int _364 = ~_324;
    int _366 = _364 + 1;
    int _368 = _366 + 1;
    int _370 = ~_342;
    int _372 = _370 + 1;
    int _374 = _372 + 1;
    float _376 = _270 * _270;
    int _378 = _368;
    int _380 = _374;
    int _382 = as_type<int>(_270);
    float _384 = _274;
    if (!_268)
    {
        int _386 = ~_324;
        int _388 = _386 + 1;
        _378 = _388;
    }
    int _390 = _378;
    float _392 = rsqrt(_254);
    float _394 = 0.0;
    if (!_334)
    {
        float _396 = _188 * _188;
        float _398 = _396 * 0.5;
        _394 = _398;
    }
    float _400 = _394;
    float _402 = _400;
    if (!_302)
    {
        int _404 = ~_342;
        int _406 = _404 + 1;
        _380 = _406;
    }
    int _408 = _380;
    float _410 = _272 * _272;
    float _412 = fma(_290, _290, _376);
    if (!_334)
    {
        float _414 = _400 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _402 = _414;
    }
    float _416 = _402;
    float _418 = rsqrt(_300);
    bool _420 = !_334;
    float _422 = _416;
    if (!_420)
    {
        float _424 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _426 = log2(_424);
        float _428 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _430 = _428 + 1.0;
        float _432 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _434 = _188 * _426;
        float _436 = 1.0 / _430;
        float _438 = _432 * 0.693147182464599609375;
        float _440 = exp2(_434);
        float _442 = 1.0 / _438;
        float _444 = _440 + (-1.0);
        float _446 = -_444;
        float _448 = fma(_446, _442, _188);
        float _450 = _448 * _436;
        float _452 = _450 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _422 = _452;
    }
    float _454 = _422;
    bool _456 = !_334;
    if (!_456)
    {
        float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = log2(_458);
        float _462 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _464 = _462 + 1.0;
        float _466 = 1.0 / _464;
        float _468 = _188 * _460;
        float _470 = exp2(_468);
        float _472 = -_470;
        float _474 = _472 + 1.0;
        float _476 = _474 * _466;
        _348 = _476;
    }
    float _478 = _348;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = fma(_292, _292, _410);
    float _494 = fma(_304, _304, _412);
    float _496 = float(_362);
    float _498 = in.m_63.x;
    float _500 = in.m_63.y;
    float _502 = in.m_63.z;
    bool _504 = !_482;
    int _506 = _504 ? 0 : 1;
    float _508 = _274 * _274;
    bool _510 = !_486;
    int _512 = _510 ? 0 : 1;
    float _514 = fma(_306, _306, _492);
    bool _516 = !_490;
    int _518 = _516 ? 0 : 1;
    float _520 = fma(_294, _294, _508);
    int _522 = abs(_506);
    float _524 = sqrt(_514);
    int _526 = abs(_512);
    float _528 = fma(_308, _308, _520);
    int _530 = abs(_518);
    float _532 = _174 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _534 = float(_390);
    float _536 = _220 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _538 = sqrt(_494);
    float _540 = in.m_55.w;
    float _542 = float(_408);
    float _544 = -_194;
    float _546 = _544 + 1.0;
    float _548 = float(_522);
    float _550 = _536 * 0.01200000010430812835693359375;
    float _552 = float(_526);
    float _554 = sqrt(_216);
    float _556 = float(_530);
    float _558 = _548 * _496;
    float _560 = _552 * _534;
    float _562 = _558 * (-2.0);
    float _564 = _556 * _542;
    float _566 = _560 * (-2.0);
    bool _568 = _524 > 0.0;
    float _570 = fma(_562, _498, _498);
    float _572 = _154 + _168;
    float _574 = fma(_566, _500, _500);
    float _576 = _160 + _168;
    float _578 = _564 * (-2.0);
    float _580 = _572 + (-1.0);
    float _582 = _576 + (-1.0);
    float _584 = fma(_578, _502, _502);
    float _586 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _588 = _154 + _160;
    float _590 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _592 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _230);
    float _594 = _588 + (-1.0);
    bool _596 = _538 > 0.0;
    float _598 = in.m_65.x;
    float _600 = in.m_65.y;
    float _602 = in.m_65.z;
    float _604 = rsqrt(_216);
    float _606 = _558;
    if (!_166)
    {
        _606 = _168;
    }
    float _608 = _606;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _612 = _608;
    if (_166)
    {
        _612 = _154;
    }
    float _614 = _612;
    float _616 = _550 * 0.15915493667125701904296875;
    float _618 = fma(_590, _578, _590);
    float _620 = sqrt(_528);
    if (!_166)
    {
        _350 = _168;
    }
    float _622 = _350;
    float _624 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[83].w, _610);
    float _626 = _622;
    if (_166)
    {
        _626 = _154;
    }
    float _628 = _626;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_166)
    {
        _352 = _154;
    }
    float _632 = _352;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _636 = _632;
    if (_166)
    {
        _636 = _160;
    }
    float _638 = _636;
    float _640 = _628 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _642 = _536 * 0.20000000298023223876953125;
    float _644 = fma(_640, -2.0, _630);
    float _646 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[83].z, _634);
    float _648 = _638 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _652 = fma(_532, _322, _598);
    float _654 = _536 * 0.100000001490116119384765625;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _658 = _642 * 0.15915493667125701904296875;
    float _660 = -_650;
    float _662 = fma(_648, 2.0, _660);
    float _664 = _654 * 0.15915493667125701904296875;
    float _666 = in.m_49.x;
    float _668 = in.m_49.y;
    float _670 = in.m_49.z;
    bool _672 = _620 > 0.0;
    float _674 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _656);
    float _676 = in.m_44.x;
    float _678 = in.m_44.y;
    float _680 = in.m_44.z;
    bool _682 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _694 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _644);
    float _696 = _454 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _698 = _536 * (-0.100000001490116119384765625);
    float _700 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].w, _692);
    float _702 = _690 ? _546 : 0.0;
    float _704 = _494;
    if (_596)
    {
        float _706 = rsqrt(_494);
        _704 = _706;
    }
    float _708 = _704;
    float _710 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _712 = -_132;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[81].x, _662);
    float _716 = _454 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _718 = _698 * 0.15915493667125701904296875;
    float _720 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _674);
    float _722 = -_132;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _206);
    float _726 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _700);
    float _728 = _658 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _624);
    float _734 = _454 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _736 = _536 * 0.02300000004470348358154296875;
    float _738 = fma(_478, _668, _696);
    float _740 = _668;
    float _742 = _670;
    if (!_596)
    {
        _740 = 0.0;
    }
    float _744 = _740;
    float _746 = fma(_478, _670, _734);
    float _748 = _736 * 0.15915493667125701904296875;
    float _750 = _658 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = fma(_738, _540, _678);
    float _756 = _744;
    if (_596)
    {
        float _758 = _708 * _290;
        _756 = _758;
    }
    float _760 = _756;
    if (!_596)
    {
        _742 = 0.0;
    }
    float _762 = _742;
    float _764 = _762;
    if (_596)
    {
        float _766 = _708 * _304;
        _764 = _766;
    }
    float _768 = _764;
    float _770 = _754 * _292;
    float _772 = fma(_710, _562, _710);
    float _774 = _664 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _196);
    float _780 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _646);
    if (_264)
    {
        float _782 = _702 * _344;
        _134 = _782;
    }
    float _784 = _134;
    float _786 = fma(_478, _666, _716);
    float _788 = _754 * _272;
    float _790 = fma(_746, _540, _680);
    float _792 = _754 * _306;
    float _794 = fma(_786, _540, _676);
    float _796 = _514;
    if (_568)
    {
        float _798 = rsqrt(_514);
        _796 = _798;
    }
    float _800 = _796;
    float _802 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _804 = _222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = fma(_794, _270, _788);
    float _808 = fma(_794, _290, _770);
    float _810 = fma(_794, _304, _792);
    float _812 = _228 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _814 = fma(_790, _274, _806);
    float _816 = fma(_790, _294, _808);
    float _818 = _776 * 2.0;
    float _820 = _748 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = _814 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _826 = fma(_790, _308, _810);
    float _828 = _816 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _830 = _818 * 0.15915493667125701904296875;
    float _832 = _818;
    float _834 = _824;
    if (!_568)
    {
        _832 = 0.0;
    }
    float _836 = _832;
    float _838 = _592 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _840 = _836;
    if (_568)
    {
        float _842 = _800 * _292;
        _840 = _842;
    }
    float _844 = _840;
    float _846 = _748 * 6.283185482025146484375;
    float _848 = cos(_846);
    float _850 = _826 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _854 = _828 + _852;
    float _856 = -_838;
    float _858 = precise::max(_856, 2.0);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _862 = _850 + _860;
    float _864 = precise::min(_858, 5.0);
    float _866 = _718 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _872 = _824 + _870;
    float _874 = _858;
    if (!_672)
    {
        _874 = 0.0;
    }
    float _876 = _874;
    float _878 = fma(_864, 0.2000000178813934326171875, -2.98023223876953125e-08);
    float _880 = _872 * _872;
    float _882 = _616 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = _652 * _878;
    float _888 = _878 * _602;
    float _890 = _878 * _600;
    float _892 = _886 * _730;
    float _894 = _886 * _752;
    float _896 = _616 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = -_892;
    float _902 = fma(_888, _752, _900);
    float _904 = fma(_888, _730, _894);
    float _906 = _528;
    float _908 = _880;
    float _910 = _876;
    if (_672)
    {
        float _912 = rsqrt(_528);
        _906 = _912;
    }
    float _914 = _906;
    float _916 = fma(_854, _854, _880);
    if (!_568)
    {
        _908 = 0.0;
    }
    float _918 = _908;
    float _920 = _918;
    if (_568)
    {
        float _922 = _800 * _306;
        _920 = _922;
    }
    float _924 = _920;
    float _926 = fma(_862, _862, _916);
    float _928 = _868 * 2.0;
    float _930 = _868 * 0.60000002384185791015625;
    float _932 = _830 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _928 * 0.15915493667125701904296875;
    float _938 = rsqrt(_926);
    if (_672)
    {
        float _940 = _914 * _294;
        _910 = _940;
    }
    float _942 = _910;
    float _944 = _830 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = _902 * _934;
    float _950 = _936 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = _160 + (-0.5);
    float _956 = _872 * _938;
    float _958 = _854 * _938;
    float _960 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].x, _570);
    float _962 = -_956;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _966 = -_958;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _970 = fma(_772, _784, _960);
    float _972 = _902 * _946;
    float _974 = _936 * 6.283185482025146484375;
    float _976 = cos(_974);
    float _978 = -_948;
    float _980 = fma(_890, _946, _978);
    float _982 = _964 * _964;
    float _984 = _862 * _938;
    float _986 = fma(_586, _566, _586);
    float _988 = _154 + (-0.5);
    float _990 = fma(_968, _968, _982);
    float _992 = -_984;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _996 = fma(_890, _934, _972);
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].y, _574);
    float _1000 = _904 * _952;
    float _1002 = fma(_994, _994, _990);
    float _1004 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[193].y, _980);
    float _1006 = fma(_986, _784, _998);
    float _1008 = _970 * 0.15915493667125701904296875;
    float _1010 = _904 * _976;
    float _1012 = _168 + (-0.5);
    float _1014 = _1008 * 6.283185482025146484375;
    float _1016 = sin(_1014);
    float _1018 = fma(_996, _952, _1010);
    float _1020 = -_1000;
    float _1022 = fma(_996, _976, _1020);
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[196].z, _584);
    float _1026 = _1006 * 0.15915493667125701904296875;
    float _1028 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[193].y, _1018);
    float _1030 = _1022 * _884;
    float _1032 = sqrt(_1002);
    float _1034 = _1022 * _898;
    float _1036 = fma(_618, _784, _1024);
    float _1038 = -_1030;
    float _1040 = fma(_1004, _898, _1038);
    float _1042 = _1028 * _822;
    float _1044 = fma(_1004, _884, _1034);
    float _1046 = _1028 * _848;
    float _1048 = _1040 * _392;
    float _1050 = _1036 * 0.15915493667125701904296875;
    float _1052 = -_1042;
    float _1054 = fma(_1044, _848, _1052);
    float _1056 = fma(_1044, _822, _1046);
    float _1058 = _1008 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = _1054 * _418;
    float _1064 = _554 * _1048;
    float _1066 = _1056 * _604;
    float _1068 = _938 * _1032;
    float _1070 = _1026 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = _554 * _1066;
    float _1076 = _802 * _1068;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1064);
    float _1080 = _804 * _1068;
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1074);
    float _1084 = _812 * _1068;
    float _1086 = _1076 * _1078;
    float _1088 = _1026 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = _1080 * _1082;
    float _1094 = _554 * _1062;
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1094);
    float _1098 = _1050 * 6.283185482025146484375;
    float _1100 = cos(_1098);
    float _1102 = _1016 * _1072;
    float _1104 = _1060 * _1072;
    float _1106 = _1084 * _1096;
    float _1108 = in.m_51.w;
    float _1110 = _1050 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = _1060 * _1090;
    float _1116 = _1016 * _1090;
    float _1118 = _1100 * _1086;
    float _1120 = _1072 * _1100;
    float _1122 = _1090 * _1100;
    float _1124 = _1060 * _1118;
    float _1126 = fma(_1112, _1114, _1102);
    float _1128 = -_1104;
    float _1130 = fma(_1112, _1116, _1128);
    float _1132 = -_1116;
    float _1134 = fma(_1112, _1104, _1132);
    float _1136 = -_1086;
    float _1138 = _1112 * _1136;
    float _1140 = fma(_1126, _1092, _1124);
    float _1142 = fma(_1112, _1102, _1114);
    float _1144 = _1016 * _1118;
    float _1146 = fma(_1122, _1092, _1138);
    float _1148 = fma(_1134, _1106, _1140);
    float _1150 = in.m_67.y;
    float _1152 = fma(_1130, _1092, _1144);
    float _1154 = fma(_1120, _1106, _1146);
    float _1156 = _1148 * _844;
    float _1158 = _1148 * _924;
    float _1160 = _1138;
    if (!_672)
    {
        _1160 = 0.0;
    }
    float _1162 = _1160;
    float _1164 = _1162;
    if (_672)
    {
        float _1166 = _914 * _308;
        _1164 = _1166;
    }
    float _1168 = _1164;
    float _1170 = fma(_1142, _1106, _1152);
    float _1172 = fma(_1154, _760, _1156);
    float _1174 = fma(_1154, _768, _1158);
    bool _1176 = _1108 > 0.5;
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1180 = fma(_1170, _942, _1172);
    float _1182 = fma(_1170, _1168, _1174);
    float _1184 = _828 + _1180;
    float _1186 = _850 + _1182;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1190 = _1188 != 0;
    float _1192 = in.m_67.x;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1196 = _1184 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1200 = _1186 + _1198;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1204 = _1202 != 0;
    float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1208 = _1196 * _1196;
    float _1210 = _1200 * _1200;
    float _1212 = -_1150;
    float _1214 = _1212 + 1.0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1218 = _1216 != 0;
    float _1220 = _1208 + _1210;
    int _1222 = _1176 ? as_type<int>(_1214) : as_type<int>(_1150);
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1226 = _1224 != 0;
    float _1228 = sqrt(_1220);
    float _1230 = _1204 ? as_type<float>(_1222) : _1150;
    bool _1232 = _154 > 0.5;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1236 = _1150;
    bool _1238 = _1190;
    bool _1240 = _1232;
    int _1242 = as_type<int>(_1206);
    float _1244 = _1214;
    if (!_568)
    {
        _1234 = 0.0;
    }
    float _1246 = _1234;
    float _1248 = _1246;
    if (_568)
    {
        float _1250 = _800 * _272;
        _1248 = _1250;
    }
    float _1252 = _1248;
    if (_1190)
    {
        float _1254 = _1232 ? _1214 : _1150;
        _1236 = _1254;
    }
    float _1256 = _1236;
    float _1258 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1260 = _1258;
    float _1262 = _1256;
    if (!_672)
    {
        _354 = 0.0;
    }
    float _1264 = _354;
    float _1266 = _1148 * _1252;
    float _1268 = _1264;
    if (_672)
    {
        float _1270 = _914 * _274;
        _1268 = _1270;
    }
    float _1272 = _1268;
    if (_1226)
    {
        bool _1274 = _168 > 0.5;
        _1238 = _1274;
    }
    bool _1276 = _1238;
    float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_596)
    {
        _356 = 0.0;
    }
    float _1280 = _356;
    float _1282 = _1280;
    if (_596)
    {
        float _1284 = _708 * _270;
        _1282 = _1284;
    }
    float _1286 = _1282;
    bool _1288 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1290 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1218)
    {
        float _1292 = -_1192;
        float _1294 = _1292 + 1.0;
        _382 = as_type<int>(_1294);
    }
    int _1296 = _382;
    float _1298 = fma(_1154, _1286, _1266);
    float _1300 = as_type<float>(_1296);
    if (_1218)
    {
        bool _1302 = _160 > 0.5;
        _1240 = _1302;
    }
    bool _1304 = _1240;
    float _1306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1226)
    {
        float _1308 = -_1192;
        float _1310 = _1308 + 1.0;
        _1242 = as_type<int>(_1310);
    }
    int _1312 = _1242;
    float _1314 = fma(_1170, _1272, _1298);
    float _1316 = _1314;
    if (!_1218)
    {
        _1244 = _1192;
    }
    float _1318 = _1244;
    float _1320 = fma(_1230, _1258, -0.5);
    float _1322 = _1318;
    if (!_1226)
    {
        _384 = _1192;
    }
    float _1324 = _384;
    float _1326 = _824 + _1314;
    float _1328 = fma(_1290, _1256, -0.5);
    float _1330 = _1324;
    if (_1218)
    {
        float _1332 = _1304 ? as_type<float>(_1296) : _1192;
        _1322 = _1332;
    }
    float _1334 = _1322;
    if (_1226)
    {
        float _1336 = _1276 ? as_type<float>(_1312) : _1192;
        _1330 = _1336;
    }
    float _1338 = _1330;
    if (!_1288)
    {
        _1260 = _1210;
    }
    float _1340 = _1260;
    float _1342 = _1340;
    if (!_1288)
    {
        _1300 = _1208;
    }
    float _1344 = _1300;
    float _1346 = _1344;
    if (!_1288)
    {
        _834 = _1184;
    }
    float _1348 = _834;
    float _1350 = _1348;
    if (!_1288)
    {
        _1262 = _1186;
    }
    float _1352 = _1262;
    float _1354 = _1352;
    if (!_1288)
    {
        _1316 = _1326;
    }
    float _1356 = _1316;
    bool _1358 = !_1288;
    float _1360 = _1356;
    if (!_1358)
    {
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1366 = _1228 + _1364;
        float _1368 = rsqrt(_1220);
        float _1370 = _1366 * _1362;
        float _1372 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = _1370 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        float _1380 = _1374 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = fma(_1378, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1386 = _1368 * _1384;
        float _1388 = _1382 + (-1.0);
        float _1390 = fma(_1196, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1392 = fma(_1200, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1394 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1398 = _1390 + _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1402 = _1392 + _1400;
        float _1404 = fma(_1326, _1382, _1394);
        float _1406 = _1398 * _1398;
        float _1408 = _1402 * _1402;
        _1360 = _1404;
        _1346 = _1406;
        _1342 = _1408;
        _1350 = _1390;
        _1354 = _1392;
    }
    float _1410 = _1360;
    float _1412 = _1346;
    float _1414 = _1342;
    float _1416 = _1350;
    float _1418 = _1354;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1422 = _1410 + _1420;
    float _1424 = in.m_53.w;
    float _1426 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1428 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1430 = fma(_1422, _1422, _1412);
    float _1432 = fma(_1426, _1334, -0.5);
    float _1434 = fma(_1428, _1338, -0.5);
    float _1436 = _1430 + _1414;
    float _1438 = -_778;
    float _1440 = fma(_726, _1328, _1438);
    float _1442 = -_694;
    float _1444 = fma(_732, _1320, _1442);
    float _1446 = fma(_720, _1432, _724);
    float _1448 = fma(_780, _1434, _714);
    float _1450 = sqrt(_1436);
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1456 = _1440 + 0.5;
    float _1458 = _1444 + 0.5;
    float _1460 = _1446 + 0.5;
    float _1462 = _1448 + 0.5;
    out.m_69.w = _1452;
    out.m_71.w = _1454;
    out.m_73.w = _1424;
    bool _1464 = _1450 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1466 = isnan(_1450);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1472 = _1468 || _1470;
    out.m_75.x = _1460;
    out.m_75.y = _1456;
    out.m_75.z = _1462;
    out.m_75.w = _1458;
    float _1474 = _1446;
    float _1476 = _1414;
    float _1478 = _1450;
    float _1480 = _1444;
    if (!_1472)
    {
        _1474 = 1.0;
    }
    float _1482 = _1474;
    bool _1484 = !_1472;
    float _1486 = _1482;
    if (!_1484)
    {
        bool _1488 = _1450 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1490 = isnan(_1450);
        bool _1492 = _1488 || _1490;
        bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1496 = _1492 || _1494;
        if (!_1496)
        {
            float _1498 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1500 = _1450 + _1498;
            float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1504 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1502;
            float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1508 = _1506 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1510 = 1.0 / _1504;
            float _1512 = _1500 * _1510;
            float _1514 = fma(_1512, _1508, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1486 = _1514;
            _1476 = _1510;
            _1516 = true;
        }
        else
        {
            bool _1518 = _1450 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1520 = isnan(_1450);
            bool _1522 = _1518 || _1520;
            bool _1524 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1526 = _1522 || _1524;
            if (!_1526)
            {
                float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1530 = _1450 + _1528;
                float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1534 = _1532 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1538 = _1536 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1540 = 1.0 / _1534;
                float _1542 = _1530 * _1540;
                float _1544 = fma(_1542, _1538, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1486 = _1544;
                _1476 = _1540;
                _1516 = true;
            }
            else
            {
                _1486 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1516 = false;
    float _1546 = _1486;
    float _1548 = _1476;
    float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1552 = _1410 + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1556 = _1416 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1560 = _1418 + _1558;
    float _1562 = fma(_1552, _1546, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1564 = fma(_1556, _1546, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1566 = fma(_1560, _1546, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1568 = -_956;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1572 = -_958;
    float _1574 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1576 = -_984;
    float _1578 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1570 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1574 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1578 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1590;
    float _1622 = _1610;
    float _1624 = _1618;
    float _1626 = _1548;
    float _1628 = _1602;
    if (_1614)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1630;
    }
    float _1632 = _1620;
    if (_1614)
    {
        float _1634 = rsqrt(_1610);
        _1622 = _1634;
    }
    float _1636 = _1622;
    float _1638 = _1636;
    if (_1614)
    {
        float _1640 = _1618 * _1632;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1614)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1478 = _1644;
    }
    float _1646 = _1478;
    float _1648 = _1598;
    if (_1614)
    {
        float _1650 = _1646 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1278;
    float _1662 = _1658;
    float _1664 = _1656;
    if (_1614)
    {
        float _1666 = _1646 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1660 = _1668;
    }
    float _1670 = _1660;
    float _1672 = -_1600;
    float _1674 = -_1658;
    float _1676 = fma(_1582, _1672, _1674);
    if (_1614)
    {
        float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1678;
    }
    float _1680 = _1662;
    float _1682 = sqrt(_1596);
    float _1684 = _1654;
    float _1686 = _1680;
    if (_1614)
    {
        float _1688 = fma(_1654, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (!_1614)
    {
        _1686 = _1604;
    }
    float _1694 = _1686;
    float _1696 = _1694;
    if (_1614)
    {
        float _1698 = _1670 + (-1.0);
        _1664 = _1698;
    }
    float _1700 = _1664;
    float _1702 = _1700;
    if (_1614)
    {
        float _1704 = _1636 * _1690;
        _1480 = _1704;
    }
    float _1706 = _1480;
    if (!_1614)
    {
        _1692 = _1676;
    }
    float _1708 = _1692;
    float _1710 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1712 = _1708;
    if (_1614)
    {
        float _1714 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1714;
    }
    float _1716 = _1626;
    if (_1614)
    {
        float _1718 = _1602 * _1706;
        _1628 = _1718;
    }
    float _1720 = _1628;
    if (!_1614)
    {
        _1638 = _1606;
    }
    float _1722 = _1638;
    float _1724 = _1722;
    if (_1614)
    {
        float _1726 = _1604 * _1706;
        _1696 = _1726;
    }
    float _1728 = _1696;
    if (_1614)
    {
        float _1730 = fma(_1676, _1670, _1716);
        _1712 = _1730;
    }
    float _1732 = _1712;
    if (_1614)
    {
        float _1734 = _1720 * _1720;
        _1724 = _1734;
    }
    float _1736 = _1724;
    if (!_1614)
    {
        _1702 = _1608;
    }
    float _1738 = _1702;
    float _1740 = _1738;
    if (_1614)
    {
        float _1742 = _1728 * _1728;
        _1740 = _1742;
    }
    float _1744 = _1740;
    float _1746 = fma(_1732, _1732, _1736);
    float _1748 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1710);
    float _1750 = _1746 + _1744;
    float _1752 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1756 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1754);
    float _1758 = precise::clamp(_1756, 0.0, 1.0);
    float _1760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1762 = rsqrt(_1750);
    float _1764 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1752);
    float _1766 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1768 = -_1758;
    float _1770 = _1768 + 1.0;
    float _1772 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1764);
    float _1776 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1766);
    float _1778 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1780 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1772);
    float _1782 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1784 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1776);
    float _1786 = abs(_1770);
    float _1788 = log2(_1786);
    float _1790 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1780);
    float _1792 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1794 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1796 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1798 = _1762 * _1720;
    float _1800 = -_1792;
    float _1802 = fma(_1800, _1760, 1.0);
    float _1804 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1806 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1808 = _1762 * _1732;
    float _1810 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1812 = _1762 * _1728;
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1806);
    float _1816 = log2(_1802);
    float _1818 = -_1810;
    float _1820 = fma(_1808, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1818);
    float _1822 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1824 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1826 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1814);
    float _1828 = -_1812;
    float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1820);
    float _1832 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1834 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1822);
    float _1836 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1826);
    float _1838 = exp2(_1824);
    float _1840 = fma(_1830, -0.5, 0.5);
    float _1842 = fma(_1830, 0.5, 0.5);
    float _1844 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1832);
    float _1846 = _1808 + 1.0;
    float _1848 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1834);
    float _1850 = fma(_1842, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1852 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1844);
    float _1854 = 1.0 / _1836;
    float _1856 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1848);
    float _1858 = fma(_1842, _1850, -0.212114393711090087890625);
    float _1860 = fma(_1842, _1858, 1.570728778839111328125);
    float _1862 = sqrt(_1840);
    float _1864 = -_1808;
    float _1866 = fma(_1838, _1846, _1864);
    float _1868 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1852);
    float _1870 = _1816 * 0.693147182464599609375;
    float _1872 = fma(_1866, 0.5, 0.5);
    float _1874 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1876 = _1868 * _1854;
    float _1878 = _1856 * _1854;
    float _1880 = fma(_1876, 0.5, 0.5);
    float _1882 = fma(_1878, -0.5, 0.5);
    float _1884 = _1862 * 0.636619746685028076171875;
    float3 _4808 = float3(_1880, _1882, _1874);
    float _1886 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4808, float3(0.0), isnan(_4808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4808, float3(0.0), isnan(_4808)), level(0.0)).x;
    float _1888 = -_1860;
    float _1890 = fma(_1884, _1888, 1.0);
    float3 _4824 = float3(_1880, _1882, _1874);
    float4 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4824, float3(0.0), isnan(_4824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4824, float3(0.0), isnan(_4824)), level(0.0)).xyzw;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _1893.w;
    float2 _4841 = float2(_1890, _1872);
    float3 _1905 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4841, float2(0.0), isnan(_4841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4841, float2(0.0), isnan(_4841)), level(0.0)).xyz;
    float _1907 = _1905.x;
    float _1909 = _1905.y;
    float _1911 = _1905.z;
    float _1913 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1915 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1917 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1915);
    float _1919 = exp2(_1913);
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1923 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1917);
    out.m_47.x = _1921;
    float _1925 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1923);
    float _1927 = _1925 + _1836;
    out.gl_Position.x = _1868;
    out.gl_Position.y = _1856;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1836;
    float _1929 = _1927 * 0.5;
    float _1931 = -_1919;
    float _1933 = _1931 + 1.0;
    float _1935 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1929;
    out.m_77.w = _1836;
    float _1937 = -_1935;
    float _1939 = _1937 + 1.0;
    float _1941 = _1935 * _1886;
    float _1943 = _1901 * _1941;
    float _1945 = _1901 * _1939;
    float _1947 = _1911 * _1941;
    float _1949 = fma(_1907, _1943, _1895);
    float _1951 = fma(_1909, _1943, _1897);
    float _1953 = fma(_1901, _1947, _1899);
    out.m_79.x = _1949;
    out.m_79.y = _1951;
    out.m_79.z = _1953;
    out.m_79.w = _1945;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1516 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_114);
        out.gl_Position.z = _2011;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _106 = _136;
    }
    float _138 = _106;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2081 = as_type<float>(_152);
        out.gl_Position.z = _2081;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_51.y;
    float _156 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _158 = log2(_156);
    float _160 = in.m_51.x;
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _166 = _164 != 0;
    float _168 = in.m_51.z;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = _158 * _132;
    float _186 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _188 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _190 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _192 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _194 = exp2(_184);
    float _196 = fma(_190, -2.0, _162);
    float _198 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _200 = _160 * 2.0;
    float _202 = _168 * 2.0;
    float _204 = -_170;
    float _206 = fma(_198, 2.0, _204);
    float _208 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _192);
    float _210 = fma(200.0, _160, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _212 = _172 * 100.0;
    float _214 = floor(_202);
    float _216 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _208);
    float _218 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _220 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[193].z, _210);
    float _222 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _224 = floor(_200);
    float _226 = _154 * 2.0;
    float _228 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _230 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _176);
    float _232 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _234 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _236 = floor(_226);
    float _238 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _232);
    bool _240 = _214 > 0.0;
    float _242 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    bool _244 = _214 >= 0.0;
    bool _246 = isnan(_214);
    bool _248 = _244 || _246;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    float _254 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _238);
    bool _256 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _258 = isnan(1.0);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _264 = _260 || _262;
    float _266 = fma(_160, 6.283185482025146484375, _242);
    bool _268 = _224 > 0.0;
    float _270 = in.m_57.x;
    float _272 = in.m_57.y;
    float _274 = in.m_57.z;
    bool _276 = _224 >= 0.0;
    bool _278 = isnan(_224);
    bool _280 = _276 || _278;
    bool _282 = isnan(0.0);
    bool _284 = _280 || _282;
    float _286 = _266 * 0.15915493667125701904296875;
    int _288 = _252 ? 0 : 1;
    float _290 = in.m_59.x;
    float _292 = in.m_59.y;
    float _294 = in.m_59.z;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _298 = 1.0 + _296;
    float _300 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _234);
    bool _302 = _236 > 0.0;
    float _304 = in.m_61.x;
    float _306 = in.m_61.y;
    float _308 = in.m_61.z;
    bool _310 = _236 >= 0.0;
    bool _312 = isnan(_236);
    bool _314 = _310 || _312;
    bool _316 = isnan(0.0);
    bool _318 = _314 || _316;
    float _320 = _286 * 6.283185482025146484375;
    float _322 = sin(_320);
    int _324 = _284 ? 0 : 1;
    bool _326 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _330 = _326 || _328;
    bool _332 = isnan(1.0);
    bool _334 = _330 || _332;
    int _336 = ~_288;
    int _338 = _336 + 1;
    int _340 = _338 + 1;
    int _342 = _318 ? 0 : 1;
    float _344 = 1.0 / _298;
    int _346 = _340;
    float _348 = _188;
    float _350 = _216;
    float _352 = _174;
    float _354 = _154;
    float _356 = _168;
    if (!_240)
    {
        int _358 = ~_288;
        int _360 = _358 + 1;
        _346 = _360;
    }
    int _362 = _346;
    int _364 = ~_324;
    int _366 = _364 + 1;
    int _368 = _366 + 1;
    int _370 = ~_342;
    int _372 = _370 + 1;
    int _374 = _372 + 1;
    float _376 = _270 * _270;
    int _378 = _368;
    int _380 = _374;
    int _382 = as_type<int>(_270);
    float _384 = _274;
    if (!_268)
    {
        int _386 = ~_324;
        int _388 = _386 + 1;
        _378 = _388;
    }
    int _390 = _378;
    float _392 = rsqrt(_254);
    float _394 = 0.0;
    if (!_334)
    {
        float _396 = _188 * _188;
        float _398 = _396 * 0.5;
        _394 = _398;
    }
    float _400 = _394;
    float _402 = _400;
    if (!_302)
    {
        int _404 = ~_342;
        int _406 = _404 + 1;
        _380 = _406;
    }
    int _408 = _380;
    float _410 = _272 * _272;
    float _412 = fma(_290, _290, _376);
    if (!_334)
    {
        float _414 = _400 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _402 = _414;
    }
    float _416 = _402;
    float _418 = rsqrt(_300);
    bool _420 = !_334;
    float _422 = _416;
    if (!_420)
    {
        float _424 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _426 = log2(_424);
        float _428 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _430 = _428 + 1.0;
        float _432 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _434 = _188 * _426;
        float _436 = 1.0 / _430;
        float _438 = _432 * 0.693147182464599609375;
        float _440 = exp2(_434);
        float _442 = 1.0 / _438;
        float _444 = _440 + (-1.0);
        float _446 = -_444;
        float _448 = fma(_446, _442, _188);
        float _450 = _448 * _436;
        float _452 = _450 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _422 = _452;
    }
    float _454 = _422;
    bool _456 = !_334;
    if (!_456)
    {
        float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = log2(_458);
        float _462 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _464 = _462 + 1.0;
        float _466 = 1.0 / _464;
        float _468 = _188 * _460;
        float _470 = exp2(_468);
        float _472 = -_470;
        float _474 = _472 + 1.0;
        float _476 = _474 * _466;
        _348 = _476;
    }
    float _478 = _348;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = fma(_292, _292, _410);
    float _494 = fma(_304, _304, _412);
    float _496 = float(_362);
    float _498 = in.m_63.x;
    float _500 = in.m_63.y;
    float _502 = in.m_63.z;
    bool _504 = !_482;
    int _506 = _504 ? 0 : 1;
    float _508 = _274 * _274;
    bool _510 = !_486;
    int _512 = _510 ? 0 : 1;
    float _514 = fma(_306, _306, _492);
    bool _516 = !_490;
    int _518 = _516 ? 0 : 1;
    float _520 = fma(_294, _294, _508);
    int _522 = abs(_506);
    float _524 = sqrt(_514);
    int _526 = abs(_512);
    float _528 = fma(_308, _308, _520);
    int _530 = abs(_518);
    float _532 = _174 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _534 = float(_390);
    float _536 = _220 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _538 = sqrt(_494);
    float _540 = in.m_55.w;
    float _542 = float(_408);
    float _544 = -_194;
    float _546 = _544 + 1.0;
    float _548 = float(_522);
    float _550 = _536 * 0.01200000010430812835693359375;
    float _552 = float(_526);
    float _554 = sqrt(_216);
    float _556 = float(_530);
    float _558 = _548 * _496;
    float _560 = _552 * _534;
    float _562 = _558 * (-2.0);
    float _564 = _556 * _542;
    float _566 = _560 * (-2.0);
    bool _568 = _524 > 0.0;
    float _570 = fma(_562, _498, _498);
    float _572 = _154 + _168;
    float _574 = fma(_566, _500, _500);
    float _576 = _160 + _168;
    float _578 = _564 * (-2.0);
    float _580 = _572 + (-1.0);
    float _582 = _576 + (-1.0);
    float _584 = fma(_578, _502, _502);
    float _586 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _588 = _154 + _160;
    float _590 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _592 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _230);
    float _594 = _588 + (-1.0);
    bool _596 = _538 > 0.0;
    float _598 = in.m_65.x;
    float _600 = in.m_65.y;
    float _602 = in.m_65.z;
    float _604 = rsqrt(_216);
    float _606 = _558;
    if (!_166)
    {
        _606 = _168;
    }
    float _608 = _606;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _612 = _608;
    if (_166)
    {
        _612 = _154;
    }
    float _614 = _612;
    float _616 = _550 * 0.15915493667125701904296875;
    float _618 = fma(_590, _578, _590);
    float _620 = sqrt(_528);
    if (!_166)
    {
        _350 = _168;
    }
    float _622 = _350;
    float _624 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[83].w, _610);
    float _626 = _622;
    if (_166)
    {
        _626 = _154;
    }
    float _628 = _626;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_166)
    {
        _352 = _154;
    }
    float _632 = _352;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _636 = _632;
    if (_166)
    {
        _636 = _160;
    }
    float _638 = _636;
    float _640 = _628 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _642 = _536 * 0.20000000298023223876953125;
    float _644 = fma(_640, -2.0, _630);
    float _646 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[83].z, _634);
    float _648 = _638 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _652 = fma(_532, _322, _598);
    float _654 = _536 * 0.100000001490116119384765625;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _658 = _642 * 0.15915493667125701904296875;
    float _660 = -_650;
    float _662 = fma(_648, 2.0, _660);
    float _664 = _654 * 0.15915493667125701904296875;
    float _666 = in.m_49.x;
    float _668 = in.m_49.y;
    float _670 = in.m_49.z;
    bool _672 = _620 > 0.0;
    float _674 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _656);
    float _676 = in.m_44.x;
    float _678 = in.m_44.y;
    float _680 = in.m_44.z;
    bool _682 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _694 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _644);
    float _696 = _454 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _698 = _536 * (-0.100000001490116119384765625);
    float _700 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].w, _692);
    float _702 = _690 ? _546 : 0.0;
    float _704 = _494;
    if (_596)
    {
        float _706 = rsqrt(_494);
        _704 = _706;
    }
    float _708 = _704;
    float _710 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _712 = -_132;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[81].x, _662);
    float _716 = _454 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _718 = _698 * 0.15915493667125701904296875;
    float _720 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _674);
    float _722 = -_132;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _206);
    float _726 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _700);
    float _728 = _658 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _624);
    float _734 = _454 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _736 = _536 * 0.02300000004470348358154296875;
    float _738 = fma(_478, _668, _696);
    float _740 = _668;
    float _742 = _670;
    if (!_596)
    {
        _740 = 0.0;
    }
    float _744 = _740;
    float _746 = fma(_478, _670, _734);
    float _748 = _736 * 0.15915493667125701904296875;
    float _750 = _658 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = fma(_738, _540, _678);
    float _756 = _744;
    if (_596)
    {
        float _758 = _708 * _290;
        _756 = _758;
    }
    float _760 = _756;
    if (!_596)
    {
        _742 = 0.0;
    }
    float _762 = _742;
    float _764 = _762;
    if (_596)
    {
        float _766 = _708 * _304;
        _764 = _766;
    }
    float _768 = _764;
    float _770 = _754 * _292;
    float _772 = fma(_710, _562, _710);
    float _774 = _664 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _196);
    float _780 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _646);
    if (_264)
    {
        float _782 = _702 * _344;
        _134 = _782;
    }
    float _784 = _134;
    float _786 = fma(_478, _666, _716);
    float _788 = _754 * _272;
    float _790 = fma(_746, _540, _680);
    float _792 = _754 * _306;
    float _794 = fma(_786, _540, _676);
    float _796 = _514;
    if (_568)
    {
        float _798 = rsqrt(_514);
        _796 = _798;
    }
    float _800 = _796;
    float _802 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _804 = _222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = fma(_794, _270, _788);
    float _808 = fma(_794, _290, _770);
    float _810 = fma(_794, _304, _792);
    float _812 = _228 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _814 = fma(_790, _274, _806);
    float _816 = fma(_790, _294, _808);
    float _818 = _776 * 2.0;
    float _820 = _748 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = _814 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _826 = fma(_790, _308, _810);
    float _828 = _816 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _830 = _818 * 0.15915493667125701904296875;
    float _832 = _818;
    float _834 = _824;
    if (!_568)
    {
        _832 = 0.0;
    }
    float _836 = _832;
    float _838 = _592 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _840 = _836;
    if (_568)
    {
        float _842 = _800 * _292;
        _840 = _842;
    }
    float _844 = _840;
    float _846 = _748 * 6.283185482025146484375;
    float _848 = cos(_846);
    float _850 = _826 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _854 = _828 + _852;
    float _856 = -_838;
    float _858 = precise::max(_856, 2.0);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _862 = _850 + _860;
    float _864 = precise::min(_858, 5.0);
    float _866 = _718 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _872 = _824 + _870;
    float _874 = _858;
    if (!_672)
    {
        _874 = 0.0;
    }
    float _876 = _874;
    float _878 = fma(_864, 0.2000000178813934326171875, -2.98023223876953125e-08);
    float _880 = _872 * _872;
    float _882 = _616 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = _652 * _878;
    float _888 = _878 * _602;
    float _890 = _878 * _600;
    float _892 = _886 * _730;
    float _894 = _886 * _752;
    float _896 = _616 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = -_892;
    float _902 = fma(_888, _752, _900);
    float _904 = fma(_888, _730, _894);
    float _906 = _528;
    float _908 = _880;
    float _910 = _876;
    if (_672)
    {
        float _912 = rsqrt(_528);
        _906 = _912;
    }
    float _914 = _906;
    float _916 = fma(_854, _854, _880);
    if (!_568)
    {
        _908 = 0.0;
    }
    float _918 = _908;
    float _920 = _918;
    if (_568)
    {
        float _922 = _800 * _306;
        _920 = _922;
    }
    float _924 = _920;
    float _926 = fma(_862, _862, _916);
    float _928 = _868 * 2.0;
    float _930 = _868 * 0.60000002384185791015625;
    float _932 = _830 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _928 * 0.15915493667125701904296875;
    float _938 = rsqrt(_926);
    if (_672)
    {
        float _940 = _914 * _294;
        _910 = _940;
    }
    float _942 = _910;
    float _944 = _830 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = _902 * _934;
    float _950 = _936 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = _160 + (-0.5);
    float _956 = _872 * _938;
    float _958 = _854 * _938;
    float _960 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].x, _570);
    float _962 = -_956;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _966 = -_958;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _970 = fma(_772, _784, _960);
    float _972 = _902 * _946;
    float _974 = _936 * 6.283185482025146484375;
    float _976 = cos(_974);
    float _978 = -_948;
    float _980 = fma(_890, _946, _978);
    float _982 = _964 * _964;
    float _984 = _862 * _938;
    float _986 = fma(_586, _566, _586);
    float _988 = _154 + (-0.5);
    float _990 = fma(_968, _968, _982);
    float _992 = -_984;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _996 = fma(_890, _934, _972);
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].y, _574);
    float _1000 = _904 * _952;
    float _1002 = fma(_994, _994, _990);
    float _1004 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[193].y, _980);
    float _1006 = fma(_986, _784, _998);
    float _1008 = _970 * 0.15915493667125701904296875;
    float _1010 = _904 * _976;
    float _1012 = _168 + (-0.5);
    float _1014 = _1008 * 6.283185482025146484375;
    float _1016 = sin(_1014);
    float _1018 = fma(_996, _952, _1010);
    float _1020 = -_1000;
    float _1022 = fma(_996, _976, _1020);
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[196].z, _584);
    float _1026 = _1006 * 0.15915493667125701904296875;
    float _1028 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[193].y, _1018);
    float _1030 = _1022 * _884;
    float _1032 = sqrt(_1002);
    float _1034 = _1022 * _898;
    float _1036 = fma(_618, _784, _1024);
    float _1038 = -_1030;
    float _1040 = fma(_1004, _898, _1038);
    float _1042 = _1028 * _822;
    float _1044 = fma(_1004, _884, _1034);
    float _1046 = _1028 * _848;
    float _1048 = _1040 * _392;
    float _1050 = _1036 * 0.15915493667125701904296875;
    float _1052 = -_1042;
    float _1054 = fma(_1044, _848, _1052);
    float _1056 = fma(_1044, _822, _1046);
    float _1058 = _1008 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = _1054 * _418;
    float _1064 = _554 * _1048;
    float _1066 = _1056 * _604;
    float _1068 = _938 * _1032;
    float _1070 = _1026 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = _554 * _1066;
    float _1076 = _802 * _1068;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1064);
    float _1080 = _804 * _1068;
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1074);
    float _1084 = _812 * _1068;
    float _1086 = _1076 * _1078;
    float _1088 = _1026 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = _1080 * _1082;
    float _1094 = _554 * _1062;
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1094);
    float _1098 = _1050 * 6.283185482025146484375;
    float _1100 = cos(_1098);
    float _1102 = _1016 * _1072;
    float _1104 = _1060 * _1072;
    float _1106 = _1084 * _1096;
    float _1108 = in.m_51.w;
    float _1110 = _1050 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = _1060 * _1090;
    float _1116 = _1016 * _1090;
    float _1118 = _1100 * _1086;
    float _1120 = _1072 * _1100;
    float _1122 = _1090 * _1100;
    float _1124 = _1060 * _1118;
    float _1126 = fma(_1112, _1114, _1102);
    float _1128 = -_1104;
    float _1130 = fma(_1112, _1116, _1128);
    float _1132 = -_1116;
    float _1134 = fma(_1112, _1104, _1132);
    float _1136 = -_1086;
    float _1138 = _1112 * _1136;
    float _1140 = fma(_1126, _1092, _1124);
    float _1142 = fma(_1112, _1102, _1114);
    float _1144 = _1016 * _1118;
    float _1146 = fma(_1122, _1092, _1138);
    float _1148 = fma(_1134, _1106, _1140);
    float _1150 = in.m_67.y;
    float _1152 = fma(_1130, _1092, _1144);
    float _1154 = fma(_1120, _1106, _1146);
    float _1156 = _1148 * _844;
    float _1158 = _1148 * _924;
    float _1160 = _1138;
    if (!_672)
    {
        _1160 = 0.0;
    }
    float _1162 = _1160;
    float _1164 = _1162;
    if (_672)
    {
        float _1166 = _914 * _308;
        _1164 = _1166;
    }
    float _1168 = _1164;
    float _1170 = fma(_1142, _1106, _1152);
    float _1172 = fma(_1154, _760, _1156);
    float _1174 = fma(_1154, _768, _1158);
    bool _1176 = _1108 > 0.5;
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1180 = fma(_1170, _942, _1172);
    float _1182 = fma(_1170, _1168, _1174);
    float _1184 = _828 + _1180;
    float _1186 = _850 + _1182;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1190 = _1188 != 0;
    float _1192 = in.m_67.x;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1196 = _1184 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1200 = _1186 + _1198;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1204 = _1202 != 0;
    float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1208 = _1196 * _1196;
    float _1210 = _1200 * _1200;
    float _1212 = -_1150;
    float _1214 = _1212 + 1.0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1218 = _1216 != 0;
    float _1220 = _1208 + _1210;
    int _1222 = _1176 ? as_type<int>(_1214) : as_type<int>(_1150);
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1226 = _1224 != 0;
    float _1228 = sqrt(_1220);
    float _1230 = _1204 ? as_type<float>(_1222) : _1150;
    bool _1232 = _154 > 0.5;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1236 = _1150;
    bool _1238 = _1190;
    bool _1240 = _1232;
    int _1242 = as_type<int>(_1206);
    float _1244 = _1214;
    if (!_568)
    {
        _1234 = 0.0;
    }
    float _1246 = _1234;
    float _1248 = _1246;
    if (_568)
    {
        float _1250 = _800 * _272;
        _1248 = _1250;
    }
    float _1252 = _1248;
    if (_1190)
    {
        float _1254 = _1232 ? _1214 : _1150;
        _1236 = _1254;
    }
    float _1256 = _1236;
    float _1258 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1260 = _1258;
    float _1262 = _1256;
    if (!_672)
    {
        _354 = 0.0;
    }
    float _1264 = _354;
    float _1266 = _1148 * _1252;
    float _1268 = _1264;
    if (_672)
    {
        float _1270 = _914 * _274;
        _1268 = _1270;
    }
    float _1272 = _1268;
    if (_1226)
    {
        bool _1274 = _168 > 0.5;
        _1238 = _1274;
    }
    bool _1276 = _1238;
    float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_596)
    {
        _356 = 0.0;
    }
    float _1280 = _356;
    float _1282 = _1280;
    if (_596)
    {
        float _1284 = _708 * _270;
        _1282 = _1284;
    }
    float _1286 = _1282;
    bool _1288 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1290 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1218)
    {
        float _1292 = -_1192;
        float _1294 = _1292 + 1.0;
        _382 = as_type<int>(_1294);
    }
    int _1296 = _382;
    float _1298 = fma(_1154, _1286, _1266);
    float _1300 = as_type<float>(_1296);
    if (_1218)
    {
        bool _1302 = _160 > 0.5;
        _1240 = _1302;
    }
    bool _1304 = _1240;
    float _1306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1226)
    {
        float _1308 = -_1192;
        float _1310 = _1308 + 1.0;
        _1242 = as_type<int>(_1310);
    }
    int _1312 = _1242;
    float _1314 = fma(_1170, _1272, _1298);
    float _1316 = _1314;
    if (!_1218)
    {
        _1244 = _1192;
    }
    float _1318 = _1244;
    float _1320 = fma(_1230, _1258, -0.5);
    float _1322 = _1318;
    if (!_1226)
    {
        _384 = _1192;
    }
    float _1324 = _384;
    float _1326 = _824 + _1314;
    float _1328 = fma(_1290, _1256, -0.5);
    float _1330 = _1324;
    if (_1218)
    {
        float _1332 = _1304 ? as_type<float>(_1296) : _1192;
        _1322 = _1332;
    }
    float _1334 = _1322;
    if (_1226)
    {
        float _1336 = _1276 ? as_type<float>(_1312) : _1192;
        _1330 = _1336;
    }
    float _1338 = _1330;
    if (!_1288)
    {
        _1260 = _1210;
    }
    float _1340 = _1260;
    float _1342 = _1340;
    if (!_1288)
    {
        _1300 = _1208;
    }
    float _1344 = _1300;
    float _1346 = _1344;
    if (!_1288)
    {
        _834 = _1184;
    }
    float _1348 = _834;
    float _1350 = _1348;
    if (!_1288)
    {
        _1262 = _1186;
    }
    float _1352 = _1262;
    float _1354 = _1352;
    if (!_1288)
    {
        _1316 = _1326;
    }
    float _1356 = _1316;
    bool _1358 = !_1288;
    float _1360 = _1356;
    if (!_1358)
    {
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1366 = _1228 + _1364;
        float _1368 = rsqrt(_1220);
        float _1370 = _1366 * _1362;
        float _1372 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = _1370 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        float _1380 = _1374 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = fma(_1378, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1386 = _1368 * _1384;
        float _1388 = _1382 + (-1.0);
        float _1390 = fma(_1196, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1392 = fma(_1200, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1394 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1398 = _1390 + _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1402 = _1392 + _1400;
        float _1404 = fma(_1326, _1382, _1394);
        float _1406 = _1398 * _1398;
        float _1408 = _1402 * _1402;
        _1360 = _1404;
        _1346 = _1406;
        _1342 = _1408;
        _1350 = _1390;
        _1354 = _1392;
    }
    float _1410 = _1360;
    float _1412 = _1346;
    float _1414 = _1342;
    float _1416 = _1350;
    float _1418 = _1354;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1422 = _1410 + _1420;
    float _1424 = in.m_53.w;
    float _1426 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1428 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1430 = fma(_1422, _1422, _1412);
    float _1432 = fma(_1426, _1334, -0.5);
    float _1434 = fma(_1428, _1338, -0.5);
    float _1436 = _1430 + _1414;
    float _1438 = -_778;
    float _1440 = fma(_726, _1328, _1438);
    float _1442 = -_694;
    float _1444 = fma(_732, _1320, _1442);
    float _1446 = fma(_720, _1432, _724);
    float _1448 = fma(_780, _1434, _714);
    float _1450 = sqrt(_1436);
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1456 = _1440 + 0.5;
    float _1458 = _1444 + 0.5;
    float _1460 = _1446 + 0.5;
    float _1462 = _1448 + 0.5;
    out.m_69.w = _1452;
    out.m_71.w = _1454;
    out.m_73.w = _1424;
    bool _1464 = _1450 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1466 = isnan(_1450);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1472 = _1468 || _1470;
    out.m_75.x = _1460;
    out.m_75.y = _1456;
    out.m_75.z = _1462;
    out.m_75.w = _1458;
    float _1474 = _1446;
    float _1476 = _1414;
    float _1478 = _1450;
    float _1480 = _1444;
    if (!_1472)
    {
        _1474 = 1.0;
    }
    float _1482 = _1474;
    bool _1484 = !_1472;
    float _1486 = _1482;
    if (!_1484)
    {
        bool _1488 = _1450 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1490 = isnan(_1450);
        bool _1492 = _1488 || _1490;
        bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1496 = _1492 || _1494;
        if (!_1496)
        {
            float _1498 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1500 = _1450 + _1498;
            float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1504 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1502;
            float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1508 = _1506 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1510 = 1.0 / _1504;
            float _1512 = _1500 * _1510;
            float _1514 = fma(_1512, _1508, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1486 = _1514;
            _1476 = _1510;
            _1516 = true;
        }
        else
        {
            bool _1518 = _1450 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1520 = isnan(_1450);
            bool _1522 = _1518 || _1520;
            bool _1524 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1526 = _1522 || _1524;
            if (!_1526)
            {
                float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1530 = _1450 + _1528;
                float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1534 = _1532 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1538 = _1536 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1540 = 1.0 / _1534;
                float _1542 = _1530 * _1540;
                float _1544 = fma(_1542, _1538, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1486 = _1544;
                _1476 = _1540;
                _1516 = true;
            }
            else
            {
                _1486 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1516 = false;
    float _1546 = _1486;
    float _1548 = _1476;
    float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1552 = _1410 + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1556 = _1416 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1560 = _1418 + _1558;
    float _1562 = fma(_1552, _1546, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1564 = fma(_1556, _1546, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1566 = fma(_1560, _1546, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1568 = -_956;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1572 = -_958;
    float _1574 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1576 = -_984;
    float _1578 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1570 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1574 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1578 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1590;
    float _1622 = _1610;
    float _1624 = _1618;
    float _1626 = _1548;
    float _1628 = _1602;
    if (_1614)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1630;
    }
    float _1632 = _1620;
    if (_1614)
    {
        float _1634 = rsqrt(_1610);
        _1622 = _1634;
    }
    float _1636 = _1622;
    float _1638 = _1636;
    if (_1614)
    {
        float _1640 = _1618 * _1632;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1614)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1478 = _1644;
    }
    float _1646 = _1478;
    float _1648 = _1598;
    if (_1614)
    {
        float _1650 = _1646 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1278;
    float _1662 = _1658;
    float _1664 = _1656;
    if (_1614)
    {
        float _1666 = _1646 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1660 = _1668;
    }
    float _1670 = _1660;
    float _1672 = -_1600;
    float _1674 = -_1658;
    float _1676 = fma(_1582, _1672, _1674);
    if (_1614)
    {
        float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1678;
    }
    float _1680 = _1662;
    float _1682 = sqrt(_1596);
    float _1684 = _1654;
    float _1686 = _1680;
    if (_1614)
    {
        float _1688 = fma(_1654, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (!_1614)
    {
        _1686 = _1604;
    }
    float _1694 = _1686;
    float _1696 = _1694;
    if (_1614)
    {
        float _1698 = _1670 + (-1.0);
        _1664 = _1698;
    }
    float _1700 = _1664;
    float _1702 = _1700;
    if (_1614)
    {
        float _1704 = _1636 * _1690;
        _1480 = _1704;
    }
    float _1706 = _1480;
    if (!_1614)
    {
        _1692 = _1676;
    }
    float _1708 = _1692;
    float _1710 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1712 = _1708;
    if (_1614)
    {
        float _1714 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1714;
    }
    float _1716 = _1626;
    if (_1614)
    {
        float _1718 = _1602 * _1706;
        _1628 = _1718;
    }
    float _1720 = _1628;
    if (!_1614)
    {
        _1638 = _1606;
    }
    float _1722 = _1638;
    float _1724 = _1722;
    if (_1614)
    {
        float _1726 = _1604 * _1706;
        _1696 = _1726;
    }
    float _1728 = _1696;
    if (_1614)
    {
        float _1730 = fma(_1676, _1670, _1716);
        _1712 = _1730;
    }
    float _1732 = _1712;
    if (_1614)
    {
        float _1734 = _1720 * _1720;
        _1724 = _1734;
    }
    float _1736 = _1724;
    if (!_1614)
    {
        _1702 = _1608;
    }
    float _1738 = _1702;
    float _1740 = _1738;
    if (_1614)
    {
        float _1742 = _1728 * _1728;
        _1740 = _1742;
    }
    float _1744 = _1740;
    float _1746 = fma(_1732, _1732, _1736);
    float _1748 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1710);
    float _1750 = _1746 + _1744;
    float _1752 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1756 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1754);
    float _1758 = precise::clamp(_1756, 0.0, 1.0);
    float _1760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1762 = rsqrt(_1750);
    float _1764 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1752);
    float _1766 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1768 = -_1758;
    float _1770 = _1768 + 1.0;
    float _1772 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1764);
    float _1776 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1766);
    float _1778 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1780 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1772);
    float _1782 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1784 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1776);
    float _1786 = abs(_1770);
    float _1788 = log2(_1786);
    float _1790 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1780);
    float _1792 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1794 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1796 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1798 = _1762 * _1720;
    float _1800 = -_1792;
    float _1802 = fma(_1800, _1760, 1.0);
    float _1804 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1806 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1808 = _1762 * _1732;
    float _1810 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1812 = _1762 * _1728;
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1806);
    float _1816 = log2(_1802);
    float _1818 = -_1810;
    float _1820 = fma(_1808, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1818);
    float _1822 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1824 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1826 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1814);
    float _1828 = -_1812;
    float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1820);
    float _1832 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1834 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1822);
    float _1836 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1826);
    float _1838 = exp2(_1824);
    float _1840 = fma(_1830, -0.5, 0.5);
    float _1842 = fma(_1830, 0.5, 0.5);
    float _1844 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1832);
    float _1846 = _1808 + 1.0;
    float _1848 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1834);
    float _1850 = fma(_1842, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1852 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1844);
    float _1854 = 1.0 / _1836;
    float _1856 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1848);
    float _1858 = fma(_1842, _1850, -0.212114393711090087890625);
    float _1860 = fma(_1842, _1858, 1.570728778839111328125);
    float _1862 = sqrt(_1840);
    float _1864 = -_1808;
    float _1866 = fma(_1838, _1846, _1864);
    float _1868 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1852);
    float _1870 = _1816 * 0.693147182464599609375;
    float _1872 = fma(_1866, 0.5, 0.5);
    float _1874 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1876 = _1868 * _1854;
    float _1878 = _1856 * _1854;
    float _1880 = fma(_1876, 0.5, 0.5);
    float _1882 = fma(_1878, -0.5, 0.5);
    float _1884 = _1862 * 0.636619746685028076171875;
    float3 _4808 = float3(_1880, _1882, _1874);
    float _1886 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4808, float3(0.0), isnan(_4808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4808, float3(0.0), isnan(_4808)), level(0.0)).x;
    float _1888 = -_1860;
    float _1890 = fma(_1884, _1888, 1.0);
    float3 _4824 = float3(_1880, _1882, _1874);
    float4 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4824, float3(0.0), isnan(_4824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4824, float3(0.0), isnan(_4824)), level(0.0)).xyzw;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _1893.w;
    float2 _4841 = float2(_1890, _1872);
    float3 _1905 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4841, float2(0.0), isnan(_4841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4841, float2(0.0), isnan(_4841)), level(0.0)).xyz;
    float _1907 = _1905.x;
    float _1909 = _1905.y;
    float _1911 = _1905.z;
    float _1913 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1915 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1917 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1915);
    float _1919 = exp2(_1913);
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1923 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1917);
    out.m_47.x = _1921;
    float _1925 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1923);
    float _1927 = _1925 + _1836;
    out.gl_Position.x = _1868;
    out.gl_Position.y = _1856;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1836;
    float _1929 = _1927 * 0.5;
    float _1931 = -_1919;
    float _1933 = _1931 + 1.0;
    float _1935 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1929;
    out.m_77.w = _1836;
    float _1937 = -_1935;
    float _1939 = _1937 + 1.0;
    float _1941 = _1935 * _1886;
    float _1943 = _1901 * _1941;
    float _1945 = _1901 * _1939;
    float _1947 = _1911 * _1941;
    float _1949 = fma(_1907, _1943, _1895);
    float _1951 = fma(_1909, _1943, _1897);
    float _1953 = fma(_1901, _1947, _1899);
    out.m_79.x = _1949;
    out.m_79.y = _1951;
    out.m_79.z = _1953;
    out.m_79.w = _1945;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1516 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_114);
        out.gl_Position.z = _2011;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _106 = _136;
    }
    float _138 = _106;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2081 = as_type<float>(_152);
        out.gl_Position.z = _2081;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.y;
    float _156 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _158 = log2(_156);
    float _160 = in.m_51.x;
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _166 = _164 != 0;
    float _168 = in.m_51.z;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = _158 * _132;
    float _186 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _188 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _190 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _192 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _194 = exp2(_184);
    float _196 = fma(_190, -2.0, _162);
    float _198 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _200 = _160 * 2.0;
    float _202 = _168 * 2.0;
    float _204 = -_170;
    float _206 = fma(_198, 2.0, _204);
    float _208 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _192);
    float _210 = fma(200.0, _160, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _212 = _172 * 100.0;
    float _214 = floor(_202);
    float _216 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _208);
    float _218 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _220 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[193].z, _210);
    float _222 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _224 = floor(_200);
    float _226 = _154 * 2.0;
    float _228 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _230 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _176);
    float _232 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _234 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _236 = floor(_226);
    float _238 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _232);
    bool _240 = _214 > 0.0;
    float _242 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    bool _244 = _214 >= 0.0;
    bool _246 = isnan(_214);
    bool _248 = _244 || _246;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    float _254 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _238);
    bool _256 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _258 = isnan(1.0);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _264 = _260 || _262;
    float _266 = fma(_160, 6.283185482025146484375, _242);
    bool _268 = _224 > 0.0;
    float _270 = in.m_57.x;
    float _272 = in.m_57.y;
    float _274 = in.m_57.z;
    bool _276 = _224 >= 0.0;
    bool _278 = isnan(_224);
    bool _280 = _276 || _278;
    bool _282 = isnan(0.0);
    bool _284 = _280 || _282;
    float _286 = _266 * 0.15915493667125701904296875;
    int _288 = _252 ? 0 : 1;
    float _290 = in.m_59.x;
    float _292 = in.m_59.y;
    float _294 = in.m_59.z;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _298 = 1.0 + _296;
    float _300 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _234);
    bool _302 = _236 > 0.0;
    float _304 = in.m_61.x;
    float _306 = in.m_61.y;
    float _308 = in.m_61.z;
    bool _310 = _236 >= 0.0;
    bool _312 = isnan(_236);
    bool _314 = _310 || _312;
    bool _316 = isnan(0.0);
    bool _318 = _314 || _316;
    float _320 = _286 * 6.283185482025146484375;
    float _322 = sin(_320);
    int _324 = _284 ? 0 : 1;
    bool _326 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _330 = _326 || _328;
    bool _332 = isnan(1.0);
    bool _334 = _330 || _332;
    int _336 = ~_288;
    int _338 = _336 + 1;
    int _340 = _338 + 1;
    int _342 = _318 ? 0 : 1;
    float _344 = 1.0 / _298;
    int _346 = _340;
    float _348 = _188;
    float _350 = _216;
    float _352 = _174;
    float _354 = _154;
    float _356 = _168;
    if (!_240)
    {
        int _358 = ~_288;
        int _360 = _358 + 1;
        _346 = _360;
    }
    int _362 = _346;
    int _364 = ~_324;
    int _366 = _364 + 1;
    int _368 = _366 + 1;
    int _370 = ~_342;
    int _372 = _370 + 1;
    int _374 = _372 + 1;
    float _376 = _270 * _270;
    int _378 = _368;
    int _380 = _374;
    int _382 = as_type<int>(_270);
    float _384 = _274;
    if (!_268)
    {
        int _386 = ~_324;
        int _388 = _386 + 1;
        _378 = _388;
    }
    int _390 = _378;
    float _392 = rsqrt(_254);
    float _394 = 0.0;
    if (!_334)
    {
        float _396 = _188 * _188;
        float _398 = _396 * 0.5;
        _394 = _398;
    }
    float _400 = _394;
    float _402 = _400;
    if (!_302)
    {
        int _404 = ~_342;
        int _406 = _404 + 1;
        _380 = _406;
    }
    int _408 = _380;
    float _410 = _272 * _272;
    float _412 = fma(_290, _290, _376);
    if (!_334)
    {
        float _414 = _400 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _402 = _414;
    }
    float _416 = _402;
    float _418 = rsqrt(_300);
    bool _420 = !_334;
    float _422 = _416;
    if (!_420)
    {
        float _424 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _426 = log2(_424);
        float _428 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _430 = _428 + 1.0;
        float _432 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _434 = _188 * _426;
        float _436 = 1.0 / _430;
        float _438 = _432 * 0.693147182464599609375;
        float _440 = exp2(_434);
        float _442 = 1.0 / _438;
        float _444 = _440 + (-1.0);
        float _446 = -_444;
        float _448 = fma(_446, _442, _188);
        float _450 = _448 * _436;
        float _452 = _450 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _422 = _452;
    }
    float _454 = _422;
    bool _456 = !_334;
    if (!_456)
    {
        float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = log2(_458);
        float _462 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _464 = _462 + 1.0;
        float _466 = 1.0 / _464;
        float _468 = _188 * _460;
        float _470 = exp2(_468);
        float _472 = -_470;
        float _474 = _472 + 1.0;
        float _476 = _474 * _466;
        _348 = _476;
    }
    float _478 = _348;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = fma(_292, _292, _410);
    float _494 = fma(_304, _304, _412);
    float _496 = float(_362);
    float _498 = in.m_63.x;
    float _500 = in.m_63.y;
    float _502 = in.m_63.z;
    bool _504 = !_482;
    int _506 = _504 ? 0 : 1;
    float _508 = _274 * _274;
    bool _510 = !_486;
    int _512 = _510 ? 0 : 1;
    float _514 = fma(_306, _306, _492);
    bool _516 = !_490;
    int _518 = _516 ? 0 : 1;
    float _520 = fma(_294, _294, _508);
    int _522 = abs(_506);
    float _524 = sqrt(_514);
    int _526 = abs(_512);
    float _528 = fma(_308, _308, _520);
    int _530 = abs(_518);
    float _532 = _174 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _534 = float(_390);
    float _536 = _220 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _538 = sqrt(_494);
    float _540 = in.m_55.w;
    float _542 = float(_408);
    float _544 = -_194;
    float _546 = _544 + 1.0;
    float _548 = float(_522);
    float _550 = _536 * 0.01200000010430812835693359375;
    float _552 = float(_526);
    float _554 = sqrt(_216);
    float _556 = float(_530);
    float _558 = _548 * _496;
    float _560 = _552 * _534;
    float _562 = _558 * (-2.0);
    float _564 = _556 * _542;
    float _566 = _560 * (-2.0);
    bool _568 = _524 > 0.0;
    float _570 = fma(_562, _498, _498);
    float _572 = _154 + _168;
    float _574 = fma(_566, _500, _500);
    float _576 = _160 + _168;
    float _578 = _564 * (-2.0);
    float _580 = _572 + (-1.0);
    float _582 = _576 + (-1.0);
    float _584 = fma(_578, _502, _502);
    float _586 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _588 = _154 + _160;
    float _590 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _592 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _230);
    float _594 = _588 + (-1.0);
    bool _596 = _538 > 0.0;
    float _598 = in.m_65.x;
    float _600 = in.m_65.y;
    float _602 = in.m_65.z;
    float _604 = rsqrt(_216);
    float _606 = _558;
    if (!_166)
    {
        _606 = _168;
    }
    float _608 = _606;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _612 = _608;
    if (_166)
    {
        _612 = _154;
    }
    float _614 = _612;
    float _616 = _550 * 0.15915493667125701904296875;
    float _618 = fma(_590, _578, _590);
    float _620 = sqrt(_528);
    if (!_166)
    {
        _350 = _168;
    }
    float _622 = _350;
    float _624 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[83].w, _610);
    float _626 = _622;
    if (_166)
    {
        _626 = _154;
    }
    float _628 = _626;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_166)
    {
        _352 = _154;
    }
    float _632 = _352;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _636 = _632;
    if (_166)
    {
        _636 = _160;
    }
    float _638 = _636;
    float _640 = _628 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _642 = _536 * 0.20000000298023223876953125;
    float _644 = fma(_640, -2.0, _630);
    float _646 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[83].z, _634);
    float _648 = _638 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _652 = fma(_532, _322, _598);
    float _654 = _536 * 0.100000001490116119384765625;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _658 = _642 * 0.15915493667125701904296875;
    float _660 = -_650;
    float _662 = fma(_648, 2.0, _660);
    float _664 = _654 * 0.15915493667125701904296875;
    float _666 = in.m_49.x;
    float _668 = in.m_49.y;
    float _670 = in.m_49.z;
    bool _672 = _620 > 0.0;
    float _674 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _656);
    float _676 = in.m_44.x;
    float _678 = in.m_44.y;
    float _680 = in.m_44.z;
    bool _682 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _694 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _644);
    float _696 = _454 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _698 = _536 * (-0.100000001490116119384765625);
    float _700 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].w, _692);
    float _702 = _690 ? _546 : 0.0;
    float _704 = _494;
    if (_596)
    {
        float _706 = rsqrt(_494);
        _704 = _706;
    }
    float _708 = _704;
    float _710 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _712 = -_132;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[81].x, _662);
    float _716 = _454 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _718 = _698 * 0.15915493667125701904296875;
    float _720 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _674);
    float _722 = -_132;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _206);
    float _726 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _700);
    float _728 = _658 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _624);
    float _734 = _454 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _736 = _536 * 0.02300000004470348358154296875;
    float _738 = fma(_478, _668, _696);
    float _740 = _668;
    float _742 = _670;
    if (!_596)
    {
        _740 = 0.0;
    }
    float _744 = _740;
    float _746 = fma(_478, _670, _734);
    float _748 = _736 * 0.15915493667125701904296875;
    float _750 = _658 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = fma(_738, _540, _678);
    float _756 = _744;
    if (_596)
    {
        float _758 = _708 * _290;
        _756 = _758;
    }
    float _760 = _756;
    if (!_596)
    {
        _742 = 0.0;
    }
    float _762 = _742;
    float _764 = _762;
    if (_596)
    {
        float _766 = _708 * _304;
        _764 = _766;
    }
    float _768 = _764;
    float _770 = _754 * _292;
    float _772 = fma(_710, _562, _710);
    float _774 = _664 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _196);
    float _780 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _646);
    if (_264)
    {
        float _782 = _702 * _344;
        _134 = _782;
    }
    float _784 = _134;
    float _786 = fma(_478, _666, _716);
    float _788 = _754 * _272;
    float _790 = fma(_746, _540, _680);
    float _792 = _754 * _306;
    float _794 = fma(_786, _540, _676);
    float _796 = _514;
    if (_568)
    {
        float _798 = rsqrt(_514);
        _796 = _798;
    }
    float _800 = _796;
    float _802 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _804 = _222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = fma(_794, _270, _788);
    float _808 = fma(_794, _290, _770);
    float _810 = fma(_794, _304, _792);
    float _812 = _228 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _814 = fma(_790, _274, _806);
    float _816 = fma(_790, _294, _808);
    float _818 = _776 * 2.0;
    float _820 = _748 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = _814 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _826 = fma(_790, _308, _810);
    float _828 = _816 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _830 = _818 * 0.15915493667125701904296875;
    float _832 = _818;
    float _834 = _824;
    if (!_568)
    {
        _832 = 0.0;
    }
    float _836 = _832;
    float _838 = _592 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _840 = _836;
    if (_568)
    {
        float _842 = _800 * _292;
        _840 = _842;
    }
    float _844 = _840;
    float _846 = _748 * 6.283185482025146484375;
    float _848 = cos(_846);
    float _850 = _826 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _854 = _828 + _852;
    float _856 = -_838;
    float _858 = precise::max(_856, 2.0);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _862 = _850 + _860;
    float _864 = precise::min(_858, 5.0);
    float _866 = _718 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _872 = _824 + _870;
    float _874 = _858;
    if (!_672)
    {
        _874 = 0.0;
    }
    float _876 = _874;
    float _878 = fma(_864, 0.2000000178813934326171875, -2.98023223876953125e-08);
    float _880 = _872 * _872;
    float _882 = _616 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = _652 * _878;
    float _888 = _878 * _602;
    float _890 = _878 * _600;
    float _892 = _886 * _730;
    float _894 = _886 * _752;
    float _896 = _616 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = -_892;
    float _902 = fma(_888, _752, _900);
    float _904 = fma(_888, _730, _894);
    float _906 = _528;
    float _908 = _880;
    float _910 = _876;
    if (_672)
    {
        float _912 = rsqrt(_528);
        _906 = _912;
    }
    float _914 = _906;
    float _916 = fma(_854, _854, _880);
    if (!_568)
    {
        _908 = 0.0;
    }
    float _918 = _908;
    float _920 = _918;
    if (_568)
    {
        float _922 = _800 * _306;
        _920 = _922;
    }
    float _924 = _920;
    float _926 = fma(_862, _862, _916);
    float _928 = _868 * 2.0;
    float _930 = _868 * 0.60000002384185791015625;
    float _932 = _830 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _928 * 0.15915493667125701904296875;
    float _938 = rsqrt(_926);
    if (_672)
    {
        float _940 = _914 * _294;
        _910 = _940;
    }
    float _942 = _910;
    float _944 = _830 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = _902 * _934;
    float _950 = _936 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = _160 + (-0.5);
    float _956 = _872 * _938;
    float _958 = _854 * _938;
    float _960 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].x, _570);
    float _962 = -_956;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _966 = -_958;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _970 = fma(_772, _784, _960);
    float _972 = _902 * _946;
    float _974 = _936 * 6.283185482025146484375;
    float _976 = cos(_974);
    float _978 = -_948;
    float _980 = fma(_890, _946, _978);
    float _982 = _964 * _964;
    float _984 = _862 * _938;
    float _986 = fma(_586, _566, _586);
    float _988 = _154 + (-0.5);
    float _990 = fma(_968, _968, _982);
    float _992 = -_984;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _996 = fma(_890, _934, _972);
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].y, _574);
    float _1000 = _904 * _952;
    float _1002 = fma(_994, _994, _990);
    float _1004 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[193].y, _980);
    float _1006 = fma(_986, _784, _998);
    float _1008 = _970 * 0.15915493667125701904296875;
    float _1010 = _904 * _976;
    float _1012 = _168 + (-0.5);
    float _1014 = _1008 * 6.283185482025146484375;
    float _1016 = sin(_1014);
    float _1018 = fma(_996, _952, _1010);
    float _1020 = -_1000;
    float _1022 = fma(_996, _976, _1020);
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[196].z, _584);
    float _1026 = _1006 * 0.15915493667125701904296875;
    float _1028 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[193].y, _1018);
    float _1030 = _1022 * _884;
    float _1032 = sqrt(_1002);
    float _1034 = _1022 * _898;
    float _1036 = fma(_618, _784, _1024);
    float _1038 = -_1030;
    float _1040 = fma(_1004, _898, _1038);
    float _1042 = _1028 * _822;
    float _1044 = fma(_1004, _884, _1034);
    float _1046 = _1028 * _848;
    float _1048 = _1040 * _392;
    float _1050 = _1036 * 0.15915493667125701904296875;
    float _1052 = -_1042;
    float _1054 = fma(_1044, _848, _1052);
    float _1056 = fma(_1044, _822, _1046);
    float _1058 = _1008 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = _1054 * _418;
    float _1064 = _554 * _1048;
    float _1066 = _1056 * _604;
    float _1068 = _938 * _1032;
    float _1070 = _1026 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = _554 * _1066;
    float _1076 = _802 * _1068;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1064);
    float _1080 = _804 * _1068;
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1074);
    float _1084 = _812 * _1068;
    float _1086 = _1076 * _1078;
    float _1088 = _1026 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = _1080 * _1082;
    float _1094 = _554 * _1062;
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1094);
    float _1098 = _1050 * 6.283185482025146484375;
    float _1100 = cos(_1098);
    float _1102 = _1016 * _1072;
    float _1104 = _1060 * _1072;
    float _1106 = _1084 * _1096;
    float _1108 = in.m_51.w;
    float _1110 = _1050 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = _1060 * _1090;
    float _1116 = _1016 * _1090;
    float _1118 = _1100 * _1086;
    float _1120 = _1072 * _1100;
    float _1122 = _1090 * _1100;
    float _1124 = _1060 * _1118;
    float _1126 = fma(_1112, _1114, _1102);
    float _1128 = -_1104;
    float _1130 = fma(_1112, _1116, _1128);
    float _1132 = -_1116;
    float _1134 = fma(_1112, _1104, _1132);
    float _1136 = -_1086;
    float _1138 = _1112 * _1136;
    float _1140 = fma(_1126, _1092, _1124);
    float _1142 = fma(_1112, _1102, _1114);
    float _1144 = _1016 * _1118;
    float _1146 = fma(_1122, _1092, _1138);
    float _1148 = fma(_1134, _1106, _1140);
    float _1150 = in.m_67.y;
    float _1152 = fma(_1130, _1092, _1144);
    float _1154 = fma(_1120, _1106, _1146);
    float _1156 = _1148 * _844;
    float _1158 = _1148 * _924;
    float _1160 = _1138;
    if (!_672)
    {
        _1160 = 0.0;
    }
    float _1162 = _1160;
    float _1164 = _1162;
    if (_672)
    {
        float _1166 = _914 * _308;
        _1164 = _1166;
    }
    float _1168 = _1164;
    float _1170 = fma(_1142, _1106, _1152);
    float _1172 = fma(_1154, _760, _1156);
    float _1174 = fma(_1154, _768, _1158);
    bool _1176 = _1108 > 0.5;
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1180 = fma(_1170, _942, _1172);
    float _1182 = fma(_1170, _1168, _1174);
    float _1184 = _828 + _1180;
    float _1186 = _850 + _1182;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1190 = _1188 != 0;
    float _1192 = in.m_67.x;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1196 = _1184 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1200 = _1186 + _1198;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1204 = _1202 != 0;
    float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1208 = _1196 * _1196;
    float _1210 = _1200 * _1200;
    float _1212 = -_1150;
    float _1214 = _1212 + 1.0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1218 = _1216 != 0;
    float _1220 = _1208 + _1210;
    int _1222 = _1176 ? as_type<int>(_1214) : as_type<int>(_1150);
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1226 = _1224 != 0;
    float _1228 = sqrt(_1220);
    float _1230 = _1204 ? as_type<float>(_1222) : _1150;
    bool _1232 = _154 > 0.5;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1236 = _1150;
    bool _1238 = _1190;
    bool _1240 = _1232;
    int _1242 = as_type<int>(_1206);
    float _1244 = _1214;
    if (!_568)
    {
        _1234 = 0.0;
    }
    float _1246 = _1234;
    float _1248 = _1246;
    if (_568)
    {
        float _1250 = _800 * _272;
        _1248 = _1250;
    }
    float _1252 = _1248;
    if (_1190)
    {
        float _1254 = _1232 ? _1214 : _1150;
        _1236 = _1254;
    }
    float _1256 = _1236;
    float _1258 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1260 = _1258;
    float _1262 = _1256;
    if (!_672)
    {
        _354 = 0.0;
    }
    float _1264 = _354;
    float _1266 = _1148 * _1252;
    float _1268 = _1264;
    if (_672)
    {
        float _1270 = _914 * _274;
        _1268 = _1270;
    }
    float _1272 = _1268;
    if (_1226)
    {
        bool _1274 = _168 > 0.5;
        _1238 = _1274;
    }
    bool _1276 = _1238;
    float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_596)
    {
        _356 = 0.0;
    }
    float _1280 = _356;
    float _1282 = _1280;
    if (_596)
    {
        float _1284 = _708 * _270;
        _1282 = _1284;
    }
    float _1286 = _1282;
    bool _1288 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1290 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1218)
    {
        float _1292 = -_1192;
        float _1294 = _1292 + 1.0;
        _382 = as_type<int>(_1294);
    }
    int _1296 = _382;
    float _1298 = fma(_1154, _1286, _1266);
    float _1300 = as_type<float>(_1296);
    if (_1218)
    {
        bool _1302 = _160 > 0.5;
        _1240 = _1302;
    }
    bool _1304 = _1240;
    float _1306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1226)
    {
        float _1308 = -_1192;
        float _1310 = _1308 + 1.0;
        _1242 = as_type<int>(_1310);
    }
    int _1312 = _1242;
    float _1314 = fma(_1170, _1272, _1298);
    float _1316 = _1314;
    if (!_1218)
    {
        _1244 = _1192;
    }
    float _1318 = _1244;
    float _1320 = fma(_1230, _1258, -0.5);
    float _1322 = _1318;
    if (!_1226)
    {
        _384 = _1192;
    }
    float _1324 = _384;
    float _1326 = _824 + _1314;
    float _1328 = fma(_1290, _1256, -0.5);
    float _1330 = _1324;
    if (_1218)
    {
        float _1332 = _1304 ? as_type<float>(_1296) : _1192;
        _1322 = _1332;
    }
    float _1334 = _1322;
    if (_1226)
    {
        float _1336 = _1276 ? as_type<float>(_1312) : _1192;
        _1330 = _1336;
    }
    float _1338 = _1330;
    if (!_1288)
    {
        _1260 = _1210;
    }
    float _1340 = _1260;
    float _1342 = _1340;
    if (!_1288)
    {
        _1300 = _1208;
    }
    float _1344 = _1300;
    float _1346 = _1344;
    if (!_1288)
    {
        _834 = _1184;
    }
    float _1348 = _834;
    float _1350 = _1348;
    if (!_1288)
    {
        _1262 = _1186;
    }
    float _1352 = _1262;
    float _1354 = _1352;
    if (!_1288)
    {
        _1316 = _1326;
    }
    float _1356 = _1316;
    bool _1358 = !_1288;
    float _1360 = _1356;
    if (!_1358)
    {
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1366 = _1228 + _1364;
        float _1368 = rsqrt(_1220);
        float _1370 = _1366 * _1362;
        float _1372 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = _1370 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        float _1380 = _1374 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = fma(_1378, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1386 = _1368 * _1384;
        float _1388 = _1382 + (-1.0);
        float _1390 = fma(_1196, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1392 = fma(_1200, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1394 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1398 = _1390 + _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1402 = _1392 + _1400;
        float _1404 = fma(_1326, _1382, _1394);
        float _1406 = _1398 * _1398;
        float _1408 = _1402 * _1402;
        _1360 = _1404;
        _1346 = _1406;
        _1342 = _1408;
        _1350 = _1390;
        _1354 = _1392;
    }
    float _1410 = _1360;
    float _1412 = _1346;
    float _1414 = _1342;
    float _1416 = _1350;
    float _1418 = _1354;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1422 = _1410 + _1420;
    float _1424 = in.m_53.w;
    float _1426 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1428 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1430 = fma(_1422, _1422, _1412);
    float _1432 = fma(_1426, _1334, -0.5);
    float _1434 = fma(_1428, _1338, -0.5);
    float _1436 = _1430 + _1414;
    float _1438 = -_778;
    float _1440 = fma(_726, _1328, _1438);
    float _1442 = -_694;
    float _1444 = fma(_732, _1320, _1442);
    float _1446 = fma(_720, _1432, _724);
    float _1448 = fma(_780, _1434, _714);
    float _1450 = sqrt(_1436);
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1456 = _1440 + 0.5;
    float _1458 = _1444 + 0.5;
    float _1460 = _1446 + 0.5;
    float _1462 = _1448 + 0.5;
    out.m_69.w = _1452;
    out.m_71.w = _1454;
    out.m_73.w = _1424;
    bool _1464 = _1450 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1466 = isnan(_1450);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1472 = _1468 || _1470;
    out.m_75.x = _1460;
    out.m_75.y = _1456;
    out.m_75.z = _1462;
    out.m_75.w = _1458;
    float _1474 = _1446;
    float _1476 = _1414;
    float _1478 = _1450;
    float _1480 = _1444;
    if (!_1472)
    {
        _1474 = 1.0;
    }
    float _1482 = _1474;
    bool _1484 = !_1472;
    float _1486 = _1482;
    if (!_1484)
    {
        bool _1488 = _1450 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1490 = isnan(_1450);
        bool _1492 = _1488 || _1490;
        bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1496 = _1492 || _1494;
        if (!_1496)
        {
            float _1498 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1500 = _1450 + _1498;
            float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1504 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1502;
            float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1508 = _1506 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1510 = 1.0 / _1504;
            float _1512 = _1500 * _1510;
            float _1514 = fma(_1512, _1508, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1486 = _1514;
            _1476 = _1510;
            _1516 = true;
        }
        else
        {
            bool _1518 = _1450 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1520 = isnan(_1450);
            bool _1522 = _1518 || _1520;
            bool _1524 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1526 = _1522 || _1524;
            if (!_1526)
            {
                float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1530 = _1450 + _1528;
                float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1534 = _1532 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1538 = _1536 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1540 = 1.0 / _1534;
                float _1542 = _1530 * _1540;
                float _1544 = fma(_1542, _1538, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1486 = _1544;
                _1476 = _1540;
                _1516 = true;
            }
            else
            {
                _1486 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1516 = false;
    float _1546 = _1486;
    float _1548 = _1476;
    float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1552 = _1410 + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1556 = _1416 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1560 = _1418 + _1558;
    float _1562 = fma(_1552, _1546, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1564 = fma(_1556, _1546, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1566 = fma(_1560, _1546, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1568 = -_956;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1572 = -_958;
    float _1574 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1576 = -_984;
    float _1578 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1570 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1574 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1578 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1590;
    float _1622 = _1610;
    float _1624 = _1618;
    float _1626 = _1548;
    float _1628 = _1602;
    if (_1614)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1630;
    }
    float _1632 = _1620;
    if (_1614)
    {
        float _1634 = rsqrt(_1610);
        _1622 = _1634;
    }
    float _1636 = _1622;
    float _1638 = _1636;
    if (_1614)
    {
        float _1640 = _1618 * _1632;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1614)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1478 = _1644;
    }
    float _1646 = _1478;
    float _1648 = _1598;
    if (_1614)
    {
        float _1650 = _1646 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1278;
    float _1662 = _1658;
    float _1664 = _1656;
    if (_1614)
    {
        float _1666 = _1646 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1660 = _1668;
    }
    float _1670 = _1660;
    float _1672 = -_1600;
    float _1674 = -_1658;
    float _1676 = fma(_1582, _1672, _1674);
    if (_1614)
    {
        float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1678;
    }
    float _1680 = _1662;
    float _1682 = sqrt(_1596);
    float _1684 = _1654;
    float _1686 = _1680;
    if (_1614)
    {
        float _1688 = fma(_1654, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (!_1614)
    {
        _1686 = _1604;
    }
    float _1694 = _1686;
    float _1696 = _1694;
    if (_1614)
    {
        float _1698 = _1670 + (-1.0);
        _1664 = _1698;
    }
    float _1700 = _1664;
    float _1702 = _1700;
    if (_1614)
    {
        float _1704 = _1636 * _1690;
        _1480 = _1704;
    }
    float _1706 = _1480;
    if (!_1614)
    {
        _1692 = _1676;
    }
    float _1708 = _1692;
    float _1710 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1712 = _1708;
    if (_1614)
    {
        float _1714 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1714;
    }
    float _1716 = _1626;
    if (_1614)
    {
        float _1718 = _1602 * _1706;
        _1628 = _1718;
    }
    float _1720 = _1628;
    if (!_1614)
    {
        _1638 = _1606;
    }
    float _1722 = _1638;
    float _1724 = _1722;
    if (_1614)
    {
        float _1726 = _1604 * _1706;
        _1696 = _1726;
    }
    float _1728 = _1696;
    if (_1614)
    {
        float _1730 = fma(_1676, _1670, _1716);
        _1712 = _1730;
    }
    float _1732 = _1712;
    if (_1614)
    {
        float _1734 = _1720 * _1720;
        _1724 = _1734;
    }
    float _1736 = _1724;
    if (!_1614)
    {
        _1702 = _1608;
    }
    float _1738 = _1702;
    float _1740 = _1738;
    if (_1614)
    {
        float _1742 = _1728 * _1728;
        _1740 = _1742;
    }
    float _1744 = _1740;
    float _1746 = fma(_1732, _1732, _1736);
    float _1748 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1710);
    float _1750 = _1746 + _1744;
    float _1752 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1756 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1754);
    float _1758 = precise::clamp(_1756, 0.0, 1.0);
    float _1760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1762 = rsqrt(_1750);
    float _1764 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1752);
    float _1766 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1768 = -_1758;
    float _1770 = _1768 + 1.0;
    float _1772 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1764);
    float _1776 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1766);
    float _1778 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1780 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1772);
    float _1782 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1784 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1776);
    float _1786 = abs(_1770);
    float _1788 = log2(_1786);
    float _1790 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1780);
    float _1792 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1794 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1796 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1798 = _1762 * _1720;
    float _1800 = -_1792;
    float _1802 = fma(_1800, _1760, 1.0);
    float _1804 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1806 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1808 = _1762 * _1732;
    float _1810 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1812 = _1762 * _1728;
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1806);
    float _1816 = log2(_1802);
    float _1818 = -_1810;
    float _1820 = fma(_1808, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1818);
    float _1822 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1824 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1826 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1814);
    float _1828 = -_1812;
    float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1820);
    float _1832 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1834 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1822);
    float _1836 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1826);
    float _1838 = exp2(_1824);
    float _1840 = fma(_1830, -0.5, 0.5);
    float _1842 = fma(_1830, 0.5, 0.5);
    float _1844 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1832);
    float _1846 = _1808 + 1.0;
    float _1848 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1834);
    float _1850 = fma(_1842, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1852 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1844);
    float _1854 = 1.0 / _1836;
    float _1856 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1848);
    float _1858 = fma(_1842, _1850, -0.212114393711090087890625);
    float _1860 = fma(_1842, _1858, 1.570728778839111328125);
    float _1862 = sqrt(_1840);
    float _1864 = -_1808;
    float _1866 = fma(_1838, _1846, _1864);
    float _1868 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1852);
    float _1870 = _1816 * 0.693147182464599609375;
    float _1872 = fma(_1866, 0.5, 0.5);
    float _1874 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1876 = _1868 * _1854;
    float _1878 = _1856 * _1854;
    float _1880 = fma(_1876, 0.5, 0.5);
    float _1882 = fma(_1878, -0.5, 0.5);
    float _1884 = _1862 * 0.636619746685028076171875;
    float3 _4808 = float3(_1880, _1882, _1874);
    float _1886 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4808, float3(0.0), isnan(_4808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4808, float3(0.0), isnan(_4808)), level(0.0)).x;
    float _1888 = -_1860;
    float _1890 = fma(_1884, _1888, 1.0);
    float3 _4824 = float3(_1880, _1882, _1874);
    float4 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4824, float3(0.0), isnan(_4824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4824, float3(0.0), isnan(_4824)), level(0.0)).xyzw;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _1893.w;
    float2 _4841 = float2(_1890, _1872);
    float3 _1905 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4841, float2(0.0), isnan(_4841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4841, float2(0.0), isnan(_4841)), level(0.0)).xyz;
    float _1907 = _1905.x;
    float _1909 = _1905.y;
    float _1911 = _1905.z;
    float _1913 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1915 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1917 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1915);
    float _1919 = exp2(_1913);
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1923 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1917);
    out.m_47.x = _1921;
    float _1925 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1923);
    float _1927 = _1925 + _1836;
    out.gl_Position.x = _1868;
    out.gl_Position.y = _1856;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1836;
    float _1929 = _1927 * 0.5;
    float _1931 = -_1919;
    float _1933 = _1931 + 1.0;
    float _1935 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1929;
    out.m_77.w = _1836;
    float _1937 = -_1935;
    float _1939 = _1937 + 1.0;
    float _1941 = _1935 * _1886;
    float _1943 = _1901 * _1941;
    float _1945 = _1901 * _1939;
    float _1947 = _1911 * _1941;
    float _1949 = fma(_1907, _1943, _1895);
    float _1951 = fma(_1909, _1943, _1897);
    float _1953 = fma(_1901, _1947, _1899);
    out.m_79.x = _1949;
    out.m_79.y = _1951;
    out.m_79.z = _1953;
    out.m_79.w = _1945;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

