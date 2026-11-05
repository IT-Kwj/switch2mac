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
    float4 m_77 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = in.m_44.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_102);
    float _116 = 0.0;
    float _118 = _106;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_110)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_126);
        out.gl_Position.z = _2603;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = in.m_51.x;
    float _140 = float(_102);
    float _142 = in.m_51.y;
    bool _144 = _106 >= _140;
    bool _146 = !_136;
    bool _148 = _144 || _146;
    float _150 = in.m_51.z;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _114;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    int _154 = 0;
    if (_148)
    {
        float _156 = _152 * 5.0;
        _154 = as_type<int>(_156);
    }
    int _158 = _154;
    out.m_53.x = _138;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2666 = as_type<float>(_158);
        out.gl_Position.z = _2666;
    }
    out.m_53.y = _142;
    out.m_53.z = _150;
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _164 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = _162 * _160;
    if (!_174)
    {
        float _178 = _164 * _164;
        float _180 = _178 * 0.5;
        _116 = _180;
    }
    float _182 = _116;
    float _184 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _186 = in.m_44.x;
    float _188 = in.m_44.y;
    float _190 = in.m_44.z;
    float _192 = _182;
    if (!_174)
    {
        float _194 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _184 * 6.283185482025146484375;
    float _200 = floor(_184);
    float _202 = _198 * 0.15915493667125701904296875;
    int _204 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _206 = _204 != 0;
    float _208 = _202 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = 1.4012984643248170709237295832899e-45;
    float _214 = _196;
    if (!_174)
    {
        _212 = _164;
    }
    float _216 = _212;
    float _218 = -_200;
    float _220 = _184 + _218;
    bool _222 = !_174;
    float _224 = _216;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _164 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _164);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _254;
    }
    float _256 = _214;
    bool _258 = !_174;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _164 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _224 = _278;
    }
    float _280 = _224;
    float _282 = in.m_55.w;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _286 = _220 < 0.5;
    float _288 = float(_286);
    float _290 = in.m_42.x;
    float _292 = in.m_42.y;
    float _294 = in.m_42.z;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _302 = _300 != 0;
    float _304 = fma(_280, _186, _284);
    float _306 = -_288;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _310 = !_206;
    int _312 = _310 ? 0 : 1;
    float _314 = -_220;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _318 = !_298;
    int _320 = _318 ? 0 : 1;
    float _322 = fma(_210, 0.5, 0.5);
    float _324 = 1.0 / _140;
    float _326 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _328 = abs(_320);
    float _330 = -_322;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _334 = abs(_312);
    float _336 = fma(_280, _188, _326);
    bool _338 = !_302;
    int _340 = _338 ? 0 : 1;
    float _342 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _346 = abs(_340);
    float _348 = fma(_280, _190, _342);
    float _350 = float(_328);
    float _352 = float(_334);
    float _354 = fma(_304, _282, _290);
    float _356 = abs(_316);
    float _358 = _350 * _356;
    float _360 = fma(_348, _282, _294);
    float _362 = fma(_336, _282, _292);
    float _364 = float(_346);
    float _366 = fma(_352, _332, _358);
    float _368 = _106 * _324;
    float _370 = abs(_308);
    float _372 = fma(_364, _370, _366);
    bool _374 = !_344;
    float _376 = _368;
    float _392;
    if (!_374)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _380 = _138 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _368;
    }
    _394 = false;
    float _396 = _392;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _400 = _396 + _398;
    bool _402 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _416 = _396 + _414;
    bool _418 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _420 = isnan(_396);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _438 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _440 = isnan(_396);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -_412;
    float _452 = _450 + 1.0;
    float _454 = 1.0 / _432;
    float _456 = _448 * _452;
    float _458 = -_448;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _462;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _468 = 1.0 / _436;
    float _470 = _428 * _460;
    float _472 = -_428;
    float _474 = _472 + 1.0;
    float _476 = _400 * _454;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _482;
    float _486 = fma(_464, _476, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _488 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _490 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _492 = _416 * _468;
    float _494 = _486 * _470;
    float _496 = _488 * _470;
    float _498 = _490 * _470;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _512 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[107].x, _494);
    float _514 = fma(_502, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _516 = fma(_506, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _518 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[107].y, _496);
    float _520 = fma(_510, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _522 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[107].z, _498);
    float _524 = fma(_514, _456, _512);
    float _526 = fma(_516, _456, _518);
    float _528 = fma(_520, _456, _522);
    float _530 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[109].x, _524);
    float _532 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[109].y, _526);
    float _534 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[109].z, _528);
    bool _536 = !_466;
    if (!_536)
    {
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _540 = _138 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _544 = _542 * _538;
        float _546 = floor(_544);
        float _548 = -_546;
        float _550 = _544 + _548;
        _376 = _550;
    }
    float _552 = _376;
    float _554 = in.m_57.x;
    float _556 = in.m_57.y;
    float _558 = in.m_57.z;
    float _560 = in.m_57.w;
    float _562 = _150 * 2.0;
    float _564 = _138 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _576 = _574 != 0;
    float _578 = _138 * 2.0;
    float _580 = floor(_562);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _584 = _142 * 2.0;
    float _586 = in.m_51.w;
    float _588 = -_582;
    float _590 = fma(_564, 2.0, _588);
    float _592 = _150 * 6.283185482025146484375;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _596 = _594 != 0;
    float _598 = floor(_578);
    float _600 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _602 = _138 + _150;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _606 = _362 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _608 = _602 + (-1.0);
    float _610 = fma(_600, -2.0, _604);
    bool _612 = _580 > 0.0;
    float _614 = floor(_584);
    bool _616 = _580 >= 0.0;
    bool _618 = isnan(_580);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = fma(_558, 9.0, _592);
    float _628 = _138 * 6.283185482025146484375;
    float _630 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _632 = _624 ? 0 : 1;
    float _634 = _626 * 0.15915493667125701904296875;
    float _636 = fma(_558, 3.0, _628);
    float _638 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _640 = log2(_638);
    int _642 = ~_632;
    int _644 = _642 + 1;
    int _646 = _644 + 1;
    float _648 = _636 * 0.15915493667125701904296875;
    float _650 = _138 + _142;
    bool _652 = _598 >= 0.0;
    bool _654 = isnan(_598);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = in.m_59.y;
    int _664 = _646;
    if (!_612)
    {
        int _666 = ~_632;
        int _668 = _666 + 1;
        _664 = _668;
    }
    int _670 = _664;
    float _672 = _650 + (-1.0);
    float _674 = _634 * 6.283185482025146484375;
    float _676 = sin(_674);
    bool _678 = _614 >= 0.0;
    bool _680 = isnan(_614);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = in.m_59.x;
    int _690 = _660 ? 0 : 1;
    float _692 = -_106;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    bool _696 = _598 > 0.0;
    float _698 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _610);
    float _700 = _686 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _702 = _648 * 6.283185482025146484375;
    float _704 = sin(_702);
    bool _706 = _614 > 0.0;
    float _708 = -_558;
    float _710 = _708 + 1.0;
    float _712 = _640 * _106;
    int _714 = ~_690;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _722 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _724 = fma(_142, 0.5, -0.25);
    int _726 = _718;
    float _728 = _676;
    float _730 = _700;
    int _732 = as_type<int>(_698);
    if (!_696)
    {
        int _734 = ~_690;
        int _736 = _734 + 1;
        _726 = _736;
    }
    int _738 = _726;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _742 = fma(_586, 0.300000011920928955078125, 0.300000011920928955078125);
    float _744 = fma(_676, 0.25, _704);
    if (_596)
    {
        _728 = _138;
    }
    float _746 = _728;
    float _748 = exp2(_712);
    float _750 = _746;
    if (!_596)
    {
        _750 = _150;
    }
    float _752 = _750;
    float _754 = _744 * _742;
    int _756 = ~as_type<int>(_700);
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _764 = _760;
    if (!_706)
    {
        int _766 = ~as_type<int>(_700);
        int _768 = _766 + 1;
        _764 = _768;
    }
    int _770 = _764;
    float _772 = _752 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _774 = fma(_754, _710, _724);
    float _776 = fma(_688, 13.0, _628);
    float _778 = _772;
    float _780 = _688;
    if (!_596)
    {
        _730 = _142;
    }
    float _782 = _730;
    float _784 = -_720;
    float _786 = fma(_772, 2.0, _784);
    bool _788 = !_568;
    int _790 = _788 ? 0 : 1;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _794 = _782;
    if (_596)
    {
        _794 = _138;
    }
    float _796 = _794;
    float _798 = _776 * 0.15915493667125701904296875;
    int _800 = abs(_790);
    float _802 = -_748;
    float _804 = _802 + 1.0;
    if (!_596)
    {
        _778 = _150;
    }
    float _806 = _778;
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[83].z, _792);
    float _810 = _806;
    if (_596)
    {
        _810 = _142;
    }
    float _812 = _810;
    float _814 = _796 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _816 = float(_670);
    float _818 = _362 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _820 = float(_800);
    float _822 = -_740;
    float _824 = fma(_814, 2.0, _822);
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[83].w, _762);
    float _828 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _818);
    float _830 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
    float _832 = _820 * _816;
    float _834 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _828);
    float _836 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _830);
    float _838 = _830;
    float _840 = _834;
    if (!_596)
    {
        _838 = _150;
    }
    float _842 = _838;
    float _844 = _832 * (-2.0);
    float _846 = _834 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _848 = _836 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _850 = _842;
    if (_596)
    {
        _850 = _142;
    }
    float _852 = _850;
    float _854 = fma(_722, _844, _722);
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _858 = _846 + _856;
    float _860 = -_848;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _864 = _862;
    if (_596)
    {
        _840 = _142;
    }
    float _866 = _840;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _870 = _866;
    if (!_596)
    {
        _870 = _138;
    }
    float _872 = _870;
    float _874 = _852 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _876 = abs(_858);
    float _878 = abs(_862);
    float _880 = precise::max(_876, _878);
    float _882 = _142 * 6.283185482025146484375;
    float _884 = fma(_874, -2.0, _868);
    bool _886 = _880 >= 16.0;
    float _888 = fma(_662, 15.0, _882);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _892 = 1.0 + _890;
    float _894 = _888 * 0.15915493667125701904296875;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _900 = 1.0 / _892;
    float _902 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[88].z, _896);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _906 = !_576;
    int _908 = _906 ? 0 : 1;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _912 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _914 = isnan(1.0);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _920 = _916 || _918;
    float _922 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].w, _898);
    int _924 = abs(_908);
    float _926 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _902);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _930 = _872 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _932 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[78].z, _904);
    float _934 = _894 * 6.283185482025146484375;
    float _936 = sin(_934);
    bool _938 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _946 = _942 || _944;
    float _948 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[88].w, _910);
    float _950 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _922);
    float _952 = fma(_930, -2.0, _928);
    float _954 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _932);
    float _956 = _138 + (-0.5);
    float _958 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _948);
    float _960 = _858 * 0.0625;
    float _962 = _946 ? _804 : 0.0;
    float _964 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _966 = float(_924);
    float _968 = -_106;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[86].x, _786);
    float _972 = _886 ? _960 : _858;
    float _974 = -_106;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _824);
    float _978 = float(_770);
    float _980 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _826);
    bool _982 = !_572;
    int _984 = _982 ? 0 : 1;
    float _986 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _884);
    float _988 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _952);
    float _990 = _956 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _992 = _774 * _556;
    bool _994 = _920;
    if (_886)
    {
        float _996 = _862 * 0.0625;
        _864 = _996;
    }
    float _998 = _864;
    if (_920)
    {
        float _1000 = _962 * _900;
        _118 = _1000;
    }
    float _1002 = _118;
    float _1004 = abs(_972);
    bool _1006 = _1004 != 0.0;
    bool _1008 = isnan(_1004);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    float _1016 = _966 * _978;
    int _1018 = abs(_984);
    float _1020 = _142 + _150;
    float _1022 = fma(_854, _1002, _990);
    float _1024 = _992 * 0.15915493667125701904296875;
    float _1026 = abs(_998);
    bool _1028 = _1026 == 0.0;
    bool _1030 = !_1014;
    bool _1032 = _1028 && _1030;
    float _1034 = in.m_61.x;
    float _1036 = in.m_61.y;
    float _1038 = in.m_61.z;
    float _1040 = _1020 + (-1.0);
    float _1042 = float(_1018);
    float _1044 = in.m_63.x;
    float _1046 = in.m_63.y;
    float _1048 = in.m_63.z;
    float _1050 = float(_738);
    float _1052 = _798 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = in.m_55.x;
    float _1058 = in.m_55.y;
    float _1060 = in.m_55.z;
    float _1062 = _1016 * (-2.0);
    float _1064 = _1022 * 0.15915493667125701904296875;
    float _1066 = abs(_998);
    bool _1068 = _1066 == 0.0;
    float _1070 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1072 = _1042 * _1050;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1076 = _1074 != 0;
    float _1078 = _150 + (-0.5);
    float _1080 = fma(_630, _1062, _630);
    float _1082 = _1024 * 6.283185482025146484375;
    float _1084 = sin(_1082);
    float _1086 = _142 + (-0.5);
    float _1088 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1090 = _1072 * (-2.0);
    int _1092 = as_type<int>(_1088);
    int _1094 = as_type<int>(_1002);
    if (_1032)
    {
        bool _1096 = as_type<int>(_998) >= 0;
        _994 = _1096;
    }
    bool _1098 = _994;
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1102 = fma(_1080, _1002, _1088);
    float _1104 = fma(_1070, _1090, _1070);
    float _1106 = _1024 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    int _1110 = _1098 ? (-1) : 0;
    if (_1032)
    {
        int _1112 = _1098 ? 0 : 1078530011;
        _1092 = _1112;
    }
    int _1114 = _1092;
    float _1116 = _1054 + _936;
    float _1118 = fma(_1104, _1002, _1100);
    float _1120 = 0.0;
    if (!_1076)
    {
        _1120 = _688;
    }
    float _1122 = _1120;
    float _1124 = _1102 * 0.15915493667125701904296875;
    float _1126 = _1122;
    if (_1032)
    {
        int _1128 = int(0x80000000) & as_type<int>(_972);
        int _1130 = _1114 | _1128;
        _1094 = _1130;
    }
    int _1132 = _1094;
    float _1134 = _1064 * 6.283185482025146484375;
    float _1136 = sin(_1134);
    float _1138 = _1064 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    bool _1142 = !_1014;
    bool _1144 = _1142 && _1068;
    int _1146 = _1132;
    float _1148 = as_type<float>(_1132);
    float _1150 = _1036;
    float _1152 = _1034;
    float _1154 = _1038;
    if (!_1144)
    {
        float _1156 = abs(_972);
        bool _1158 = _1156 != as_type<float>(0x7f800000u /* inf */);
        bool _1160 = isnan(_1156);
        bool _1162 = _1158 || _1160;
        bool _1164 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1166 = _1162 || _1164;
        float _1168 = abs(_998);
        bool _1170 = _1168 == as_type<float>(0x7f800000u /* inf */);
        float _1172 = abs(_998);
        bool _1174 = _1172 == as_type<float>(0x7f800000u /* inf */);
        bool _1176 = !_1166;
        bool _1178 = _1174 && _1176;
        if (_1178)
        {
            bool _1180 = as_type<int>(_998) >= 0;
            _1110 = _1180 ? (-1) : 0;
        }
        int _1182 = _1110;
        if (_1178)
        {
            _1146 = 1075235812;
        }
        int _1184 = _1146;
        int _1186 = _1184;
        if (_1178)
        {
            int _1188 = ~_1182;
            int _1190 = (_1188 != 0) ? _1184 : 1061752795;
            _1186 = _1190;
        }
        int _1192 = _1186;
        float _1194 = as_type<float>(_1192);
        if (_1178)
        {
            int _1196 = int(0x80000000) & as_type<int>(_972);
            int _1198 = _1192 | _1196;
            _1194 = as_type<float>(_1198);
        }
        float _1200 = _1194;
        bool _1202 = !_1166;
        bool _1204 = _1202 && _1170;
        _1148 = _1200;
        if (!_1204)
        {
            float _1206 = abs(_972);
            float _1208 = abs(_998);
            float _1210 = precise::max(_1206, _1208);
            float _1212 = abs(_972);
            float _1214 = abs(_998);
            float _1216 = precise::min(_1212, _1214);
            float _1218 = 1.0 / _1210;
            float _1220 = abs(_972);
            float _1222 = abs(_998);
            bool _1224 = _1220 > _1222;
            bool _1226 = as_type<int>(_998) >= 0;
            float _1228 = abs(_972);
            float _1230 = abs(_998);
            float _1232 = _1228 + _1230;
            int _1234 = as_type<int>(_972) & int(0x80000000);
            bool _1236 = _1232 > as_type<float>(0x7f800000u /* inf */);
            bool _1238 = isnan(_1232);
            bool _1240 = _1236 || _1238;
            bool _1242 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1244 = _1240 || _1242;
            float _1246 = _1216 * _1218;
            float _1248 = _1246 * _1246;
            float _1250 = _1248 + 11.33538818359375;
            float _1252 = fma(_1248, _1250, 28.84246826171875);
            float _1254 = fma(_1248, _1252, 19.6966705322265625);
            float _1256 = fma(_1248, -0.82336294651031494140625, -5.674867153167724609375);
            float _1258 = fma(_1248, _1256, -6.565555095672607421875);
            float _1260 = 1.0 / _1254;
            float _1262 = _1248 * _1258;
            float _1264 = _1246 * _1262;
            float _1266 = fma(_1264, _1260, _1246);
            float _1268 = _1266;
            _1148 = _1232;
            if (_1224)
            {
                float _1270 = -_1266;
                float _1272 = _1270 + 1.57079637050628662109375;
                _1268 = _1272;
            }
            float _1274 = _1268;
            int _1276 = as_type<int>(_1274);
            if (!_1226)
            {
                float _1278 = -_1274;
                float _1280 = _1278 + 3.1415927410125732421875;
                _1276 = as_type<int>(_1280);
            }
            int _1282 = _1276;
            if (!_1244)
            {
                int _1284 = _1234 | _1282;
                _1148 = as_type<float>(_1284);
            }
        }
    }
    float _1286 = _1148;
    float _1288 = -_560;
    float _1290 = _1288 + 1.0;
    float _1292 = _1116 * 0.0599999986588954925537109375;
    float _1294 = -_1286;
    float _1296 = _1118 + _1294;
    float _1298 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1300 = _1124 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1292 * _1290;
    float _1306 = _1296 * 0.15915493667125701904296875;
    float _1308 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1310 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1312 = _554 * _1304;
    float _1314 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1316 = _1306 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = fma(_1036, _1312, _1046);
    float _1322 = fma(_1034, _1312, _1044);
    float _1324 = fma(_1038, _1312, _1048);
    float _1326 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1328 = _1320 * _1084;
    float _1330 = _1320 * _1108;
    bool _1332 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1334 = isnan(0.5);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1340 = _1336 || _1338;
    float _1342 = _1306 * 6.283185482025146484375;
    float _1344 = cos(_1342);
    float _1346 = -_1328;
    float _1348 = fma(_1322, _1108, _1346);
    float _1350 = fma(_1322, _1084, _1330);
    float _1352 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1324);
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1348);
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1350);
    float _1360 = _1136 * _1302;
    float _1362 = _1124 * 6.283185482025146484375;
    float _1364 = sin(_1362);
    float _1366 = _1354 * _1326;
    float _1368 = _1356 * _1314;
    float _1370 = _1358 * _1352;
    float _1372 = _1140 * _1318;
    float _1374 = _1318 * _1302;
    float _1376 = _362 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1378 = _1360 * _1370;
    float _1380 = _1136 * _1344;
    float _1382 = _1136 * _1318;
    float _1384 = _1140 * _1344;
    float _1386 = _1344 * _1302;
    float _1388 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1376);
    bool _1390 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1392 = isnan(0.5);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1398 = _1394 || _1396;
    float _1400 = -_1372;
    float _1402 = fma(_1364, _1380, _1400);
    float _1404 = -_1370;
    float _1406 = _1364 * _1404;
    float _1408 = fma(_1364, _1382, _1384);
    float _1410 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1388);
    float _1412 = fma(_1402, _1368, _1378);
    float _1414 = fma(_1386, _1368, _1406);
    float _1416 = fma(_1364, _1384, _1382);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1420 = fma(_1408, _1366, _1412);
    float _1422 = fma(_1374, _1366, _1414);
    float _1424 = _848 + _1420;
    float _1426 = _846 + _1422;
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1432 = _1424 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1436 = _1426 + _1434;
    float _1438 = _1432 * _1432;
    float _1440 = fma(_1436, _1436, _1438);
    float _1442 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1428);
    float _1444 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1446 = sqrt(_1440);
    float _1448 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1442);
    float _1450 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1444);
    float _1452 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1454 = _1140 * _1302;
    float _1456 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1450);
    float _1458 = 1.0 / _1452;
    float _1460 = _1454 * _1370;
    float _1462 = -_1380;
    float _1464 = fma(_1364, _1372, _1462);
    float _1466 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1468 = fma(_1416, _1368, _1460);
    bool _1470 = _1446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1466 + _1452;
    float _1474 = fma(_1464, _1366, _1468);
    float _1476 = _1418 + _1474;
    float _1478 = _1472 * _1458;
    float _1480 = _1478 * 0.5;
    float _1482 = _1372;
    float _1484 = _1474;
    float _1486 = _1426;
    float _1488 = _1380;
    float _1490 = _1440;
    float _1492 = _1424;
    float _1494 = _1480;
    float _1496 = _1382;
    if (!_1470)
    {
        _1482 = _1424;
    }
    float _1498 = _1482;
    float _1500 = _1498;
    if (!_1470)
    {
        _1484 = _1476;
    }
    float _1502 = _1484;
    bool _1504 = !_1470;
    float _1506 = _1502;
    if (!_1504)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1512 = _1446 + _1510;
        float _1514 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1516 = rsqrt(_1440);
        float _1518 = _1512 * _1508;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1520 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = _1520 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        float _1530 = _1524 + (-1.0);
        float _1532 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = fma(_1528, _1514, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1536 = fma(_1476, _1524, _1532);
        float _1538 = _1516 * _1534;
        float _1540 = fma(_1436, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1542 = fma(_1432, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1486 = _1540;
        _1506 = _1536;
        _1500 = _1542;
        _1488 = _1538;
        _1490 = _1516;
    }
    float _1544 = _1486;
    float _1546 = _1506;
    float _1548 = _1500;
    float _1550 = _1488;
    float _1552 = _1490;
    float _1554 = _1550;
    float _1556 = _1546;
    float _1558 = _1548;
    float _1560 = _1552;
    if (_1398)
    {
        _1492 = 1.0;
    }
    float _1562 = _1492;
    float _1564 = _1562;
    if (_1340)
    {
        _1554 = _1544;
    }
    float _1566 = _1554;
    float _1568 = _1566;
    if (!_1340)
    {
        float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1572 = _1418 + _1570;
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1576 = -_846;
        float _1578 = _1576 + _1544;
        float _1580 = -_1418;
        float _1582 = _1580 + _1546;
        float _1584 = _1572 * _1572;
        float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1588 = _848 + _1586;
        float _1590 = -_848;
        float _1592 = _1590 + _1548;
        float _1594 = fma(_858, _858, _1584);
        float _1596 = fma(_1588, _1588, _1594);
        float _1598 = sqrt(_1596);
        float _1600 = precise::min(_1598, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1602 = _1600 * _1574;
        float _1604 = fma(_1578, _1602, _846);
        float _1606 = fma(_1582, _1602, _1418);
        float _1608 = fma(_1592, _1602, _848);
        _1556 = _1606;
        _1568 = _1604;
        _1558 = _1608;
        _1560 = _1574;
    }
    float _1610 = _1556;
    float _1612 = _1568;
    float _1614 = _1558;
    float _1616 = _1560;
    float _1618 = _1616;
    if (!_1398)
    {
        float _1620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1622 = _1620 * 0.15915493667125701904296875;
        float _1624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1628 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1626);
        float _1630 = _1622 * 6.283185482025146484375;
        float _1632 = cos(_1630);
        float _1634 = _1624 * 0.15915493667125701904296875;
        float _1636 = _1622 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = 1.0 / _1632;
        float _1642 = _1634 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        float _1646 = _1638 * _1640;
        float _1648 = _1634 * 6.283185482025146484375;
        float _1650 = sin(_1648);
        float _1652 = _1644 * _1646;
        float _1654 = 1.0 / _1628;
        float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1658 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1656;
        float _1660 = 1.0 / _1652;
        float _1662 = 1.0 / _1658;
        float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1666 = _1654 * _1664;
        float _1668 = _1650 * _1660;
        float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1672 = fma(_1668, _1666, _1670);
        float _1674 = _1672 * _1662;
        float _1676 = precise::clamp(_1674, 0.0, 1.0);
        _1494 = _1654;
        _1618 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _1564 = _1676;
    }
    float _1678 = _1494;
    float _1680 = _1618;
    float _1682 = _1564;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1686 = _1610 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1690 = _1612 + _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1694 = _1614 + _1692;
    float _1696 = _1686 * _1686;
    float _1698 = fma(_1690, _1690, _1696);
    float _1700 = fma(_1694, _1694, _1698);
    float _1702 = rsqrt(_1700);
    float _1704 = sqrt(_1700);
    float _1706 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1708 = _1690 * _1706;
    float _1710 = _1694 * _1706;
    float _1712 = _1708 * _1708;
    float _1714 = _1710 * _1710;
    float _1716 = _1712 + _1714;
    float _1718 = sqrt(_1716);
    bool _1720 = _1718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1718 + _1722;
    float _1726 = _1678;
    float _1728 = _1716;
    float _1730 = _1724;
    float _1732 = _1686;
    float _1734 = _1708;
    float _1736 = _1710;
    float _1738 = _1712;
    float _1740 = _1714;
    if (_1720)
    {
        float _1742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1742;
    }
    float _1744 = _1726;
    if (_1720)
    {
        float _1746 = rsqrt(_1716);
        _1728 = _1746;
    }
    float _1748 = _1728;
    if (_1720)
    {
        float _1750 = _1724 * _1744;
        _1730 = _1750;
    }
    float _1752 = _1730;
    if (_1720)
    {
        float _1754 = _1752 * 0.15915493667125701904296875;
        _1496 = _1754;
    }
    float _1756 = _1496;
    float _1758 = _1680;
    if (_1720)
    {
        float _1760 = _1756 * 6.283185482025146484375;
        float _1762 = sin(_1760);
        _1758 = _1762;
    }
    float _1764 = _1758;
    float _1766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1768 = precise::max(0.0, _1766);
    float _1770 = _1744;
    float _1772 = _1768;
    if (_1720)
    {
        float _1774 = _1756 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = -_1706;
    float _1782 = -_1768;
    float _1784 = fma(_1686, _1780, _1782);
    if (_1720)
    {
        float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1732 = _1786;
    }
    float _1788 = _1732;
    float _1790 = _1788;
    float _1792 = _1764;
    if (_1720)
    {
        float _1794 = fma(_1764, _1788, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1790 = _1794;
    }
    float _1796 = _1790;
    float _1798 = _1796;
    if (_1720)
    {
        float _1800 = _1778 + (-1.0);
        _1772 = _1800;
    }
    float _1802 = _1772;
    float _1804 = _1802;
    if (_1720)
    {
        float _1806 = _1748 * _1796;
        _1792 = _1806;
    }
    float _1808 = _1792;
    if (!_1720)
    {
        _1798 = _1784;
    }
    float _1810 = _1798;
    float _1812 = _1810;
    if (_1720)
    {
        float _1814 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1804 = _1814;
    }
    float _1816 = _1804;
    if (_1720)
    {
        float _1818 = _1708 * _1808;
        _1734 = _1818;
    }
    float _1820 = _1734;
    if (_1720)
    {
        float _1822 = _1710 * _1808;
        _1736 = _1822;
    }
    float _1824 = _1736;
    if (_1720)
    {
        float _1826 = fma(_1784, _1778, _1816);
        _1812 = _1826;
    }
    float _1828 = _1812;
    if (_1720)
    {
        float _1830 = _1820 * _1820;
        _1738 = _1830;
    }
    float _1832 = _1738;
    if (_1720)
    {
        float _1834 = _1824 * _1824;
        _1740 = _1834;
    }
    float _1836 = _1740;
    float _1838 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = fma(_1828, _1828, _1832);
    float _1848 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1850 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1838);
    float _1852 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1854 = _1846 + _1836;
    float _1856 = -_1844;
    float _1858 = _1856 + 1.0;
    float _1860 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1862 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1852);
    float _1864 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1850);
    float _1866 = abs(_1858);
    float _1868 = log2(_1866);
    float _1870 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1860);
    float _1872 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1862);
    float _1874 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1876 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1878 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1870);
    float _1880 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1882 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1884 = rsqrt(_1854);
    float _1886 = _1878 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1888 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1876);
    float _1890 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1892 = -_1882;
    float _1894 = fma(_1892, _1848, 1.0);
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1898 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1888);
    float _1900 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1890);
    float _1902 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1904 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1896);
    float _1906 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1908 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1900);
    float _1910 = log2(_1894);
    float _1912 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1904);
    float _1914 = _1884 * _1820;
    float _1916 = _1884 * _1828;
    float _1918 = _1884 * _1824;
    float _1920 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1922 = exp2(_1902);
    float _1924 = -_1920;
    float _1926 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1924);
    float _1928 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1908);
    float _1930 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1932 = -_1918;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1926);
    float _1936 = _1910 * 0.693147182464599609375;
    float _1938 = 1.0 / _1928;
    float _1940 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1930);
    float _1942 = fma(_1934, -0.5, 0.5);
    float _1944 = fma(_1934, 0.5, 0.5);
    float _1946 = _1916 + 1.0;
    float _1948 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1940);
    float _1950 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1952 = fma(_1944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1954 = sqrt(_1942);
    float _1956 = -_1916;
    float _1958 = fma(_1922, _1946, _1956);
    float _1960 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1948);
    float _1962 = fma(_1944, _1952, -0.212114393711090087890625);
    float _1964 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1912);
    float _1966 = fma(_1958, 0.5, 0.5);
    float _1968 = fma(_1944, _1962, 1.570728778839111328125);
    float _1970 = _1960 * _1938;
    float _1972 = _1964 * _1938;
    float _1974 = fma(_1970, 0.5, 0.5);
    float _1976 = fma(_1972, -0.5, 0.5);
    float _1978 = _1954 * 0.636619746685028076171875;
    float _1980 = -_1968;
    float _1982 = fma(_1978, _1980, 1.0);
    float3 _5462 = float3(_1974, _1976, _1950);
    float _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5462, float3(0.0), isnan(_5462)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5462, float3(0.0), isnan(_5462)), level(0.0)).x;
    float3 _5473 = float3(_1974, _1976, _1950);
    float4 _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5473, float3(0.0), isnan(_5473)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5473, float3(0.0), isnan(_5473)), level(0.0)).xyzw;
    float _1989 = _1987.x;
    float _1991 = _1987.y;
    float _1993 = _1987.z;
    float _1995 = _1987.w;
    float2 _5490 = float2(_1982, _1966);
    float3 _1999 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5490, float2(0.0), isnan(_5490)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5490, float2(0.0), isnan(_5490)), level(0.0)).xyz;
    float _2001 = _1999.x;
    float _2003 = _1999.y;
    float _2005 = _1999.z;
    out.m_65.x = _554;
    out.m_65.y = _556;
    out.m_65.z = _558;
    out.m_65.w = _560;
    float _2007 = -_662;
    float _2009 = _2007 + 1.0;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2015 = _150 > 0.5;
    float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2019 = _2017 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2021 = _142 > 0.5;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2025 = _2023 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2027 = 1.0 / _2013;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2031 = _552 + _2029;
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2035 = _2033 != 0;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2039 = _2037 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2045 = 1.0 / _2019;
    int _2047 = _2015 ? as_type<int>(_2009) : as_type<int>(_662);
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2051 = _2049 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2057 = _2055 != 0;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2061 = _552 + _2059;
    int _2063 = _2021 ? as_type<int>(_2009) : as_type<int>(_662);
    float _2065 = 1.0 / _2051;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2069 = _2035 ? as_type<float>(_2047) : _662;
    float _2071 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2073 = _586 > 0.5;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2077 = 1.0 / _2025;
    float _2079 = _2057 ? as_type<float>(_2063) : _662;
    float _2081 = _2075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1612;
    out.m_67.y = _1610;
    out.m_67.z = _1614;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2085 = _2083 != 0;
    int _2087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2089 = _2087 != 0;
    float _2091 = 1.0 / _2043;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2095 = _2093 != 0;
    int _2097 = _2073 ? as_type<int>(_2009) : as_type<int>(_662);
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _2099;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _2105 = _2103 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _2107 = 1.0 / _2039;
    bool _2109 = _2073;
    if (_1076)
    {
        bool _2111 = _138 > 0.5;
        _2109 = _2111;
    }
    bool _2113 = _2109;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2115;
    float _2119 = _2117 * _2077;
    float _2121 = exp2(_2071);
    float _2123 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2125 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2127;
    float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2133 = _2131 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_69.x = _2081;
    out.m_69.y = _2123;
    out.m_69.z = _2125;
    float _2135 = _2133 * _2027;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _2139 = _2137 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _2141 = _2129 * _2045;
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2145 = _2101 * _2107;
    float _2147 = _2139 * _2091;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2151 = _552 + _2149;
    bool _2153 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _2155 = isnan(_552);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _2161 = _2157 || _2159;
    float _2163 = float(_2161);
    float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2167 = _552 + _2165;
    float _2169 = -_2121;
    float _2171 = _2169 + 1.0;
    float _2173 = _2105 * _2065;
    bool _2175 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _2177 = isnan(_552);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _2183 = _2179 || _2181;
    float _2185 = float(_2183);
    float _2187 = fma(_2147, _2167, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _2189 = _2095 ? as_type<float>(_2097) : _662;
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2193 = _552 + _2191;
    float _2195 = fma(_2135, _2151, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2197 = -_2185;
    float _2199 = _2197 + 1.0;
    float _2201 = -_2163;
    float _2203 = _2201 + 1.0;
    float _2205 = fma(_2141, _2193, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2207 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _2209 = isnan(_552);
    bool _2211 = _2207 || _2209;
    bool _2213 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _2215 = _2211 || _2213;
    float _2217 = float(_2215);
    float _2219 = _2163 * _2199;
    bool _2221 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2223 = isnan(_552);
    bool _2225 = _2221 || _2223;
    bool _2227 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2229 = _2225 || _2227;
    float _2231 = float(_2229);
    float _2233 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2235 = _552 + _2233;
    float _2237 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2239 = -_2217;
    float _2241 = _2239 + 1.0;
    float _2243 = _2217 * _2203;
    bool _2245 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2247 = isnan(_552);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2253 = _2249 || _2251;
    float _2255 = float(_2253);
    float _2257 = fma(_2119, _2235, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2259 = -_2231;
    float _2261 = _2259 + 1.0;
    float _2263 = _2231 * _2241;
    bool _2265 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2267 = isnan(_552);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2273 = _2269 || _2271;
    float _2275 = float(_2273);
    float _2277 = fma(_2237, _2079, -0.5);
    float _2279 = _2255 * _2261;
    float _2281 = -_2255;
    float _2283 = _2281 + 1.0;
    bool _2285 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2287 = isnan(_552);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = -_2275;
    float _2299 = _2297 + 1.0;
    float _2301 = -_698;
    float _2303 = fma(_950, _2277, _2301);
    int _2305 = as_type<int>(_2237);
    float _2307 = _2205;
    if (_1076)
    {
        float _2309 = -_688;
        float _2311 = _2309 + 1.0;
        _732 = as_type<int>(_2311);
    }
    int _2313 = _732;
    float _2315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2317 = _2295 * _2299;
    float _2319 = _2275 * _2283;
    float _2321 = fma(_2145, _2031, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    if (_1076)
    {
        float _2323 = _2113 ? as_type<float>(_2313) : _688;
        _1126 = _2323;
    }
    float _2325 = _1126;
    float _2327 = _2205 * _2317;
    bool _2329 = _1350 != 0.0;
    bool _2331 = isnan(_1350);
    bool _2333 = _2329 || _2331;
    bool _2335 = isnan(0.0);
    bool _2337 = _2333 || _2335;
    float _2339 = -_2295;
    float _2341 = _2339 + 1.0;
    float _2343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2345 = fma(_2173, _2061, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    bool _2347 = _1348 == 0.0;
    bool _2349 = !_2337;
    bool _2351 = _2347 && _2349;
    float _2353 = fma(_2341, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2327);
    int _2355 = as_type<int>(_2341);
    if (_2085)
    {
        float _2357 = -_688;
        float _2359 = _2357 + 1.0;
        _2305 = as_type<int>(_2359);
    }
    int _2361 = _2305;
    if (_2089)
    {
        float _2363 = -_688;
        float _2365 = _2363 + 1.0;
        _2355 = as_type<int>(_2365);
    }
    int _2367 = _2355;
    bool _2369 = _1324 == 0.0;
    bool _2371 = _2369 && _2351;
    float _2373 = fma(_2195, _2319, _2353);
    float _2375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2377 = _2315 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_2085)
    {
        _2307 = _688;
    }
    float _2379 = _2307;
    float _2381 = fma(_2257, _2279, _2373);
    float _2383 = _2379;
    if (_2085)
    {
        float _2385 = _2021 ? as_type<float>(_2361) : _688;
        _2383 = _2385;
    }
    float _2387 = _2383;
    float _2389 = fma(_2069, _2377, -0.5);
    if (_2089)
    {
        float _2391 = _2015 ? as_type<float>(_2367) : _688;
        _780 = _2391;
    }
    float _2393 = _780;
    float _2395 = fma(_2187, _2263, _2381);
    float _2397 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2399 = fma(_2189, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2401 = -_988;
    float _2403 = fma(_958, _2389, _2401);
    float _2405 = fma(_2393, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _2407 = fma(_2397, _2325, -0.5);
    float _2409 = fma(_2321, _2243, _2395);
    if (!_2371)
    {
        float _2411 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1036);
        _1150 = _2411;
    }
    float _2413 = _1150;
    if (!_2371)
    {
        float _2415 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1034);
        _1152 = _2415;
    }
    float _2417 = _1152;
    float _2419 = _2375 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2421 = fma(_954, _2407, _694);
    float _2423 = -_986;
    float _2425 = fma(_980, _2399, _2423);
    float _2427 = fma(_2345, _2219, _2409);
    float _2429 = fma(_2419, _2387, -0.5);
    float _2431 = fma(_964, _2405, _976);
    float _2433 = -_2413;
    float _2435 = _1364 * _2433;
    float _2437 = _1454 * _2413;
    float _2439 = _1360 * _2413;
    float _2441 = fma(_926, _2429, _970);
    float _2443 = _2303 + 0.5;
    float _2445 = _2421 + 0.5;
    float _2447 = _2431 + 0.5;
    float _2449 = _2425 + 0.5;
    float _2451 = fma(_2185, (*spvDescriptorSet0.vp_c9)._m0[121].x, _2427);
    float _2453 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2455 = fma(_1386, _2417, _2435);
    float _2457 = fma(_1416, _2417, _2437);
    float _2459 = fma(_1402, _2417, _2439);
    float _2461 = _2441 + 0.5;
    float _2463 = _2403 + 0.5;
    float _2465 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2453);
    out.m_71.x = _2445;
    out.m_71.y = _2443;
    out.m_71.z = _2447;
    out.m_71.w = _2449;
    if (!_2371)
    {
        float _2467 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1038);
        _1154 = _2467;
    }
    float _2469 = _1154;
    bool _2471 = _1682 > 0.0;
    bool _2473 = isnan(_1682);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(0.0);
    bool _2479 = _2475 || _2477;
    float _2481 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2465);
    out.m_73.x = _2461;
    out.m_73.y = _2463;
    float _2483 = fma(_1374, _2469, _2455);
    float _2485 = fma(_1464, _2469, _2457);
    float _2487 = fma(_1408, _2469, _2459);
    float _2489 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2491 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2481);
    out.m_75.x = _2483;
    out.m_75.y = _2485;
    out.m_75.z = _2487;
    float _2493 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2495 = _532 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2497 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2499 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2501 = _2493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2503 = _2495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2505 = _2497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2507 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2509 = _372 * _2489;
    float _2511 = _2491 + _1928;
    float _2513 = -_2499;
    float _2515 = _2513 + 1.0;
    out.m_77.x = _2501;
    out.m_77.y = _2503;
    out.m_77.z = _2505;
    out.m_77.w = _2507;
    float _2517 = _2511 * 0.5;
    out.gl_Position.x = _1960;
    out.gl_Position.y = _1964;
    out.gl_Position.z = _2491;
    out.gl_Position.w = _1928;
    out.m_79.z = _2517;
    out.m_79.w = _1928;
    float _2519 = _2509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _2519;
    float _2521 = _2499 * _1984;
    float _2523 = _1995 * _2515;
    float _2525 = _1995 * _2521;
    float _2527 = _2005 * _2521;
    float _2529 = fma(_2001, _2525, _1989);
    float _2531 = fma(_2003, _2525, _1991);
    float _2533 = fma(_1995, _2527, _1993);
    out.m_81.x = _2529;
    out.m_81.y = _2531;
    out.m_81.z = _2533;
    out.m_81.w = _2523;
    if (_2479)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2535 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2535;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = in.m_44.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_102);
    float _116 = 0.0;
    float _118 = _106;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_110)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_126);
        out.gl_Position.z = _2603;
    }
    if (!_110)
    {
        return out;
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = in.m_51.x;
    float _140 = float(_102);
    float _142 = in.m_51.y;
    bool _144 = _106 >= _140;
    bool _146 = !_136;
    bool _148 = _144 || _146;
    float _150 = in.m_51.z;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _114;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    int _154 = 0;
    if (_148)
    {
        float _156 = _152 * 5.0;
        _154 = as_type<int>(_156);
    }
    int _158 = _154;
    out.m_53.x = _138;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2666 = as_type<float>(_158);
        out.gl_Position.z = _2666;
    }
    out.m_53.y = _142;
    out.m_53.z = _150;
    if (_148)
    {
        return out;
    }
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _164 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = _162 * _160;
    if (!_174)
    {
        float _178 = _164 * _164;
        float _180 = _178 * 0.5;
        _116 = _180;
    }
    float _182 = _116;
    float _184 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _186 = in.m_44.x;
    float _188 = in.m_44.y;
    float _190 = in.m_44.z;
    float _192 = _182;
    if (!_174)
    {
        float _194 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _184 * 6.283185482025146484375;
    float _200 = floor(_184);
    float _202 = _198 * 0.15915493667125701904296875;
    int _204 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _206 = _204 != 0;
    float _208 = _202 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = 1.4012984643248170709237295832899e-45;
    float _214 = _196;
    if (!_174)
    {
        _212 = _164;
    }
    float _216 = _212;
    float _218 = -_200;
    float _220 = _184 + _218;
    bool _222 = !_174;
    float _224 = _216;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _164 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _164);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _254;
    }
    float _256 = _214;
    bool _258 = !_174;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _164 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _224 = _278;
    }
    float _280 = _224;
    float _282 = in.m_55.w;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _286 = _220 < 0.5;
    float _288 = float(_286);
    float _290 = in.m_42.x;
    float _292 = in.m_42.y;
    float _294 = in.m_42.z;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _302 = _300 != 0;
    float _304 = fma(_280, _186, _284);
    float _306 = -_288;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _310 = !_206;
    int _312 = _310 ? 0 : 1;
    float _314 = -_220;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _318 = !_298;
    int _320 = _318 ? 0 : 1;
    float _322 = fma(_210, 0.5, 0.5);
    float _324 = 1.0 / _140;
    float _326 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _328 = abs(_320);
    float _330 = -_322;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _334 = abs(_312);
    float _336 = fma(_280, _188, _326);
    bool _338 = !_302;
    int _340 = _338 ? 0 : 1;
    float _342 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _346 = abs(_340);
    float _348 = fma(_280, _190, _342);
    float _350 = float(_328);
    float _352 = float(_334);
    float _354 = fma(_304, _282, _290);
    float _356 = abs(_316);
    float _358 = _350 * _356;
    float _360 = fma(_348, _282, _294);
    float _362 = fma(_336, _282, _292);
    float _364 = float(_346);
    float _366 = fma(_352, _332, _358);
    float _368 = _106 * _324;
    float _370 = abs(_308);
    float _372 = fma(_364, _370, _366);
    bool _374 = !_344;
    float _376 = _368;
    float _392;
    if (!_374)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _380 = _138 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _368;
    }
    _394 = false;
    float _396 = _392;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _400 = _396 + _398;
    bool _402 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _416 = _396 + _414;
    bool _418 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _420 = isnan(_396);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _438 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _440 = isnan(_396);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -_412;
    float _452 = _450 + 1.0;
    float _454 = 1.0 / _432;
    float _456 = _448 * _452;
    float _458 = -_448;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _462;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _468 = 1.0 / _436;
    float _470 = _428 * _460;
    float _472 = -_428;
    float _474 = _472 + 1.0;
    float _476 = _400 * _454;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _482;
    float _486 = fma(_464, _476, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _488 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _490 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _492 = _416 * _468;
    float _494 = _486 * _470;
    float _496 = _488 * _470;
    float _498 = _490 * _470;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _512 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[107].x, _494);
    float _514 = fma(_502, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _516 = fma(_506, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _518 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[107].y, _496);
    float _520 = fma(_510, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _522 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[107].z, _498);
    float _524 = fma(_514, _456, _512);
    float _526 = fma(_516, _456, _518);
    float _528 = fma(_520, _456, _522);
    float _530 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[109].x, _524);
    float _532 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[109].y, _526);
    float _534 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[109].z, _528);
    bool _536 = !_466;
    if (!_536)
    {
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _540 = _138 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _544 = _542 * _538;
        float _546 = floor(_544);
        float _548 = -_546;
        float _550 = _544 + _548;
        _376 = _550;
    }
    float _552 = _376;
    float _554 = in.m_57.x;
    float _556 = in.m_57.y;
    float _558 = in.m_57.z;
    float _560 = in.m_57.w;
    float _562 = _150 * 2.0;
    float _564 = _138 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _576 = _574 != 0;
    float _578 = _138 * 2.0;
    float _580 = floor(_562);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _584 = _142 * 2.0;
    float _586 = in.m_51.w;
    float _588 = -_582;
    float _590 = fma(_564, 2.0, _588);
    float _592 = _150 * 6.283185482025146484375;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _596 = _594 != 0;
    float _598 = floor(_578);
    float _600 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _602 = _138 + _150;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _606 = _362 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _608 = _602 + (-1.0);
    float _610 = fma(_600, -2.0, _604);
    bool _612 = _580 > 0.0;
    float _614 = floor(_584);
    bool _616 = _580 >= 0.0;
    bool _618 = isnan(_580);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = fma(_558, 9.0, _592);
    float _628 = _138 * 6.283185482025146484375;
    float _630 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _632 = _624 ? 0 : 1;
    float _634 = _626 * 0.15915493667125701904296875;
    float _636 = fma(_558, 3.0, _628);
    float _638 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _640 = log2(_638);
    int _642 = ~_632;
    int _644 = _642 + 1;
    int _646 = _644 + 1;
    float _648 = _636 * 0.15915493667125701904296875;
    float _650 = _138 + _142;
    bool _652 = _598 >= 0.0;
    bool _654 = isnan(_598);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = in.m_59.y;
    int _664 = _646;
    if (!_612)
    {
        int _666 = ~_632;
        int _668 = _666 + 1;
        _664 = _668;
    }
    int _670 = _664;
    float _672 = _650 + (-1.0);
    float _674 = _634 * 6.283185482025146484375;
    float _676 = sin(_674);
    bool _678 = _614 >= 0.0;
    bool _680 = isnan(_614);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = in.m_59.x;
    int _690 = _660 ? 0 : 1;
    float _692 = -_106;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    bool _696 = _598 > 0.0;
    float _698 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _610);
    float _700 = _686 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _702 = _648 * 6.283185482025146484375;
    float _704 = sin(_702);
    bool _706 = _614 > 0.0;
    float _708 = -_558;
    float _710 = _708 + 1.0;
    float _712 = _640 * _106;
    int _714 = ~_690;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _722 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _724 = fma(_142, 0.5, -0.25);
    int _726 = _718;
    float _728 = _676;
    float _730 = _700;
    int _732 = as_type<int>(_698);
    if (!_696)
    {
        int _734 = ~_690;
        int _736 = _734 + 1;
        _726 = _736;
    }
    int _738 = _726;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _742 = fma(_586, 0.300000011920928955078125, 0.300000011920928955078125);
    float _744 = fma(_676, 0.25, _704);
    if (_596)
    {
        _728 = _138;
    }
    float _746 = _728;
    float _748 = exp2(_712);
    float _750 = _746;
    if (!_596)
    {
        _750 = _150;
    }
    float _752 = _750;
    float _754 = _744 * _742;
    int _756 = ~as_type<int>(_700);
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _764 = _760;
    if (!_706)
    {
        int _766 = ~as_type<int>(_700);
        int _768 = _766 + 1;
        _764 = _768;
    }
    int _770 = _764;
    float _772 = _752 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _774 = fma(_754, _710, _724);
    float _776 = fma(_688, 13.0, _628);
    float _778 = _772;
    float _780 = _688;
    if (!_596)
    {
        _730 = _142;
    }
    float _782 = _730;
    float _784 = -_720;
    float _786 = fma(_772, 2.0, _784);
    bool _788 = !_568;
    int _790 = _788 ? 0 : 1;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _794 = _782;
    if (_596)
    {
        _794 = _138;
    }
    float _796 = _794;
    float _798 = _776 * 0.15915493667125701904296875;
    int _800 = abs(_790);
    float _802 = -_748;
    float _804 = _802 + 1.0;
    if (!_596)
    {
        _778 = _150;
    }
    float _806 = _778;
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[83].z, _792);
    float _810 = _806;
    if (_596)
    {
        _810 = _142;
    }
    float _812 = _810;
    float _814 = _796 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _816 = float(_670);
    float _818 = _362 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _820 = float(_800);
    float _822 = -_740;
    float _824 = fma(_814, 2.0, _822);
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[83].w, _762);
    float _828 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _818);
    float _830 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
    float _832 = _820 * _816;
    float _834 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _828);
    float _836 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _830);
    float _838 = _830;
    float _840 = _834;
    if (!_596)
    {
        _838 = _150;
    }
    float _842 = _838;
    float _844 = _832 * (-2.0);
    float _846 = _834 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _848 = _836 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _850 = _842;
    if (_596)
    {
        _850 = _142;
    }
    float _852 = _850;
    float _854 = fma(_722, _844, _722);
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _858 = _846 + _856;
    float _860 = -_848;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _864 = _862;
    if (_596)
    {
        _840 = _142;
    }
    float _866 = _840;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _870 = _866;
    if (!_596)
    {
        _870 = _138;
    }
    float _872 = _870;
    float _874 = _852 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _876 = abs(_858);
    float _878 = abs(_862);
    float _880 = precise::max(_876, _878);
    float _882 = _142 * 6.283185482025146484375;
    float _884 = fma(_874, -2.0, _868);
    bool _886 = _880 >= 16.0;
    float _888 = fma(_662, 15.0, _882);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _892 = 1.0 + _890;
    float _894 = _888 * 0.15915493667125701904296875;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _900 = 1.0 / _892;
    float _902 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[88].z, _896);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _906 = !_576;
    int _908 = _906 ? 0 : 1;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _912 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _914 = isnan(1.0);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _920 = _916 || _918;
    float _922 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].w, _898);
    int _924 = abs(_908);
    float _926 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _902);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _930 = _872 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _932 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[78].z, _904);
    float _934 = _894 * 6.283185482025146484375;
    float _936 = sin(_934);
    bool _938 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _946 = _942 || _944;
    float _948 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[88].w, _910);
    float _950 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _922);
    float _952 = fma(_930, -2.0, _928);
    float _954 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _932);
    float _956 = _138 + (-0.5);
    float _958 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _948);
    float _960 = _858 * 0.0625;
    float _962 = _946 ? _804 : 0.0;
    float _964 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _966 = float(_924);
    float _968 = -_106;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[86].x, _786);
    float _972 = _886 ? _960 : _858;
    float _974 = -_106;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _824);
    float _978 = float(_770);
    float _980 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _826);
    bool _982 = !_572;
    int _984 = _982 ? 0 : 1;
    float _986 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _884);
    float _988 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _952);
    float _990 = _956 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _992 = _774 * _556;
    bool _994 = _920;
    if (_886)
    {
        float _996 = _862 * 0.0625;
        _864 = _996;
    }
    float _998 = _864;
    if (_920)
    {
        float _1000 = _962 * _900;
        _118 = _1000;
    }
    float _1002 = _118;
    float _1004 = abs(_972);
    bool _1006 = _1004 != 0.0;
    bool _1008 = isnan(_1004);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    float _1016 = _966 * _978;
    int _1018 = abs(_984);
    float _1020 = _142 + _150;
    float _1022 = fma(_854, _1002, _990);
    float _1024 = _992 * 0.15915493667125701904296875;
    float _1026 = abs(_998);
    bool _1028 = _1026 == 0.0;
    bool _1030 = !_1014;
    bool _1032 = _1028 && _1030;
    float _1034 = in.m_61.x;
    float _1036 = in.m_61.y;
    float _1038 = in.m_61.z;
    float _1040 = _1020 + (-1.0);
    float _1042 = float(_1018);
    float _1044 = in.m_63.x;
    float _1046 = in.m_63.y;
    float _1048 = in.m_63.z;
    float _1050 = float(_738);
    float _1052 = _798 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = in.m_55.x;
    float _1058 = in.m_55.y;
    float _1060 = in.m_55.z;
    float _1062 = _1016 * (-2.0);
    float _1064 = _1022 * 0.15915493667125701904296875;
    float _1066 = abs(_998);
    bool _1068 = _1066 == 0.0;
    float _1070 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1072 = _1042 * _1050;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1076 = _1074 != 0;
    float _1078 = _150 + (-0.5);
    float _1080 = fma(_630, _1062, _630);
    float _1082 = _1024 * 6.283185482025146484375;
    float _1084 = sin(_1082);
    float _1086 = _142 + (-0.5);
    float _1088 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1090 = _1072 * (-2.0);
    int _1092 = as_type<int>(_1088);
    int _1094 = as_type<int>(_1002);
    if (_1032)
    {
        bool _1096 = as_type<int>(_998) >= 0;
        _994 = _1096;
    }
    bool _1098 = _994;
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1102 = fma(_1080, _1002, _1088);
    float _1104 = fma(_1070, _1090, _1070);
    float _1106 = _1024 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    int _1110 = _1098 ? (-1) : 0;
    if (_1032)
    {
        int _1112 = _1098 ? 0 : 1078530011;
        _1092 = _1112;
    }
    int _1114 = _1092;
    float _1116 = _1054 + _936;
    float _1118 = fma(_1104, _1002, _1100);
    float _1120 = 0.0;
    if (!_1076)
    {
        _1120 = _688;
    }
    float _1122 = _1120;
    float _1124 = _1102 * 0.15915493667125701904296875;
    float _1126 = _1122;
    if (_1032)
    {
        int _1128 = int(0x80000000) & as_type<int>(_972);
        int _1130 = _1114 | _1128;
        _1094 = _1130;
    }
    int _1132 = _1094;
    float _1134 = _1064 * 6.283185482025146484375;
    float _1136 = sin(_1134);
    float _1138 = _1064 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    bool _1142 = !_1014;
    bool _1144 = _1142 && _1068;
    int _1146 = _1132;
    float _1148 = as_type<float>(_1132);
    float _1150 = _1036;
    float _1152 = _1034;
    float _1154 = _1038;
    if (!_1144)
    {
        float _1156 = abs(_972);
        bool _1158 = _1156 != as_type<float>(0x7f800000u /* inf */);
        bool _1160 = isnan(_1156);
        bool _1162 = _1158 || _1160;
        bool _1164 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1166 = _1162 || _1164;
        float _1168 = abs(_998);
        bool _1170 = _1168 == as_type<float>(0x7f800000u /* inf */);
        float _1172 = abs(_998);
        bool _1174 = _1172 == as_type<float>(0x7f800000u /* inf */);
        bool _1176 = !_1166;
        bool _1178 = _1174 && _1176;
        if (_1178)
        {
            bool _1180 = as_type<int>(_998) >= 0;
            _1110 = _1180 ? (-1) : 0;
        }
        int _1182 = _1110;
        if (_1178)
        {
            _1146 = 1075235812;
        }
        int _1184 = _1146;
        int _1186 = _1184;
        if (_1178)
        {
            int _1188 = ~_1182;
            int _1190 = (_1188 != 0) ? _1184 : 1061752795;
            _1186 = _1190;
        }
        int _1192 = _1186;
        float _1194 = as_type<float>(_1192);
        if (_1178)
        {
            int _1196 = int(0x80000000) & as_type<int>(_972);
            int _1198 = _1192 | _1196;
            _1194 = as_type<float>(_1198);
        }
        float _1200 = _1194;
        bool _1202 = !_1166;
        bool _1204 = _1202 && _1170;
        _1148 = _1200;
        if (!_1204)
        {
            float _1206 = abs(_972);
            float _1208 = abs(_998);
            float _1210 = precise::max(_1206, _1208);
            float _1212 = abs(_972);
            float _1214 = abs(_998);
            float _1216 = precise::min(_1212, _1214);
            float _1218 = 1.0 / _1210;
            float _1220 = abs(_972);
            float _1222 = abs(_998);
            bool _1224 = _1220 > _1222;
            bool _1226 = as_type<int>(_998) >= 0;
            float _1228 = abs(_972);
            float _1230 = abs(_998);
            float _1232 = _1228 + _1230;
            int _1234 = as_type<int>(_972) & int(0x80000000);
            bool _1236 = _1232 > as_type<float>(0x7f800000u /* inf */);
            bool _1238 = isnan(_1232);
            bool _1240 = _1236 || _1238;
            bool _1242 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1244 = _1240 || _1242;
            float _1246 = _1216 * _1218;
            float _1248 = _1246 * _1246;
            float _1250 = _1248 + 11.33538818359375;
            float _1252 = fma(_1248, _1250, 28.84246826171875);
            float _1254 = fma(_1248, _1252, 19.6966705322265625);
            float _1256 = fma(_1248, -0.82336294651031494140625, -5.674867153167724609375);
            float _1258 = fma(_1248, _1256, -6.565555095672607421875);
            float _1260 = 1.0 / _1254;
            float _1262 = _1248 * _1258;
            float _1264 = _1246 * _1262;
            float _1266 = fma(_1264, _1260, _1246);
            float _1268 = _1266;
            _1148 = _1232;
            if (_1224)
            {
                float _1270 = -_1266;
                float _1272 = _1270 + 1.57079637050628662109375;
                _1268 = _1272;
            }
            float _1274 = _1268;
            int _1276 = as_type<int>(_1274);
            if (!_1226)
            {
                float _1278 = -_1274;
                float _1280 = _1278 + 3.1415927410125732421875;
                _1276 = as_type<int>(_1280);
            }
            int _1282 = _1276;
            if (!_1244)
            {
                int _1284 = _1234 | _1282;
                _1148 = as_type<float>(_1284);
            }
        }
    }
    float _1286 = _1148;
    float _1288 = -_560;
    float _1290 = _1288 + 1.0;
    float _1292 = _1116 * 0.0599999986588954925537109375;
    float _1294 = -_1286;
    float _1296 = _1118 + _1294;
    float _1298 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1300 = _1124 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1292 * _1290;
    float _1306 = _1296 * 0.15915493667125701904296875;
    float _1308 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1310 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1312 = _554 * _1304;
    float _1314 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1316 = _1306 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = fma(_1036, _1312, _1046);
    float _1322 = fma(_1034, _1312, _1044);
    float _1324 = fma(_1038, _1312, _1048);
    float _1326 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1328 = _1320 * _1084;
    float _1330 = _1320 * _1108;
    bool _1332 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1334 = isnan(0.5);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1340 = _1336 || _1338;
    float _1342 = _1306 * 6.283185482025146484375;
    float _1344 = cos(_1342);
    float _1346 = -_1328;
    float _1348 = fma(_1322, _1108, _1346);
    float _1350 = fma(_1322, _1084, _1330);
    float _1352 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1324);
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1348);
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1350);
    float _1360 = _1136 * _1302;
    float _1362 = _1124 * 6.283185482025146484375;
    float _1364 = sin(_1362);
    float _1366 = _1354 * _1326;
    float _1368 = _1356 * _1314;
    float _1370 = _1358 * _1352;
    float _1372 = _1140 * _1318;
    float _1374 = _1318 * _1302;
    float _1376 = _362 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1378 = _1360 * _1370;
    float _1380 = _1136 * _1344;
    float _1382 = _1136 * _1318;
    float _1384 = _1140 * _1344;
    float _1386 = _1344 * _1302;
    float _1388 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1376);
    bool _1390 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1392 = isnan(0.5);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1398 = _1394 || _1396;
    float _1400 = -_1372;
    float _1402 = fma(_1364, _1380, _1400);
    float _1404 = -_1370;
    float _1406 = _1364 * _1404;
    float _1408 = fma(_1364, _1382, _1384);
    float _1410 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1388);
    float _1412 = fma(_1402, _1368, _1378);
    float _1414 = fma(_1386, _1368, _1406);
    float _1416 = fma(_1364, _1384, _1382);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1420 = fma(_1408, _1366, _1412);
    float _1422 = fma(_1374, _1366, _1414);
    float _1424 = _848 + _1420;
    float _1426 = _846 + _1422;
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1432 = _1424 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1436 = _1426 + _1434;
    float _1438 = _1432 * _1432;
    float _1440 = fma(_1436, _1436, _1438);
    float _1442 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1428);
    float _1444 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1446 = sqrt(_1440);
    float _1448 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1442);
    float _1450 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1444);
    float _1452 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1454 = _1140 * _1302;
    float _1456 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1450);
    float _1458 = 1.0 / _1452;
    float _1460 = _1454 * _1370;
    float _1462 = -_1380;
    float _1464 = fma(_1364, _1372, _1462);
    float _1466 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1468 = fma(_1416, _1368, _1460);
    bool _1470 = _1446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1466 + _1452;
    float _1474 = fma(_1464, _1366, _1468);
    float _1476 = _1418 + _1474;
    float _1478 = _1472 * _1458;
    float _1480 = _1478 * 0.5;
    float _1482 = _1372;
    float _1484 = _1474;
    float _1486 = _1426;
    float _1488 = _1380;
    float _1490 = _1440;
    float _1492 = _1424;
    float _1494 = _1480;
    float _1496 = _1382;
    if (!_1470)
    {
        _1482 = _1424;
    }
    float _1498 = _1482;
    float _1500 = _1498;
    if (!_1470)
    {
        _1484 = _1476;
    }
    float _1502 = _1484;
    bool _1504 = !_1470;
    float _1506 = _1502;
    if (!_1504)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1512 = _1446 + _1510;
        float _1514 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1516 = rsqrt(_1440);
        float _1518 = _1512 * _1508;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1520 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = _1520 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        float _1530 = _1524 + (-1.0);
        float _1532 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = fma(_1528, _1514, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1536 = fma(_1476, _1524, _1532);
        float _1538 = _1516 * _1534;
        float _1540 = fma(_1436, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1542 = fma(_1432, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1486 = _1540;
        _1506 = _1536;
        _1500 = _1542;
        _1488 = _1538;
        _1490 = _1516;
    }
    float _1544 = _1486;
    float _1546 = _1506;
    float _1548 = _1500;
    float _1550 = _1488;
    float _1552 = _1490;
    float _1554 = _1550;
    float _1556 = _1546;
    float _1558 = _1548;
    float _1560 = _1552;
    if (_1398)
    {
        _1492 = 1.0;
    }
    float _1562 = _1492;
    float _1564 = _1562;
    if (_1340)
    {
        _1554 = _1544;
    }
    float _1566 = _1554;
    float _1568 = _1566;
    if (!_1340)
    {
        float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1572 = _1418 + _1570;
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1576 = -_846;
        float _1578 = _1576 + _1544;
        float _1580 = -_1418;
        float _1582 = _1580 + _1546;
        float _1584 = _1572 * _1572;
        float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1588 = _848 + _1586;
        float _1590 = -_848;
        float _1592 = _1590 + _1548;
        float _1594 = fma(_858, _858, _1584);
        float _1596 = fma(_1588, _1588, _1594);
        float _1598 = sqrt(_1596);
        float _1600 = precise::min(_1598, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1602 = _1600 * _1574;
        float _1604 = fma(_1578, _1602, _846);
        float _1606 = fma(_1582, _1602, _1418);
        float _1608 = fma(_1592, _1602, _848);
        _1556 = _1606;
        _1568 = _1604;
        _1558 = _1608;
        _1560 = _1574;
    }
    float _1610 = _1556;
    float _1612 = _1568;
    float _1614 = _1558;
    float _1616 = _1560;
    float _1618 = _1616;
    if (!_1398)
    {
        float _1620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1622 = _1620 * 0.15915493667125701904296875;
        float _1624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1628 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1626);
        float _1630 = _1622 * 6.283185482025146484375;
        float _1632 = cos(_1630);
        float _1634 = _1624 * 0.15915493667125701904296875;
        float _1636 = _1622 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = 1.0 / _1632;
        float _1642 = _1634 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        float _1646 = _1638 * _1640;
        float _1648 = _1634 * 6.283185482025146484375;
        float _1650 = sin(_1648);
        float _1652 = _1644 * _1646;
        float _1654 = 1.0 / _1628;
        float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1658 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1656;
        float _1660 = 1.0 / _1652;
        float _1662 = 1.0 / _1658;
        float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1666 = _1654 * _1664;
        float _1668 = _1650 * _1660;
        float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1672 = fma(_1668, _1666, _1670);
        float _1674 = _1672 * _1662;
        float _1676 = precise::clamp(_1674, 0.0, 1.0);
        _1494 = _1654;
        _1618 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _1564 = _1676;
    }
    float _1678 = _1494;
    float _1680 = _1618;
    float _1682 = _1564;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1686 = _1610 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1690 = _1612 + _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1694 = _1614 + _1692;
    float _1696 = _1686 * _1686;
    float _1698 = fma(_1690, _1690, _1696);
    float _1700 = fma(_1694, _1694, _1698);
    float _1702 = rsqrt(_1700);
    float _1704 = sqrt(_1700);
    float _1706 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1708 = _1690 * _1706;
    float _1710 = _1694 * _1706;
    float _1712 = _1708 * _1708;
    float _1714 = _1710 * _1710;
    float _1716 = _1712 + _1714;
    float _1718 = sqrt(_1716);
    bool _1720 = _1718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1718 + _1722;
    float _1726 = _1678;
    float _1728 = _1716;
    float _1730 = _1724;
    float _1732 = _1686;
    float _1734 = _1708;
    float _1736 = _1710;
    float _1738 = _1712;
    float _1740 = _1714;
    if (_1720)
    {
        float _1742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1742;
    }
    float _1744 = _1726;
    if (_1720)
    {
        float _1746 = rsqrt(_1716);
        _1728 = _1746;
    }
    float _1748 = _1728;
    if (_1720)
    {
        float _1750 = _1724 * _1744;
        _1730 = _1750;
    }
    float _1752 = _1730;
    if (_1720)
    {
        float _1754 = _1752 * 0.15915493667125701904296875;
        _1496 = _1754;
    }
    float _1756 = _1496;
    float _1758 = _1680;
    if (_1720)
    {
        float _1760 = _1756 * 6.283185482025146484375;
        float _1762 = sin(_1760);
        _1758 = _1762;
    }
    float _1764 = _1758;
    float _1766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1768 = precise::max(0.0, _1766);
    float _1770 = _1744;
    float _1772 = _1768;
    if (_1720)
    {
        float _1774 = _1756 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = -_1706;
    float _1782 = -_1768;
    float _1784 = fma(_1686, _1780, _1782);
    if (_1720)
    {
        float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1732 = _1786;
    }
    float _1788 = _1732;
    float _1790 = _1788;
    float _1792 = _1764;
    if (_1720)
    {
        float _1794 = fma(_1764, _1788, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1790 = _1794;
    }
    float _1796 = _1790;
    float _1798 = _1796;
    if (_1720)
    {
        float _1800 = _1778 + (-1.0);
        _1772 = _1800;
    }
    float _1802 = _1772;
    float _1804 = _1802;
    if (_1720)
    {
        float _1806 = _1748 * _1796;
        _1792 = _1806;
    }
    float _1808 = _1792;
    if (!_1720)
    {
        _1798 = _1784;
    }
    float _1810 = _1798;
    float _1812 = _1810;
    if (_1720)
    {
        float _1814 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1804 = _1814;
    }
    float _1816 = _1804;
    if (_1720)
    {
        float _1818 = _1708 * _1808;
        _1734 = _1818;
    }
    float _1820 = _1734;
    if (_1720)
    {
        float _1822 = _1710 * _1808;
        _1736 = _1822;
    }
    float _1824 = _1736;
    if (_1720)
    {
        float _1826 = fma(_1784, _1778, _1816);
        _1812 = _1826;
    }
    float _1828 = _1812;
    if (_1720)
    {
        float _1830 = _1820 * _1820;
        _1738 = _1830;
    }
    float _1832 = _1738;
    if (_1720)
    {
        float _1834 = _1824 * _1824;
        _1740 = _1834;
    }
    float _1836 = _1740;
    float _1838 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = fma(_1828, _1828, _1832);
    float _1848 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1850 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1838);
    float _1852 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1854 = _1846 + _1836;
    float _1856 = -_1844;
    float _1858 = _1856 + 1.0;
    float _1860 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1862 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1852);
    float _1864 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1850);
    float _1866 = abs(_1858);
    float _1868 = log2(_1866);
    float _1870 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1860);
    float _1872 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1862);
    float _1874 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1876 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1878 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1870);
    float _1880 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1882 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1884 = rsqrt(_1854);
    float _1886 = _1878 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1888 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1876);
    float _1890 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1892 = -_1882;
    float _1894 = fma(_1892, _1848, 1.0);
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1898 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1888);
    float _1900 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1890);
    float _1902 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1904 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1896);
    float _1906 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1908 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1900);
    float _1910 = log2(_1894);
    float _1912 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1904);
    float _1914 = _1884 * _1820;
    float _1916 = _1884 * _1828;
    float _1918 = _1884 * _1824;
    float _1920 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1922 = exp2(_1902);
    float _1924 = -_1920;
    float _1926 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1924);
    float _1928 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1908);
    float _1930 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1932 = -_1918;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1926);
    float _1936 = _1910 * 0.693147182464599609375;
    float _1938 = 1.0 / _1928;
    float _1940 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1930);
    float _1942 = fma(_1934, -0.5, 0.5);
    float _1944 = fma(_1934, 0.5, 0.5);
    float _1946 = _1916 + 1.0;
    float _1948 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1940);
    float _1950 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1952 = fma(_1944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1954 = sqrt(_1942);
    float _1956 = -_1916;
    float _1958 = fma(_1922, _1946, _1956);
    float _1960 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1948);
    float _1962 = fma(_1944, _1952, -0.212114393711090087890625);
    float _1964 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1912);
    float _1966 = fma(_1958, 0.5, 0.5);
    float _1968 = fma(_1944, _1962, 1.570728778839111328125);
    float _1970 = _1960 * _1938;
    float _1972 = _1964 * _1938;
    float _1974 = fma(_1970, 0.5, 0.5);
    float _1976 = fma(_1972, -0.5, 0.5);
    float _1978 = _1954 * 0.636619746685028076171875;
    float _1980 = -_1968;
    float _1982 = fma(_1978, _1980, 1.0);
    float3 _5462 = float3(_1974, _1976, _1950);
    float _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5462, float3(0.0), isnan(_5462)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5462, float3(0.0), isnan(_5462)), level(0.0)).x;
    float3 _5473 = float3(_1974, _1976, _1950);
    float4 _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5473, float3(0.0), isnan(_5473)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5473, float3(0.0), isnan(_5473)), level(0.0)).xyzw;
    float _1989 = _1987.x;
    float _1991 = _1987.y;
    float _1993 = _1987.z;
    float _1995 = _1987.w;
    float2 _5490 = float2(_1982, _1966);
    float3 _1999 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5490, float2(0.0), isnan(_5490)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5490, float2(0.0), isnan(_5490)), level(0.0)).xyz;
    float _2001 = _1999.x;
    float _2003 = _1999.y;
    float _2005 = _1999.z;
    out.m_65.x = _554;
    out.m_65.y = _556;
    out.m_65.z = _558;
    out.m_65.w = _560;
    float _2007 = -_662;
    float _2009 = _2007 + 1.0;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2015 = _150 > 0.5;
    float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2019 = _2017 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2021 = _142 > 0.5;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2025 = _2023 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2027 = 1.0 / _2013;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2031 = _552 + _2029;
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2035 = _2033 != 0;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2039 = _2037 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2045 = 1.0 / _2019;
    int _2047 = _2015 ? as_type<int>(_2009) : as_type<int>(_662);
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2051 = _2049 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2057 = _2055 != 0;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2061 = _552 + _2059;
    int _2063 = _2021 ? as_type<int>(_2009) : as_type<int>(_662);
    float _2065 = 1.0 / _2051;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2069 = _2035 ? as_type<float>(_2047) : _662;
    float _2071 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2073 = _586 > 0.5;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2077 = 1.0 / _2025;
    float _2079 = _2057 ? as_type<float>(_2063) : _662;
    float _2081 = _2075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1612;
    out.m_67.y = _1610;
    out.m_67.z = _1614;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2085 = _2083 != 0;
    int _2087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2089 = _2087 != 0;
    float _2091 = 1.0 / _2043;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2095 = _2093 != 0;
    int _2097 = _2073 ? as_type<int>(_2009) : as_type<int>(_662);
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _2099;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _2105 = _2103 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _2107 = 1.0 / _2039;
    bool _2109 = _2073;
    if (_1076)
    {
        bool _2111 = _138 > 0.5;
        _2109 = _2111;
    }
    bool _2113 = _2109;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2115;
    float _2119 = _2117 * _2077;
    float _2121 = exp2(_2071);
    float _2123 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2125 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2127;
    float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2133 = _2131 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_69.x = _2081;
    out.m_69.y = _2123;
    out.m_69.z = _2125;
    float _2135 = _2133 * _2027;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _2139 = _2137 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _2141 = _2129 * _2045;
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2145 = _2101 * _2107;
    float _2147 = _2139 * _2091;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2151 = _552 + _2149;
    bool _2153 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _2155 = isnan(_552);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _2161 = _2157 || _2159;
    float _2163 = float(_2161);
    float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2167 = _552 + _2165;
    float _2169 = -_2121;
    float _2171 = _2169 + 1.0;
    float _2173 = _2105 * _2065;
    bool _2175 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _2177 = isnan(_552);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _2183 = _2179 || _2181;
    float _2185 = float(_2183);
    float _2187 = fma(_2147, _2167, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _2189 = _2095 ? as_type<float>(_2097) : _662;
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2193 = _552 + _2191;
    float _2195 = fma(_2135, _2151, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2197 = -_2185;
    float _2199 = _2197 + 1.0;
    float _2201 = -_2163;
    float _2203 = _2201 + 1.0;
    float _2205 = fma(_2141, _2193, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2207 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _2209 = isnan(_552);
    bool _2211 = _2207 || _2209;
    bool _2213 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _2215 = _2211 || _2213;
    float _2217 = float(_2215);
    float _2219 = _2163 * _2199;
    bool _2221 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2223 = isnan(_552);
    bool _2225 = _2221 || _2223;
    bool _2227 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2229 = _2225 || _2227;
    float _2231 = float(_2229);
    float _2233 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2235 = _552 + _2233;
    float _2237 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2239 = -_2217;
    float _2241 = _2239 + 1.0;
    float _2243 = _2217 * _2203;
    bool _2245 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2247 = isnan(_552);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2253 = _2249 || _2251;
    float _2255 = float(_2253);
    float _2257 = fma(_2119, _2235, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2259 = -_2231;
    float _2261 = _2259 + 1.0;
    float _2263 = _2231 * _2241;
    bool _2265 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2267 = isnan(_552);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2273 = _2269 || _2271;
    float _2275 = float(_2273);
    float _2277 = fma(_2237, _2079, -0.5);
    float _2279 = _2255 * _2261;
    float _2281 = -_2255;
    float _2283 = _2281 + 1.0;
    bool _2285 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2287 = isnan(_552);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = -_2275;
    float _2299 = _2297 + 1.0;
    float _2301 = -_698;
    float _2303 = fma(_950, _2277, _2301);
    int _2305 = as_type<int>(_2237);
    float _2307 = _2205;
    if (_1076)
    {
        float _2309 = -_688;
        float _2311 = _2309 + 1.0;
        _732 = as_type<int>(_2311);
    }
    int _2313 = _732;
    float _2315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2317 = _2295 * _2299;
    float _2319 = _2275 * _2283;
    float _2321 = fma(_2145, _2031, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    if (_1076)
    {
        float _2323 = _2113 ? as_type<float>(_2313) : _688;
        _1126 = _2323;
    }
    float _2325 = _1126;
    float _2327 = _2205 * _2317;
    bool _2329 = _1350 != 0.0;
    bool _2331 = isnan(_1350);
    bool _2333 = _2329 || _2331;
    bool _2335 = isnan(0.0);
    bool _2337 = _2333 || _2335;
    float _2339 = -_2295;
    float _2341 = _2339 + 1.0;
    float _2343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2345 = fma(_2173, _2061, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    bool _2347 = _1348 == 0.0;
    bool _2349 = !_2337;
    bool _2351 = _2347 && _2349;
    float _2353 = fma(_2341, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2327);
    int _2355 = as_type<int>(_2341);
    if (_2085)
    {
        float _2357 = -_688;
        float _2359 = _2357 + 1.0;
        _2305 = as_type<int>(_2359);
    }
    int _2361 = _2305;
    if (_2089)
    {
        float _2363 = -_688;
        float _2365 = _2363 + 1.0;
        _2355 = as_type<int>(_2365);
    }
    int _2367 = _2355;
    bool _2369 = _1324 == 0.0;
    bool _2371 = _2369 && _2351;
    float _2373 = fma(_2195, _2319, _2353);
    float _2375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2377 = _2315 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_2085)
    {
        _2307 = _688;
    }
    float _2379 = _2307;
    float _2381 = fma(_2257, _2279, _2373);
    float _2383 = _2379;
    if (_2085)
    {
        float _2385 = _2021 ? as_type<float>(_2361) : _688;
        _2383 = _2385;
    }
    float _2387 = _2383;
    float _2389 = fma(_2069, _2377, -0.5);
    if (_2089)
    {
        float _2391 = _2015 ? as_type<float>(_2367) : _688;
        _780 = _2391;
    }
    float _2393 = _780;
    float _2395 = fma(_2187, _2263, _2381);
    float _2397 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2399 = fma(_2189, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2401 = -_988;
    float _2403 = fma(_958, _2389, _2401);
    float _2405 = fma(_2393, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _2407 = fma(_2397, _2325, -0.5);
    float _2409 = fma(_2321, _2243, _2395);
    if (!_2371)
    {
        float _2411 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1036);
        _1150 = _2411;
    }
    float _2413 = _1150;
    if (!_2371)
    {
        float _2415 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1034);
        _1152 = _2415;
    }
    float _2417 = _1152;
    float _2419 = _2375 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2421 = fma(_954, _2407, _694);
    float _2423 = -_986;
    float _2425 = fma(_980, _2399, _2423);
    float _2427 = fma(_2345, _2219, _2409);
    float _2429 = fma(_2419, _2387, -0.5);
    float _2431 = fma(_964, _2405, _976);
    float _2433 = -_2413;
    float _2435 = _1364 * _2433;
    float _2437 = _1454 * _2413;
    float _2439 = _1360 * _2413;
    float _2441 = fma(_926, _2429, _970);
    float _2443 = _2303 + 0.5;
    float _2445 = _2421 + 0.5;
    float _2447 = _2431 + 0.5;
    float _2449 = _2425 + 0.5;
    float _2451 = fma(_2185, (*spvDescriptorSet0.vp_c9)._m0[121].x, _2427);
    float _2453 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2455 = fma(_1386, _2417, _2435);
    float _2457 = fma(_1416, _2417, _2437);
    float _2459 = fma(_1402, _2417, _2439);
    float _2461 = _2441 + 0.5;
    float _2463 = _2403 + 0.5;
    float _2465 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2453);
    out.m_71.x = _2445;
    out.m_71.y = _2443;
    out.m_71.z = _2447;
    out.m_71.w = _2449;
    if (!_2371)
    {
        float _2467 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1038);
        _1154 = _2467;
    }
    float _2469 = _1154;
    bool _2471 = _1682 > 0.0;
    bool _2473 = isnan(_1682);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(0.0);
    bool _2479 = _2475 || _2477;
    float _2481 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2465);
    out.m_73.x = _2461;
    out.m_73.y = _2463;
    float _2483 = fma(_1374, _2469, _2455);
    float _2485 = fma(_1464, _2469, _2457);
    float _2487 = fma(_1408, _2469, _2459);
    float _2489 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2491 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2481);
    out.m_75.x = _2483;
    out.m_75.y = _2485;
    out.m_75.z = _2487;
    float _2493 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2495 = _532 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2497 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2499 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2501 = _2493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2503 = _2495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2505 = _2497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2507 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2509 = _372 * _2489;
    float _2511 = _2491 + _1928;
    float _2513 = -_2499;
    float _2515 = _2513 + 1.0;
    out.m_77.x = _2501;
    out.m_77.y = _2503;
    out.m_77.z = _2505;
    out.m_77.w = _2507;
    float _2517 = _2511 * 0.5;
    out.gl_Position.x = _1960;
    out.gl_Position.y = _1964;
    out.gl_Position.z = _2491;
    out.gl_Position.w = _1928;
    out.m_79.z = _2517;
    out.m_79.w = _1928;
    float _2519 = _2509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _2519;
    float _2521 = _2499 * _1984;
    float _2523 = _1995 * _2515;
    float _2525 = _1995 * _2521;
    float _2527 = _2005 * _2521;
    float _2529 = fma(_2001, _2525, _1989);
    float _2531 = fma(_2003, _2525, _1991);
    float _2533 = fma(_1995, _2527, _1993);
    out.m_81.x = _2529;
    out.m_81.y = _2531;
    out.m_81.z = _2533;
    out.m_81.w = _2523;
    if (_2479)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2535 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2535;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = in.m_44.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_102);
    float _116 = 0.0;
    float _118 = _106;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_110)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_126);
        out.gl_Position.z = _2603;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = in.m_51.x;
    float _140 = float(_102);
    float _142 = in.m_51.y;
    bool _144 = _106 >= _140;
    bool _146 = !_136;
    bool _148 = _144 || _146;
    float _150 = in.m_51.z;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _114;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    int _154 = 0;
    if (_148)
    {
        float _156 = _152 * 5.0;
        _154 = as_type<int>(_156);
    }
    int _158 = _154;
    out.m_53.x = _138;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2666 = as_type<float>(_158);
        out.gl_Position.z = _2666;
    }
    out.m_53.y = _142;
    out.m_53.z = _150;
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _164 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = _162 * _160;
    if (!_174)
    {
        float _178 = _164 * _164;
        float _180 = _178 * 0.5;
        _116 = _180;
    }
    float _182 = _116;
    float _184 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _186 = in.m_44.x;
    float _188 = in.m_44.y;
    float _190 = in.m_44.z;
    float _192 = _182;
    if (!_174)
    {
        float _194 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _184 * 6.283185482025146484375;
    float _200 = floor(_184);
    float _202 = _198 * 0.15915493667125701904296875;
    int _204 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _206 = _204 != 0;
    float _208 = _202 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = 1.4012984643248170709237295832899e-45;
    float _214 = _196;
    if (!_174)
    {
        _212 = _164;
    }
    float _216 = _212;
    float _218 = -_200;
    float _220 = _184 + _218;
    bool _222 = !_174;
    float _224 = _216;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _164 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _164);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _254;
    }
    float _256 = _214;
    bool _258 = !_174;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _164 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _224 = _278;
    }
    float _280 = _224;
    float _282 = in.m_55.w;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _286 = _220 < 0.5;
    float _288 = float(_286);
    float _290 = in.m_42.x;
    float _292 = in.m_42.y;
    float _294 = in.m_42.z;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _302 = _300 != 0;
    float _304 = fma(_280, _186, _284);
    float _306 = -_288;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _310 = !_206;
    int _312 = _310 ? 0 : 1;
    float _314 = -_220;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _318 = !_298;
    int _320 = _318 ? 0 : 1;
    float _322 = fma(_210, 0.5, 0.5);
    float _324 = 1.0 / _140;
    float _326 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _328 = abs(_320);
    float _330 = -_322;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _334 = abs(_312);
    float _336 = fma(_280, _188, _326);
    bool _338 = !_302;
    int _340 = _338 ? 0 : 1;
    float _342 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _346 = abs(_340);
    float _348 = fma(_280, _190, _342);
    float _350 = float(_328);
    float _352 = float(_334);
    float _354 = fma(_304, _282, _290);
    float _356 = abs(_316);
    float _358 = _350 * _356;
    float _360 = fma(_348, _282, _294);
    float _362 = fma(_336, _282, _292);
    float _364 = float(_346);
    float _366 = fma(_352, _332, _358);
    float _368 = _106 * _324;
    float _370 = abs(_308);
    float _372 = fma(_364, _370, _366);
    bool _374 = !_344;
    float _376 = _368;
    float _392;
    if (!_374)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _380 = _138 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _368;
    }
    _394 = false;
    float _396 = _392;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _400 = _396 + _398;
    bool _402 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _416 = _396 + _414;
    bool _418 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _420 = isnan(_396);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _438 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _440 = isnan(_396);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -_412;
    float _452 = _450 + 1.0;
    float _454 = 1.0 / _432;
    float _456 = _448 * _452;
    float _458 = -_448;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _462;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _468 = 1.0 / _436;
    float _470 = _428 * _460;
    float _472 = -_428;
    float _474 = _472 + 1.0;
    float _476 = _400 * _454;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _482;
    float _486 = fma(_464, _476, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _488 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _490 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _492 = _416 * _468;
    float _494 = _486 * _470;
    float _496 = _488 * _470;
    float _498 = _490 * _470;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _512 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[107].x, _494);
    float _514 = fma(_502, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _516 = fma(_506, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _518 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[107].y, _496);
    float _520 = fma(_510, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _522 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[107].z, _498);
    float _524 = fma(_514, _456, _512);
    float _526 = fma(_516, _456, _518);
    float _528 = fma(_520, _456, _522);
    float _530 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[109].x, _524);
    float _532 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[109].y, _526);
    float _534 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[109].z, _528);
    bool _536 = !_466;
    if (!_536)
    {
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _540 = _138 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _544 = _542 * _538;
        float _546 = floor(_544);
        float _548 = -_546;
        float _550 = _544 + _548;
        _376 = _550;
    }
    float _552 = _376;
    float _554 = in.m_57.x;
    float _556 = in.m_57.y;
    float _558 = in.m_57.z;
    float _560 = in.m_57.w;
    float _562 = _150 * 2.0;
    float _564 = _138 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _576 = _574 != 0;
    float _578 = _138 * 2.0;
    float _580 = floor(_562);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _584 = _142 * 2.0;
    float _586 = in.m_51.w;
    float _588 = -_582;
    float _590 = fma(_564, 2.0, _588);
    float _592 = _150 * 6.283185482025146484375;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _596 = _594 != 0;
    float _598 = floor(_578);
    float _600 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _602 = _138 + _150;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _606 = _362 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _608 = _602 + (-1.0);
    float _610 = fma(_600, -2.0, _604);
    bool _612 = _580 > 0.0;
    float _614 = floor(_584);
    bool _616 = _580 >= 0.0;
    bool _618 = isnan(_580);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = fma(_558, 9.0, _592);
    float _628 = _138 * 6.283185482025146484375;
    float _630 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _632 = _624 ? 0 : 1;
    float _634 = _626 * 0.15915493667125701904296875;
    float _636 = fma(_558, 3.0, _628);
    float _638 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _640 = log2(_638);
    int _642 = ~_632;
    int _644 = _642 + 1;
    int _646 = _644 + 1;
    float _648 = _636 * 0.15915493667125701904296875;
    float _650 = _138 + _142;
    bool _652 = _598 >= 0.0;
    bool _654 = isnan(_598);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = in.m_59.y;
    int _664 = _646;
    if (!_612)
    {
        int _666 = ~_632;
        int _668 = _666 + 1;
        _664 = _668;
    }
    int _670 = _664;
    float _672 = _650 + (-1.0);
    float _674 = _634 * 6.283185482025146484375;
    float _676 = sin(_674);
    bool _678 = _614 >= 0.0;
    bool _680 = isnan(_614);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = in.m_59.x;
    int _690 = _660 ? 0 : 1;
    float _692 = -_106;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    bool _696 = _598 > 0.0;
    float _698 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _610);
    float _700 = _686 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _702 = _648 * 6.283185482025146484375;
    float _704 = sin(_702);
    bool _706 = _614 > 0.0;
    float _708 = -_558;
    float _710 = _708 + 1.0;
    float _712 = _640 * _106;
    int _714 = ~_690;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _722 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _724 = fma(_142, 0.5, -0.25);
    int _726 = _718;
    float _728 = _676;
    float _730 = _700;
    int _732 = as_type<int>(_698);
    if (!_696)
    {
        int _734 = ~_690;
        int _736 = _734 + 1;
        _726 = _736;
    }
    int _738 = _726;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _742 = fma(_586, 0.300000011920928955078125, 0.300000011920928955078125);
    float _744 = fma(_676, 0.25, _704);
    if (_596)
    {
        _728 = _138;
    }
    float _746 = _728;
    float _748 = exp2(_712);
    float _750 = _746;
    if (!_596)
    {
        _750 = _150;
    }
    float _752 = _750;
    float _754 = _744 * _742;
    int _756 = ~as_type<int>(_700);
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _764 = _760;
    if (!_706)
    {
        int _766 = ~as_type<int>(_700);
        int _768 = _766 + 1;
        _764 = _768;
    }
    int _770 = _764;
    float _772 = _752 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _774 = fma(_754, _710, _724);
    float _776 = fma(_688, 13.0, _628);
    float _778 = _772;
    float _780 = _688;
    if (!_596)
    {
        _730 = _142;
    }
    float _782 = _730;
    float _784 = -_720;
    float _786 = fma(_772, 2.0, _784);
    bool _788 = !_568;
    int _790 = _788 ? 0 : 1;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _794 = _782;
    if (_596)
    {
        _794 = _138;
    }
    float _796 = _794;
    float _798 = _776 * 0.15915493667125701904296875;
    int _800 = abs(_790);
    float _802 = -_748;
    float _804 = _802 + 1.0;
    if (!_596)
    {
        _778 = _150;
    }
    float _806 = _778;
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[83].z, _792);
    float _810 = _806;
    if (_596)
    {
        _810 = _142;
    }
    float _812 = _810;
    float _814 = _796 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _816 = float(_670);
    float _818 = _362 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _820 = float(_800);
    float _822 = -_740;
    float _824 = fma(_814, 2.0, _822);
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[83].w, _762);
    float _828 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _818);
    float _830 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
    float _832 = _820 * _816;
    float _834 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _828);
    float _836 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _830);
    float _838 = _830;
    float _840 = _834;
    if (!_596)
    {
        _838 = _150;
    }
    float _842 = _838;
    float _844 = _832 * (-2.0);
    float _846 = _834 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _848 = _836 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _850 = _842;
    if (_596)
    {
        _850 = _142;
    }
    float _852 = _850;
    float _854 = fma(_722, _844, _722);
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _858 = _846 + _856;
    float _860 = -_848;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _864 = _862;
    if (_596)
    {
        _840 = _142;
    }
    float _866 = _840;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _870 = _866;
    if (!_596)
    {
        _870 = _138;
    }
    float _872 = _870;
    float _874 = _852 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _876 = abs(_858);
    float _878 = abs(_862);
    float _880 = precise::max(_876, _878);
    float _882 = _142 * 6.283185482025146484375;
    float _884 = fma(_874, -2.0, _868);
    bool _886 = _880 >= 16.0;
    float _888 = fma(_662, 15.0, _882);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _892 = 1.0 + _890;
    float _894 = _888 * 0.15915493667125701904296875;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _900 = 1.0 / _892;
    float _902 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[88].z, _896);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _906 = !_576;
    int _908 = _906 ? 0 : 1;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _912 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _914 = isnan(1.0);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _920 = _916 || _918;
    float _922 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].w, _898);
    int _924 = abs(_908);
    float _926 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _902);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _930 = _872 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _932 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[78].z, _904);
    float _934 = _894 * 6.283185482025146484375;
    float _936 = sin(_934);
    bool _938 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _946 = _942 || _944;
    float _948 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[88].w, _910);
    float _950 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _922);
    float _952 = fma(_930, -2.0, _928);
    float _954 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _932);
    float _956 = _138 + (-0.5);
    float _958 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _948);
    float _960 = _858 * 0.0625;
    float _962 = _946 ? _804 : 0.0;
    float _964 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _966 = float(_924);
    float _968 = -_106;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[86].x, _786);
    float _972 = _886 ? _960 : _858;
    float _974 = -_106;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _824);
    float _978 = float(_770);
    float _980 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _826);
    bool _982 = !_572;
    int _984 = _982 ? 0 : 1;
    float _986 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _884);
    float _988 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _952);
    float _990 = _956 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _992 = _774 * _556;
    bool _994 = _920;
    if (_886)
    {
        float _996 = _862 * 0.0625;
        _864 = _996;
    }
    float _998 = _864;
    if (_920)
    {
        float _1000 = _962 * _900;
        _118 = _1000;
    }
    float _1002 = _118;
    float _1004 = abs(_972);
    bool _1006 = _1004 != 0.0;
    bool _1008 = isnan(_1004);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    float _1016 = _966 * _978;
    int _1018 = abs(_984);
    float _1020 = _142 + _150;
    float _1022 = fma(_854, _1002, _990);
    float _1024 = _992 * 0.15915493667125701904296875;
    float _1026 = abs(_998);
    bool _1028 = _1026 == 0.0;
    bool _1030 = !_1014;
    bool _1032 = _1028 && _1030;
    float _1034 = in.m_61.x;
    float _1036 = in.m_61.y;
    float _1038 = in.m_61.z;
    float _1040 = _1020 + (-1.0);
    float _1042 = float(_1018);
    float _1044 = in.m_63.x;
    float _1046 = in.m_63.y;
    float _1048 = in.m_63.z;
    float _1050 = float(_738);
    float _1052 = _798 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = in.m_55.x;
    float _1058 = in.m_55.y;
    float _1060 = in.m_55.z;
    float _1062 = _1016 * (-2.0);
    float _1064 = _1022 * 0.15915493667125701904296875;
    float _1066 = abs(_998);
    bool _1068 = _1066 == 0.0;
    float _1070 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1072 = _1042 * _1050;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1076 = _1074 != 0;
    float _1078 = _150 + (-0.5);
    float _1080 = fma(_630, _1062, _630);
    float _1082 = _1024 * 6.283185482025146484375;
    float _1084 = sin(_1082);
    float _1086 = _142 + (-0.5);
    float _1088 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1090 = _1072 * (-2.0);
    int _1092 = as_type<int>(_1088);
    int _1094 = as_type<int>(_1002);
    if (_1032)
    {
        bool _1096 = as_type<int>(_998) >= 0;
        _994 = _1096;
    }
    bool _1098 = _994;
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1102 = fma(_1080, _1002, _1088);
    float _1104 = fma(_1070, _1090, _1070);
    float _1106 = _1024 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    int _1110 = _1098 ? (-1) : 0;
    if (_1032)
    {
        int _1112 = _1098 ? 0 : 1078530011;
        _1092 = _1112;
    }
    int _1114 = _1092;
    float _1116 = _1054 + _936;
    float _1118 = fma(_1104, _1002, _1100);
    float _1120 = 0.0;
    if (!_1076)
    {
        _1120 = _688;
    }
    float _1122 = _1120;
    float _1124 = _1102 * 0.15915493667125701904296875;
    float _1126 = _1122;
    if (_1032)
    {
        int _1128 = int(0x80000000) & as_type<int>(_972);
        int _1130 = _1114 | _1128;
        _1094 = _1130;
    }
    int _1132 = _1094;
    float _1134 = _1064 * 6.283185482025146484375;
    float _1136 = sin(_1134);
    float _1138 = _1064 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    bool _1142 = !_1014;
    bool _1144 = _1142 && _1068;
    int _1146 = _1132;
    float _1148 = as_type<float>(_1132);
    float _1150 = _1036;
    float _1152 = _1034;
    float _1154 = _1038;
    if (!_1144)
    {
        float _1156 = abs(_972);
        bool _1158 = _1156 != as_type<float>(0x7f800000u /* inf */);
        bool _1160 = isnan(_1156);
        bool _1162 = _1158 || _1160;
        bool _1164 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1166 = _1162 || _1164;
        float _1168 = abs(_998);
        bool _1170 = _1168 == as_type<float>(0x7f800000u /* inf */);
        float _1172 = abs(_998);
        bool _1174 = _1172 == as_type<float>(0x7f800000u /* inf */);
        bool _1176 = !_1166;
        bool _1178 = _1174 && _1176;
        if (_1178)
        {
            bool _1180 = as_type<int>(_998) >= 0;
            _1110 = _1180 ? (-1) : 0;
        }
        int _1182 = _1110;
        if (_1178)
        {
            _1146 = 1075235812;
        }
        int _1184 = _1146;
        int _1186 = _1184;
        if (_1178)
        {
            int _1188 = ~_1182;
            int _1190 = (_1188 != 0) ? _1184 : 1061752795;
            _1186 = _1190;
        }
        int _1192 = _1186;
        float _1194 = as_type<float>(_1192);
        if (_1178)
        {
            int _1196 = int(0x80000000) & as_type<int>(_972);
            int _1198 = _1192 | _1196;
            _1194 = as_type<float>(_1198);
        }
        float _1200 = _1194;
        bool _1202 = !_1166;
        bool _1204 = _1202 && _1170;
        _1148 = _1200;
        if (!_1204)
        {
            float _1206 = abs(_972);
            float _1208 = abs(_998);
            float _1210 = precise::max(_1206, _1208);
            float _1212 = abs(_972);
            float _1214 = abs(_998);
            float _1216 = precise::min(_1212, _1214);
            float _1218 = 1.0 / _1210;
            float _1220 = abs(_972);
            float _1222 = abs(_998);
            bool _1224 = _1220 > _1222;
            bool _1226 = as_type<int>(_998) >= 0;
            float _1228 = abs(_972);
            float _1230 = abs(_998);
            float _1232 = _1228 + _1230;
            int _1234 = as_type<int>(_972) & int(0x80000000);
            bool _1236 = _1232 > as_type<float>(0x7f800000u /* inf */);
            bool _1238 = isnan(_1232);
            bool _1240 = _1236 || _1238;
            bool _1242 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1244 = _1240 || _1242;
            float _1246 = _1216 * _1218;
            float _1248 = _1246 * _1246;
            float _1250 = _1248 + 11.33538818359375;
            float _1252 = fma(_1248, _1250, 28.84246826171875);
            float _1254 = fma(_1248, _1252, 19.6966705322265625);
            float _1256 = fma(_1248, -0.82336294651031494140625, -5.674867153167724609375);
            float _1258 = fma(_1248, _1256, -6.565555095672607421875);
            float _1260 = 1.0 / _1254;
            float _1262 = _1248 * _1258;
            float _1264 = _1246 * _1262;
            float _1266 = fma(_1264, _1260, _1246);
            float _1268 = _1266;
            _1148 = _1232;
            if (_1224)
            {
                float _1270 = -_1266;
                float _1272 = _1270 + 1.57079637050628662109375;
                _1268 = _1272;
            }
            float _1274 = _1268;
            int _1276 = as_type<int>(_1274);
            if (!_1226)
            {
                float _1278 = -_1274;
                float _1280 = _1278 + 3.1415927410125732421875;
                _1276 = as_type<int>(_1280);
            }
            int _1282 = _1276;
            if (!_1244)
            {
                int _1284 = _1234 | _1282;
                _1148 = as_type<float>(_1284);
            }
        }
    }
    float _1286 = _1148;
    float _1288 = -_560;
    float _1290 = _1288 + 1.0;
    float _1292 = _1116 * 0.0599999986588954925537109375;
    float _1294 = -_1286;
    float _1296 = _1118 + _1294;
    float _1298 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1300 = _1124 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1292 * _1290;
    float _1306 = _1296 * 0.15915493667125701904296875;
    float _1308 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1310 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1312 = _554 * _1304;
    float _1314 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1316 = _1306 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = fma(_1036, _1312, _1046);
    float _1322 = fma(_1034, _1312, _1044);
    float _1324 = fma(_1038, _1312, _1048);
    float _1326 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1328 = _1320 * _1084;
    float _1330 = _1320 * _1108;
    bool _1332 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1334 = isnan(0.5);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1340 = _1336 || _1338;
    float _1342 = _1306 * 6.283185482025146484375;
    float _1344 = cos(_1342);
    float _1346 = -_1328;
    float _1348 = fma(_1322, _1108, _1346);
    float _1350 = fma(_1322, _1084, _1330);
    float _1352 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1324);
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1348);
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1350);
    float _1360 = _1136 * _1302;
    float _1362 = _1124 * 6.283185482025146484375;
    float _1364 = sin(_1362);
    float _1366 = _1354 * _1326;
    float _1368 = _1356 * _1314;
    float _1370 = _1358 * _1352;
    float _1372 = _1140 * _1318;
    float _1374 = _1318 * _1302;
    float _1376 = _362 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1378 = _1360 * _1370;
    float _1380 = _1136 * _1344;
    float _1382 = _1136 * _1318;
    float _1384 = _1140 * _1344;
    float _1386 = _1344 * _1302;
    float _1388 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1376);
    bool _1390 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1392 = isnan(0.5);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1398 = _1394 || _1396;
    float _1400 = -_1372;
    float _1402 = fma(_1364, _1380, _1400);
    float _1404 = -_1370;
    float _1406 = _1364 * _1404;
    float _1408 = fma(_1364, _1382, _1384);
    float _1410 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1388);
    float _1412 = fma(_1402, _1368, _1378);
    float _1414 = fma(_1386, _1368, _1406);
    float _1416 = fma(_1364, _1384, _1382);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1420 = fma(_1408, _1366, _1412);
    float _1422 = fma(_1374, _1366, _1414);
    float _1424 = _848 + _1420;
    float _1426 = _846 + _1422;
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1432 = _1424 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1436 = _1426 + _1434;
    float _1438 = _1432 * _1432;
    float _1440 = fma(_1436, _1436, _1438);
    float _1442 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1428);
    float _1444 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1446 = sqrt(_1440);
    float _1448 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1442);
    float _1450 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1444);
    float _1452 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1454 = _1140 * _1302;
    float _1456 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1450);
    float _1458 = 1.0 / _1452;
    float _1460 = _1454 * _1370;
    float _1462 = -_1380;
    float _1464 = fma(_1364, _1372, _1462);
    float _1466 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1468 = fma(_1416, _1368, _1460);
    bool _1470 = _1446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1466 + _1452;
    float _1474 = fma(_1464, _1366, _1468);
    float _1476 = _1418 + _1474;
    float _1478 = _1472 * _1458;
    float _1480 = _1478 * 0.5;
    float _1482 = _1372;
    float _1484 = _1474;
    float _1486 = _1426;
    float _1488 = _1380;
    float _1490 = _1440;
    float _1492 = _1424;
    float _1494 = _1480;
    float _1496 = _1382;
    if (!_1470)
    {
        _1482 = _1424;
    }
    float _1498 = _1482;
    float _1500 = _1498;
    if (!_1470)
    {
        _1484 = _1476;
    }
    float _1502 = _1484;
    bool _1504 = !_1470;
    float _1506 = _1502;
    if (!_1504)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1512 = _1446 + _1510;
        float _1514 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1516 = rsqrt(_1440);
        float _1518 = _1512 * _1508;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1520 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = _1520 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        float _1530 = _1524 + (-1.0);
        float _1532 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = fma(_1528, _1514, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1536 = fma(_1476, _1524, _1532);
        float _1538 = _1516 * _1534;
        float _1540 = fma(_1436, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1542 = fma(_1432, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1486 = _1540;
        _1506 = _1536;
        _1500 = _1542;
        _1488 = _1538;
        _1490 = _1516;
    }
    float _1544 = _1486;
    float _1546 = _1506;
    float _1548 = _1500;
    float _1550 = _1488;
    float _1552 = _1490;
    float _1554 = _1550;
    float _1556 = _1546;
    float _1558 = _1548;
    float _1560 = _1552;
    if (_1398)
    {
        _1492 = 1.0;
    }
    float _1562 = _1492;
    float _1564 = _1562;
    if (_1340)
    {
        _1554 = _1544;
    }
    float _1566 = _1554;
    float _1568 = _1566;
    if (!_1340)
    {
        float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1572 = _1418 + _1570;
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1576 = -_846;
        float _1578 = _1576 + _1544;
        float _1580 = -_1418;
        float _1582 = _1580 + _1546;
        float _1584 = _1572 * _1572;
        float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1588 = _848 + _1586;
        float _1590 = -_848;
        float _1592 = _1590 + _1548;
        float _1594 = fma(_858, _858, _1584);
        float _1596 = fma(_1588, _1588, _1594);
        float _1598 = sqrt(_1596);
        float _1600 = precise::min(_1598, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1602 = _1600 * _1574;
        float _1604 = fma(_1578, _1602, _846);
        float _1606 = fma(_1582, _1602, _1418);
        float _1608 = fma(_1592, _1602, _848);
        _1556 = _1606;
        _1568 = _1604;
        _1558 = _1608;
        _1560 = _1574;
    }
    float _1610 = _1556;
    float _1612 = _1568;
    float _1614 = _1558;
    float _1616 = _1560;
    float _1618 = _1616;
    if (!_1398)
    {
        float _1620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1622 = _1620 * 0.15915493667125701904296875;
        float _1624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1628 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1626);
        float _1630 = _1622 * 6.283185482025146484375;
        float _1632 = cos(_1630);
        float _1634 = _1624 * 0.15915493667125701904296875;
        float _1636 = _1622 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = 1.0 / _1632;
        float _1642 = _1634 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        float _1646 = _1638 * _1640;
        float _1648 = _1634 * 6.283185482025146484375;
        float _1650 = sin(_1648);
        float _1652 = _1644 * _1646;
        float _1654 = 1.0 / _1628;
        float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1658 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1656;
        float _1660 = 1.0 / _1652;
        float _1662 = 1.0 / _1658;
        float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1666 = _1654 * _1664;
        float _1668 = _1650 * _1660;
        float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1672 = fma(_1668, _1666, _1670);
        float _1674 = _1672 * _1662;
        float _1676 = precise::clamp(_1674, 0.0, 1.0);
        _1494 = _1654;
        _1618 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _1564 = _1676;
    }
    float _1678 = _1494;
    float _1680 = _1618;
    float _1682 = _1564;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1686 = _1610 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1690 = _1612 + _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1694 = _1614 + _1692;
    float _1696 = _1686 * _1686;
    float _1698 = fma(_1690, _1690, _1696);
    float _1700 = fma(_1694, _1694, _1698);
    float _1702 = rsqrt(_1700);
    float _1704 = sqrt(_1700);
    float _1706 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1708 = _1690 * _1706;
    float _1710 = _1694 * _1706;
    float _1712 = _1708 * _1708;
    float _1714 = _1710 * _1710;
    float _1716 = _1712 + _1714;
    float _1718 = sqrt(_1716);
    bool _1720 = _1718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1718 + _1722;
    float _1726 = _1678;
    float _1728 = _1716;
    float _1730 = _1724;
    float _1732 = _1686;
    float _1734 = _1708;
    float _1736 = _1710;
    float _1738 = _1712;
    float _1740 = _1714;
    if (_1720)
    {
        float _1742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1742;
    }
    float _1744 = _1726;
    if (_1720)
    {
        float _1746 = rsqrt(_1716);
        _1728 = _1746;
    }
    float _1748 = _1728;
    if (_1720)
    {
        float _1750 = _1724 * _1744;
        _1730 = _1750;
    }
    float _1752 = _1730;
    if (_1720)
    {
        float _1754 = _1752 * 0.15915493667125701904296875;
        _1496 = _1754;
    }
    float _1756 = _1496;
    float _1758 = _1680;
    if (_1720)
    {
        float _1760 = _1756 * 6.283185482025146484375;
        float _1762 = sin(_1760);
        _1758 = _1762;
    }
    float _1764 = _1758;
    float _1766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1768 = precise::max(0.0, _1766);
    float _1770 = _1744;
    float _1772 = _1768;
    if (_1720)
    {
        float _1774 = _1756 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = -_1706;
    float _1782 = -_1768;
    float _1784 = fma(_1686, _1780, _1782);
    if (_1720)
    {
        float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1732 = _1786;
    }
    float _1788 = _1732;
    float _1790 = _1788;
    float _1792 = _1764;
    if (_1720)
    {
        float _1794 = fma(_1764, _1788, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1790 = _1794;
    }
    float _1796 = _1790;
    float _1798 = _1796;
    if (_1720)
    {
        float _1800 = _1778 + (-1.0);
        _1772 = _1800;
    }
    float _1802 = _1772;
    float _1804 = _1802;
    if (_1720)
    {
        float _1806 = _1748 * _1796;
        _1792 = _1806;
    }
    float _1808 = _1792;
    if (!_1720)
    {
        _1798 = _1784;
    }
    float _1810 = _1798;
    float _1812 = _1810;
    if (_1720)
    {
        float _1814 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1804 = _1814;
    }
    float _1816 = _1804;
    if (_1720)
    {
        float _1818 = _1708 * _1808;
        _1734 = _1818;
    }
    float _1820 = _1734;
    if (_1720)
    {
        float _1822 = _1710 * _1808;
        _1736 = _1822;
    }
    float _1824 = _1736;
    if (_1720)
    {
        float _1826 = fma(_1784, _1778, _1816);
        _1812 = _1826;
    }
    float _1828 = _1812;
    if (_1720)
    {
        float _1830 = _1820 * _1820;
        _1738 = _1830;
    }
    float _1832 = _1738;
    if (_1720)
    {
        float _1834 = _1824 * _1824;
        _1740 = _1834;
    }
    float _1836 = _1740;
    float _1838 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = fma(_1828, _1828, _1832);
    float _1848 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1850 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1838);
    float _1852 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1854 = _1846 + _1836;
    float _1856 = -_1844;
    float _1858 = _1856 + 1.0;
    float _1860 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1862 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1852);
    float _1864 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1850);
    float _1866 = abs(_1858);
    float _1868 = log2(_1866);
    float _1870 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1860);
    float _1872 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1862);
    float _1874 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1876 = _1610 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1878 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1870);
    float _1880 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1882 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1884 = rsqrt(_1854);
    float _1886 = _1878 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1888 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1876);
    float _1890 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1892 = -_1882;
    float _1894 = fma(_1892, _1848, 1.0);
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1898 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1888);
    float _1900 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1890);
    float _1902 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1904 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1896);
    float _1906 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1908 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1900);
    float _1910 = log2(_1894);
    float _1912 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1904);
    float _1914 = _1884 * _1820;
    float _1916 = _1884 * _1828;
    float _1918 = _1884 * _1824;
    float _1920 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1922 = exp2(_1902);
    float _1924 = -_1920;
    float _1926 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1924);
    float _1928 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1908);
    float _1930 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1932 = -_1918;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1926);
    float _1936 = _1910 * 0.693147182464599609375;
    float _1938 = 1.0 / _1928;
    float _1940 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1930);
    float _1942 = fma(_1934, -0.5, 0.5);
    float _1944 = fma(_1934, 0.5, 0.5);
    float _1946 = _1916 + 1.0;
    float _1948 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1940);
    float _1950 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1952 = fma(_1944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1954 = sqrt(_1942);
    float _1956 = -_1916;
    float _1958 = fma(_1922, _1946, _1956);
    float _1960 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1948);
    float _1962 = fma(_1944, _1952, -0.212114393711090087890625);
    float _1964 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1912);
    float _1966 = fma(_1958, 0.5, 0.5);
    float _1968 = fma(_1944, _1962, 1.570728778839111328125);
    float _1970 = _1960 * _1938;
    float _1972 = _1964 * _1938;
    float _1974 = fma(_1970, 0.5, 0.5);
    float _1976 = fma(_1972, -0.5, 0.5);
    float _1978 = _1954 * 0.636619746685028076171875;
    float _1980 = -_1968;
    float _1982 = fma(_1978, _1980, 1.0);
    float3 _5462 = float3(_1974, _1976, _1950);
    float _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5462, float3(0.0), isnan(_5462)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5462, float3(0.0), isnan(_5462)), level(0.0)).x;
    float3 _5473 = float3(_1974, _1976, _1950);
    float4 _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5473, float3(0.0), isnan(_5473)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5473, float3(0.0), isnan(_5473)), level(0.0)).xyzw;
    float _1989 = _1987.x;
    float _1991 = _1987.y;
    float _1993 = _1987.z;
    float _1995 = _1987.w;
    float2 _5490 = float2(_1982, _1966);
    float3 _1999 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5490, float2(0.0), isnan(_5490)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5490, float2(0.0), isnan(_5490)), level(0.0)).xyz;
    float _2001 = _1999.x;
    float _2003 = _1999.y;
    float _2005 = _1999.z;
    out.m_65.x = _554;
    out.m_65.y = _556;
    out.m_65.z = _558;
    out.m_65.w = _560;
    float _2007 = -_662;
    float _2009 = _2007 + 1.0;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2015 = _150 > 0.5;
    float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2019 = _2017 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2021 = _142 > 0.5;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2025 = _2023 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2027 = 1.0 / _2013;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2031 = _552 + _2029;
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2035 = _2033 != 0;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2039 = _2037 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2045 = 1.0 / _2019;
    int _2047 = _2015 ? as_type<int>(_2009) : as_type<int>(_662);
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2051 = _2049 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2057 = _2055 != 0;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2061 = _552 + _2059;
    int _2063 = _2021 ? as_type<int>(_2009) : as_type<int>(_662);
    float _2065 = 1.0 / _2051;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2069 = _2035 ? as_type<float>(_2047) : _662;
    float _2071 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2073 = _586 > 0.5;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2077 = 1.0 / _2025;
    float _2079 = _2057 ? as_type<float>(_2063) : _662;
    float _2081 = _2075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1612;
    out.m_67.y = _1610;
    out.m_67.z = _1614;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2085 = _2083 != 0;
    int _2087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2089 = _2087 != 0;
    float _2091 = 1.0 / _2043;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2095 = _2093 != 0;
    int _2097 = _2073 ? as_type<int>(_2009) : as_type<int>(_662);
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _2099;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _2105 = _2103 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _2107 = 1.0 / _2039;
    bool _2109 = _2073;
    if (_1076)
    {
        bool _2111 = _138 > 0.5;
        _2109 = _2111;
    }
    bool _2113 = _2109;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2115;
    float _2119 = _2117 * _2077;
    float _2121 = exp2(_2071);
    float _2123 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2125 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2127;
    float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2133 = _2131 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_69.x = _2081;
    out.m_69.y = _2123;
    out.m_69.z = _2125;
    float _2135 = _2133 * _2027;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _2139 = _2137 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _2141 = _2129 * _2045;
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2145 = _2101 * _2107;
    float _2147 = _2139 * _2091;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2151 = _552 + _2149;
    bool _2153 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _2155 = isnan(_552);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _2161 = _2157 || _2159;
    float _2163 = float(_2161);
    float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2167 = _552 + _2165;
    float _2169 = -_2121;
    float _2171 = _2169 + 1.0;
    float _2173 = _2105 * _2065;
    bool _2175 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _2177 = isnan(_552);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _2183 = _2179 || _2181;
    float _2185 = float(_2183);
    float _2187 = fma(_2147, _2167, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _2189 = _2095 ? as_type<float>(_2097) : _662;
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2193 = _552 + _2191;
    float _2195 = fma(_2135, _2151, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2197 = -_2185;
    float _2199 = _2197 + 1.0;
    float _2201 = -_2163;
    float _2203 = _2201 + 1.0;
    float _2205 = fma(_2141, _2193, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2207 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _2209 = isnan(_552);
    bool _2211 = _2207 || _2209;
    bool _2213 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _2215 = _2211 || _2213;
    float _2217 = float(_2215);
    float _2219 = _2163 * _2199;
    bool _2221 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2223 = isnan(_552);
    bool _2225 = _2221 || _2223;
    bool _2227 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2229 = _2225 || _2227;
    float _2231 = float(_2229);
    float _2233 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2235 = _552 + _2233;
    float _2237 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2239 = -_2217;
    float _2241 = _2239 + 1.0;
    float _2243 = _2217 * _2203;
    bool _2245 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2247 = isnan(_552);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2253 = _2249 || _2251;
    float _2255 = float(_2253);
    float _2257 = fma(_2119, _2235, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2259 = -_2231;
    float _2261 = _2259 + 1.0;
    float _2263 = _2231 * _2241;
    bool _2265 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2267 = isnan(_552);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2273 = _2269 || _2271;
    float _2275 = float(_2273);
    float _2277 = fma(_2237, _2079, -0.5);
    float _2279 = _2255 * _2261;
    float _2281 = -_2255;
    float _2283 = _2281 + 1.0;
    bool _2285 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2287 = isnan(_552);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = -_2275;
    float _2299 = _2297 + 1.0;
    float _2301 = -_698;
    float _2303 = fma(_950, _2277, _2301);
    int _2305 = as_type<int>(_2237);
    float _2307 = _2205;
    if (_1076)
    {
        float _2309 = -_688;
        float _2311 = _2309 + 1.0;
        _732 = as_type<int>(_2311);
    }
    int _2313 = _732;
    float _2315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2317 = _2295 * _2299;
    float _2319 = _2275 * _2283;
    float _2321 = fma(_2145, _2031, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    if (_1076)
    {
        float _2323 = _2113 ? as_type<float>(_2313) : _688;
        _1126 = _2323;
    }
    float _2325 = _1126;
    float _2327 = _2205 * _2317;
    bool _2329 = _1350 != 0.0;
    bool _2331 = isnan(_1350);
    bool _2333 = _2329 || _2331;
    bool _2335 = isnan(0.0);
    bool _2337 = _2333 || _2335;
    float _2339 = -_2295;
    float _2341 = _2339 + 1.0;
    float _2343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2345 = fma(_2173, _2061, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    bool _2347 = _1348 == 0.0;
    bool _2349 = !_2337;
    bool _2351 = _2347 && _2349;
    float _2353 = fma(_2341, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2327);
    int _2355 = as_type<int>(_2341);
    if (_2085)
    {
        float _2357 = -_688;
        float _2359 = _2357 + 1.0;
        _2305 = as_type<int>(_2359);
    }
    int _2361 = _2305;
    if (_2089)
    {
        float _2363 = -_688;
        float _2365 = _2363 + 1.0;
        _2355 = as_type<int>(_2365);
    }
    int _2367 = _2355;
    bool _2369 = _1324 == 0.0;
    bool _2371 = _2369 && _2351;
    float _2373 = fma(_2195, _2319, _2353);
    float _2375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2377 = _2315 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_2085)
    {
        _2307 = _688;
    }
    float _2379 = _2307;
    float _2381 = fma(_2257, _2279, _2373);
    float _2383 = _2379;
    if (_2085)
    {
        float _2385 = _2021 ? as_type<float>(_2361) : _688;
        _2383 = _2385;
    }
    float _2387 = _2383;
    float _2389 = fma(_2069, _2377, -0.5);
    if (_2089)
    {
        float _2391 = _2015 ? as_type<float>(_2367) : _688;
        _780 = _2391;
    }
    float _2393 = _780;
    float _2395 = fma(_2187, _2263, _2381);
    float _2397 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2399 = fma(_2189, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2401 = -_988;
    float _2403 = fma(_958, _2389, _2401);
    float _2405 = fma(_2393, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _2407 = fma(_2397, _2325, -0.5);
    float _2409 = fma(_2321, _2243, _2395);
    if (!_2371)
    {
        float _2411 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1036);
        _1150 = _2411;
    }
    float _2413 = _1150;
    if (!_2371)
    {
        float _2415 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1034);
        _1152 = _2415;
    }
    float _2417 = _1152;
    float _2419 = _2375 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2421 = fma(_954, _2407, _694);
    float _2423 = -_986;
    float _2425 = fma(_980, _2399, _2423);
    float _2427 = fma(_2345, _2219, _2409);
    float _2429 = fma(_2419, _2387, -0.5);
    float _2431 = fma(_964, _2405, _976);
    float _2433 = -_2413;
    float _2435 = _1364 * _2433;
    float _2437 = _1454 * _2413;
    float _2439 = _1360 * _2413;
    float _2441 = fma(_926, _2429, _970);
    float _2443 = _2303 + 0.5;
    float _2445 = _2421 + 0.5;
    float _2447 = _2431 + 0.5;
    float _2449 = _2425 + 0.5;
    float _2451 = fma(_2185, (*spvDescriptorSet0.vp_c9)._m0[121].x, _2427);
    float _2453 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2455 = fma(_1386, _2417, _2435);
    float _2457 = fma(_1416, _2417, _2437);
    float _2459 = fma(_1402, _2417, _2439);
    float _2461 = _2441 + 0.5;
    float _2463 = _2403 + 0.5;
    float _2465 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2453);
    out.m_71.x = _2445;
    out.m_71.y = _2443;
    out.m_71.z = _2447;
    out.m_71.w = _2449;
    if (!_2371)
    {
        float _2467 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1038);
        _1154 = _2467;
    }
    float _2469 = _1154;
    bool _2471 = _1682 > 0.0;
    bool _2473 = isnan(_1682);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(0.0);
    bool _2479 = _2475 || _2477;
    float _2481 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2465);
    out.m_73.x = _2461;
    out.m_73.y = _2463;
    float _2483 = fma(_1374, _2469, _2455);
    float _2485 = fma(_1464, _2469, _2457);
    float _2487 = fma(_1408, _2469, _2459);
    float _2489 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2491 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2481);
    out.m_75.x = _2483;
    out.m_75.y = _2485;
    out.m_75.z = _2487;
    float _2493 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2495 = _532 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2497 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2499 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2501 = _2493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2503 = _2495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2505 = _2497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2507 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2509 = _372 * _2489;
    float _2511 = _2491 + _1928;
    float _2513 = -_2499;
    float _2515 = _2513 + 1.0;
    out.m_77.x = _2501;
    out.m_77.y = _2503;
    out.m_77.z = _2505;
    out.m_77.w = _2507;
    float _2517 = _2511 * 0.5;
    out.gl_Position.x = _1960;
    out.gl_Position.y = _1964;
    out.gl_Position.z = _2491;
    out.gl_Position.w = _1928;
    out.m_79.z = _2517;
    out.m_79.w = _1928;
    float _2519 = _2509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _2519;
    float _2521 = _2499 * _1984;
    float _2523 = _1995 * _2515;
    float _2525 = _1995 * _2521;
    float _2527 = _2005 * _2521;
    float _2529 = fma(_2001, _2525, _1989);
    float _2531 = fma(_2003, _2525, _1991);
    float _2533 = fma(_1995, _2527, _1993);
    out.m_81.x = _2529;
    out.m_81.y = _2531;
    out.m_81.z = _2533;
    out.m_81.w = _2523;
    if (_2479)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2535 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2535;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

