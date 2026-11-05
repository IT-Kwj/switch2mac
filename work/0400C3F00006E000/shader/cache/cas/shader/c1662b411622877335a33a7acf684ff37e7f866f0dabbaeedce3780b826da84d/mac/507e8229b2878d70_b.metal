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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_67 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_61 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2037 = false;
    bool _630 = false;
    bool _398 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2595 = as_type<float>(_120);
        out.gl_Position.z = _2595;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2664 = as_type<float>(_158);
        out.gl_Position.z = _2664;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = _164 * _162;
    float _180 = 0.0;
    if (!_176)
    {
        float _182 = _166 * _166;
        float _184 = _182 * 0.5;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _190 = _186;
    if (!_176)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    int _208 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _210 = _208 != 0;
    float _212 = _206 * 6.283185482025146484375;
    float _214 = cos(_212);
    float _216 = 1.4012984643248170709237295832899e-45;
    float _218 = _194;
    if (!_176)
    {
        _216 = _166;
    }
    float _220 = _216;
    float _222 = -_204;
    float _224 = _188 + _222;
    bool _226 = !_176;
    float _228 = _220;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _166 * _232;
        float _242 = 1.0 / _236;
        float _244 = _238 * 0.693147182464599609375;
        float _246 = exp2(_240);
        float _248 = 1.0 / _244;
        float _250 = _246 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _248, _166);
        float _256 = _254 * _242;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _258;
    }
    float _260 = _218;
    bool _262 = !_176;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _166 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _228 = _282;
    }
    float _284 = _228;
    float _286 = in.m_53.w;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _300 = _298 != 0;
    float _302 = fma(_214, 0.5, 0.5);
    bool _304 = _224 < 0.5;
    float _306 = float(_304);
    float _308 = -_224;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _312 = !_210;
    int _314 = _312 ? 0 : 1;
    float _316 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _318 = !_296;
    int _320 = _318 ? 0 : 1;
    float _322 = -_306;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _326 = -_302;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = fma(_284, _196, _316);
    int _332 = abs(_320);
    float _334 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _336 = abs(_314);
    bool _338 = !_300;
    int _340 = _338 ? 0 : 1;
    float _342 = fma(_284, _198, _334);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _346 = abs(_340);
    float _348 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = float(_332);
    float _352 = fma(_330, _286, _288);
    float _354 = float(_336);
    float _356 = fma(_342, _286, _290);
    float _358 = abs(_310);
    float _360 = _350 * _358;
    float _362 = fma(_284, _200, _348);
    float _364 = float(_346);
    float _366 = fma(_354, _328, _360);
    float _368 = fma(_362, _286, _292);
    float _370 = abs(_324);
    float _372 = fma(_364, _370, _366);
    bool _374 = !_344;
    bool _376 = false;
    bool _378 = false;
    float _380 = _356;
    float _396;
    if (!_374)
    {
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _384 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_104);
        float _402 = 1.0 / _400;
        float _404 = _138 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = _406 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _406 + _412;
    bool _416 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _418 = isnan(_406);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = _406 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _444 = 1.0 / _430;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _448 = 1.0 / _442;
    float _450 = 1.0 / _438;
    float _452 = _410 * _444;
    bool _454 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _456 = isnan(_406);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -_426;
    float _468 = _466 + 1.0;
    float _470 = _464 * _468;
    float _472 = _414 * _448;
    bool _474 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _476 = isnan(_406);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _486;
    bool _490 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _492 = isnan(_406);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _506 = -_464;
    float _508 = _506 + 1.0;
    float _510 = -_484;
    float _512 = _510 + 1.0;
    float _514 = _434 * _450;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _520;
    float _524 = _500 * _512;
    float _526 = fma(_488, _514, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _528 = fma(_518, _514, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _530 = fma(_522, _514, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _532 = -_500;
    float _534 = _532 + 1.0;
    float _536 = _526 * _524;
    float _538 = _528 * _524;
    float _540 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _542 = _530 * _524;
    float _544 = _484 * _508;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = _540 * _160;
    float _556 = fma(_504, _472, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _542);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _538);
    float _562 = trunc(_554);
    int _564 = int(_562);
    float _566 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _536);
    float _568 = fma(_556, _544, _558);
    float _570 = fma(_548, _472, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _576;
    float _580 = fma(_552, _472, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _582;
    float _586 = fma(_570, _544, _560);
    float _588 = fma(_574, _452, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _590 = fma(_578, _452, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _592 = fma(_584, _452, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _594 = fma(_580, _544, _566);
    float _596 = fma(_588, _470, _568);
    float _598 = fma(_590, _470, _586);
    int _600 = _564 << 4;
    int _602 = _600 + 1712;
    float _604 = fma(_592, _470, _594);
    float _606 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].x, _596);
    float _608 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].y, _598);
    float _610 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].z, _604);
    bool _612 = !_446;
    float _628;
    if (!_612)
    {
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _616 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_104);
        float _634 = 1.0 / _632;
        float _636 = _138 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = in.m_51.w;
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _644 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _646 = in.m_55.x;
    float _648 = in.m_55.y;
    float _650 = in.m_55.z;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _658 = _656 != 0;
    float _660 = in.m_57.x;
    float _662 = in.m_57.y;
    float _664 = in.m_57.z;
    float _666 = _644 * _160;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _670 = _668 != 0;
    float _672 = in.m_59.x;
    float _674 = in.m_59.y;
    float _676 = in.m_59.z;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _680 = _678 != 0;
    float _682 = trunc(_666);
    int _684 = int(_682);
    float _686 = in.m_61.x;
    float _688 = _452;
    if (_654)
    {
        float _690 = in.m_51.z;
        _688 = _690;
    }
    float _692 = _688;
    if (_658)
    {
        bool _694 = _160 > 0.5;
        _376 = _694;
    }
    bool _696 = _376;
    bool _698 = _640 > 0.5;
    float _700 = in.m_51.y;
    float _702 = _356 * _648;
    float _704 = in.m_63.x;
    float _706 = in.m_63.y;
    int _708 = _684 << 4;
    int _710 = _708 + 1968;
    float _712 = _356 * _662;
    float _714 = fma(_352, _646, _702);
    float _716 = fma(_352, _660, _712);
    float _718 = _356 * _674;
    uint _721 = uint(int(uint(_602) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[int(_723)][_725];
    int _729 = int(_721) + 1;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    int _733 = _729 & 3;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[int(_731)][_733];
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _741 = _160 * 2.0;
    float _743 = fma(_352, _672, _718);
    int _745 = as_type<int>(_646);
    int _747 = as_type<int>(_741);
    if (_658)
    {
        float _749 = -_686;
        float _751 = _749 + 1.0;
        _745 = as_type<int>(_751);
    }
    int _753 = _745;
    float _755 = 1.0 / _739;
    float _757 = as_type<float>(_753);
    if (_654)
    {
        bool _759 = _692 > 0.5;
        _378 = _759;
    }
    bool _761 = _378;
    float _763 = fma(_368, _664, _716);
    float _765 = in.m_61.y;
    uint _767 = uint(int(uint(_710) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[int(_777)][_779];
    if (!_658)
    {
        _380 = _686;
    }
    float _783 = _380;
    float _785 = fma(_368, _676, _743);
    float _787 = floor(_741);
    float _789 = _783;
    if (_658)
    {
        float _791 = _696 ? as_type<float>(_753) : _686;
        _789 = _791;
    }
    float _793 = _789;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _795;
    float _799 = abs(_704);
    float _801 = abs(_706);
    float _803 = precise::max(_799, _801);
    if (!_654)
    {
        _757 = _686;
    }
    float _805 = _757;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _809 = _803 >= 16.0;
    float _811 = _797 * _755;
    float _813 = _805;
    if (_654)
    {
        float _815 = -_686;
        float _817 = _815 + 1.0;
        _747 = as_type<int>(_817);
    }
    int _819 = _747;
    bool _821 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _823 = isnan(_638);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    int _833 = _710 + 8;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    uint _837 = uint(int(uint(int(_835)) >> uint(2)));
    int _839 = int(_835) & 3;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[int(_837)][_839];
    float _843 = fma(_368, _650, _714);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _847 = _638 + _845;
    if (_654)
    {
        float _849 = _761 ? as_type<float>(_819) : _686;
        _813 = _849;
    }
    float _851 = _813;
    float _853 = -_831;
    float _855 = _853 + 1.0;
    bool _857 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _859 = isnan(_638);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = fma(_811, _847, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _871 = _787 > 0.0;
    int _873 = _602 + 8;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    uint _877 = uint(int(uint(int(_875)) >> uint(2)));
    int _879 = int(_875) & 3;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[int(_877)][_879];
    bool _883 = _787 >= 0.0;
    bool _885 = isnan(_787);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    float _893 = _867 * _855;
    float _895 = _700 * 2.0;
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _899 = _700 > 0.5;
    float _901 = _869 * _893;
    float _903 = -_867;
    float _905 = _903 + 1.0;
    float _907 = -_765;
    float _909 = _907 + 1.0;
    float _911 = in.m_51.z;
    float _913 = _160 + _700;
    float _915 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[115].x, _901);
    float _917 = floor(_895);
    int _919 = _698 ? as_type<int>(_909) : as_type<int>(_765);
    float _921 = _913 + (-1.0);
    float _923 = _851 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _925 = _670 ? as_type<float>(_919) : _765;
    float _927 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _929 = _765;
    bool _931 = _899;
    if (_680)
    {
        float _933 = _899 ? _909 : _765;
        _929 = _933;
    }
    float _935 = _929;
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _939 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _941 = _925 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _945 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[116].x, _915);
    float _947 = _773 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _949 = _781 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _951 = _943 * _897;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _955 = _706 * 0.0625;
    bool _957 = _917 > 0.0;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _961 = _917 >= 0.0;
    bool _963 = isnan(_917);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = _735 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _973 = _704 * 0.0625;
    float _975 = _809 ? _955 : _706;
    float _977 = _911 * 2.0;
    float _979 = _941 * _937;
    float _981 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = _809 ? _973 : _704;
    float _985 = _843 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _987 = abs(_975);
    bool _989 = _987 != 0.0;
    bool _991 = isnan(_987);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = floor(_977);
    float _1001 = _841 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1003 = _807 * _953;
    float _1005 = abs(_983);
    bool _1007 = _1005 == 0.0;
    bool _1009 = !_997;
    bool _1011 = _1007 && _1009;
    float _1013 = _949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1017 = _763 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1021 = _985 + _1019;
    float _1023 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1025 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1027 = _923 * _642;
    float _1029 = _785 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1033 = _1017 + _1031;
    float _1035 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1037 = _1021 * _1021;
    float _1039 = _927 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _945 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _981;
    out.m_65.y = _1013;
    out.m_65.z = _1023;
    out.m_65.w = _959;
    int _1045 = as_type<int>(_945);
    int _1047 = _997 ? (-1) : 0;
    float _1049 = _1013;
    int _1051 = as_type<int>(_1021);
    if (_1011)
    {
        bool _1053 = as_type<int>(_983) >= 0;
        _931 = _1053;
    }
    bool _1055 = _931;
    float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1059 = _1029 + _1057;
    out.m_67.x = _1039;
    out.m_67.y = _1041;
    out.m_67.z = _1025;
    out.m_67.w = _1043;
    if (_1011)
    {
        int _1061 = _1055 ? 0 : 1078530011;
        _1045 = _1061;
    }
    int _1063 = _1045;
    bool _1065 = _999 > 0.0;
    out.m_69.x = _1003;
    out.m_69.y = _951;
    out.m_69.z = _1027;
    out.m_69.w = _979;
    float _1067 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1035);
    float _1069 = fma(_1033, _1033, _1037);
    int _1071 = _891 ? 0 : 1;
    float _1073 = _700 + _911;
    bool _1075 = _999 >= 0.0;
    bool _1077 = isnan(_999);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = fma(_1059, _1059, _1069);
    float _1087 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1067);
    float _1089 = _1073 + (-1.0);
    int _1091 = _1083 ? 0 : 1;
    float _1093 = abs(_983);
    bool _1095 = _1093 == 0.0;
    float _1097 = rsqrt(_1085);
    int _1099 = _969 ? 0 : 1;
    float _1101 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1103 = ~_1071;
    int _1105 = _1103 + 1;
    int _1107 = _1105 + 1;
    int _1109 = ~_1099;
    int _1111 = _1109 + 1;
    int _1113 = _1111 + 1;
    int _1115 = ~_1091;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    bool _1121 = _1087 >= 0.0;
    int _1123 = _1107;
    int _1125 = _1113;
    int _1127 = _1119;
    float _1129 = _1089;
    int _1131 = _1063;
    if (!_871)
    {
        int _1133 = ~_1071;
        int _1135 = _1133 + 1;
        _1123 = _1135;
    }
    int _1137 = _1123;
    if (!_957)
    {
        int _1139 = ~_1099;
        int _1141 = _1139 + 1;
        _1125 = _1141;
    }
    int _1143 = _1125;
    if (!_1065)
    {
        int _1145 = ~_1091;
        int _1147 = _1145 + 1;
        _1127 = _1147;
    }
    int _1149 = _1127;
    if (_1011)
    {
        int _1151 = int(0x80000000) & as_type<int>(_975);
        int _1153 = _1063 | _1151;
        _1129 = as_type<float>(_1153);
    }
    float _1155 = _1129;
    bool _1157 = !_997;
    bool _1159 = _1157 && _1095;
    float _1161 = _1155;
    float _1163 = _1155;
    if (!_1159)
    {
        float _1165 = abs(_975);
        bool _1167 = _1165 != as_type<float>(0x7f800000u /* inf */);
        bool _1169 = isnan(_1165);
        bool _1171 = _1167 || _1169;
        bool _1173 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1175 = _1171 || _1173;
        float _1177 = abs(_983);
        bool _1179 = _1177 == as_type<float>(0x7f800000u /* inf */);
        float _1181 = abs(_983);
        bool _1183 = _1181 == as_type<float>(0x7f800000u /* inf */);
        bool _1185 = !_1175;
        bool _1187 = _1183 && _1185;
        if (_1187)
        {
            bool _1189 = as_type<int>(_983) >= 0;
            _1047 = _1189 ? (-1) : 0;
        }
        int _1191 = _1047;
        if (_1187)
        {
            _1131 = 1075235812;
        }
        int _1193 = _1131;
        int _1195 = _1193;
        if (_1187)
        {
            int _1197 = ~_1191;
            int _1199 = (_1197 != 0) ? _1193 : 1061752795;
            _1195 = _1199;
        }
        int _1201 = _1195;
        if (_1187)
        {
            int _1203 = int(0x80000000) & as_type<int>(_975);
            int _1205 = _1201 | _1203;
            _1161 = as_type<float>(_1205);
        }
        float _1207 = _1161;
        bool _1209 = !_1175;
        bool _1211 = _1209 && _1179;
        _1163 = _1207;
        if (!_1211)
        {
            float _1213 = abs(_975);
            float _1215 = abs(_983);
            float _1217 = precise::max(_1213, _1215);
            float _1219 = abs(_975);
            float _1221 = abs(_983);
            float _1223 = precise::min(_1219, _1221);
            float _1225 = 1.0 / _1217;
            float _1227 = abs(_975);
            float _1229 = abs(_983);
            bool _1231 = _1227 > _1229;
            bool _1233 = as_type<int>(_983) >= 0;
            float _1235 = _1223 * _1225;
            float _1237 = abs(_975);
            float _1239 = abs(_983);
            float _1241 = _1237 + _1239;
            int _1243 = as_type<int>(_975) & int(0x80000000);
            float _1245 = _1235 * _1235;
            bool _1247 = _1241 > as_type<float>(0x7f800000u /* inf */);
            bool _1249 = isnan(_1241);
            bool _1251 = _1247 || _1249;
            bool _1253 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1255 = _1251 || _1253;
            float _1257 = _1245 + 11.33538818359375;
            float _1259 = fma(_1245, _1257, 28.84246826171875);
            float _1261 = fma(_1245, _1259, 19.6966705322265625);
            float _1263 = fma(_1245, -0.82336294651031494140625, -5.674867153167724609375);
            float _1265 = fma(_1245, _1263, -6.565555095672607421875);
            float _1267 = 1.0 / _1261;
            float _1269 = _1245 * _1265;
            float _1271 = _1235 * _1269;
            float _1273 = fma(_1271, _1267, _1235);
            float _1275 = _1273;
            _1163 = _1241;
            _1049 = 0.82336294651031494140625;
            if (_1231)
            {
                float _1277 = -_1273;
                float _1279 = _1277 + 1.57079637050628662109375;
                _1275 = _1279;
            }
            float _1281 = _1275;
            int _1283 = as_type<int>(_1281);
            if (!_1233)
            {
                float _1285 = -_1281;
                float _1287 = _1285 + 3.1415927410125732421875;
                _1283 = as_type<int>(_1287);
            }
            int _1289 = _1283;
            if (!_1255)
            {
                int _1291 = _1243 | _1289;
                _1163 = as_type<float>(_1291);
            }
        }
    }
    float _1293 = _1163;
    float _1295 = _1049;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1299 = _1297 != 0;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1303 = _1301 != 0;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1307 = _1305 != 0;
    float _1309 = _1021 * _1097;
    float _1311 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1313 = log2(_1311);
    float _1315 = _1033 * _1097;
    float _1317 = _1295;
    if (_1121)
    {
        _1317 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1319 = _1317;
    float _1321 = -_1309;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1325 = precise::max(_1293, -3.1415927410125732421875);
    float _1327 = -_1315;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1331 = _1059 * _1097;
    float _1333 = _1323 * _1323;
    if (_1121)
    {
        float _1335 = _1319 * 5.0;
        _1051 = as_type<int>(_1335);
    }
    int _1337 = _1051;
    float _1339 = -_1331;
    float _1341 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1059);
    float _1343 = fma(_1329, _1329, _1333);
    if (_1121)
    {
        out.m_47.x = 0.0;
    }
    float _1345 = precise::min(_1325, 3.1415927410125732421875);
    float _1347 = _1313 * _138;
    float _1349 = fma(_1341, _1341, _1343);
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1353 = 1.0 + _1351;
    if (_1121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4519 = as_type<float>(_1337);
        out.gl_Position.z = _4519;
    }
    float _1355 = fma(_1345, 0.15915493667125701904296875, 0.5);
    bool _1357 = !_1299;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = exp2(_1347);
    float _1363 = in.m_71.x;
    float _1365 = in.m_71.y;
    float _1367 = in.m_71.z;
    bool _1369 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1371 = isnan(1.0);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1377 = _1373 || _1375;
    float _1379 = fma(_138, 0.06666667759418487548828125, _1355);
    bool _1381 = !_1303;
    int _1383 = _1381 ? 0 : 1;
    int _1385 = abs(_1359);
    float _1387 = _1379 * 6.283185482025146484375;
    float _1389 = 1.0 / _1353;
    bool _1391 = !_1307;
    int _1393 = _1391 ? 0 : 1;
    int _1395 = abs(_1383);
    bool _1397 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1399 = isnan(0.0);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1149);
    float _1409 = -_1361;
    float _1411 = _1409 + 1.0;
    int _1413 = abs(_1393);
    float _1415 = sqrt(_1349);
    float _1417 = float(_1385);
    float _1419 = float(_1137);
    float _1421 = _1417 * _1407;
    float _1423 = float(_1395);
    float _1425 = _1405 ? _1411 : 0.0;
    float _1427 = float(_1143);
    float _1429 = _1423 * _1419;
    float _1431 = float(_1413);
    if (_1377)
    {
        float _1433 = _1425 * _1389;
        _142 = _1433;
    }
    float _1435 = _142;
    float _1437 = _1421 * (-2.0);
    float _1439 = _1429 * (-2.0);
    float _1441 = _1431 * _1427;
    float _1443 = _160 + (-0.5);
    float _1445 = fma(_1437, _1363, _1363);
    float _1447 = fma(_939, _1437, _939);
    float _1449 = fma(_1101, _1439, _1101);
    float _1451 = fma(_1439, _1365, _1365);
    float _1453 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1445);
    if (_1121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1455 = -_1309;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _985);
    float _1459 = fma(_1447, _1435, _1453);
    float _1461 = -_1315;
    float _1463 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1017);
    float _1465 = -_1331;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1029);
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1471 = _1457 + _1469;
    float _1473 = _700 + (-0.5);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1477 = _1463 + _1475;
    float _1479 = _1387 * 0.15915493667125701904296875;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1483 = _160 + _911;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1487 = _1467 + _1485;
    float _1489 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1451);
    float _1491 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1481);
    float _1493 = _1483 + (-1.0);
    float _1495 = _1441 * (-2.0);
    float _1497 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1491);
    float _1499 = fma(_1449, _1435, _1489);
    float _1501 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1503 = fma(_1495, _1367, _1367);
    float _1505 = _911 + (-0.5);
    bool _1507 = _1497 >= 0.0;
    float _1509 = fma(_1501, _1495, _1501);
    float _1511 = _1459 * 0.15915493667125701904296875;
    float _1513 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1503);
    float _1515 = in.m_53.x;
    float _1517 = in.m_53.y;
    float _1519 = in.m_53.z;
    float _1521 = _1499 * 0.15915493667125701904296875;
    float _1523 = _1511 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    float _1527 = fma(_1509, _1435, _1513);
    float _1529 = in.m_63.z;
    float _1531 = _1527 * 0.15915493667125701904296875;
    float _1533 = _1499;
    if (_1507)
    {
        _1533 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1535 = _1533;
    float _1537 = _1511 * 6.283185482025146484375;
    float _1539 = cos(_1537);
    int _1541 = as_type<int>(_1535);
    if (_1507)
    {
        out.m_47.x = 0.0;
    }
    if (_1507)
    {
        float _1543 = _1535 * 5.0;
        _1541 = as_type<int>(_1543);
    }
    int _1545 = _1541;
    float _1547 = _1479 * 6.283185482025146484375;
    float _1549 = sin(_1547);
    if (_1507)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4811 = as_type<float>(_1545);
        out.gl_Position.z = _4811;
    }
    float _1551 = _1521 * 6.283185482025146484375;
    float _1553 = sin(_1551);
    float _1555 = _1521 * 6.283185482025146484375;
    float _1557 = cos(_1555);
    float _1559 = _1531 * 6.283185482025146484375;
    float _1561 = sin(_1559);
    if (_1507)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1563 = _1531 * 6.283185482025146484375;
    float _1565 = cos(_1563);
    float _1567 = _608 * _1517;
    float _1569 = _606 * _1515;
    float _1571 = fma(_1549, 0.5, 1.5);
    float _1573 = _610 * _1519;
    float _1575 = _1097 * _1415;
    float _1577 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1579 = _1571 * _704;
    float _1581 = _1571 * _706;
    float _1583 = _1567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1585 = _1571 * _1529;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1589 = _1525 * _1553;
    float _1591 = _1539 * _1557;
    float _1593 = _1539 * _1553;
    float _1595 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1579);
    float _1597 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1581);
    float _1599 = _1575 * _1577;
    float _1601 = _1575 * _1583;
    float _1603 = _1539 * _1565;
    float _1605 = _1525 * _1557;
    float _1607 = _1575 * _1587;
    float _1609 = fma(_1561, _1591, _1589);
    float _1611 = _1595 * _1599;
    float _1613 = _1597 * _1601;
    float _1615 = fma(_1561, _1589, _1591);
    float _1617 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1619 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1621 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1623 = _1557 * _1565;
    float _1625 = _1525 * _1565;
    float _1627 = _1553 * _1565;
    float _1629 = -_1593;
    float _1631 = fma(_1561, _1605, _1629);
    float _1633 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1585);
    float _1635 = -_1605;
    float _1637 = fma(_1561, _1593, _1635);
    float _1639 = _1603 * _1613;
    float _1641 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1643 = -_1561;
    float _1645 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1617);
    float _1647 = -_1561;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1619);
    float _1651 = -_1561;
    float _1653 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1621);
    float _1655 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1657 = -_1613;
    float _1659 = _1561 * _1657;
    float _1661 = _1625 * _1613;
    float _1663 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1665 = _1633 * _1607;
    float _1667 = fma(_1609, _1611, _1639);
    float _1669 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1641);
    float _1671 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1655);
    float _1673 = fma(_1623, _1611, _1659);
    float _1675 = fma(_1631, _1611, _1661);
    float _1677 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1663);
    float _1679 = fma(_1637, _1665, _1667);
    float _1681 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1669);
    float _1683 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1671);
    float _1685 = fma(_1627, _1665, _1673);
    float _1687 = fma(_1615, _1665, _1675);
    float _1689 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1677);
    float _1691 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1693 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1695 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1697 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1699 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1701 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1691);
    float _1703 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1693);
    float _1705 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1697);
    float _1707 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1699);
    float _1709 = in.m_73.x;
    float _1711 = in.m_73.y;
    float _1713 = in.m_73.z;
    bool _1715 = _1581 != 0.0;
    bool _1717 = isnan(_1581);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(0.0);
    bool _1723 = _1719 || _1721;
    float _1725 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1705);
    float _1727 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1707);
    float _1729 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1695);
    bool _1731 = _1579 == 0.0;
    bool _1733 = !_1723;
    bool _1735 = _1731 && _1733;
    float _1737 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1739 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1741 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1645);
    float _1743 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1649);
    float _1745 = _1017 + _1737;
    float _1747 = _1029 + _1739;
    float _1749 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1653);
    bool _1751 = _1585 == 0.0;
    bool _1753 = _1751 && _1735;
    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1757 = _1745 + _1755;
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1761 = _1747 + _1759;
    float _1763 = in.m_75.x;
    float _1765 = in.m_75.y;
    float _1767 = in.m_75.z;
    float _1769 = in.m_75.w;
    float _1771 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1701);
    float _1773 = _1757 * _1757;
    float _1775 = _1761 * _1761;
    float _1777 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1703);
    float _1779 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1729);
    float _1781 = _1773 + _1775;
    float _1783 = _1737;
    float _1785 = _1597;
    float _1787 = _1727;
    float _1789 = _1773;
    float _1791 = _1775;
    float _1793 = _1745;
    float _1795 = _1747;
    float _1797 = _1683;
    if (_1753)
    {
        _1783 = _1713;
    }
    float _1799 = _1783;
    float _1801 = sqrt(_1781);
    float _1803 = _1799;
    if (!_1753)
    {
        float _1805 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1713);
        _1803 = _1805;
    }
    float _1807 = _1803;
    float _1809 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1753)
    {
        _1785 = _1709;
    }
    float _1811 = _1785;
    float _1813 = _1811;
    if (!_1753)
    {
        float _1815 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1709);
        _1813 = _1815;
    }
    float _1817 = _1813;
    if (_1753)
    {
        _1787 = _1711;
    }
    float _1819 = _1787;
    float _1821 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1809);
    float _1823 = _1819;
    if (!_1753)
    {
        float _1825 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1711);
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1821);
    float _1831 = _1741 * _1765;
    float _1833 = _1743 * _1765;
    float _1835 = _1749 * _1765;
    bool _1837 = _1801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = fma(_1681, _1763, _1831);
    float _1841 = _1767 * _1709;
    float _1843 = _1763 * _1711;
    float _1845 = _1765 * _1713;
    float _1847 = _1829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1849 = fma(_1683, _1763, _1833);
    float _1851 = fma(_1689, _1763, _1835);
    float _1853 = -_1841;
    float _1855 = fma(_1763, _1713, _1853);
    float _1857 = -_1843;
    float _1859 = fma(_1765, _1709, _1857);
    float _1861 = -_1845;
    float _1863 = fma(_1767, _1711, _1861);
    float _1865 = _985 + _1847;
    float _1867 = _1855 * _1769;
    float _1869 = _1859 * _1769;
    float _1871 = _1863 * _1769;
    float _1873 = fma(_1771, _1767, _1839);
    float _1875 = fma(_1777, _1767, _1849);
    float _1877 = fma(_1779, _1767, _1851);
    float _1879 = _1769;
    if (!_1837)
    {
        _1879 = _1865;
    }
    float _1881 = _1879;
    bool _1883 = !_1837;
    float _1885 = _1881;
    if (!_1883)
    {
        float _1887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1891 = _1801 + _1889;
        float _1893 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1895 = rsqrt(_1781);
        float _1897 = _1891 * _1887;
        float _1899 = _1897 * 0.15915493667125701904296875;
        float _1901 = _1899 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = _1899 * 6.283185482025146484375;
        float _1907 = cos(_1905);
        float _1909 = fma(_1903, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1911 = _1895 * _1909;
        float _1913 = fma(_1757, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1915 = _1907 + (-1.0);
        float _1917 = fma(_1761, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1921 = _1913 + _1919;
        float _1923 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1927 = _1917 + _1925;
        float _1929 = _1921 * _1921;
        float _1931 = fma(_1865, _1907, _1923);
        float _1933 = _1927 * _1927;
        _1885 = _1931;
        _1789 = _1929;
        _1791 = _1933;
        _1793 = _1913;
        _1795 = _1917;
    }
    float _1935 = _1885;
    float _1937 = _1789;
    float _1939 = _1791;
    float _1941 = _1793;
    float _1943 = _1795;
    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1947 = _1935 + _1945;
    float _1949 = _1741 * _1827;
    float _1951 = _1743 * _1827;
    float _1953 = _1749 * _1827;
    float _1955 = fma(_1947, _1947, _1937);
    float _1957 = _1867 * _1741;
    float _1959 = _1867 * _1743;
    float _1961 = _1867 * _1749;
    float _1963 = _1955 + _1939;
    float _1965 = fma(_1681, _1817, _1949);
    float _1967 = fma(_1683, _1817, _1951);
    float _1969 = fma(_1689, _1817, _1953);
    float _1971 = fma(_1871, _1681, _1957);
    float _1973 = fma(_1871, _1683, _1959);
    float _1975 = sqrt(_1963);
    float _1977 = fma(_1871, _1689, _1961);
    float _1979 = fma(_1771, _1807, _1965);
    float _1981 = fma(_1777, _1807, _1967);
    float _1983 = fma(_1779, _1807, _1969);
    float _1985 = fma(_1869, _1771, _1971);
    float _1987 = fma(_1869, _1777, _1973);
    float _1989 = fma(_1869, _1779, _1977);
    out.m_77.x = _1873;
    out.m_77.y = _1875;
    out.m_77.z = _1877;
    out.m_79.x = _1979;
    out.m_79.y = _1981;
    out.m_79.z = _1983;
    out.m_81.x = _1985;
    out.m_81.y = _1987;
    out.m_81.z = _1989;
    bool _1991 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1993 = isnan(_1975);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1999 = _1995 || _1997;
    float _2001 = _1987;
    if (!_1999)
    {
        _1797 = 1.0;
    }
    float _2003 = _1797;
    bool _2005 = !_1999;
    float _2007 = _2003;
    if (!_2005)
    {
        bool _2009 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2011 = isnan(_1975);
        bool _2013 = _2009 || _2011;
        bool _2015 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2017 = _2013 || _2015;
        if (!_2017)
        {
            float _2019 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2021 = _1975 + _2019;
            float _2023 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2025 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2023;
            float _2027 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2029 = _2027 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2031 = 1.0 / _2025;
            float _2033 = _2021 * _2031;
            float _2035 = fma(_2033, _2029, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2007 = _2035;
            _2037 = true;
        }
        else
        {
            bool _2039 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2041 = isnan(_1975);
            bool _2043 = _2039 || _2041;
            bool _2045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2047 = _2043 || _2045;
            if (!_2047)
            {
                float _2049 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2051 = _1975 + _2049;
                float _2053 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2055 = _2053 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2059 = _2057 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2061 = 1.0 / _2055;
                float _2063 = _2051 * _2061;
                float _2065 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2007 = _2065;
                _2037 = true;
            }
            else
            {
                _2007 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2037 = false;
    float _2067 = _2007;
    float _2069 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2071 = _1941 + _2069;
    float _2073 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2075 = _1935 + _2073;
    float _2077 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2079 = _1943 + _2077;
    bool _2081 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan(0.5);
    bool _2089 = _2085 || _2087;
    float _2091 = fma(_2071, _2067, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2093 = fma(_2075, _2067, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2095 = fma(_2079, _2067, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -_1315;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2091);
    float _2101 = -_1309;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2093);
    float _2105 = -_1331;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2095);
    float _2109 = _2103;
    float _2111 = _2099;
    float _2113 = _2107;
    if (!_2089)
    {
        float _2115 = _1471 * _1471;
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2119 = -_1017;
        float _2121 = _2119 + _2091;
        float _2123 = -_1029;
        float _2125 = _2123 + _2095;
        float _2127 = fma(_1477, _1477, _2115);
        float _2129 = fma(_1487, _1487, _2127);
        float _2131 = 1.0 / _1575;
        float _2133 = sqrt(_2129);
        float _2135 = precise::min(_2133, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2137 = _2135 * _2117;
        float _2139 = -_985;
        float _2141 = _2139 + _2093;
        float _2143 = _2137 * _2131;
        float _2145 = fma(_2121, _2143, _1463);
        float _2147 = fma(_2141, _2143, _1457);
        float _2149 = fma(_2125, _2143, _1467);
        _2109 = _2147;
        _2111 = _2145;
        _2113 = _2149;
    }
    float _2151 = _2109;
    float _2153 = _2111;
    float _2155 = _2113;
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2159 = _2151 + _2157;
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2163 = _2153 + _2161;
    float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2167 = _2155 + _2165;
    float _2169 = _2159 * _2159;
    float _2171 = fma(_2163, _2163, _2169);
    float _2173 = fma(_2167, _2167, _2171);
    float _2175 = rsqrt(_2173);
    float _2177 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2179 = _2163 * _2177;
    float _2181 = _2167 * _2177;
    float _2183 = _2179 * _2179;
    float _2185 = _2181 * _2181;
    float _2187 = _2183 + _2185;
    float _2189 = sqrt(_2187);
    bool _2191 = _2189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2195 = _2189 + _2193;
    float _2197 = _2175;
    float _2199 = _2187;
    float _2201 = _2195;
    float _2203 = _2159;
    float _2205 = _2177;
    float _2207 = _2179;
    if (_2191)
    {
        float _2209 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2197 = _2209;
    }
    float _2211 = _2197;
    if (_2191)
    {
        float _2213 = rsqrt(_2187);
        _2199 = _2213;
    }
    float _2215 = _2199;
    if (_2191)
    {
        float _2217 = _2195 * _2211;
        _2201 = _2217;
    }
    float _2219 = _2201;
    if (_2191)
    {
        float _2221 = _2219 * 0.15915493667125701904296875;
        _2001 = _2221;
    }
    float _2223 = _2001;
    float _2225 = _2211;
    float _2227 = _2223;
    if (_2191)
    {
        float _2229 = _2223 * 6.283185482025146484375;
        float _2231 = sin(_2229);
        _2225 = _2231;
    }
    float _2233 = _2225;
    float _2235 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2237 = precise::max(0.0, _2235);
    float _2239 = _2167;
    float _2241 = _2237;
    if (_2191)
    {
        float _2243 = _2223 * 6.283185482025146484375;
        float _2245 = cos(_2243);
        _2239 = _2245;
    }
    float _2247 = _2239;
    float _2249 = -_2177;
    float _2251 = -_2237;
    float _2253 = fma(_2159, _2249, _2251);
    float _2255 = _2253;
    if (!_2191)
    {
        _2203 = _2183;
    }
    float _2257 = _2203;
    float _2259 = _2257;
    if (_2191)
    {
        float _2261 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2241 = _2261;
    }
    float _2263 = _2241;
    float _2265 = _2233;
    float _2267 = _2263;
    if (_2191)
    {
        float _2269 = fma(_2233, _2263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2265 = _2269;
    }
    float _2271 = _2265;
    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2275 = _2271;
    if (_2191)
    {
        float _2277 = _2247 + (-1.0);
        _2267 = _2277;
    }
    float _2279 = _2267;
    float _2281 = _2279;
    if (_2191)
    {
        float _2283 = _2215 * _2271;
        _2205 = _2283;
    }
    float _2285 = _2205;
    if (!_2191)
    {
        _2275 = _2181;
    }
    float _2287 = _2275;
    float _2289 = sqrt(_2173);
    float _2291 = _2287;
    if (_2191)
    {
        float _2293 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2293;
    }
    float _2295 = _2227;
    if (_2191)
    {
        float _2297 = _2179 * _2285;
        _2207 = _2297;
    }
    float _2299 = _2207;
    if (_2191)
    {
        float _2301 = _2181 * _2285;
        _2291 = _2301;
    }
    float _2303 = _2291;
    if (!_2191)
    {
        _2281 = _2185;
    }
    float _2305 = _2281;
    float _2307 = _2305;
    if (_2191)
    {
        float _2309 = fma(_2253, _2247, _2295);
        _2255 = _2309;
    }
    float _2311 = _2255;
    if (_2191)
    {
        float _2313 = _2299 * _2299;
        _2259 = _2313;
    }
    float _2315 = _2259;
    if (_2191)
    {
        float _2317 = _2303 * _2303;
        _2307 = _2317;
    }
    float _2319 = _2307;
    float _2321 = fma(_2311, _2311, _2315);
    float _2323 = _2321 + _2319;
    float _2325 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2329 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2327);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = rsqrt(_2323);
    float _2335 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2325);
    float _2337 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2339 = -_2331;
    float _2341 = _2339 + 1.0;
    float _2343 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2335);
    float _2345 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2347 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2337);
    float _2349 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2351 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2353 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2345);
    float _2355 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2347);
    float _2357 = abs(_2341);
    float _2359 = log2(_2357);
    float _2361 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2349);
    float _2363 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2353);
    float _2365 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2367 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2369 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2361);
    float _2371 = _2333 * _2299;
    float _2373 = _2363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2375 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2377 = -_2367;
    float _2379 = fma(_2377, _2273, 1.0);
    float _2381 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2383 = _2333 * _2311;
    float _2385 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2387 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2375);
    float _2389 = _2333 * _2303;
    float _2391 = log2(_2379);
    float _2393 = -_2385;
    float _2395 = fma(_2383, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2393);
    float _2397 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2387);
    float _2399 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2401 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2403 = -_2389;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2395);
    float _2407 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2397);
    float _2409 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2411 = exp2(_2399);
    float _2413 = fma(_2405, -0.5, 0.5);
    float _2415 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2401);
    float _2417 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2409);
    float _2419 = _2383 + 1.0;
    float _2421 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2415);
    float _2423 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2417);
    float _2425 = 1.0 / _2407;
    float _2427 = fma(_2405, 0.5, 0.5);
    float _2429 = _2391 * 0.693147182464599609375;
    float _2431 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2423);
    float _2433 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2421);
    float _2435 = fma(_2427, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2437 = sqrt(_2413);
    float _2439 = -_2383;
    float _2441 = fma(_2411, _2419, _2439);
    float _2443 = fma(_2427, _2435, -0.212114393711090087890625);
    float _2445 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2447 = fma(_2427, _2443, 1.570728778839111328125);
    float _2449 = _2431 * _2425;
    float _2451 = _2433 * _2425;
    float _2453 = fma(_2449, 0.5, 0.5);
    float _2455 = fma(_2451, -0.5, 0.5);
    float _2457 = fma(_2441, 0.5, 0.5);
    float _2459 = _2437 * 0.636619746685028076171875;
    float3 _6338 = float3(_2453, _2455, _2445);
    float _2461 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6338, float3(0.0), isnan(_6338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6338, float3(0.0), isnan(_6338)), level(0.0)).x;
    float3 _6349 = float3(_2453, _2455, _2445);
    float4 _2464 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).xyzw;
    float _2466 = _2464.x;
    float _2468 = _2464.y;
    float _2470 = _2464.z;
    float _2472 = _2464.w;
    float _2474 = -_2447;
    float _2476 = fma(_2459, _2474, 1.0);
    float2 _6371 = float2(_2476, _2457);
    float3 _2480 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6371, float2(0.0), isnan(_6371)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6371, float2(0.0), isnan(_6371)), level(0.0)).xyz;
    float _2482 = _2480.x;
    float _2484 = _2480.y;
    float _2486 = _2480.z;
    float _2488 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2490 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2492 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2494 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2490);
    float _2496 = exp2(_2488);
    float _2498 = _2492 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2500 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2494);
    float _2502 = _2431 + _2407;
    float _2504 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2500);
    float _2506 = _2502 * 0.5;
    float _2508 = _2407 * 0.5;
    out.m_47.x = _2498;
    float _2510 = _2504 + _2407;
    out.gl_Position.x = _2431;
    out.gl_Position.y = _2433;
    out.gl_Position.z = _2504;
    out.gl_Position.w = _2407;
    float _2512 = _2510 * 0.5;
    float _2514 = -_2496;
    float _2516 = _2514 + 1.0;
    float _2518 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2520 = fma(_2433, -0.5, _2508);
    out.m_83.x = _2506;
    out.m_83.y = _2520;
    out.m_83.z = _2512;
    out.m_83.w = _2407;
    float _2522 = _2518 * _2461;
    float _2524 = -_2518;
    float _2526 = _2524 + 1.0;
    float _2528 = _2472 * _2522;
    float _2530 = _2486 * _2522;
    float _2532 = fma(_2482, _2528, _2466);
    float _2534 = fma(_2484, _2528, _2468);
    float _2536 = _2472 * _2526;
    float _2538 = fma(_2472, _2530, _2470);
    out.m_85.x = _2532;
    out.m_85.y = _2534;
    out.m_85.z = _2538;
    out.m_85.w = _2536;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2037 = false;
    bool _630 = false;
    bool _398 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2595 = as_type<float>(_120);
        out.gl_Position.z = _2595;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2664 = as_type<float>(_158);
        out.gl_Position.z = _2664;
    }
    if (_152)
    {
        return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = _164 * _162;
    float _180 = 0.0;
    if (!_176)
    {
        float _182 = _166 * _166;
        float _184 = _182 * 0.5;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _190 = _186;
    if (!_176)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    int _208 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _210 = _208 != 0;
    float _212 = _206 * 6.283185482025146484375;
    float _214 = cos(_212);
    float _216 = 1.4012984643248170709237295832899e-45;
    float _218 = _194;
    if (!_176)
    {
        _216 = _166;
    }
    float _220 = _216;
    float _222 = -_204;
    float _224 = _188 + _222;
    bool _226 = !_176;
    float _228 = _220;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _166 * _232;
        float _242 = 1.0 / _236;
        float _244 = _238 * 0.693147182464599609375;
        float _246 = exp2(_240);
        float _248 = 1.0 / _244;
        float _250 = _246 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _248, _166);
        float _256 = _254 * _242;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _258;
    }
    float _260 = _218;
    bool _262 = !_176;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _166 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _228 = _282;
    }
    float _284 = _228;
    float _286 = in.m_53.w;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _300 = _298 != 0;
    float _302 = fma(_214, 0.5, 0.5);
    bool _304 = _224 < 0.5;
    float _306 = float(_304);
    float _308 = -_224;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _312 = !_210;
    int _314 = _312 ? 0 : 1;
    float _316 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _318 = !_296;
    int _320 = _318 ? 0 : 1;
    float _322 = -_306;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _326 = -_302;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = fma(_284, _196, _316);
    int _332 = abs(_320);
    float _334 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _336 = abs(_314);
    bool _338 = !_300;
    int _340 = _338 ? 0 : 1;
    float _342 = fma(_284, _198, _334);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _346 = abs(_340);
    float _348 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = float(_332);
    float _352 = fma(_330, _286, _288);
    float _354 = float(_336);
    float _356 = fma(_342, _286, _290);
    float _358 = abs(_310);
    float _360 = _350 * _358;
    float _362 = fma(_284, _200, _348);
    float _364 = float(_346);
    float _366 = fma(_354, _328, _360);
    float _368 = fma(_362, _286, _292);
    float _370 = abs(_324);
    float _372 = fma(_364, _370, _366);
    bool _374 = !_344;
    bool _376 = false;
    bool _378 = false;
    float _380 = _356;
    float _396;
    if (!_374)
    {
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _384 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_104);
        float _402 = 1.0 / _400;
        float _404 = _138 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = _406 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _406 + _412;
    bool _416 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _418 = isnan(_406);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = _406 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _444 = 1.0 / _430;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _448 = 1.0 / _442;
    float _450 = 1.0 / _438;
    float _452 = _410 * _444;
    bool _454 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _456 = isnan(_406);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -_426;
    float _468 = _466 + 1.0;
    float _470 = _464 * _468;
    float _472 = _414 * _448;
    bool _474 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _476 = isnan(_406);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _486;
    bool _490 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _492 = isnan(_406);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _506 = -_464;
    float _508 = _506 + 1.0;
    float _510 = -_484;
    float _512 = _510 + 1.0;
    float _514 = _434 * _450;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _520;
    float _524 = _500 * _512;
    float _526 = fma(_488, _514, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _528 = fma(_518, _514, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _530 = fma(_522, _514, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _532 = -_500;
    float _534 = _532 + 1.0;
    float _536 = _526 * _524;
    float _538 = _528 * _524;
    float _540 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _542 = _530 * _524;
    float _544 = _484 * _508;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = _540 * _160;
    float _556 = fma(_504, _472, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _542);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _538);
    float _562 = trunc(_554);
    int _564 = int(_562);
    float _566 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _536);
    float _568 = fma(_556, _544, _558);
    float _570 = fma(_548, _472, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _576;
    float _580 = fma(_552, _472, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _582;
    float _586 = fma(_570, _544, _560);
    float _588 = fma(_574, _452, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _590 = fma(_578, _452, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _592 = fma(_584, _452, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _594 = fma(_580, _544, _566);
    float _596 = fma(_588, _470, _568);
    float _598 = fma(_590, _470, _586);
    int _600 = _564 << 4;
    int _602 = _600 + 1712;
    float _604 = fma(_592, _470, _594);
    float _606 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].x, _596);
    float _608 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].y, _598);
    float _610 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].z, _604);
    bool _612 = !_446;
    float _628;
    if (!_612)
    {
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _616 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_104);
        float _634 = 1.0 / _632;
        float _636 = _138 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = in.m_51.w;
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _644 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _646 = in.m_55.x;
    float _648 = in.m_55.y;
    float _650 = in.m_55.z;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _658 = _656 != 0;
    float _660 = in.m_57.x;
    float _662 = in.m_57.y;
    float _664 = in.m_57.z;
    float _666 = _644 * _160;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _670 = _668 != 0;
    float _672 = in.m_59.x;
    float _674 = in.m_59.y;
    float _676 = in.m_59.z;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _680 = _678 != 0;
    float _682 = trunc(_666);
    int _684 = int(_682);
    float _686 = in.m_61.x;
    float _688 = _452;
    if (_654)
    {
        float _690 = in.m_51.z;
        _688 = _690;
    }
    float _692 = _688;
    if (_658)
    {
        bool _694 = _160 > 0.5;
        _376 = _694;
    }
    bool _696 = _376;
    bool _698 = _640 > 0.5;
    float _700 = in.m_51.y;
    float _702 = _356 * _648;
    float _704 = in.m_63.x;
    float _706 = in.m_63.y;
    int _708 = _684 << 4;
    int _710 = _708 + 1968;
    float _712 = _356 * _662;
    float _714 = fma(_352, _646, _702);
    float _716 = fma(_352, _660, _712);
    float _718 = _356 * _674;
    uint _721 = uint(int(uint(_602) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[int(_723)][_725];
    int _729 = int(_721) + 1;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    int _733 = _729 & 3;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[int(_731)][_733];
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _741 = _160 * 2.0;
    float _743 = fma(_352, _672, _718);
    int _745 = as_type<int>(_646);
    int _747 = as_type<int>(_741);
    if (_658)
    {
        float _749 = -_686;
        float _751 = _749 + 1.0;
        _745 = as_type<int>(_751);
    }
    int _753 = _745;
    float _755 = 1.0 / _739;
    float _757 = as_type<float>(_753);
    if (_654)
    {
        bool _759 = _692 > 0.5;
        _378 = _759;
    }
    bool _761 = _378;
    float _763 = fma(_368, _664, _716);
    float _765 = in.m_61.y;
    uint _767 = uint(int(uint(_710) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[int(_777)][_779];
    if (!_658)
    {
        _380 = _686;
    }
    float _783 = _380;
    float _785 = fma(_368, _676, _743);
    float _787 = floor(_741);
    float _789 = _783;
    if (_658)
    {
        float _791 = _696 ? as_type<float>(_753) : _686;
        _789 = _791;
    }
    float _793 = _789;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _795;
    float _799 = abs(_704);
    float _801 = abs(_706);
    float _803 = precise::max(_799, _801);
    if (!_654)
    {
        _757 = _686;
    }
    float _805 = _757;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _809 = _803 >= 16.0;
    float _811 = _797 * _755;
    float _813 = _805;
    if (_654)
    {
        float _815 = -_686;
        float _817 = _815 + 1.0;
        _747 = as_type<int>(_817);
    }
    int _819 = _747;
    bool _821 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _823 = isnan(_638);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    int _833 = _710 + 8;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    uint _837 = uint(int(uint(int(_835)) >> uint(2)));
    int _839 = int(_835) & 3;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[int(_837)][_839];
    float _843 = fma(_368, _650, _714);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _847 = _638 + _845;
    if (_654)
    {
        float _849 = _761 ? as_type<float>(_819) : _686;
        _813 = _849;
    }
    float _851 = _813;
    float _853 = -_831;
    float _855 = _853 + 1.0;
    bool _857 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _859 = isnan(_638);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = fma(_811, _847, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _871 = _787 > 0.0;
    int _873 = _602 + 8;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    uint _877 = uint(int(uint(int(_875)) >> uint(2)));
    int _879 = int(_875) & 3;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[int(_877)][_879];
    bool _883 = _787 >= 0.0;
    bool _885 = isnan(_787);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    float _893 = _867 * _855;
    float _895 = _700 * 2.0;
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _899 = _700 > 0.5;
    float _901 = _869 * _893;
    float _903 = -_867;
    float _905 = _903 + 1.0;
    float _907 = -_765;
    float _909 = _907 + 1.0;
    float _911 = in.m_51.z;
    float _913 = _160 + _700;
    float _915 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[115].x, _901);
    float _917 = floor(_895);
    int _919 = _698 ? as_type<int>(_909) : as_type<int>(_765);
    float _921 = _913 + (-1.0);
    float _923 = _851 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _925 = _670 ? as_type<float>(_919) : _765;
    float _927 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _929 = _765;
    bool _931 = _899;
    if (_680)
    {
        float _933 = _899 ? _909 : _765;
        _929 = _933;
    }
    float _935 = _929;
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _939 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _941 = _925 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _945 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[116].x, _915);
    float _947 = _773 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _949 = _781 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _951 = _943 * _897;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _955 = _706 * 0.0625;
    bool _957 = _917 > 0.0;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _961 = _917 >= 0.0;
    bool _963 = isnan(_917);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = _735 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _973 = _704 * 0.0625;
    float _975 = _809 ? _955 : _706;
    float _977 = _911 * 2.0;
    float _979 = _941 * _937;
    float _981 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = _809 ? _973 : _704;
    float _985 = _843 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _987 = abs(_975);
    bool _989 = _987 != 0.0;
    bool _991 = isnan(_987);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = floor(_977);
    float _1001 = _841 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1003 = _807 * _953;
    float _1005 = abs(_983);
    bool _1007 = _1005 == 0.0;
    bool _1009 = !_997;
    bool _1011 = _1007 && _1009;
    float _1013 = _949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1017 = _763 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1021 = _985 + _1019;
    float _1023 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1025 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1027 = _923 * _642;
    float _1029 = _785 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1033 = _1017 + _1031;
    float _1035 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1037 = _1021 * _1021;
    float _1039 = _927 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _945 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _981;
    out.m_65.y = _1013;
    out.m_65.z = _1023;
    out.m_65.w = _959;
    int _1045 = as_type<int>(_945);
    int _1047 = _997 ? (-1) : 0;
    float _1049 = _1013;
    int _1051 = as_type<int>(_1021);
    if (_1011)
    {
        bool _1053 = as_type<int>(_983) >= 0;
        _931 = _1053;
    }
    bool _1055 = _931;
    float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1059 = _1029 + _1057;
    out.m_67.x = _1039;
    out.m_67.y = _1041;
    out.m_67.z = _1025;
    out.m_67.w = _1043;
    if (_1011)
    {
        int _1061 = _1055 ? 0 : 1078530011;
        _1045 = _1061;
    }
    int _1063 = _1045;
    bool _1065 = _999 > 0.0;
    out.m_69.x = _1003;
    out.m_69.y = _951;
    out.m_69.z = _1027;
    out.m_69.w = _979;
    float _1067 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1035);
    float _1069 = fma(_1033, _1033, _1037);
    int _1071 = _891 ? 0 : 1;
    float _1073 = _700 + _911;
    bool _1075 = _999 >= 0.0;
    bool _1077 = isnan(_999);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = fma(_1059, _1059, _1069);
    float _1087 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1067);
    float _1089 = _1073 + (-1.0);
    int _1091 = _1083 ? 0 : 1;
    float _1093 = abs(_983);
    bool _1095 = _1093 == 0.0;
    float _1097 = rsqrt(_1085);
    int _1099 = _969 ? 0 : 1;
    float _1101 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1103 = ~_1071;
    int _1105 = _1103 + 1;
    int _1107 = _1105 + 1;
    int _1109 = ~_1099;
    int _1111 = _1109 + 1;
    int _1113 = _1111 + 1;
    int _1115 = ~_1091;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    bool _1121 = _1087 >= 0.0;
    int _1123 = _1107;
    int _1125 = _1113;
    int _1127 = _1119;
    float _1129 = _1089;
    int _1131 = _1063;
    if (!_871)
    {
        int _1133 = ~_1071;
        int _1135 = _1133 + 1;
        _1123 = _1135;
    }
    int _1137 = _1123;
    if (!_957)
    {
        int _1139 = ~_1099;
        int _1141 = _1139 + 1;
        _1125 = _1141;
    }
    int _1143 = _1125;
    if (!_1065)
    {
        int _1145 = ~_1091;
        int _1147 = _1145 + 1;
        _1127 = _1147;
    }
    int _1149 = _1127;
    if (_1011)
    {
        int _1151 = int(0x80000000) & as_type<int>(_975);
        int _1153 = _1063 | _1151;
        _1129 = as_type<float>(_1153);
    }
    float _1155 = _1129;
    bool _1157 = !_997;
    bool _1159 = _1157 && _1095;
    float _1161 = _1155;
    float _1163 = _1155;
    if (!_1159)
    {
        float _1165 = abs(_975);
        bool _1167 = _1165 != as_type<float>(0x7f800000u /* inf */);
        bool _1169 = isnan(_1165);
        bool _1171 = _1167 || _1169;
        bool _1173 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1175 = _1171 || _1173;
        float _1177 = abs(_983);
        bool _1179 = _1177 == as_type<float>(0x7f800000u /* inf */);
        float _1181 = abs(_983);
        bool _1183 = _1181 == as_type<float>(0x7f800000u /* inf */);
        bool _1185 = !_1175;
        bool _1187 = _1183 && _1185;
        if (_1187)
        {
            bool _1189 = as_type<int>(_983) >= 0;
            _1047 = _1189 ? (-1) : 0;
        }
        int _1191 = _1047;
        if (_1187)
        {
            _1131 = 1075235812;
        }
        int _1193 = _1131;
        int _1195 = _1193;
        if (_1187)
        {
            int _1197 = ~_1191;
            int _1199 = (_1197 != 0) ? _1193 : 1061752795;
            _1195 = _1199;
        }
        int _1201 = _1195;
        if (_1187)
        {
            int _1203 = int(0x80000000) & as_type<int>(_975);
            int _1205 = _1201 | _1203;
            _1161 = as_type<float>(_1205);
        }
        float _1207 = _1161;
        bool _1209 = !_1175;
        bool _1211 = _1209 && _1179;
        _1163 = _1207;
        if (!_1211)
        {
            float _1213 = abs(_975);
            float _1215 = abs(_983);
            float _1217 = precise::max(_1213, _1215);
            float _1219 = abs(_975);
            float _1221 = abs(_983);
            float _1223 = precise::min(_1219, _1221);
            float _1225 = 1.0 / _1217;
            float _1227 = abs(_975);
            float _1229 = abs(_983);
            bool _1231 = _1227 > _1229;
            bool _1233 = as_type<int>(_983) >= 0;
            float _1235 = _1223 * _1225;
            float _1237 = abs(_975);
            float _1239 = abs(_983);
            float _1241 = _1237 + _1239;
            int _1243 = as_type<int>(_975) & int(0x80000000);
            float _1245 = _1235 * _1235;
            bool _1247 = _1241 > as_type<float>(0x7f800000u /* inf */);
            bool _1249 = isnan(_1241);
            bool _1251 = _1247 || _1249;
            bool _1253 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1255 = _1251 || _1253;
            float _1257 = _1245 + 11.33538818359375;
            float _1259 = fma(_1245, _1257, 28.84246826171875);
            float _1261 = fma(_1245, _1259, 19.6966705322265625);
            float _1263 = fma(_1245, -0.82336294651031494140625, -5.674867153167724609375);
            float _1265 = fma(_1245, _1263, -6.565555095672607421875);
            float _1267 = 1.0 / _1261;
            float _1269 = _1245 * _1265;
            float _1271 = _1235 * _1269;
            float _1273 = fma(_1271, _1267, _1235);
            float _1275 = _1273;
            _1163 = _1241;
            _1049 = 0.82336294651031494140625;
            if (_1231)
            {
                float _1277 = -_1273;
                float _1279 = _1277 + 1.57079637050628662109375;
                _1275 = _1279;
            }
            float _1281 = _1275;
            int _1283 = as_type<int>(_1281);
            if (!_1233)
            {
                float _1285 = -_1281;
                float _1287 = _1285 + 3.1415927410125732421875;
                _1283 = as_type<int>(_1287);
            }
            int _1289 = _1283;
            if (!_1255)
            {
                int _1291 = _1243 | _1289;
                _1163 = as_type<float>(_1291);
            }
        }
    }
    float _1293 = _1163;
    float _1295 = _1049;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1299 = _1297 != 0;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1303 = _1301 != 0;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1307 = _1305 != 0;
    float _1309 = _1021 * _1097;
    float _1311 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1313 = log2(_1311);
    float _1315 = _1033 * _1097;
    float _1317 = _1295;
    if (_1121)
    {
        _1317 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1319 = _1317;
    float _1321 = -_1309;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1325 = precise::max(_1293, -3.1415927410125732421875);
    float _1327 = -_1315;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1331 = _1059 * _1097;
    float _1333 = _1323 * _1323;
    if (_1121)
    {
        float _1335 = _1319 * 5.0;
        _1051 = as_type<int>(_1335);
    }
    int _1337 = _1051;
    float _1339 = -_1331;
    float _1341 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1059);
    float _1343 = fma(_1329, _1329, _1333);
    if (_1121)
    {
        out.m_47.x = 0.0;
    }
    float _1345 = precise::min(_1325, 3.1415927410125732421875);
    float _1347 = _1313 * _138;
    float _1349 = fma(_1341, _1341, _1343);
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1353 = 1.0 + _1351;
    if (_1121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4519 = as_type<float>(_1337);
        out.gl_Position.z = _4519;
    }
    float _1355 = fma(_1345, 0.15915493667125701904296875, 0.5);
    bool _1357 = !_1299;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = exp2(_1347);
    float _1363 = in.m_71.x;
    float _1365 = in.m_71.y;
    float _1367 = in.m_71.z;
    bool _1369 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1371 = isnan(1.0);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1377 = _1373 || _1375;
    float _1379 = fma(_138, 0.06666667759418487548828125, _1355);
    bool _1381 = !_1303;
    int _1383 = _1381 ? 0 : 1;
    int _1385 = abs(_1359);
    float _1387 = _1379 * 6.283185482025146484375;
    float _1389 = 1.0 / _1353;
    bool _1391 = !_1307;
    int _1393 = _1391 ? 0 : 1;
    int _1395 = abs(_1383);
    bool _1397 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1399 = isnan(0.0);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1149);
    float _1409 = -_1361;
    float _1411 = _1409 + 1.0;
    int _1413 = abs(_1393);
    float _1415 = sqrt(_1349);
    float _1417 = float(_1385);
    float _1419 = float(_1137);
    float _1421 = _1417 * _1407;
    float _1423 = float(_1395);
    float _1425 = _1405 ? _1411 : 0.0;
    float _1427 = float(_1143);
    float _1429 = _1423 * _1419;
    float _1431 = float(_1413);
    if (_1377)
    {
        float _1433 = _1425 * _1389;
        _142 = _1433;
    }
    float _1435 = _142;
    float _1437 = _1421 * (-2.0);
    float _1439 = _1429 * (-2.0);
    float _1441 = _1431 * _1427;
    float _1443 = _160 + (-0.5);
    float _1445 = fma(_1437, _1363, _1363);
    float _1447 = fma(_939, _1437, _939);
    float _1449 = fma(_1101, _1439, _1101);
    float _1451 = fma(_1439, _1365, _1365);
    float _1453 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1445);
    if (_1121)
    {
        return out;
    }
    float _1455 = -_1309;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _985);
    float _1459 = fma(_1447, _1435, _1453);
    float _1461 = -_1315;
    float _1463 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1017);
    float _1465 = -_1331;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1029);
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1471 = _1457 + _1469;
    float _1473 = _700 + (-0.5);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1477 = _1463 + _1475;
    float _1479 = _1387 * 0.15915493667125701904296875;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1483 = _160 + _911;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1487 = _1467 + _1485;
    float _1489 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1451);
    float _1491 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1481);
    float _1493 = _1483 + (-1.0);
    float _1495 = _1441 * (-2.0);
    float _1497 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1491);
    float _1499 = fma(_1449, _1435, _1489);
    float _1501 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1503 = fma(_1495, _1367, _1367);
    float _1505 = _911 + (-0.5);
    bool _1507 = _1497 >= 0.0;
    float _1509 = fma(_1501, _1495, _1501);
    float _1511 = _1459 * 0.15915493667125701904296875;
    float _1513 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1503);
    float _1515 = in.m_53.x;
    float _1517 = in.m_53.y;
    float _1519 = in.m_53.z;
    float _1521 = _1499 * 0.15915493667125701904296875;
    float _1523 = _1511 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    float _1527 = fma(_1509, _1435, _1513);
    float _1529 = in.m_63.z;
    float _1531 = _1527 * 0.15915493667125701904296875;
    float _1533 = _1499;
    if (_1507)
    {
        _1533 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1535 = _1533;
    float _1537 = _1511 * 6.283185482025146484375;
    float _1539 = cos(_1537);
    int _1541 = as_type<int>(_1535);
    if (_1507)
    {
        out.m_47.x = 0.0;
    }
    if (_1507)
    {
        float _1543 = _1535 * 5.0;
        _1541 = as_type<int>(_1543);
    }
    int _1545 = _1541;
    float _1547 = _1479 * 6.283185482025146484375;
    float _1549 = sin(_1547);
    if (_1507)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4811 = as_type<float>(_1545);
        out.gl_Position.z = _4811;
    }
    float _1551 = _1521 * 6.283185482025146484375;
    float _1553 = sin(_1551);
    float _1555 = _1521 * 6.283185482025146484375;
    float _1557 = cos(_1555);
    float _1559 = _1531 * 6.283185482025146484375;
    float _1561 = sin(_1559);
    if (_1507)
    {
        return out;
    }
    float _1563 = _1531 * 6.283185482025146484375;
    float _1565 = cos(_1563);
    float _1567 = _608 * _1517;
    float _1569 = _606 * _1515;
    float _1571 = fma(_1549, 0.5, 1.5);
    float _1573 = _610 * _1519;
    float _1575 = _1097 * _1415;
    float _1577 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1579 = _1571 * _704;
    float _1581 = _1571 * _706;
    float _1583 = _1567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1585 = _1571 * _1529;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1589 = _1525 * _1553;
    float _1591 = _1539 * _1557;
    float _1593 = _1539 * _1553;
    float _1595 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1579);
    float _1597 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1581);
    float _1599 = _1575 * _1577;
    float _1601 = _1575 * _1583;
    float _1603 = _1539 * _1565;
    float _1605 = _1525 * _1557;
    float _1607 = _1575 * _1587;
    float _1609 = fma(_1561, _1591, _1589);
    float _1611 = _1595 * _1599;
    float _1613 = _1597 * _1601;
    float _1615 = fma(_1561, _1589, _1591);
    float _1617 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1619 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1621 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1623 = _1557 * _1565;
    float _1625 = _1525 * _1565;
    float _1627 = _1553 * _1565;
    float _1629 = -_1593;
    float _1631 = fma(_1561, _1605, _1629);
    float _1633 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1585);
    float _1635 = -_1605;
    float _1637 = fma(_1561, _1593, _1635);
    float _1639 = _1603 * _1613;
    float _1641 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1643 = -_1561;
    float _1645 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1617);
    float _1647 = -_1561;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1619);
    float _1651 = -_1561;
    float _1653 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1621);
    float _1655 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1657 = -_1613;
    float _1659 = _1561 * _1657;
    float _1661 = _1625 * _1613;
    float _1663 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1665 = _1633 * _1607;
    float _1667 = fma(_1609, _1611, _1639);
    float _1669 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1641);
    float _1671 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1655);
    float _1673 = fma(_1623, _1611, _1659);
    float _1675 = fma(_1631, _1611, _1661);
    float _1677 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1663);
    float _1679 = fma(_1637, _1665, _1667);
    float _1681 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1669);
    float _1683 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1671);
    float _1685 = fma(_1627, _1665, _1673);
    float _1687 = fma(_1615, _1665, _1675);
    float _1689 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1677);
    float _1691 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1693 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1695 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1697 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1699 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1701 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1691);
    float _1703 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1693);
    float _1705 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1697);
    float _1707 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1699);
    float _1709 = in.m_73.x;
    float _1711 = in.m_73.y;
    float _1713 = in.m_73.z;
    bool _1715 = _1581 != 0.0;
    bool _1717 = isnan(_1581);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(0.0);
    bool _1723 = _1719 || _1721;
    float _1725 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1705);
    float _1727 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1707);
    float _1729 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1695);
    bool _1731 = _1579 == 0.0;
    bool _1733 = !_1723;
    bool _1735 = _1731 && _1733;
    float _1737 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1739 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1741 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1645);
    float _1743 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1649);
    float _1745 = _1017 + _1737;
    float _1747 = _1029 + _1739;
    float _1749 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1653);
    bool _1751 = _1585 == 0.0;
    bool _1753 = _1751 && _1735;
    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1757 = _1745 + _1755;
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1761 = _1747 + _1759;
    float _1763 = in.m_75.x;
    float _1765 = in.m_75.y;
    float _1767 = in.m_75.z;
    float _1769 = in.m_75.w;
    float _1771 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1701);
    float _1773 = _1757 * _1757;
    float _1775 = _1761 * _1761;
    float _1777 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1703);
    float _1779 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1729);
    float _1781 = _1773 + _1775;
    float _1783 = _1737;
    float _1785 = _1597;
    float _1787 = _1727;
    float _1789 = _1773;
    float _1791 = _1775;
    float _1793 = _1745;
    float _1795 = _1747;
    float _1797 = _1683;
    if (_1753)
    {
        _1783 = _1713;
    }
    float _1799 = _1783;
    float _1801 = sqrt(_1781);
    float _1803 = _1799;
    if (!_1753)
    {
        float _1805 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1713);
        _1803 = _1805;
    }
    float _1807 = _1803;
    float _1809 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1753)
    {
        _1785 = _1709;
    }
    float _1811 = _1785;
    float _1813 = _1811;
    if (!_1753)
    {
        float _1815 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1709);
        _1813 = _1815;
    }
    float _1817 = _1813;
    if (_1753)
    {
        _1787 = _1711;
    }
    float _1819 = _1787;
    float _1821 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1809);
    float _1823 = _1819;
    if (!_1753)
    {
        float _1825 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1711);
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1821);
    float _1831 = _1741 * _1765;
    float _1833 = _1743 * _1765;
    float _1835 = _1749 * _1765;
    bool _1837 = _1801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = fma(_1681, _1763, _1831);
    float _1841 = _1767 * _1709;
    float _1843 = _1763 * _1711;
    float _1845 = _1765 * _1713;
    float _1847 = _1829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1849 = fma(_1683, _1763, _1833);
    float _1851 = fma(_1689, _1763, _1835);
    float _1853 = -_1841;
    float _1855 = fma(_1763, _1713, _1853);
    float _1857 = -_1843;
    float _1859 = fma(_1765, _1709, _1857);
    float _1861 = -_1845;
    float _1863 = fma(_1767, _1711, _1861);
    float _1865 = _985 + _1847;
    float _1867 = _1855 * _1769;
    float _1869 = _1859 * _1769;
    float _1871 = _1863 * _1769;
    float _1873 = fma(_1771, _1767, _1839);
    float _1875 = fma(_1777, _1767, _1849);
    float _1877 = fma(_1779, _1767, _1851);
    float _1879 = _1769;
    if (!_1837)
    {
        _1879 = _1865;
    }
    float _1881 = _1879;
    bool _1883 = !_1837;
    float _1885 = _1881;
    if (!_1883)
    {
        float _1887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1891 = _1801 + _1889;
        float _1893 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1895 = rsqrt(_1781);
        float _1897 = _1891 * _1887;
        float _1899 = _1897 * 0.15915493667125701904296875;
        float _1901 = _1899 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = _1899 * 6.283185482025146484375;
        float _1907 = cos(_1905);
        float _1909 = fma(_1903, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1911 = _1895 * _1909;
        float _1913 = fma(_1757, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1915 = _1907 + (-1.0);
        float _1917 = fma(_1761, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1921 = _1913 + _1919;
        float _1923 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1927 = _1917 + _1925;
        float _1929 = _1921 * _1921;
        float _1931 = fma(_1865, _1907, _1923);
        float _1933 = _1927 * _1927;
        _1885 = _1931;
        _1789 = _1929;
        _1791 = _1933;
        _1793 = _1913;
        _1795 = _1917;
    }
    float _1935 = _1885;
    float _1937 = _1789;
    float _1939 = _1791;
    float _1941 = _1793;
    float _1943 = _1795;
    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1947 = _1935 + _1945;
    float _1949 = _1741 * _1827;
    float _1951 = _1743 * _1827;
    float _1953 = _1749 * _1827;
    float _1955 = fma(_1947, _1947, _1937);
    float _1957 = _1867 * _1741;
    float _1959 = _1867 * _1743;
    float _1961 = _1867 * _1749;
    float _1963 = _1955 + _1939;
    float _1965 = fma(_1681, _1817, _1949);
    float _1967 = fma(_1683, _1817, _1951);
    float _1969 = fma(_1689, _1817, _1953);
    float _1971 = fma(_1871, _1681, _1957);
    float _1973 = fma(_1871, _1683, _1959);
    float _1975 = sqrt(_1963);
    float _1977 = fma(_1871, _1689, _1961);
    float _1979 = fma(_1771, _1807, _1965);
    float _1981 = fma(_1777, _1807, _1967);
    float _1983 = fma(_1779, _1807, _1969);
    float _1985 = fma(_1869, _1771, _1971);
    float _1987 = fma(_1869, _1777, _1973);
    float _1989 = fma(_1869, _1779, _1977);
    out.m_77.x = _1873;
    out.m_77.y = _1875;
    out.m_77.z = _1877;
    out.m_79.x = _1979;
    out.m_79.y = _1981;
    out.m_79.z = _1983;
    out.m_81.x = _1985;
    out.m_81.y = _1987;
    out.m_81.z = _1989;
    bool _1991 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1993 = isnan(_1975);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1999 = _1995 || _1997;
    float _2001 = _1987;
    if (!_1999)
    {
        _1797 = 1.0;
    }
    float _2003 = _1797;
    bool _2005 = !_1999;
    float _2007 = _2003;
    if (!_2005)
    {
        bool _2009 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2011 = isnan(_1975);
        bool _2013 = _2009 || _2011;
        bool _2015 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2017 = _2013 || _2015;
        if (!_2017)
        {
            float _2019 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2021 = _1975 + _2019;
            float _2023 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2025 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2023;
            float _2027 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2029 = _2027 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2031 = 1.0 / _2025;
            float _2033 = _2021 * _2031;
            float _2035 = fma(_2033, _2029, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2007 = _2035;
            _2037 = true;
        }
        else
        {
            bool _2039 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2041 = isnan(_1975);
            bool _2043 = _2039 || _2041;
            bool _2045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2047 = _2043 || _2045;
            if (!_2047)
            {
                float _2049 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2051 = _1975 + _2049;
                float _2053 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2055 = _2053 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2059 = _2057 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2061 = 1.0 / _2055;
                float _2063 = _2051 * _2061;
                float _2065 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2007 = _2065;
                _2037 = true;
            }
            else
            {
                _2007 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2037 = false;
    float _2067 = _2007;
    float _2069 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2071 = _1941 + _2069;
    float _2073 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2075 = _1935 + _2073;
    float _2077 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2079 = _1943 + _2077;
    bool _2081 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan(0.5);
    bool _2089 = _2085 || _2087;
    float _2091 = fma(_2071, _2067, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2093 = fma(_2075, _2067, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2095 = fma(_2079, _2067, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -_1315;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2091);
    float _2101 = -_1309;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2093);
    float _2105 = -_1331;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2095);
    float _2109 = _2103;
    float _2111 = _2099;
    float _2113 = _2107;
    if (!_2089)
    {
        float _2115 = _1471 * _1471;
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2119 = -_1017;
        float _2121 = _2119 + _2091;
        float _2123 = -_1029;
        float _2125 = _2123 + _2095;
        float _2127 = fma(_1477, _1477, _2115);
        float _2129 = fma(_1487, _1487, _2127);
        float _2131 = 1.0 / _1575;
        float _2133 = sqrt(_2129);
        float _2135 = precise::min(_2133, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2137 = _2135 * _2117;
        float _2139 = -_985;
        float _2141 = _2139 + _2093;
        float _2143 = _2137 * _2131;
        float _2145 = fma(_2121, _2143, _1463);
        float _2147 = fma(_2141, _2143, _1457);
        float _2149 = fma(_2125, _2143, _1467);
        _2109 = _2147;
        _2111 = _2145;
        _2113 = _2149;
    }
    float _2151 = _2109;
    float _2153 = _2111;
    float _2155 = _2113;
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2159 = _2151 + _2157;
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2163 = _2153 + _2161;
    float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2167 = _2155 + _2165;
    float _2169 = _2159 * _2159;
    float _2171 = fma(_2163, _2163, _2169);
    float _2173 = fma(_2167, _2167, _2171);
    float _2175 = rsqrt(_2173);
    float _2177 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2179 = _2163 * _2177;
    float _2181 = _2167 * _2177;
    float _2183 = _2179 * _2179;
    float _2185 = _2181 * _2181;
    float _2187 = _2183 + _2185;
    float _2189 = sqrt(_2187);
    bool _2191 = _2189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2195 = _2189 + _2193;
    float _2197 = _2175;
    float _2199 = _2187;
    float _2201 = _2195;
    float _2203 = _2159;
    float _2205 = _2177;
    float _2207 = _2179;
    if (_2191)
    {
        float _2209 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2197 = _2209;
    }
    float _2211 = _2197;
    if (_2191)
    {
        float _2213 = rsqrt(_2187);
        _2199 = _2213;
    }
    float _2215 = _2199;
    if (_2191)
    {
        float _2217 = _2195 * _2211;
        _2201 = _2217;
    }
    float _2219 = _2201;
    if (_2191)
    {
        float _2221 = _2219 * 0.15915493667125701904296875;
        _2001 = _2221;
    }
    float _2223 = _2001;
    float _2225 = _2211;
    float _2227 = _2223;
    if (_2191)
    {
        float _2229 = _2223 * 6.283185482025146484375;
        float _2231 = sin(_2229);
        _2225 = _2231;
    }
    float _2233 = _2225;
    float _2235 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2237 = precise::max(0.0, _2235);
    float _2239 = _2167;
    float _2241 = _2237;
    if (_2191)
    {
        float _2243 = _2223 * 6.283185482025146484375;
        float _2245 = cos(_2243);
        _2239 = _2245;
    }
    float _2247 = _2239;
    float _2249 = -_2177;
    float _2251 = -_2237;
    float _2253 = fma(_2159, _2249, _2251);
    float _2255 = _2253;
    if (!_2191)
    {
        _2203 = _2183;
    }
    float _2257 = _2203;
    float _2259 = _2257;
    if (_2191)
    {
        float _2261 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2241 = _2261;
    }
    float _2263 = _2241;
    float _2265 = _2233;
    float _2267 = _2263;
    if (_2191)
    {
        float _2269 = fma(_2233, _2263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2265 = _2269;
    }
    float _2271 = _2265;
    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2275 = _2271;
    if (_2191)
    {
        float _2277 = _2247 + (-1.0);
        _2267 = _2277;
    }
    float _2279 = _2267;
    float _2281 = _2279;
    if (_2191)
    {
        float _2283 = _2215 * _2271;
        _2205 = _2283;
    }
    float _2285 = _2205;
    if (!_2191)
    {
        _2275 = _2181;
    }
    float _2287 = _2275;
    float _2289 = sqrt(_2173);
    float _2291 = _2287;
    if (_2191)
    {
        float _2293 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2293;
    }
    float _2295 = _2227;
    if (_2191)
    {
        float _2297 = _2179 * _2285;
        _2207 = _2297;
    }
    float _2299 = _2207;
    if (_2191)
    {
        float _2301 = _2181 * _2285;
        _2291 = _2301;
    }
    float _2303 = _2291;
    if (!_2191)
    {
        _2281 = _2185;
    }
    float _2305 = _2281;
    float _2307 = _2305;
    if (_2191)
    {
        float _2309 = fma(_2253, _2247, _2295);
        _2255 = _2309;
    }
    float _2311 = _2255;
    if (_2191)
    {
        float _2313 = _2299 * _2299;
        _2259 = _2313;
    }
    float _2315 = _2259;
    if (_2191)
    {
        float _2317 = _2303 * _2303;
        _2307 = _2317;
    }
    float _2319 = _2307;
    float _2321 = fma(_2311, _2311, _2315);
    float _2323 = _2321 + _2319;
    float _2325 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2329 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2327);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = rsqrt(_2323);
    float _2335 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2325);
    float _2337 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2339 = -_2331;
    float _2341 = _2339 + 1.0;
    float _2343 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2335);
    float _2345 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2347 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2337);
    float _2349 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2351 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2353 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2345);
    float _2355 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2347);
    float _2357 = abs(_2341);
    float _2359 = log2(_2357);
    float _2361 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2349);
    float _2363 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2353);
    float _2365 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2367 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2369 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2361);
    float _2371 = _2333 * _2299;
    float _2373 = _2363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2375 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2377 = -_2367;
    float _2379 = fma(_2377, _2273, 1.0);
    float _2381 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2383 = _2333 * _2311;
    float _2385 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2387 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2375);
    float _2389 = _2333 * _2303;
    float _2391 = log2(_2379);
    float _2393 = -_2385;
    float _2395 = fma(_2383, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2393);
    float _2397 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2387);
    float _2399 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2401 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2403 = -_2389;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2395);
    float _2407 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2397);
    float _2409 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2411 = exp2(_2399);
    float _2413 = fma(_2405, -0.5, 0.5);
    float _2415 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2401);
    float _2417 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2409);
    float _2419 = _2383 + 1.0;
    float _2421 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2415);
    float _2423 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2417);
    float _2425 = 1.0 / _2407;
    float _2427 = fma(_2405, 0.5, 0.5);
    float _2429 = _2391 * 0.693147182464599609375;
    float _2431 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2423);
    float _2433 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2421);
    float _2435 = fma(_2427, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2437 = sqrt(_2413);
    float _2439 = -_2383;
    float _2441 = fma(_2411, _2419, _2439);
    float _2443 = fma(_2427, _2435, -0.212114393711090087890625);
    float _2445 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2447 = fma(_2427, _2443, 1.570728778839111328125);
    float _2449 = _2431 * _2425;
    float _2451 = _2433 * _2425;
    float _2453 = fma(_2449, 0.5, 0.5);
    float _2455 = fma(_2451, -0.5, 0.5);
    float _2457 = fma(_2441, 0.5, 0.5);
    float _2459 = _2437 * 0.636619746685028076171875;
    float3 _6338 = float3(_2453, _2455, _2445);
    float _2461 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6338, float3(0.0), isnan(_6338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6338, float3(0.0), isnan(_6338)), level(0.0)).x;
    float3 _6349 = float3(_2453, _2455, _2445);
    float4 _2464 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).xyzw;
    float _2466 = _2464.x;
    float _2468 = _2464.y;
    float _2470 = _2464.z;
    float _2472 = _2464.w;
    float _2474 = -_2447;
    float _2476 = fma(_2459, _2474, 1.0);
    float2 _6371 = float2(_2476, _2457);
    float3 _2480 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6371, float2(0.0), isnan(_6371)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6371, float2(0.0), isnan(_6371)), level(0.0)).xyz;
    float _2482 = _2480.x;
    float _2484 = _2480.y;
    float _2486 = _2480.z;
    float _2488 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2490 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2492 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2494 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2490);
    float _2496 = exp2(_2488);
    float _2498 = _2492 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2500 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2494);
    float _2502 = _2431 + _2407;
    float _2504 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2500);
    float _2506 = _2502 * 0.5;
    float _2508 = _2407 * 0.5;
    out.m_47.x = _2498;
    float _2510 = _2504 + _2407;
    out.gl_Position.x = _2431;
    out.gl_Position.y = _2433;
    out.gl_Position.z = _2504;
    out.gl_Position.w = _2407;
    float _2512 = _2510 * 0.5;
    float _2514 = -_2496;
    float _2516 = _2514 + 1.0;
    float _2518 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2520 = fma(_2433, -0.5, _2508);
    out.m_83.x = _2506;
    out.m_83.y = _2520;
    out.m_83.z = _2512;
    out.m_83.w = _2407;
    float _2522 = _2518 * _2461;
    float _2524 = -_2518;
    float _2526 = _2524 + 1.0;
    float _2528 = _2472 * _2522;
    float _2530 = _2486 * _2522;
    float _2532 = fma(_2482, _2528, _2466);
    float _2534 = fma(_2484, _2528, _2468);
    float _2536 = _2472 * _2526;
    float _2538 = fma(_2472, _2530, _2470);
    out.m_85.x = _2532;
    out.m_85.y = _2534;
    out.m_85.z = _2538;
    out.m_85.w = _2536;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2037 = false;
    bool _630 = false;
    bool _398 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2595 = as_type<float>(_120);
        out.gl_Position.z = _2595;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2664 = as_type<float>(_158);
        out.gl_Position.z = _2664;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = _164 * _162;
    float _180 = 0.0;
    if (!_176)
    {
        float _182 = _166 * _166;
        float _184 = _182 * 0.5;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _190 = _186;
    if (!_176)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    int _208 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _210 = _208 != 0;
    float _212 = _206 * 6.283185482025146484375;
    float _214 = cos(_212);
    float _216 = 1.4012984643248170709237295832899e-45;
    float _218 = _194;
    if (!_176)
    {
        _216 = _166;
    }
    float _220 = _216;
    float _222 = -_204;
    float _224 = _188 + _222;
    bool _226 = !_176;
    float _228 = _220;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _166 * _232;
        float _242 = 1.0 / _236;
        float _244 = _238 * 0.693147182464599609375;
        float _246 = exp2(_240);
        float _248 = 1.0 / _244;
        float _250 = _246 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _248, _166);
        float _256 = _254 * _242;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _258;
    }
    float _260 = _218;
    bool _262 = !_176;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _166 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _228 = _282;
    }
    float _284 = _228;
    float _286 = in.m_53.w;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _300 = _298 != 0;
    float _302 = fma(_214, 0.5, 0.5);
    bool _304 = _224 < 0.5;
    float _306 = float(_304);
    float _308 = -_224;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _312 = !_210;
    int _314 = _312 ? 0 : 1;
    float _316 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _318 = !_296;
    int _320 = _318 ? 0 : 1;
    float _322 = -_306;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _326 = -_302;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = fma(_284, _196, _316);
    int _332 = abs(_320);
    float _334 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _336 = abs(_314);
    bool _338 = !_300;
    int _340 = _338 ? 0 : 1;
    float _342 = fma(_284, _198, _334);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _346 = abs(_340);
    float _348 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = float(_332);
    float _352 = fma(_330, _286, _288);
    float _354 = float(_336);
    float _356 = fma(_342, _286, _290);
    float _358 = abs(_310);
    float _360 = _350 * _358;
    float _362 = fma(_284, _200, _348);
    float _364 = float(_346);
    float _366 = fma(_354, _328, _360);
    float _368 = fma(_362, _286, _292);
    float _370 = abs(_324);
    float _372 = fma(_364, _370, _366);
    bool _374 = !_344;
    bool _376 = false;
    bool _378 = false;
    float _380 = _356;
    float _396;
    if (!_374)
    {
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _384 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_104);
        float _402 = 1.0 / _400;
        float _404 = _138 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = _406 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _406 + _412;
    bool _416 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _418 = isnan(_406);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = _406 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _444 = 1.0 / _430;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _448 = 1.0 / _442;
    float _450 = 1.0 / _438;
    float _452 = _410 * _444;
    bool _454 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _456 = isnan(_406);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -_426;
    float _468 = _466 + 1.0;
    float _470 = _464 * _468;
    float _472 = _414 * _448;
    bool _474 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _476 = isnan(_406);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _486;
    bool _490 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _492 = isnan(_406);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _506 = -_464;
    float _508 = _506 + 1.0;
    float _510 = -_484;
    float _512 = _510 + 1.0;
    float _514 = _434 * _450;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _520;
    float _524 = _500 * _512;
    float _526 = fma(_488, _514, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _528 = fma(_518, _514, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _530 = fma(_522, _514, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _532 = -_500;
    float _534 = _532 + 1.0;
    float _536 = _526 * _524;
    float _538 = _528 * _524;
    float _540 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _542 = _530 * _524;
    float _544 = _484 * _508;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = _540 * _160;
    float _556 = fma(_504, _472, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _542);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _538);
    float _562 = trunc(_554);
    int _564 = int(_562);
    float _566 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _536);
    float _568 = fma(_556, _544, _558);
    float _570 = fma(_548, _472, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _576;
    float _580 = fma(_552, _472, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _582;
    float _586 = fma(_570, _544, _560);
    float _588 = fma(_574, _452, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _590 = fma(_578, _452, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _592 = fma(_584, _452, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _594 = fma(_580, _544, _566);
    float _596 = fma(_588, _470, _568);
    float _598 = fma(_590, _470, _586);
    int _600 = _564 << 4;
    int _602 = _600 + 1712;
    float _604 = fma(_592, _470, _594);
    float _606 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].x, _596);
    float _608 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].y, _598);
    float _610 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].z, _604);
    bool _612 = !_446;
    float _628;
    if (!_612)
    {
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _616 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_104);
        float _634 = 1.0 / _632;
        float _636 = _138 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = in.m_51.w;
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _644 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _646 = in.m_55.x;
    float _648 = in.m_55.y;
    float _650 = in.m_55.z;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _658 = _656 != 0;
    float _660 = in.m_57.x;
    float _662 = in.m_57.y;
    float _664 = in.m_57.z;
    float _666 = _644 * _160;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _670 = _668 != 0;
    float _672 = in.m_59.x;
    float _674 = in.m_59.y;
    float _676 = in.m_59.z;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _680 = _678 != 0;
    float _682 = trunc(_666);
    int _684 = int(_682);
    float _686 = in.m_61.x;
    float _688 = _452;
    if (_654)
    {
        float _690 = in.m_51.z;
        _688 = _690;
    }
    float _692 = _688;
    if (_658)
    {
        bool _694 = _160 > 0.5;
        _376 = _694;
    }
    bool _696 = _376;
    bool _698 = _640 > 0.5;
    float _700 = in.m_51.y;
    float _702 = _356 * _648;
    float _704 = in.m_63.x;
    float _706 = in.m_63.y;
    int _708 = _684 << 4;
    int _710 = _708 + 1968;
    float _712 = _356 * _662;
    float _714 = fma(_352, _646, _702);
    float _716 = fma(_352, _660, _712);
    float _718 = _356 * _674;
    uint _721 = uint(int(uint(_602) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[int(_723)][_725];
    int _729 = int(_721) + 1;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    int _733 = _729 & 3;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[int(_731)][_733];
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _741 = _160 * 2.0;
    float _743 = fma(_352, _672, _718);
    int _745 = as_type<int>(_646);
    int _747 = as_type<int>(_741);
    if (_658)
    {
        float _749 = -_686;
        float _751 = _749 + 1.0;
        _745 = as_type<int>(_751);
    }
    int _753 = _745;
    float _755 = 1.0 / _739;
    float _757 = as_type<float>(_753);
    if (_654)
    {
        bool _759 = _692 > 0.5;
        _378 = _759;
    }
    bool _761 = _378;
    float _763 = fma(_368, _664, _716);
    float _765 = in.m_61.y;
    uint _767 = uint(int(uint(_710) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[int(_777)][_779];
    if (!_658)
    {
        _380 = _686;
    }
    float _783 = _380;
    float _785 = fma(_368, _676, _743);
    float _787 = floor(_741);
    float _789 = _783;
    if (_658)
    {
        float _791 = _696 ? as_type<float>(_753) : _686;
        _789 = _791;
    }
    float _793 = _789;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _795;
    float _799 = abs(_704);
    float _801 = abs(_706);
    float _803 = precise::max(_799, _801);
    if (!_654)
    {
        _757 = _686;
    }
    float _805 = _757;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _809 = _803 >= 16.0;
    float _811 = _797 * _755;
    float _813 = _805;
    if (_654)
    {
        float _815 = -_686;
        float _817 = _815 + 1.0;
        _747 = as_type<int>(_817);
    }
    int _819 = _747;
    bool _821 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _823 = isnan(_638);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    int _833 = _710 + 8;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    uint _837 = uint(int(uint(int(_835)) >> uint(2)));
    int _839 = int(_835) & 3;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[int(_837)][_839];
    float _843 = fma(_368, _650, _714);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _847 = _638 + _845;
    if (_654)
    {
        float _849 = _761 ? as_type<float>(_819) : _686;
        _813 = _849;
    }
    float _851 = _813;
    float _853 = -_831;
    float _855 = _853 + 1.0;
    bool _857 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _859 = isnan(_638);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = fma(_811, _847, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _871 = _787 > 0.0;
    int _873 = _602 + 8;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    uint _877 = uint(int(uint(int(_875)) >> uint(2)));
    int _879 = int(_875) & 3;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[int(_877)][_879];
    bool _883 = _787 >= 0.0;
    bool _885 = isnan(_787);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    float _893 = _867 * _855;
    float _895 = _700 * 2.0;
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _899 = _700 > 0.5;
    float _901 = _869 * _893;
    float _903 = -_867;
    float _905 = _903 + 1.0;
    float _907 = -_765;
    float _909 = _907 + 1.0;
    float _911 = in.m_51.z;
    float _913 = _160 + _700;
    float _915 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[115].x, _901);
    float _917 = floor(_895);
    int _919 = _698 ? as_type<int>(_909) : as_type<int>(_765);
    float _921 = _913 + (-1.0);
    float _923 = _851 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _925 = _670 ? as_type<float>(_919) : _765;
    float _927 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _929 = _765;
    bool _931 = _899;
    if (_680)
    {
        float _933 = _899 ? _909 : _765;
        _929 = _933;
    }
    float _935 = _929;
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _939 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _941 = _925 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _945 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[116].x, _915);
    float _947 = _773 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _949 = _781 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _951 = _943 * _897;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _955 = _706 * 0.0625;
    bool _957 = _917 > 0.0;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _961 = _917 >= 0.0;
    bool _963 = isnan(_917);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = _735 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _973 = _704 * 0.0625;
    float _975 = _809 ? _955 : _706;
    float _977 = _911 * 2.0;
    float _979 = _941 * _937;
    float _981 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = _809 ? _973 : _704;
    float _985 = _843 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _987 = abs(_975);
    bool _989 = _987 != 0.0;
    bool _991 = isnan(_987);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = floor(_977);
    float _1001 = _841 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1003 = _807 * _953;
    float _1005 = abs(_983);
    bool _1007 = _1005 == 0.0;
    bool _1009 = !_997;
    bool _1011 = _1007 && _1009;
    float _1013 = _949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1017 = _763 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1021 = _985 + _1019;
    float _1023 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1025 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1027 = _923 * _642;
    float _1029 = _785 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1033 = _1017 + _1031;
    float _1035 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1037 = _1021 * _1021;
    float _1039 = _927 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _945 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _981;
    out.m_65.y = _1013;
    out.m_65.z = _1023;
    out.m_65.w = _959;
    int _1045 = as_type<int>(_945);
    int _1047 = _997 ? (-1) : 0;
    float _1049 = _1013;
    int _1051 = as_type<int>(_1021);
    if (_1011)
    {
        bool _1053 = as_type<int>(_983) >= 0;
        _931 = _1053;
    }
    bool _1055 = _931;
    float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1059 = _1029 + _1057;
    out.m_67.x = _1039;
    out.m_67.y = _1041;
    out.m_67.z = _1025;
    out.m_67.w = _1043;
    if (_1011)
    {
        int _1061 = _1055 ? 0 : 1078530011;
        _1045 = _1061;
    }
    int _1063 = _1045;
    bool _1065 = _999 > 0.0;
    out.m_69.x = _1003;
    out.m_69.y = _951;
    out.m_69.z = _1027;
    out.m_69.w = _979;
    float _1067 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1035);
    float _1069 = fma(_1033, _1033, _1037);
    int _1071 = _891 ? 0 : 1;
    float _1073 = _700 + _911;
    bool _1075 = _999 >= 0.0;
    bool _1077 = isnan(_999);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = fma(_1059, _1059, _1069);
    float _1087 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1067);
    float _1089 = _1073 + (-1.0);
    int _1091 = _1083 ? 0 : 1;
    float _1093 = abs(_983);
    bool _1095 = _1093 == 0.0;
    float _1097 = rsqrt(_1085);
    int _1099 = _969 ? 0 : 1;
    float _1101 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1103 = ~_1071;
    int _1105 = _1103 + 1;
    int _1107 = _1105 + 1;
    int _1109 = ~_1099;
    int _1111 = _1109 + 1;
    int _1113 = _1111 + 1;
    int _1115 = ~_1091;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    bool _1121 = _1087 >= 0.0;
    int _1123 = _1107;
    int _1125 = _1113;
    int _1127 = _1119;
    float _1129 = _1089;
    int _1131 = _1063;
    if (!_871)
    {
        int _1133 = ~_1071;
        int _1135 = _1133 + 1;
        _1123 = _1135;
    }
    int _1137 = _1123;
    if (!_957)
    {
        int _1139 = ~_1099;
        int _1141 = _1139 + 1;
        _1125 = _1141;
    }
    int _1143 = _1125;
    if (!_1065)
    {
        int _1145 = ~_1091;
        int _1147 = _1145 + 1;
        _1127 = _1147;
    }
    int _1149 = _1127;
    if (_1011)
    {
        int _1151 = int(0x80000000) & as_type<int>(_975);
        int _1153 = _1063 | _1151;
        _1129 = as_type<float>(_1153);
    }
    float _1155 = _1129;
    bool _1157 = !_997;
    bool _1159 = _1157 && _1095;
    float _1161 = _1155;
    float _1163 = _1155;
    if (!_1159)
    {
        float _1165 = abs(_975);
        bool _1167 = _1165 != as_type<float>(0x7f800000u /* inf */);
        bool _1169 = isnan(_1165);
        bool _1171 = _1167 || _1169;
        bool _1173 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1175 = _1171 || _1173;
        float _1177 = abs(_983);
        bool _1179 = _1177 == as_type<float>(0x7f800000u /* inf */);
        float _1181 = abs(_983);
        bool _1183 = _1181 == as_type<float>(0x7f800000u /* inf */);
        bool _1185 = !_1175;
        bool _1187 = _1183 && _1185;
        if (_1187)
        {
            bool _1189 = as_type<int>(_983) >= 0;
            _1047 = _1189 ? (-1) : 0;
        }
        int _1191 = _1047;
        if (_1187)
        {
            _1131 = 1075235812;
        }
        int _1193 = _1131;
        int _1195 = _1193;
        if (_1187)
        {
            int _1197 = ~_1191;
            int _1199 = (_1197 != 0) ? _1193 : 1061752795;
            _1195 = _1199;
        }
        int _1201 = _1195;
        if (_1187)
        {
            int _1203 = int(0x80000000) & as_type<int>(_975);
            int _1205 = _1201 | _1203;
            _1161 = as_type<float>(_1205);
        }
        float _1207 = _1161;
        bool _1209 = !_1175;
        bool _1211 = _1209 && _1179;
        _1163 = _1207;
        if (!_1211)
        {
            float _1213 = abs(_975);
            float _1215 = abs(_983);
            float _1217 = precise::max(_1213, _1215);
            float _1219 = abs(_975);
            float _1221 = abs(_983);
            float _1223 = precise::min(_1219, _1221);
            float _1225 = 1.0 / _1217;
            float _1227 = abs(_975);
            float _1229 = abs(_983);
            bool _1231 = _1227 > _1229;
            bool _1233 = as_type<int>(_983) >= 0;
            float _1235 = _1223 * _1225;
            float _1237 = abs(_975);
            float _1239 = abs(_983);
            float _1241 = _1237 + _1239;
            int _1243 = as_type<int>(_975) & int(0x80000000);
            float _1245 = _1235 * _1235;
            bool _1247 = _1241 > as_type<float>(0x7f800000u /* inf */);
            bool _1249 = isnan(_1241);
            bool _1251 = _1247 || _1249;
            bool _1253 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1255 = _1251 || _1253;
            float _1257 = _1245 + 11.33538818359375;
            float _1259 = fma(_1245, _1257, 28.84246826171875);
            float _1261 = fma(_1245, _1259, 19.6966705322265625);
            float _1263 = fma(_1245, -0.82336294651031494140625, -5.674867153167724609375);
            float _1265 = fma(_1245, _1263, -6.565555095672607421875);
            float _1267 = 1.0 / _1261;
            float _1269 = _1245 * _1265;
            float _1271 = _1235 * _1269;
            float _1273 = fma(_1271, _1267, _1235);
            float _1275 = _1273;
            _1163 = _1241;
            _1049 = 0.82336294651031494140625;
            if (_1231)
            {
                float _1277 = -_1273;
                float _1279 = _1277 + 1.57079637050628662109375;
                _1275 = _1279;
            }
            float _1281 = _1275;
            int _1283 = as_type<int>(_1281);
            if (!_1233)
            {
                float _1285 = -_1281;
                float _1287 = _1285 + 3.1415927410125732421875;
                _1283 = as_type<int>(_1287);
            }
            int _1289 = _1283;
            if (!_1255)
            {
                int _1291 = _1243 | _1289;
                _1163 = as_type<float>(_1291);
            }
        }
    }
    float _1293 = _1163;
    float _1295 = _1049;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1299 = _1297 != 0;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1303 = _1301 != 0;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1307 = _1305 != 0;
    float _1309 = _1021 * _1097;
    float _1311 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1313 = log2(_1311);
    float _1315 = _1033 * _1097;
    float _1317 = _1295;
    if (_1121)
    {
        _1317 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1319 = _1317;
    float _1321 = -_1309;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1325 = precise::max(_1293, -3.1415927410125732421875);
    float _1327 = -_1315;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1331 = _1059 * _1097;
    float _1333 = _1323 * _1323;
    if (_1121)
    {
        float _1335 = _1319 * 5.0;
        _1051 = as_type<int>(_1335);
    }
    int _1337 = _1051;
    float _1339 = -_1331;
    float _1341 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1059);
    float _1343 = fma(_1329, _1329, _1333);
    if (_1121)
    {
        out.m_47.x = 0.0;
    }
    float _1345 = precise::min(_1325, 3.1415927410125732421875);
    float _1347 = _1313 * _138;
    float _1349 = fma(_1341, _1341, _1343);
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1353 = 1.0 + _1351;
    if (_1121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4519 = as_type<float>(_1337);
        out.gl_Position.z = _4519;
    }
    float _1355 = fma(_1345, 0.15915493667125701904296875, 0.5);
    bool _1357 = !_1299;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = exp2(_1347);
    float _1363 = in.m_71.x;
    float _1365 = in.m_71.y;
    float _1367 = in.m_71.z;
    bool _1369 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1371 = isnan(1.0);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1377 = _1373 || _1375;
    float _1379 = fma(_138, 0.06666667759418487548828125, _1355);
    bool _1381 = !_1303;
    int _1383 = _1381 ? 0 : 1;
    int _1385 = abs(_1359);
    float _1387 = _1379 * 6.283185482025146484375;
    float _1389 = 1.0 / _1353;
    bool _1391 = !_1307;
    int _1393 = _1391 ? 0 : 1;
    int _1395 = abs(_1383);
    bool _1397 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1399 = isnan(0.0);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1149);
    float _1409 = -_1361;
    float _1411 = _1409 + 1.0;
    int _1413 = abs(_1393);
    float _1415 = sqrt(_1349);
    float _1417 = float(_1385);
    float _1419 = float(_1137);
    float _1421 = _1417 * _1407;
    float _1423 = float(_1395);
    float _1425 = _1405 ? _1411 : 0.0;
    float _1427 = float(_1143);
    float _1429 = _1423 * _1419;
    float _1431 = float(_1413);
    if (_1377)
    {
        float _1433 = _1425 * _1389;
        _142 = _1433;
    }
    float _1435 = _142;
    float _1437 = _1421 * (-2.0);
    float _1439 = _1429 * (-2.0);
    float _1441 = _1431 * _1427;
    float _1443 = _160 + (-0.5);
    float _1445 = fma(_1437, _1363, _1363);
    float _1447 = fma(_939, _1437, _939);
    float _1449 = fma(_1101, _1439, _1101);
    float _1451 = fma(_1439, _1365, _1365);
    float _1453 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1445);
    if (_1121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1455 = -_1309;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _985);
    float _1459 = fma(_1447, _1435, _1453);
    float _1461 = -_1315;
    float _1463 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1017);
    float _1465 = -_1331;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1029);
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1471 = _1457 + _1469;
    float _1473 = _700 + (-0.5);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1477 = _1463 + _1475;
    float _1479 = _1387 * 0.15915493667125701904296875;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1483 = _160 + _911;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1487 = _1467 + _1485;
    float _1489 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1451);
    float _1491 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1481);
    float _1493 = _1483 + (-1.0);
    float _1495 = _1441 * (-2.0);
    float _1497 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1491);
    float _1499 = fma(_1449, _1435, _1489);
    float _1501 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1503 = fma(_1495, _1367, _1367);
    float _1505 = _911 + (-0.5);
    bool _1507 = _1497 >= 0.0;
    float _1509 = fma(_1501, _1495, _1501);
    float _1511 = _1459 * 0.15915493667125701904296875;
    float _1513 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1503);
    float _1515 = in.m_53.x;
    float _1517 = in.m_53.y;
    float _1519 = in.m_53.z;
    float _1521 = _1499 * 0.15915493667125701904296875;
    float _1523 = _1511 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    float _1527 = fma(_1509, _1435, _1513);
    float _1529 = in.m_63.z;
    float _1531 = _1527 * 0.15915493667125701904296875;
    float _1533 = _1499;
    if (_1507)
    {
        _1533 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1535 = _1533;
    float _1537 = _1511 * 6.283185482025146484375;
    float _1539 = cos(_1537);
    int _1541 = as_type<int>(_1535);
    if (_1507)
    {
        out.m_47.x = 0.0;
    }
    if (_1507)
    {
        float _1543 = _1535 * 5.0;
        _1541 = as_type<int>(_1543);
    }
    int _1545 = _1541;
    float _1547 = _1479 * 6.283185482025146484375;
    float _1549 = sin(_1547);
    if (_1507)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4811 = as_type<float>(_1545);
        out.gl_Position.z = _4811;
    }
    float _1551 = _1521 * 6.283185482025146484375;
    float _1553 = sin(_1551);
    float _1555 = _1521 * 6.283185482025146484375;
    float _1557 = cos(_1555);
    float _1559 = _1531 * 6.283185482025146484375;
    float _1561 = sin(_1559);
    if (_1507)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1563 = _1531 * 6.283185482025146484375;
    float _1565 = cos(_1563);
    float _1567 = _608 * _1517;
    float _1569 = _606 * _1515;
    float _1571 = fma(_1549, 0.5, 1.5);
    float _1573 = _610 * _1519;
    float _1575 = _1097 * _1415;
    float _1577 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1579 = _1571 * _704;
    float _1581 = _1571 * _706;
    float _1583 = _1567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1585 = _1571 * _1529;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1589 = _1525 * _1553;
    float _1591 = _1539 * _1557;
    float _1593 = _1539 * _1553;
    float _1595 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1579);
    float _1597 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1581);
    float _1599 = _1575 * _1577;
    float _1601 = _1575 * _1583;
    float _1603 = _1539 * _1565;
    float _1605 = _1525 * _1557;
    float _1607 = _1575 * _1587;
    float _1609 = fma(_1561, _1591, _1589);
    float _1611 = _1595 * _1599;
    float _1613 = _1597 * _1601;
    float _1615 = fma(_1561, _1589, _1591);
    float _1617 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1619 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1621 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1623 = _1557 * _1565;
    float _1625 = _1525 * _1565;
    float _1627 = _1553 * _1565;
    float _1629 = -_1593;
    float _1631 = fma(_1561, _1605, _1629);
    float _1633 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1585);
    float _1635 = -_1605;
    float _1637 = fma(_1561, _1593, _1635);
    float _1639 = _1603 * _1613;
    float _1641 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1643 = -_1561;
    float _1645 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1617);
    float _1647 = -_1561;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1619);
    float _1651 = -_1561;
    float _1653 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1621);
    float _1655 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1657 = -_1613;
    float _1659 = _1561 * _1657;
    float _1661 = _1625 * _1613;
    float _1663 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1665 = _1633 * _1607;
    float _1667 = fma(_1609, _1611, _1639);
    float _1669 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1641);
    float _1671 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1655);
    float _1673 = fma(_1623, _1611, _1659);
    float _1675 = fma(_1631, _1611, _1661);
    float _1677 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1663);
    float _1679 = fma(_1637, _1665, _1667);
    float _1681 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1669);
    float _1683 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1671);
    float _1685 = fma(_1627, _1665, _1673);
    float _1687 = fma(_1615, _1665, _1675);
    float _1689 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1677);
    float _1691 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1693 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1695 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1697 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1699 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1701 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1691);
    float _1703 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1693);
    float _1705 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1697);
    float _1707 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1699);
    float _1709 = in.m_73.x;
    float _1711 = in.m_73.y;
    float _1713 = in.m_73.z;
    bool _1715 = _1581 != 0.0;
    bool _1717 = isnan(_1581);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(0.0);
    bool _1723 = _1719 || _1721;
    float _1725 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1705);
    float _1727 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1707);
    float _1729 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1695);
    bool _1731 = _1579 == 0.0;
    bool _1733 = !_1723;
    bool _1735 = _1731 && _1733;
    float _1737 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1739 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1741 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1645);
    float _1743 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1649);
    float _1745 = _1017 + _1737;
    float _1747 = _1029 + _1739;
    float _1749 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1653);
    bool _1751 = _1585 == 0.0;
    bool _1753 = _1751 && _1735;
    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1757 = _1745 + _1755;
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1761 = _1747 + _1759;
    float _1763 = in.m_75.x;
    float _1765 = in.m_75.y;
    float _1767 = in.m_75.z;
    float _1769 = in.m_75.w;
    float _1771 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1701);
    float _1773 = _1757 * _1757;
    float _1775 = _1761 * _1761;
    float _1777 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1703);
    float _1779 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1729);
    float _1781 = _1773 + _1775;
    float _1783 = _1737;
    float _1785 = _1597;
    float _1787 = _1727;
    float _1789 = _1773;
    float _1791 = _1775;
    float _1793 = _1745;
    float _1795 = _1747;
    float _1797 = _1683;
    if (_1753)
    {
        _1783 = _1713;
    }
    float _1799 = _1783;
    float _1801 = sqrt(_1781);
    float _1803 = _1799;
    if (!_1753)
    {
        float _1805 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1713);
        _1803 = _1805;
    }
    float _1807 = _1803;
    float _1809 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1753)
    {
        _1785 = _1709;
    }
    float _1811 = _1785;
    float _1813 = _1811;
    if (!_1753)
    {
        float _1815 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1709);
        _1813 = _1815;
    }
    float _1817 = _1813;
    if (_1753)
    {
        _1787 = _1711;
    }
    float _1819 = _1787;
    float _1821 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1809);
    float _1823 = _1819;
    if (!_1753)
    {
        float _1825 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1711);
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1821);
    float _1831 = _1741 * _1765;
    float _1833 = _1743 * _1765;
    float _1835 = _1749 * _1765;
    bool _1837 = _1801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = fma(_1681, _1763, _1831);
    float _1841 = _1767 * _1709;
    float _1843 = _1763 * _1711;
    float _1845 = _1765 * _1713;
    float _1847 = _1829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1849 = fma(_1683, _1763, _1833);
    float _1851 = fma(_1689, _1763, _1835);
    float _1853 = -_1841;
    float _1855 = fma(_1763, _1713, _1853);
    float _1857 = -_1843;
    float _1859 = fma(_1765, _1709, _1857);
    float _1861 = -_1845;
    float _1863 = fma(_1767, _1711, _1861);
    float _1865 = _985 + _1847;
    float _1867 = _1855 * _1769;
    float _1869 = _1859 * _1769;
    float _1871 = _1863 * _1769;
    float _1873 = fma(_1771, _1767, _1839);
    float _1875 = fma(_1777, _1767, _1849);
    float _1877 = fma(_1779, _1767, _1851);
    float _1879 = _1769;
    if (!_1837)
    {
        _1879 = _1865;
    }
    float _1881 = _1879;
    bool _1883 = !_1837;
    float _1885 = _1881;
    if (!_1883)
    {
        float _1887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1891 = _1801 + _1889;
        float _1893 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1895 = rsqrt(_1781);
        float _1897 = _1891 * _1887;
        float _1899 = _1897 * 0.15915493667125701904296875;
        float _1901 = _1899 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = _1899 * 6.283185482025146484375;
        float _1907 = cos(_1905);
        float _1909 = fma(_1903, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1911 = _1895 * _1909;
        float _1913 = fma(_1757, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1915 = _1907 + (-1.0);
        float _1917 = fma(_1761, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1921 = _1913 + _1919;
        float _1923 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1927 = _1917 + _1925;
        float _1929 = _1921 * _1921;
        float _1931 = fma(_1865, _1907, _1923);
        float _1933 = _1927 * _1927;
        _1885 = _1931;
        _1789 = _1929;
        _1791 = _1933;
        _1793 = _1913;
        _1795 = _1917;
    }
    float _1935 = _1885;
    float _1937 = _1789;
    float _1939 = _1791;
    float _1941 = _1793;
    float _1943 = _1795;
    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1947 = _1935 + _1945;
    float _1949 = _1741 * _1827;
    float _1951 = _1743 * _1827;
    float _1953 = _1749 * _1827;
    float _1955 = fma(_1947, _1947, _1937);
    float _1957 = _1867 * _1741;
    float _1959 = _1867 * _1743;
    float _1961 = _1867 * _1749;
    float _1963 = _1955 + _1939;
    float _1965 = fma(_1681, _1817, _1949);
    float _1967 = fma(_1683, _1817, _1951);
    float _1969 = fma(_1689, _1817, _1953);
    float _1971 = fma(_1871, _1681, _1957);
    float _1973 = fma(_1871, _1683, _1959);
    float _1975 = sqrt(_1963);
    float _1977 = fma(_1871, _1689, _1961);
    float _1979 = fma(_1771, _1807, _1965);
    float _1981 = fma(_1777, _1807, _1967);
    float _1983 = fma(_1779, _1807, _1969);
    float _1985 = fma(_1869, _1771, _1971);
    float _1987 = fma(_1869, _1777, _1973);
    float _1989 = fma(_1869, _1779, _1977);
    out.m_77.x = _1873;
    out.m_77.y = _1875;
    out.m_77.z = _1877;
    out.m_79.x = _1979;
    out.m_79.y = _1981;
    out.m_79.z = _1983;
    out.m_81.x = _1985;
    out.m_81.y = _1987;
    out.m_81.z = _1989;
    bool _1991 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1993 = isnan(_1975);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1999 = _1995 || _1997;
    float _2001 = _1987;
    if (!_1999)
    {
        _1797 = 1.0;
    }
    float _2003 = _1797;
    bool _2005 = !_1999;
    float _2007 = _2003;
    if (!_2005)
    {
        bool _2009 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2011 = isnan(_1975);
        bool _2013 = _2009 || _2011;
        bool _2015 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2017 = _2013 || _2015;
        if (!_2017)
        {
            float _2019 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2021 = _1975 + _2019;
            float _2023 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2025 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2023;
            float _2027 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2029 = _2027 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2031 = 1.0 / _2025;
            float _2033 = _2021 * _2031;
            float _2035 = fma(_2033, _2029, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2007 = _2035;
            _2037 = true;
        }
        else
        {
            bool _2039 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2041 = isnan(_1975);
            bool _2043 = _2039 || _2041;
            bool _2045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2047 = _2043 || _2045;
            if (!_2047)
            {
                float _2049 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2051 = _1975 + _2049;
                float _2053 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2055 = _2053 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2059 = _2057 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2061 = 1.0 / _2055;
                float _2063 = _2051 * _2061;
                float _2065 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2007 = _2065;
                _2037 = true;
            }
            else
            {
                _2007 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2037 = false;
    float _2067 = _2007;
    float _2069 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2071 = _1941 + _2069;
    float _2073 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2075 = _1935 + _2073;
    float _2077 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2079 = _1943 + _2077;
    bool _2081 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan(0.5);
    bool _2089 = _2085 || _2087;
    float _2091 = fma(_2071, _2067, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2093 = fma(_2075, _2067, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2095 = fma(_2079, _2067, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -_1315;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2091);
    float _2101 = -_1309;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2093);
    float _2105 = -_1331;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2095);
    float _2109 = _2103;
    float _2111 = _2099;
    float _2113 = _2107;
    if (!_2089)
    {
        float _2115 = _1471 * _1471;
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2119 = -_1017;
        float _2121 = _2119 + _2091;
        float _2123 = -_1029;
        float _2125 = _2123 + _2095;
        float _2127 = fma(_1477, _1477, _2115);
        float _2129 = fma(_1487, _1487, _2127);
        float _2131 = 1.0 / _1575;
        float _2133 = sqrt(_2129);
        float _2135 = precise::min(_2133, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2137 = _2135 * _2117;
        float _2139 = -_985;
        float _2141 = _2139 + _2093;
        float _2143 = _2137 * _2131;
        float _2145 = fma(_2121, _2143, _1463);
        float _2147 = fma(_2141, _2143, _1457);
        float _2149 = fma(_2125, _2143, _1467);
        _2109 = _2147;
        _2111 = _2145;
        _2113 = _2149;
    }
    float _2151 = _2109;
    float _2153 = _2111;
    float _2155 = _2113;
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2159 = _2151 + _2157;
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2163 = _2153 + _2161;
    float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2167 = _2155 + _2165;
    float _2169 = _2159 * _2159;
    float _2171 = fma(_2163, _2163, _2169);
    float _2173 = fma(_2167, _2167, _2171);
    float _2175 = rsqrt(_2173);
    float _2177 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2179 = _2163 * _2177;
    float _2181 = _2167 * _2177;
    float _2183 = _2179 * _2179;
    float _2185 = _2181 * _2181;
    float _2187 = _2183 + _2185;
    float _2189 = sqrt(_2187);
    bool _2191 = _2189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2195 = _2189 + _2193;
    float _2197 = _2175;
    float _2199 = _2187;
    float _2201 = _2195;
    float _2203 = _2159;
    float _2205 = _2177;
    float _2207 = _2179;
    if (_2191)
    {
        float _2209 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2197 = _2209;
    }
    float _2211 = _2197;
    if (_2191)
    {
        float _2213 = rsqrt(_2187);
        _2199 = _2213;
    }
    float _2215 = _2199;
    if (_2191)
    {
        float _2217 = _2195 * _2211;
        _2201 = _2217;
    }
    float _2219 = _2201;
    if (_2191)
    {
        float _2221 = _2219 * 0.15915493667125701904296875;
        _2001 = _2221;
    }
    float _2223 = _2001;
    float _2225 = _2211;
    float _2227 = _2223;
    if (_2191)
    {
        float _2229 = _2223 * 6.283185482025146484375;
        float _2231 = sin(_2229);
        _2225 = _2231;
    }
    float _2233 = _2225;
    float _2235 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2237 = precise::max(0.0, _2235);
    float _2239 = _2167;
    float _2241 = _2237;
    if (_2191)
    {
        float _2243 = _2223 * 6.283185482025146484375;
        float _2245 = cos(_2243);
        _2239 = _2245;
    }
    float _2247 = _2239;
    float _2249 = -_2177;
    float _2251 = -_2237;
    float _2253 = fma(_2159, _2249, _2251);
    float _2255 = _2253;
    if (!_2191)
    {
        _2203 = _2183;
    }
    float _2257 = _2203;
    float _2259 = _2257;
    if (_2191)
    {
        float _2261 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2241 = _2261;
    }
    float _2263 = _2241;
    float _2265 = _2233;
    float _2267 = _2263;
    if (_2191)
    {
        float _2269 = fma(_2233, _2263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2265 = _2269;
    }
    float _2271 = _2265;
    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2275 = _2271;
    if (_2191)
    {
        float _2277 = _2247 + (-1.0);
        _2267 = _2277;
    }
    float _2279 = _2267;
    float _2281 = _2279;
    if (_2191)
    {
        float _2283 = _2215 * _2271;
        _2205 = _2283;
    }
    float _2285 = _2205;
    if (!_2191)
    {
        _2275 = _2181;
    }
    float _2287 = _2275;
    float _2289 = sqrt(_2173);
    float _2291 = _2287;
    if (_2191)
    {
        float _2293 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2293;
    }
    float _2295 = _2227;
    if (_2191)
    {
        float _2297 = _2179 * _2285;
        _2207 = _2297;
    }
    float _2299 = _2207;
    if (_2191)
    {
        float _2301 = _2181 * _2285;
        _2291 = _2301;
    }
    float _2303 = _2291;
    if (!_2191)
    {
        _2281 = _2185;
    }
    float _2305 = _2281;
    float _2307 = _2305;
    if (_2191)
    {
        float _2309 = fma(_2253, _2247, _2295);
        _2255 = _2309;
    }
    float _2311 = _2255;
    if (_2191)
    {
        float _2313 = _2299 * _2299;
        _2259 = _2313;
    }
    float _2315 = _2259;
    if (_2191)
    {
        float _2317 = _2303 * _2303;
        _2307 = _2317;
    }
    float _2319 = _2307;
    float _2321 = fma(_2311, _2311, _2315);
    float _2323 = _2321 + _2319;
    float _2325 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2329 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2327);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = rsqrt(_2323);
    float _2335 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2325);
    float _2337 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2339 = -_2331;
    float _2341 = _2339 + 1.0;
    float _2343 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2335);
    float _2345 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2347 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2337);
    float _2349 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2351 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2353 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2345);
    float _2355 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2347);
    float _2357 = abs(_2341);
    float _2359 = log2(_2357);
    float _2361 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2349);
    float _2363 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2353);
    float _2365 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2367 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2369 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2361);
    float _2371 = _2333 * _2299;
    float _2373 = _2363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2375 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2377 = -_2367;
    float _2379 = fma(_2377, _2273, 1.0);
    float _2381 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2383 = _2333 * _2311;
    float _2385 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2387 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2375);
    float _2389 = _2333 * _2303;
    float _2391 = log2(_2379);
    float _2393 = -_2385;
    float _2395 = fma(_2383, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2393);
    float _2397 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2387);
    float _2399 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2401 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2403 = -_2389;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2395);
    float _2407 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2397);
    float _2409 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2411 = exp2(_2399);
    float _2413 = fma(_2405, -0.5, 0.5);
    float _2415 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2401);
    float _2417 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2409);
    float _2419 = _2383 + 1.0;
    float _2421 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2415);
    float _2423 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2417);
    float _2425 = 1.0 / _2407;
    float _2427 = fma(_2405, 0.5, 0.5);
    float _2429 = _2391 * 0.693147182464599609375;
    float _2431 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2423);
    float _2433 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2421);
    float _2435 = fma(_2427, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2437 = sqrt(_2413);
    float _2439 = -_2383;
    float _2441 = fma(_2411, _2419, _2439);
    float _2443 = fma(_2427, _2435, -0.212114393711090087890625);
    float _2445 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2447 = fma(_2427, _2443, 1.570728778839111328125);
    float _2449 = _2431 * _2425;
    float _2451 = _2433 * _2425;
    float _2453 = fma(_2449, 0.5, 0.5);
    float _2455 = fma(_2451, -0.5, 0.5);
    float _2457 = fma(_2441, 0.5, 0.5);
    float _2459 = _2437 * 0.636619746685028076171875;
    float3 _6338 = float3(_2453, _2455, _2445);
    float _2461 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6338, float3(0.0), isnan(_6338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6338, float3(0.0), isnan(_6338)), level(0.0)).x;
    float3 _6349 = float3(_2453, _2455, _2445);
    float4 _2464 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).xyzw;
    float _2466 = _2464.x;
    float _2468 = _2464.y;
    float _2470 = _2464.z;
    float _2472 = _2464.w;
    float _2474 = -_2447;
    float _2476 = fma(_2459, _2474, 1.0);
    float2 _6371 = float2(_2476, _2457);
    float3 _2480 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6371, float2(0.0), isnan(_6371)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6371, float2(0.0), isnan(_6371)), level(0.0)).xyz;
    float _2482 = _2480.x;
    float _2484 = _2480.y;
    float _2486 = _2480.z;
    float _2488 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2490 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2492 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2494 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2490);
    float _2496 = exp2(_2488);
    float _2498 = _2492 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2500 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2494);
    float _2502 = _2431 + _2407;
    float _2504 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2500);
    float _2506 = _2502 * 0.5;
    float _2508 = _2407 * 0.5;
    out.m_47.x = _2498;
    float _2510 = _2504 + _2407;
    out.gl_Position.x = _2431;
    out.gl_Position.y = _2433;
    out.gl_Position.z = _2504;
    out.gl_Position.w = _2407;
    float _2512 = _2510 * 0.5;
    float _2514 = -_2496;
    float _2516 = _2514 + 1.0;
    float _2518 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2520 = fma(_2433, -0.5, _2508);
    out.m_83.x = _2506;
    out.m_83.y = _2520;
    out.m_83.z = _2512;
    out.m_83.w = _2407;
    float _2522 = _2518 * _2461;
    float _2524 = -_2518;
    float _2526 = _2524 + 1.0;
    float _2528 = _2472 * _2522;
    float _2530 = _2486 * _2522;
    float _2532 = fma(_2482, _2528, _2466);
    float _2534 = fma(_2484, _2528, _2468);
    float _2536 = _2472 * _2526;
    float _2538 = fma(_2472, _2530, _2470);
    out.m_85.x = _2532;
    out.m_85.y = _2534;
    out.m_85.z = _2538;
    out.m_85.w = _2536;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

