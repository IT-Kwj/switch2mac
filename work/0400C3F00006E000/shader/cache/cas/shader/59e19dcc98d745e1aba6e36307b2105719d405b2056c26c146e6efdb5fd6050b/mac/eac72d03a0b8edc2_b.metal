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
    float4 m_55 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1704 = false;
    bool _1018 = false;
    bool _764 = false;
    bool _586 = false;
    bool _420 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2264 = as_type<float>(_104);
        out.gl_Position.z = _2264;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2333 = as_type<float>(_140);
        out.gl_Position.z = _2333;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_51.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _146 * _144;
    float _166 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _168 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _170 = _166 * _158;
    float _172 = floor(_168);
    float _174 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].y, _170);
    float _176 = _168 * 6.283185482025146484375;
    float _178 = _174 * 6.283185482025146484375;
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = _178 * 0.15915493667125701904296875;
    float _190 = floor(_174);
    float _192 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _194 = 1.4012984643248170709237295832899e-45;
    float _196 = _192;
    if (!_156)
    {
        float _198 = _192 * _192;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = -_172;
    float _206 = _168 + _204;
    float _208 = _180 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = _202;
    if (!_156)
    {
        float _214 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    float _218 = _188 * 6.283185482025146484375;
    float _220 = cos(_218);
    float _222 = -_190;
    float _224 = _174 + _222;
    bool _226 = !_156;
    float _228 = _216;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _192 * _232;
        float _242 = 1.0 / _236;
        float _244 = _238 * 0.693147182464599609375;
        float _246 = exp2(_240);
        float _248 = 1.0 / _244;
        float _250 = _246 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _248, _192);
        float _256 = _254 * _242;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _258;
    }
    float _260 = _228;
    bool _262 = !_156;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _192 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _196 = _282;
    }
    float _284 = _196;
    float _286 = in.m_53.w;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    float _294 = fma(_220, 0.5, 0.5);
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _302 = _300 != 0;
    float _304 = fma(_210, 0.5, 0.5);
    bool _306 = _206 < 0.5;
    float _308 = float(_306);
    float _310 = -_294;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _314 = -_206;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _318 = !_298;
    int _320 = _318 ? 0 : 1;
    float _322 = -_224;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _326 = _224 < 0.5;
    float _328 = float(_326);
    float _330 = -_308;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _334 = -_304;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _338 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _342 = abs(_320);
    float _344 = -_328;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _348 = !_162;
    int _350 = _348 ? 0 : 1;
    float _352 = fma(_284, _182, _338);
    float _354 = fma(_284, _184, _340);
    bool _356 = !_302;
    int _358 = _356 ? 0 : 1;
    float _360 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _362 = abs(_350);
    float _364 = fma(_352, _286, _288);
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _368 = fma(_284, _186, _360);
    int _370 = abs(_358);
    float _372 = fma(_354, _286, _290);
    float _374 = float(_342);
    float _376 = fma(_368, _286, _292);
    float _378 = float(_362);
    float _380 = abs(_316);
    float _382 = _374 * _380;
    float _384 = abs(_324);
    float _386 = _374 * _384;
    float _388 = float(_370);
    float _390 = fma(_378, _336, _382);
    float _392 = fma(_378, _312, _386);
    float _394 = abs(_332);
    float _396 = fma(_388, _394, _390);
    float _398 = abs(_346);
    float _400 = fma(_388, _398, _392);
    bool _402 = !_366;
    float _418;
    if (!_402)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _406 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _418 = _416;
        _420 = true;
    }
    else
    {
        float _422 = float(_88);
        float _424 = 1.0 / _422;
        float _426 = _122 * _424;
        _418 = _426;
    }
    _420 = false;
    float _428 = _418;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _432 = _428 + _430;
    bool _434 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _436 = isnan(_428);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _448 = _428 + _446;
    bool _450 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _452 = isnan(_428);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_428);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_444;
    float _484 = _482 + 1.0;
    float _486 = 1.0 / _468;
    float _488 = _480 * _484;
    float _490 = -_480;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _494;
    bool _498 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _500 = 1.0 / _464;
    float _502 = _460 * _492;
    float _504 = -_460;
    float _506 = _504 + 1.0;
    float _508 = _448 * _486;
    float _510 = _432 * _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _516;
    float _520 = fma(_496, _510, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _522 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _524 = fma(_518, _510, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _526 = _520 * _502;
    float _528 = _522 * _502;
    float _530 = _524 * _502;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].x, _526);
    float _546 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].y, _528);
    float _548 = fma(_534, _508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _550 = fma(_538, _508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _552 = fma(_542, _508, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _554 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _556 = fma(_548, _488, _544);
    float _558 = fma(_550, _488, _546);
    float _560 = fma(_552, _488, _554);
    float _562 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].x, _556);
    float _564 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].y, _558);
    float _566 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].z, _560);
    bool _568 = !_498;
    float _584;
    if (!_568)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _572 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_88);
        float _590 = 1.0 / _588;
        float _592 = _122 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = in.m_53.x;
    float _598 = in.m_53.y;
    float _600 = in.m_53.z;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _604 = _594 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _614 = 1.0 / _608;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _618 = 1.0 / _612;
    float _620 = _564 * _598;
    bool _622 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _624 = isnan(_594);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _604 * _614;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _638 = _594 + _636;
    bool _640 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _642 = isnan(_594);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _566 * _600;
    bool _654 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _656 = isnan(_594);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_632;
    float _668 = _666 + 1.0;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _670;
    float _674 = _562 * _596;
    float _676 = _664 * _668;
    float _678 = -_664;
    float _680 = _678 + 1.0;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _686;
    float _690 = fma(_672, _634, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _692 = _650 * _680;
    float _694 = fma(_684, _634, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _696 = fma(_688, _634, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _698 = _638 * _618;
    float _700 = _690 * _692;
    float _702 = _694 * _692;
    float _704 = _696 * _692;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _710 = -_650;
    float _712 = _710 + 1.0;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _722 = fma(_708, _698, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _724 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].x, _700);
    float _726 = fma(_716, _698, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _728 = fma(_720, _698, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _730 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].y, _702);
    float _732 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].z, _704);
    float _734 = fma(_722, _676, _724);
    float _736 = fma(_726, _676, _730);
    float _738 = fma(_728, _676, _732);
    float _740 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[109].x, _734);
    float _742 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[109].y, _736);
    float _744 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[109].z, _738);
    bool _746 = !_616;
    float _762;
    if (!_746)
    {
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _750 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _754 = _752 * _748;
        float _756 = floor(_754);
        float _758 = -_756;
        float _760 = _754 + _758;
        _762 = _760;
        _764 = true;
    }
    else
    {
        float _766 = float(_88);
        float _768 = 1.0 / _766;
        float _770 = _122 * _768;
        _762 = _770;
    }
    _764 = false;
    float _772 = _762;
    float _774 = _740 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _776 = _742 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _782 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _784 = isnan(_772);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _794;
    float _798 = 1.0 / _780;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _804 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _806 = isnan(_772);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -_792;
    float _818 = _816 + 1.0;
    bool _820 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _822 = isnan(_772);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _836 = -_814;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _802;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _772 + _842;
    float _846 = _830 * _838;
    float _848 = _744 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _850 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _854 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _856 = _796 * _798;
    float _858 = _814 * _818;
    bool _860 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _862 = isnan(_772);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -_830;
    float _874 = _872 + 1.0;
    float _876 = 1.0 / _834;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _882 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _884 = isnan(_772);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -_870;
    float _896 = _894 + 1.0;
    float _898 = _870 * _874;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _904 = fma(_856, _844, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _910 = 1.0 / _880;
    float _912 = _892 * _896;
    float _914 = _908 * _840;
    float _916 = -_892;
    float _918 = _916 + 1.0;
    float _920 = _904 * _912;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _924 = _772 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _930 = 1.0 / _902;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _932;
    float _936 = fma(_914, _924, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _938 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[115].x, _920);
    float _940 = _934 * _876;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _944 = _772 + _942;
    bool _946 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _948 = isnan(_772);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _928 * _910;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _960;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _966 = _772 + _964;
    float _968 = fma(_940, _944, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _970 = fma(_936, _898, _938);
    float _972 = -_956;
    float _974 = _972 + 1.0;
    float _976 = fma(_958, _966, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _980 = _772 + _978;
    float _982 = _962 * _930;
    float _984 = fma(_968, _846, _970);
    float _986 = _792 * _974;
    float _988 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _990 = fma(_982, _980, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _992 = fma(_976, _858, _984);
    float _994 = fma(_990, _986, _992);
    float _996 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[120].x, _994);
    float _998 = _996 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _850;
    out.m_55.y = _852;
    out.m_55.z = _988;
    out.m_55.w = _998;
    bool _1000 = !_854;
    float _1016;
    if (!_1000)
    {
        float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1004 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _1008 = _1006 * _1002;
        float _1010 = floor(_1008);
        float _1012 = -_1010;
        float _1014 = _1008 + _1012;
        _1016 = _1014;
        _1018 = true;
    }
    else
    {
        float _1020 = float(_88);
        float _1022 = 1.0 / _1020;
        float _1024 = _122 * _1022;
        _1016 = _1024;
    }
    _1018 = false;
    float _1026 = _1016;
    float _1028 = in.m_57.y;
    float _1030 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1032 = in.m_51.y;
    float _1034 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1036;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1042 = _1040 != 0;
    float _1044 = in.m_57.x;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1048 = _1046 != 0;
    float _1050 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1052 = 1.0 / _1038;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1058 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1030);
    float _1060 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1034);
    float _1062 = 1.0 / _1056;
    bool _1064 = _142 > 0.5;
    bool _1066 = _1064 && _1042;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1070 = _1026 + _1068;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1074 = _1032 > 0.5;
    float _1076 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1050);
    float _1078 = -_1028;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1084 = _1026 + _1082;
    float _1086 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1058);
    float _1088 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1060);
    float _1090 = _1028;
    if (_1048)
    {
        float _1092 = _1074 ? _1080 : _1028;
        _1090 = _1092;
    }
    float _1094 = _1090;
    float _1096 = _1084 * _1052;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1098;
    float _1102 = _1070 * _1062;
    float _1104 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1076);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1106;
    float _1110 = fma(_1100, _1096, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1116 = _1026 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1118 = isnan(_1026);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1128;
    float _1132 = fma(_1108, _1096, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1134 = fma(_1114, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1136 = _1026 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1138 = isnan(_1026);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = fma(_1130, _1096, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1150 = -_1126;
    float _1152 = _1150 + 1.0;
    float _1154 = _1096;
    if (_1042)
    {
        _1154 = _1044;
    }
    float _1156 = _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1166 = _1146 * _1152;
    float _1168 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1170 = _1156;
    float _1172 = _1160;
    float _1174 = _1168;
    if (_1066)
    {
        float _1176 = -_1156;
        float _1178 = _1176 + 1.0;
        _1170 = _1178;
    }
    float _1180 = _1170;
    float _1182 = fma(_1160, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1184 = _1026 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1186 = isnan(_1026);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1192 = _1188 || _1190;
    float _1194 = float(_1192);
    float _1196 = fma(_1164, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1198 = -_1146;
    float _1200 = _1198 + 1.0;
    float _1202 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1206 = _1168 + _1204;
    if (!_1042)
    {
        _1172 = _1044;
    }
    float _1208 = _1172;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1212 = _1208;
    if (_1042)
    {
        _1212 = _1180;
    }
    float _1214 = _1212;
    float _1216 = _1194 * _1200;
    float _1218 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1202 + _1220;
    float _1224 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1226 = -_1194;
    float _1228 = _1226 + 1.0;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1232 = _1218 + _1230;
    float _1234 = _1148 * _1216;
    float _1236 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1224);
    float _1238 = _1110 * _1216;
    float _1240 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1242 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1234);
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1236);
    float _1246 = _1206 * _1206;
    float _1248 = _1132 * _1216;
    float _1250 = _1240 * _1072;
    float _1252 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1238);
    bool _1254 = _1244 >= 0.0;
    float _1256 = fma(_1222, _1222, _1246);
    float _1258 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1248);
    float _1260 = fma(_1182, _1166, _1252);
    float _1262 = fma(_1134, _1166, _1242);
    float _1264 = fma(_1232, _1232, _1256);
    float _1266 = fma(_1196, _1166, _1258);
    float _1268 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1260);
    float _1270 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1262);
    float _1272 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1274 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1266);
    float _1276 = rsqrt(_1264);
    float _1278 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1280 = _1246;
    if (_1254)
    {
        _1280 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1282 = _1280;
    float _1284 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1286 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = _1272 * _1210;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1292 = as_type<int>(_1282);
    if (_1254)
    {
        float _1294 = _1282 * 5.0;
        _1292 = as_type<int>(_1294);
    }
    int _1296 = _1292;
    float _1298 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1250;
    out.m_61.y = _1288;
    float _1304 = _1206 * _1276;
    float _1306 = as_type<float>(_1296);
    if (_1254)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4205 = as_type<float>(_1296);
        out.gl_Position.z = _4205;
    }
    if (_1254)
    {
        out.m_47.x = 0.0;
    }
    float _1308 = _1222 * _1276;
    out.m_63.x = _1298;
    out.m_63.y = _1300;
    out.m_63.z = _1302;
    out.m_63.w = _1290;
    if (_1254)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1310 = -_1304;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1168);
    float _1314 = _1232 * _1276;
    float _1316 = -_1308;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1312 + _1320;
    float _1324 = -_1314;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1330 = _1318 + _1328;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1336 = _1326 + _1334;
    float _1338 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1332);
    float _1340 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1338);
    bool _1342 = _1340 >= 0.0;
    if (_1342)
    {
        _1306 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1344 = _1306;
    int _1346 = as_type<int>(_1344);
    if (_1342)
    {
        out.m_47.x = 0.0;
    }
    if (_1342)
    {
        float _1348 = _1344 * 5.0;
        _1346 = as_type<int>(_1348);
    }
    int _1350 = _1346;
    if (_1342)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4310 = as_type<float>(_1350);
        out.gl_Position.z = _4310;
    }
    if (_1342)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1352 = -_1304;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1206);
    float _1356 = -_1308;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1360 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1362 = _1354 * _1354;
    float _1364 = -_1314;
    float _1366 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1368 = _396 * _674;
    float _1370 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1360);
    float _1372 = fma(_1358, _1358, _1362);
    float _1374 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1376 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1370);
    float _1378 = fma(_1366, _1366, _1372);
    float _1380 = in.m_65.x;
    float _1382 = in.m_65.y;
    float _1384 = in.m_65.z;
    float _1386 = rsqrt(_1376);
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[660].x * 0.01745329238474369049072265625;
    float _1390 = _1388 * 0.15915493667125701904296875;
    float _1392 = sqrt(_1378);
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1396 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1400 = _400 * _620;
    float _1402 = _1394 * _1394;
    float _1404 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1382);
    float _1408 = _1390 * 6.283185482025146484375;
    float _1410 = cos(_1408);
    float _1412 = fma(_1396, _1396, _1402);
    float _1414 = _1276 * _1392;
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1418 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1380);
    float _1420 = fma(_1398, _1398, _1412);
    float _1422 = _1414 * _1404;
    float _1424 = _1414 * _1416;
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1384);
    float _1428 = _1414 * _1374;
    float _1430 = _1418 * _1422;
    float _1432 = rsqrt(_1420);
    float _1434 = _1406 * _1424;
    float _1436 = _1426 * _1428;
    float _1438 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1440 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1442 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1444 = _1390 * 6.283185482025146484375;
    float _1446 = sin(_1444);
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1438);
    float _1450 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1440);
    float _1452 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1442);
    float _1454 = -_1410;
    float _1456 = _1454 + 1.0;
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1448);
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1450);
    float _1462 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1452);
    float _1464 = _1396 * _1432;
    float _1466 = _1398 * _1432;
    float _1468 = _1394 * _1432;
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1472 = _1464 * _1456;
    float _1474 = _1466 * _1466;
    float _1476 = _1458 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1478 = _1466 * _1446;
    float _1480 = _1464 * _1446;
    float _1482 = _1468 * _1446;
    float _1484 = _1468 * _1456;
    float _1486 = -_1478;
    float _1488 = fma(_1468, _1472, _1486);
    float _1490 = fma(_1464, _1472, _1410);
    float _1492 = fma(_1466, _1484, _1480);
    float _1494 = _1470 * _1488;
    float _1496 = fma(_1456, _1474, _1410);
    float _1498 = -_1482;
    float _1500 = fma(_1466, _1472, _1498);
    float _1502 = _1470 * _1492;
    float _1504 = fma(_1476, _1490, _1494);
    float _1506 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1508 = fma(_1466, _1472, _1482);
    float _1510 = fma(_1476, _1500, _1502);
    float _1512 = fma(_1468, _1484, _1410);
    float _1514 = fma(_1468, _1472, _1478);
    float _1516 = fma(_1506, _1508, _1504);
    float _1518 = fma(_1506, _1496, _1510);
    float _1520 = _1470 * _1512;
    float _1522 = -_1480;
    float _1524 = fma(_1466, _1484, _1522);
    float _1526 = _1202 + _1516;
    float _1528 = _1218 + _1518;
    float _1530 = fma(_1476, _1514, _1520);
    float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1534 = _1526 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1538 = _1528 + _1536;
    float _1540 = fma(_1506, _1524, _1530);
    float _1542 = _1534 * _1534;
    float _1544 = _1538 * _1538;
    float _1546 = _1168 + _1540;
    float _1548 = _1542 + _1544;
    float _1550 = sqrt(_1548);
    bool _1552 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = _1466;
    float _1556 = _1540;
    float _1558 = _1506;
    float _1560 = _1514;
    float _1562 = _1512;
    float _1564 = _1534;
    if (!_1552)
    {
        _1554 = _1544;
    }
    float _1566 = _1554;
    float _1568 = _1566;
    if (!_1552)
    {
        _1556 = _1542;
    }
    float _1570 = _1556;
    float _1572 = _1570;
    if (!_1552)
    {
        _1558 = _1526;
    }
    float _1574 = _1558;
    float _1576 = _1574;
    if (!_1552)
    {
        _1560 = _1528;
    }
    float _1578 = _1560;
    float _1580 = _1578;
    if (!_1552)
    {
        _1562 = _1546;
    }
    float _1582 = _1562;
    bool _1584 = !_1552;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1550 + _1590;
        float _1594 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = rsqrt(_1548);
        float _1598 = _1592 * _1588;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1596 * _1610;
        float _1614 = _1608 + (-1.0);
        float _1616 = fma(_1534, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1618 = fma(_1538, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1624 = _1616 + _1622;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = fma(_1546, _1608, _1620);
        float _1632 = _1624 * _1624;
        float _1634 = _1628 * _1628;
        _1586 = _1630;
        _1572 = _1632;
        _1568 = _1634;
        _1576 = _1616;
        _1580 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1572;
    float _1640 = _1568;
    float _1642 = _1576;
    float _1644 = _1580;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    out.m_55.x = _850;
    out.m_55.y = _852;
    out.m_55.z = _988;
    out.m_55.w = _998;
    float _1650 = fma(_1648, _1648, _1638);
    out.m_63.x = _1298;
    out.m_63.y = _1300;
    out.m_63.z = _1302;
    out.m_63.w = _1290;
    float _1652 = _1650 + _1640;
    float _1654 = sqrt(_1652);
    bool _1656 = _1654 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1658 = isnan(_1654);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1664 = _1660 || _1662;
    float _1666 = _1650;
    float _1668 = _1648;
    if (!_1664)
    {
        _1666 = 1.0;
    }
    float _1670 = _1666;
    bool _1672 = !_1664;
    float _1674 = _1670;
    if (!_1672)
    {
        bool _1676 = _1654 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1678 = isnan(_1654);
        bool _1680 = _1676 || _1678;
        bool _1682 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1684 = _1680 || _1682;
        if (!_1684)
        {
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1688 = _1654 + _1686;
            float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1692 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1690;
            float _1694 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1696 = _1694 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1698 = 1.0 / _1692;
            float _1700 = _1688 * _1698;
            float _1702 = fma(_1700, _1696, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1674 = _1702;
            _1704 = true;
        }
        else
        {
            bool _1706 = _1654 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1708 = isnan(_1654);
            bool _1710 = _1706 || _1708;
            bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1714 = _1710 || _1712;
            if (!_1714)
            {
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1718 = _1654 + _1716;
                float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1726 = _1724 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1728 = 1.0 / _1722;
                float _1730 = _1718 * _1728;
                float _1732 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1674 = _1732;
                _1704 = true;
            }
            else
            {
                _1674 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1704 = false;
    float _1734 = _1674;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1738 = _1642 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1742 = _1636 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1746 = _1644 + _1744;
    bool _1748 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan(0.5);
    bool _1756 = _1752 || _1754;
    float _1758 = fma(_1738, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1760 = fma(_1742, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1762 = fma(_1746, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1764 = -_1308;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1758);
    float _1768 = -_1304;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1760);
    float _1772 = -_1314;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1762);
    float _1776 = _1770;
    float _1778 = _1766;
    float _1780 = _1774;
    float _1782 = _1762;
    if (!_1756)
    {
        float _1784 = _1322 * _1322;
        float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1788 = -_1218;
        float _1790 = _1788 + _1762;
        float _1792 = -_1202;
        float _1794 = _1792 + _1758;
        float _1796 = fma(_1330, _1330, _1784);
        float _1798 = -_1168;
        float _1800 = _1798 + _1760;
        float _1802 = fma(_1336, _1336, _1796);
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1806 = sqrt(_1802);
        float _1808 = 1.0 / _1414;
        float _1810 = precise::min(_1806, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1812 = _1810 * _1786;
        float _1814 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1816 = _1812 * _1808;
        float _1818 = _1814 * _1816;
        float _1820 = _1790 * _1816;
        float _1822 = fma(_1794, _1818, _1318);
        float _1824 = fma(_1800, _1818, _1312);
        float _1826 = fma(_1814, _1820, _1326);
        _1776 = _1824;
        _1778 = _1822;
        _1780 = _1826;
        _1174 = _1800;
    }
    float _1828 = _1776;
    float _1830 = _1778;
    float _1832 = _1780;
    float _1834 = _1174;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1838 = _1828 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1842 = _1830 + _1840;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1846 = _1832 + _1844;
    float _1848 = _1838 * _1838;
    float _1850 = fma(_1842, _1842, _1848);
    float _1852 = fma(_1846, _1846, _1850);
    float _1854 = rsqrt(_1852);
    float _1856 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1858 = _1842 * _1856;
    float _1860 = _1846 * _1856;
    float _1862 = _1858 * _1858;
    float _1864 = _1860 * _1860;
    float _1866 = _1862 + _1864;
    float _1868 = sqrt(_1866);
    bool _1870 = _1868 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1874 = _1868 + _1872;
    float _1876 = _1846;
    float _1878 = _1874;
    float _1880 = _1834;
    float _1882 = _1858;
    if (_1870)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1884;
    }
    float _1886 = _1876;
    if (_1870)
    {
        float _1888 = rsqrt(_1866);
        _1782 = _1888;
    }
    float _1890 = _1782;
    float _1892 = _1890;
    if (_1870)
    {
        float _1894 = _1874 * _1886;
        _1878 = _1894;
    }
    float _1896 = _1878;
    if (_1870)
    {
        float _1898 = _1896 * 0.15915493667125701904296875;
        _1564 = _1898;
    }
    float _1900 = _1564;
    float _1902 = _1848;
    if (_1870)
    {
        float _1904 = _1900 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        _1902 = _1906;
    }
    float _1908 = _1902;
    float _1910 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1912 = precise::max(0.0, _1910);
    float _1914 = _1854;
    float _1916 = _1912;
    float _1918 = _1910;
    if (_1870)
    {
        float _1920 = _1900 * 6.283185482025146484375;
        float _1922 = cos(_1920);
        _1914 = _1922;
    }
    float _1924 = _1914;
    float _1926 = -_1856;
    float _1928 = -_1912;
    float _1930 = fma(_1838, _1926, _1928);
    if (!_1870)
    {
        _1916 = _1862;
    }
    float _1932 = _1916;
    float _1934 = _1932;
    if (_1870)
    {
        float _1936 = _1930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1918 = _1936;
    }
    float _1938 = _1918;
    float _1940 = sqrt(_1852);
    float _1942 = _1908;
    float _1944 = _1938;
    if (_1870)
    {
        float _1946 = fma(_1908, _1938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1942 = _1946;
    }
    float _1948 = _1942;
    float _1950 = _1948;
    if (_1870)
    {
        float _1952 = _1924 + (-1.0);
        _1944 = _1952;
    }
    float _1954 = _1944;
    float _1956 = _1954;
    if (_1870)
    {
        float _1958 = _1890 * _1948;
        _1880 = _1958;
    }
    float _1960 = _1880;
    if (!_1870)
    {
        _1892 = _1930;
    }
    float _1962 = _1892;
    float _1964 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1966 = _1962;
    if (_1870)
    {
        float _1968 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1668 = _1968;
    }
    float _1970 = _1668;
    if (_1870)
    {
        float _1972 = _1858 * _1960;
        _1882 = _1972;
    }
    float _1974 = _1882;
    if (!_1870)
    {
        _1950 = _1860;
    }
    float _1976 = _1950;
    float _1978 = _1976;
    if (_1870)
    {
        float _1980 = _1860 * _1960;
        _1978 = _1980;
    }
    float _1982 = _1978;
    if (_1870)
    {
        float _1984 = fma(_1930, _1924, _1970);
        _1966 = _1984;
    }
    float _1986 = _1966;
    if (_1870)
    {
        float _1988 = _1974 * _1974;
        _1934 = _1988;
    }
    float _1990 = _1934;
    if (!_1870)
    {
        _1956 = _1864;
    }
    float _1992 = _1956;
    float _1994 = _1992;
    if (_1870)
    {
        float _1996 = _1982 * _1982;
        _1994 = _1996;
    }
    float _1998 = _1994;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2002 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2000);
    float _2004 = precise::clamp(_2002, 0.0, 1.0);
    float _2006 = fma(_1986, _1986, _1990);
    float _2008 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1964);
    float _2010 = -_2004;
    float _2012 = _2010 + 1.0;
    float _2014 = _2006 + _1998;
    float _2016 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2018 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2020 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2022 = rsqrt(_2014);
    float _2024 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2016);
    float _2026 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2028 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2018);
    float _2030 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2024);
    float _2032 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2026);
    float _2034 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2036 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2032);
    float _2038 = abs(_2012);
    float _2040 = log2(_2038);
    float _2042 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2028);
    float _2044 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2046 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2048 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2008);
    float _2050 = _2022 * _1974;
    float _2052 = -_2044;
    float _2054 = fma(_2052, _2020, 1.0);
    float _2056 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2058 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2060 = _2022 * _1986;
    float _2062 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = _2022 * _1982;
    float _2066 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2058);
    float _2068 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2070 = -_2062;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = log2(_2054);
    float _2076 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2066);
    float _2078 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2080 = -_2064;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2084 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2086 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2076);
    float _2088 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2090 = fma(_2082, -0.5, 0.5);
    float _2092 = exp2(_2078);
    float _2094 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2084);
    float _2096 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2088);
    float _2098 = fma(_2082, 0.5, 0.5);
    float _2100 = _2060 + 1.0;
    float _2102 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2104 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2096);
    float _2106 = fma(_2098, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2108 = 1.0 / _2086;
    float _2110 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2102);
    float _2112 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2114 = fma(_2098, _2106, -0.212114393711090087890625);
    float _2116 = _2074 * 0.693147182464599609375;
    float _2118 = fma(_2098, _2114, 1.570728778839111328125);
    float _2120 = sqrt(_2090);
    float _2122 = -_2060;
    float _2124 = fma(_2092, _2100, _2122);
    float _2126 = fma(_2124, 0.5, 0.5);
    float _2128 = _2110 * _2108;
    float _2130 = _2112 * _2108;
    float _2132 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = fma(_2128, 0.5, 0.5);
    float _2136 = fma(_2130, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float3 _5623 = float3(_2134, _2136, _2132);
    float _2140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5623, float3(0.0), isnan(_5623)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5623, float3(0.0), isnan(_5623)), level(0.0)).x;
    float3 _5634 = float3(_2134, _2136, _2132);
    float4 _2143 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5634, float3(0.0), isnan(_5634)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5634, float3(0.0), isnan(_5634)), level(0.0)).xyzw;
    float _2145 = _2143.x;
    float _2147 = _2143.y;
    float _2149 = _2143.z;
    float _2151 = _2143.w;
    float _2153 = -_2118;
    float _2155 = fma(_2138, _2153, 1.0);
    float2 _5656 = float2(_2155, _2126);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5656, float2(0.0), isnan(_5656)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5656, float2(0.0), isnan(_5656)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2169 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2171 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2169);
    float _2173 = exp2(_2167);
    float _2175 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2171);
    float _2177 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2175);
    float _2179 = _2177 + _2086;
    float _2181 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2110;
    out.gl_Position.y = _2112;
    out.gl_Position.z = _2177;
    out.gl_Position.w = _2086;
    float _2183 = _2179 * 0.5;
    float _2185 = -_2173;
    float _2187 = _2185 + 1.0;
    out.m_47.x = _2181;
    float _2189 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2183;
    out.m_67.w = _2086;
    float _2191 = _2189 * _2140;
    float _2193 = -_2189;
    float _2195 = _2193 + 1.0;
    float _2197 = _2151 * _2191;
    float _2199 = _2151 * _2195;
    float _2201 = _2165 * _2191;
    float _2203 = fma(_2161, _2197, _2145);
    float _2205 = fma(_2163, _2197, _2147);
    float _2207 = fma(_2151, _2201, _2149);
    out.m_69.x = _2203;
    out.m_69.y = _2205;
    out.m_69.z = _2207;
    out.m_69.w = _2199;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1704 = false;
    bool _1018 = false;
    bool _764 = false;
    bool _586 = false;
    bool _420 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2264 = as_type<float>(_104);
        out.gl_Position.z = _2264;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2333 = as_type<float>(_140);
        out.gl_Position.z = _2333;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_51.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _146 * _144;
    float _166 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _168 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _170 = _166 * _158;
    float _172 = floor(_168);
    float _174 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].y, _170);
    float _176 = _168 * 6.283185482025146484375;
    float _178 = _174 * 6.283185482025146484375;
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = _178 * 0.15915493667125701904296875;
    float _190 = floor(_174);
    float _192 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _194 = 1.4012984643248170709237295832899e-45;
    float _196 = _192;
    if (!_156)
    {
        float _198 = _192 * _192;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = -_172;
    float _206 = _168 + _204;
    float _208 = _180 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = _202;
    if (!_156)
    {
        float _214 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    float _218 = _188 * 6.283185482025146484375;
    float _220 = cos(_218);
    float _222 = -_190;
    float _224 = _174 + _222;
    bool _226 = !_156;
    float _228 = _216;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _192 * _232;
        float _242 = 1.0 / _236;
        float _244 = _238 * 0.693147182464599609375;
        float _246 = exp2(_240);
        float _248 = 1.0 / _244;
        float _250 = _246 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _248, _192);
        float _256 = _254 * _242;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _258;
    }
    float _260 = _228;
    bool _262 = !_156;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _192 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _196 = _282;
    }
    float _284 = _196;
    float _286 = in.m_53.w;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    float _294 = fma(_220, 0.5, 0.5);
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _302 = _300 != 0;
    float _304 = fma(_210, 0.5, 0.5);
    bool _306 = _206 < 0.5;
    float _308 = float(_306);
    float _310 = -_294;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _314 = -_206;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _318 = !_298;
    int _320 = _318 ? 0 : 1;
    float _322 = -_224;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _326 = _224 < 0.5;
    float _328 = float(_326);
    float _330 = -_308;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _334 = -_304;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _338 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _342 = abs(_320);
    float _344 = -_328;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _348 = !_162;
    int _350 = _348 ? 0 : 1;
    float _352 = fma(_284, _182, _338);
    float _354 = fma(_284, _184, _340);
    bool _356 = !_302;
    int _358 = _356 ? 0 : 1;
    float _360 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _362 = abs(_350);
    float _364 = fma(_352, _286, _288);
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _368 = fma(_284, _186, _360);
    int _370 = abs(_358);
    float _372 = fma(_354, _286, _290);
    float _374 = float(_342);
    float _376 = fma(_368, _286, _292);
    float _378 = float(_362);
    float _380 = abs(_316);
    float _382 = _374 * _380;
    float _384 = abs(_324);
    float _386 = _374 * _384;
    float _388 = float(_370);
    float _390 = fma(_378, _336, _382);
    float _392 = fma(_378, _312, _386);
    float _394 = abs(_332);
    float _396 = fma(_388, _394, _390);
    float _398 = abs(_346);
    float _400 = fma(_388, _398, _392);
    bool _402 = !_366;
    float _418;
    if (!_402)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _406 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _418 = _416;
        _420 = true;
    }
    else
    {
        float _422 = float(_88);
        float _424 = 1.0 / _422;
        float _426 = _122 * _424;
        _418 = _426;
    }
    _420 = false;
    float _428 = _418;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _432 = _428 + _430;
    bool _434 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _436 = isnan(_428);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _448 = _428 + _446;
    bool _450 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _452 = isnan(_428);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_428);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_444;
    float _484 = _482 + 1.0;
    float _486 = 1.0 / _468;
    float _488 = _480 * _484;
    float _490 = -_480;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _494;
    bool _498 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _500 = 1.0 / _464;
    float _502 = _460 * _492;
    float _504 = -_460;
    float _506 = _504 + 1.0;
    float _508 = _448 * _486;
    float _510 = _432 * _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _516;
    float _520 = fma(_496, _510, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _522 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _524 = fma(_518, _510, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _526 = _520 * _502;
    float _528 = _522 * _502;
    float _530 = _524 * _502;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].x, _526);
    float _546 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].y, _528);
    float _548 = fma(_534, _508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _550 = fma(_538, _508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _552 = fma(_542, _508, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _554 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _556 = fma(_548, _488, _544);
    float _558 = fma(_550, _488, _546);
    float _560 = fma(_552, _488, _554);
    float _562 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].x, _556);
    float _564 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].y, _558);
    float _566 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].z, _560);
    bool _568 = !_498;
    float _584;
    if (!_568)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _572 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_88);
        float _590 = 1.0 / _588;
        float _592 = _122 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = in.m_53.x;
    float _598 = in.m_53.y;
    float _600 = in.m_53.z;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _604 = _594 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _614 = 1.0 / _608;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _618 = 1.0 / _612;
    float _620 = _564 * _598;
    bool _622 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _624 = isnan(_594);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _604 * _614;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _638 = _594 + _636;
    bool _640 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _642 = isnan(_594);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _566 * _600;
    bool _654 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _656 = isnan(_594);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_632;
    float _668 = _666 + 1.0;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _670;
    float _674 = _562 * _596;
    float _676 = _664 * _668;
    float _678 = -_664;
    float _680 = _678 + 1.0;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _686;
    float _690 = fma(_672, _634, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _692 = _650 * _680;
    float _694 = fma(_684, _634, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _696 = fma(_688, _634, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _698 = _638 * _618;
    float _700 = _690 * _692;
    float _702 = _694 * _692;
    float _704 = _696 * _692;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _710 = -_650;
    float _712 = _710 + 1.0;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _722 = fma(_708, _698, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _724 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].x, _700);
    float _726 = fma(_716, _698, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _728 = fma(_720, _698, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _730 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].y, _702);
    float _732 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].z, _704);
    float _734 = fma(_722, _676, _724);
    float _736 = fma(_726, _676, _730);
    float _738 = fma(_728, _676, _732);
    float _740 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[109].x, _734);
    float _742 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[109].y, _736);
    float _744 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[109].z, _738);
    bool _746 = !_616;
    float _762;
    if (!_746)
    {
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _750 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _754 = _752 * _748;
        float _756 = floor(_754);
        float _758 = -_756;
        float _760 = _754 + _758;
        _762 = _760;
        _764 = true;
    }
    else
    {
        float _766 = float(_88);
        float _768 = 1.0 / _766;
        float _770 = _122 * _768;
        _762 = _770;
    }
    _764 = false;
    float _772 = _762;
    float _774 = _740 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _776 = _742 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _782 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _784 = isnan(_772);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _794;
    float _798 = 1.0 / _780;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _804 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _806 = isnan(_772);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -_792;
    float _818 = _816 + 1.0;
    bool _820 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _822 = isnan(_772);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _836 = -_814;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _802;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _772 + _842;
    float _846 = _830 * _838;
    float _848 = _744 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _850 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _854 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _856 = _796 * _798;
    float _858 = _814 * _818;
    bool _860 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _862 = isnan(_772);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -_830;
    float _874 = _872 + 1.0;
    float _876 = 1.0 / _834;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _882 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _884 = isnan(_772);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -_870;
    float _896 = _894 + 1.0;
    float _898 = _870 * _874;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _904 = fma(_856, _844, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _910 = 1.0 / _880;
    float _912 = _892 * _896;
    float _914 = _908 * _840;
    float _916 = -_892;
    float _918 = _916 + 1.0;
    float _920 = _904 * _912;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _924 = _772 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _930 = 1.0 / _902;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _932;
    float _936 = fma(_914, _924, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _938 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[115].x, _920);
    float _940 = _934 * _876;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _944 = _772 + _942;
    bool _946 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _948 = isnan(_772);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _928 * _910;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _960;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _966 = _772 + _964;
    float _968 = fma(_940, _944, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _970 = fma(_936, _898, _938);
    float _972 = -_956;
    float _974 = _972 + 1.0;
    float _976 = fma(_958, _966, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _980 = _772 + _978;
    float _982 = _962 * _930;
    float _984 = fma(_968, _846, _970);
    float _986 = _792 * _974;
    float _988 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _990 = fma(_982, _980, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _992 = fma(_976, _858, _984);
    float _994 = fma(_990, _986, _992);
    float _996 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[120].x, _994);
    float _998 = _996 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _850;
    out.m_55.y = _852;
    out.m_55.z = _988;
    out.m_55.w = _998;
    bool _1000 = !_854;
    float _1016;
    if (!_1000)
    {
        float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1004 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _1008 = _1006 * _1002;
        float _1010 = floor(_1008);
        float _1012 = -_1010;
        float _1014 = _1008 + _1012;
        _1016 = _1014;
        _1018 = true;
    }
    else
    {
        float _1020 = float(_88);
        float _1022 = 1.0 / _1020;
        float _1024 = _122 * _1022;
        _1016 = _1024;
    }
    _1018 = false;
    float _1026 = _1016;
    float _1028 = in.m_57.y;
    float _1030 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1032 = in.m_51.y;
    float _1034 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1036;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1042 = _1040 != 0;
    float _1044 = in.m_57.x;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1048 = _1046 != 0;
    float _1050 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1052 = 1.0 / _1038;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1058 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1030);
    float _1060 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1034);
    float _1062 = 1.0 / _1056;
    bool _1064 = _142 > 0.5;
    bool _1066 = _1064 && _1042;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1070 = _1026 + _1068;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1074 = _1032 > 0.5;
    float _1076 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1050);
    float _1078 = -_1028;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1084 = _1026 + _1082;
    float _1086 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1058);
    float _1088 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1060);
    float _1090 = _1028;
    if (_1048)
    {
        float _1092 = _1074 ? _1080 : _1028;
        _1090 = _1092;
    }
    float _1094 = _1090;
    float _1096 = _1084 * _1052;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1098;
    float _1102 = _1070 * _1062;
    float _1104 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1076);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1106;
    float _1110 = fma(_1100, _1096, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1116 = _1026 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1118 = isnan(_1026);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1128;
    float _1132 = fma(_1108, _1096, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1134 = fma(_1114, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1136 = _1026 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1138 = isnan(_1026);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = fma(_1130, _1096, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1150 = -_1126;
    float _1152 = _1150 + 1.0;
    float _1154 = _1096;
    if (_1042)
    {
        _1154 = _1044;
    }
    float _1156 = _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1166 = _1146 * _1152;
    float _1168 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1170 = _1156;
    float _1172 = _1160;
    float _1174 = _1168;
    if (_1066)
    {
        float _1176 = -_1156;
        float _1178 = _1176 + 1.0;
        _1170 = _1178;
    }
    float _1180 = _1170;
    float _1182 = fma(_1160, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1184 = _1026 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1186 = isnan(_1026);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1192 = _1188 || _1190;
    float _1194 = float(_1192);
    float _1196 = fma(_1164, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1198 = -_1146;
    float _1200 = _1198 + 1.0;
    float _1202 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1206 = _1168 + _1204;
    if (!_1042)
    {
        _1172 = _1044;
    }
    float _1208 = _1172;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1212 = _1208;
    if (_1042)
    {
        _1212 = _1180;
    }
    float _1214 = _1212;
    float _1216 = _1194 * _1200;
    float _1218 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1202 + _1220;
    float _1224 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1226 = -_1194;
    float _1228 = _1226 + 1.0;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1232 = _1218 + _1230;
    float _1234 = _1148 * _1216;
    float _1236 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1224);
    float _1238 = _1110 * _1216;
    float _1240 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1242 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1234);
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1236);
    float _1246 = _1206 * _1206;
    float _1248 = _1132 * _1216;
    float _1250 = _1240 * _1072;
    float _1252 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1238);
    bool _1254 = _1244 >= 0.0;
    float _1256 = fma(_1222, _1222, _1246);
    float _1258 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1248);
    float _1260 = fma(_1182, _1166, _1252);
    float _1262 = fma(_1134, _1166, _1242);
    float _1264 = fma(_1232, _1232, _1256);
    float _1266 = fma(_1196, _1166, _1258);
    float _1268 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1260);
    float _1270 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1262);
    float _1272 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1274 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1266);
    float _1276 = rsqrt(_1264);
    float _1278 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1280 = _1246;
    if (_1254)
    {
        _1280 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1282 = _1280;
    float _1284 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1286 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = _1272 * _1210;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1292 = as_type<int>(_1282);
    if (_1254)
    {
        float _1294 = _1282 * 5.0;
        _1292 = as_type<int>(_1294);
    }
    int _1296 = _1292;
    float _1298 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1250;
    out.m_61.y = _1288;
    float _1304 = _1206 * _1276;
    float _1306 = as_type<float>(_1296);
    if (_1254)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4205 = as_type<float>(_1296);
        out.gl_Position.z = _4205;
    }
    if (_1254)
    {
        out.m_47.x = 0.0;
    }
    float _1308 = _1222 * _1276;
    out.m_63.x = _1298;
    out.m_63.y = _1300;
    out.m_63.z = _1302;
    out.m_63.w = _1290;
    if (_1254)
    {
        return out;
    }
    float _1310 = -_1304;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1168);
    float _1314 = _1232 * _1276;
    float _1316 = -_1308;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1312 + _1320;
    float _1324 = -_1314;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1330 = _1318 + _1328;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1336 = _1326 + _1334;
    float _1338 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1332);
    float _1340 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1338);
    bool _1342 = _1340 >= 0.0;
    if (_1342)
    {
        _1306 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1344 = _1306;
    int _1346 = as_type<int>(_1344);
    if (_1342)
    {
        out.m_47.x = 0.0;
    }
    if (_1342)
    {
        float _1348 = _1344 * 5.0;
        _1346 = as_type<int>(_1348);
    }
    int _1350 = _1346;
    if (_1342)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4310 = as_type<float>(_1350);
        out.gl_Position.z = _4310;
    }
    if (_1342)
    {
        return out;
    }
    float _1352 = -_1304;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1206);
    float _1356 = -_1308;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1360 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1362 = _1354 * _1354;
    float _1364 = -_1314;
    float _1366 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1368 = _396 * _674;
    float _1370 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1360);
    float _1372 = fma(_1358, _1358, _1362);
    float _1374 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1376 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1370);
    float _1378 = fma(_1366, _1366, _1372);
    float _1380 = in.m_65.x;
    float _1382 = in.m_65.y;
    float _1384 = in.m_65.z;
    float _1386 = rsqrt(_1376);
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[660].x * 0.01745329238474369049072265625;
    float _1390 = _1388 * 0.15915493667125701904296875;
    float _1392 = sqrt(_1378);
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1396 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1400 = _400 * _620;
    float _1402 = _1394 * _1394;
    float _1404 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1382);
    float _1408 = _1390 * 6.283185482025146484375;
    float _1410 = cos(_1408);
    float _1412 = fma(_1396, _1396, _1402);
    float _1414 = _1276 * _1392;
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1418 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1380);
    float _1420 = fma(_1398, _1398, _1412);
    float _1422 = _1414 * _1404;
    float _1424 = _1414 * _1416;
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1384);
    float _1428 = _1414 * _1374;
    float _1430 = _1418 * _1422;
    float _1432 = rsqrt(_1420);
    float _1434 = _1406 * _1424;
    float _1436 = _1426 * _1428;
    float _1438 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1440 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1442 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1444 = _1390 * 6.283185482025146484375;
    float _1446 = sin(_1444);
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1438);
    float _1450 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1440);
    float _1452 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1442);
    float _1454 = -_1410;
    float _1456 = _1454 + 1.0;
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1448);
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1450);
    float _1462 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1452);
    float _1464 = _1396 * _1432;
    float _1466 = _1398 * _1432;
    float _1468 = _1394 * _1432;
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1472 = _1464 * _1456;
    float _1474 = _1466 * _1466;
    float _1476 = _1458 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1478 = _1466 * _1446;
    float _1480 = _1464 * _1446;
    float _1482 = _1468 * _1446;
    float _1484 = _1468 * _1456;
    float _1486 = -_1478;
    float _1488 = fma(_1468, _1472, _1486);
    float _1490 = fma(_1464, _1472, _1410);
    float _1492 = fma(_1466, _1484, _1480);
    float _1494 = _1470 * _1488;
    float _1496 = fma(_1456, _1474, _1410);
    float _1498 = -_1482;
    float _1500 = fma(_1466, _1472, _1498);
    float _1502 = _1470 * _1492;
    float _1504 = fma(_1476, _1490, _1494);
    float _1506 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1508 = fma(_1466, _1472, _1482);
    float _1510 = fma(_1476, _1500, _1502);
    float _1512 = fma(_1468, _1484, _1410);
    float _1514 = fma(_1468, _1472, _1478);
    float _1516 = fma(_1506, _1508, _1504);
    float _1518 = fma(_1506, _1496, _1510);
    float _1520 = _1470 * _1512;
    float _1522 = -_1480;
    float _1524 = fma(_1466, _1484, _1522);
    float _1526 = _1202 + _1516;
    float _1528 = _1218 + _1518;
    float _1530 = fma(_1476, _1514, _1520);
    float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1534 = _1526 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1538 = _1528 + _1536;
    float _1540 = fma(_1506, _1524, _1530);
    float _1542 = _1534 * _1534;
    float _1544 = _1538 * _1538;
    float _1546 = _1168 + _1540;
    float _1548 = _1542 + _1544;
    float _1550 = sqrt(_1548);
    bool _1552 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = _1466;
    float _1556 = _1540;
    float _1558 = _1506;
    float _1560 = _1514;
    float _1562 = _1512;
    float _1564 = _1534;
    if (!_1552)
    {
        _1554 = _1544;
    }
    float _1566 = _1554;
    float _1568 = _1566;
    if (!_1552)
    {
        _1556 = _1542;
    }
    float _1570 = _1556;
    float _1572 = _1570;
    if (!_1552)
    {
        _1558 = _1526;
    }
    float _1574 = _1558;
    float _1576 = _1574;
    if (!_1552)
    {
        _1560 = _1528;
    }
    float _1578 = _1560;
    float _1580 = _1578;
    if (!_1552)
    {
        _1562 = _1546;
    }
    float _1582 = _1562;
    bool _1584 = !_1552;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1550 + _1590;
        float _1594 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = rsqrt(_1548);
        float _1598 = _1592 * _1588;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1596 * _1610;
        float _1614 = _1608 + (-1.0);
        float _1616 = fma(_1534, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1618 = fma(_1538, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1624 = _1616 + _1622;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = fma(_1546, _1608, _1620);
        float _1632 = _1624 * _1624;
        float _1634 = _1628 * _1628;
        _1586 = _1630;
        _1572 = _1632;
        _1568 = _1634;
        _1576 = _1616;
        _1580 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1572;
    float _1640 = _1568;
    float _1642 = _1576;
    float _1644 = _1580;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    out.m_55.x = _850;
    out.m_55.y = _852;
    out.m_55.z = _988;
    out.m_55.w = _998;
    float _1650 = fma(_1648, _1648, _1638);
    out.m_63.x = _1298;
    out.m_63.y = _1300;
    out.m_63.z = _1302;
    out.m_63.w = _1290;
    float _1652 = _1650 + _1640;
    float _1654 = sqrt(_1652);
    bool _1656 = _1654 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1658 = isnan(_1654);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1664 = _1660 || _1662;
    float _1666 = _1650;
    float _1668 = _1648;
    if (!_1664)
    {
        _1666 = 1.0;
    }
    float _1670 = _1666;
    bool _1672 = !_1664;
    float _1674 = _1670;
    if (!_1672)
    {
        bool _1676 = _1654 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1678 = isnan(_1654);
        bool _1680 = _1676 || _1678;
        bool _1682 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1684 = _1680 || _1682;
        if (!_1684)
        {
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1688 = _1654 + _1686;
            float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1692 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1690;
            float _1694 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1696 = _1694 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1698 = 1.0 / _1692;
            float _1700 = _1688 * _1698;
            float _1702 = fma(_1700, _1696, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1674 = _1702;
            _1704 = true;
        }
        else
        {
            bool _1706 = _1654 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1708 = isnan(_1654);
            bool _1710 = _1706 || _1708;
            bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1714 = _1710 || _1712;
            if (!_1714)
            {
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1718 = _1654 + _1716;
                float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1726 = _1724 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1728 = 1.0 / _1722;
                float _1730 = _1718 * _1728;
                float _1732 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1674 = _1732;
                _1704 = true;
            }
            else
            {
                _1674 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1704 = false;
    float _1734 = _1674;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1738 = _1642 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1742 = _1636 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1746 = _1644 + _1744;
    bool _1748 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan(0.5);
    bool _1756 = _1752 || _1754;
    float _1758 = fma(_1738, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1760 = fma(_1742, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1762 = fma(_1746, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1764 = -_1308;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1758);
    float _1768 = -_1304;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1760);
    float _1772 = -_1314;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1762);
    float _1776 = _1770;
    float _1778 = _1766;
    float _1780 = _1774;
    float _1782 = _1762;
    if (!_1756)
    {
        float _1784 = _1322 * _1322;
        float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1788 = -_1218;
        float _1790 = _1788 + _1762;
        float _1792 = -_1202;
        float _1794 = _1792 + _1758;
        float _1796 = fma(_1330, _1330, _1784);
        float _1798 = -_1168;
        float _1800 = _1798 + _1760;
        float _1802 = fma(_1336, _1336, _1796);
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1806 = sqrt(_1802);
        float _1808 = 1.0 / _1414;
        float _1810 = precise::min(_1806, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1812 = _1810 * _1786;
        float _1814 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1816 = _1812 * _1808;
        float _1818 = _1814 * _1816;
        float _1820 = _1790 * _1816;
        float _1822 = fma(_1794, _1818, _1318);
        float _1824 = fma(_1800, _1818, _1312);
        float _1826 = fma(_1814, _1820, _1326);
        _1776 = _1824;
        _1778 = _1822;
        _1780 = _1826;
        _1174 = _1800;
    }
    float _1828 = _1776;
    float _1830 = _1778;
    float _1832 = _1780;
    float _1834 = _1174;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1838 = _1828 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1842 = _1830 + _1840;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1846 = _1832 + _1844;
    float _1848 = _1838 * _1838;
    float _1850 = fma(_1842, _1842, _1848);
    float _1852 = fma(_1846, _1846, _1850);
    float _1854 = rsqrt(_1852);
    float _1856 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1858 = _1842 * _1856;
    float _1860 = _1846 * _1856;
    float _1862 = _1858 * _1858;
    float _1864 = _1860 * _1860;
    float _1866 = _1862 + _1864;
    float _1868 = sqrt(_1866);
    bool _1870 = _1868 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1874 = _1868 + _1872;
    float _1876 = _1846;
    float _1878 = _1874;
    float _1880 = _1834;
    float _1882 = _1858;
    if (_1870)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1884;
    }
    float _1886 = _1876;
    if (_1870)
    {
        float _1888 = rsqrt(_1866);
        _1782 = _1888;
    }
    float _1890 = _1782;
    float _1892 = _1890;
    if (_1870)
    {
        float _1894 = _1874 * _1886;
        _1878 = _1894;
    }
    float _1896 = _1878;
    if (_1870)
    {
        float _1898 = _1896 * 0.15915493667125701904296875;
        _1564 = _1898;
    }
    float _1900 = _1564;
    float _1902 = _1848;
    if (_1870)
    {
        float _1904 = _1900 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        _1902 = _1906;
    }
    float _1908 = _1902;
    float _1910 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1912 = precise::max(0.0, _1910);
    float _1914 = _1854;
    float _1916 = _1912;
    float _1918 = _1910;
    if (_1870)
    {
        float _1920 = _1900 * 6.283185482025146484375;
        float _1922 = cos(_1920);
        _1914 = _1922;
    }
    float _1924 = _1914;
    float _1926 = -_1856;
    float _1928 = -_1912;
    float _1930 = fma(_1838, _1926, _1928);
    if (!_1870)
    {
        _1916 = _1862;
    }
    float _1932 = _1916;
    float _1934 = _1932;
    if (_1870)
    {
        float _1936 = _1930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1918 = _1936;
    }
    float _1938 = _1918;
    float _1940 = sqrt(_1852);
    float _1942 = _1908;
    float _1944 = _1938;
    if (_1870)
    {
        float _1946 = fma(_1908, _1938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1942 = _1946;
    }
    float _1948 = _1942;
    float _1950 = _1948;
    if (_1870)
    {
        float _1952 = _1924 + (-1.0);
        _1944 = _1952;
    }
    float _1954 = _1944;
    float _1956 = _1954;
    if (_1870)
    {
        float _1958 = _1890 * _1948;
        _1880 = _1958;
    }
    float _1960 = _1880;
    if (!_1870)
    {
        _1892 = _1930;
    }
    float _1962 = _1892;
    float _1964 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1966 = _1962;
    if (_1870)
    {
        float _1968 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1668 = _1968;
    }
    float _1970 = _1668;
    if (_1870)
    {
        float _1972 = _1858 * _1960;
        _1882 = _1972;
    }
    float _1974 = _1882;
    if (!_1870)
    {
        _1950 = _1860;
    }
    float _1976 = _1950;
    float _1978 = _1976;
    if (_1870)
    {
        float _1980 = _1860 * _1960;
        _1978 = _1980;
    }
    float _1982 = _1978;
    if (_1870)
    {
        float _1984 = fma(_1930, _1924, _1970);
        _1966 = _1984;
    }
    float _1986 = _1966;
    if (_1870)
    {
        float _1988 = _1974 * _1974;
        _1934 = _1988;
    }
    float _1990 = _1934;
    if (!_1870)
    {
        _1956 = _1864;
    }
    float _1992 = _1956;
    float _1994 = _1992;
    if (_1870)
    {
        float _1996 = _1982 * _1982;
        _1994 = _1996;
    }
    float _1998 = _1994;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2002 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2000);
    float _2004 = precise::clamp(_2002, 0.0, 1.0);
    float _2006 = fma(_1986, _1986, _1990);
    float _2008 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1964);
    float _2010 = -_2004;
    float _2012 = _2010 + 1.0;
    float _2014 = _2006 + _1998;
    float _2016 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2018 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2020 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2022 = rsqrt(_2014);
    float _2024 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2016);
    float _2026 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2028 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2018);
    float _2030 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2024);
    float _2032 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2026);
    float _2034 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2036 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2032);
    float _2038 = abs(_2012);
    float _2040 = log2(_2038);
    float _2042 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2028);
    float _2044 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2046 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2048 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2008);
    float _2050 = _2022 * _1974;
    float _2052 = -_2044;
    float _2054 = fma(_2052, _2020, 1.0);
    float _2056 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2058 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2060 = _2022 * _1986;
    float _2062 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = _2022 * _1982;
    float _2066 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2058);
    float _2068 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2070 = -_2062;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = log2(_2054);
    float _2076 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2066);
    float _2078 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2080 = -_2064;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2084 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2086 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2076);
    float _2088 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2090 = fma(_2082, -0.5, 0.5);
    float _2092 = exp2(_2078);
    float _2094 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2084);
    float _2096 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2088);
    float _2098 = fma(_2082, 0.5, 0.5);
    float _2100 = _2060 + 1.0;
    float _2102 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2104 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2096);
    float _2106 = fma(_2098, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2108 = 1.0 / _2086;
    float _2110 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2102);
    float _2112 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2114 = fma(_2098, _2106, -0.212114393711090087890625);
    float _2116 = _2074 * 0.693147182464599609375;
    float _2118 = fma(_2098, _2114, 1.570728778839111328125);
    float _2120 = sqrt(_2090);
    float _2122 = -_2060;
    float _2124 = fma(_2092, _2100, _2122);
    float _2126 = fma(_2124, 0.5, 0.5);
    float _2128 = _2110 * _2108;
    float _2130 = _2112 * _2108;
    float _2132 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = fma(_2128, 0.5, 0.5);
    float _2136 = fma(_2130, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float3 _5623 = float3(_2134, _2136, _2132);
    float _2140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5623, float3(0.0), isnan(_5623)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5623, float3(0.0), isnan(_5623)), level(0.0)).x;
    float3 _5634 = float3(_2134, _2136, _2132);
    float4 _2143 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5634, float3(0.0), isnan(_5634)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5634, float3(0.0), isnan(_5634)), level(0.0)).xyzw;
    float _2145 = _2143.x;
    float _2147 = _2143.y;
    float _2149 = _2143.z;
    float _2151 = _2143.w;
    float _2153 = -_2118;
    float _2155 = fma(_2138, _2153, 1.0);
    float2 _5656 = float2(_2155, _2126);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5656, float2(0.0), isnan(_5656)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5656, float2(0.0), isnan(_5656)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2169 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2171 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2169);
    float _2173 = exp2(_2167);
    float _2175 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2171);
    float _2177 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2175);
    float _2179 = _2177 + _2086;
    float _2181 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2110;
    out.gl_Position.y = _2112;
    out.gl_Position.z = _2177;
    out.gl_Position.w = _2086;
    float _2183 = _2179 * 0.5;
    float _2185 = -_2173;
    float _2187 = _2185 + 1.0;
    out.m_47.x = _2181;
    float _2189 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2183;
    out.m_67.w = _2086;
    float _2191 = _2189 * _2140;
    float _2193 = -_2189;
    float _2195 = _2193 + 1.0;
    float _2197 = _2151 * _2191;
    float _2199 = _2151 * _2195;
    float _2201 = _2165 * _2191;
    float _2203 = fma(_2161, _2197, _2145);
    float _2205 = fma(_2163, _2197, _2147);
    float _2207 = fma(_2151, _2201, _2149);
    out.m_69.x = _2203;
    out.m_69.y = _2205;
    out.m_69.z = _2207;
    out.m_69.w = _2199;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1704 = false;
    bool _1018 = false;
    bool _764 = false;
    bool _586 = false;
    bool _420 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2264 = as_type<float>(_104);
        out.gl_Position.z = _2264;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2333 = as_type<float>(_140);
        out.gl_Position.z = _2333;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _146 * _144;
    float _166 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _168 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _170 = _166 * _158;
    float _172 = floor(_168);
    float _174 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].y, _170);
    float _176 = _168 * 6.283185482025146484375;
    float _178 = _174 * 6.283185482025146484375;
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = _178 * 0.15915493667125701904296875;
    float _190 = floor(_174);
    float _192 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _194 = 1.4012984643248170709237295832899e-45;
    float _196 = _192;
    if (!_156)
    {
        float _198 = _192 * _192;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = -_172;
    float _206 = _168 + _204;
    float _208 = _180 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = _202;
    if (!_156)
    {
        float _214 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    float _218 = _188 * 6.283185482025146484375;
    float _220 = cos(_218);
    float _222 = -_190;
    float _224 = _174 + _222;
    bool _226 = !_156;
    float _228 = _216;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _192 * _232;
        float _242 = 1.0 / _236;
        float _244 = _238 * 0.693147182464599609375;
        float _246 = exp2(_240);
        float _248 = 1.0 / _244;
        float _250 = _246 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _248, _192);
        float _256 = _254 * _242;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _258;
    }
    float _260 = _228;
    bool _262 = !_156;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _192 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _196 = _282;
    }
    float _284 = _196;
    float _286 = in.m_53.w;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    float _294 = fma(_220, 0.5, 0.5);
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _302 = _300 != 0;
    float _304 = fma(_210, 0.5, 0.5);
    bool _306 = _206 < 0.5;
    float _308 = float(_306);
    float _310 = -_294;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _314 = -_206;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _318 = !_298;
    int _320 = _318 ? 0 : 1;
    float _322 = -_224;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _326 = _224 < 0.5;
    float _328 = float(_326);
    float _330 = -_308;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _334 = -_304;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _338 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _342 = abs(_320);
    float _344 = -_328;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _348 = !_162;
    int _350 = _348 ? 0 : 1;
    float _352 = fma(_284, _182, _338);
    float _354 = fma(_284, _184, _340);
    bool _356 = !_302;
    int _358 = _356 ? 0 : 1;
    float _360 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _362 = abs(_350);
    float _364 = fma(_352, _286, _288);
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _368 = fma(_284, _186, _360);
    int _370 = abs(_358);
    float _372 = fma(_354, _286, _290);
    float _374 = float(_342);
    float _376 = fma(_368, _286, _292);
    float _378 = float(_362);
    float _380 = abs(_316);
    float _382 = _374 * _380;
    float _384 = abs(_324);
    float _386 = _374 * _384;
    float _388 = float(_370);
    float _390 = fma(_378, _336, _382);
    float _392 = fma(_378, _312, _386);
    float _394 = abs(_332);
    float _396 = fma(_388, _394, _390);
    float _398 = abs(_346);
    float _400 = fma(_388, _398, _392);
    bool _402 = !_366;
    float _418;
    if (!_402)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _406 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _418 = _416;
        _420 = true;
    }
    else
    {
        float _422 = float(_88);
        float _424 = 1.0 / _422;
        float _426 = _122 * _424;
        _418 = _426;
    }
    _420 = false;
    float _428 = _418;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _432 = _428 + _430;
    bool _434 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _436 = isnan(_428);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _448 = _428 + _446;
    bool _450 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _452 = isnan(_428);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_428);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_444;
    float _484 = _482 + 1.0;
    float _486 = 1.0 / _468;
    float _488 = _480 * _484;
    float _490 = -_480;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _494;
    bool _498 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _500 = 1.0 / _464;
    float _502 = _460 * _492;
    float _504 = -_460;
    float _506 = _504 + 1.0;
    float _508 = _448 * _486;
    float _510 = _432 * _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _516;
    float _520 = fma(_496, _510, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _522 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _524 = fma(_518, _510, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _526 = _520 * _502;
    float _528 = _522 * _502;
    float _530 = _524 * _502;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].x, _526);
    float _546 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].y, _528);
    float _548 = fma(_534, _508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _550 = fma(_538, _508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _552 = fma(_542, _508, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _554 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _556 = fma(_548, _488, _544);
    float _558 = fma(_550, _488, _546);
    float _560 = fma(_552, _488, _554);
    float _562 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].x, _556);
    float _564 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].y, _558);
    float _566 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].z, _560);
    bool _568 = !_498;
    float _584;
    if (!_568)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _572 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_88);
        float _590 = 1.0 / _588;
        float _592 = _122 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = in.m_53.x;
    float _598 = in.m_53.y;
    float _600 = in.m_53.z;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _604 = _594 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _614 = 1.0 / _608;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _618 = 1.0 / _612;
    float _620 = _564 * _598;
    bool _622 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _624 = isnan(_594);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _604 * _614;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _638 = _594 + _636;
    bool _640 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _642 = isnan(_594);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _566 * _600;
    bool _654 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _656 = isnan(_594);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_632;
    float _668 = _666 + 1.0;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _670;
    float _674 = _562 * _596;
    float _676 = _664 * _668;
    float _678 = -_664;
    float _680 = _678 + 1.0;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _686;
    float _690 = fma(_672, _634, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _692 = _650 * _680;
    float _694 = fma(_684, _634, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _696 = fma(_688, _634, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _698 = _638 * _618;
    float _700 = _690 * _692;
    float _702 = _694 * _692;
    float _704 = _696 * _692;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _710 = -_650;
    float _712 = _710 + 1.0;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _722 = fma(_708, _698, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _724 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].x, _700);
    float _726 = fma(_716, _698, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _728 = fma(_720, _698, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _730 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].y, _702);
    float _732 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].z, _704);
    float _734 = fma(_722, _676, _724);
    float _736 = fma(_726, _676, _730);
    float _738 = fma(_728, _676, _732);
    float _740 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[109].x, _734);
    float _742 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[109].y, _736);
    float _744 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[109].z, _738);
    bool _746 = !_616;
    float _762;
    if (!_746)
    {
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _750 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _754 = _752 * _748;
        float _756 = floor(_754);
        float _758 = -_756;
        float _760 = _754 + _758;
        _762 = _760;
        _764 = true;
    }
    else
    {
        float _766 = float(_88);
        float _768 = 1.0 / _766;
        float _770 = _122 * _768;
        _762 = _770;
    }
    _764 = false;
    float _772 = _762;
    float _774 = _740 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _776 = _742 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _782 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _784 = isnan(_772);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _794;
    float _798 = 1.0 / _780;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _804 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _806 = isnan(_772);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -_792;
    float _818 = _816 + 1.0;
    bool _820 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _822 = isnan(_772);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _836 = -_814;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _802;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _772 + _842;
    float _846 = _830 * _838;
    float _848 = _744 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _850 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _854 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _856 = _796 * _798;
    float _858 = _814 * _818;
    bool _860 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _862 = isnan(_772);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -_830;
    float _874 = _872 + 1.0;
    float _876 = 1.0 / _834;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _882 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _884 = isnan(_772);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -_870;
    float _896 = _894 + 1.0;
    float _898 = _870 * _874;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _904 = fma(_856, _844, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _910 = 1.0 / _880;
    float _912 = _892 * _896;
    float _914 = _908 * _840;
    float _916 = -_892;
    float _918 = _916 + 1.0;
    float _920 = _904 * _912;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _924 = _772 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _930 = 1.0 / _902;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _932;
    float _936 = fma(_914, _924, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _938 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[115].x, _920);
    float _940 = _934 * _876;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _944 = _772 + _942;
    bool _946 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _948 = isnan(_772);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _928 * _910;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _960;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _966 = _772 + _964;
    float _968 = fma(_940, _944, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _970 = fma(_936, _898, _938);
    float _972 = -_956;
    float _974 = _972 + 1.0;
    float _976 = fma(_958, _966, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _980 = _772 + _978;
    float _982 = _962 * _930;
    float _984 = fma(_968, _846, _970);
    float _986 = _792 * _974;
    float _988 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _990 = fma(_982, _980, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _992 = fma(_976, _858, _984);
    float _994 = fma(_990, _986, _992);
    float _996 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[120].x, _994);
    float _998 = _996 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _850;
    out.m_55.y = _852;
    out.m_55.z = _988;
    out.m_55.w = _998;
    bool _1000 = !_854;
    float _1016;
    if (!_1000)
    {
        float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1004 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _1008 = _1006 * _1002;
        float _1010 = floor(_1008);
        float _1012 = -_1010;
        float _1014 = _1008 + _1012;
        _1016 = _1014;
        _1018 = true;
    }
    else
    {
        float _1020 = float(_88);
        float _1022 = 1.0 / _1020;
        float _1024 = _122 * _1022;
        _1016 = _1024;
    }
    _1018 = false;
    float _1026 = _1016;
    float _1028 = in.m_57.y;
    float _1030 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1032 = in.m_51.y;
    float _1034 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1036;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1042 = _1040 != 0;
    float _1044 = in.m_57.x;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1048 = _1046 != 0;
    float _1050 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1052 = 1.0 / _1038;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1058 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1030);
    float _1060 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1034);
    float _1062 = 1.0 / _1056;
    bool _1064 = _142 > 0.5;
    bool _1066 = _1064 && _1042;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1070 = _1026 + _1068;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1074 = _1032 > 0.5;
    float _1076 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1050);
    float _1078 = -_1028;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1084 = _1026 + _1082;
    float _1086 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1058);
    float _1088 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1060);
    float _1090 = _1028;
    if (_1048)
    {
        float _1092 = _1074 ? _1080 : _1028;
        _1090 = _1092;
    }
    float _1094 = _1090;
    float _1096 = _1084 * _1052;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1098;
    float _1102 = _1070 * _1062;
    float _1104 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1076);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1106;
    float _1110 = fma(_1100, _1096, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1116 = _1026 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1118 = isnan(_1026);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1128;
    float _1132 = fma(_1108, _1096, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1134 = fma(_1114, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1136 = _1026 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1138 = isnan(_1026);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = fma(_1130, _1096, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1150 = -_1126;
    float _1152 = _1150 + 1.0;
    float _1154 = _1096;
    if (_1042)
    {
        _1154 = _1044;
    }
    float _1156 = _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1166 = _1146 * _1152;
    float _1168 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1170 = _1156;
    float _1172 = _1160;
    float _1174 = _1168;
    if (_1066)
    {
        float _1176 = -_1156;
        float _1178 = _1176 + 1.0;
        _1170 = _1178;
    }
    float _1180 = _1170;
    float _1182 = fma(_1160, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1184 = _1026 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1186 = isnan(_1026);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1192 = _1188 || _1190;
    float _1194 = float(_1192);
    float _1196 = fma(_1164, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1198 = -_1146;
    float _1200 = _1198 + 1.0;
    float _1202 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1206 = _1168 + _1204;
    if (!_1042)
    {
        _1172 = _1044;
    }
    float _1208 = _1172;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1212 = _1208;
    if (_1042)
    {
        _1212 = _1180;
    }
    float _1214 = _1212;
    float _1216 = _1194 * _1200;
    float _1218 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1202 + _1220;
    float _1224 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1226 = -_1194;
    float _1228 = _1226 + 1.0;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1232 = _1218 + _1230;
    float _1234 = _1148 * _1216;
    float _1236 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1224);
    float _1238 = _1110 * _1216;
    float _1240 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1242 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1234);
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1236);
    float _1246 = _1206 * _1206;
    float _1248 = _1132 * _1216;
    float _1250 = _1240 * _1072;
    float _1252 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1238);
    bool _1254 = _1244 >= 0.0;
    float _1256 = fma(_1222, _1222, _1246);
    float _1258 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1248);
    float _1260 = fma(_1182, _1166, _1252);
    float _1262 = fma(_1134, _1166, _1242);
    float _1264 = fma(_1232, _1232, _1256);
    float _1266 = fma(_1196, _1166, _1258);
    float _1268 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1260);
    float _1270 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1262);
    float _1272 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1274 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1266);
    float _1276 = rsqrt(_1264);
    float _1278 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1280 = _1246;
    if (_1254)
    {
        _1280 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1282 = _1280;
    float _1284 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1286 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = _1272 * _1210;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1292 = as_type<int>(_1282);
    if (_1254)
    {
        float _1294 = _1282 * 5.0;
        _1292 = as_type<int>(_1294);
    }
    int _1296 = _1292;
    float _1298 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1250;
    out.m_61.y = _1288;
    float _1304 = _1206 * _1276;
    float _1306 = as_type<float>(_1296);
    if (_1254)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4205 = as_type<float>(_1296);
        out.gl_Position.z = _4205;
    }
    if (_1254)
    {
        out.m_47.x = 0.0;
    }
    float _1308 = _1222 * _1276;
    out.m_63.x = _1298;
    out.m_63.y = _1300;
    out.m_63.z = _1302;
    out.m_63.w = _1290;
    if (_1254)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1310 = -_1304;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1168);
    float _1314 = _1232 * _1276;
    float _1316 = -_1308;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1312 + _1320;
    float _1324 = -_1314;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1330 = _1318 + _1328;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1336 = _1326 + _1334;
    float _1338 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1332);
    float _1340 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1338);
    bool _1342 = _1340 >= 0.0;
    if (_1342)
    {
        _1306 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1344 = _1306;
    int _1346 = as_type<int>(_1344);
    if (_1342)
    {
        out.m_47.x = 0.0;
    }
    if (_1342)
    {
        float _1348 = _1344 * 5.0;
        _1346 = as_type<int>(_1348);
    }
    int _1350 = _1346;
    if (_1342)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4310 = as_type<float>(_1350);
        out.gl_Position.z = _4310;
    }
    if (_1342)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1352 = -_1304;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1206);
    float _1356 = -_1308;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1360 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1362 = _1354 * _1354;
    float _1364 = -_1314;
    float _1366 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1368 = _396 * _674;
    float _1370 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1360);
    float _1372 = fma(_1358, _1358, _1362);
    float _1374 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1376 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1370);
    float _1378 = fma(_1366, _1366, _1372);
    float _1380 = in.m_65.x;
    float _1382 = in.m_65.y;
    float _1384 = in.m_65.z;
    float _1386 = rsqrt(_1376);
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[660].x * 0.01745329238474369049072265625;
    float _1390 = _1388 * 0.15915493667125701904296875;
    float _1392 = sqrt(_1378);
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1396 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1400 = _400 * _620;
    float _1402 = _1394 * _1394;
    float _1404 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1382);
    float _1408 = _1390 * 6.283185482025146484375;
    float _1410 = cos(_1408);
    float _1412 = fma(_1396, _1396, _1402);
    float _1414 = _1276 * _1392;
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1418 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1380);
    float _1420 = fma(_1398, _1398, _1412);
    float _1422 = _1414 * _1404;
    float _1424 = _1414 * _1416;
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1384);
    float _1428 = _1414 * _1374;
    float _1430 = _1418 * _1422;
    float _1432 = rsqrt(_1420);
    float _1434 = _1406 * _1424;
    float _1436 = _1426 * _1428;
    float _1438 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1440 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1442 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1444 = _1390 * 6.283185482025146484375;
    float _1446 = sin(_1444);
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1438);
    float _1450 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1440);
    float _1452 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1442);
    float _1454 = -_1410;
    float _1456 = _1454 + 1.0;
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1448);
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1450);
    float _1462 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1452);
    float _1464 = _1396 * _1432;
    float _1466 = _1398 * _1432;
    float _1468 = _1394 * _1432;
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1472 = _1464 * _1456;
    float _1474 = _1466 * _1466;
    float _1476 = _1458 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1478 = _1466 * _1446;
    float _1480 = _1464 * _1446;
    float _1482 = _1468 * _1446;
    float _1484 = _1468 * _1456;
    float _1486 = -_1478;
    float _1488 = fma(_1468, _1472, _1486);
    float _1490 = fma(_1464, _1472, _1410);
    float _1492 = fma(_1466, _1484, _1480);
    float _1494 = _1470 * _1488;
    float _1496 = fma(_1456, _1474, _1410);
    float _1498 = -_1482;
    float _1500 = fma(_1466, _1472, _1498);
    float _1502 = _1470 * _1492;
    float _1504 = fma(_1476, _1490, _1494);
    float _1506 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1508 = fma(_1466, _1472, _1482);
    float _1510 = fma(_1476, _1500, _1502);
    float _1512 = fma(_1468, _1484, _1410);
    float _1514 = fma(_1468, _1472, _1478);
    float _1516 = fma(_1506, _1508, _1504);
    float _1518 = fma(_1506, _1496, _1510);
    float _1520 = _1470 * _1512;
    float _1522 = -_1480;
    float _1524 = fma(_1466, _1484, _1522);
    float _1526 = _1202 + _1516;
    float _1528 = _1218 + _1518;
    float _1530 = fma(_1476, _1514, _1520);
    float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1534 = _1526 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1538 = _1528 + _1536;
    float _1540 = fma(_1506, _1524, _1530);
    float _1542 = _1534 * _1534;
    float _1544 = _1538 * _1538;
    float _1546 = _1168 + _1540;
    float _1548 = _1542 + _1544;
    float _1550 = sqrt(_1548);
    bool _1552 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = _1466;
    float _1556 = _1540;
    float _1558 = _1506;
    float _1560 = _1514;
    float _1562 = _1512;
    float _1564 = _1534;
    if (!_1552)
    {
        _1554 = _1544;
    }
    float _1566 = _1554;
    float _1568 = _1566;
    if (!_1552)
    {
        _1556 = _1542;
    }
    float _1570 = _1556;
    float _1572 = _1570;
    if (!_1552)
    {
        _1558 = _1526;
    }
    float _1574 = _1558;
    float _1576 = _1574;
    if (!_1552)
    {
        _1560 = _1528;
    }
    float _1578 = _1560;
    float _1580 = _1578;
    if (!_1552)
    {
        _1562 = _1546;
    }
    float _1582 = _1562;
    bool _1584 = !_1552;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1550 + _1590;
        float _1594 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = rsqrt(_1548);
        float _1598 = _1592 * _1588;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1596 * _1610;
        float _1614 = _1608 + (-1.0);
        float _1616 = fma(_1534, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1618 = fma(_1538, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1624 = _1616 + _1622;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = fma(_1546, _1608, _1620);
        float _1632 = _1624 * _1624;
        float _1634 = _1628 * _1628;
        _1586 = _1630;
        _1572 = _1632;
        _1568 = _1634;
        _1576 = _1616;
        _1580 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1572;
    float _1640 = _1568;
    float _1642 = _1576;
    float _1644 = _1580;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    out.m_55.x = _850;
    out.m_55.y = _852;
    out.m_55.z = _988;
    out.m_55.w = _998;
    float _1650 = fma(_1648, _1648, _1638);
    out.m_63.x = _1298;
    out.m_63.y = _1300;
    out.m_63.z = _1302;
    out.m_63.w = _1290;
    float _1652 = _1650 + _1640;
    float _1654 = sqrt(_1652);
    bool _1656 = _1654 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1658 = isnan(_1654);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1664 = _1660 || _1662;
    float _1666 = _1650;
    float _1668 = _1648;
    if (!_1664)
    {
        _1666 = 1.0;
    }
    float _1670 = _1666;
    bool _1672 = !_1664;
    float _1674 = _1670;
    if (!_1672)
    {
        bool _1676 = _1654 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1678 = isnan(_1654);
        bool _1680 = _1676 || _1678;
        bool _1682 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1684 = _1680 || _1682;
        if (!_1684)
        {
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1688 = _1654 + _1686;
            float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1692 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1690;
            float _1694 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1696 = _1694 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1698 = 1.0 / _1692;
            float _1700 = _1688 * _1698;
            float _1702 = fma(_1700, _1696, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1674 = _1702;
            _1704 = true;
        }
        else
        {
            bool _1706 = _1654 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1708 = isnan(_1654);
            bool _1710 = _1706 || _1708;
            bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1714 = _1710 || _1712;
            if (!_1714)
            {
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1718 = _1654 + _1716;
                float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1726 = _1724 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1728 = 1.0 / _1722;
                float _1730 = _1718 * _1728;
                float _1732 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1674 = _1732;
                _1704 = true;
            }
            else
            {
                _1674 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1704 = false;
    float _1734 = _1674;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1738 = _1642 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1742 = _1636 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1746 = _1644 + _1744;
    bool _1748 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan(0.5);
    bool _1756 = _1752 || _1754;
    float _1758 = fma(_1738, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1760 = fma(_1742, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1762 = fma(_1746, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1764 = -_1308;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1758);
    float _1768 = -_1304;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1760);
    float _1772 = -_1314;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1762);
    float _1776 = _1770;
    float _1778 = _1766;
    float _1780 = _1774;
    float _1782 = _1762;
    if (!_1756)
    {
        float _1784 = _1322 * _1322;
        float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1788 = -_1218;
        float _1790 = _1788 + _1762;
        float _1792 = -_1202;
        float _1794 = _1792 + _1758;
        float _1796 = fma(_1330, _1330, _1784);
        float _1798 = -_1168;
        float _1800 = _1798 + _1760;
        float _1802 = fma(_1336, _1336, _1796);
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1806 = sqrt(_1802);
        float _1808 = 1.0 / _1414;
        float _1810 = precise::min(_1806, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1812 = _1810 * _1786;
        float _1814 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1816 = _1812 * _1808;
        float _1818 = _1814 * _1816;
        float _1820 = _1790 * _1816;
        float _1822 = fma(_1794, _1818, _1318);
        float _1824 = fma(_1800, _1818, _1312);
        float _1826 = fma(_1814, _1820, _1326);
        _1776 = _1824;
        _1778 = _1822;
        _1780 = _1826;
        _1174 = _1800;
    }
    float _1828 = _1776;
    float _1830 = _1778;
    float _1832 = _1780;
    float _1834 = _1174;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1838 = _1828 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1842 = _1830 + _1840;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1846 = _1832 + _1844;
    float _1848 = _1838 * _1838;
    float _1850 = fma(_1842, _1842, _1848);
    float _1852 = fma(_1846, _1846, _1850);
    float _1854 = rsqrt(_1852);
    float _1856 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1858 = _1842 * _1856;
    float _1860 = _1846 * _1856;
    float _1862 = _1858 * _1858;
    float _1864 = _1860 * _1860;
    float _1866 = _1862 + _1864;
    float _1868 = sqrt(_1866);
    bool _1870 = _1868 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1874 = _1868 + _1872;
    float _1876 = _1846;
    float _1878 = _1874;
    float _1880 = _1834;
    float _1882 = _1858;
    if (_1870)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1884;
    }
    float _1886 = _1876;
    if (_1870)
    {
        float _1888 = rsqrt(_1866);
        _1782 = _1888;
    }
    float _1890 = _1782;
    float _1892 = _1890;
    if (_1870)
    {
        float _1894 = _1874 * _1886;
        _1878 = _1894;
    }
    float _1896 = _1878;
    if (_1870)
    {
        float _1898 = _1896 * 0.15915493667125701904296875;
        _1564 = _1898;
    }
    float _1900 = _1564;
    float _1902 = _1848;
    if (_1870)
    {
        float _1904 = _1900 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        _1902 = _1906;
    }
    float _1908 = _1902;
    float _1910 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1912 = precise::max(0.0, _1910);
    float _1914 = _1854;
    float _1916 = _1912;
    float _1918 = _1910;
    if (_1870)
    {
        float _1920 = _1900 * 6.283185482025146484375;
        float _1922 = cos(_1920);
        _1914 = _1922;
    }
    float _1924 = _1914;
    float _1926 = -_1856;
    float _1928 = -_1912;
    float _1930 = fma(_1838, _1926, _1928);
    if (!_1870)
    {
        _1916 = _1862;
    }
    float _1932 = _1916;
    float _1934 = _1932;
    if (_1870)
    {
        float _1936 = _1930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1918 = _1936;
    }
    float _1938 = _1918;
    float _1940 = sqrt(_1852);
    float _1942 = _1908;
    float _1944 = _1938;
    if (_1870)
    {
        float _1946 = fma(_1908, _1938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1942 = _1946;
    }
    float _1948 = _1942;
    float _1950 = _1948;
    if (_1870)
    {
        float _1952 = _1924 + (-1.0);
        _1944 = _1952;
    }
    float _1954 = _1944;
    float _1956 = _1954;
    if (_1870)
    {
        float _1958 = _1890 * _1948;
        _1880 = _1958;
    }
    float _1960 = _1880;
    if (!_1870)
    {
        _1892 = _1930;
    }
    float _1962 = _1892;
    float _1964 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1966 = _1962;
    if (_1870)
    {
        float _1968 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1668 = _1968;
    }
    float _1970 = _1668;
    if (_1870)
    {
        float _1972 = _1858 * _1960;
        _1882 = _1972;
    }
    float _1974 = _1882;
    if (!_1870)
    {
        _1950 = _1860;
    }
    float _1976 = _1950;
    float _1978 = _1976;
    if (_1870)
    {
        float _1980 = _1860 * _1960;
        _1978 = _1980;
    }
    float _1982 = _1978;
    if (_1870)
    {
        float _1984 = fma(_1930, _1924, _1970);
        _1966 = _1984;
    }
    float _1986 = _1966;
    if (_1870)
    {
        float _1988 = _1974 * _1974;
        _1934 = _1988;
    }
    float _1990 = _1934;
    if (!_1870)
    {
        _1956 = _1864;
    }
    float _1992 = _1956;
    float _1994 = _1992;
    if (_1870)
    {
        float _1996 = _1982 * _1982;
        _1994 = _1996;
    }
    float _1998 = _1994;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2002 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2000);
    float _2004 = precise::clamp(_2002, 0.0, 1.0);
    float _2006 = fma(_1986, _1986, _1990);
    float _2008 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1964);
    float _2010 = -_2004;
    float _2012 = _2010 + 1.0;
    float _2014 = _2006 + _1998;
    float _2016 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2018 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2020 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2022 = rsqrt(_2014);
    float _2024 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2016);
    float _2026 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2028 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2018);
    float _2030 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2024);
    float _2032 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2026);
    float _2034 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2036 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2032);
    float _2038 = abs(_2012);
    float _2040 = log2(_2038);
    float _2042 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2028);
    float _2044 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2046 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2048 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2008);
    float _2050 = _2022 * _1974;
    float _2052 = -_2044;
    float _2054 = fma(_2052, _2020, 1.0);
    float _2056 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2058 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2060 = _2022 * _1986;
    float _2062 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = _2022 * _1982;
    float _2066 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2058);
    float _2068 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2070 = -_2062;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = log2(_2054);
    float _2076 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2066);
    float _2078 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2080 = -_2064;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2084 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2086 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2076);
    float _2088 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2090 = fma(_2082, -0.5, 0.5);
    float _2092 = exp2(_2078);
    float _2094 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2084);
    float _2096 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2088);
    float _2098 = fma(_2082, 0.5, 0.5);
    float _2100 = _2060 + 1.0;
    float _2102 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2104 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2096);
    float _2106 = fma(_2098, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2108 = 1.0 / _2086;
    float _2110 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2102);
    float _2112 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2114 = fma(_2098, _2106, -0.212114393711090087890625);
    float _2116 = _2074 * 0.693147182464599609375;
    float _2118 = fma(_2098, _2114, 1.570728778839111328125);
    float _2120 = sqrt(_2090);
    float _2122 = -_2060;
    float _2124 = fma(_2092, _2100, _2122);
    float _2126 = fma(_2124, 0.5, 0.5);
    float _2128 = _2110 * _2108;
    float _2130 = _2112 * _2108;
    float _2132 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = fma(_2128, 0.5, 0.5);
    float _2136 = fma(_2130, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float3 _5623 = float3(_2134, _2136, _2132);
    float _2140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5623, float3(0.0), isnan(_5623)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5623, float3(0.0), isnan(_5623)), level(0.0)).x;
    float3 _5634 = float3(_2134, _2136, _2132);
    float4 _2143 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5634, float3(0.0), isnan(_5634)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5634, float3(0.0), isnan(_5634)), level(0.0)).xyzw;
    float _2145 = _2143.x;
    float _2147 = _2143.y;
    float _2149 = _2143.z;
    float _2151 = _2143.w;
    float _2153 = -_2118;
    float _2155 = fma(_2138, _2153, 1.0);
    float2 _5656 = float2(_2155, _2126);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5656, float2(0.0), isnan(_5656)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5656, float2(0.0), isnan(_5656)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2169 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2171 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2169);
    float _2173 = exp2(_2167);
    float _2175 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2171);
    float _2177 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2175);
    float _2179 = _2177 + _2086;
    float _2181 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2110;
    out.gl_Position.y = _2112;
    out.gl_Position.z = _2177;
    out.gl_Position.w = _2086;
    float _2183 = _2179 * 0.5;
    float _2185 = -_2173;
    float _2187 = _2185 + 1.0;
    out.m_47.x = _2181;
    float _2189 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2183;
    out.m_67.w = _2086;
    float _2191 = _2189 * _2140;
    float _2193 = -_2189;
    float _2195 = _2193 + 1.0;
    float _2197 = _2151 * _2191;
    float _2199 = _2151 * _2195;
    float _2201 = _2165 * _2191;
    float _2203 = fma(_2161, _2197, _2145);
    float _2205 = fma(_2163, _2197, _2147);
    float _2207 = fma(_2151, _2201, _2149);
    out.m_69.x = _2203;
    out.m_69.y = _2205;
    out.m_69.z = _2207;
    out.m_69.w = _2199;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

