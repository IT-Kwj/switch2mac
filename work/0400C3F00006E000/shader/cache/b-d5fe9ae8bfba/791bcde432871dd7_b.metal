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
    float4 m_61 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2042 = false;
    bool _860 = false;
    bool _622 = false;
    bool _402 = false;
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
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2807 = as_type<float>(_114);
        out.gl_Position.z = _2807;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = _130;
    if (_126)
    {
        float _136 = float(_98);
        _132 = _136;
    }
    float _138 = _132;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    if (_144)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _108;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    int _148 = 0;
    if (_144)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2876 = as_type<float>(_152);
        out.gl_Position.z = _2876;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _158 * _156;
    float _178 = 1.4012984643248170709237295832899e-45;
    float _180 = _160;
    if (!_170)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _190 = _186;
    if (!_170)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = _188 * 6.283185482025146484375;
    float _198 = floor(_188);
    float _200 = _196 * 0.15915493667125701904296875;
    float _202 = _200 * 6.283185482025146484375;
    float _204 = cos(_202);
    float _206 = -_198;
    float _208 = _188 + _206;
    bool _210 = _208 < 0.5;
    float _212 = float(_210);
    float _214 = fma(_204, 0.5, 0.5);
    bool _216 = !_170;
    float _218 = _194;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _160 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _160);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_170;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _160 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _180 = _272;
    }
    float _274 = _180;
    float _276 = -_208;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _280 = -_212;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _284 = -_214;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = in.m_49.x;
    float _290 = in.m_49.y;
    float _292 = in.m_49.z;
    float _294 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _296 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _298 = in.m_53.w;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _306 = _304 != 0;
    float _308 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _310 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _312 = in.m_44.x;
    float _314 = in.m_44.y;
    float _316 = in.m_44.z;
    float _318 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _320 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    bool _322 = !_174;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].y, _310);
    bool _328 = !_302;
    int _330 = _328 ? 0 : 1;
    float _332 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    bool _336 = !_306;
    int _338 = _336 ? 0 : 1;
    int _340 = abs(_324);
    float _342 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].y, _326);
    int _344 = abs(_330);
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].x, _320);
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _350 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].z, _334);
    int _352 = abs(_338);
    float _354 = fma(_274, _288, _346);
    float _356 = fma(_274, _290, _342);
    float _358 = float(_344);
    float _360 = fma(_274, _292, _350);
    float _362 = float(_340);
    float _364 = abs(_278);
    float _366 = _358 * _364;
    float _368 = fma(_354, _298, _312);
    float _370 = fma(_356, _298, _314);
    float _372 = float(_352);
    float _374 = fma(_362, _286, _366);
    float _376 = fma(_360, _298, _316);
    float _378 = abs(_282);
    float _380 = fma(_372, _378, _374);
    bool _382 = !_348;
    bool _384 = _302;
    float _400;
    if (!_382)
    {
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _388 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_98);
        float _406 = 1.0 / _404;
        float _408 = _130 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = _410 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = _410 + _416;
    bool _420 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _422 = isnan(_410);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _410 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _448 = 1.0 / _434;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _452 = 1.0 / _442;
    float _454 = 1.0 / _446;
    float _456 = _414 * _448;
    bool _458 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _460 = isnan(_410);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -_430;
    float _472 = _470 + 1.0;
    float _474 = _468 * _472;
    float _476 = _418 * _452;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _482;
    bool _486 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_410);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -_468;
    float _500 = _498 + 1.0;
    float _502 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _504 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _510 = _438 * _454;
    bool _512 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_410);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = fma(_508, _510, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _534 = fma(_526, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _536 = -_522;
    float _538 = _536 + 1.0;
    float _540 = _522 * _500;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = fma(_530, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _548 = _496 * _538;
    float _550 = -_496;
    float _552 = _550 + 1.0;
    float _554 = fma(_544, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _556 = _502 * _548;
    float _558 = _504 * _548;
    float _560 = _534 * _548;
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].x, _556);
    float _564 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].y, _558);
    float _566 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].z, _560);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _568;
    float _572 = fma(_546, _540, _562);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _578;
    float _582 = fma(_570, _456, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _584 = fma(_554, _540, _564);
    float _586 = fma(_576, _456, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _588 = fma(_580, _456, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _590 = fma(_532, _540, _566);
    float _592 = fma(_582, _474, _572);
    float _594 = fma(_586, _474, _584);
    float _596 = fma(_588, _474, _590);
    float _598 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[146].x, _592);
    float _600 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[146].y, _594);
    float _602 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[146].z, _596);
    bool _604 = !_450;
    float _620;
    if (!_604)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _608 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _612 = _610 * _606;
        float _614 = floor(_612);
        float _616 = -_614;
        float _618 = _612 + _616;
        _620 = _618;
        _622 = true;
    }
    else
    {
        float _624 = float(_98);
        float _626 = 1.0 / _624;
        float _628 = _130 * _626;
        _620 = _628;
    }
    _622 = false;
    float _630 = _620;
    float _632 = in.m_53.x;
    float _634 = in.m_53.y;
    float _636 = in.m_53.z;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _640 = _630 + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _644 = _630 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _648 = _630 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _662 = 1.0 / _652;
    bool _664 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _666 = 1.0 / _656;
    float _668 = _600 * _634;
    float _670 = _602 * _636;
    bool _672 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _674 = isnan(_630);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = _598 * _632;
    float _686 = 1.0 / _660;
    float _688 = _640 * _662;
    bool _690 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _692 = isnan(_630);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -_682;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _706;
    float _710 = _644 * _666;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _712;
    float _716 = _700 * _704;
    bool _718 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _720 = isnan(_630);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = fma(_708, _710, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _732 = fma(_714, _710, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _734 = -_700;
    float _736 = _734 + 1.0;
    float _738 = _648 * _686;
    bool _740 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _742 = isnan(_630);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _760 = fma(_754, _710, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _762 = -_750;
    float _764 = _762 + 1.0;
    float _766 = _750 * _736;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _776 = _728 * _764;
    float _778 = -_728;
    float _780 = _778 + 1.0;
    float _782 = fma(_758, _738, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _784 = fma(_770, _738, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _786 = _730 * _776;
    float _788 = _732 * _776;
    float _790 = _760 * _776;
    float _792 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[107].x, _786);
    float _794 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[107].y, _788);
    float _796 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[107].z, _790);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _802;
    float _806 = fma(_774, _738, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _808;
    float _812 = fma(_782, _766, _792);
    float _814 = fma(_800, _688, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _816 = fma(_804, _688, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _818 = fma(_784, _766, _794);
    float _820 = fma(_810, _688, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _822 = fma(_806, _766, _796);
    float _824 = fma(_814, _716, _812);
    float _826 = fma(_816, _716, _818);
    float _828 = fma(_820, _716, _822);
    float _830 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[110].x, _824);
    float _832 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[110].y, _826);
    float _834 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[110].z, _828);
    bool _836 = !_664;
    int _838 = as_type<int>(_782);
    float _840 = _818;
    int _842 = as_type<int>(_814);
    float _858;
    if (!_836)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _846 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _850 = _848 * _844;
        float _852 = floor(_850);
        float _854 = -_852;
        float _856 = _850 + _854;
        _838 = as_type<int>(_852);
        _858 = _856;
        _860 = true;
    }
    else
    {
        float _862 = float(_98);
        float _864 = 1.0 / _862;
        float _866 = _130 * _864;
        _858 = _866;
    }
    _860 = false;
    int _868 = _838;
    float _870 = _858;
    float _872 = in.m_55.x;
    float _874 = _370 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _878 = log2(_876);
    float _880 = in.m_51.z;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _884 = _882 != 0;
    float _886 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _890 = _888 != 0;
    float _892 = in.m_55.y;
    float _894 = _830 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _898 = in.m_51.w;
    float _900 = _832 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _902 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _904 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = in.m_51.y;
    float _908 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _910 = _868;
    if (_884)
    {
        bool _912 = _154 > 0.5;
        _384 = _912;
    }
    bool _914 = _384;
    float _916 = _878 * _130;
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _920 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _872;
    if (_884)
    {
        float _924 = -_872;
        float _926 = _924 + 1.0;
        _910 = as_type<int>(_926);
    }
    int _928 = _910;
    if (!_884)
    {
        _840 = _872;
    }
    float _930 = _840;
    float _932 = _930;
    if (_890)
    {
        float _934 = -_872;
        float _936 = _934 + 1.0;
        _842 = as_type<int>(_936);
    }
    int _938 = _842;
    float _940 = exp2(_916);
    if (_884)
    {
        float _942 = _914 ? as_type<float>(_928) : _872;
        _932 = _942;
    }
    float _944 = _932;
    float _946 = _154 * 2.0;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _950 = _948 != 0;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _958 = _956 != 0;
    float _960 = _880 * 2.0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _964 = _962 != 0;
    float _966 = _944 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _970 = _968 != 0;
    float _972 = _370 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _974 = _370 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _976 = floor(_946);
    bool _978 = _914;
    if (_890)
    {
        bool _980 = _880 > 0.5;
        _978 = _980;
    }
    bool _982 = _978;
    float _984 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _972);
    float _986 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _974);
    float _988 = -_892;
    float _990 = _988 + 1.0;
    float _992 = _892;
    if (_890)
    {
        float _994 = _982 ? as_type<float>(_938) : _872;
        _922 = _994;
    }
    float _996 = _922;
    float _998 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _986);
    bool _1000 = _898 > 0.5;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1006 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _886);
    bool _1008 = _906 > 0.5;
    float _1010 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _984);
    int _1012 = _1000 ? as_type<int>(_990) : as_type<int>(_892);
    float _1014 = 1.0 / _1004;
    float _1016 = _906 * 2.0;
    float _1018 = _964 ? as_type<float>(_1012) : _892;
    float _1020 = _154 + _880;
    bool _1022 = _976 > 0.0;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1026 = _976 >= 0.0;
    bool _1028 = isnan(_976);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    float _1036 = floor(_1016);
    if (_970)
    {
        float _1038 = _1008 ? _990 : _892;
        _992 = _1038;
    }
    float _1040 = _992;
    float _1042 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = -_940;
    float _1046 = _1044 + 1.0;
    float _1048 = _1006 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1054 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1056 = isnan(1.0);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1062 = _1058 || _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1066 = 1.0 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1068;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1074 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1020 + (-1.0);
    float _1080 = 1.0 / _1066;
    float _1082 = _1070 * _1014;
    bool _1084 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1086 = isnan(_870);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    out.m_57.x = _1074;
    out.m_57.y = _1076;
    out.m_57.z = _1042;
    out.m_57.w = _1072;
    bool _1096 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1104 = _1100 || _1102;
    float _1106 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1110 = _870 + _1108;
    float _1112 = _1010 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1114 = _906 + _880;
    float _1116 = _1104 ? _1046 : 0.0;
    float _1118 = fma(_1082, _1110, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1120 = _1036 > 0.0;
    float _1122 = _1114 + (-1.0);
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1126 = _1048 + _1124;
    float _1128 = _998 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1130 = _1112;
    if (_1062)
    {
        float _1132 = _1116 * _1080;
        _134 = _1132;
    }
    float _1134 = _134;
    bool _1136 = _1036 >= 0.0;
    bool _1138 = isnan(_1036);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = -_1094;
    float _1148 = _1146 + 1.0;
    float _1150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1152 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1154 = isnan(_870);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1160 = _1156 || _1158;
    float _1162 = float(_1160);
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1166 = _1112 + _1164;
    int _1168 = _1144 ? 0 : 1;
    float _1170 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1172 = _1034 ? 0 : 1;
    float _1174 = _1162 * _1148;
    float _1176 = -_1162;
    float _1178 = _1176 + 1.0;
    float _1180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1182 = ~_1168;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = _1118 * _1174;
    int _1190 = ~_1172;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1198 = _1194;
    int _1200 = _1186;
    if (!_1022)
    {
        int _1202 = ~_1172;
        int _1204 = _1202 + 1;
        _1198 = _1204;
    }
    int _1206 = _1198;
    float _1208 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1188);
    bool _1210 = !_954;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1216 = float(_1206);
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1128 + _1218;
    int _1222 = abs(_1212);
    float _1224 = _1196 * _1150;
    if (!_1120)
    {
        int _1226 = ~_1168;
        int _1228 = _1226 + 1;
        _1200 = _1228;
    }
    int _1230 = _1200;
    float _1232 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1214);
    float _1234 = float(_1222);
    float _1236 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1208);
    float _1238 = floor(_960);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1232);
    float _1242 = in.m_59.x;
    float _1244 = in.m_59.y;
    float _1246 = in.m_59.z;
    float _1248 = _1234 * _1216;
    float _1250 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1252 = _966 * _1180;
    float _1254 = _996 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1256 = _1240 >= 0.0;
    float _1258 = _1250 * _896;
    float _1260 = _1126 * _1126;
    float _1262 = float(_1230);
    float _1264 = _1254 * _918;
    bool _1266 = !_958;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = fma(_1166, _1166, _1260);
    float _1272 = _1248 * (-2.0);
    float _1274 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1276 = _1238 > 0.0;
    float _1278 = fma(_1220, _1220, _1270);
    int _1280 = abs(_1268);
    float _1282 = fma(_1170, _1272, _1170);
    bool _1284 = _1238 >= 0.0;
    bool _1286 = isnan(_1238);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    float _1294 = _880 + (-0.5);
    float _1296 = float(_1280);
    float _1298 = rsqrt(_1278);
    int _1300 = _1292 ? 0 : 1;
    out.m_61.x = _904;
    out.m_61.y = _908;
    out.m_61.z = _920;
    out.m_61.w = _1274;
    float _1302 = fma(_1272, _1244, _1244);
    float _1304 = _1272;
    if (_1256)
    {
        _1304 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1306 = _1304;
    float _1308 = _906 + (-0.5);
    float _1310 = _1296 * _1262;
    bool _1312 = !_950;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = ~_1300;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1302);
    int _1324 = _1320;
    int _1326 = as_type<int>(_1306);
    if (!_1276)
    {
        int _1328 = ~_1300;
        int _1330 = _1328 + 1;
        _1324 = _1330;
    }
    int _1332 = _1324;
    float _1334 = _1310 * (-2.0);
    int _1336 = abs(_1314);
    if (_1256)
    {
        float _1338 = _1306 * 5.0;
        _1326 = as_type<int>(_1338);
    }
    int _1340 = _1326;
    float _1342 = fma(_1282, _1134, _1322);
    float _1344 = fma(_1334, _1246, _1246);
    float _1346 = _1126 * _1298;
    out.m_63.x = _1252;
    out.m_63.y = _1258;
    out.m_63.z = _1264;
    out.m_63.w = _1224;
    float _1348 = _1166 * _1298;
    float _1350 = float(_1336);
    float _1352 = _1220 * _1298;
    if (_1256)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4787 = as_type<float>(_1340);
        out.gl_Position.z = _4787;
    }
    float _1354 = -_1346;
    float _1356 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    if (_1256)
    {
        out.m_47.x = 0.0;
    }
    float _1358 = fma(_1106, _1334, _1106);
    float _1360 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1344);
    if (_1256)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1362 = -_1346;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1366 = -_1348;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1112);
    float _1370 = float(_1332);
    float _1372 = -_1352;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1128);
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1378 = _1364 + _1376;
    float _1380 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1382 = _1368 + _1380;
    float _1384 = _154 + _906;
    float _1386 = _1350 * _1370;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1392 = _1374 + _1390;
    float _1394 = fma(_1358, _1134, _1360);
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1388);
    float _1398 = _1384 + (-1.0);
    float _1400 = _1386 * (-2.0);
    float _1402 = _154 + (-0.5);
    float _1404 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1396);
    float _1406 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1408 = fma(_1400, _1242, _1242);
    float _1410 = -_1348;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1166);
    float _1414 = _1356 * _1356;
    bool _1416 = _1404 >= 0.0;
    float _1418 = fma(_1406, _1400, _1406);
    float _1420 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1408);
    float _1422 = fma(_1412, _1412, _1414);
    float _1424 = -_1352;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1428 = _1342 * 0.15915493667125701904296875;
    float _1430 = fma(_1418, _1134, _1420);
    float _1432 = _1394 * 0.15915493667125701904296875;
    float _1434 = fma(_1426, _1426, _1422);
    float _1436 = _1428 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    float _1440 = _1430 * 0.15915493667125701904296875;
    float _1442 = _1370;
    float _1444 = _1368;
    if (_1416)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1446 = _1442;
    int _1448 = as_type<int>(_1446);
    if (_1416)
    {
        out.m_47.x = 0.0;
    }
    float _1450 = sqrt(_1434);
    if (_1416)
    {
        float _1452 = _1446 * 5.0;
        _1448 = as_type<int>(_1452);
    }
    int _1454 = _1448;
    if (_1416)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4974 = as_type<float>(_1454);
        out.gl_Position.z = _4974;
    }
    float _1456 = _1428 * 6.283185482025146484375;
    float _1458 = cos(_1456);
    float _1460 = _1432 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    float _1464 = _1432 * 6.283185482025146484375;
    float _1466 = cos(_1464);
    float _1468 = _1440 * 6.283185482025146484375;
    float _1470 = sin(_1468);
    if (_1416)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1472 = -_1048;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1476 = -_1112;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1480 = in.m_65.x;
    float _1482 = in.m_65.y;
    float _1484 = in.m_65.z;
    float _1486 = _1298 * _1450;
    float _1488 = _1474 * _1474;
    float _1490 = -_1128;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1440 * 6.283185482025146484375;
    float _1496 = cos(_1494);
    float _1498 = _1458 * _1466;
    float _1500 = fma(_1478, _1478, _1488);
    float _1502 = _1438 * _1462;
    float _1504 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1506 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1508 = fma(_1492, _1492, _1500);
    float _1510 = _1458 * _1462;
    float _1512 = _1438 * _1466;
    float _1514 = fma(_1470, _1502, _1498);
    float _1516 = rsqrt(_1508);
    float _1518 = fma(_1470, _1498, _1502);
    float _1520 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1522 = _1486 * _1504;
    float _1524 = -_1512;
    float _1526 = fma(_1470, _1510, _1524);
    float _1528 = -_1510;
    float _1530 = fma(_1470, _1512, _1528);
    float _1532 = _1462 * _1496;
    float _1534 = _1466 * _1496;
    float _1536 = _1438 * _1496;
    float _1538 = _1458 * _1496;
    float _1540 = _1486 * _1506;
    float _1542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1482);
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1480);
    bool _1546 = _1482 != 0.0;
    bool _1548 = isnan(_1482);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = _1486 * _1520;
    float _1558 = _1542 * _1540;
    float _1560 = _1478 * _1516;
    float _1562 = _1544 * _1522;
    float _1564 = _1492 * _1516;
    float _1566 = in.m_67.x;
    float _1568 = in.m_67.y;
    float _1570 = in.m_67.z;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1574 = _1560 * _1572;
    float _1576 = _1474 * _1516;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1580 = _1564 * _1578;
    bool _1582 = _1480 == 0.0;
    bool _1584 = !_1554;
    bool _1586 = _1582 && _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1590 = -_1574;
    float _1592 = fma(_1564, _1588, _1590);
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1596 = _1576 * _1594;
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1600 = -_1580;
    float _1602 = fma(_1576, _1598, _1600);
    bool _1604 = _1484 == 0.0;
    bool _1606 = _1604 && _1586;
    float _1608 = _1592 * _1592;
    float _1610 = in.m_69.x;
    float _1612 = in.m_69.y;
    float _1614 = in.m_69.z;
    float _1616 = in.m_69.w;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1620 = -_1596;
    float _1622 = fma(_1560, _1618, _1620);
    float _1624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1484);
    float _1626 = fma(_1602, _1602, _1608);
    float _1628 = _1534 * _1558;
    float _1630 = _1518 * _1558;
    float _1632 = _1624 * _1556;
    float _1634 = fma(_1622, _1622, _1626);
    float _1636 = _1530 * _1558;
    float _1638 = fma(_1532, _1562, _1628);
    float _1640 = fma(_1526, _1562, _1630);
    float _1642 = fma(_1514, _1562, _1636);
    float _1644 = rsqrt(_1634);
    float _1646 = _1628;
    float _1648 = _1562;
    float _1650 = _1566;
    float _1652 = _1568;
    if (_1606)
    {
        _1646 = _1566;
    }
    float _1654 = _1646;
    float _1656 = -_1470;
    float _1658 = fma(_1656, _1632, _1638);
    float _1660 = 0.0;
    float _1662 = _1654;
    if (_1606)
    {
        _1660 = _1568;
    }
    float _1664 = _1660;
    float _1666 = fma(_1536, _1632, _1642);
    float _1668 = _1664;
    if (_1606)
    {
        _1648 = _1654;
    }
    float _1670 = _1648;
    float _1672 = fma(_1538, _1632, _1640);
    float _1674 = _1670;
    if (!_1606)
    {
        _1662 = _1566;
    }
    float _1676 = _1662;
    if (_1606)
    {
        _1650 = _1664;
    }
    float _1678 = _1650;
    float _1680 = 0.0;
    float _1682 = _1678;
    if (_1606)
    {
        _1680 = _1570;
    }
    float _1684 = _1680;
    float _1686 = _1684;
    if (!_1606)
    {
        float _1688 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1676);
        _1674 = _1688;
    }
    float _1690 = _1674;
    if (!_1606)
    {
        _1668 = _1568;
    }
    float _1692 = _1668;
    if (_1606)
    {
        _1652 = _1684;
    }
    float _1694 = _1652;
    float _1696 = _1602 * _1644;
    float _1698 = _1694;
    if (!_1606)
    {
        _1686 = _1570;
    }
    float _1700 = _1686;
    if (!_1606)
    {
        float _1702 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1692);
        _1682 = _1702;
    }
    float _1704 = _1682;
    float _1706 = _1614 * _1676;
    float _1708 = _1592 * _1644;
    float _1710 = _1622 * _1644;
    float _1712 = _1576 * _1696;
    float _1714 = -_1706;
    float _1716 = fma(_1610, _1700, _1714);
    float _1718 = _1612 * _1700;
    float _1720 = _1564 * _1708;
    if (!_1606)
    {
        float _1722 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1700);
        _1698 = _1722;
    }
    float _1724 = _1698;
    float _1726 = _1610 * _1692;
    float _1728 = -_1718;
    float _1730 = fma(_1614, _1692, _1728);
    float _1732 = -_1720;
    float _1734 = fma(_1576, _1710, _1732);
    float _1736 = -_1712;
    float _1738 = fma(_1560, _1708, _1736);
    float _1740 = -_1726;
    float _1742 = fma(_1612, _1676, _1740);
    float _1744 = _1730 * _1616;
    float _1746 = _1734 * _1658;
    float _1748 = _1738 * _1658;
    float _1750 = _1716 * _1616;
    float _1752 = _1742 * _1616;
    float _1754 = fma(_1696, _1666, _1746);
    float _1756 = fma(_1710, _1666, _1748);
    float _1758 = _1560 * _1710;
    float _1760 = _1532 * _1734;
    float _1762 = fma(_1560, _1672, _1754);
    float _1764 = fma(_1564, _1672, _1756);
    float _1766 = -_1758;
    float _1768 = fma(_1564, _1696, _1766);
    float _1770 = _1534 * _1734;
    float _1772 = _1112 + _1762;
    float _1774 = _1128 + _1764;
    float _1776 = _1532 * _1768;
    float _1778 = _1532 * _1738;
    float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1782 = _1772 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1786 = _1774 + _1784;
    float _1788 = -_1734;
    float _1790 = _1470 * _1788;
    float _1792 = -_1738;
    float _1794 = _1470 * _1792;
    float _1796 = _1782 * _1782;
    float _1798 = _1786 * _1786;
    float _1800 = -_1768;
    float _1802 = _1470 * _1800;
    float _1804 = _1534 * _1768;
    float _1806 = _1534 * _1738;
    float _1808 = _1796 + _1798;
    float _1810 = fma(_1514, _1696, _1760);
    float _1812 = fma(_1514, _1708, _1776);
    float _1814 = fma(_1514, _1710, _1778);
    float _1816 = _1768 * _1658;
    float _1818 = sqrt(_1808);
    float _1820 = fma(_1530, _1696, _1770);
    float _1822 = fma(_1530, _1708, _1804);
    float _1824 = fma(_1530, _1710, _1806);
    float _1826 = fma(_1536, _1696, _1790);
    float _1828 = fma(_1708, _1666, _1816);
    float _1830 = fma(_1536, _1710, _1794);
    float _1832 = fma(_1536, _1708, _1802);
    float _1834 = fma(_1518, _1560, _1820);
    float _1836 = fma(_1518, _1576, _1822);
    float _1838 = fma(_1518, _1564, _1824);
    float _1840 = fma(_1576, _1672, _1828);
    float _1842 = fma(_1526, _1560, _1810);
    float _1844 = fma(_1538, _1560, _1826);
    float _1846 = fma(_1538, _1564, _1830);
    float _1848 = fma(_1526, _1576, _1812);
    bool _1850 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1852 = fma(_1538, _1576, _1832);
    float _1854 = _1834 * _1612;
    float _1856 = _1836 * _1612;
    float _1858 = _1838 * _1612;
    float _1860 = fma(_1526, _1564, _1814);
    float _1862 = _1834 * _1704;
    float _1864 = _1836 * _1704;
    float _1866 = _1750 * _1836;
    float _1868 = _1750 * _1834;
    float _1870 = _1838 * _1704;
    float _1872 = _1750 * _1838;
    float _1874 = _1048 + _1840;
    bool _1876 = !_1850;
    float _1878 = _1874;
    float _1880 = _1796;
    float _1882 = _1798;
    float _1884 = _1772;
    float _1886 = _1782;
    float _1888 = _1774;
    if (!_1876)
    {
        float _1890 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1894 = _1818 + _1892;
        float _1896 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1898 = rsqrt(_1808);
        float _1900 = _1894 * _1890;
        float _1902 = _1900 * 0.15915493667125701904296875;
        float _1904 = _1902 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        float _1908 = _1902 * 6.283185482025146484375;
        float _1910 = cos(_1908);
        float _1912 = fma(_1906, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1914 = _1898 * _1912;
        float _1916 = fma(_1782, _1914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1918 = _1910 + (-1.0);
        float _1920 = fma(_1786, _1914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1924 = _1916 + _1922;
        float _1926 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1930 = _1920 + _1928;
        float _1932 = _1924 * _1924;
        float _1934 = fma(_1874, _1910, _1926);
        float _1936 = _1930 * _1930;
        _1878 = _1934;
        _1880 = _1932;
        _1882 = _1936;
        _1884 = _1916;
        _1886 = _1926;
        _1888 = _1920;
    }
    float _1938 = _1878;
    float _1940 = _1880;
    float _1942 = _1882;
    float _1944 = _1884;
    float _1946 = _1886;
    float _1948 = _1888;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1952 = _1938 + _1950;
    float _1954 = fma(_1842, _1690, _1862);
    float _1956 = fma(_1848, _1690, _1864);
    float _1958 = fma(_1860, _1690, _1870);
    float _1960 = fma(_1952, _1952, _1940);
    float _1962 = fma(_1842, _1610, _1854);
    float _1964 = fma(_1848, _1610, _1856);
    float _1966 = fma(_1744, _1842, _1868);
    float _1968 = _1960 + _1942;
    float _1970 = fma(_1744, _1848, _1866);
    float _1972 = fma(_1860, _1610, _1858);
    float _1974 = fma(_1744, _1860, _1872);
    float _1976 = fma(_1844, _1724, _1954);
    float _1978 = fma(_1852, _1724, _1956);
    float _1980 = sqrt(_1968);
    float _1982 = fma(_1846, _1724, _1958);
    float _1984 = fma(_1844, _1614, _1962);
    float _1986 = fma(_1852, _1614, _1964);
    float _1988 = fma(_1752, _1844, _1966);
    float _1990 = fma(_1752, _1852, _1970);
    float _1992 = fma(_1846, _1614, _1972);
    float _1994 = fma(_1752, _1846, _1974);
    out.m_71.x = _1976;
    out.m_71.y = _1978;
    out.m_71.z = _1982;
    out.m_73.x = _1984;
    out.m_73.y = _1986;
    out.m_73.z = _1992;
    out.m_75.x = _1988;
    out.m_75.y = _1990;
    out.m_75.z = _1994;
    bool _1996 = _1980 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1998 = isnan(_1980);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2004 = _2000 || _2002;
    float _2006 = _1946;
    if (!_2004)
    {
        _2006 = 1.0;
    }
    float _2008 = _2006;
    bool _2010 = !_2004;
    float _2012 = _2008;
    if (!_2010)
    {
        bool _2014 = _1980 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2016 = isnan(_1980);
        bool _2018 = _2014 || _2016;
        bool _2020 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2022 = _2018 || _2020;
        if (!_2022)
        {
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = _1980 + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2030 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2028;
            float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2034 = _2032 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2036 = 1.0 / _2030;
            float _2038 = _2026 * _2036;
            float _2040 = fma(_2038, _2034, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2012 = _2040;
            _2042 = true;
        }
        else
        {
            bool _2044 = _1980 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2046 = isnan(_1980);
            bool _2048 = _2044 || _2046;
            bool _2050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2052 = _2048 || _2050;
            if (!_2052)
            {
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _1980 + _2054;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2062 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2064 = _2062 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2066 = 1.0 / _2060;
                float _2068 = _2056 * _2066;
                float _2070 = fma(_2068, _2064, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2012 = _2070;
                _2042 = true;
            }
            else
            {
                _2012 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2042 = false;
    float _2072 = _2012;
    float _2074 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2076 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2078 = _1944 + _2076;
    float _2080 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2074);
    float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2084 = _1938 + _2082;
    bool _2086 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan(0.5);
    bool _2094 = _2090 || _2092;
    float _2096 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2080);
    float _2098 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2100 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2102 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan(0.5);
    bool _2108 = _2104 || _2106;
    float _2110 = fma(_2084, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2112 = _2096 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2114 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2098);
    float _2116 = 1.0 / _2112;
    float _2118 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2114);
    float _2120 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2122 = _2120 + _2112;
    float _2124 = _2122 * _2116;
    float _2126 = _2124 * 0.5;
    float _2128 = -_1346;
    float _2130 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2110);
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2134 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2132);
    float _2136 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2138 = _1948 + _2136;
    float _2140 = fma(_2078, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2142 = 1.0 / _2134;
    float _2144 = fma(_2138, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2146 = -_1348;
    float _2148 = fma(_2146, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2140);
    float _2150 = _2138;
    float _2152 = _2130;
    float _2154 = _2148;
    float _2156 = _2134;
    if (_2108)
    {
        _2150 = 1.0;
    }
    float _2158 = _2150;
    float _2160 = -_1352;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2144);
    float _2164 = _2162;
    float _2166 = _2158;
    if (!_2094)
    {
        float _2168 = _1378 * _1378;
        float _2170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2172 = -_1128;
        float _2174 = _2172 + _2144;
        float _2176 = -_1048;
        float _2178 = _2176 + _2110;
        float _2180 = fma(_1382, _1382, _2168);
        float _2182 = fma(_1392, _1392, _2180);
        float _2184 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2186 = sqrt(_2182);
        float _2188 = 1.0 / _1486;
        float _2190 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2192 = precise::min(_2186, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2194 = _2192 * _2170;
        float _2196 = -_1112;
        float _2198 = _2196 + _2140;
        float _2200 = _2194 * _2188;
        float _2202 = _2190 * _2200;
        float _2204 = _2174 * _2200;
        float _2206 = fma(_2198, _2202, _1368);
        float _2208 = fma(_2178, _2202, _1364);
        float _2210 = fma(_2190, _2204, _1374);
        _2152 = _2208;
        _2154 = _2206;
        _2164 = _2210;
        _2156 = _2200;
    }
    float _2212 = _2152;
    float _2214 = _2154;
    float _2216 = _2164;
    float _2218 = _2156;
    float _2220 = _2218;
    if (_2108)
    {
        _2220 = 1.0;
    }
    float _2222 = _2220;
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2226 = _2142 * _2224;
    float _2228 = _2222;
    if (!_2108)
    {
        float _2230 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2232 = _2230 * 0.15915493667125701904296875;
        float _2234 = _2232 * 6.283185482025146484375;
        float _2236 = cos(_2234);
        float _2238 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2240 = _2238 * 0.15915493667125701904296875;
        float _2242 = _2232 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = 1.0 / _2236;
        float _2248 = _2240 * 6.283185482025146484375;
        float _2250 = cos(_2248);
        float _2252 = _2244 * _2246;
        float _2254 = _2240 * 6.283185482025146484375;
        float _2256 = sin(_2254);
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2260 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2258;
        float _2262 = _2250 * _2252;
        float _2264 = 1.0 / _2260;
        float _2266 = 1.0 / _2262;
        float _2268 = _2256 * _2266;
        float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2272 = fma(_2226, _2268, _2270);
        float _2274 = _2272 * _2264;
        float _2276 = precise::clamp(_2274, 0.0, 1.0);
        _1130 = _2264;
        _2166 = _2276;
    }
    float _2278 = _1130;
    float _2280 = _2166;
    float _2282 = _2278;
    if (!_2108)
    {
        float _2284 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2286 = _2284 * 0.15915493667125701904296875;
        float _2288 = _2286 * 6.283185482025146484375;
        float _2290 = cos(_2288);
        float _2292 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2294 = _2292 * 0.15915493667125701904296875;
        float _2296 = _2286 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = 1.0 / _2290;
        float _2302 = _2294 * 6.283185482025146484375;
        float _2304 = cos(_2302);
        float _2306 = _2298 * _2300;
        float _2308 = _2294 * 6.283185482025146484375;
        float _2310 = sin(_2308);
        float _2312 = _2304 * _2306;
        float _2314 = 1.0 / _2312;
        float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2318 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2316;
        float _2320 = 1.0 / _2318;
        float _2322 = _2310 * _2314;
        float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2326 = fma(_2226, _2322, _2324);
        float _2328 = _2326 * _2320;
        float _2330 = precise::clamp(_2328, 0.0, 1.0);
        float _2332 = -_2330;
        float _2334 = _2332 + 1.0;
        _2282 = _2312;
        _2228 = _2334;
    }
    float _2336 = _2282;
    float _2338 = _2228;
    float _2340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2342 = _2212 + _2340;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2346 = _2214 + _2344;
    float _2348 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2350 = _2216 + _2348;
    float _2352 = _2342 * _2342;
    float _2354 = fma(_2346, _2346, _2352);
    float _2356 = fma(_2350, _2350, _2354);
    float _2358 = rsqrt(_2356);
    float _2360 = sqrt(_2356);
    float _2362 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2364 = _2346 * _2362;
    float _2366 = _2350 * _2362;
    float _2368 = _2364 * _2364;
    float _2370 = _2366 * _2366;
    float _2372 = _2368 + _2370;
    float _2374 = sqrt(_2372);
    bool _2376 = _2374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2380 = _2374 + _2378;
    float _2382 = _2350;
    float _2384 = _2372;
    float _2386 = _2380;
    float _2388 = _2336;
    float _2390 = _2342;
    if (_2376)
    {
        float _2392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2382 = _2392;
    }
    float _2394 = _2382;
    if (_2376)
    {
        float _2396 = rsqrt(_2372);
        _2384 = _2396;
    }
    float _2398 = _2384;
    if (_2376)
    {
        float _2400 = _2380 * _2394;
        _2386 = _2400;
    }
    float _2402 = _2386;
    if (_2376)
    {
        float _2404 = _2402 * 0.15915493667125701904296875;
        _2388 = _2404;
    }
    float _2406 = _2388;
    float _2408 = _2352;
    float _2410 = _2406;
    if (_2376)
    {
        float _2412 = _2406 * 6.283185482025146484375;
        float _2414 = sin(_2412);
        _2408 = _2414;
    }
    float _2416 = _2408;
    float _2418 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2420 = precise::max(0.0, _2418);
    float _2422 = _2358;
    float _2424 = _2418;
    float _2426 = _2420;
    if (_2376)
    {
        float _2428 = _2406 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        _2422 = _2430;
    }
    float _2432 = _2422;
    float _2434 = -_2362;
    float _2436 = -_2420;
    float _2438 = fma(_2342, _2434, _2436);
    if (!_2376)
    {
        _2390 = _2366;
    }
    float _2440 = _2390;
    float _2442 = _2440;
    if (_2376)
    {
        float _2444 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2424 = _2444;
    }
    float _2446 = _2424;
    float _2448 = _2416;
    float _2450 = _2446;
    if (_2376)
    {
        float _2452 = fma(_2416, _2446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2426 = _2452;
    }
    float _2454 = _2426;
    float _2456 = _2454;
    if (!_2376)
    {
        _2448 = _2364;
    }
    float _2458 = _2448;
    float _2460 = _2458;
    float _2462 = _2432;
    if (_2376)
    {
        float _2464 = _2432 + (-1.0);
        _2450 = _2464;
    }
    float _2466 = _2450;
    float _2468 = _2466;
    if (_2376)
    {
        float _2470 = _2398 * _2454;
        _1444 = _2470;
    }
    float _2472 = _1444;
    if (!_2376)
    {
        _2456 = _2438;
    }
    float _2474 = _2456;
    float _2476 = _2474;
    if (_2376)
    {
        float _2478 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2410 = _2478;
    }
    float _2480 = _2410;
    if (_2376)
    {
        float _2482 = _2364 * _2472;
        _2460 = _2482;
    }
    float _2484 = _2460;
    if (!_2376)
    {
        _2468 = _2368;
    }
    float _2486 = _2468;
    float _2488 = _2486;
    if (_2376)
    {
        float _2490 = _2366 * _2472;
        _2442 = _2490;
    }
    float _2492 = _2442;
    if (_2376)
    {
        float _2494 = fma(_2438, _2432, _2480);
        _2476 = _2494;
    }
    float _2496 = _2476;
    if (_2376)
    {
        float _2498 = _2484 * _2484;
        _2488 = _2498;
    }
    float _2500 = _2488;
    if (!_2376)
    {
        _2462 = _2370;
    }
    float _2502 = _2462;
    float _2504 = _2502;
    if (_2376)
    {
        float _2506 = _2492 * _2492;
        _2504 = _2506;
    }
    float _2508 = _2504;
    float _2510 = fma(_2496, _2496, _2500);
    float _2512 = _2510 + _2508;
    float _2514 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2518 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2516);
    float _2520 = precise::clamp(_2518, 0.0, 1.0);
    float _2522 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2524 = rsqrt(_2512);
    float _2526 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2514);
    float _2528 = -_2520;
    float _2530 = _2528 + 1.0;
    float _2532 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2522);
    float _2534 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2536 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2526);
    float _2538 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2540 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2542 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2532);
    float _2544 = _2536 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2546 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2538);
    float _2548 = abs(_2530);
    float _2550 = log2(_2548);
    float _2552 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2540);
    float _2554 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2556 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2546);
    float _2558 = _2542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2560 = _2524 * _2484;
    float _2562 = -_2554;
    float _2564 = fma(_2562, _2534, 1.0);
    float _2566 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2568 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2570 = _2524 * _2496;
    float _2572 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2552);
    float _2574 = _2524 * _2492;
    float _2576 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2568);
    float _2578 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2580 = _2572 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2582 = log2(_2564);
    float _2584 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2586 = -_2578;
    float _2588 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2586);
    float _2590 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2576);
    float _2592 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2594 = -_2574;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2588);
    float _2598 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2590);
    float _2600 = exp2(_2584);
    float _2602 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2604 = fma(_2596, -0.5, 0.5);
    float _2606 = fma(_2596, 0.5, 0.5);
    float _2608 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2592);
    float _2610 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2602);
    float _2612 = _2570 + 1.0;
    float _2614 = fma(_2606, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2616 = 1.0 / _2598;
    float _2618 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2610);
    float _2620 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2608);
    float _2622 = fma(_2606, _2614, -0.212114393711090087890625);
    float _2624 = _2582 * 0.693147182464599609375;
    float _2626 = fma(_2606, _2622, 1.570728778839111328125);
    float _2628 = sqrt(_2604);
    float _2630 = -_2570;
    float _2632 = fma(_2600, _2612, _2630);
    float _2634 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2618);
    float _2636 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2620);
    float _2638 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2640 = fma(_2632, 0.5, 0.5);
    float _2642 = _2634 * _2616;
    float _2644 = _2636 * _2616;
    float _2646 = fma(_2642, 0.5, 0.5);
    float _2648 = fma(_2644, -0.5, 0.5);
    float _2650 = _2628 * 0.636619746685028076171875;
    float3 _6867 = float3(_2646, _2648, _2638);
    float _2652 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6867, float3(0.0), isnan(_6867)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6867, float3(0.0), isnan(_6867)), level(0.0)).x;
    float3 _6878 = float3(_2646, _2648, _2638);
    float4 _2655 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6878, float3(0.0), isnan(_6878)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6878, float3(0.0), isnan(_6878)), level(0.0)).xyzw;
    float _2657 = _2655.x;
    float _2659 = _2655.y;
    float _2661 = _2655.z;
    float _2663 = _2655.w;
    float _2665 = -_2626;
    float _2667 = fma(_2650, _2665, 1.0);
    float2 _6900 = float2(_2667, _2640);
    float3 _2671 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6900, float2(0.0), isnan(_6900)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6900, float2(0.0), isnan(_6900)), level(0.0)).xyz;
    float _2673 = _2671.x;
    float _2675 = _2671.y;
    float _2677 = _2671.z;
    float _2679 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2681 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2683 = _2280 * _2338;
    bool _2685 = _2280 > 0.0;
    bool _2687 = isnan(_2280);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    float _2695 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2681);
    float _2697 = exp2(_2679);
    float _2699 = _2683 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2701 = _2338 <= 0.0;
    bool _2703 = !_2693;
    bool _2705 = _2701 || _2703;
    float _2707 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2695);
    float _2709 = _380 * _2699;
    float _2711 = _2634 + _2598;
    float _2713 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2707);
    float _2715 = _2598 * 0.5;
    float _2717 = _2711 * 0.5;
    float _2719 = _2713 + _2598;
    float _2721 = fma(_2636, -0.5, _2715);
    float _2723 = _2709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2634;
    out.gl_Position.y = _2636;
    out.gl_Position.z = _2713;
    out.gl_Position.w = _2598;
    float _2725 = _2719 * 0.5;
    float _2727 = -_2697;
    float _2729 = _2727 + 1.0;
    out.m_47.x = _2723;
    float _2731 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.x = _2717;
    out.m_77.y = _2721;
    out.m_77.z = _2725;
    out.m_77.w = _2598;
    float _2733 = -_2731;
    float _2735 = _2733 + 1.0;
    float _2737 = _2731 * _2652;
    float _2739 = _2663 * _2737;
    float _2741 = _2663 * _2735;
    float _2743 = _2677 * _2737;
    float _2745 = fma(_2673, _2739, _2657);
    float _2747 = fma(_2675, _2739, _2659);
    float _2749 = fma(_2663, _2743, _2661);
    out.m_79.x = _2745;
    out.m_79.y = _2747;
    out.m_79.z = _2749;
    out.m_79.w = _2741;
    if (!_2705)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2751 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2751;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2042 = false;
    bool _860 = false;
    bool _622 = false;
    bool _402 = false;
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
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2807 = as_type<float>(_114);
        out.gl_Position.z = _2807;
    }
    if (!_102)
    {
        return out;
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = _130;
    if (_126)
    {
        float _136 = float(_98);
        _132 = _136;
    }
    float _138 = _132;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    if (_144)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _108;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    int _148 = 0;
    if (_144)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2876 = as_type<float>(_152);
        out.gl_Position.z = _2876;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _158 * _156;
    float _178 = 1.4012984643248170709237295832899e-45;
    float _180 = _160;
    if (!_170)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _190 = _186;
    if (!_170)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = _188 * 6.283185482025146484375;
    float _198 = floor(_188);
    float _200 = _196 * 0.15915493667125701904296875;
    float _202 = _200 * 6.283185482025146484375;
    float _204 = cos(_202);
    float _206 = -_198;
    float _208 = _188 + _206;
    bool _210 = _208 < 0.5;
    float _212 = float(_210);
    float _214 = fma(_204, 0.5, 0.5);
    bool _216 = !_170;
    float _218 = _194;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _160 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _160);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_170;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _160 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _180 = _272;
    }
    float _274 = _180;
    float _276 = -_208;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _280 = -_212;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _284 = -_214;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = in.m_49.x;
    float _290 = in.m_49.y;
    float _292 = in.m_49.z;
    float _294 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _296 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _298 = in.m_53.w;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _306 = _304 != 0;
    float _308 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _310 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _312 = in.m_44.x;
    float _314 = in.m_44.y;
    float _316 = in.m_44.z;
    float _318 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _320 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    bool _322 = !_174;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].y, _310);
    bool _328 = !_302;
    int _330 = _328 ? 0 : 1;
    float _332 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    bool _336 = !_306;
    int _338 = _336 ? 0 : 1;
    int _340 = abs(_324);
    float _342 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].y, _326);
    int _344 = abs(_330);
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].x, _320);
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _350 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].z, _334);
    int _352 = abs(_338);
    float _354 = fma(_274, _288, _346);
    float _356 = fma(_274, _290, _342);
    float _358 = float(_344);
    float _360 = fma(_274, _292, _350);
    float _362 = float(_340);
    float _364 = abs(_278);
    float _366 = _358 * _364;
    float _368 = fma(_354, _298, _312);
    float _370 = fma(_356, _298, _314);
    float _372 = float(_352);
    float _374 = fma(_362, _286, _366);
    float _376 = fma(_360, _298, _316);
    float _378 = abs(_282);
    float _380 = fma(_372, _378, _374);
    bool _382 = !_348;
    bool _384 = _302;
    float _400;
    if (!_382)
    {
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _388 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_98);
        float _406 = 1.0 / _404;
        float _408 = _130 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = _410 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = _410 + _416;
    bool _420 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _422 = isnan(_410);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _410 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _448 = 1.0 / _434;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _452 = 1.0 / _442;
    float _454 = 1.0 / _446;
    float _456 = _414 * _448;
    bool _458 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _460 = isnan(_410);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -_430;
    float _472 = _470 + 1.0;
    float _474 = _468 * _472;
    float _476 = _418 * _452;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _482;
    bool _486 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_410);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -_468;
    float _500 = _498 + 1.0;
    float _502 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _504 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _510 = _438 * _454;
    bool _512 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_410);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = fma(_508, _510, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _534 = fma(_526, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _536 = -_522;
    float _538 = _536 + 1.0;
    float _540 = _522 * _500;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = fma(_530, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _548 = _496 * _538;
    float _550 = -_496;
    float _552 = _550 + 1.0;
    float _554 = fma(_544, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _556 = _502 * _548;
    float _558 = _504 * _548;
    float _560 = _534 * _548;
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].x, _556);
    float _564 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].y, _558);
    float _566 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].z, _560);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _568;
    float _572 = fma(_546, _540, _562);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _578;
    float _582 = fma(_570, _456, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _584 = fma(_554, _540, _564);
    float _586 = fma(_576, _456, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _588 = fma(_580, _456, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _590 = fma(_532, _540, _566);
    float _592 = fma(_582, _474, _572);
    float _594 = fma(_586, _474, _584);
    float _596 = fma(_588, _474, _590);
    float _598 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[146].x, _592);
    float _600 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[146].y, _594);
    float _602 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[146].z, _596);
    bool _604 = !_450;
    float _620;
    if (!_604)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _608 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _612 = _610 * _606;
        float _614 = floor(_612);
        float _616 = -_614;
        float _618 = _612 + _616;
        _620 = _618;
        _622 = true;
    }
    else
    {
        float _624 = float(_98);
        float _626 = 1.0 / _624;
        float _628 = _130 * _626;
        _620 = _628;
    }
    _622 = false;
    float _630 = _620;
    float _632 = in.m_53.x;
    float _634 = in.m_53.y;
    float _636 = in.m_53.z;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _640 = _630 + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _644 = _630 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _648 = _630 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _662 = 1.0 / _652;
    bool _664 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _666 = 1.0 / _656;
    float _668 = _600 * _634;
    float _670 = _602 * _636;
    bool _672 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _674 = isnan(_630);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = _598 * _632;
    float _686 = 1.0 / _660;
    float _688 = _640 * _662;
    bool _690 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _692 = isnan(_630);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -_682;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _706;
    float _710 = _644 * _666;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _712;
    float _716 = _700 * _704;
    bool _718 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _720 = isnan(_630);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = fma(_708, _710, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _732 = fma(_714, _710, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _734 = -_700;
    float _736 = _734 + 1.0;
    float _738 = _648 * _686;
    bool _740 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _742 = isnan(_630);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _760 = fma(_754, _710, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _762 = -_750;
    float _764 = _762 + 1.0;
    float _766 = _750 * _736;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _776 = _728 * _764;
    float _778 = -_728;
    float _780 = _778 + 1.0;
    float _782 = fma(_758, _738, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _784 = fma(_770, _738, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _786 = _730 * _776;
    float _788 = _732 * _776;
    float _790 = _760 * _776;
    float _792 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[107].x, _786);
    float _794 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[107].y, _788);
    float _796 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[107].z, _790);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _802;
    float _806 = fma(_774, _738, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _808;
    float _812 = fma(_782, _766, _792);
    float _814 = fma(_800, _688, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _816 = fma(_804, _688, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _818 = fma(_784, _766, _794);
    float _820 = fma(_810, _688, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _822 = fma(_806, _766, _796);
    float _824 = fma(_814, _716, _812);
    float _826 = fma(_816, _716, _818);
    float _828 = fma(_820, _716, _822);
    float _830 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[110].x, _824);
    float _832 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[110].y, _826);
    float _834 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[110].z, _828);
    bool _836 = !_664;
    int _838 = as_type<int>(_782);
    float _840 = _818;
    int _842 = as_type<int>(_814);
    float _858;
    if (!_836)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _846 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _850 = _848 * _844;
        float _852 = floor(_850);
        float _854 = -_852;
        float _856 = _850 + _854;
        _838 = as_type<int>(_852);
        _858 = _856;
        _860 = true;
    }
    else
    {
        float _862 = float(_98);
        float _864 = 1.0 / _862;
        float _866 = _130 * _864;
        _858 = _866;
    }
    _860 = false;
    int _868 = _838;
    float _870 = _858;
    float _872 = in.m_55.x;
    float _874 = _370 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _878 = log2(_876);
    float _880 = in.m_51.z;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _884 = _882 != 0;
    float _886 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _890 = _888 != 0;
    float _892 = in.m_55.y;
    float _894 = _830 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _898 = in.m_51.w;
    float _900 = _832 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _902 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _904 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = in.m_51.y;
    float _908 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _910 = _868;
    if (_884)
    {
        bool _912 = _154 > 0.5;
        _384 = _912;
    }
    bool _914 = _384;
    float _916 = _878 * _130;
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _920 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _872;
    if (_884)
    {
        float _924 = -_872;
        float _926 = _924 + 1.0;
        _910 = as_type<int>(_926);
    }
    int _928 = _910;
    if (!_884)
    {
        _840 = _872;
    }
    float _930 = _840;
    float _932 = _930;
    if (_890)
    {
        float _934 = -_872;
        float _936 = _934 + 1.0;
        _842 = as_type<int>(_936);
    }
    int _938 = _842;
    float _940 = exp2(_916);
    if (_884)
    {
        float _942 = _914 ? as_type<float>(_928) : _872;
        _932 = _942;
    }
    float _944 = _932;
    float _946 = _154 * 2.0;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _950 = _948 != 0;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _958 = _956 != 0;
    float _960 = _880 * 2.0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _964 = _962 != 0;
    float _966 = _944 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _970 = _968 != 0;
    float _972 = _370 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _974 = _370 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _976 = floor(_946);
    bool _978 = _914;
    if (_890)
    {
        bool _980 = _880 > 0.5;
        _978 = _980;
    }
    bool _982 = _978;
    float _984 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _972);
    float _986 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _974);
    float _988 = -_892;
    float _990 = _988 + 1.0;
    float _992 = _892;
    if (_890)
    {
        float _994 = _982 ? as_type<float>(_938) : _872;
        _922 = _994;
    }
    float _996 = _922;
    float _998 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _986);
    bool _1000 = _898 > 0.5;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1006 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _886);
    bool _1008 = _906 > 0.5;
    float _1010 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _984);
    int _1012 = _1000 ? as_type<int>(_990) : as_type<int>(_892);
    float _1014 = 1.0 / _1004;
    float _1016 = _906 * 2.0;
    float _1018 = _964 ? as_type<float>(_1012) : _892;
    float _1020 = _154 + _880;
    bool _1022 = _976 > 0.0;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1026 = _976 >= 0.0;
    bool _1028 = isnan(_976);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    float _1036 = floor(_1016);
    if (_970)
    {
        float _1038 = _1008 ? _990 : _892;
        _992 = _1038;
    }
    float _1040 = _992;
    float _1042 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = -_940;
    float _1046 = _1044 + 1.0;
    float _1048 = _1006 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1054 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1056 = isnan(1.0);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1062 = _1058 || _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1066 = 1.0 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1068;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1074 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1020 + (-1.0);
    float _1080 = 1.0 / _1066;
    float _1082 = _1070 * _1014;
    bool _1084 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1086 = isnan(_870);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    out.m_57.x = _1074;
    out.m_57.y = _1076;
    out.m_57.z = _1042;
    out.m_57.w = _1072;
    bool _1096 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1104 = _1100 || _1102;
    float _1106 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1110 = _870 + _1108;
    float _1112 = _1010 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1114 = _906 + _880;
    float _1116 = _1104 ? _1046 : 0.0;
    float _1118 = fma(_1082, _1110, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1120 = _1036 > 0.0;
    float _1122 = _1114 + (-1.0);
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1126 = _1048 + _1124;
    float _1128 = _998 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1130 = _1112;
    if (_1062)
    {
        float _1132 = _1116 * _1080;
        _134 = _1132;
    }
    float _1134 = _134;
    bool _1136 = _1036 >= 0.0;
    bool _1138 = isnan(_1036);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = -_1094;
    float _1148 = _1146 + 1.0;
    float _1150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1152 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1154 = isnan(_870);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1160 = _1156 || _1158;
    float _1162 = float(_1160);
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1166 = _1112 + _1164;
    int _1168 = _1144 ? 0 : 1;
    float _1170 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1172 = _1034 ? 0 : 1;
    float _1174 = _1162 * _1148;
    float _1176 = -_1162;
    float _1178 = _1176 + 1.0;
    float _1180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1182 = ~_1168;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = _1118 * _1174;
    int _1190 = ~_1172;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1198 = _1194;
    int _1200 = _1186;
    if (!_1022)
    {
        int _1202 = ~_1172;
        int _1204 = _1202 + 1;
        _1198 = _1204;
    }
    int _1206 = _1198;
    float _1208 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1188);
    bool _1210 = !_954;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1216 = float(_1206);
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1128 + _1218;
    int _1222 = abs(_1212);
    float _1224 = _1196 * _1150;
    if (!_1120)
    {
        int _1226 = ~_1168;
        int _1228 = _1226 + 1;
        _1200 = _1228;
    }
    int _1230 = _1200;
    float _1232 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1214);
    float _1234 = float(_1222);
    float _1236 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1208);
    float _1238 = floor(_960);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1232);
    float _1242 = in.m_59.x;
    float _1244 = in.m_59.y;
    float _1246 = in.m_59.z;
    float _1248 = _1234 * _1216;
    float _1250 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1252 = _966 * _1180;
    float _1254 = _996 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1256 = _1240 >= 0.0;
    float _1258 = _1250 * _896;
    float _1260 = _1126 * _1126;
    float _1262 = float(_1230);
    float _1264 = _1254 * _918;
    bool _1266 = !_958;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = fma(_1166, _1166, _1260);
    float _1272 = _1248 * (-2.0);
    float _1274 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1276 = _1238 > 0.0;
    float _1278 = fma(_1220, _1220, _1270);
    int _1280 = abs(_1268);
    float _1282 = fma(_1170, _1272, _1170);
    bool _1284 = _1238 >= 0.0;
    bool _1286 = isnan(_1238);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    float _1294 = _880 + (-0.5);
    float _1296 = float(_1280);
    float _1298 = rsqrt(_1278);
    int _1300 = _1292 ? 0 : 1;
    out.m_61.x = _904;
    out.m_61.y = _908;
    out.m_61.z = _920;
    out.m_61.w = _1274;
    float _1302 = fma(_1272, _1244, _1244);
    float _1304 = _1272;
    if (_1256)
    {
        _1304 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1306 = _1304;
    float _1308 = _906 + (-0.5);
    float _1310 = _1296 * _1262;
    bool _1312 = !_950;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = ~_1300;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1302);
    int _1324 = _1320;
    int _1326 = as_type<int>(_1306);
    if (!_1276)
    {
        int _1328 = ~_1300;
        int _1330 = _1328 + 1;
        _1324 = _1330;
    }
    int _1332 = _1324;
    float _1334 = _1310 * (-2.0);
    int _1336 = abs(_1314);
    if (_1256)
    {
        float _1338 = _1306 * 5.0;
        _1326 = as_type<int>(_1338);
    }
    int _1340 = _1326;
    float _1342 = fma(_1282, _1134, _1322);
    float _1344 = fma(_1334, _1246, _1246);
    float _1346 = _1126 * _1298;
    out.m_63.x = _1252;
    out.m_63.y = _1258;
    out.m_63.z = _1264;
    out.m_63.w = _1224;
    float _1348 = _1166 * _1298;
    float _1350 = float(_1336);
    float _1352 = _1220 * _1298;
    if (_1256)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4787 = as_type<float>(_1340);
        out.gl_Position.z = _4787;
    }
    float _1354 = -_1346;
    float _1356 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    if (_1256)
    {
        out.m_47.x = 0.0;
    }
    float _1358 = fma(_1106, _1334, _1106);
    float _1360 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1344);
    if (_1256)
    {
        return out;
    }
    float _1362 = -_1346;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1366 = -_1348;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1112);
    float _1370 = float(_1332);
    float _1372 = -_1352;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1128);
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1378 = _1364 + _1376;
    float _1380 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1382 = _1368 + _1380;
    float _1384 = _154 + _906;
    float _1386 = _1350 * _1370;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1392 = _1374 + _1390;
    float _1394 = fma(_1358, _1134, _1360);
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1388);
    float _1398 = _1384 + (-1.0);
    float _1400 = _1386 * (-2.0);
    float _1402 = _154 + (-0.5);
    float _1404 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1396);
    float _1406 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1408 = fma(_1400, _1242, _1242);
    float _1410 = -_1348;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1166);
    float _1414 = _1356 * _1356;
    bool _1416 = _1404 >= 0.0;
    float _1418 = fma(_1406, _1400, _1406);
    float _1420 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1408);
    float _1422 = fma(_1412, _1412, _1414);
    float _1424 = -_1352;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1428 = _1342 * 0.15915493667125701904296875;
    float _1430 = fma(_1418, _1134, _1420);
    float _1432 = _1394 * 0.15915493667125701904296875;
    float _1434 = fma(_1426, _1426, _1422);
    float _1436 = _1428 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    float _1440 = _1430 * 0.15915493667125701904296875;
    float _1442 = _1370;
    float _1444 = _1368;
    if (_1416)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1446 = _1442;
    int _1448 = as_type<int>(_1446);
    if (_1416)
    {
        out.m_47.x = 0.0;
    }
    float _1450 = sqrt(_1434);
    if (_1416)
    {
        float _1452 = _1446 * 5.0;
        _1448 = as_type<int>(_1452);
    }
    int _1454 = _1448;
    if (_1416)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4974 = as_type<float>(_1454);
        out.gl_Position.z = _4974;
    }
    float _1456 = _1428 * 6.283185482025146484375;
    float _1458 = cos(_1456);
    float _1460 = _1432 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    float _1464 = _1432 * 6.283185482025146484375;
    float _1466 = cos(_1464);
    float _1468 = _1440 * 6.283185482025146484375;
    float _1470 = sin(_1468);
    if (_1416)
    {
        return out;
    }
    float _1472 = -_1048;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1476 = -_1112;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1480 = in.m_65.x;
    float _1482 = in.m_65.y;
    float _1484 = in.m_65.z;
    float _1486 = _1298 * _1450;
    float _1488 = _1474 * _1474;
    float _1490 = -_1128;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1440 * 6.283185482025146484375;
    float _1496 = cos(_1494);
    float _1498 = _1458 * _1466;
    float _1500 = fma(_1478, _1478, _1488);
    float _1502 = _1438 * _1462;
    float _1504 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1506 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1508 = fma(_1492, _1492, _1500);
    float _1510 = _1458 * _1462;
    float _1512 = _1438 * _1466;
    float _1514 = fma(_1470, _1502, _1498);
    float _1516 = rsqrt(_1508);
    float _1518 = fma(_1470, _1498, _1502);
    float _1520 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1522 = _1486 * _1504;
    float _1524 = -_1512;
    float _1526 = fma(_1470, _1510, _1524);
    float _1528 = -_1510;
    float _1530 = fma(_1470, _1512, _1528);
    float _1532 = _1462 * _1496;
    float _1534 = _1466 * _1496;
    float _1536 = _1438 * _1496;
    float _1538 = _1458 * _1496;
    float _1540 = _1486 * _1506;
    float _1542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1482);
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1480);
    bool _1546 = _1482 != 0.0;
    bool _1548 = isnan(_1482);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = _1486 * _1520;
    float _1558 = _1542 * _1540;
    float _1560 = _1478 * _1516;
    float _1562 = _1544 * _1522;
    float _1564 = _1492 * _1516;
    float _1566 = in.m_67.x;
    float _1568 = in.m_67.y;
    float _1570 = in.m_67.z;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1574 = _1560 * _1572;
    float _1576 = _1474 * _1516;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1580 = _1564 * _1578;
    bool _1582 = _1480 == 0.0;
    bool _1584 = !_1554;
    bool _1586 = _1582 && _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1590 = -_1574;
    float _1592 = fma(_1564, _1588, _1590);
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1596 = _1576 * _1594;
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1600 = -_1580;
    float _1602 = fma(_1576, _1598, _1600);
    bool _1604 = _1484 == 0.0;
    bool _1606 = _1604 && _1586;
    float _1608 = _1592 * _1592;
    float _1610 = in.m_69.x;
    float _1612 = in.m_69.y;
    float _1614 = in.m_69.z;
    float _1616 = in.m_69.w;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1620 = -_1596;
    float _1622 = fma(_1560, _1618, _1620);
    float _1624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1484);
    float _1626 = fma(_1602, _1602, _1608);
    float _1628 = _1534 * _1558;
    float _1630 = _1518 * _1558;
    float _1632 = _1624 * _1556;
    float _1634 = fma(_1622, _1622, _1626);
    float _1636 = _1530 * _1558;
    float _1638 = fma(_1532, _1562, _1628);
    float _1640 = fma(_1526, _1562, _1630);
    float _1642 = fma(_1514, _1562, _1636);
    float _1644 = rsqrt(_1634);
    float _1646 = _1628;
    float _1648 = _1562;
    float _1650 = _1566;
    float _1652 = _1568;
    if (_1606)
    {
        _1646 = _1566;
    }
    float _1654 = _1646;
    float _1656 = -_1470;
    float _1658 = fma(_1656, _1632, _1638);
    float _1660 = 0.0;
    float _1662 = _1654;
    if (_1606)
    {
        _1660 = _1568;
    }
    float _1664 = _1660;
    float _1666 = fma(_1536, _1632, _1642);
    float _1668 = _1664;
    if (_1606)
    {
        _1648 = _1654;
    }
    float _1670 = _1648;
    float _1672 = fma(_1538, _1632, _1640);
    float _1674 = _1670;
    if (!_1606)
    {
        _1662 = _1566;
    }
    float _1676 = _1662;
    if (_1606)
    {
        _1650 = _1664;
    }
    float _1678 = _1650;
    float _1680 = 0.0;
    float _1682 = _1678;
    if (_1606)
    {
        _1680 = _1570;
    }
    float _1684 = _1680;
    float _1686 = _1684;
    if (!_1606)
    {
        float _1688 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1676);
        _1674 = _1688;
    }
    float _1690 = _1674;
    if (!_1606)
    {
        _1668 = _1568;
    }
    float _1692 = _1668;
    if (_1606)
    {
        _1652 = _1684;
    }
    float _1694 = _1652;
    float _1696 = _1602 * _1644;
    float _1698 = _1694;
    if (!_1606)
    {
        _1686 = _1570;
    }
    float _1700 = _1686;
    if (!_1606)
    {
        float _1702 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1692);
        _1682 = _1702;
    }
    float _1704 = _1682;
    float _1706 = _1614 * _1676;
    float _1708 = _1592 * _1644;
    float _1710 = _1622 * _1644;
    float _1712 = _1576 * _1696;
    float _1714 = -_1706;
    float _1716 = fma(_1610, _1700, _1714);
    float _1718 = _1612 * _1700;
    float _1720 = _1564 * _1708;
    if (!_1606)
    {
        float _1722 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1700);
        _1698 = _1722;
    }
    float _1724 = _1698;
    float _1726 = _1610 * _1692;
    float _1728 = -_1718;
    float _1730 = fma(_1614, _1692, _1728);
    float _1732 = -_1720;
    float _1734 = fma(_1576, _1710, _1732);
    float _1736 = -_1712;
    float _1738 = fma(_1560, _1708, _1736);
    float _1740 = -_1726;
    float _1742 = fma(_1612, _1676, _1740);
    float _1744 = _1730 * _1616;
    float _1746 = _1734 * _1658;
    float _1748 = _1738 * _1658;
    float _1750 = _1716 * _1616;
    float _1752 = _1742 * _1616;
    float _1754 = fma(_1696, _1666, _1746);
    float _1756 = fma(_1710, _1666, _1748);
    float _1758 = _1560 * _1710;
    float _1760 = _1532 * _1734;
    float _1762 = fma(_1560, _1672, _1754);
    float _1764 = fma(_1564, _1672, _1756);
    float _1766 = -_1758;
    float _1768 = fma(_1564, _1696, _1766);
    float _1770 = _1534 * _1734;
    float _1772 = _1112 + _1762;
    float _1774 = _1128 + _1764;
    float _1776 = _1532 * _1768;
    float _1778 = _1532 * _1738;
    float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1782 = _1772 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1786 = _1774 + _1784;
    float _1788 = -_1734;
    float _1790 = _1470 * _1788;
    float _1792 = -_1738;
    float _1794 = _1470 * _1792;
    float _1796 = _1782 * _1782;
    float _1798 = _1786 * _1786;
    float _1800 = -_1768;
    float _1802 = _1470 * _1800;
    float _1804 = _1534 * _1768;
    float _1806 = _1534 * _1738;
    float _1808 = _1796 + _1798;
    float _1810 = fma(_1514, _1696, _1760);
    float _1812 = fma(_1514, _1708, _1776);
    float _1814 = fma(_1514, _1710, _1778);
    float _1816 = _1768 * _1658;
    float _1818 = sqrt(_1808);
    float _1820 = fma(_1530, _1696, _1770);
    float _1822 = fma(_1530, _1708, _1804);
    float _1824 = fma(_1530, _1710, _1806);
    float _1826 = fma(_1536, _1696, _1790);
    float _1828 = fma(_1708, _1666, _1816);
    float _1830 = fma(_1536, _1710, _1794);
    float _1832 = fma(_1536, _1708, _1802);
    float _1834 = fma(_1518, _1560, _1820);
    float _1836 = fma(_1518, _1576, _1822);
    float _1838 = fma(_1518, _1564, _1824);
    float _1840 = fma(_1576, _1672, _1828);
    float _1842 = fma(_1526, _1560, _1810);
    float _1844 = fma(_1538, _1560, _1826);
    float _1846 = fma(_1538, _1564, _1830);
    float _1848 = fma(_1526, _1576, _1812);
    bool _1850 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1852 = fma(_1538, _1576, _1832);
    float _1854 = _1834 * _1612;
    float _1856 = _1836 * _1612;
    float _1858 = _1838 * _1612;
    float _1860 = fma(_1526, _1564, _1814);
    float _1862 = _1834 * _1704;
    float _1864 = _1836 * _1704;
    float _1866 = _1750 * _1836;
    float _1868 = _1750 * _1834;
    float _1870 = _1838 * _1704;
    float _1872 = _1750 * _1838;
    float _1874 = _1048 + _1840;
    bool _1876 = !_1850;
    float _1878 = _1874;
    float _1880 = _1796;
    float _1882 = _1798;
    float _1884 = _1772;
    float _1886 = _1782;
    float _1888 = _1774;
    if (!_1876)
    {
        float _1890 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1894 = _1818 + _1892;
        float _1896 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1898 = rsqrt(_1808);
        float _1900 = _1894 * _1890;
        float _1902 = _1900 * 0.15915493667125701904296875;
        float _1904 = _1902 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        float _1908 = _1902 * 6.283185482025146484375;
        float _1910 = cos(_1908);
        float _1912 = fma(_1906, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1914 = _1898 * _1912;
        float _1916 = fma(_1782, _1914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1918 = _1910 + (-1.0);
        float _1920 = fma(_1786, _1914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1924 = _1916 + _1922;
        float _1926 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1930 = _1920 + _1928;
        float _1932 = _1924 * _1924;
        float _1934 = fma(_1874, _1910, _1926);
        float _1936 = _1930 * _1930;
        _1878 = _1934;
        _1880 = _1932;
        _1882 = _1936;
        _1884 = _1916;
        _1886 = _1926;
        _1888 = _1920;
    }
    float _1938 = _1878;
    float _1940 = _1880;
    float _1942 = _1882;
    float _1944 = _1884;
    float _1946 = _1886;
    float _1948 = _1888;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1952 = _1938 + _1950;
    float _1954 = fma(_1842, _1690, _1862);
    float _1956 = fma(_1848, _1690, _1864);
    float _1958 = fma(_1860, _1690, _1870);
    float _1960 = fma(_1952, _1952, _1940);
    float _1962 = fma(_1842, _1610, _1854);
    float _1964 = fma(_1848, _1610, _1856);
    float _1966 = fma(_1744, _1842, _1868);
    float _1968 = _1960 + _1942;
    float _1970 = fma(_1744, _1848, _1866);
    float _1972 = fma(_1860, _1610, _1858);
    float _1974 = fma(_1744, _1860, _1872);
    float _1976 = fma(_1844, _1724, _1954);
    float _1978 = fma(_1852, _1724, _1956);
    float _1980 = sqrt(_1968);
    float _1982 = fma(_1846, _1724, _1958);
    float _1984 = fma(_1844, _1614, _1962);
    float _1986 = fma(_1852, _1614, _1964);
    float _1988 = fma(_1752, _1844, _1966);
    float _1990 = fma(_1752, _1852, _1970);
    float _1992 = fma(_1846, _1614, _1972);
    float _1994 = fma(_1752, _1846, _1974);
    out.m_71.x = _1976;
    out.m_71.y = _1978;
    out.m_71.z = _1982;
    out.m_73.x = _1984;
    out.m_73.y = _1986;
    out.m_73.z = _1992;
    out.m_75.x = _1988;
    out.m_75.y = _1990;
    out.m_75.z = _1994;
    bool _1996 = _1980 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1998 = isnan(_1980);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2004 = _2000 || _2002;
    float _2006 = _1946;
    if (!_2004)
    {
        _2006 = 1.0;
    }
    float _2008 = _2006;
    bool _2010 = !_2004;
    float _2012 = _2008;
    if (!_2010)
    {
        bool _2014 = _1980 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2016 = isnan(_1980);
        bool _2018 = _2014 || _2016;
        bool _2020 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2022 = _2018 || _2020;
        if (!_2022)
        {
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = _1980 + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2030 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2028;
            float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2034 = _2032 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2036 = 1.0 / _2030;
            float _2038 = _2026 * _2036;
            float _2040 = fma(_2038, _2034, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2012 = _2040;
            _2042 = true;
        }
        else
        {
            bool _2044 = _1980 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2046 = isnan(_1980);
            bool _2048 = _2044 || _2046;
            bool _2050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2052 = _2048 || _2050;
            if (!_2052)
            {
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _1980 + _2054;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2062 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2064 = _2062 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2066 = 1.0 / _2060;
                float _2068 = _2056 * _2066;
                float _2070 = fma(_2068, _2064, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2012 = _2070;
                _2042 = true;
            }
            else
            {
                _2012 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2042 = false;
    float _2072 = _2012;
    float _2074 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2076 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2078 = _1944 + _2076;
    float _2080 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2074);
    float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2084 = _1938 + _2082;
    bool _2086 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan(0.5);
    bool _2094 = _2090 || _2092;
    float _2096 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2080);
    float _2098 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2100 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2102 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan(0.5);
    bool _2108 = _2104 || _2106;
    float _2110 = fma(_2084, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2112 = _2096 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2114 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2098);
    float _2116 = 1.0 / _2112;
    float _2118 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2114);
    float _2120 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2122 = _2120 + _2112;
    float _2124 = _2122 * _2116;
    float _2126 = _2124 * 0.5;
    float _2128 = -_1346;
    float _2130 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2110);
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2134 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2132);
    float _2136 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2138 = _1948 + _2136;
    float _2140 = fma(_2078, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2142 = 1.0 / _2134;
    float _2144 = fma(_2138, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2146 = -_1348;
    float _2148 = fma(_2146, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2140);
    float _2150 = _2138;
    float _2152 = _2130;
    float _2154 = _2148;
    float _2156 = _2134;
    if (_2108)
    {
        _2150 = 1.0;
    }
    float _2158 = _2150;
    float _2160 = -_1352;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2144);
    float _2164 = _2162;
    float _2166 = _2158;
    if (!_2094)
    {
        float _2168 = _1378 * _1378;
        float _2170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2172 = -_1128;
        float _2174 = _2172 + _2144;
        float _2176 = -_1048;
        float _2178 = _2176 + _2110;
        float _2180 = fma(_1382, _1382, _2168);
        float _2182 = fma(_1392, _1392, _2180);
        float _2184 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2186 = sqrt(_2182);
        float _2188 = 1.0 / _1486;
        float _2190 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2192 = precise::min(_2186, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2194 = _2192 * _2170;
        float _2196 = -_1112;
        float _2198 = _2196 + _2140;
        float _2200 = _2194 * _2188;
        float _2202 = _2190 * _2200;
        float _2204 = _2174 * _2200;
        float _2206 = fma(_2198, _2202, _1368);
        float _2208 = fma(_2178, _2202, _1364);
        float _2210 = fma(_2190, _2204, _1374);
        _2152 = _2208;
        _2154 = _2206;
        _2164 = _2210;
        _2156 = _2200;
    }
    float _2212 = _2152;
    float _2214 = _2154;
    float _2216 = _2164;
    float _2218 = _2156;
    float _2220 = _2218;
    if (_2108)
    {
        _2220 = 1.0;
    }
    float _2222 = _2220;
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2226 = _2142 * _2224;
    float _2228 = _2222;
    if (!_2108)
    {
        float _2230 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2232 = _2230 * 0.15915493667125701904296875;
        float _2234 = _2232 * 6.283185482025146484375;
        float _2236 = cos(_2234);
        float _2238 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2240 = _2238 * 0.15915493667125701904296875;
        float _2242 = _2232 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = 1.0 / _2236;
        float _2248 = _2240 * 6.283185482025146484375;
        float _2250 = cos(_2248);
        float _2252 = _2244 * _2246;
        float _2254 = _2240 * 6.283185482025146484375;
        float _2256 = sin(_2254);
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2260 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2258;
        float _2262 = _2250 * _2252;
        float _2264 = 1.0 / _2260;
        float _2266 = 1.0 / _2262;
        float _2268 = _2256 * _2266;
        float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2272 = fma(_2226, _2268, _2270);
        float _2274 = _2272 * _2264;
        float _2276 = precise::clamp(_2274, 0.0, 1.0);
        _1130 = _2264;
        _2166 = _2276;
    }
    float _2278 = _1130;
    float _2280 = _2166;
    float _2282 = _2278;
    if (!_2108)
    {
        float _2284 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2286 = _2284 * 0.15915493667125701904296875;
        float _2288 = _2286 * 6.283185482025146484375;
        float _2290 = cos(_2288);
        float _2292 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2294 = _2292 * 0.15915493667125701904296875;
        float _2296 = _2286 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = 1.0 / _2290;
        float _2302 = _2294 * 6.283185482025146484375;
        float _2304 = cos(_2302);
        float _2306 = _2298 * _2300;
        float _2308 = _2294 * 6.283185482025146484375;
        float _2310 = sin(_2308);
        float _2312 = _2304 * _2306;
        float _2314 = 1.0 / _2312;
        float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2318 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2316;
        float _2320 = 1.0 / _2318;
        float _2322 = _2310 * _2314;
        float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2326 = fma(_2226, _2322, _2324);
        float _2328 = _2326 * _2320;
        float _2330 = precise::clamp(_2328, 0.0, 1.0);
        float _2332 = -_2330;
        float _2334 = _2332 + 1.0;
        _2282 = _2312;
        _2228 = _2334;
    }
    float _2336 = _2282;
    float _2338 = _2228;
    float _2340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2342 = _2212 + _2340;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2346 = _2214 + _2344;
    float _2348 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2350 = _2216 + _2348;
    float _2352 = _2342 * _2342;
    float _2354 = fma(_2346, _2346, _2352);
    float _2356 = fma(_2350, _2350, _2354);
    float _2358 = rsqrt(_2356);
    float _2360 = sqrt(_2356);
    float _2362 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2364 = _2346 * _2362;
    float _2366 = _2350 * _2362;
    float _2368 = _2364 * _2364;
    float _2370 = _2366 * _2366;
    float _2372 = _2368 + _2370;
    float _2374 = sqrt(_2372);
    bool _2376 = _2374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2380 = _2374 + _2378;
    float _2382 = _2350;
    float _2384 = _2372;
    float _2386 = _2380;
    float _2388 = _2336;
    float _2390 = _2342;
    if (_2376)
    {
        float _2392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2382 = _2392;
    }
    float _2394 = _2382;
    if (_2376)
    {
        float _2396 = rsqrt(_2372);
        _2384 = _2396;
    }
    float _2398 = _2384;
    if (_2376)
    {
        float _2400 = _2380 * _2394;
        _2386 = _2400;
    }
    float _2402 = _2386;
    if (_2376)
    {
        float _2404 = _2402 * 0.15915493667125701904296875;
        _2388 = _2404;
    }
    float _2406 = _2388;
    float _2408 = _2352;
    float _2410 = _2406;
    if (_2376)
    {
        float _2412 = _2406 * 6.283185482025146484375;
        float _2414 = sin(_2412);
        _2408 = _2414;
    }
    float _2416 = _2408;
    float _2418 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2420 = precise::max(0.0, _2418);
    float _2422 = _2358;
    float _2424 = _2418;
    float _2426 = _2420;
    if (_2376)
    {
        float _2428 = _2406 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        _2422 = _2430;
    }
    float _2432 = _2422;
    float _2434 = -_2362;
    float _2436 = -_2420;
    float _2438 = fma(_2342, _2434, _2436);
    if (!_2376)
    {
        _2390 = _2366;
    }
    float _2440 = _2390;
    float _2442 = _2440;
    if (_2376)
    {
        float _2444 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2424 = _2444;
    }
    float _2446 = _2424;
    float _2448 = _2416;
    float _2450 = _2446;
    if (_2376)
    {
        float _2452 = fma(_2416, _2446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2426 = _2452;
    }
    float _2454 = _2426;
    float _2456 = _2454;
    if (!_2376)
    {
        _2448 = _2364;
    }
    float _2458 = _2448;
    float _2460 = _2458;
    float _2462 = _2432;
    if (_2376)
    {
        float _2464 = _2432 + (-1.0);
        _2450 = _2464;
    }
    float _2466 = _2450;
    float _2468 = _2466;
    if (_2376)
    {
        float _2470 = _2398 * _2454;
        _1444 = _2470;
    }
    float _2472 = _1444;
    if (!_2376)
    {
        _2456 = _2438;
    }
    float _2474 = _2456;
    float _2476 = _2474;
    if (_2376)
    {
        float _2478 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2410 = _2478;
    }
    float _2480 = _2410;
    if (_2376)
    {
        float _2482 = _2364 * _2472;
        _2460 = _2482;
    }
    float _2484 = _2460;
    if (!_2376)
    {
        _2468 = _2368;
    }
    float _2486 = _2468;
    float _2488 = _2486;
    if (_2376)
    {
        float _2490 = _2366 * _2472;
        _2442 = _2490;
    }
    float _2492 = _2442;
    if (_2376)
    {
        float _2494 = fma(_2438, _2432, _2480);
        _2476 = _2494;
    }
    float _2496 = _2476;
    if (_2376)
    {
        float _2498 = _2484 * _2484;
        _2488 = _2498;
    }
    float _2500 = _2488;
    if (!_2376)
    {
        _2462 = _2370;
    }
    float _2502 = _2462;
    float _2504 = _2502;
    if (_2376)
    {
        float _2506 = _2492 * _2492;
        _2504 = _2506;
    }
    float _2508 = _2504;
    float _2510 = fma(_2496, _2496, _2500);
    float _2512 = _2510 + _2508;
    float _2514 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2518 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2516);
    float _2520 = precise::clamp(_2518, 0.0, 1.0);
    float _2522 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2524 = rsqrt(_2512);
    float _2526 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2514);
    float _2528 = -_2520;
    float _2530 = _2528 + 1.0;
    float _2532 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2522);
    float _2534 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2536 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2526);
    float _2538 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2540 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2542 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2532);
    float _2544 = _2536 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2546 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2538);
    float _2548 = abs(_2530);
    float _2550 = log2(_2548);
    float _2552 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2540);
    float _2554 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2556 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2546);
    float _2558 = _2542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2560 = _2524 * _2484;
    float _2562 = -_2554;
    float _2564 = fma(_2562, _2534, 1.0);
    float _2566 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2568 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2570 = _2524 * _2496;
    float _2572 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2552);
    float _2574 = _2524 * _2492;
    float _2576 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2568);
    float _2578 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2580 = _2572 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2582 = log2(_2564);
    float _2584 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2586 = -_2578;
    float _2588 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2586);
    float _2590 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2576);
    float _2592 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2594 = -_2574;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2588);
    float _2598 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2590);
    float _2600 = exp2(_2584);
    float _2602 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2604 = fma(_2596, -0.5, 0.5);
    float _2606 = fma(_2596, 0.5, 0.5);
    float _2608 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2592);
    float _2610 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2602);
    float _2612 = _2570 + 1.0;
    float _2614 = fma(_2606, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2616 = 1.0 / _2598;
    float _2618 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2610);
    float _2620 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2608);
    float _2622 = fma(_2606, _2614, -0.212114393711090087890625);
    float _2624 = _2582 * 0.693147182464599609375;
    float _2626 = fma(_2606, _2622, 1.570728778839111328125);
    float _2628 = sqrt(_2604);
    float _2630 = -_2570;
    float _2632 = fma(_2600, _2612, _2630);
    float _2634 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2618);
    float _2636 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2620);
    float _2638 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2640 = fma(_2632, 0.5, 0.5);
    float _2642 = _2634 * _2616;
    float _2644 = _2636 * _2616;
    float _2646 = fma(_2642, 0.5, 0.5);
    float _2648 = fma(_2644, -0.5, 0.5);
    float _2650 = _2628 * 0.636619746685028076171875;
    float3 _6867 = float3(_2646, _2648, _2638);
    float _2652 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6867, float3(0.0), isnan(_6867)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6867, float3(0.0), isnan(_6867)), level(0.0)).x;
    float3 _6878 = float3(_2646, _2648, _2638);
    float4 _2655 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6878, float3(0.0), isnan(_6878)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6878, float3(0.0), isnan(_6878)), level(0.0)).xyzw;
    float _2657 = _2655.x;
    float _2659 = _2655.y;
    float _2661 = _2655.z;
    float _2663 = _2655.w;
    float _2665 = -_2626;
    float _2667 = fma(_2650, _2665, 1.0);
    float2 _6900 = float2(_2667, _2640);
    float3 _2671 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6900, float2(0.0), isnan(_6900)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6900, float2(0.0), isnan(_6900)), level(0.0)).xyz;
    float _2673 = _2671.x;
    float _2675 = _2671.y;
    float _2677 = _2671.z;
    float _2679 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2681 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2683 = _2280 * _2338;
    bool _2685 = _2280 > 0.0;
    bool _2687 = isnan(_2280);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    float _2695 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2681);
    float _2697 = exp2(_2679);
    float _2699 = _2683 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2701 = _2338 <= 0.0;
    bool _2703 = !_2693;
    bool _2705 = _2701 || _2703;
    float _2707 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2695);
    float _2709 = _380 * _2699;
    float _2711 = _2634 + _2598;
    float _2713 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2707);
    float _2715 = _2598 * 0.5;
    float _2717 = _2711 * 0.5;
    float _2719 = _2713 + _2598;
    float _2721 = fma(_2636, -0.5, _2715);
    float _2723 = _2709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2634;
    out.gl_Position.y = _2636;
    out.gl_Position.z = _2713;
    out.gl_Position.w = _2598;
    float _2725 = _2719 * 0.5;
    float _2727 = -_2697;
    float _2729 = _2727 + 1.0;
    out.m_47.x = _2723;
    float _2731 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.x = _2717;
    out.m_77.y = _2721;
    out.m_77.z = _2725;
    out.m_77.w = _2598;
    float _2733 = -_2731;
    float _2735 = _2733 + 1.0;
    float _2737 = _2731 * _2652;
    float _2739 = _2663 * _2737;
    float _2741 = _2663 * _2735;
    float _2743 = _2677 * _2737;
    float _2745 = fma(_2673, _2739, _2657);
    float _2747 = fma(_2675, _2739, _2659);
    float _2749 = fma(_2663, _2743, _2661);
    out.m_79.x = _2745;
    out.m_79.y = _2747;
    out.m_79.z = _2749;
    out.m_79.w = _2741;
    if (!_2705)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2751 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2751;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2042 = false;
    bool _860 = false;
    bool _622 = false;
    bool _402 = false;
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
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2807 = as_type<float>(_114);
        out.gl_Position.z = _2807;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = _130;
    if (_126)
    {
        float _136 = float(_98);
        _132 = _136;
    }
    float _138 = _132;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    if (_144)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _108;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    int _148 = 0;
    if (_144)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2876 = as_type<float>(_152);
        out.gl_Position.z = _2876;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _158 * _156;
    float _178 = 1.4012984643248170709237295832899e-45;
    float _180 = _160;
    if (!_170)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _190 = _186;
    if (!_170)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = _188 * 6.283185482025146484375;
    float _198 = floor(_188);
    float _200 = _196 * 0.15915493667125701904296875;
    float _202 = _200 * 6.283185482025146484375;
    float _204 = cos(_202);
    float _206 = -_198;
    float _208 = _188 + _206;
    bool _210 = _208 < 0.5;
    float _212 = float(_210);
    float _214 = fma(_204, 0.5, 0.5);
    bool _216 = !_170;
    float _218 = _194;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _160 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _160);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_170;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _160 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _180 = _272;
    }
    float _274 = _180;
    float _276 = -_208;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _280 = -_212;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _284 = -_214;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = in.m_49.x;
    float _290 = in.m_49.y;
    float _292 = in.m_49.z;
    float _294 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _296 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _298 = in.m_53.w;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _306 = _304 != 0;
    float _308 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _310 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _312 = in.m_44.x;
    float _314 = in.m_44.y;
    float _316 = in.m_44.z;
    float _318 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _320 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    bool _322 = !_174;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].y, _310);
    bool _328 = !_302;
    int _330 = _328 ? 0 : 1;
    float _332 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    bool _336 = !_306;
    int _338 = _336 ? 0 : 1;
    int _340 = abs(_324);
    float _342 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].y, _326);
    int _344 = abs(_330);
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].x, _320);
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _350 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].z, _334);
    int _352 = abs(_338);
    float _354 = fma(_274, _288, _346);
    float _356 = fma(_274, _290, _342);
    float _358 = float(_344);
    float _360 = fma(_274, _292, _350);
    float _362 = float(_340);
    float _364 = abs(_278);
    float _366 = _358 * _364;
    float _368 = fma(_354, _298, _312);
    float _370 = fma(_356, _298, _314);
    float _372 = float(_352);
    float _374 = fma(_362, _286, _366);
    float _376 = fma(_360, _298, _316);
    float _378 = abs(_282);
    float _380 = fma(_372, _378, _374);
    bool _382 = !_348;
    bool _384 = _302;
    float _400;
    if (!_382)
    {
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _388 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_98);
        float _406 = 1.0 / _404;
        float _408 = _130 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = _410 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = _410 + _416;
    bool _420 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _422 = isnan(_410);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _410 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _448 = 1.0 / _434;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _452 = 1.0 / _442;
    float _454 = 1.0 / _446;
    float _456 = _414 * _448;
    bool _458 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _460 = isnan(_410);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -_430;
    float _472 = _470 + 1.0;
    float _474 = _468 * _472;
    float _476 = _418 * _452;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _482;
    bool _486 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_410);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -_468;
    float _500 = _498 + 1.0;
    float _502 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _504 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _510 = _438 * _454;
    bool _512 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_410);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = fma(_508, _510, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _534 = fma(_526, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _536 = -_522;
    float _538 = _536 + 1.0;
    float _540 = _522 * _500;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = fma(_530, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _548 = _496 * _538;
    float _550 = -_496;
    float _552 = _550 + 1.0;
    float _554 = fma(_544, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _556 = _502 * _548;
    float _558 = _504 * _548;
    float _560 = _534 * _548;
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].x, _556);
    float _564 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].y, _558);
    float _566 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].z, _560);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _568;
    float _572 = fma(_546, _540, _562);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _578;
    float _582 = fma(_570, _456, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _584 = fma(_554, _540, _564);
    float _586 = fma(_576, _456, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _588 = fma(_580, _456, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _590 = fma(_532, _540, _566);
    float _592 = fma(_582, _474, _572);
    float _594 = fma(_586, _474, _584);
    float _596 = fma(_588, _474, _590);
    float _598 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[146].x, _592);
    float _600 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[146].y, _594);
    float _602 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[146].z, _596);
    bool _604 = !_450;
    float _620;
    if (!_604)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _608 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _612 = _610 * _606;
        float _614 = floor(_612);
        float _616 = -_614;
        float _618 = _612 + _616;
        _620 = _618;
        _622 = true;
    }
    else
    {
        float _624 = float(_98);
        float _626 = 1.0 / _624;
        float _628 = _130 * _626;
        _620 = _628;
    }
    _622 = false;
    float _630 = _620;
    float _632 = in.m_53.x;
    float _634 = in.m_53.y;
    float _636 = in.m_53.z;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _640 = _630 + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _644 = _630 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _648 = _630 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _662 = 1.0 / _652;
    bool _664 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _666 = 1.0 / _656;
    float _668 = _600 * _634;
    float _670 = _602 * _636;
    bool _672 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _674 = isnan(_630);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = _598 * _632;
    float _686 = 1.0 / _660;
    float _688 = _640 * _662;
    bool _690 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _692 = isnan(_630);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -_682;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _706;
    float _710 = _644 * _666;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _712;
    float _716 = _700 * _704;
    bool _718 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _720 = isnan(_630);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = fma(_708, _710, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _732 = fma(_714, _710, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _734 = -_700;
    float _736 = _734 + 1.0;
    float _738 = _648 * _686;
    bool _740 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _742 = isnan(_630);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _760 = fma(_754, _710, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _762 = -_750;
    float _764 = _762 + 1.0;
    float _766 = _750 * _736;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _776 = _728 * _764;
    float _778 = -_728;
    float _780 = _778 + 1.0;
    float _782 = fma(_758, _738, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _784 = fma(_770, _738, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _786 = _730 * _776;
    float _788 = _732 * _776;
    float _790 = _760 * _776;
    float _792 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[107].x, _786);
    float _794 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[107].y, _788);
    float _796 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[107].z, _790);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _802;
    float _806 = fma(_774, _738, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _808;
    float _812 = fma(_782, _766, _792);
    float _814 = fma(_800, _688, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _816 = fma(_804, _688, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _818 = fma(_784, _766, _794);
    float _820 = fma(_810, _688, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _822 = fma(_806, _766, _796);
    float _824 = fma(_814, _716, _812);
    float _826 = fma(_816, _716, _818);
    float _828 = fma(_820, _716, _822);
    float _830 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[110].x, _824);
    float _832 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[110].y, _826);
    float _834 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[110].z, _828);
    bool _836 = !_664;
    int _838 = as_type<int>(_782);
    float _840 = _818;
    int _842 = as_type<int>(_814);
    float _858;
    if (!_836)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _846 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _850 = _848 * _844;
        float _852 = floor(_850);
        float _854 = -_852;
        float _856 = _850 + _854;
        _838 = as_type<int>(_852);
        _858 = _856;
        _860 = true;
    }
    else
    {
        float _862 = float(_98);
        float _864 = 1.0 / _862;
        float _866 = _130 * _864;
        _858 = _866;
    }
    _860 = false;
    int _868 = _838;
    float _870 = _858;
    float _872 = in.m_55.x;
    float _874 = _370 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _878 = log2(_876);
    float _880 = in.m_51.z;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _884 = _882 != 0;
    float _886 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _890 = _888 != 0;
    float _892 = in.m_55.y;
    float _894 = _830 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _898 = in.m_51.w;
    float _900 = _832 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _902 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _904 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = in.m_51.y;
    float _908 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _910 = _868;
    if (_884)
    {
        bool _912 = _154 > 0.5;
        _384 = _912;
    }
    bool _914 = _384;
    float _916 = _878 * _130;
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _920 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _872;
    if (_884)
    {
        float _924 = -_872;
        float _926 = _924 + 1.0;
        _910 = as_type<int>(_926);
    }
    int _928 = _910;
    if (!_884)
    {
        _840 = _872;
    }
    float _930 = _840;
    float _932 = _930;
    if (_890)
    {
        float _934 = -_872;
        float _936 = _934 + 1.0;
        _842 = as_type<int>(_936);
    }
    int _938 = _842;
    float _940 = exp2(_916);
    if (_884)
    {
        float _942 = _914 ? as_type<float>(_928) : _872;
        _932 = _942;
    }
    float _944 = _932;
    float _946 = _154 * 2.0;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _950 = _948 != 0;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _958 = _956 != 0;
    float _960 = _880 * 2.0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _964 = _962 != 0;
    float _966 = _944 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _970 = _968 != 0;
    float _972 = _370 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _974 = _370 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _976 = floor(_946);
    bool _978 = _914;
    if (_890)
    {
        bool _980 = _880 > 0.5;
        _978 = _980;
    }
    bool _982 = _978;
    float _984 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _972);
    float _986 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _974);
    float _988 = -_892;
    float _990 = _988 + 1.0;
    float _992 = _892;
    if (_890)
    {
        float _994 = _982 ? as_type<float>(_938) : _872;
        _922 = _994;
    }
    float _996 = _922;
    float _998 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _986);
    bool _1000 = _898 > 0.5;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1006 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _886);
    bool _1008 = _906 > 0.5;
    float _1010 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _984);
    int _1012 = _1000 ? as_type<int>(_990) : as_type<int>(_892);
    float _1014 = 1.0 / _1004;
    float _1016 = _906 * 2.0;
    float _1018 = _964 ? as_type<float>(_1012) : _892;
    float _1020 = _154 + _880;
    bool _1022 = _976 > 0.0;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1026 = _976 >= 0.0;
    bool _1028 = isnan(_976);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    float _1036 = floor(_1016);
    if (_970)
    {
        float _1038 = _1008 ? _990 : _892;
        _992 = _1038;
    }
    float _1040 = _992;
    float _1042 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = -_940;
    float _1046 = _1044 + 1.0;
    float _1048 = _1006 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1054 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1056 = isnan(1.0);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1062 = _1058 || _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1066 = 1.0 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1068;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1074 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1020 + (-1.0);
    float _1080 = 1.0 / _1066;
    float _1082 = _1070 * _1014;
    bool _1084 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1086 = isnan(_870);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    out.m_57.x = _1074;
    out.m_57.y = _1076;
    out.m_57.z = _1042;
    out.m_57.w = _1072;
    bool _1096 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1104 = _1100 || _1102;
    float _1106 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1110 = _870 + _1108;
    float _1112 = _1010 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1114 = _906 + _880;
    float _1116 = _1104 ? _1046 : 0.0;
    float _1118 = fma(_1082, _1110, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1120 = _1036 > 0.0;
    float _1122 = _1114 + (-1.0);
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1126 = _1048 + _1124;
    float _1128 = _998 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1130 = _1112;
    if (_1062)
    {
        float _1132 = _1116 * _1080;
        _134 = _1132;
    }
    float _1134 = _134;
    bool _1136 = _1036 >= 0.0;
    bool _1138 = isnan(_1036);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = -_1094;
    float _1148 = _1146 + 1.0;
    float _1150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1152 = _870 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1154 = isnan(_870);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1160 = _1156 || _1158;
    float _1162 = float(_1160);
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1166 = _1112 + _1164;
    int _1168 = _1144 ? 0 : 1;
    float _1170 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1172 = _1034 ? 0 : 1;
    float _1174 = _1162 * _1148;
    float _1176 = -_1162;
    float _1178 = _1176 + 1.0;
    float _1180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1182 = ~_1168;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = _1118 * _1174;
    int _1190 = ~_1172;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1198 = _1194;
    int _1200 = _1186;
    if (!_1022)
    {
        int _1202 = ~_1172;
        int _1204 = _1202 + 1;
        _1198 = _1204;
    }
    int _1206 = _1198;
    float _1208 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1188);
    bool _1210 = !_954;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1216 = float(_1206);
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1128 + _1218;
    int _1222 = abs(_1212);
    float _1224 = _1196 * _1150;
    if (!_1120)
    {
        int _1226 = ~_1168;
        int _1228 = _1226 + 1;
        _1200 = _1228;
    }
    int _1230 = _1200;
    float _1232 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1214);
    float _1234 = float(_1222);
    float _1236 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1208);
    float _1238 = floor(_960);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1232);
    float _1242 = in.m_59.x;
    float _1244 = in.m_59.y;
    float _1246 = in.m_59.z;
    float _1248 = _1234 * _1216;
    float _1250 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1252 = _966 * _1180;
    float _1254 = _996 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1256 = _1240 >= 0.0;
    float _1258 = _1250 * _896;
    float _1260 = _1126 * _1126;
    float _1262 = float(_1230);
    float _1264 = _1254 * _918;
    bool _1266 = !_958;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = fma(_1166, _1166, _1260);
    float _1272 = _1248 * (-2.0);
    float _1274 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1276 = _1238 > 0.0;
    float _1278 = fma(_1220, _1220, _1270);
    int _1280 = abs(_1268);
    float _1282 = fma(_1170, _1272, _1170);
    bool _1284 = _1238 >= 0.0;
    bool _1286 = isnan(_1238);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    float _1294 = _880 + (-0.5);
    float _1296 = float(_1280);
    float _1298 = rsqrt(_1278);
    int _1300 = _1292 ? 0 : 1;
    out.m_61.x = _904;
    out.m_61.y = _908;
    out.m_61.z = _920;
    out.m_61.w = _1274;
    float _1302 = fma(_1272, _1244, _1244);
    float _1304 = _1272;
    if (_1256)
    {
        _1304 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1306 = _1304;
    float _1308 = _906 + (-0.5);
    float _1310 = _1296 * _1262;
    bool _1312 = !_950;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = ~_1300;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1302);
    int _1324 = _1320;
    int _1326 = as_type<int>(_1306);
    if (!_1276)
    {
        int _1328 = ~_1300;
        int _1330 = _1328 + 1;
        _1324 = _1330;
    }
    int _1332 = _1324;
    float _1334 = _1310 * (-2.0);
    int _1336 = abs(_1314);
    if (_1256)
    {
        float _1338 = _1306 * 5.0;
        _1326 = as_type<int>(_1338);
    }
    int _1340 = _1326;
    float _1342 = fma(_1282, _1134, _1322);
    float _1344 = fma(_1334, _1246, _1246);
    float _1346 = _1126 * _1298;
    out.m_63.x = _1252;
    out.m_63.y = _1258;
    out.m_63.z = _1264;
    out.m_63.w = _1224;
    float _1348 = _1166 * _1298;
    float _1350 = float(_1336);
    float _1352 = _1220 * _1298;
    if (_1256)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4787 = as_type<float>(_1340);
        out.gl_Position.z = _4787;
    }
    float _1354 = -_1346;
    float _1356 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    if (_1256)
    {
        out.m_47.x = 0.0;
    }
    float _1358 = fma(_1106, _1334, _1106);
    float _1360 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1344);
    if (_1256)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1362 = -_1346;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1366 = -_1348;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1112);
    float _1370 = float(_1332);
    float _1372 = -_1352;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1128);
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1378 = _1364 + _1376;
    float _1380 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1382 = _1368 + _1380;
    float _1384 = _154 + _906;
    float _1386 = _1350 * _1370;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1392 = _1374 + _1390;
    float _1394 = fma(_1358, _1134, _1360);
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1388);
    float _1398 = _1384 + (-1.0);
    float _1400 = _1386 * (-2.0);
    float _1402 = _154 + (-0.5);
    float _1404 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1396);
    float _1406 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1408 = fma(_1400, _1242, _1242);
    float _1410 = -_1348;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1166);
    float _1414 = _1356 * _1356;
    bool _1416 = _1404 >= 0.0;
    float _1418 = fma(_1406, _1400, _1406);
    float _1420 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1408);
    float _1422 = fma(_1412, _1412, _1414);
    float _1424 = -_1352;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1428 = _1342 * 0.15915493667125701904296875;
    float _1430 = fma(_1418, _1134, _1420);
    float _1432 = _1394 * 0.15915493667125701904296875;
    float _1434 = fma(_1426, _1426, _1422);
    float _1436 = _1428 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    float _1440 = _1430 * 0.15915493667125701904296875;
    float _1442 = _1370;
    float _1444 = _1368;
    if (_1416)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1446 = _1442;
    int _1448 = as_type<int>(_1446);
    if (_1416)
    {
        out.m_47.x = 0.0;
    }
    float _1450 = sqrt(_1434);
    if (_1416)
    {
        float _1452 = _1446 * 5.0;
        _1448 = as_type<int>(_1452);
    }
    int _1454 = _1448;
    if (_1416)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4974 = as_type<float>(_1454);
        out.gl_Position.z = _4974;
    }
    float _1456 = _1428 * 6.283185482025146484375;
    float _1458 = cos(_1456);
    float _1460 = _1432 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    float _1464 = _1432 * 6.283185482025146484375;
    float _1466 = cos(_1464);
    float _1468 = _1440 * 6.283185482025146484375;
    float _1470 = sin(_1468);
    if (_1416)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1472 = -_1048;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1476 = -_1112;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1480 = in.m_65.x;
    float _1482 = in.m_65.y;
    float _1484 = in.m_65.z;
    float _1486 = _1298 * _1450;
    float _1488 = _1474 * _1474;
    float _1490 = -_1128;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1440 * 6.283185482025146484375;
    float _1496 = cos(_1494);
    float _1498 = _1458 * _1466;
    float _1500 = fma(_1478, _1478, _1488);
    float _1502 = _1438 * _1462;
    float _1504 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1506 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1508 = fma(_1492, _1492, _1500);
    float _1510 = _1458 * _1462;
    float _1512 = _1438 * _1466;
    float _1514 = fma(_1470, _1502, _1498);
    float _1516 = rsqrt(_1508);
    float _1518 = fma(_1470, _1498, _1502);
    float _1520 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1522 = _1486 * _1504;
    float _1524 = -_1512;
    float _1526 = fma(_1470, _1510, _1524);
    float _1528 = -_1510;
    float _1530 = fma(_1470, _1512, _1528);
    float _1532 = _1462 * _1496;
    float _1534 = _1466 * _1496;
    float _1536 = _1438 * _1496;
    float _1538 = _1458 * _1496;
    float _1540 = _1486 * _1506;
    float _1542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1482);
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1480);
    bool _1546 = _1482 != 0.0;
    bool _1548 = isnan(_1482);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = _1486 * _1520;
    float _1558 = _1542 * _1540;
    float _1560 = _1478 * _1516;
    float _1562 = _1544 * _1522;
    float _1564 = _1492 * _1516;
    float _1566 = in.m_67.x;
    float _1568 = in.m_67.y;
    float _1570 = in.m_67.z;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1574 = _1560 * _1572;
    float _1576 = _1474 * _1516;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1580 = _1564 * _1578;
    bool _1582 = _1480 == 0.0;
    bool _1584 = !_1554;
    bool _1586 = _1582 && _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1590 = -_1574;
    float _1592 = fma(_1564, _1588, _1590);
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1596 = _1576 * _1594;
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1600 = -_1580;
    float _1602 = fma(_1576, _1598, _1600);
    bool _1604 = _1484 == 0.0;
    bool _1606 = _1604 && _1586;
    float _1608 = _1592 * _1592;
    float _1610 = in.m_69.x;
    float _1612 = in.m_69.y;
    float _1614 = in.m_69.z;
    float _1616 = in.m_69.w;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1620 = -_1596;
    float _1622 = fma(_1560, _1618, _1620);
    float _1624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1484);
    float _1626 = fma(_1602, _1602, _1608);
    float _1628 = _1534 * _1558;
    float _1630 = _1518 * _1558;
    float _1632 = _1624 * _1556;
    float _1634 = fma(_1622, _1622, _1626);
    float _1636 = _1530 * _1558;
    float _1638 = fma(_1532, _1562, _1628);
    float _1640 = fma(_1526, _1562, _1630);
    float _1642 = fma(_1514, _1562, _1636);
    float _1644 = rsqrt(_1634);
    float _1646 = _1628;
    float _1648 = _1562;
    float _1650 = _1566;
    float _1652 = _1568;
    if (_1606)
    {
        _1646 = _1566;
    }
    float _1654 = _1646;
    float _1656 = -_1470;
    float _1658 = fma(_1656, _1632, _1638);
    float _1660 = 0.0;
    float _1662 = _1654;
    if (_1606)
    {
        _1660 = _1568;
    }
    float _1664 = _1660;
    float _1666 = fma(_1536, _1632, _1642);
    float _1668 = _1664;
    if (_1606)
    {
        _1648 = _1654;
    }
    float _1670 = _1648;
    float _1672 = fma(_1538, _1632, _1640);
    float _1674 = _1670;
    if (!_1606)
    {
        _1662 = _1566;
    }
    float _1676 = _1662;
    if (_1606)
    {
        _1650 = _1664;
    }
    float _1678 = _1650;
    float _1680 = 0.0;
    float _1682 = _1678;
    if (_1606)
    {
        _1680 = _1570;
    }
    float _1684 = _1680;
    float _1686 = _1684;
    if (!_1606)
    {
        float _1688 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1676);
        _1674 = _1688;
    }
    float _1690 = _1674;
    if (!_1606)
    {
        _1668 = _1568;
    }
    float _1692 = _1668;
    if (_1606)
    {
        _1652 = _1684;
    }
    float _1694 = _1652;
    float _1696 = _1602 * _1644;
    float _1698 = _1694;
    if (!_1606)
    {
        _1686 = _1570;
    }
    float _1700 = _1686;
    if (!_1606)
    {
        float _1702 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1692);
        _1682 = _1702;
    }
    float _1704 = _1682;
    float _1706 = _1614 * _1676;
    float _1708 = _1592 * _1644;
    float _1710 = _1622 * _1644;
    float _1712 = _1576 * _1696;
    float _1714 = -_1706;
    float _1716 = fma(_1610, _1700, _1714);
    float _1718 = _1612 * _1700;
    float _1720 = _1564 * _1708;
    if (!_1606)
    {
        float _1722 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1700);
        _1698 = _1722;
    }
    float _1724 = _1698;
    float _1726 = _1610 * _1692;
    float _1728 = -_1718;
    float _1730 = fma(_1614, _1692, _1728);
    float _1732 = -_1720;
    float _1734 = fma(_1576, _1710, _1732);
    float _1736 = -_1712;
    float _1738 = fma(_1560, _1708, _1736);
    float _1740 = -_1726;
    float _1742 = fma(_1612, _1676, _1740);
    float _1744 = _1730 * _1616;
    float _1746 = _1734 * _1658;
    float _1748 = _1738 * _1658;
    float _1750 = _1716 * _1616;
    float _1752 = _1742 * _1616;
    float _1754 = fma(_1696, _1666, _1746);
    float _1756 = fma(_1710, _1666, _1748);
    float _1758 = _1560 * _1710;
    float _1760 = _1532 * _1734;
    float _1762 = fma(_1560, _1672, _1754);
    float _1764 = fma(_1564, _1672, _1756);
    float _1766 = -_1758;
    float _1768 = fma(_1564, _1696, _1766);
    float _1770 = _1534 * _1734;
    float _1772 = _1112 + _1762;
    float _1774 = _1128 + _1764;
    float _1776 = _1532 * _1768;
    float _1778 = _1532 * _1738;
    float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1782 = _1772 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1786 = _1774 + _1784;
    float _1788 = -_1734;
    float _1790 = _1470 * _1788;
    float _1792 = -_1738;
    float _1794 = _1470 * _1792;
    float _1796 = _1782 * _1782;
    float _1798 = _1786 * _1786;
    float _1800 = -_1768;
    float _1802 = _1470 * _1800;
    float _1804 = _1534 * _1768;
    float _1806 = _1534 * _1738;
    float _1808 = _1796 + _1798;
    float _1810 = fma(_1514, _1696, _1760);
    float _1812 = fma(_1514, _1708, _1776);
    float _1814 = fma(_1514, _1710, _1778);
    float _1816 = _1768 * _1658;
    float _1818 = sqrt(_1808);
    float _1820 = fma(_1530, _1696, _1770);
    float _1822 = fma(_1530, _1708, _1804);
    float _1824 = fma(_1530, _1710, _1806);
    float _1826 = fma(_1536, _1696, _1790);
    float _1828 = fma(_1708, _1666, _1816);
    float _1830 = fma(_1536, _1710, _1794);
    float _1832 = fma(_1536, _1708, _1802);
    float _1834 = fma(_1518, _1560, _1820);
    float _1836 = fma(_1518, _1576, _1822);
    float _1838 = fma(_1518, _1564, _1824);
    float _1840 = fma(_1576, _1672, _1828);
    float _1842 = fma(_1526, _1560, _1810);
    float _1844 = fma(_1538, _1560, _1826);
    float _1846 = fma(_1538, _1564, _1830);
    float _1848 = fma(_1526, _1576, _1812);
    bool _1850 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1852 = fma(_1538, _1576, _1832);
    float _1854 = _1834 * _1612;
    float _1856 = _1836 * _1612;
    float _1858 = _1838 * _1612;
    float _1860 = fma(_1526, _1564, _1814);
    float _1862 = _1834 * _1704;
    float _1864 = _1836 * _1704;
    float _1866 = _1750 * _1836;
    float _1868 = _1750 * _1834;
    float _1870 = _1838 * _1704;
    float _1872 = _1750 * _1838;
    float _1874 = _1048 + _1840;
    bool _1876 = !_1850;
    float _1878 = _1874;
    float _1880 = _1796;
    float _1882 = _1798;
    float _1884 = _1772;
    float _1886 = _1782;
    float _1888 = _1774;
    if (!_1876)
    {
        float _1890 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1894 = _1818 + _1892;
        float _1896 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1898 = rsqrt(_1808);
        float _1900 = _1894 * _1890;
        float _1902 = _1900 * 0.15915493667125701904296875;
        float _1904 = _1902 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        float _1908 = _1902 * 6.283185482025146484375;
        float _1910 = cos(_1908);
        float _1912 = fma(_1906, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1914 = _1898 * _1912;
        float _1916 = fma(_1782, _1914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1918 = _1910 + (-1.0);
        float _1920 = fma(_1786, _1914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1924 = _1916 + _1922;
        float _1926 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1930 = _1920 + _1928;
        float _1932 = _1924 * _1924;
        float _1934 = fma(_1874, _1910, _1926);
        float _1936 = _1930 * _1930;
        _1878 = _1934;
        _1880 = _1932;
        _1882 = _1936;
        _1884 = _1916;
        _1886 = _1926;
        _1888 = _1920;
    }
    float _1938 = _1878;
    float _1940 = _1880;
    float _1942 = _1882;
    float _1944 = _1884;
    float _1946 = _1886;
    float _1948 = _1888;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1952 = _1938 + _1950;
    float _1954 = fma(_1842, _1690, _1862);
    float _1956 = fma(_1848, _1690, _1864);
    float _1958 = fma(_1860, _1690, _1870);
    float _1960 = fma(_1952, _1952, _1940);
    float _1962 = fma(_1842, _1610, _1854);
    float _1964 = fma(_1848, _1610, _1856);
    float _1966 = fma(_1744, _1842, _1868);
    float _1968 = _1960 + _1942;
    float _1970 = fma(_1744, _1848, _1866);
    float _1972 = fma(_1860, _1610, _1858);
    float _1974 = fma(_1744, _1860, _1872);
    float _1976 = fma(_1844, _1724, _1954);
    float _1978 = fma(_1852, _1724, _1956);
    float _1980 = sqrt(_1968);
    float _1982 = fma(_1846, _1724, _1958);
    float _1984 = fma(_1844, _1614, _1962);
    float _1986 = fma(_1852, _1614, _1964);
    float _1988 = fma(_1752, _1844, _1966);
    float _1990 = fma(_1752, _1852, _1970);
    float _1992 = fma(_1846, _1614, _1972);
    float _1994 = fma(_1752, _1846, _1974);
    out.m_71.x = _1976;
    out.m_71.y = _1978;
    out.m_71.z = _1982;
    out.m_73.x = _1984;
    out.m_73.y = _1986;
    out.m_73.z = _1992;
    out.m_75.x = _1988;
    out.m_75.y = _1990;
    out.m_75.z = _1994;
    bool _1996 = _1980 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1998 = isnan(_1980);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2004 = _2000 || _2002;
    float _2006 = _1946;
    if (!_2004)
    {
        _2006 = 1.0;
    }
    float _2008 = _2006;
    bool _2010 = !_2004;
    float _2012 = _2008;
    if (!_2010)
    {
        bool _2014 = _1980 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2016 = isnan(_1980);
        bool _2018 = _2014 || _2016;
        bool _2020 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2022 = _2018 || _2020;
        if (!_2022)
        {
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = _1980 + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2030 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2028;
            float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2034 = _2032 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2036 = 1.0 / _2030;
            float _2038 = _2026 * _2036;
            float _2040 = fma(_2038, _2034, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2012 = _2040;
            _2042 = true;
        }
        else
        {
            bool _2044 = _1980 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2046 = isnan(_1980);
            bool _2048 = _2044 || _2046;
            bool _2050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2052 = _2048 || _2050;
            if (!_2052)
            {
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _1980 + _2054;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2062 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2064 = _2062 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2066 = 1.0 / _2060;
                float _2068 = _2056 * _2066;
                float _2070 = fma(_2068, _2064, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2012 = _2070;
                _2042 = true;
            }
            else
            {
                _2012 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2042 = false;
    float _2072 = _2012;
    float _2074 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2076 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2078 = _1944 + _2076;
    float _2080 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2074);
    float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2084 = _1938 + _2082;
    bool _2086 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan(0.5);
    bool _2094 = _2090 || _2092;
    float _2096 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2080);
    float _2098 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2100 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2102 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan(0.5);
    bool _2108 = _2104 || _2106;
    float _2110 = fma(_2084, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2112 = _2096 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2114 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2098);
    float _2116 = 1.0 / _2112;
    float _2118 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2114);
    float _2120 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2122 = _2120 + _2112;
    float _2124 = _2122 * _2116;
    float _2126 = _2124 * 0.5;
    float _2128 = -_1346;
    float _2130 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2110);
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2134 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2132);
    float _2136 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2138 = _1948 + _2136;
    float _2140 = fma(_2078, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2142 = 1.0 / _2134;
    float _2144 = fma(_2138, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2146 = -_1348;
    float _2148 = fma(_2146, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2140);
    float _2150 = _2138;
    float _2152 = _2130;
    float _2154 = _2148;
    float _2156 = _2134;
    if (_2108)
    {
        _2150 = 1.0;
    }
    float _2158 = _2150;
    float _2160 = -_1352;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2144);
    float _2164 = _2162;
    float _2166 = _2158;
    if (!_2094)
    {
        float _2168 = _1378 * _1378;
        float _2170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2172 = -_1128;
        float _2174 = _2172 + _2144;
        float _2176 = -_1048;
        float _2178 = _2176 + _2110;
        float _2180 = fma(_1382, _1382, _2168);
        float _2182 = fma(_1392, _1392, _2180);
        float _2184 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2186 = sqrt(_2182);
        float _2188 = 1.0 / _1486;
        float _2190 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2192 = precise::min(_2186, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2194 = _2192 * _2170;
        float _2196 = -_1112;
        float _2198 = _2196 + _2140;
        float _2200 = _2194 * _2188;
        float _2202 = _2190 * _2200;
        float _2204 = _2174 * _2200;
        float _2206 = fma(_2198, _2202, _1368);
        float _2208 = fma(_2178, _2202, _1364);
        float _2210 = fma(_2190, _2204, _1374);
        _2152 = _2208;
        _2154 = _2206;
        _2164 = _2210;
        _2156 = _2200;
    }
    float _2212 = _2152;
    float _2214 = _2154;
    float _2216 = _2164;
    float _2218 = _2156;
    float _2220 = _2218;
    if (_2108)
    {
        _2220 = 1.0;
    }
    float _2222 = _2220;
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2226 = _2142 * _2224;
    float _2228 = _2222;
    if (!_2108)
    {
        float _2230 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2232 = _2230 * 0.15915493667125701904296875;
        float _2234 = _2232 * 6.283185482025146484375;
        float _2236 = cos(_2234);
        float _2238 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2240 = _2238 * 0.15915493667125701904296875;
        float _2242 = _2232 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = 1.0 / _2236;
        float _2248 = _2240 * 6.283185482025146484375;
        float _2250 = cos(_2248);
        float _2252 = _2244 * _2246;
        float _2254 = _2240 * 6.283185482025146484375;
        float _2256 = sin(_2254);
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2260 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2258;
        float _2262 = _2250 * _2252;
        float _2264 = 1.0 / _2260;
        float _2266 = 1.0 / _2262;
        float _2268 = _2256 * _2266;
        float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2272 = fma(_2226, _2268, _2270);
        float _2274 = _2272 * _2264;
        float _2276 = precise::clamp(_2274, 0.0, 1.0);
        _1130 = _2264;
        _2166 = _2276;
    }
    float _2278 = _1130;
    float _2280 = _2166;
    float _2282 = _2278;
    if (!_2108)
    {
        float _2284 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2286 = _2284 * 0.15915493667125701904296875;
        float _2288 = _2286 * 6.283185482025146484375;
        float _2290 = cos(_2288);
        float _2292 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2294 = _2292 * 0.15915493667125701904296875;
        float _2296 = _2286 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = 1.0 / _2290;
        float _2302 = _2294 * 6.283185482025146484375;
        float _2304 = cos(_2302);
        float _2306 = _2298 * _2300;
        float _2308 = _2294 * 6.283185482025146484375;
        float _2310 = sin(_2308);
        float _2312 = _2304 * _2306;
        float _2314 = 1.0 / _2312;
        float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2318 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2316;
        float _2320 = 1.0 / _2318;
        float _2322 = _2310 * _2314;
        float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2326 = fma(_2226, _2322, _2324);
        float _2328 = _2326 * _2320;
        float _2330 = precise::clamp(_2328, 0.0, 1.0);
        float _2332 = -_2330;
        float _2334 = _2332 + 1.0;
        _2282 = _2312;
        _2228 = _2334;
    }
    float _2336 = _2282;
    float _2338 = _2228;
    float _2340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2342 = _2212 + _2340;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2346 = _2214 + _2344;
    float _2348 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2350 = _2216 + _2348;
    float _2352 = _2342 * _2342;
    float _2354 = fma(_2346, _2346, _2352);
    float _2356 = fma(_2350, _2350, _2354);
    float _2358 = rsqrt(_2356);
    float _2360 = sqrt(_2356);
    float _2362 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2364 = _2346 * _2362;
    float _2366 = _2350 * _2362;
    float _2368 = _2364 * _2364;
    float _2370 = _2366 * _2366;
    float _2372 = _2368 + _2370;
    float _2374 = sqrt(_2372);
    bool _2376 = _2374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2380 = _2374 + _2378;
    float _2382 = _2350;
    float _2384 = _2372;
    float _2386 = _2380;
    float _2388 = _2336;
    float _2390 = _2342;
    if (_2376)
    {
        float _2392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2382 = _2392;
    }
    float _2394 = _2382;
    if (_2376)
    {
        float _2396 = rsqrt(_2372);
        _2384 = _2396;
    }
    float _2398 = _2384;
    if (_2376)
    {
        float _2400 = _2380 * _2394;
        _2386 = _2400;
    }
    float _2402 = _2386;
    if (_2376)
    {
        float _2404 = _2402 * 0.15915493667125701904296875;
        _2388 = _2404;
    }
    float _2406 = _2388;
    float _2408 = _2352;
    float _2410 = _2406;
    if (_2376)
    {
        float _2412 = _2406 * 6.283185482025146484375;
        float _2414 = sin(_2412);
        _2408 = _2414;
    }
    float _2416 = _2408;
    float _2418 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2420 = precise::max(0.0, _2418);
    float _2422 = _2358;
    float _2424 = _2418;
    float _2426 = _2420;
    if (_2376)
    {
        float _2428 = _2406 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        _2422 = _2430;
    }
    float _2432 = _2422;
    float _2434 = -_2362;
    float _2436 = -_2420;
    float _2438 = fma(_2342, _2434, _2436);
    if (!_2376)
    {
        _2390 = _2366;
    }
    float _2440 = _2390;
    float _2442 = _2440;
    if (_2376)
    {
        float _2444 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2424 = _2444;
    }
    float _2446 = _2424;
    float _2448 = _2416;
    float _2450 = _2446;
    if (_2376)
    {
        float _2452 = fma(_2416, _2446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2426 = _2452;
    }
    float _2454 = _2426;
    float _2456 = _2454;
    if (!_2376)
    {
        _2448 = _2364;
    }
    float _2458 = _2448;
    float _2460 = _2458;
    float _2462 = _2432;
    if (_2376)
    {
        float _2464 = _2432 + (-1.0);
        _2450 = _2464;
    }
    float _2466 = _2450;
    float _2468 = _2466;
    if (_2376)
    {
        float _2470 = _2398 * _2454;
        _1444 = _2470;
    }
    float _2472 = _1444;
    if (!_2376)
    {
        _2456 = _2438;
    }
    float _2474 = _2456;
    float _2476 = _2474;
    if (_2376)
    {
        float _2478 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2410 = _2478;
    }
    float _2480 = _2410;
    if (_2376)
    {
        float _2482 = _2364 * _2472;
        _2460 = _2482;
    }
    float _2484 = _2460;
    if (!_2376)
    {
        _2468 = _2368;
    }
    float _2486 = _2468;
    float _2488 = _2486;
    if (_2376)
    {
        float _2490 = _2366 * _2472;
        _2442 = _2490;
    }
    float _2492 = _2442;
    if (_2376)
    {
        float _2494 = fma(_2438, _2432, _2480);
        _2476 = _2494;
    }
    float _2496 = _2476;
    if (_2376)
    {
        float _2498 = _2484 * _2484;
        _2488 = _2498;
    }
    float _2500 = _2488;
    if (!_2376)
    {
        _2462 = _2370;
    }
    float _2502 = _2462;
    float _2504 = _2502;
    if (_2376)
    {
        float _2506 = _2492 * _2492;
        _2504 = _2506;
    }
    float _2508 = _2504;
    float _2510 = fma(_2496, _2496, _2500);
    float _2512 = _2510 + _2508;
    float _2514 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2518 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2516);
    float _2520 = precise::clamp(_2518, 0.0, 1.0);
    float _2522 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2524 = rsqrt(_2512);
    float _2526 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2514);
    float _2528 = -_2520;
    float _2530 = _2528 + 1.0;
    float _2532 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2522);
    float _2534 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2536 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2526);
    float _2538 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2540 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2542 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2532);
    float _2544 = _2536 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2546 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2538);
    float _2548 = abs(_2530);
    float _2550 = log2(_2548);
    float _2552 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2540);
    float _2554 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2556 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2546);
    float _2558 = _2542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2560 = _2524 * _2484;
    float _2562 = -_2554;
    float _2564 = fma(_2562, _2534, 1.0);
    float _2566 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2568 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2570 = _2524 * _2496;
    float _2572 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2552);
    float _2574 = _2524 * _2492;
    float _2576 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2568);
    float _2578 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2580 = _2572 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2582 = log2(_2564);
    float _2584 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2586 = -_2578;
    float _2588 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2586);
    float _2590 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2576);
    float _2592 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2594 = -_2574;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2588);
    float _2598 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2590);
    float _2600 = exp2(_2584);
    float _2602 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2604 = fma(_2596, -0.5, 0.5);
    float _2606 = fma(_2596, 0.5, 0.5);
    float _2608 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2592);
    float _2610 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2602);
    float _2612 = _2570 + 1.0;
    float _2614 = fma(_2606, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2616 = 1.0 / _2598;
    float _2618 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2610);
    float _2620 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2608);
    float _2622 = fma(_2606, _2614, -0.212114393711090087890625);
    float _2624 = _2582 * 0.693147182464599609375;
    float _2626 = fma(_2606, _2622, 1.570728778839111328125);
    float _2628 = sqrt(_2604);
    float _2630 = -_2570;
    float _2632 = fma(_2600, _2612, _2630);
    float _2634 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2618);
    float _2636 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2620);
    float _2638 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2640 = fma(_2632, 0.5, 0.5);
    float _2642 = _2634 * _2616;
    float _2644 = _2636 * _2616;
    float _2646 = fma(_2642, 0.5, 0.5);
    float _2648 = fma(_2644, -0.5, 0.5);
    float _2650 = _2628 * 0.636619746685028076171875;
    float3 _6867 = float3(_2646, _2648, _2638);
    float _2652 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6867, float3(0.0), isnan(_6867)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6867, float3(0.0), isnan(_6867)), level(0.0)).x;
    float3 _6878 = float3(_2646, _2648, _2638);
    float4 _2655 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6878, float3(0.0), isnan(_6878)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6878, float3(0.0), isnan(_6878)), level(0.0)).xyzw;
    float _2657 = _2655.x;
    float _2659 = _2655.y;
    float _2661 = _2655.z;
    float _2663 = _2655.w;
    float _2665 = -_2626;
    float _2667 = fma(_2650, _2665, 1.0);
    float2 _6900 = float2(_2667, _2640);
    float3 _2671 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6900, float2(0.0), isnan(_6900)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6900, float2(0.0), isnan(_6900)), level(0.0)).xyz;
    float _2673 = _2671.x;
    float _2675 = _2671.y;
    float _2677 = _2671.z;
    float _2679 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2681 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2683 = _2280 * _2338;
    bool _2685 = _2280 > 0.0;
    bool _2687 = isnan(_2280);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    float _2695 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2681);
    float _2697 = exp2(_2679);
    float _2699 = _2683 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2701 = _2338 <= 0.0;
    bool _2703 = !_2693;
    bool _2705 = _2701 || _2703;
    float _2707 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2695);
    float _2709 = _380 * _2699;
    float _2711 = _2634 + _2598;
    float _2713 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2707);
    float _2715 = _2598 * 0.5;
    float _2717 = _2711 * 0.5;
    float _2719 = _2713 + _2598;
    float _2721 = fma(_2636, -0.5, _2715);
    float _2723 = _2709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2634;
    out.gl_Position.y = _2636;
    out.gl_Position.z = _2713;
    out.gl_Position.w = _2598;
    float _2725 = _2719 * 0.5;
    float _2727 = -_2697;
    float _2729 = _2727 + 1.0;
    out.m_47.x = _2723;
    float _2731 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.x = _2717;
    out.m_77.y = _2721;
    out.m_77.z = _2725;
    out.m_77.w = _2598;
    float _2733 = -_2731;
    float _2735 = _2733 + 1.0;
    float _2737 = _2731 * _2652;
    float _2739 = _2663 * _2737;
    float _2741 = _2663 * _2735;
    float _2743 = _2677 * _2737;
    float _2745 = fma(_2673, _2739, _2657);
    float _2747 = fma(_2675, _2739, _2659);
    float _2749 = fma(_2663, _2743, _2661);
    out.m_79.x = _2745;
    out.m_79.y = _2747;
    out.m_79.z = _2749;
    out.m_79.w = _2741;
    if (!_2705)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2751 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2751;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

