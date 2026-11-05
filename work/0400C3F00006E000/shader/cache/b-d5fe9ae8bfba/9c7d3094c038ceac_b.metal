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
    float4 m_53 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _736 = false;
    bool _592 = false;
    bool _466 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
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
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2042 = as_type<float>(_114);
        out.gl_Position.z = _2042;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_47.w;
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
        _108 = _136;
    }
    float _138 = _108;
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
        out.m_45.x = 0.0;
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
        float _2112 = as_type<float>(_152);
        out.gl_Position.z = _2112;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_49.w;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _278 = _274;
    float _296;
    if (!_276)
    {
        float _280 = in.m_51.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_98);
        float _302 = 1.0 / _300;
        float _304 = _132 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _306 + _324;
    bool _328 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_306);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _348 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _350 = isnan(_306);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _342;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = 1.0 / _346;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _366;
    float _370 = _310 * _360;
    float _372 = -_322;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = fma(_368, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _382 = _358 * _374;
    float _384 = -_358;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _388;
    float _392 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _326 * _364;
    float _396 = _338 * _386;
    float _398 = fma(_390, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = -_338;
    float _402 = _400 + 1.0;
    float _404 = _380 * _396;
    float _406 = _398 * _396;
    float _408 = _392 * _396;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _424 = fma(_412, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_416, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_420, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _432 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _434 = fma(_424, _382, _422);
    float _436 = fma(_426, _382, _430);
    float _438 = fma(_428, _382, _432);
    float _440 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[145].x, _434);
    float _442 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[145].y, _436);
    float _444 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[145].z, _438);
    bool _446 = !_362;
    float _464;
    if (!_446)
    {
        float _448 = in.m_51.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_98);
        float _470 = 1.0 / _468;
        float _472 = _132 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = in.m_49.x;
    float _478 = in.m_49.y;
    float _480 = in.m_49.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _484 = _474 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _486;
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _492 = 1.0 / _488;
    float _494 = _442 * _478;
    float _496 = _484 * _492;
    bool _498 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _500 = isnan(_474);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _444 * _480;
    bool _512 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _514 = isnan(_474);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _528;
    float _532 = -_508;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _536;
    float _540 = fma(_526, _496, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _542 = fma(_530, _496, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _544 = _522 * _534;
    float _546 = fma(_538, _496, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _548 = -_522;
    float _550 = _548 + 1.0;
    float _552 = _540 * _544;
    float _554 = _542 * _544;
    float _556 = _546 * _544;
    float _558 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].x, _552);
    float _560 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].y, _554);
    float _562 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _564 = _440 * _476;
    float _566 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[108].x, _558);
    float _568 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[108].y, _560);
    float _570 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[108].z, _562);
    bool _572 = !_490;
    float _590;
    if (!_572)
    {
        float _574 = in.m_51.x;
        float _576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _578 = _574 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _582 = _580 * _576;
        float _584 = floor(_582);
        float _586 = -_584;
        float _588 = _582 + _586;
        _590 = _588;
        _592 = true;
    }
    else
    {
        float _594 = float(_98);
        float _596 = 1.0 / _594;
        float _598 = _132 * _596;
        _590 = _598;
    }
    _592 = false;
    float _600 = _590;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = isnan(_600);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _622 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _624 = isnan(_600);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = 1.0 / _604;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _636;
    float _640 = -_616;
    float _642 = _640 + 1.0;
    bool _644 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _646 = isnan(_600);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    bool _656 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _658 = 1.0 / _620;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _664 = _638 * _634;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _668 = _600 + _666;
    float _670 = fma(_664, _668, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = _632 * _642;
    float _674 = -_632;
    float _676 = _674 + 1.0;
    float _678 = _662 * _658;
    float _680 = -_654;
    float _682 = _680 + 1.0;
    float _684 = _670 * _672;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _688 = _600 + _686;
    float _690 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _692 = _616 * _682;
    float _694 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[115].x, _684);
    float _696 = fma(_678, _688, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _698 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _700 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = fma(_696, _692, _694);
    float _706 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[117].x, _704);
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _702;
    out.m_53.y = _710;
    out.m_53.z = _706;
    out.m_53.w = _712;
    bool _714 = !_656;
    float _716 = _702;
    float _734;
    if (!_714)
    {
        float _718 = in.m_51.x;
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _722 = _718 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _726 = _724 * _720;
        float _728 = floor(_726);
        float _730 = -_728;
        float _732 = _726 + _730;
        _734 = _732;
        _736 = true;
    }
    else
    {
        float _738 = float(_98);
        float _740 = 1.0 / _738;
        float _742 = _132 * _740;
        _734 = _742;
    }
    _736 = false;
    float _744 = _734;
    float _746 = in.m_51.z;
    float _748 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _752 = _750 != 0;
    float _754 = in.m_51.x;
    float _756 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _768 = _766 != 0;
    float _770 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _772 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _774 = log2(_772);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _778 = _710;
    if (!_752)
    {
        float _780 = in.m_51.y;
        _778 = _780;
    }
    float _782 = _778;
    float _784 = _746 * 2.0;
    float _786 = _754 * 2.0;
    float _788 = floor(_784);
    float _790 = floor(_786);
    if (!_752)
    {
        _716 = _782;
    }
    float _792 = _716;
    float _794 = _792;
    float _796 = _782;
    if (_752)
    {
        float _798 = in.m_51.x;
        float _800 = in.m_51.y;
        _794 = _798;
        _796 = _800;
    }
    float _802 = _794;
    float _804 = _796;
    bool _806 = _788 >= 0.0;
    bool _808 = isnan(_788);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    bool _816 = _788 > 0.0;
    int _818 = _814 ? 0 : 1;
    float _820 = _788;
    if (!_752)
    {
        _820 = _746;
    }
    float _822 = _820;
    bool _824 = _790 > 0.0;
    bool _826 = _790 >= 0.0;
    bool _828 = isnan(_790);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _840 = ~_818;
    int _842 = _840 + 1;
    int _844 = _842 + 1;
    int _846 = _844;
    float _848 = _822;
    if (!_816)
    {
        int _850 = ~_818;
        int _852 = _850 + 1;
        _846 = _852;
    }
    int _854 = _846;
    int _856 = _834 ? 0 : 1;
    bool _858 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(1.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    int _868 = ~_856;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    int _874 = _872;
    if (_752)
    {
        _848 = _804;
    }
    float _876 = _848;
    float _878 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].z, _776);
    float _880 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _882 = _746 + _804;
    float _884 = _876;
    if (!_824)
    {
        int _886 = ~_856;
        int _888 = _886 + 1;
        _874 = _888;
    }
    int _890 = _874;
    float _892 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[83].w, _838);
    float _894 = _774 * _132;
    float _896 = _754 + _804;
    float _898 = -_836;
    float _900 = fma(_880, 2.0, _898);
    if (!_752)
    {
        _884 = _746;
    }
    float _902 = _884;
    float _904 = _882 + (-1.0);
    float _906 = _896 + (-1.0);
    float _908 = _902;
    if (_752)
    {
        _908 = _804;
    }
    float _910 = _908;
    float _912 = exp2(_894);
    float _914 = _804 * 2.0;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _920 = _910 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _922 = !_764;
    int _924 = _922 ? 0 : 1;
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _928 = float(_890);
    float _930 = fma(_920, -2.0, _916);
    bool _932 = !_760;
    int _934 = _932 ? 0 : 1;
    float _936 = floor(_914);
    int _938 = abs(_924);
    float _940 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _930);
    float _942 = in.m_55.x;
    float _944 = in.m_55.y;
    float _946 = in.m_55.z;
    int _948 = abs(_934);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _952 = 1.0 + _950;
    float _954 = -_912;
    float _956 = _954 + 1.0;
    bool _958 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _966 = _962 || _964;
    float _968 = _804 + (-0.5);
    float _970 = 1.0 / _952;
    float _972 = float(_948);
    float _974 = float(_938);
    float _976 = float(_854);
    bool _978 = _936 > 0.0;
    float _980 = _974 * _928;
    float _982 = _966 ? _956 : 0.0;
    float _984 = _972 * _976;
    float _986 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _878);
    bool _988 = _936 >= 0.0;
    bool _990 = isnan(_936);
    bool _992 = _988 || _990;
    bool _994 = isnan(0.0);
    bool _996 = _992 || _994;
    float _998 = -_132;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[81].x, _900);
    float _1002 = _984 * (-2.0);
    bool _1004 = !_768;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _892);
    if (_866)
    {
        float _1010 = _982 * _970;
        _134 = _1010;
    }
    float _1012 = _134;
    float _1014 = _754 + (-0.5);
    float _1016 = fma(_1002, _942, _942);
    int _1018 = _996 ? 0 : 1;
    float _1020 = fma(_918, _1002, _918);
    int _1022 = abs(_1006);
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1016);
    int _1026 = ~_1018;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    float _1032 = _754 + _746;
    float _1034 = fma(_1020, _1012, _1024);
    int _1036 = _1030;
    if (!_978)
    {
        int _1038 = ~_1018;
        int _1040 = _1038 + 1;
        _1036 = _1040;
    }
    int _1042 = _1036;
    float _1044 = _980 * (-2.0);
    float _1046 = float(_1022);
    float _1048 = _1032 + (-1.0);
    float _1050 = float(_1042);
    float _1052 = fma(_926, _1044, _926);
    float _1054 = fma(_1044, _944, _944);
    float _1056 = _1034 * 0.15915493667125701904296875;
    float _1058 = _1046 * _1050;
    float _1060 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1054);
    float _1062 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1064 = _1058 * (-2.0);
    float _1066 = _746 + (-0.5);
    float _1068 = fma(_1052, _1012, _1060);
    float _1070 = _1056 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = fma(_1064, _946, _946);
    float _1076 = in.m_57.x;
    float _1078 = in.m_57.y;
    float _1080 = in.m_57.z;
    float _1082 = fma(_1062, _1064, _1062);
    float _1084 = _1068 * 0.15915493667125701904296875;
    float _1086 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1074);
    float _1088 = _1056 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = fma(_1082, _1012, _1086);
    float _1094 = _1092 * 0.15915493667125701904296875;
    float _1096 = _1084 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = _1084 * 6.283185482025146484375;
    float _1102 = cos(_1100);
    float _1104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1078);
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1076);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1080);
    float _1110 = _748 * _1104;
    float _1112 = _756 * _1106;
    float _1114 = _1094 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1072 * _1098;
    float _1120 = _1090 * _1098;
    float _1122 = _770 * _1108;
    float _1124 = _1094 * 6.283185482025146484375;
    float _1126 = sin(_1124);
    float _1128 = _1090 * _1102;
    float _1130 = _1072 * _1102;
    float _1132 = _1090 * _1116;
    float _1134 = _1072 * _1116;
    float _1136 = _1102 * _1116;
    float _1138 = _1098 * _1116;
    float _1140 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1142 = _1134 * _1110;
    float _1144 = fma(_1126, _1128, _1118);
    float _1146 = fma(_1126, _1118, _1128);
    float _1148 = _1132 * _1110;
    float _1150 = -_1120;
    float _1152 = fma(_1126, _1130, _1150);
    float _1154 = -_1130;
    float _1156 = fma(_1126, _1120, _1154);
    float _1158 = -_1110;
    float _1160 = _1126 * _1158;
    float _1162 = fma(_1144, _1112, _1148);
    float _1164 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1166 = fma(_1152, _1112, _1142);
    float _1168 = fma(_1136, _1112, _1160);
    float _1170 = fma(_1156, _1122, _1162);
    float _1172 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1164);
    float _1174 = fma(_1146, _1122, _1166);
    float _1176 = fma(_1138, _1122, _1168);
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1180 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1140);
    float _1182 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1172);
    float _1184 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1186 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1178);
    float _1188 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1180);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1184);
    float _1194 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1198 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1200 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1192);
    float _1202 = _1190 + _1194;
    float _1204 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1206 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1198);
    float _1208 = _1196 + _1200;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1212 = _1202 + _1210;
    float _1214 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1204);
    float _1216 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1206);
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1220 = _1208 + _1218;
    float _1222 = _1212 * _1212;
    float _1224 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1214);
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1228 = fma(_1220, _1220, _1222);
    float _1230 = _1226 + _1224;
    float _1232 = sqrt(_1228);
    bool _1234 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = _1226;
    float _1238 = _1204;
    float _1240 = _1174;
    float _1242 = _1232;
    float _1244 = _1230;
    float _1246 = _1228;
    if (!_1234)
    {
        _1236 = _1208;
    }
    float _1248 = _1236;
    float _1250 = _1248;
    if (!_1234)
    {
        _1238 = _1202;
    }
    float _1252 = _1238;
    float _1254 = _1252;
    if (!_1234)
    {
        _278 = _1230;
    }
    float _1256 = _278;
    bool _1258 = !_1234;
    float _1260 = _1256;
    if (!_1258)
    {
        float _1262 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1266 = _1232 + _1264;
        float _1268 = rsqrt(_1228);
        float _1270 = _1266 * _1262;
        float _1272 = _1230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1274 = _1270 * 0.15915493667125701904296875;
        float _1276 = _1274 * 6.283185482025146484375;
        float _1278 = cos(_1276);
        float _1280 = _1274 * 6.283185482025146484375;
        float _1282 = sin(_1280);
        float _1284 = _1278 + (-1.0);
        float _1286 = fma(_1282, _1272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1288 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = _1268 * _1286;
        float _1292 = fma(_1230, _1278, _1288);
        float _1294 = fma(_1220, _1290, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1296 = fma(_1212, _1290, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1260 = _1292;
        _1250 = _1294;
        _1254 = _1296;
        _1240 = _1274;
        _1242 = _1284;
    }
    float _1298 = _1260;
    float _1300 = _1250;
    float _1302 = _1254;
    float _1304 = _1240;
    float _1306 = _1242;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1310 = _1298 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1314 = _1300 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1318 = _1302 + _1316;
    float _1320 = _1310 * _1310;
    float _1322 = fma(_1314, _1314, _1320);
    float _1324 = fma(_1318, _1318, _1322);
    float _1326 = rsqrt(_1324);
    float _1328 = sqrt(_1324);
    float _1330 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1332 = _1314 * _1330;
    float _1334 = _1318 * _1330;
    float _1336 = _1332 * _1332;
    float _1338 = _1334 * _1334;
    float _1340 = _1336 + _1338;
    float _1342 = sqrt(_1340);
    bool _1344 = _1342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1348 = _1342 + _1346;
    float _1350 = _1304;
    float _1352 = _1348;
    if (_1344)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1350 = _1354;
    }
    float _1356 = _1350;
    if (_1344)
    {
        float _1358 = rsqrt(_1340);
        _1244 = _1358;
    }
    float _1360 = _1244;
    float _1362 = _1360;
    if (_1344)
    {
        float _1364 = _1348 * _1356;
        _1352 = _1364;
    }
    float _1366 = _1352;
    if (_1344)
    {
        float _1368 = _1366 * 0.15915493667125701904296875;
        _1246 = _1368;
    }
    float _1370 = _1246;
    float _1372 = _1306;
    float _1374 = _1370;
    if (_1344)
    {
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1372 = _1378;
    }
    float _1380 = _1372;
    float _1382 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1384 = precise::max(0.0, _1382);
    float _1386 = _1220;
    float _1388 = _1384;
    float _1390 = _1382;
    if (_1344)
    {
        float _1392 = _1370 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        _1386 = _1394;
    }
    float _1396 = _1386;
    float _1398 = -_1330;
    float _1400 = -_1384;
    float _1402 = fma(_1310, _1398, _1400);
    if (_1344)
    {
        float _1404 = _1402 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1388 = _1404;
    }
    float _1406 = _1388;
    float _1408 = _1406;
    float _1410 = _1380;
    if (_1344)
    {
        float _1412 = fma(_1380, _1406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1408 = _1412;
    }
    float _1414 = _1408;
    float _1416 = _1414;
    if (!_1344)
    {
        _1410 = _1402;
    }
    float _1418 = _1410;
    float _1420 = _1418;
    float _1422 = _1396;
    if (_1344)
    {
        float _1424 = _1396 + (-1.0);
        _1390 = _1424;
    }
    float _1426 = _1390;
    float _1428 = 0.0;
    float _1430 = _1426;
    if (_1344)
    {
        float _1432 = _1360 * _1414;
        _1428 = _1432;
    }
    float _1434 = _1428;
    if (!_1344)
    {
        _1362 = _1332;
    }
    float _1436 = _1362;
    float _1438 = _1436;
    if (_1344)
    {
        float _1440 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1440;
    }
    float _1442 = _1374;
    if (_1344)
    {
        float _1444 = _1332 * _1434;
        _1438 = _1444;
    }
    float _1446 = _1438;
    if (!_1344)
    {
        _1430 = _1334;
    }
    float _1448 = _1430;
    float _1450 = _1448;
    if (_1344)
    {
        float _1452 = _1334 * _1434;
        _1450 = _1452;
    }
    float _1454 = _1450;
    if (!_1344)
    {
        _1416 = _1336;
    }
    float _1456 = _1416;
    float _1458 = _1456;
    if (_1344)
    {
        float _1460 = fma(_1402, _1396, _1442);
        _1420 = _1460;
    }
    float _1462 = _1420;
    if (_1344)
    {
        float _1464 = _1446 * _1446;
        _1458 = _1464;
    }
    float _1466 = _1458;
    if (!_1344)
    {
        _1422 = _1338;
    }
    float _1468 = _1422;
    float _1470 = _1468;
    if (_1344)
    {
        float _1472 = _1454 * _1454;
        _1470 = _1472;
    }
    float _1474 = _1470;
    float _1476 = fma(_1462, _1462, _1466);
    float _1478 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = _1476 + _1474;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1484 = fma(_1328, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1482);
    float _1486 = precise::clamp(_1484, 0.0, 1.0);
    float _1488 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1490 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1492 = rsqrt(_1480);
    float _1494 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1496 = -_1486;
    float _1498 = _1496 + 1.0;
    float _1500 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1502 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1488);
    float _1504 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1494);
    float _1506 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1500);
    float _1508 = abs(_1498);
    float _1510 = log2(_1508);
    float _1512 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1514 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1504);
    float _1516 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1506);
    float _1518 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1522 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1524 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1526 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1518);
    float _1528 = _1492 * _1446;
    float _1530 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1532 = _1492 * _1462;
    float _1534 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1526);
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1538 = -_1520;
    float _1540 = fma(_1538, _1490, 1.0);
    float _1542 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1530);
    float _1544 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1546 = _1492 * _1454;
    float _1548 = -_1536;
    float _1550 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1548);
    float _1552 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1554 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1542);
    float _1556 = log2(_1540);
    float _1558 = -_1546;
    float _1560 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1550);
    float _1562 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1564 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1554);
    float _1566 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1568 = fma(_1560, -0.5, 0.5);
    float _1570 = fma(_1560, 0.5, 0.5);
    float _1572 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1562);
    float _1574 = exp2(_1552);
    float _1576 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1566);
    float _1578 = _1532 + 1.0;
    float _1580 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1572);
    float _1582 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1576);
    float _1584 = fma(_1570, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1586 = 1.0 / _1564;
    float _1588 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1582);
    float _1590 = _1556 * 0.693147182464599609375;
    float _1592 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1594 = sqrt(_1568);
    float _1596 = -_1532;
    float _1598 = fma(_1574, _1578, _1596);
    float _1600 = fma(_1570, _1584, -0.212114393711090087890625);
    float _1602 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1580);
    float _1604 = fma(_1598, 0.5, 0.5);
    float _1606 = fma(_1570, _1600, 1.570728778839111328125);
    float _1608 = _1588 * _1586;
    float _1610 = _1602 * _1586;
    float _1612 = fma(_1608, 0.5, 0.5);
    float _1614 = fma(_1610, -0.5, 0.5);
    float _1616 = _1594 * 0.636619746685028076171875;
    float _1618 = -_1606;
    float _1620 = fma(_1616, _1618, 1.0);
    float3 _4427 = float3(_1612, _1614, _1592);
    float _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4427, float3(0.0), isnan(_4427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4427, float3(0.0), isnan(_4427)), level(0.0)).x;
    float3 _4438 = float3(_1612, _1614, _1592);
    float4 _1625 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4438, float3(0.0), isnan(_4438)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4438, float3(0.0), isnan(_4438)), level(0.0)).xyzw;
    float _1627 = _1625.x;
    float _1629 = _1625.y;
    float _1631 = _1625.z;
    float _1633 = _1625.w;
    float2 _4455 = float2(_1620, _1604);
    float3 _1637 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4455, float2(0.0), isnan(_4455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4455, float2(0.0), isnan(_4455)), level(0.0)).xyz;
    float _1639 = _1637.x;
    float _1641 = _1637.y;
    float _1643 = _1637.z;
    float _1645 = in.m_59.y;
    float _1647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1649 = in.m_51.w;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1655 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1661 = 1.0 / _1653;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1665 = _1663 != 0;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1671;
    int _1675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1677 = _1675 != 0;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1685 = _744 + _1683;
    float _1687 = 1.0 / _1659;
    bool _1689 = _746 > 0.5;
    bool _1691 = _1689 && _1677;
    float _1693 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1695 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1697 = isnan(_744);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    out.m_61.x = _1314;
    out.m_61.y = _1310;
    out.m_61.z = _1318;
    bool _1707 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1709 = isnan(_744);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1715 = _1711 || _1713;
    float _1717 = float(_1715);
    float _1719 = -_1645;
    float _1721 = _1719 + 1.0;
    float _1723 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1693);
    float _1725 = _1673 * _1661;
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1729 = _744 + _1727;
    bool _1731 = _1649 > 0.5;
    float _1733 = 1.0 / _1669;
    float _1735 = in.m_59.x;
    float _1737 = fma(_1725, _1729, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1739 = _1645;
    if (_1665)
    {
        float _1741 = _1731 ? _1721 : _1645;
        _1739 = _1741;
    }
    float _1743 = _1739;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1745;
    float _1749 = in.m_63.x;
    float _1751 = in.m_63.y;
    float _1753 = in.m_63.z;
    bool _1755 = _1078 != 0.0;
    bool _1757 = isnan(_1078);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(0.0);
    bool _1763 = _1759 || _1761;
    float _1765 = -_1705;
    float _1767 = _1765 + 1.0;
    bool _1769 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1771 = isnan(_744);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = _1747 * _1687;
    bool _1783 = _1076 == 0.0;
    bool _1785 = !_1763;
    bool _1787 = _1783 && _1785;
    float _1789 = exp2(_1655);
    bool _1791 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1793 = isnan(_744);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1799 = _1795 || _1797;
    float _1801 = float(_1799);
    float _1803 = -_1779;
    float _1805 = _1803 + 1.0;
    bool _1807 = _1080 == 0.0;
    bool _1809 = _1807 && _1787;
    float _1811 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1723);
    float _1813 = _1681 * _1733;
    float _1815 = _1801 * _1805;
    float _1817 = -_1801;
    float _1819 = _1817 + 1.0;
    float _1821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1823 = fma(_1813, _1685, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1825 = _1705 * _1819;
    float _1827 = _1717 * _1767;
    float _1829 = -_1717;
    float _1831 = _1829 + 1.0;
    float _1833 = 0.0;
    float _1835 = _1735;
    if (_1677)
    {
        _1833 = _1735;
    }
    float _1837 = _1833;
    out.m_65.x = _1300;
    out.m_65.y = _1298;
    out.m_65.z = _1302;
    float _1839 = _1737 * _1827;
    float _1841 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1843 = _1751;
    float _1845 = _1749;
    float _1847 = _1837;
    float _1849 = _1753;
    if (!_1809)
    {
        float _1851 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1751);
        _1843 = _1851;
    }
    float _1853 = _1843;
    if (!_1809)
    {
        float _1855 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1749);
        _1845 = _1855;
    }
    float _1857 = _1845;
    if (_1691)
    {
        float _1859 = -_1837;
        float _1861 = _1859 + 1.0;
        _1847 = _1861;
    }
    float _1863 = _1847;
    if (!_1809)
    {
        float _1865 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1753);
        _1849 = _1865;
    }
    float _1867 = _1849;
    float _1869 = -_1853;
    float _1871 = _1126 * _1869;
    float _1873 = _1132 * _1853;
    float _1875 = _1134 * _1853;
    if (_1677)
    {
        _1835 = _1863;
    }
    float _1877 = _1835;
    float _1879 = fma(_1136, _1857, _1871);
    float _1881 = fma(_1144, _1857, _1873);
    float _1883 = fma(_1152, _1857, _1875);
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1887 = _744 + _1885;
    float _1889 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1891 = fma(_1138, _1867, _1879);
    float _1893 = fma(_1156, _1867, _1881);
    float _1895 = fma(_1146, _1867, _1883);
    float _1897 = fma(_1889, _1877, -0.5);
    float _1899 = in.m_67.w;
    float _1901 = fma(_1841, _1743, -0.5);
    float _1903 = fma(_986, _1897, _1000);
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1907 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1909 = -_940;
    float _1911 = fma(_1008, _1901, _1909);
    float _1913 = -_1789;
    float _1915 = _1913 + 1.0;
    float _1917 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1839);
    float _1919 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1921 = fma(_1891, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1905);
    float _1923 = _1903 + 0.5;
    float _1925 = fma(_1891, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1907);
    float _1927 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1811);
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1931 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1933 = fma(_1781, _1887, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1935 = fma(_1823, _1825, _1917);
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1939 = fma(_1895, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1921);
    float _1941 = _1927 + _1564;
    float _1943 = fma(_1933, _1815, _1935);
    float _1945 = _1911 + 0.5;
    float _1947 = _1941 * 0.5;
    float _1949 = fma(_1891, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1919);
    float _1951 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1943);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_69.w = _1899;
    float _1955 = fma(_1895, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1949);
    float _1957 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1959 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1961 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1963 = _1951 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1965 = fma(_1895, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1925);
    float _1967 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1923;
    out.m_71.w = _1945;
    out.m_73.x = _1959;
    out.m_73.y = _1957;
    out.m_73.z = _1961;
    out.m_73.w = _1963;
    out.m_75.x = _1939;
    out.m_75.y = _1955;
    out.m_75.z = _1965;
    out.gl_Position.x = _1588;
    out.gl_Position.y = _1602;
    out.gl_Position.z = _1927;
    out.gl_Position.w = _1564;
    out.m_77.z = _1947;
    out.m_77.w = _1564;
    out.m_45.x = _1967;
    float _1969 = _1931 * _1622;
    float _1971 = -_1931;
    float _1973 = _1971 + 1.0;
    float _1975 = _1633 * _1969;
    float _1977 = _1643 * _1969;
    float _1979 = _1633 * _1973;
    float _1981 = fma(_1639, _1975, _1627);
    float _1983 = fma(_1641, _1975, _1629);
    float _1985 = fma(_1633, _1977, _1631);
    out.m_79.x = _1981;
    out.m_79.y = _1983;
    out.m_79.z = _1985;
    out.m_79.w = _1979;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _736 = false;
    bool _592 = false;
    bool _466 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
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
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2042 = as_type<float>(_114);
        out.gl_Position.z = _2042;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_47.w;
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
        _108 = _136;
    }
    float _138 = _108;
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
        out.m_45.x = 0.0;
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
        float _2112 = as_type<float>(_152);
        out.gl_Position.z = _2112;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_49.w;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _278 = _274;
    float _296;
    if (!_276)
    {
        float _280 = in.m_51.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_98);
        float _302 = 1.0 / _300;
        float _304 = _132 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _306 + _324;
    bool _328 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_306);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _348 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _350 = isnan(_306);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _342;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = 1.0 / _346;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _366;
    float _370 = _310 * _360;
    float _372 = -_322;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = fma(_368, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _382 = _358 * _374;
    float _384 = -_358;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _388;
    float _392 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _326 * _364;
    float _396 = _338 * _386;
    float _398 = fma(_390, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = -_338;
    float _402 = _400 + 1.0;
    float _404 = _380 * _396;
    float _406 = _398 * _396;
    float _408 = _392 * _396;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _424 = fma(_412, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_416, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_420, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _432 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _434 = fma(_424, _382, _422);
    float _436 = fma(_426, _382, _430);
    float _438 = fma(_428, _382, _432);
    float _440 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[145].x, _434);
    float _442 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[145].y, _436);
    float _444 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[145].z, _438);
    bool _446 = !_362;
    float _464;
    if (!_446)
    {
        float _448 = in.m_51.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_98);
        float _470 = 1.0 / _468;
        float _472 = _132 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = in.m_49.x;
    float _478 = in.m_49.y;
    float _480 = in.m_49.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _484 = _474 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _486;
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _492 = 1.0 / _488;
    float _494 = _442 * _478;
    float _496 = _484 * _492;
    bool _498 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _500 = isnan(_474);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _444 * _480;
    bool _512 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _514 = isnan(_474);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _528;
    float _532 = -_508;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _536;
    float _540 = fma(_526, _496, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _542 = fma(_530, _496, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _544 = _522 * _534;
    float _546 = fma(_538, _496, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _548 = -_522;
    float _550 = _548 + 1.0;
    float _552 = _540 * _544;
    float _554 = _542 * _544;
    float _556 = _546 * _544;
    float _558 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].x, _552);
    float _560 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].y, _554);
    float _562 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _564 = _440 * _476;
    float _566 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[108].x, _558);
    float _568 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[108].y, _560);
    float _570 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[108].z, _562);
    bool _572 = !_490;
    float _590;
    if (!_572)
    {
        float _574 = in.m_51.x;
        float _576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _578 = _574 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _582 = _580 * _576;
        float _584 = floor(_582);
        float _586 = -_584;
        float _588 = _582 + _586;
        _590 = _588;
        _592 = true;
    }
    else
    {
        float _594 = float(_98);
        float _596 = 1.0 / _594;
        float _598 = _132 * _596;
        _590 = _598;
    }
    _592 = false;
    float _600 = _590;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = isnan(_600);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _622 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _624 = isnan(_600);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = 1.0 / _604;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _636;
    float _640 = -_616;
    float _642 = _640 + 1.0;
    bool _644 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _646 = isnan(_600);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    bool _656 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _658 = 1.0 / _620;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _664 = _638 * _634;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _668 = _600 + _666;
    float _670 = fma(_664, _668, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = _632 * _642;
    float _674 = -_632;
    float _676 = _674 + 1.0;
    float _678 = _662 * _658;
    float _680 = -_654;
    float _682 = _680 + 1.0;
    float _684 = _670 * _672;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _688 = _600 + _686;
    float _690 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _692 = _616 * _682;
    float _694 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[115].x, _684);
    float _696 = fma(_678, _688, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _698 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _700 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = fma(_696, _692, _694);
    float _706 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[117].x, _704);
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _702;
    out.m_53.y = _710;
    out.m_53.z = _706;
    out.m_53.w = _712;
    bool _714 = !_656;
    float _716 = _702;
    float _734;
    if (!_714)
    {
        float _718 = in.m_51.x;
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _722 = _718 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _726 = _724 * _720;
        float _728 = floor(_726);
        float _730 = -_728;
        float _732 = _726 + _730;
        _734 = _732;
        _736 = true;
    }
    else
    {
        float _738 = float(_98);
        float _740 = 1.0 / _738;
        float _742 = _132 * _740;
        _734 = _742;
    }
    _736 = false;
    float _744 = _734;
    float _746 = in.m_51.z;
    float _748 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _752 = _750 != 0;
    float _754 = in.m_51.x;
    float _756 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _768 = _766 != 0;
    float _770 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _772 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _774 = log2(_772);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _778 = _710;
    if (!_752)
    {
        float _780 = in.m_51.y;
        _778 = _780;
    }
    float _782 = _778;
    float _784 = _746 * 2.0;
    float _786 = _754 * 2.0;
    float _788 = floor(_784);
    float _790 = floor(_786);
    if (!_752)
    {
        _716 = _782;
    }
    float _792 = _716;
    float _794 = _792;
    float _796 = _782;
    if (_752)
    {
        float _798 = in.m_51.x;
        float _800 = in.m_51.y;
        _794 = _798;
        _796 = _800;
    }
    float _802 = _794;
    float _804 = _796;
    bool _806 = _788 >= 0.0;
    bool _808 = isnan(_788);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    bool _816 = _788 > 0.0;
    int _818 = _814 ? 0 : 1;
    float _820 = _788;
    if (!_752)
    {
        _820 = _746;
    }
    float _822 = _820;
    bool _824 = _790 > 0.0;
    bool _826 = _790 >= 0.0;
    bool _828 = isnan(_790);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _840 = ~_818;
    int _842 = _840 + 1;
    int _844 = _842 + 1;
    int _846 = _844;
    float _848 = _822;
    if (!_816)
    {
        int _850 = ~_818;
        int _852 = _850 + 1;
        _846 = _852;
    }
    int _854 = _846;
    int _856 = _834 ? 0 : 1;
    bool _858 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(1.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    int _868 = ~_856;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    int _874 = _872;
    if (_752)
    {
        _848 = _804;
    }
    float _876 = _848;
    float _878 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].z, _776);
    float _880 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _882 = _746 + _804;
    float _884 = _876;
    if (!_824)
    {
        int _886 = ~_856;
        int _888 = _886 + 1;
        _874 = _888;
    }
    int _890 = _874;
    float _892 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[83].w, _838);
    float _894 = _774 * _132;
    float _896 = _754 + _804;
    float _898 = -_836;
    float _900 = fma(_880, 2.0, _898);
    if (!_752)
    {
        _884 = _746;
    }
    float _902 = _884;
    float _904 = _882 + (-1.0);
    float _906 = _896 + (-1.0);
    float _908 = _902;
    if (_752)
    {
        _908 = _804;
    }
    float _910 = _908;
    float _912 = exp2(_894);
    float _914 = _804 * 2.0;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _920 = _910 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _922 = !_764;
    int _924 = _922 ? 0 : 1;
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _928 = float(_890);
    float _930 = fma(_920, -2.0, _916);
    bool _932 = !_760;
    int _934 = _932 ? 0 : 1;
    float _936 = floor(_914);
    int _938 = abs(_924);
    float _940 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _930);
    float _942 = in.m_55.x;
    float _944 = in.m_55.y;
    float _946 = in.m_55.z;
    int _948 = abs(_934);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _952 = 1.0 + _950;
    float _954 = -_912;
    float _956 = _954 + 1.0;
    bool _958 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _966 = _962 || _964;
    float _968 = _804 + (-0.5);
    float _970 = 1.0 / _952;
    float _972 = float(_948);
    float _974 = float(_938);
    float _976 = float(_854);
    bool _978 = _936 > 0.0;
    float _980 = _974 * _928;
    float _982 = _966 ? _956 : 0.0;
    float _984 = _972 * _976;
    float _986 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _878);
    bool _988 = _936 >= 0.0;
    bool _990 = isnan(_936);
    bool _992 = _988 || _990;
    bool _994 = isnan(0.0);
    bool _996 = _992 || _994;
    float _998 = -_132;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[81].x, _900);
    float _1002 = _984 * (-2.0);
    bool _1004 = !_768;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _892);
    if (_866)
    {
        float _1010 = _982 * _970;
        _134 = _1010;
    }
    float _1012 = _134;
    float _1014 = _754 + (-0.5);
    float _1016 = fma(_1002, _942, _942);
    int _1018 = _996 ? 0 : 1;
    float _1020 = fma(_918, _1002, _918);
    int _1022 = abs(_1006);
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1016);
    int _1026 = ~_1018;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    float _1032 = _754 + _746;
    float _1034 = fma(_1020, _1012, _1024);
    int _1036 = _1030;
    if (!_978)
    {
        int _1038 = ~_1018;
        int _1040 = _1038 + 1;
        _1036 = _1040;
    }
    int _1042 = _1036;
    float _1044 = _980 * (-2.0);
    float _1046 = float(_1022);
    float _1048 = _1032 + (-1.0);
    float _1050 = float(_1042);
    float _1052 = fma(_926, _1044, _926);
    float _1054 = fma(_1044, _944, _944);
    float _1056 = _1034 * 0.15915493667125701904296875;
    float _1058 = _1046 * _1050;
    float _1060 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1054);
    float _1062 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1064 = _1058 * (-2.0);
    float _1066 = _746 + (-0.5);
    float _1068 = fma(_1052, _1012, _1060);
    float _1070 = _1056 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = fma(_1064, _946, _946);
    float _1076 = in.m_57.x;
    float _1078 = in.m_57.y;
    float _1080 = in.m_57.z;
    float _1082 = fma(_1062, _1064, _1062);
    float _1084 = _1068 * 0.15915493667125701904296875;
    float _1086 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1074);
    float _1088 = _1056 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = fma(_1082, _1012, _1086);
    float _1094 = _1092 * 0.15915493667125701904296875;
    float _1096 = _1084 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = _1084 * 6.283185482025146484375;
    float _1102 = cos(_1100);
    float _1104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1078);
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1076);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1080);
    float _1110 = _748 * _1104;
    float _1112 = _756 * _1106;
    float _1114 = _1094 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1072 * _1098;
    float _1120 = _1090 * _1098;
    float _1122 = _770 * _1108;
    float _1124 = _1094 * 6.283185482025146484375;
    float _1126 = sin(_1124);
    float _1128 = _1090 * _1102;
    float _1130 = _1072 * _1102;
    float _1132 = _1090 * _1116;
    float _1134 = _1072 * _1116;
    float _1136 = _1102 * _1116;
    float _1138 = _1098 * _1116;
    float _1140 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1142 = _1134 * _1110;
    float _1144 = fma(_1126, _1128, _1118);
    float _1146 = fma(_1126, _1118, _1128);
    float _1148 = _1132 * _1110;
    float _1150 = -_1120;
    float _1152 = fma(_1126, _1130, _1150);
    float _1154 = -_1130;
    float _1156 = fma(_1126, _1120, _1154);
    float _1158 = -_1110;
    float _1160 = _1126 * _1158;
    float _1162 = fma(_1144, _1112, _1148);
    float _1164 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1166 = fma(_1152, _1112, _1142);
    float _1168 = fma(_1136, _1112, _1160);
    float _1170 = fma(_1156, _1122, _1162);
    float _1172 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1164);
    float _1174 = fma(_1146, _1122, _1166);
    float _1176 = fma(_1138, _1122, _1168);
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1180 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1140);
    float _1182 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1172);
    float _1184 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1186 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1178);
    float _1188 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1180);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1184);
    float _1194 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1198 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1200 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1192);
    float _1202 = _1190 + _1194;
    float _1204 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1206 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1198);
    float _1208 = _1196 + _1200;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1212 = _1202 + _1210;
    float _1214 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1204);
    float _1216 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1206);
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1220 = _1208 + _1218;
    float _1222 = _1212 * _1212;
    float _1224 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1214);
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1228 = fma(_1220, _1220, _1222);
    float _1230 = _1226 + _1224;
    float _1232 = sqrt(_1228);
    bool _1234 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = _1226;
    float _1238 = _1204;
    float _1240 = _1174;
    float _1242 = _1232;
    float _1244 = _1230;
    float _1246 = _1228;
    if (!_1234)
    {
        _1236 = _1208;
    }
    float _1248 = _1236;
    float _1250 = _1248;
    if (!_1234)
    {
        _1238 = _1202;
    }
    float _1252 = _1238;
    float _1254 = _1252;
    if (!_1234)
    {
        _278 = _1230;
    }
    float _1256 = _278;
    bool _1258 = !_1234;
    float _1260 = _1256;
    if (!_1258)
    {
        float _1262 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1266 = _1232 + _1264;
        float _1268 = rsqrt(_1228);
        float _1270 = _1266 * _1262;
        float _1272 = _1230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1274 = _1270 * 0.15915493667125701904296875;
        float _1276 = _1274 * 6.283185482025146484375;
        float _1278 = cos(_1276);
        float _1280 = _1274 * 6.283185482025146484375;
        float _1282 = sin(_1280);
        float _1284 = _1278 + (-1.0);
        float _1286 = fma(_1282, _1272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1288 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = _1268 * _1286;
        float _1292 = fma(_1230, _1278, _1288);
        float _1294 = fma(_1220, _1290, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1296 = fma(_1212, _1290, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1260 = _1292;
        _1250 = _1294;
        _1254 = _1296;
        _1240 = _1274;
        _1242 = _1284;
    }
    float _1298 = _1260;
    float _1300 = _1250;
    float _1302 = _1254;
    float _1304 = _1240;
    float _1306 = _1242;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1310 = _1298 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1314 = _1300 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1318 = _1302 + _1316;
    float _1320 = _1310 * _1310;
    float _1322 = fma(_1314, _1314, _1320);
    float _1324 = fma(_1318, _1318, _1322);
    float _1326 = rsqrt(_1324);
    float _1328 = sqrt(_1324);
    float _1330 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1332 = _1314 * _1330;
    float _1334 = _1318 * _1330;
    float _1336 = _1332 * _1332;
    float _1338 = _1334 * _1334;
    float _1340 = _1336 + _1338;
    float _1342 = sqrt(_1340);
    bool _1344 = _1342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1348 = _1342 + _1346;
    float _1350 = _1304;
    float _1352 = _1348;
    if (_1344)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1350 = _1354;
    }
    float _1356 = _1350;
    if (_1344)
    {
        float _1358 = rsqrt(_1340);
        _1244 = _1358;
    }
    float _1360 = _1244;
    float _1362 = _1360;
    if (_1344)
    {
        float _1364 = _1348 * _1356;
        _1352 = _1364;
    }
    float _1366 = _1352;
    if (_1344)
    {
        float _1368 = _1366 * 0.15915493667125701904296875;
        _1246 = _1368;
    }
    float _1370 = _1246;
    float _1372 = _1306;
    float _1374 = _1370;
    if (_1344)
    {
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1372 = _1378;
    }
    float _1380 = _1372;
    float _1382 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1384 = precise::max(0.0, _1382);
    float _1386 = _1220;
    float _1388 = _1384;
    float _1390 = _1382;
    if (_1344)
    {
        float _1392 = _1370 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        _1386 = _1394;
    }
    float _1396 = _1386;
    float _1398 = -_1330;
    float _1400 = -_1384;
    float _1402 = fma(_1310, _1398, _1400);
    if (_1344)
    {
        float _1404 = _1402 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1388 = _1404;
    }
    float _1406 = _1388;
    float _1408 = _1406;
    float _1410 = _1380;
    if (_1344)
    {
        float _1412 = fma(_1380, _1406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1408 = _1412;
    }
    float _1414 = _1408;
    float _1416 = _1414;
    if (!_1344)
    {
        _1410 = _1402;
    }
    float _1418 = _1410;
    float _1420 = _1418;
    float _1422 = _1396;
    if (_1344)
    {
        float _1424 = _1396 + (-1.0);
        _1390 = _1424;
    }
    float _1426 = _1390;
    float _1428 = 0.0;
    float _1430 = _1426;
    if (_1344)
    {
        float _1432 = _1360 * _1414;
        _1428 = _1432;
    }
    float _1434 = _1428;
    if (!_1344)
    {
        _1362 = _1332;
    }
    float _1436 = _1362;
    float _1438 = _1436;
    if (_1344)
    {
        float _1440 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1440;
    }
    float _1442 = _1374;
    if (_1344)
    {
        float _1444 = _1332 * _1434;
        _1438 = _1444;
    }
    float _1446 = _1438;
    if (!_1344)
    {
        _1430 = _1334;
    }
    float _1448 = _1430;
    float _1450 = _1448;
    if (_1344)
    {
        float _1452 = _1334 * _1434;
        _1450 = _1452;
    }
    float _1454 = _1450;
    if (!_1344)
    {
        _1416 = _1336;
    }
    float _1456 = _1416;
    float _1458 = _1456;
    if (_1344)
    {
        float _1460 = fma(_1402, _1396, _1442);
        _1420 = _1460;
    }
    float _1462 = _1420;
    if (_1344)
    {
        float _1464 = _1446 * _1446;
        _1458 = _1464;
    }
    float _1466 = _1458;
    if (!_1344)
    {
        _1422 = _1338;
    }
    float _1468 = _1422;
    float _1470 = _1468;
    if (_1344)
    {
        float _1472 = _1454 * _1454;
        _1470 = _1472;
    }
    float _1474 = _1470;
    float _1476 = fma(_1462, _1462, _1466);
    float _1478 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = _1476 + _1474;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1484 = fma(_1328, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1482);
    float _1486 = precise::clamp(_1484, 0.0, 1.0);
    float _1488 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1490 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1492 = rsqrt(_1480);
    float _1494 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1496 = -_1486;
    float _1498 = _1496 + 1.0;
    float _1500 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1502 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1488);
    float _1504 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1494);
    float _1506 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1500);
    float _1508 = abs(_1498);
    float _1510 = log2(_1508);
    float _1512 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1514 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1504);
    float _1516 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1506);
    float _1518 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1522 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1524 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1526 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1518);
    float _1528 = _1492 * _1446;
    float _1530 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1532 = _1492 * _1462;
    float _1534 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1526);
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1538 = -_1520;
    float _1540 = fma(_1538, _1490, 1.0);
    float _1542 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1530);
    float _1544 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1546 = _1492 * _1454;
    float _1548 = -_1536;
    float _1550 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1548);
    float _1552 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1554 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1542);
    float _1556 = log2(_1540);
    float _1558 = -_1546;
    float _1560 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1550);
    float _1562 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1564 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1554);
    float _1566 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1568 = fma(_1560, -0.5, 0.5);
    float _1570 = fma(_1560, 0.5, 0.5);
    float _1572 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1562);
    float _1574 = exp2(_1552);
    float _1576 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1566);
    float _1578 = _1532 + 1.0;
    float _1580 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1572);
    float _1582 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1576);
    float _1584 = fma(_1570, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1586 = 1.0 / _1564;
    float _1588 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1582);
    float _1590 = _1556 * 0.693147182464599609375;
    float _1592 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1594 = sqrt(_1568);
    float _1596 = -_1532;
    float _1598 = fma(_1574, _1578, _1596);
    float _1600 = fma(_1570, _1584, -0.212114393711090087890625);
    float _1602 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1580);
    float _1604 = fma(_1598, 0.5, 0.5);
    float _1606 = fma(_1570, _1600, 1.570728778839111328125);
    float _1608 = _1588 * _1586;
    float _1610 = _1602 * _1586;
    float _1612 = fma(_1608, 0.5, 0.5);
    float _1614 = fma(_1610, -0.5, 0.5);
    float _1616 = _1594 * 0.636619746685028076171875;
    float _1618 = -_1606;
    float _1620 = fma(_1616, _1618, 1.0);
    float3 _4427 = float3(_1612, _1614, _1592);
    float _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4427, float3(0.0), isnan(_4427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4427, float3(0.0), isnan(_4427)), level(0.0)).x;
    float3 _4438 = float3(_1612, _1614, _1592);
    float4 _1625 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4438, float3(0.0), isnan(_4438)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4438, float3(0.0), isnan(_4438)), level(0.0)).xyzw;
    float _1627 = _1625.x;
    float _1629 = _1625.y;
    float _1631 = _1625.z;
    float _1633 = _1625.w;
    float2 _4455 = float2(_1620, _1604);
    float3 _1637 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4455, float2(0.0), isnan(_4455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4455, float2(0.0), isnan(_4455)), level(0.0)).xyz;
    float _1639 = _1637.x;
    float _1641 = _1637.y;
    float _1643 = _1637.z;
    float _1645 = in.m_59.y;
    float _1647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1649 = in.m_51.w;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1655 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1661 = 1.0 / _1653;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1665 = _1663 != 0;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1671;
    int _1675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1677 = _1675 != 0;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1685 = _744 + _1683;
    float _1687 = 1.0 / _1659;
    bool _1689 = _746 > 0.5;
    bool _1691 = _1689 && _1677;
    float _1693 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1695 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1697 = isnan(_744);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    out.m_61.x = _1314;
    out.m_61.y = _1310;
    out.m_61.z = _1318;
    bool _1707 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1709 = isnan(_744);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1715 = _1711 || _1713;
    float _1717 = float(_1715);
    float _1719 = -_1645;
    float _1721 = _1719 + 1.0;
    float _1723 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1693);
    float _1725 = _1673 * _1661;
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1729 = _744 + _1727;
    bool _1731 = _1649 > 0.5;
    float _1733 = 1.0 / _1669;
    float _1735 = in.m_59.x;
    float _1737 = fma(_1725, _1729, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1739 = _1645;
    if (_1665)
    {
        float _1741 = _1731 ? _1721 : _1645;
        _1739 = _1741;
    }
    float _1743 = _1739;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1745;
    float _1749 = in.m_63.x;
    float _1751 = in.m_63.y;
    float _1753 = in.m_63.z;
    bool _1755 = _1078 != 0.0;
    bool _1757 = isnan(_1078);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(0.0);
    bool _1763 = _1759 || _1761;
    float _1765 = -_1705;
    float _1767 = _1765 + 1.0;
    bool _1769 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1771 = isnan(_744);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = _1747 * _1687;
    bool _1783 = _1076 == 0.0;
    bool _1785 = !_1763;
    bool _1787 = _1783 && _1785;
    float _1789 = exp2(_1655);
    bool _1791 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1793 = isnan(_744);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1799 = _1795 || _1797;
    float _1801 = float(_1799);
    float _1803 = -_1779;
    float _1805 = _1803 + 1.0;
    bool _1807 = _1080 == 0.0;
    bool _1809 = _1807 && _1787;
    float _1811 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1723);
    float _1813 = _1681 * _1733;
    float _1815 = _1801 * _1805;
    float _1817 = -_1801;
    float _1819 = _1817 + 1.0;
    float _1821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1823 = fma(_1813, _1685, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1825 = _1705 * _1819;
    float _1827 = _1717 * _1767;
    float _1829 = -_1717;
    float _1831 = _1829 + 1.0;
    float _1833 = 0.0;
    float _1835 = _1735;
    if (_1677)
    {
        _1833 = _1735;
    }
    float _1837 = _1833;
    out.m_65.x = _1300;
    out.m_65.y = _1298;
    out.m_65.z = _1302;
    float _1839 = _1737 * _1827;
    float _1841 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1843 = _1751;
    float _1845 = _1749;
    float _1847 = _1837;
    float _1849 = _1753;
    if (!_1809)
    {
        float _1851 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1751);
        _1843 = _1851;
    }
    float _1853 = _1843;
    if (!_1809)
    {
        float _1855 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1749);
        _1845 = _1855;
    }
    float _1857 = _1845;
    if (_1691)
    {
        float _1859 = -_1837;
        float _1861 = _1859 + 1.0;
        _1847 = _1861;
    }
    float _1863 = _1847;
    if (!_1809)
    {
        float _1865 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1753);
        _1849 = _1865;
    }
    float _1867 = _1849;
    float _1869 = -_1853;
    float _1871 = _1126 * _1869;
    float _1873 = _1132 * _1853;
    float _1875 = _1134 * _1853;
    if (_1677)
    {
        _1835 = _1863;
    }
    float _1877 = _1835;
    float _1879 = fma(_1136, _1857, _1871);
    float _1881 = fma(_1144, _1857, _1873);
    float _1883 = fma(_1152, _1857, _1875);
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1887 = _744 + _1885;
    float _1889 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1891 = fma(_1138, _1867, _1879);
    float _1893 = fma(_1156, _1867, _1881);
    float _1895 = fma(_1146, _1867, _1883);
    float _1897 = fma(_1889, _1877, -0.5);
    float _1899 = in.m_67.w;
    float _1901 = fma(_1841, _1743, -0.5);
    float _1903 = fma(_986, _1897, _1000);
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1907 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1909 = -_940;
    float _1911 = fma(_1008, _1901, _1909);
    float _1913 = -_1789;
    float _1915 = _1913 + 1.0;
    float _1917 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1839);
    float _1919 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1921 = fma(_1891, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1905);
    float _1923 = _1903 + 0.5;
    float _1925 = fma(_1891, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1907);
    float _1927 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1811);
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1931 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1933 = fma(_1781, _1887, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1935 = fma(_1823, _1825, _1917);
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1939 = fma(_1895, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1921);
    float _1941 = _1927 + _1564;
    float _1943 = fma(_1933, _1815, _1935);
    float _1945 = _1911 + 0.5;
    float _1947 = _1941 * 0.5;
    float _1949 = fma(_1891, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1919);
    float _1951 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1943);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_69.w = _1899;
    float _1955 = fma(_1895, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1949);
    float _1957 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1959 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1961 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1963 = _1951 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1965 = fma(_1895, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1925);
    float _1967 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1923;
    out.m_71.w = _1945;
    out.m_73.x = _1959;
    out.m_73.y = _1957;
    out.m_73.z = _1961;
    out.m_73.w = _1963;
    out.m_75.x = _1939;
    out.m_75.y = _1955;
    out.m_75.z = _1965;
    out.gl_Position.x = _1588;
    out.gl_Position.y = _1602;
    out.gl_Position.z = _1927;
    out.gl_Position.w = _1564;
    out.m_77.z = _1947;
    out.m_77.w = _1564;
    out.m_45.x = _1967;
    float _1969 = _1931 * _1622;
    float _1971 = -_1931;
    float _1973 = _1971 + 1.0;
    float _1975 = _1633 * _1969;
    float _1977 = _1643 * _1969;
    float _1979 = _1633 * _1973;
    float _1981 = fma(_1639, _1975, _1627);
    float _1983 = fma(_1641, _1975, _1629);
    float _1985 = fma(_1633, _1977, _1631);
    out.m_79.x = _1981;
    out.m_79.y = _1983;
    out.m_79.z = _1985;
    out.m_79.w = _1979;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _736 = false;
    bool _592 = false;
    bool _466 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
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
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2042 = as_type<float>(_114);
        out.gl_Position.z = _2042;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_47.w;
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
        _108 = _136;
    }
    float _138 = _108;
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
        out.m_45.x = 0.0;
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
        float _2112 = as_type<float>(_152);
        out.gl_Position.z = _2112;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_49.w;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _278 = _274;
    float _296;
    if (!_276)
    {
        float _280 = in.m_51.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_98);
        float _302 = 1.0 / _300;
        float _304 = _132 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _306 + _324;
    bool _328 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_306);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _348 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _350 = isnan(_306);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _342;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = 1.0 / _346;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _366;
    float _370 = _310 * _360;
    float _372 = -_322;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = fma(_368, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _382 = _358 * _374;
    float _384 = -_358;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _388;
    float _392 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _326 * _364;
    float _396 = _338 * _386;
    float _398 = fma(_390, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = -_338;
    float _402 = _400 + 1.0;
    float _404 = _380 * _396;
    float _406 = _398 * _396;
    float _408 = _392 * _396;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _424 = fma(_412, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_416, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_420, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _432 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _434 = fma(_424, _382, _422);
    float _436 = fma(_426, _382, _430);
    float _438 = fma(_428, _382, _432);
    float _440 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[145].x, _434);
    float _442 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[145].y, _436);
    float _444 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[145].z, _438);
    bool _446 = !_362;
    float _464;
    if (!_446)
    {
        float _448 = in.m_51.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_98);
        float _470 = 1.0 / _468;
        float _472 = _132 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = in.m_49.x;
    float _478 = in.m_49.y;
    float _480 = in.m_49.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _484 = _474 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _486;
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _492 = 1.0 / _488;
    float _494 = _442 * _478;
    float _496 = _484 * _492;
    bool _498 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _500 = isnan(_474);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _444 * _480;
    bool _512 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _514 = isnan(_474);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _528;
    float _532 = -_508;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _536;
    float _540 = fma(_526, _496, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _542 = fma(_530, _496, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _544 = _522 * _534;
    float _546 = fma(_538, _496, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _548 = -_522;
    float _550 = _548 + 1.0;
    float _552 = _540 * _544;
    float _554 = _542 * _544;
    float _556 = _546 * _544;
    float _558 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].x, _552);
    float _560 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].y, _554);
    float _562 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _564 = _440 * _476;
    float _566 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[108].x, _558);
    float _568 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[108].y, _560);
    float _570 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[108].z, _562);
    bool _572 = !_490;
    float _590;
    if (!_572)
    {
        float _574 = in.m_51.x;
        float _576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _578 = _574 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _582 = _580 * _576;
        float _584 = floor(_582);
        float _586 = -_584;
        float _588 = _582 + _586;
        _590 = _588;
        _592 = true;
    }
    else
    {
        float _594 = float(_98);
        float _596 = 1.0 / _594;
        float _598 = _132 * _596;
        _590 = _598;
    }
    _592 = false;
    float _600 = _590;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = isnan(_600);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _622 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _624 = isnan(_600);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = 1.0 / _604;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _636;
    float _640 = -_616;
    float _642 = _640 + 1.0;
    bool _644 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _646 = isnan(_600);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    bool _656 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _658 = 1.0 / _620;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _664 = _638 * _634;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _668 = _600 + _666;
    float _670 = fma(_664, _668, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = _632 * _642;
    float _674 = -_632;
    float _676 = _674 + 1.0;
    float _678 = _662 * _658;
    float _680 = -_654;
    float _682 = _680 + 1.0;
    float _684 = _670 * _672;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _688 = _600 + _686;
    float _690 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _692 = _616 * _682;
    float _694 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[115].x, _684);
    float _696 = fma(_678, _688, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _698 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _700 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = fma(_696, _692, _694);
    float _706 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[117].x, _704);
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _702;
    out.m_53.y = _710;
    out.m_53.z = _706;
    out.m_53.w = _712;
    bool _714 = !_656;
    float _716 = _702;
    float _734;
    if (!_714)
    {
        float _718 = in.m_51.x;
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _722 = _718 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _726 = _724 * _720;
        float _728 = floor(_726);
        float _730 = -_728;
        float _732 = _726 + _730;
        _734 = _732;
        _736 = true;
    }
    else
    {
        float _738 = float(_98);
        float _740 = 1.0 / _738;
        float _742 = _132 * _740;
        _734 = _742;
    }
    _736 = false;
    float _744 = _734;
    float _746 = in.m_51.z;
    float _748 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _752 = _750 != 0;
    float _754 = in.m_51.x;
    float _756 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _768 = _766 != 0;
    float _770 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _772 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _774 = log2(_772);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _778 = _710;
    if (!_752)
    {
        float _780 = in.m_51.y;
        _778 = _780;
    }
    float _782 = _778;
    float _784 = _746 * 2.0;
    float _786 = _754 * 2.0;
    float _788 = floor(_784);
    float _790 = floor(_786);
    if (!_752)
    {
        _716 = _782;
    }
    float _792 = _716;
    float _794 = _792;
    float _796 = _782;
    if (_752)
    {
        float _798 = in.m_51.x;
        float _800 = in.m_51.y;
        _794 = _798;
        _796 = _800;
    }
    float _802 = _794;
    float _804 = _796;
    bool _806 = _788 >= 0.0;
    bool _808 = isnan(_788);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    bool _816 = _788 > 0.0;
    int _818 = _814 ? 0 : 1;
    float _820 = _788;
    if (!_752)
    {
        _820 = _746;
    }
    float _822 = _820;
    bool _824 = _790 > 0.0;
    bool _826 = _790 >= 0.0;
    bool _828 = isnan(_790);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _840 = ~_818;
    int _842 = _840 + 1;
    int _844 = _842 + 1;
    int _846 = _844;
    float _848 = _822;
    if (!_816)
    {
        int _850 = ~_818;
        int _852 = _850 + 1;
        _846 = _852;
    }
    int _854 = _846;
    int _856 = _834 ? 0 : 1;
    bool _858 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(1.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    int _868 = ~_856;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    int _874 = _872;
    if (_752)
    {
        _848 = _804;
    }
    float _876 = _848;
    float _878 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].z, _776);
    float _880 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _882 = _746 + _804;
    float _884 = _876;
    if (!_824)
    {
        int _886 = ~_856;
        int _888 = _886 + 1;
        _874 = _888;
    }
    int _890 = _874;
    float _892 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[83].w, _838);
    float _894 = _774 * _132;
    float _896 = _754 + _804;
    float _898 = -_836;
    float _900 = fma(_880, 2.0, _898);
    if (!_752)
    {
        _884 = _746;
    }
    float _902 = _884;
    float _904 = _882 + (-1.0);
    float _906 = _896 + (-1.0);
    float _908 = _902;
    if (_752)
    {
        _908 = _804;
    }
    float _910 = _908;
    float _912 = exp2(_894);
    float _914 = _804 * 2.0;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _920 = _910 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _922 = !_764;
    int _924 = _922 ? 0 : 1;
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _928 = float(_890);
    float _930 = fma(_920, -2.0, _916);
    bool _932 = !_760;
    int _934 = _932 ? 0 : 1;
    float _936 = floor(_914);
    int _938 = abs(_924);
    float _940 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _930);
    float _942 = in.m_55.x;
    float _944 = in.m_55.y;
    float _946 = in.m_55.z;
    int _948 = abs(_934);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _952 = 1.0 + _950;
    float _954 = -_912;
    float _956 = _954 + 1.0;
    bool _958 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _966 = _962 || _964;
    float _968 = _804 + (-0.5);
    float _970 = 1.0 / _952;
    float _972 = float(_948);
    float _974 = float(_938);
    float _976 = float(_854);
    bool _978 = _936 > 0.0;
    float _980 = _974 * _928;
    float _982 = _966 ? _956 : 0.0;
    float _984 = _972 * _976;
    float _986 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _878);
    bool _988 = _936 >= 0.0;
    bool _990 = isnan(_936);
    bool _992 = _988 || _990;
    bool _994 = isnan(0.0);
    bool _996 = _992 || _994;
    float _998 = -_132;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[81].x, _900);
    float _1002 = _984 * (-2.0);
    bool _1004 = !_768;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _892);
    if (_866)
    {
        float _1010 = _982 * _970;
        _134 = _1010;
    }
    float _1012 = _134;
    float _1014 = _754 + (-0.5);
    float _1016 = fma(_1002, _942, _942);
    int _1018 = _996 ? 0 : 1;
    float _1020 = fma(_918, _1002, _918);
    int _1022 = abs(_1006);
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1016);
    int _1026 = ~_1018;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    float _1032 = _754 + _746;
    float _1034 = fma(_1020, _1012, _1024);
    int _1036 = _1030;
    if (!_978)
    {
        int _1038 = ~_1018;
        int _1040 = _1038 + 1;
        _1036 = _1040;
    }
    int _1042 = _1036;
    float _1044 = _980 * (-2.0);
    float _1046 = float(_1022);
    float _1048 = _1032 + (-1.0);
    float _1050 = float(_1042);
    float _1052 = fma(_926, _1044, _926);
    float _1054 = fma(_1044, _944, _944);
    float _1056 = _1034 * 0.15915493667125701904296875;
    float _1058 = _1046 * _1050;
    float _1060 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1054);
    float _1062 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1064 = _1058 * (-2.0);
    float _1066 = _746 + (-0.5);
    float _1068 = fma(_1052, _1012, _1060);
    float _1070 = _1056 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = fma(_1064, _946, _946);
    float _1076 = in.m_57.x;
    float _1078 = in.m_57.y;
    float _1080 = in.m_57.z;
    float _1082 = fma(_1062, _1064, _1062);
    float _1084 = _1068 * 0.15915493667125701904296875;
    float _1086 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1074);
    float _1088 = _1056 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = fma(_1082, _1012, _1086);
    float _1094 = _1092 * 0.15915493667125701904296875;
    float _1096 = _1084 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = _1084 * 6.283185482025146484375;
    float _1102 = cos(_1100);
    float _1104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1078);
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1076);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1080);
    float _1110 = _748 * _1104;
    float _1112 = _756 * _1106;
    float _1114 = _1094 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1072 * _1098;
    float _1120 = _1090 * _1098;
    float _1122 = _770 * _1108;
    float _1124 = _1094 * 6.283185482025146484375;
    float _1126 = sin(_1124);
    float _1128 = _1090 * _1102;
    float _1130 = _1072 * _1102;
    float _1132 = _1090 * _1116;
    float _1134 = _1072 * _1116;
    float _1136 = _1102 * _1116;
    float _1138 = _1098 * _1116;
    float _1140 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1142 = _1134 * _1110;
    float _1144 = fma(_1126, _1128, _1118);
    float _1146 = fma(_1126, _1118, _1128);
    float _1148 = _1132 * _1110;
    float _1150 = -_1120;
    float _1152 = fma(_1126, _1130, _1150);
    float _1154 = -_1130;
    float _1156 = fma(_1126, _1120, _1154);
    float _1158 = -_1110;
    float _1160 = _1126 * _1158;
    float _1162 = fma(_1144, _1112, _1148);
    float _1164 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1166 = fma(_1152, _1112, _1142);
    float _1168 = fma(_1136, _1112, _1160);
    float _1170 = fma(_1156, _1122, _1162);
    float _1172 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1164);
    float _1174 = fma(_1146, _1122, _1166);
    float _1176 = fma(_1138, _1122, _1168);
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1180 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1140);
    float _1182 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1172);
    float _1184 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1186 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1178);
    float _1188 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1180);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1184);
    float _1194 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1198 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1200 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1192);
    float _1202 = _1190 + _1194;
    float _1204 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1206 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1198);
    float _1208 = _1196 + _1200;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1212 = _1202 + _1210;
    float _1214 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1204);
    float _1216 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1206);
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1220 = _1208 + _1218;
    float _1222 = _1212 * _1212;
    float _1224 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1214);
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1228 = fma(_1220, _1220, _1222);
    float _1230 = _1226 + _1224;
    float _1232 = sqrt(_1228);
    bool _1234 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = _1226;
    float _1238 = _1204;
    float _1240 = _1174;
    float _1242 = _1232;
    float _1244 = _1230;
    float _1246 = _1228;
    if (!_1234)
    {
        _1236 = _1208;
    }
    float _1248 = _1236;
    float _1250 = _1248;
    if (!_1234)
    {
        _1238 = _1202;
    }
    float _1252 = _1238;
    float _1254 = _1252;
    if (!_1234)
    {
        _278 = _1230;
    }
    float _1256 = _278;
    bool _1258 = !_1234;
    float _1260 = _1256;
    if (!_1258)
    {
        float _1262 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1266 = _1232 + _1264;
        float _1268 = rsqrt(_1228);
        float _1270 = _1266 * _1262;
        float _1272 = _1230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1274 = _1270 * 0.15915493667125701904296875;
        float _1276 = _1274 * 6.283185482025146484375;
        float _1278 = cos(_1276);
        float _1280 = _1274 * 6.283185482025146484375;
        float _1282 = sin(_1280);
        float _1284 = _1278 + (-1.0);
        float _1286 = fma(_1282, _1272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1288 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = _1268 * _1286;
        float _1292 = fma(_1230, _1278, _1288);
        float _1294 = fma(_1220, _1290, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1296 = fma(_1212, _1290, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1260 = _1292;
        _1250 = _1294;
        _1254 = _1296;
        _1240 = _1274;
        _1242 = _1284;
    }
    float _1298 = _1260;
    float _1300 = _1250;
    float _1302 = _1254;
    float _1304 = _1240;
    float _1306 = _1242;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1310 = _1298 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1314 = _1300 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1318 = _1302 + _1316;
    float _1320 = _1310 * _1310;
    float _1322 = fma(_1314, _1314, _1320);
    float _1324 = fma(_1318, _1318, _1322);
    float _1326 = rsqrt(_1324);
    float _1328 = sqrt(_1324);
    float _1330 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1332 = _1314 * _1330;
    float _1334 = _1318 * _1330;
    float _1336 = _1332 * _1332;
    float _1338 = _1334 * _1334;
    float _1340 = _1336 + _1338;
    float _1342 = sqrt(_1340);
    bool _1344 = _1342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1348 = _1342 + _1346;
    float _1350 = _1304;
    float _1352 = _1348;
    if (_1344)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1350 = _1354;
    }
    float _1356 = _1350;
    if (_1344)
    {
        float _1358 = rsqrt(_1340);
        _1244 = _1358;
    }
    float _1360 = _1244;
    float _1362 = _1360;
    if (_1344)
    {
        float _1364 = _1348 * _1356;
        _1352 = _1364;
    }
    float _1366 = _1352;
    if (_1344)
    {
        float _1368 = _1366 * 0.15915493667125701904296875;
        _1246 = _1368;
    }
    float _1370 = _1246;
    float _1372 = _1306;
    float _1374 = _1370;
    if (_1344)
    {
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1372 = _1378;
    }
    float _1380 = _1372;
    float _1382 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1384 = precise::max(0.0, _1382);
    float _1386 = _1220;
    float _1388 = _1384;
    float _1390 = _1382;
    if (_1344)
    {
        float _1392 = _1370 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        _1386 = _1394;
    }
    float _1396 = _1386;
    float _1398 = -_1330;
    float _1400 = -_1384;
    float _1402 = fma(_1310, _1398, _1400);
    if (_1344)
    {
        float _1404 = _1402 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1388 = _1404;
    }
    float _1406 = _1388;
    float _1408 = _1406;
    float _1410 = _1380;
    if (_1344)
    {
        float _1412 = fma(_1380, _1406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1408 = _1412;
    }
    float _1414 = _1408;
    float _1416 = _1414;
    if (!_1344)
    {
        _1410 = _1402;
    }
    float _1418 = _1410;
    float _1420 = _1418;
    float _1422 = _1396;
    if (_1344)
    {
        float _1424 = _1396 + (-1.0);
        _1390 = _1424;
    }
    float _1426 = _1390;
    float _1428 = 0.0;
    float _1430 = _1426;
    if (_1344)
    {
        float _1432 = _1360 * _1414;
        _1428 = _1432;
    }
    float _1434 = _1428;
    if (!_1344)
    {
        _1362 = _1332;
    }
    float _1436 = _1362;
    float _1438 = _1436;
    if (_1344)
    {
        float _1440 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1440;
    }
    float _1442 = _1374;
    if (_1344)
    {
        float _1444 = _1332 * _1434;
        _1438 = _1444;
    }
    float _1446 = _1438;
    if (!_1344)
    {
        _1430 = _1334;
    }
    float _1448 = _1430;
    float _1450 = _1448;
    if (_1344)
    {
        float _1452 = _1334 * _1434;
        _1450 = _1452;
    }
    float _1454 = _1450;
    if (!_1344)
    {
        _1416 = _1336;
    }
    float _1456 = _1416;
    float _1458 = _1456;
    if (_1344)
    {
        float _1460 = fma(_1402, _1396, _1442);
        _1420 = _1460;
    }
    float _1462 = _1420;
    if (_1344)
    {
        float _1464 = _1446 * _1446;
        _1458 = _1464;
    }
    float _1466 = _1458;
    if (!_1344)
    {
        _1422 = _1338;
    }
    float _1468 = _1422;
    float _1470 = _1468;
    if (_1344)
    {
        float _1472 = _1454 * _1454;
        _1470 = _1472;
    }
    float _1474 = _1470;
    float _1476 = fma(_1462, _1462, _1466);
    float _1478 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = _1476 + _1474;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1484 = fma(_1328, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1482);
    float _1486 = precise::clamp(_1484, 0.0, 1.0);
    float _1488 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1490 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1492 = rsqrt(_1480);
    float _1494 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1496 = -_1486;
    float _1498 = _1496 + 1.0;
    float _1500 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1502 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1488);
    float _1504 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1494);
    float _1506 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1500);
    float _1508 = abs(_1498);
    float _1510 = log2(_1508);
    float _1512 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1514 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1504);
    float _1516 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1506);
    float _1518 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1522 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1524 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1526 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1518);
    float _1528 = _1492 * _1446;
    float _1530 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1532 = _1492 * _1462;
    float _1534 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1526);
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1538 = -_1520;
    float _1540 = fma(_1538, _1490, 1.0);
    float _1542 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1530);
    float _1544 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1546 = _1492 * _1454;
    float _1548 = -_1536;
    float _1550 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1548);
    float _1552 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1554 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1542);
    float _1556 = log2(_1540);
    float _1558 = -_1546;
    float _1560 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1550);
    float _1562 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1564 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1554);
    float _1566 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1568 = fma(_1560, -0.5, 0.5);
    float _1570 = fma(_1560, 0.5, 0.5);
    float _1572 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1562);
    float _1574 = exp2(_1552);
    float _1576 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1566);
    float _1578 = _1532 + 1.0;
    float _1580 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1572);
    float _1582 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1576);
    float _1584 = fma(_1570, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1586 = 1.0 / _1564;
    float _1588 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1582);
    float _1590 = _1556 * 0.693147182464599609375;
    float _1592 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1594 = sqrt(_1568);
    float _1596 = -_1532;
    float _1598 = fma(_1574, _1578, _1596);
    float _1600 = fma(_1570, _1584, -0.212114393711090087890625);
    float _1602 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1580);
    float _1604 = fma(_1598, 0.5, 0.5);
    float _1606 = fma(_1570, _1600, 1.570728778839111328125);
    float _1608 = _1588 * _1586;
    float _1610 = _1602 * _1586;
    float _1612 = fma(_1608, 0.5, 0.5);
    float _1614 = fma(_1610, -0.5, 0.5);
    float _1616 = _1594 * 0.636619746685028076171875;
    float _1618 = -_1606;
    float _1620 = fma(_1616, _1618, 1.0);
    float3 _4427 = float3(_1612, _1614, _1592);
    float _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4427, float3(0.0), isnan(_4427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4427, float3(0.0), isnan(_4427)), level(0.0)).x;
    float3 _4438 = float3(_1612, _1614, _1592);
    float4 _1625 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4438, float3(0.0), isnan(_4438)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4438, float3(0.0), isnan(_4438)), level(0.0)).xyzw;
    float _1627 = _1625.x;
    float _1629 = _1625.y;
    float _1631 = _1625.z;
    float _1633 = _1625.w;
    float2 _4455 = float2(_1620, _1604);
    float3 _1637 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4455, float2(0.0), isnan(_4455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4455, float2(0.0), isnan(_4455)), level(0.0)).xyz;
    float _1639 = _1637.x;
    float _1641 = _1637.y;
    float _1643 = _1637.z;
    float _1645 = in.m_59.y;
    float _1647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1649 = in.m_51.w;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1655 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1661 = 1.0 / _1653;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1665 = _1663 != 0;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1671;
    int _1675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1677 = _1675 != 0;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1685 = _744 + _1683;
    float _1687 = 1.0 / _1659;
    bool _1689 = _746 > 0.5;
    bool _1691 = _1689 && _1677;
    float _1693 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1695 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1697 = isnan(_744);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    out.m_61.x = _1314;
    out.m_61.y = _1310;
    out.m_61.z = _1318;
    bool _1707 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1709 = isnan(_744);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1715 = _1711 || _1713;
    float _1717 = float(_1715);
    float _1719 = -_1645;
    float _1721 = _1719 + 1.0;
    float _1723 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1693);
    float _1725 = _1673 * _1661;
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1729 = _744 + _1727;
    bool _1731 = _1649 > 0.5;
    float _1733 = 1.0 / _1669;
    float _1735 = in.m_59.x;
    float _1737 = fma(_1725, _1729, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1739 = _1645;
    if (_1665)
    {
        float _1741 = _1731 ? _1721 : _1645;
        _1739 = _1741;
    }
    float _1743 = _1739;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1745;
    float _1749 = in.m_63.x;
    float _1751 = in.m_63.y;
    float _1753 = in.m_63.z;
    bool _1755 = _1078 != 0.0;
    bool _1757 = isnan(_1078);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(0.0);
    bool _1763 = _1759 || _1761;
    float _1765 = -_1705;
    float _1767 = _1765 + 1.0;
    bool _1769 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1771 = isnan(_744);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = _1747 * _1687;
    bool _1783 = _1076 == 0.0;
    bool _1785 = !_1763;
    bool _1787 = _1783 && _1785;
    float _1789 = exp2(_1655);
    bool _1791 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1793 = isnan(_744);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1799 = _1795 || _1797;
    float _1801 = float(_1799);
    float _1803 = -_1779;
    float _1805 = _1803 + 1.0;
    bool _1807 = _1080 == 0.0;
    bool _1809 = _1807 && _1787;
    float _1811 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1723);
    float _1813 = _1681 * _1733;
    float _1815 = _1801 * _1805;
    float _1817 = -_1801;
    float _1819 = _1817 + 1.0;
    float _1821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1823 = fma(_1813, _1685, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1825 = _1705 * _1819;
    float _1827 = _1717 * _1767;
    float _1829 = -_1717;
    float _1831 = _1829 + 1.0;
    float _1833 = 0.0;
    float _1835 = _1735;
    if (_1677)
    {
        _1833 = _1735;
    }
    float _1837 = _1833;
    out.m_65.x = _1300;
    out.m_65.y = _1298;
    out.m_65.z = _1302;
    float _1839 = _1737 * _1827;
    float _1841 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1843 = _1751;
    float _1845 = _1749;
    float _1847 = _1837;
    float _1849 = _1753;
    if (!_1809)
    {
        float _1851 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1751);
        _1843 = _1851;
    }
    float _1853 = _1843;
    if (!_1809)
    {
        float _1855 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1749);
        _1845 = _1855;
    }
    float _1857 = _1845;
    if (_1691)
    {
        float _1859 = -_1837;
        float _1861 = _1859 + 1.0;
        _1847 = _1861;
    }
    float _1863 = _1847;
    if (!_1809)
    {
        float _1865 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1753);
        _1849 = _1865;
    }
    float _1867 = _1849;
    float _1869 = -_1853;
    float _1871 = _1126 * _1869;
    float _1873 = _1132 * _1853;
    float _1875 = _1134 * _1853;
    if (_1677)
    {
        _1835 = _1863;
    }
    float _1877 = _1835;
    float _1879 = fma(_1136, _1857, _1871);
    float _1881 = fma(_1144, _1857, _1873);
    float _1883 = fma(_1152, _1857, _1875);
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1887 = _744 + _1885;
    float _1889 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1891 = fma(_1138, _1867, _1879);
    float _1893 = fma(_1156, _1867, _1881);
    float _1895 = fma(_1146, _1867, _1883);
    float _1897 = fma(_1889, _1877, -0.5);
    float _1899 = in.m_67.w;
    float _1901 = fma(_1841, _1743, -0.5);
    float _1903 = fma(_986, _1897, _1000);
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1907 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1909 = -_940;
    float _1911 = fma(_1008, _1901, _1909);
    float _1913 = -_1789;
    float _1915 = _1913 + 1.0;
    float _1917 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1839);
    float _1919 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1921 = fma(_1891, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1905);
    float _1923 = _1903 + 0.5;
    float _1925 = fma(_1891, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1907);
    float _1927 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1811);
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1931 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1933 = fma(_1781, _1887, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1935 = fma(_1823, _1825, _1917);
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1939 = fma(_1895, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1921);
    float _1941 = _1927 + _1564;
    float _1943 = fma(_1933, _1815, _1935);
    float _1945 = _1911 + 0.5;
    float _1947 = _1941 * 0.5;
    float _1949 = fma(_1891, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1919);
    float _1951 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1943);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_69.w = _1899;
    float _1955 = fma(_1895, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1949);
    float _1957 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1959 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1961 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1963 = _1951 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1965 = fma(_1895, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1925);
    float _1967 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1923;
    out.m_71.w = _1945;
    out.m_73.x = _1959;
    out.m_73.y = _1957;
    out.m_73.z = _1961;
    out.m_73.w = _1963;
    out.m_75.x = _1939;
    out.m_75.y = _1955;
    out.m_75.z = _1965;
    out.gl_Position.x = _1588;
    out.gl_Position.y = _1602;
    out.gl_Position.z = _1927;
    out.gl_Position.w = _1564;
    out.m_77.z = _1947;
    out.m_77.w = _1564;
    out.m_45.x = _1967;
    float _1969 = _1931 * _1622;
    float _1971 = -_1931;
    float _1973 = _1971 + 1.0;
    float _1975 = _1633 * _1969;
    float _1977 = _1643 * _1969;
    float _1979 = _1633 * _1973;
    float _1981 = fma(_1639, _1975, _1627);
    float _1983 = fma(_1641, _1975, _1629);
    float _1985 = fma(_1633, _1977, _1631);
    out.m_79.x = _1981;
    out.m_79.y = _1983;
    out.m_79.z = _1985;
    out.m_79.w = _1979;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

