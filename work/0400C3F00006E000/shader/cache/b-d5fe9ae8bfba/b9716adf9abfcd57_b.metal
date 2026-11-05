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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_57 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_81 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_73 [[attribute(2)]];
    float4 m_71 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_65 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_75 [[attribute(12)]];
    float4 m_67 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2162 = false;
    bool _1064 = false;
    bool _886 = false;
    bool _666 = false;
    bool _420 = false;
    bool _308 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2848 = as_type<float>(_116);
        out.gl_Position.z = _2848;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    float _122 = in.m_51.x;
    float _124 = in.m_51.y;
    bool _126 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_120);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_120;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _122;
    out.m_53.y = _124;
    float _140 = _138;
    float _142 = _124;
    float _144 = _122;
    if (_134)
    {
        float _146 = float(_100);
        _110 = _146;
    }
    float _148 = _110;
    bool _150 = _138 >= _148;
    bool _152 = !_134;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _118 = as_type<int>(_160);
    }
    int _162 = _118;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2928 = as_type<float>(_162);
        out.gl_Position.z = _2928;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_55.w;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = in.m_44.x;
    float _186 = in.m_44.y;
    float _188 = in.m_44.z;
    float _190 = 0.0;
    float _192 = _166;
    if (!_176)
    {
        float _194 = _166 * _166;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _198;
    if (!_176)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_176;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _166 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _166);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_176;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _166 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _192 = _262;
    }
    float _264 = _192;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _178, _268);
    float _276 = fma(_264, _180, _270);
    float _278 = fma(_264, _182, _272);
    float _280 = fma(_274, _164, _184);
    float _282 = fma(_276, _164, _186);
    float _284 = fma(_278, _164, _188);
    bool _286 = !_266;
    float _288 = _280;
    float _290 = _284;
    float _306;
    if (!_286)
    {
        float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _294 = _122 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _298 = _296 * _292;
        float _300 = floor(_298);
        float _302 = -_300;
        float _304 = _298 + _302;
        _306 = _304;
        _308 = true;
    }
    else
    {
        float _310 = float(_100);
        float _312 = 1.0 / _310;
        float _314 = _138 * _312;
        _306 = _314;
    }
    _308 = false;
    float _316 = _306;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _320 = _316 + _318;
    bool _322 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _324 = isnan(_316);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    bool _338 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_316);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_332;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = 1.0 / _336;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _362 = _348 * _352;
    float _364 = -_348;
    float _366 = _364 + 1.0;
    float _368 = _320 * _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _370;
    float _374 = fma(_356, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = _374 * _362;
    float _384 = fma(_378, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _388 = _384 * _362;
    float _390 = _380 * _362;
    float _392 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _394 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _396 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[144].x, _386);
    float _398 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[144].y, _392);
    float _400 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[144].z, _394);
    bool _402 = !_360;
    float _418;
    if (!_402)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _406 = _122 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _418 = _416;
        _420 = true;
    }
    else
    {
        float _422 = float(_100);
        float _424 = 1.0 / _422;
        float _426 = _138 * _424;
        _418 = _426;
    }
    _420 = false;
    float _428 = _418;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _432 = _428 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = _428 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _428 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _450;
    float _454 = 1.0 / _452;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _458 = 1.0 / _444;
    bool _460 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _462 = isnan(_428);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = 1.0 / _448;
    float _474 = _432 * _454;
    bool _476 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _478 = isnan(_428);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _436 * _458;
    bool _490 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _492 = isnan(_428);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _502;
    float _506 = -_500;
    float _508 = _506 + 1.0;
    float _510 = fma(_504, _488, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = _440 * _472;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _518;
    float _522 = _470 * _508;
    float _524 = -_470;
    float _526 = _524 + 1.0;
    float _528 = fma(_516, _488, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _530 = fma(_520, _488, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _532 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _534 = isnan(_428);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _556 = _542 * _526;
    float _558 = -_542;
    float _560 = _558 + 1.0;
    float _562 = fma(_546, _512, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _564 = fma(_550, _512, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _566 = _486 * _560;
    float _568 = fma(_554, _512, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _570 = -_486;
    float _572 = _570 + 1.0;
    float _574 = _510 * _566;
    float _576 = _528 * _566;
    float _578 = _530 * _566;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _584;
    float _588 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].x, _574);
    float _590 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].y, _576);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _592;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].z, _578);
    float _598 = fma(_582, _474, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _600 = fma(_586, _474, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _602 = fma(_594, _474, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _604 = fma(_562, _556, _588);
    float _606 = fma(_564, _556, _590);
    float _608 = fma(_568, _556, _596);
    float _610 = fma(_598, _522, _604);
    float _612 = fma(_600, _522, _606);
    float _614 = fma(_602, _522, _608);
    float _616 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[110].x, _610);
    float _618 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[110].y, _612);
    float _620 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[110].z, _614);
    float _622 = in.m_55.x;
    float _624 = in.m_55.y;
    float _626 = in.m_55.z;
    float _628 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _630 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _632 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _636 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _638 = _630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _636;
    out.m_57.y = _638;
    out.m_57.z = _640;
    out.m_57.w = _634;
    float _642 = _400 * _626;
    float _644 = _398 * _624;
    float _646 = _396 * _622;
    bool _648 = !_456;
    float _664;
    if (!_648)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _652 = _122 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_100);
        float _670 = 1.0 / _668;
        float _672 = _138 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _678 = _674 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _682 = _674 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _686 = _674 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _700 = 1.0 / _690;
    bool _702 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _704 = 1.0 / _694;
    float _706 = 1.0 / _698;
    bool _708 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _710 = isnan(_674);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _678 * _700;
    bool _722 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _724 = isnan(_674);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    bool _734 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _736 = isnan(_674);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_718;
    float _748 = _746 + 1.0;
    float _750 = _682 * _704;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _752;
    float _756 = _732 * _748;
    bool _758 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _760 = isnan(_674);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = -_732;
    float _772 = _770 + 1.0;
    float _774 = fma(_754, _750, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _780 = _686 * _706;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _786;
    float _790 = _744 * _772;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _796 = fma(_784, _750, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _798 = fma(_788, _750, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _800 = -_744;
    float _802 = _800 + 1.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _808 = fma(_778, _780, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _810 = fma(_794, _780, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _812 = _768 * _802;
    float _814 = -_768;
    float _816 = _814 + 1.0;
    float _818 = fma(_806, _780, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _820 = _774 * _812;
    float _822 = _796 * _812;
    float _824 = _798 * _812;
    float _826 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].x, _820);
    float _828 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].y, _822);
    float _830 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].z, _824);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _836;
    float _840 = fma(_808, _790, _826);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _842;
    float _846 = fma(_834, _720, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _848 = fma(_838, _720, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _850 = fma(_818, _790, _828);
    float _852 = fma(_844, _720, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _854 = fma(_810, _790, _830);
    float _856 = fma(_846, _756, _840);
    float _858 = fma(_848, _756, _850);
    float _860 = fma(_852, _756, _854);
    float _862 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[126].x, _856);
    float _864 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[126].y, _858);
    float _866 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[126].z, _860);
    bool _868 = !_702;
    float _884;
    if (!_868)
    {
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _872 = _122 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _876 = _874 * _870;
        float _878 = floor(_876);
        float _880 = -_878;
        float _882 = _876 + _880;
        _884 = _882;
        _886 = true;
    }
    else
    {
        float _888 = float(_100);
        float _890 = 1.0 / _888;
        float _892 = _138 * _890;
        _884 = _892;
    }
    _886 = false;
    float _894 = _884;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _898 = _894 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _904 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _906 = isnan(_894);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _924 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _926 = isnan(_894);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = 1.0 / _902;
    float _938 = -_914;
    float _940 = _938 + 1.0;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _942;
    bool _946 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _948 = isnan(_894);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _934 * _940;
    float _960 = -_934;
    float _962 = _960 + 1.0;
    bool _964 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _966 = 1.0 / _918;
    float _968 = _956 * _962;
    float _970 = -_956;
    float _972 = _970 + 1.0;
    float _974 = 1.0 / _922;
    float _976 = _944 * _936;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _982 = fma(_976, _898, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _984 = _980 * _966;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _988 = _894 + _986;
    bool _990 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _992 = isnan(_894);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1002;
    float _1006 = _982 * _968;
    float _1008 = fma(_984, _988, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1012 = _894 + _1010;
    float _1014 = -_1000;
    float _1016 = _1014 + 1.0;
    float _1018 = _1004 * _974;
    float _1020 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1006);
    float _1022 = _914 * _1016;
    float _1024 = fma(_1018, _1012, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1026 = fma(_1008, _958, _1020);
    float _1028 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1030 = _866 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1032 = fma(_1024, _1022, _1026);
    float _1034 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1036 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1038 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1032);
    float _1040 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    out.m_59.y = (*spvDescriptorSet0.vp_c9)._m0[159].y;
    out.m_59.z = (*spvDescriptorSet0.vp_c9)._m0[159].z;
    out.m_61.x = _1036;
    out.m_61.y = _1040;
    out.m_61.z = _1042;
    out.m_61.w = _1044;
    bool _1046 = !_964;
    float _1062;
    if (!_1046)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1050 = _122 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[14].z, _138);
        float _1054 = _1052 * _1048;
        float _1056 = floor(_1054);
        float _1058 = -_1056;
        float _1060 = _1054 + _1058;
        _1062 = _1060;
        _1064 = true;
    }
    else
    {
        float _1066 = float(_100);
        float _1068 = 1.0 / _1066;
        float _1070 = _138 * _1068;
        _1062 = _1070;
    }
    _1064 = false;
    float _1072 = _1062;
    float _1074 = _122 * 2.0;
    float _1076 = _122 + _124;
    float _1078 = _124 * 2.0;
    float _1080 = in.m_51.z;
    float _1082 = floor(_1074);
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1094 = _1092 != 0;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1100 = _1076 + (-1.0);
    float _1102 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1104 = floor(_1078);
    float _1106 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1108 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1114 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1116 = 1.0 / _1098;
    bool _1118 = _1082 > 0.0;
    bool _1120 = _1082 >= 0.0;
    bool _1122 = isnan(_1082);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = 1.0 / _1112;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1136 = _1104 > 0.0;
    float _1138 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _1140 = _1104 >= 0.0;
    bool _1142 = isnan(_1104);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan(0.0);
    bool _1148 = _1144 || _1146;
    float _1150 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1152 = 1.0 / _1134;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1158 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1150);
    float _1160 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1162 = 1.0 / _1156;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1168 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1160);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1178 = 1.0 / _1166;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1192 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1138);
    float _1194 = _1172 * _1152;
    float _1196 = _1186 * _1116;
    float _1198 = _1190 * _1130;
    float _1200 = _1080 * 2.0;
    float _1202 = 1.0 / _1182;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1208 = _1176 * _1162;
    int _1210 = _1128 ? 0 : 1;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1212;
    int _1216 = _1148 ? 0 : 1;
    float _1218 = floor(_1200);
    float _1220 = _124 + _1080;
    float _1222 = _1214 * _1178;
    bool _1224 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1226 = isnan(_1072);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = _122 + _1080;
    float _1238 = _1220 + (-1.0);
    float _1240 = 1.0 / _1206;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1246 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1254 = _1072 + _1252;
    float _1256 = _1244 * _1202;
    float _1258 = _1236 + (-1.0);
    bool _1260 = _1218 > 0.0;
    float _1262 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1168);
    float _1264 = fma(_1198, _1254, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    bool _1266 = _1218 >= 0.0;
    bool _1268 = isnan(_1218);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan(0.0);
    bool _1274 = _1270 || _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1278 = _1072 + _1276;
    bool _1280 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1282 = isnan(_1072);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    float _1292 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1192);
    bool _1294 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1296 = isnan(_1072);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = _1250 * _1240;
    float _1308 = -_1290;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_1208, _1278, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1314 = -_1304;
    float _1316 = _1314 + 1.0;
    bool _1318 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1320 = isnan(_1072);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1326 = _1322 || _1324;
    float _1328 = float(_1326);
    float _1330 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1158);
    float _1332 = _1304 * _1310;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1336 = _1072 + _1334;
    bool _1338 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1340 = isnan(_1072);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1346 = _1342 || _1344;
    float _1348 = float(_1346);
    float _1350 = _1234 * _1316;
    float _1352 = -_1234;
    float _1354 = _1352 + 1.0;
    float _1356 = fma(_1196, _1336, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1358 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1360 = isnan(_1072);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -_1348;
    float _1372 = _1370 + 1.0;
    float _1374 = _1348 * _1354;
    bool _1376 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1378 = isnan(_1072);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1384 = _1380 || _1382;
    float _1386 = float(_1384);
    float _1388 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1392 = _1072 + _1390;
    float _1394 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1396 = log2(_1394);
    bool _1398 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1400 = isnan(_1072);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = -_1386;
    float _1412 = _1410 + 1.0;
    float _1414 = -_1328;
    float _1416 = _1414 + 1.0;
    float _1418 = _1368 * _1372;
    float _1420 = -_1368;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1194, _1392, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1428 = _1072 + _1426;
    float _1430 = _1328 * _1412;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1434 = _1072 + _1432;
    float _1436 = _1408 * _1416;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1440 = _1072 + _1438;
    float _1442 = _1386 * _1422;
    int _1444 = _1274 ? 0 : 1;
    float _1446 = fma(_1222, _1428, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1448 = fma(_1256, _1434, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1450 = _1356 * _1436;
    float _1452 = -_1408;
    float _1454 = _1452 + 1.0;
    float _1456 = fma(_1306, _1440, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    int _1458 = ~_1444;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = _1396 * _138;
    int _1466 = _1462;
    if (!_1260)
    {
        int _1468 = ~_1444;
        int _1470 = _1468 + 1;
        _1466 = _1470;
    }
    int _1472 = _1466;
    float _1474 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1450);
    bool _1476 = !_1090;
    int _1478 = _1476 ? 0 : 1;
    int _1480 = ~_1216;
    int _1482 = _1480 + 1;
    int _1484 = _1482 + 1;
    float _1486 = fma(_1264, _1430, _1474);
    int _1488 = abs(_1478);
    float _1490 = exp2(_1464);
    float _1492 = in.m_63.x;
    float _1494 = in.m_63.y;
    float _1496 = in.m_63.z;
    int _1498 = _1484;
    if (!_1136)
    {
        int _1500 = ~_1216;
        int _1502 = _1500 + 1;
        _1498 = _1502;
    }
    int _1504 = _1498;
    float _1506 = fma(_1424, _1442, _1486);
    int _1508 = ~_1210;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    float _1514 = fma(_1312, _1418, _1506);
    int _1516 = _1512;
    if (!_1118)
    {
        int _1518 = ~_1210;
        int _1520 = _1518 + 1;
        _1516 = _1520;
    }
    int _1522 = _1516;
    float _1524 = rsqrt(_1292);
    bool _1526 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1528 = isnan(1.0);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1534 = _1530 || _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1538 = 1.0 + _1536;
    bool _1540 = !_1094;
    int _1542 = _1540 ? 0 : 1;
    float _1544 = fma(_1446, _1374, _1514);
    bool _1546 = !_1086;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = float(_1488);
    float _1552 = 1.0 / _1538;
    float _1554 = float(_1522);
    float _1556 = -_1490;
    float _1558 = _1556 + 1.0;
    int _1560 = abs(_1542);
    float _1562 = fma(_1448, _1350, _1544);
    bool _1564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1566 = isnan(0.0);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1572 = _1568 || _1570;
    float _1574 = _1550 * _1554;
    float _1576 = float(_1472);
    float _1578 = rsqrt(_1330);
    int _1580 = abs(_1548);
    float _1582 = fma(_1456, _1332, _1562);
    float _1584 = float(_1504);
    float _1586 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1582);
    float _1588 = float(_1580);
    float _1590 = _1574 * (-2.0);
    float _1592 = _1572 ? _1558 : 0.0;
    float _1594 = _124 + (-0.5);
    float _1596 = float(_1560);
    float _1598 = fma(_1590, _1494, _1494);
    float _1600 = fma(_1246, _1590, _1246);
    if (_1534)
    {
        float _1602 = _1592 * _1552;
        _140 = _1602;
    }
    float _1604 = _140;
    float _1606 = _1588 * _1576;
    float _1608 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1598);
    float _1610 = _1596 * _1584;
    float _1612 = in.m_65.x;
    float _1614 = in.m_65.y;
    float _1616 = in.m_65.z;
    float _1618 = rsqrt(_1262);
    float _1620 = fma(_1600, _1604, _1608);
    float _1622 = _1610 * (-2.0);
    float _1624 = _1606 * (-2.0);
    float _1626 = _1620 * 0.15915493667125701904296875;
    float _1628 = fma(_1388, _1622, _1388);
    float _1630 = in.m_67.x;
    float _1632 = fma(_1106, _1624, _1106);
    float _1634 = sqrt(_1292);
    float _1636 = fma(_1624, _1492, _1492);
    float _1638 = in.m_69.x;
    float _1640 = in.m_69.y;
    float _1642 = in.m_69.z;
    float _1644 = _122 + (-0.5);
    float _1646 = fma(_1622, _1496, _1496);
    float _1648 = _1080 + (-0.5);
    float _1650 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1636);
    float _1652 = _1626 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    float _1656 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1646);
    float _1658 = fma(_1632, _1604, _1650);
    bool _1660 = _124 > 0.5;
    float _1662 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, 2.0, -1.0);
    float _1664 = precise::clamp(_1662, 0.0, 1.0);
    float _1666 = -_1612;
    float _1668 = fma(_1586, _1612, _1666);
    float _1670 = fma(_1628, _1604, _1656);
    float _1672 = -_1616;
    float _1674 = fma(_1586, _1616, _1672);
    float _1676 = fma(_1664, 0.10000002384185791015625, 0.699999988079071044921875);
    float _1678 = -_1614;
    float _1680 = fma(_1586, _1614, _1678);
    float _1682 = _1670 * 0.15915493667125701904296875;
    float _1684 = _1658 * 0.15915493667125701904296875;
    float _1686 = fma(_1668, _1630, _1612);
    float _1688 = fma(_1680, _1630, _1614);
    float _1690 = fma(_1674, _1630, _1616);
    float _1692 = _1626 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _282 * _1640;
    float _1698 = _1686 * _1676;
    float _1700 = _1688 * _1676;
    float _1702 = _1690 * _1676;
    float _1704 = fma(_280, _1638, _1696);
    float _1706 = _1698 * _1524;
    float _1708 = _1700 * _1578;
    float _1710 = _1682 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    float _1714 = _1634 * _1706;
    float _1716 = _1634 * _1708;
    float _1718 = _1702 * _1618;
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1714);
    float _1722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1716);
    float _1724 = _1684 * 6.283185482025146484375;
    float _1726 = sin(_1724);
    float _1728 = in.m_71.x;
    float _1730 = in.m_71.y;
    float _1732 = in.m_71.z;
    float _1734 = _1634 * _1718;
    float _1736 = _1102 * _1722;
    float _1738 = _1108 * _1720;
    float _1740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1734);
    float _1742 = _1684 * 6.283185482025146484375;
    float _1744 = cos(_1742);
    float _1746 = _1694 * _1712;
    float _1748 = _1654 * _1712;
    float _1750 = _1712 * _1736;
    float _1752 = _1114 * _1740;
    float _1754 = _1682 * 6.283185482025146484375;
    float _1756 = sin(_1754);
    float _1758 = _1726 * _1654;
    float _1760 = _1744 * _1694;
    float _1762 = _1726 * _1694;
    float _1764 = _1744 * _1654;
    float _1766 = _1744 * _1750;
    float _1768 = fma(_1756, _1764, _1762);
    float _1770 = -_1760;
    float _1772 = fma(_1756, _1758, _1770);
    float _1774 = -_1758;
    float _1776 = fma(_1756, _1760, _1774);
    float _1778 = -_1736;
    float _1780 = _1756 * _1778;
    float _1782 = fma(_1768, _1738, _1766);
    float _1784 = _1726 * _1750;
    float _1786 = fma(_1756, _1762, _1764);
    float _1788 = fma(_1748, _1738, _1780);
    float _1790 = fma(_1776, _1752, _1782);
    float _1792 = fma(_1772, _1738, _1784);
    float _1794 = _282 * _1730;
    float _1796 = fma(_1746, _1752, _1788);
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1800 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1802 = fma(_280, _1728, _1794);
    float _1804 = fma(_1786, _1752, _1792);
    float _1806 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1798);
    float _1808 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1800);
    float _1810 = fma(_284, _1642, _1704);
    float _1812 = fma(_284, _1732, _1802);
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1806);
    float _1816 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1808);
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1820 = _1812 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1822 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1824 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1826 = in.m_73.x;
    float _1828 = in.m_73.y;
    float _1830 = in.m_73.z;
    float _1832 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1834 = _1818 + _1822;
    float _1836 = _1820 + _1824;
    float _1838 = in.m_51.w;
    float _1840 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1832);
    float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1844 = _1834 + _1842;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1848 = _1836 + _1846;
    float _1850 = in.m_75.y;
    float _1852 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1840);
    float _1854 = _1844 * _1844;
    float _1856 = _1848 * _1848;
    float _1858 = in.m_75.x;
    float _1860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1862 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1864 = _1854 + _1856;
    float _1866 = sqrt(_1864);
    float _1868 = _282 * _1828;
    float _1870 = fma(_280, _1826, _1868);
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1874 = _1872 != 0;
    float _1876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1878 = _1838 > 0.5;
    float _1880 = fma(_284, _1830, _1870);
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1884 = _1882 != 0;
    float _1886 = -_1850;
    float _1888 = _1886 + 1.0;
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1892 = _1890 != 0;
    float _1894 = _1880 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1896 = _1866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1902 = _1900 != 0;
    float _1904 = _1894 + _1862;
    int _1906 = int(_1660);
    int _1908 = _1874 ? 2 : 0;
    int _1910 = _1906 | _1908;
    int _1912 = _1884 ? 4 : 0;
    int _1914 = _1910 | _1912;
    int _1916 = _1892 ? 8 : 0;
    int _1918 = _1914 | _1916;
    int _1920 = _1902 ? 16 : 0;
    int _1922 = _1918 | _1920;
    int _1924 = _1878 ? 32 : 0;
    int _1926 = _1922 | _1924;
    int _1928 = _1896 ? 64 : 0;
    int _1930 = _1926 | _1928;
    int _1932 = _1930 & 32;
    bool _1934 = _1878;
    float _1936 = _1830;
    float _1938 = as_type<float>(_1932);
    float _1940 = _1854;
    int _1942 = as_type<int>(_1904);
    float _1944 = _1850;
    float _1946 = _1818;
    float _1948 = _1834;
    if (_1874)
    {
        bool _1950 = _122 > 0.5;
        _1934 = _1950;
    }
    bool _1952 = _1934;
    if (!_1896)
    {
        _142 = _1856;
    }
    float _1954 = _142;
    float _1956 = _1954;
    if (!_1896)
    {
        _1936 = _1834;
    }
    float _1958 = _1936;
    float _1960 = _1958;
    if (!_1896)
    {
        _1938 = _1836;
    }
    float _1962 = _1938;
    float _1964 = _1962;
    if (!_1896)
    {
        _288 = _1904;
    }
    float _1966 = _288;
    bool _1968 = !_1896;
    float _1970 = _1966;
    if (!_1968)
    {
        float _1972 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1976 = _1866 + _1974;
        float _1978 = rsqrt(_1864);
        float _1980 = _1976 * _1972;
        float _1982 = _1904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1984 = _1980 * 0.15915493667125701904296875;
        float _1986 = _1984 * 6.283185482025146484375;
        float _1988 = sin(_1986);
        float _1990 = _1984 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        float _1994 = fma(_1988, _1982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1996 = _1978 * _1994;
        float _1998 = _1992 + (-1.0);
        float _2000 = fma(_1844, _1996, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2002 = fma(_1848, _1996, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2004 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2008 = _2000 + _2006;
        float _2010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2012 = _2002 + _2010;
        float _2014 = fma(_1904, _1992, _2004);
        float _2016 = _2008 * _2008;
        float _2018 = _2012 * _2012;
        _1970 = _2014;
        _1940 = _2016;
        _1956 = _2018;
        _290 = _1984;
        _144 = _2012;
        _1960 = _2000;
        _1964 = _2002;
    }
    float _2020 = _1970;
    float _2022 = _1940;
    float _2024 = _1956;
    float _2026 = _290;
    float _2028 = _144;
    float _2030 = _1960;
    float _2032 = _1964;
    bool _2034 = _1838 > 0.5;
    float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2038 = _2020 + _2036;
    float _2040 = _2026;
    bool _2042 = _2034;
    int _2044 = as_type<int>(_2022);
    float _2046 = _2028;
    float _2048 = _2032;
    float _2050 = _2020;
    if (_1884)
    {
        float _2052 = -_1858;
        float _2054 = _2052 + 1.0;
        _1942 = as_type<int>(_2054);
    }
    int _2056 = _1942;
    if (!_1874)
    {
        _2040 = _1858;
    }
    float _2058 = _2040;
    int _2060 = _2034 ? as_type<int>(_1888) : as_type<int>(_1850);
    float _2062 = fma(_2038, _2038, _2022);
    float _2064 = _2058;
    if (_1884)
    {
        bool _2066 = _1080 > 0.5;
        _2042 = _2066;
    }
    bool _2068 = _2042;
    if (_1874)
    {
        float _2070 = -_1858;
        float _2072 = _2070 + 1.0;
        _2044 = as_type<int>(_2072);
    }
    int _2074 = _2044;
    float _2076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2078 = _2062 + _2024;
    float _2080 = _1892 ? as_type<float>(_2060) : _1850;
    if (!_1884)
    {
        _2046 = _1858;
    }
    float _2082 = _2046;
    float _2084 = _2082;
    if (_1902)
    {
        float _2086 = _1660 ? _1888 : _1850;
        _1944 = _2086;
    }
    float _2088 = _1944;
    if (_1874)
    {
        float _2090 = _1952 ? as_type<float>(_2074) : _1858;
        _2064 = _2090;
    }
    float _2092 = _2064;
    float _2094 = sqrt(_2078);
    if (_1884)
    {
        float _2096 = _2068 ? as_type<float>(_2056) : _1858;
        _2084 = _2096;
    }
    float _2098 = _2084;
    float _2100 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2102 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2104 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2108 = _2100 * _1876;
    float _2110 = _2102 * _1898;
    float _2112 = _2104 * _1860;
    float _2114 = _2106 * _2076;
    out.m_77.x = _2112;
    out.m_77.y = _2108;
    out.m_77.z = _2114;
    out.m_77.w = _2110;
    bool _2116 = _2094 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2118 = isnan(_2094);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2124 = _2120 || _2122;
    float _2126 = _2106;
    if (!_2124)
    {
        _2126 = 1.0;
    }
    float _2128 = _2126;
    bool _2130 = !_2124;
    float _2132 = _2128;
    if (!_2130)
    {
        bool _2134 = _2094 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2136 = isnan(_2094);
        bool _2138 = _2134 || _2136;
        bool _2140 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2142 = _2138 || _2140;
        if (!_2142)
        {
            float _2144 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2146 = _2094 + _2144;
            float _2148 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2150 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2148;
            float _2152 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2154 = _2152 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2156 = 1.0 / _2150;
            float _2158 = _2146 * _2156;
            float _2160 = fma(_2158, _2154, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2132 = _2160;
            _2162 = true;
        }
        else
        {
            bool _2164 = _2094 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2166 = isnan(_2094);
            bool _2168 = _2164 || _2166;
            bool _2170 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2172 = _2168 || _2170;
            if (!_2172)
            {
                float _2174 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2176 = _2094 + _2174;
                float _2178 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2180 = _2178 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2182 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2184 = _2182 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2186 = 1.0 / _2180;
                float _2188 = _2176 * _2186;
                float _2190 = fma(_2188, _2184, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2132 = _2190;
                _2162 = true;
            }
            else
            {
                _2132 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2162 = false;
    float _2192 = _2132;
    float _2194 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2196 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2198 = _2030 + _2196;
    float _2200 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2194);
    bool _2202 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2204 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(0.5);
    bool _2210 = _2206 || _2208;
    float _2212 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2214 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2216 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan(0.5);
    bool _2222 = _2218 || _2220;
    float _2224 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2200);
    float _2226 = fma(_2198, _2192, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2228 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2212);
    float _2230 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2232 = _2020 + _2230;
    float _2234 = _2224 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2238 = _2032 + _2236;
    float _2240 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2228);
    float _2242 = fma(_2232, _2192, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2244 = 1.0 / _2234;
    float _2246 = fma(_2238, _2192, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2248 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2250 = _2192;
    float _2252 = _2234;
    if (_2222)
    {
        _2048 = _2226;
    }
    float _2254 = _2048;
    float _2256 = _2248 + _2234;
    float _2258 = _2254;
    if (_2222)
    {
        _2050 = _2242;
    }
    float _2260 = _2050;
    float _2262 = _2260;
    if (_2222)
    {
        _2250 = _2246;
    }
    float _2264 = _2250;
    float _2266 = _2264;
    if (!_2222)
    {
        float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2270 = _1894 + _2268;
        float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2274 = _1818 + _2272;
        float _2276 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2278 = -_1818;
        float _2280 = _2278 + _2226;
        float _2282 = _2270 * _2270;
        float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2286 = _1820 + _2284;
        float _2288 = fma(_2274, _2274, _2282);
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2292 = fma(_2286, _2286, _2288);
        float _2294 = sqrt(_2292);
        float _2296 = _2276 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2298 = -_1894;
        float _2300 = _2298 + _2242;
        float _2302 = precise::min(_2294, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2304 = _2302 * _2290;
        float _2306 = _2296 * _2304;
        float _2308 = -_1820;
        float _2310 = _2308 + _2246;
        float _2312 = fma(_2280, _2306, _1818);
        float _2314 = fma(_2300, _2306, _1894);
        float _2316 = fma(_2310, _2306, _1820);
        _2262 = _2314;
        _2258 = _2312;
        _2266 = _2316;
    }
    float _2318 = _2262;
    float _2320 = _2258;
    float _2322 = _2266;
    if (_2210)
    {
        _1946 = 1.0;
    }
    float _2324 = _1946;
    float _2326 = _2256 * _2244;
    float _2328 = _2326 * 0.5;
    float _2330 = _2324;
    float _2332 = _2328;
    if (!_2210)
    {
        float _2334 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2338 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2336);
        float _2340 = _2334 * 0.15915493667125701904296875;
        float _2342 = _2340 * 6.283185482025146484375;
        float _2344 = cos(_2342);
        float _2346 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2348 = _2346 * 0.15915493667125701904296875;
        float _2350 = _2340 * 6.283185482025146484375;
        float _2352 = sin(_2350);
        float _2354 = 1.0 / _2344;
        float _2356 = _2348 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        float _2360 = _2352 * _2354;
        float _2362 = 1.0 / _2338;
        float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2366 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2364;
        float _2368 = _2358 * _2360;
        float _2370 = _2348 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        float _2374 = 1.0 / _2368;
        float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2378 = _2362 * _2376;
        float _2380 = 1.0 / _2366;
        float _2382 = _2372 * _2374;
        float _2384 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2386 = fma(_2382, _2378, _2384);
        float _2388 = _2386 * _2380;
        float _2390 = precise::clamp(_2388, 0.0, 1.0);
        _2330 = _2390;
    }
    float _2392 = _2330;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2396 = _2318 + _2394;
    float _2398 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2400 = _2320 + _2398;
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2404 = _2322 + _2402;
    float _2406 = _2396 * _2396;
    float _2408 = fma(_2400, _2400, _2406);
    float _2410 = fma(_2404, _2404, _2408);
    float _2412 = rsqrt(_2410);
    float _2414 = _2412 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2416 = _2400 * _2414;
    float _2418 = _2404 * _2414;
    float _2420 = _2416 * _2416;
    float _2422 = _2418 * _2418;
    float _2424 = _2420 + _2422;
    float _2426 = sqrt(_2424);
    bool _2428 = _2426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2432 = _2426 + _2430;
    float _2434 = _2408;
    float _2436 = _2424;
    float _2438 = _2432;
    float _2440 = _2396;
    float _2442 = _2414;
    if (_2428)
    {
        float _2444 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2434 = _2444;
    }
    float _2446 = _2434;
    if (_2428)
    {
        float _2448 = rsqrt(_2424);
        _2436 = _2448;
    }
    float _2450 = _2436;
    if (_2428)
    {
        float _2452 = _2432 * _2446;
        _2438 = _2452;
    }
    float _2454 = _2438;
    if (_2428)
    {
        float _2456 = _2454 * 0.15915493667125701904296875;
        _2252 = _2456;
    }
    float _2458 = _2252;
    float _2460 = _2412;
    if (_2428)
    {
        float _2462 = _2458 * 6.283185482025146484375;
        float _2464 = sin(_2462);
        _2460 = _2464;
    }
    float _2466 = _2460;
    float _2468 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2470 = precise::max(0.0, _2468);
    float _2472 = _2404;
    float _2474 = _2470;
    float _2476 = _2468;
    if (_2428)
    {
        float _2478 = _2458 * 6.283185482025146484375;
        float _2480 = cos(_2478);
        _2472 = _2480;
    }
    float _2482 = _2472;
    float _2484 = -_2414;
    float _2486 = -_2470;
    float _2488 = fma(_2396, _2484, _2486);
    if (!_2428)
    {
        _2440 = _2418;
    }
    float _2490 = _2440;
    float _2492 = _2490;
    if (_2428)
    {
        float _2494 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2474 = _2494;
    }
    float _2496 = _2474;
    float _2498 = _2496;
    float _2500 = _2466;
    if (_2428)
    {
        float _2502 = fma(_2466, _2496, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2442 = _2502;
    }
    float _2504 = _2442;
    float _2506 = _2504;
    if (!_2428)
    {
        _2498 = _2416;
    }
    float _2508 = _2498;
    float _2510 = _2508;
    if (!_2428)
    {
        _2500 = _2488;
    }
    float _2512 = _2500;
    float _2514 = _2512;
    if (_2428)
    {
        float _2516 = _2482 + (-1.0);
        _2476 = _2516;
    }
    float _2518 = _2476;
    float _2520 = _2518;
    if (_2428)
    {
        float _2522 = _2450 * _2504;
        _1948 = _2522;
    }
    float _2524 = _1948;
    if (!_2428)
    {
        _2506 = _2420;
    }
    float _2526 = _2506;
    float _2528 = sqrt(_2410);
    float _2530 = _2526;
    if (_2428)
    {
        float _2532 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2332 = _2532;
    }
    float _2534 = _2332;
    if (_2428)
    {
        float _2536 = _2416 * _2524;
        _2510 = _2536;
    }
    float _2538 = _2510;
    if (_2428)
    {
        float _2540 = _2418 * _2524;
        _2492 = _2540;
    }
    float _2542 = _2492;
    if (!_2428)
    {
        _2520 = _2422;
    }
    float _2544 = _2520;
    float _2546 = _2544;
    if (_2428)
    {
        float _2548 = fma(_2488, _2482, _2534);
        _2514 = _2548;
    }
    float _2550 = _2514;
    if (_2428)
    {
        float _2552 = _2538 * _2538;
        _2530 = _2552;
    }
    float _2554 = _2530;
    if (_2428)
    {
        float _2556 = _2542 * _2542;
        _2546 = _2556;
    }
    float _2558 = _2546;
    float _2560 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2562 = fma(_2550, _2550, _2554);
    float _2564 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2560);
    float _2566 = _2562 + _2558;
    float _2568 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2572 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2570);
    float _2574 = precise::clamp(_2572, 0.0, 1.0);
    float _2576 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2578 = rsqrt(_2566);
    float _2580 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2568);
    float _2582 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2584 = -_2574;
    float _2586 = _2584 + 1.0;
    float _2588 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2590 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2580);
    float _2592 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2582);
    float _2594 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2588);
    float _2596 = _2590 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2598 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2592);
    float _2600 = abs(_2586);
    float _2602 = log2(_2600);
    float _2604 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2594);
    float _2606 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2608 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2610 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2564);
    float _2612 = _2604 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2614 = _2578 * _2538;
    float _2616 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2618 = _2578 * _2542;
    float _2620 = -_2606;
    float _2622 = fma(_2620, _2576, 1.0);
    float _2624 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2626 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2616);
    float _2628 = _2578 * _2550;
    float _2630 = _2610 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2632 = log2(_2622);
    float _2634 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2626);
    float _2636 = -_2624;
    float _2638 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2636);
    float _2640 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2642 = -_2618;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2638);
    float _2646 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2648 = exp2(_2640);
    float _2650 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2634);
    float _2652 = fma(_2644, -0.5, 0.5);
    float _2654 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2656 = fma(_2644, 0.5, 0.5);
    float _2658 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2646);
    float _2660 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2654);
    float _2662 = 1.0 / _2650;
    float _2664 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2658);
    float _2666 = fma(_2656, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2668 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2660);
    float _2670 = _2628 + 1.0;
    float _2672 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2664);
    float _2674 = fma(_2656, _2666, -0.212114393711090087890625);
    float _2676 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2668);
    float _2678 = sqrt(_2652);
    float _2680 = _2632 * 0.693147182464599609375;
    float _2682 = fma(_2656, _2674, 1.570728778839111328125);
    float _2684 = -_2628;
    float _2686 = fma(_2648, _2670, _2684);
    float _2688 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2690 = _2672 * _2662;
    float _2692 = _2676 * _2662;
    float _2694 = fma(_2690, 0.5, 0.5);
    float _2696 = fma(_2692, -0.5, 0.5);
    float _2698 = fma(_2686, 0.5, 0.5);
    float _2700 = _2678 * 0.636619746685028076171875;
    float3 _6961 = float3(_2694, _2696, _2688);
    float _2702 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6961, float3(0.0), isnan(_6961)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6961, float3(0.0), isnan(_6961)), level(0.0)).x;
    float _2704 = -_2682;
    float _2706 = fma(_2700, _2704, 1.0);
    float3 _6977 = float3(_2694, _2696, _2688);
    float4 _2709 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6977, float3(0.0), isnan(_6977)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6977, float3(0.0), isnan(_6977)), level(0.0)).xyzw;
    float _2711 = _2709.x;
    float _2713 = _2709.y;
    float _2715 = _2709.z;
    float _2717 = _2709.w;
    float2 _6994 = float2(_2706, _2698);
    float3 _2721 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6994, float2(0.0), isnan(_6994)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6994, float2(0.0), isnan(_6994)), level(0.0)).xyz;
    float _2723 = _2721.x;
    float _2725 = _2721.y;
    float _2727 = _2721.z;
    float _2729 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2731 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2733 = _2650 * 0.5;
    bool _2735 = _2392 > 0.0;
    bool _2737 = isnan(_2392);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan(0.0);
    bool _2743 = _2739 || _2741;
    float _2745 = _2672 + _2650;
    float _2747 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2731);
    float _2749 = exp2(_2729);
    float _2751 = _2745 * 0.5;
    float _2753 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2747);
    float _2755 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2753);
    float _2757 = _2392 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2759 = fma(_2676, -0.5, _2733);
    float _2761 = _2755 + _2650;
    float _2763 = _2757 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2672;
    out.gl_Position.y = _2676;
    out.gl_Position.z = _2755;
    out.gl_Position.w = _2650;
    float _2765 = _2761 * 0.5;
    float _2767 = -_2749;
    float _2769 = _2767 + 1.0;
    out.m_47.x = _2763;
    float _2771 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2751;
    out.m_79.y = _2759;
    out.m_79.z = _2765;
    out.m_79.w = _2650;
    float _2773 = _2771 * _2702;
    float _2775 = -_2771;
    float _2777 = _2775 + 1.0;
    float _2779 = _2717 * _2773;
    float _2781 = _2727 * _2773;
    float _2783 = fma(_2723, _2779, _2711);
    float _2785 = fma(_2725, _2779, _2713);
    float _2787 = _2717 * _2777;
    float _2789 = fma(_2717, _2781, _2715);
    out.m_81.x = _2783;
    out.m_81.y = _2785;
    out.m_81.z = _2789;
    out.m_81.w = _2787;
    if (_2743)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2791 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2791;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2162 = false;
    bool _1064 = false;
    bool _886 = false;
    bool _666 = false;
    bool _420 = false;
    bool _308 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2848 = as_type<float>(_116);
        out.gl_Position.z = _2848;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_49.w;
    float _122 = in.m_51.x;
    float _124 = in.m_51.y;
    bool _126 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_120);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_120;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _122;
    out.m_53.y = _124;
    float _140 = _138;
    float _142 = _124;
    float _144 = _122;
    if (_134)
    {
        float _146 = float(_100);
        _110 = _146;
    }
    float _148 = _110;
    bool _150 = _138 >= _148;
    bool _152 = !_134;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _118 = as_type<int>(_160);
    }
    int _162 = _118;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2928 = as_type<float>(_162);
        out.gl_Position.z = _2928;
    }
    if (_154)
    {
        return out;
    }
    float _164 = in.m_55.w;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = in.m_44.x;
    float _186 = in.m_44.y;
    float _188 = in.m_44.z;
    float _190 = 0.0;
    float _192 = _166;
    if (!_176)
    {
        float _194 = _166 * _166;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _198;
    if (!_176)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_176;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _166 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _166);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_176;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _166 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _192 = _262;
    }
    float _264 = _192;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _178, _268);
    float _276 = fma(_264, _180, _270);
    float _278 = fma(_264, _182, _272);
    float _280 = fma(_274, _164, _184);
    float _282 = fma(_276, _164, _186);
    float _284 = fma(_278, _164, _188);
    bool _286 = !_266;
    float _288 = _280;
    float _290 = _284;
    float _306;
    if (!_286)
    {
        float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _294 = _122 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _298 = _296 * _292;
        float _300 = floor(_298);
        float _302 = -_300;
        float _304 = _298 + _302;
        _306 = _304;
        _308 = true;
    }
    else
    {
        float _310 = float(_100);
        float _312 = 1.0 / _310;
        float _314 = _138 * _312;
        _306 = _314;
    }
    _308 = false;
    float _316 = _306;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _320 = _316 + _318;
    bool _322 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _324 = isnan(_316);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    bool _338 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_316);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_332;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = 1.0 / _336;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _362 = _348 * _352;
    float _364 = -_348;
    float _366 = _364 + 1.0;
    float _368 = _320 * _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _370;
    float _374 = fma(_356, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = _374 * _362;
    float _384 = fma(_378, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _388 = _384 * _362;
    float _390 = _380 * _362;
    float _392 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _394 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _396 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[144].x, _386);
    float _398 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[144].y, _392);
    float _400 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[144].z, _394);
    bool _402 = !_360;
    float _418;
    if (!_402)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _406 = _122 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _418 = _416;
        _420 = true;
    }
    else
    {
        float _422 = float(_100);
        float _424 = 1.0 / _422;
        float _426 = _138 * _424;
        _418 = _426;
    }
    _420 = false;
    float _428 = _418;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _432 = _428 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = _428 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _428 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _450;
    float _454 = 1.0 / _452;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _458 = 1.0 / _444;
    bool _460 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _462 = isnan(_428);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = 1.0 / _448;
    float _474 = _432 * _454;
    bool _476 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _478 = isnan(_428);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _436 * _458;
    bool _490 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _492 = isnan(_428);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _502;
    float _506 = -_500;
    float _508 = _506 + 1.0;
    float _510 = fma(_504, _488, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = _440 * _472;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _518;
    float _522 = _470 * _508;
    float _524 = -_470;
    float _526 = _524 + 1.0;
    float _528 = fma(_516, _488, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _530 = fma(_520, _488, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _532 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _534 = isnan(_428);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _556 = _542 * _526;
    float _558 = -_542;
    float _560 = _558 + 1.0;
    float _562 = fma(_546, _512, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _564 = fma(_550, _512, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _566 = _486 * _560;
    float _568 = fma(_554, _512, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _570 = -_486;
    float _572 = _570 + 1.0;
    float _574 = _510 * _566;
    float _576 = _528 * _566;
    float _578 = _530 * _566;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _584;
    float _588 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].x, _574);
    float _590 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].y, _576);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _592;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].z, _578);
    float _598 = fma(_582, _474, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _600 = fma(_586, _474, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _602 = fma(_594, _474, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _604 = fma(_562, _556, _588);
    float _606 = fma(_564, _556, _590);
    float _608 = fma(_568, _556, _596);
    float _610 = fma(_598, _522, _604);
    float _612 = fma(_600, _522, _606);
    float _614 = fma(_602, _522, _608);
    float _616 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[110].x, _610);
    float _618 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[110].y, _612);
    float _620 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[110].z, _614);
    float _622 = in.m_55.x;
    float _624 = in.m_55.y;
    float _626 = in.m_55.z;
    float _628 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _630 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _632 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _636 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _638 = _630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _636;
    out.m_57.y = _638;
    out.m_57.z = _640;
    out.m_57.w = _634;
    float _642 = _400 * _626;
    float _644 = _398 * _624;
    float _646 = _396 * _622;
    bool _648 = !_456;
    float _664;
    if (!_648)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _652 = _122 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_100);
        float _670 = 1.0 / _668;
        float _672 = _138 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _678 = _674 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _682 = _674 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _686 = _674 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _700 = 1.0 / _690;
    bool _702 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _704 = 1.0 / _694;
    float _706 = 1.0 / _698;
    bool _708 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _710 = isnan(_674);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _678 * _700;
    bool _722 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _724 = isnan(_674);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    bool _734 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _736 = isnan(_674);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_718;
    float _748 = _746 + 1.0;
    float _750 = _682 * _704;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _752;
    float _756 = _732 * _748;
    bool _758 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _760 = isnan(_674);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = -_732;
    float _772 = _770 + 1.0;
    float _774 = fma(_754, _750, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _780 = _686 * _706;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _786;
    float _790 = _744 * _772;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _796 = fma(_784, _750, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _798 = fma(_788, _750, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _800 = -_744;
    float _802 = _800 + 1.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _808 = fma(_778, _780, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _810 = fma(_794, _780, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _812 = _768 * _802;
    float _814 = -_768;
    float _816 = _814 + 1.0;
    float _818 = fma(_806, _780, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _820 = _774 * _812;
    float _822 = _796 * _812;
    float _824 = _798 * _812;
    float _826 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].x, _820);
    float _828 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].y, _822);
    float _830 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].z, _824);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _836;
    float _840 = fma(_808, _790, _826);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _842;
    float _846 = fma(_834, _720, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _848 = fma(_838, _720, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _850 = fma(_818, _790, _828);
    float _852 = fma(_844, _720, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _854 = fma(_810, _790, _830);
    float _856 = fma(_846, _756, _840);
    float _858 = fma(_848, _756, _850);
    float _860 = fma(_852, _756, _854);
    float _862 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[126].x, _856);
    float _864 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[126].y, _858);
    float _866 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[126].z, _860);
    bool _868 = !_702;
    float _884;
    if (!_868)
    {
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _872 = _122 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _876 = _874 * _870;
        float _878 = floor(_876);
        float _880 = -_878;
        float _882 = _876 + _880;
        _884 = _882;
        _886 = true;
    }
    else
    {
        float _888 = float(_100);
        float _890 = 1.0 / _888;
        float _892 = _138 * _890;
        _884 = _892;
    }
    _886 = false;
    float _894 = _884;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _898 = _894 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _904 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _906 = isnan(_894);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _924 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _926 = isnan(_894);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = 1.0 / _902;
    float _938 = -_914;
    float _940 = _938 + 1.0;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _942;
    bool _946 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _948 = isnan(_894);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _934 * _940;
    float _960 = -_934;
    float _962 = _960 + 1.0;
    bool _964 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _966 = 1.0 / _918;
    float _968 = _956 * _962;
    float _970 = -_956;
    float _972 = _970 + 1.0;
    float _974 = 1.0 / _922;
    float _976 = _944 * _936;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _982 = fma(_976, _898, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _984 = _980 * _966;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _988 = _894 + _986;
    bool _990 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _992 = isnan(_894);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1002;
    float _1006 = _982 * _968;
    float _1008 = fma(_984, _988, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1012 = _894 + _1010;
    float _1014 = -_1000;
    float _1016 = _1014 + 1.0;
    float _1018 = _1004 * _974;
    float _1020 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1006);
    float _1022 = _914 * _1016;
    float _1024 = fma(_1018, _1012, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1026 = fma(_1008, _958, _1020);
    float _1028 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1030 = _866 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1032 = fma(_1024, _1022, _1026);
    float _1034 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1036 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1038 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1032);
    float _1040 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    out.m_59.y = (*spvDescriptorSet0.vp_c9)._m0[159].y;
    out.m_59.z = (*spvDescriptorSet0.vp_c9)._m0[159].z;
    out.m_61.x = _1036;
    out.m_61.y = _1040;
    out.m_61.z = _1042;
    out.m_61.w = _1044;
    bool _1046 = !_964;
    float _1062;
    if (!_1046)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1050 = _122 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[14].z, _138);
        float _1054 = _1052 * _1048;
        float _1056 = floor(_1054);
        float _1058 = -_1056;
        float _1060 = _1054 + _1058;
        _1062 = _1060;
        _1064 = true;
    }
    else
    {
        float _1066 = float(_100);
        float _1068 = 1.0 / _1066;
        float _1070 = _138 * _1068;
        _1062 = _1070;
    }
    _1064 = false;
    float _1072 = _1062;
    float _1074 = _122 * 2.0;
    float _1076 = _122 + _124;
    float _1078 = _124 * 2.0;
    float _1080 = in.m_51.z;
    float _1082 = floor(_1074);
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1094 = _1092 != 0;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1100 = _1076 + (-1.0);
    float _1102 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1104 = floor(_1078);
    float _1106 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1108 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1114 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1116 = 1.0 / _1098;
    bool _1118 = _1082 > 0.0;
    bool _1120 = _1082 >= 0.0;
    bool _1122 = isnan(_1082);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = 1.0 / _1112;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1136 = _1104 > 0.0;
    float _1138 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _1140 = _1104 >= 0.0;
    bool _1142 = isnan(_1104);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan(0.0);
    bool _1148 = _1144 || _1146;
    float _1150 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1152 = 1.0 / _1134;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1158 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1150);
    float _1160 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1162 = 1.0 / _1156;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1168 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1160);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1178 = 1.0 / _1166;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1192 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1138);
    float _1194 = _1172 * _1152;
    float _1196 = _1186 * _1116;
    float _1198 = _1190 * _1130;
    float _1200 = _1080 * 2.0;
    float _1202 = 1.0 / _1182;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1208 = _1176 * _1162;
    int _1210 = _1128 ? 0 : 1;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1212;
    int _1216 = _1148 ? 0 : 1;
    float _1218 = floor(_1200);
    float _1220 = _124 + _1080;
    float _1222 = _1214 * _1178;
    bool _1224 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1226 = isnan(_1072);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = _122 + _1080;
    float _1238 = _1220 + (-1.0);
    float _1240 = 1.0 / _1206;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1246 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1254 = _1072 + _1252;
    float _1256 = _1244 * _1202;
    float _1258 = _1236 + (-1.0);
    bool _1260 = _1218 > 0.0;
    float _1262 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1168);
    float _1264 = fma(_1198, _1254, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    bool _1266 = _1218 >= 0.0;
    bool _1268 = isnan(_1218);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan(0.0);
    bool _1274 = _1270 || _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1278 = _1072 + _1276;
    bool _1280 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1282 = isnan(_1072);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    float _1292 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1192);
    bool _1294 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1296 = isnan(_1072);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = _1250 * _1240;
    float _1308 = -_1290;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_1208, _1278, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1314 = -_1304;
    float _1316 = _1314 + 1.0;
    bool _1318 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1320 = isnan(_1072);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1326 = _1322 || _1324;
    float _1328 = float(_1326);
    float _1330 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1158);
    float _1332 = _1304 * _1310;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1336 = _1072 + _1334;
    bool _1338 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1340 = isnan(_1072);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1346 = _1342 || _1344;
    float _1348 = float(_1346);
    float _1350 = _1234 * _1316;
    float _1352 = -_1234;
    float _1354 = _1352 + 1.0;
    float _1356 = fma(_1196, _1336, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1358 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1360 = isnan(_1072);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -_1348;
    float _1372 = _1370 + 1.0;
    float _1374 = _1348 * _1354;
    bool _1376 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1378 = isnan(_1072);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1384 = _1380 || _1382;
    float _1386 = float(_1384);
    float _1388 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1392 = _1072 + _1390;
    float _1394 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1396 = log2(_1394);
    bool _1398 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1400 = isnan(_1072);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = -_1386;
    float _1412 = _1410 + 1.0;
    float _1414 = -_1328;
    float _1416 = _1414 + 1.0;
    float _1418 = _1368 * _1372;
    float _1420 = -_1368;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1194, _1392, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1428 = _1072 + _1426;
    float _1430 = _1328 * _1412;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1434 = _1072 + _1432;
    float _1436 = _1408 * _1416;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1440 = _1072 + _1438;
    float _1442 = _1386 * _1422;
    int _1444 = _1274 ? 0 : 1;
    float _1446 = fma(_1222, _1428, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1448 = fma(_1256, _1434, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1450 = _1356 * _1436;
    float _1452 = -_1408;
    float _1454 = _1452 + 1.0;
    float _1456 = fma(_1306, _1440, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    int _1458 = ~_1444;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = _1396 * _138;
    int _1466 = _1462;
    if (!_1260)
    {
        int _1468 = ~_1444;
        int _1470 = _1468 + 1;
        _1466 = _1470;
    }
    int _1472 = _1466;
    float _1474 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1450);
    bool _1476 = !_1090;
    int _1478 = _1476 ? 0 : 1;
    int _1480 = ~_1216;
    int _1482 = _1480 + 1;
    int _1484 = _1482 + 1;
    float _1486 = fma(_1264, _1430, _1474);
    int _1488 = abs(_1478);
    float _1490 = exp2(_1464);
    float _1492 = in.m_63.x;
    float _1494 = in.m_63.y;
    float _1496 = in.m_63.z;
    int _1498 = _1484;
    if (!_1136)
    {
        int _1500 = ~_1216;
        int _1502 = _1500 + 1;
        _1498 = _1502;
    }
    int _1504 = _1498;
    float _1506 = fma(_1424, _1442, _1486);
    int _1508 = ~_1210;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    float _1514 = fma(_1312, _1418, _1506);
    int _1516 = _1512;
    if (!_1118)
    {
        int _1518 = ~_1210;
        int _1520 = _1518 + 1;
        _1516 = _1520;
    }
    int _1522 = _1516;
    float _1524 = rsqrt(_1292);
    bool _1526 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1528 = isnan(1.0);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1534 = _1530 || _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1538 = 1.0 + _1536;
    bool _1540 = !_1094;
    int _1542 = _1540 ? 0 : 1;
    float _1544 = fma(_1446, _1374, _1514);
    bool _1546 = !_1086;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = float(_1488);
    float _1552 = 1.0 / _1538;
    float _1554 = float(_1522);
    float _1556 = -_1490;
    float _1558 = _1556 + 1.0;
    int _1560 = abs(_1542);
    float _1562 = fma(_1448, _1350, _1544);
    bool _1564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1566 = isnan(0.0);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1572 = _1568 || _1570;
    float _1574 = _1550 * _1554;
    float _1576 = float(_1472);
    float _1578 = rsqrt(_1330);
    int _1580 = abs(_1548);
    float _1582 = fma(_1456, _1332, _1562);
    float _1584 = float(_1504);
    float _1586 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1582);
    float _1588 = float(_1580);
    float _1590 = _1574 * (-2.0);
    float _1592 = _1572 ? _1558 : 0.0;
    float _1594 = _124 + (-0.5);
    float _1596 = float(_1560);
    float _1598 = fma(_1590, _1494, _1494);
    float _1600 = fma(_1246, _1590, _1246);
    if (_1534)
    {
        float _1602 = _1592 * _1552;
        _140 = _1602;
    }
    float _1604 = _140;
    float _1606 = _1588 * _1576;
    float _1608 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1598);
    float _1610 = _1596 * _1584;
    float _1612 = in.m_65.x;
    float _1614 = in.m_65.y;
    float _1616 = in.m_65.z;
    float _1618 = rsqrt(_1262);
    float _1620 = fma(_1600, _1604, _1608);
    float _1622 = _1610 * (-2.0);
    float _1624 = _1606 * (-2.0);
    float _1626 = _1620 * 0.15915493667125701904296875;
    float _1628 = fma(_1388, _1622, _1388);
    float _1630 = in.m_67.x;
    float _1632 = fma(_1106, _1624, _1106);
    float _1634 = sqrt(_1292);
    float _1636 = fma(_1624, _1492, _1492);
    float _1638 = in.m_69.x;
    float _1640 = in.m_69.y;
    float _1642 = in.m_69.z;
    float _1644 = _122 + (-0.5);
    float _1646 = fma(_1622, _1496, _1496);
    float _1648 = _1080 + (-0.5);
    float _1650 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1636);
    float _1652 = _1626 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    float _1656 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1646);
    float _1658 = fma(_1632, _1604, _1650);
    bool _1660 = _124 > 0.5;
    float _1662 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, 2.0, -1.0);
    float _1664 = precise::clamp(_1662, 0.0, 1.0);
    float _1666 = -_1612;
    float _1668 = fma(_1586, _1612, _1666);
    float _1670 = fma(_1628, _1604, _1656);
    float _1672 = -_1616;
    float _1674 = fma(_1586, _1616, _1672);
    float _1676 = fma(_1664, 0.10000002384185791015625, 0.699999988079071044921875);
    float _1678 = -_1614;
    float _1680 = fma(_1586, _1614, _1678);
    float _1682 = _1670 * 0.15915493667125701904296875;
    float _1684 = _1658 * 0.15915493667125701904296875;
    float _1686 = fma(_1668, _1630, _1612);
    float _1688 = fma(_1680, _1630, _1614);
    float _1690 = fma(_1674, _1630, _1616);
    float _1692 = _1626 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _282 * _1640;
    float _1698 = _1686 * _1676;
    float _1700 = _1688 * _1676;
    float _1702 = _1690 * _1676;
    float _1704 = fma(_280, _1638, _1696);
    float _1706 = _1698 * _1524;
    float _1708 = _1700 * _1578;
    float _1710 = _1682 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    float _1714 = _1634 * _1706;
    float _1716 = _1634 * _1708;
    float _1718 = _1702 * _1618;
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1714);
    float _1722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1716);
    float _1724 = _1684 * 6.283185482025146484375;
    float _1726 = sin(_1724);
    float _1728 = in.m_71.x;
    float _1730 = in.m_71.y;
    float _1732 = in.m_71.z;
    float _1734 = _1634 * _1718;
    float _1736 = _1102 * _1722;
    float _1738 = _1108 * _1720;
    float _1740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1734);
    float _1742 = _1684 * 6.283185482025146484375;
    float _1744 = cos(_1742);
    float _1746 = _1694 * _1712;
    float _1748 = _1654 * _1712;
    float _1750 = _1712 * _1736;
    float _1752 = _1114 * _1740;
    float _1754 = _1682 * 6.283185482025146484375;
    float _1756 = sin(_1754);
    float _1758 = _1726 * _1654;
    float _1760 = _1744 * _1694;
    float _1762 = _1726 * _1694;
    float _1764 = _1744 * _1654;
    float _1766 = _1744 * _1750;
    float _1768 = fma(_1756, _1764, _1762);
    float _1770 = -_1760;
    float _1772 = fma(_1756, _1758, _1770);
    float _1774 = -_1758;
    float _1776 = fma(_1756, _1760, _1774);
    float _1778 = -_1736;
    float _1780 = _1756 * _1778;
    float _1782 = fma(_1768, _1738, _1766);
    float _1784 = _1726 * _1750;
    float _1786 = fma(_1756, _1762, _1764);
    float _1788 = fma(_1748, _1738, _1780);
    float _1790 = fma(_1776, _1752, _1782);
    float _1792 = fma(_1772, _1738, _1784);
    float _1794 = _282 * _1730;
    float _1796 = fma(_1746, _1752, _1788);
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1800 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1802 = fma(_280, _1728, _1794);
    float _1804 = fma(_1786, _1752, _1792);
    float _1806 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1798);
    float _1808 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1800);
    float _1810 = fma(_284, _1642, _1704);
    float _1812 = fma(_284, _1732, _1802);
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1806);
    float _1816 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1808);
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1820 = _1812 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1822 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1824 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1826 = in.m_73.x;
    float _1828 = in.m_73.y;
    float _1830 = in.m_73.z;
    float _1832 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1834 = _1818 + _1822;
    float _1836 = _1820 + _1824;
    float _1838 = in.m_51.w;
    float _1840 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1832);
    float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1844 = _1834 + _1842;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1848 = _1836 + _1846;
    float _1850 = in.m_75.y;
    float _1852 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1840);
    float _1854 = _1844 * _1844;
    float _1856 = _1848 * _1848;
    float _1858 = in.m_75.x;
    float _1860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1862 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1864 = _1854 + _1856;
    float _1866 = sqrt(_1864);
    float _1868 = _282 * _1828;
    float _1870 = fma(_280, _1826, _1868);
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1874 = _1872 != 0;
    float _1876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1878 = _1838 > 0.5;
    float _1880 = fma(_284, _1830, _1870);
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1884 = _1882 != 0;
    float _1886 = -_1850;
    float _1888 = _1886 + 1.0;
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1892 = _1890 != 0;
    float _1894 = _1880 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1896 = _1866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1902 = _1900 != 0;
    float _1904 = _1894 + _1862;
    int _1906 = int(_1660);
    int _1908 = _1874 ? 2 : 0;
    int _1910 = _1906 | _1908;
    int _1912 = _1884 ? 4 : 0;
    int _1914 = _1910 | _1912;
    int _1916 = _1892 ? 8 : 0;
    int _1918 = _1914 | _1916;
    int _1920 = _1902 ? 16 : 0;
    int _1922 = _1918 | _1920;
    int _1924 = _1878 ? 32 : 0;
    int _1926 = _1922 | _1924;
    int _1928 = _1896 ? 64 : 0;
    int _1930 = _1926 | _1928;
    int _1932 = _1930 & 32;
    bool _1934 = _1878;
    float _1936 = _1830;
    float _1938 = as_type<float>(_1932);
    float _1940 = _1854;
    int _1942 = as_type<int>(_1904);
    float _1944 = _1850;
    float _1946 = _1818;
    float _1948 = _1834;
    if (_1874)
    {
        bool _1950 = _122 > 0.5;
        _1934 = _1950;
    }
    bool _1952 = _1934;
    if (!_1896)
    {
        _142 = _1856;
    }
    float _1954 = _142;
    float _1956 = _1954;
    if (!_1896)
    {
        _1936 = _1834;
    }
    float _1958 = _1936;
    float _1960 = _1958;
    if (!_1896)
    {
        _1938 = _1836;
    }
    float _1962 = _1938;
    float _1964 = _1962;
    if (!_1896)
    {
        _288 = _1904;
    }
    float _1966 = _288;
    bool _1968 = !_1896;
    float _1970 = _1966;
    if (!_1968)
    {
        float _1972 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1976 = _1866 + _1974;
        float _1978 = rsqrt(_1864);
        float _1980 = _1976 * _1972;
        float _1982 = _1904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1984 = _1980 * 0.15915493667125701904296875;
        float _1986 = _1984 * 6.283185482025146484375;
        float _1988 = sin(_1986);
        float _1990 = _1984 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        float _1994 = fma(_1988, _1982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1996 = _1978 * _1994;
        float _1998 = _1992 + (-1.0);
        float _2000 = fma(_1844, _1996, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2002 = fma(_1848, _1996, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2004 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2008 = _2000 + _2006;
        float _2010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2012 = _2002 + _2010;
        float _2014 = fma(_1904, _1992, _2004);
        float _2016 = _2008 * _2008;
        float _2018 = _2012 * _2012;
        _1970 = _2014;
        _1940 = _2016;
        _1956 = _2018;
        _290 = _1984;
        _144 = _2012;
        _1960 = _2000;
        _1964 = _2002;
    }
    float _2020 = _1970;
    float _2022 = _1940;
    float _2024 = _1956;
    float _2026 = _290;
    float _2028 = _144;
    float _2030 = _1960;
    float _2032 = _1964;
    bool _2034 = _1838 > 0.5;
    float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2038 = _2020 + _2036;
    float _2040 = _2026;
    bool _2042 = _2034;
    int _2044 = as_type<int>(_2022);
    float _2046 = _2028;
    float _2048 = _2032;
    float _2050 = _2020;
    if (_1884)
    {
        float _2052 = -_1858;
        float _2054 = _2052 + 1.0;
        _1942 = as_type<int>(_2054);
    }
    int _2056 = _1942;
    if (!_1874)
    {
        _2040 = _1858;
    }
    float _2058 = _2040;
    int _2060 = _2034 ? as_type<int>(_1888) : as_type<int>(_1850);
    float _2062 = fma(_2038, _2038, _2022);
    float _2064 = _2058;
    if (_1884)
    {
        bool _2066 = _1080 > 0.5;
        _2042 = _2066;
    }
    bool _2068 = _2042;
    if (_1874)
    {
        float _2070 = -_1858;
        float _2072 = _2070 + 1.0;
        _2044 = as_type<int>(_2072);
    }
    int _2074 = _2044;
    float _2076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2078 = _2062 + _2024;
    float _2080 = _1892 ? as_type<float>(_2060) : _1850;
    if (!_1884)
    {
        _2046 = _1858;
    }
    float _2082 = _2046;
    float _2084 = _2082;
    if (_1902)
    {
        float _2086 = _1660 ? _1888 : _1850;
        _1944 = _2086;
    }
    float _2088 = _1944;
    if (_1874)
    {
        float _2090 = _1952 ? as_type<float>(_2074) : _1858;
        _2064 = _2090;
    }
    float _2092 = _2064;
    float _2094 = sqrt(_2078);
    if (_1884)
    {
        float _2096 = _2068 ? as_type<float>(_2056) : _1858;
        _2084 = _2096;
    }
    float _2098 = _2084;
    float _2100 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2102 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2104 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2108 = _2100 * _1876;
    float _2110 = _2102 * _1898;
    float _2112 = _2104 * _1860;
    float _2114 = _2106 * _2076;
    out.m_77.x = _2112;
    out.m_77.y = _2108;
    out.m_77.z = _2114;
    out.m_77.w = _2110;
    bool _2116 = _2094 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2118 = isnan(_2094);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2124 = _2120 || _2122;
    float _2126 = _2106;
    if (!_2124)
    {
        _2126 = 1.0;
    }
    float _2128 = _2126;
    bool _2130 = !_2124;
    float _2132 = _2128;
    if (!_2130)
    {
        bool _2134 = _2094 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2136 = isnan(_2094);
        bool _2138 = _2134 || _2136;
        bool _2140 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2142 = _2138 || _2140;
        if (!_2142)
        {
            float _2144 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2146 = _2094 + _2144;
            float _2148 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2150 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2148;
            float _2152 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2154 = _2152 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2156 = 1.0 / _2150;
            float _2158 = _2146 * _2156;
            float _2160 = fma(_2158, _2154, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2132 = _2160;
            _2162 = true;
        }
        else
        {
            bool _2164 = _2094 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2166 = isnan(_2094);
            bool _2168 = _2164 || _2166;
            bool _2170 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2172 = _2168 || _2170;
            if (!_2172)
            {
                float _2174 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2176 = _2094 + _2174;
                float _2178 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2180 = _2178 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2182 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2184 = _2182 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2186 = 1.0 / _2180;
                float _2188 = _2176 * _2186;
                float _2190 = fma(_2188, _2184, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2132 = _2190;
                _2162 = true;
            }
            else
            {
                _2132 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2162 = false;
    float _2192 = _2132;
    float _2194 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2196 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2198 = _2030 + _2196;
    float _2200 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2194);
    bool _2202 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2204 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(0.5);
    bool _2210 = _2206 || _2208;
    float _2212 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2214 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2216 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan(0.5);
    bool _2222 = _2218 || _2220;
    float _2224 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2200);
    float _2226 = fma(_2198, _2192, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2228 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2212);
    float _2230 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2232 = _2020 + _2230;
    float _2234 = _2224 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2238 = _2032 + _2236;
    float _2240 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2228);
    float _2242 = fma(_2232, _2192, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2244 = 1.0 / _2234;
    float _2246 = fma(_2238, _2192, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2248 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2250 = _2192;
    float _2252 = _2234;
    if (_2222)
    {
        _2048 = _2226;
    }
    float _2254 = _2048;
    float _2256 = _2248 + _2234;
    float _2258 = _2254;
    if (_2222)
    {
        _2050 = _2242;
    }
    float _2260 = _2050;
    float _2262 = _2260;
    if (_2222)
    {
        _2250 = _2246;
    }
    float _2264 = _2250;
    float _2266 = _2264;
    if (!_2222)
    {
        float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2270 = _1894 + _2268;
        float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2274 = _1818 + _2272;
        float _2276 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2278 = -_1818;
        float _2280 = _2278 + _2226;
        float _2282 = _2270 * _2270;
        float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2286 = _1820 + _2284;
        float _2288 = fma(_2274, _2274, _2282);
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2292 = fma(_2286, _2286, _2288);
        float _2294 = sqrt(_2292);
        float _2296 = _2276 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2298 = -_1894;
        float _2300 = _2298 + _2242;
        float _2302 = precise::min(_2294, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2304 = _2302 * _2290;
        float _2306 = _2296 * _2304;
        float _2308 = -_1820;
        float _2310 = _2308 + _2246;
        float _2312 = fma(_2280, _2306, _1818);
        float _2314 = fma(_2300, _2306, _1894);
        float _2316 = fma(_2310, _2306, _1820);
        _2262 = _2314;
        _2258 = _2312;
        _2266 = _2316;
    }
    float _2318 = _2262;
    float _2320 = _2258;
    float _2322 = _2266;
    if (_2210)
    {
        _1946 = 1.0;
    }
    float _2324 = _1946;
    float _2326 = _2256 * _2244;
    float _2328 = _2326 * 0.5;
    float _2330 = _2324;
    float _2332 = _2328;
    if (!_2210)
    {
        float _2334 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2338 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2336);
        float _2340 = _2334 * 0.15915493667125701904296875;
        float _2342 = _2340 * 6.283185482025146484375;
        float _2344 = cos(_2342);
        float _2346 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2348 = _2346 * 0.15915493667125701904296875;
        float _2350 = _2340 * 6.283185482025146484375;
        float _2352 = sin(_2350);
        float _2354 = 1.0 / _2344;
        float _2356 = _2348 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        float _2360 = _2352 * _2354;
        float _2362 = 1.0 / _2338;
        float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2366 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2364;
        float _2368 = _2358 * _2360;
        float _2370 = _2348 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        float _2374 = 1.0 / _2368;
        float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2378 = _2362 * _2376;
        float _2380 = 1.0 / _2366;
        float _2382 = _2372 * _2374;
        float _2384 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2386 = fma(_2382, _2378, _2384);
        float _2388 = _2386 * _2380;
        float _2390 = precise::clamp(_2388, 0.0, 1.0);
        _2330 = _2390;
    }
    float _2392 = _2330;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2396 = _2318 + _2394;
    float _2398 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2400 = _2320 + _2398;
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2404 = _2322 + _2402;
    float _2406 = _2396 * _2396;
    float _2408 = fma(_2400, _2400, _2406);
    float _2410 = fma(_2404, _2404, _2408);
    float _2412 = rsqrt(_2410);
    float _2414 = _2412 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2416 = _2400 * _2414;
    float _2418 = _2404 * _2414;
    float _2420 = _2416 * _2416;
    float _2422 = _2418 * _2418;
    float _2424 = _2420 + _2422;
    float _2426 = sqrt(_2424);
    bool _2428 = _2426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2432 = _2426 + _2430;
    float _2434 = _2408;
    float _2436 = _2424;
    float _2438 = _2432;
    float _2440 = _2396;
    float _2442 = _2414;
    if (_2428)
    {
        float _2444 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2434 = _2444;
    }
    float _2446 = _2434;
    if (_2428)
    {
        float _2448 = rsqrt(_2424);
        _2436 = _2448;
    }
    float _2450 = _2436;
    if (_2428)
    {
        float _2452 = _2432 * _2446;
        _2438 = _2452;
    }
    float _2454 = _2438;
    if (_2428)
    {
        float _2456 = _2454 * 0.15915493667125701904296875;
        _2252 = _2456;
    }
    float _2458 = _2252;
    float _2460 = _2412;
    if (_2428)
    {
        float _2462 = _2458 * 6.283185482025146484375;
        float _2464 = sin(_2462);
        _2460 = _2464;
    }
    float _2466 = _2460;
    float _2468 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2470 = precise::max(0.0, _2468);
    float _2472 = _2404;
    float _2474 = _2470;
    float _2476 = _2468;
    if (_2428)
    {
        float _2478 = _2458 * 6.283185482025146484375;
        float _2480 = cos(_2478);
        _2472 = _2480;
    }
    float _2482 = _2472;
    float _2484 = -_2414;
    float _2486 = -_2470;
    float _2488 = fma(_2396, _2484, _2486);
    if (!_2428)
    {
        _2440 = _2418;
    }
    float _2490 = _2440;
    float _2492 = _2490;
    if (_2428)
    {
        float _2494 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2474 = _2494;
    }
    float _2496 = _2474;
    float _2498 = _2496;
    float _2500 = _2466;
    if (_2428)
    {
        float _2502 = fma(_2466, _2496, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2442 = _2502;
    }
    float _2504 = _2442;
    float _2506 = _2504;
    if (!_2428)
    {
        _2498 = _2416;
    }
    float _2508 = _2498;
    float _2510 = _2508;
    if (!_2428)
    {
        _2500 = _2488;
    }
    float _2512 = _2500;
    float _2514 = _2512;
    if (_2428)
    {
        float _2516 = _2482 + (-1.0);
        _2476 = _2516;
    }
    float _2518 = _2476;
    float _2520 = _2518;
    if (_2428)
    {
        float _2522 = _2450 * _2504;
        _1948 = _2522;
    }
    float _2524 = _1948;
    if (!_2428)
    {
        _2506 = _2420;
    }
    float _2526 = _2506;
    float _2528 = sqrt(_2410);
    float _2530 = _2526;
    if (_2428)
    {
        float _2532 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2332 = _2532;
    }
    float _2534 = _2332;
    if (_2428)
    {
        float _2536 = _2416 * _2524;
        _2510 = _2536;
    }
    float _2538 = _2510;
    if (_2428)
    {
        float _2540 = _2418 * _2524;
        _2492 = _2540;
    }
    float _2542 = _2492;
    if (!_2428)
    {
        _2520 = _2422;
    }
    float _2544 = _2520;
    float _2546 = _2544;
    if (_2428)
    {
        float _2548 = fma(_2488, _2482, _2534);
        _2514 = _2548;
    }
    float _2550 = _2514;
    if (_2428)
    {
        float _2552 = _2538 * _2538;
        _2530 = _2552;
    }
    float _2554 = _2530;
    if (_2428)
    {
        float _2556 = _2542 * _2542;
        _2546 = _2556;
    }
    float _2558 = _2546;
    float _2560 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2562 = fma(_2550, _2550, _2554);
    float _2564 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2560);
    float _2566 = _2562 + _2558;
    float _2568 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2572 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2570);
    float _2574 = precise::clamp(_2572, 0.0, 1.0);
    float _2576 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2578 = rsqrt(_2566);
    float _2580 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2568);
    float _2582 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2584 = -_2574;
    float _2586 = _2584 + 1.0;
    float _2588 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2590 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2580);
    float _2592 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2582);
    float _2594 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2588);
    float _2596 = _2590 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2598 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2592);
    float _2600 = abs(_2586);
    float _2602 = log2(_2600);
    float _2604 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2594);
    float _2606 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2608 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2610 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2564);
    float _2612 = _2604 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2614 = _2578 * _2538;
    float _2616 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2618 = _2578 * _2542;
    float _2620 = -_2606;
    float _2622 = fma(_2620, _2576, 1.0);
    float _2624 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2626 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2616);
    float _2628 = _2578 * _2550;
    float _2630 = _2610 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2632 = log2(_2622);
    float _2634 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2626);
    float _2636 = -_2624;
    float _2638 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2636);
    float _2640 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2642 = -_2618;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2638);
    float _2646 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2648 = exp2(_2640);
    float _2650 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2634);
    float _2652 = fma(_2644, -0.5, 0.5);
    float _2654 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2656 = fma(_2644, 0.5, 0.5);
    float _2658 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2646);
    float _2660 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2654);
    float _2662 = 1.0 / _2650;
    float _2664 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2658);
    float _2666 = fma(_2656, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2668 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2660);
    float _2670 = _2628 + 1.0;
    float _2672 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2664);
    float _2674 = fma(_2656, _2666, -0.212114393711090087890625);
    float _2676 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2668);
    float _2678 = sqrt(_2652);
    float _2680 = _2632 * 0.693147182464599609375;
    float _2682 = fma(_2656, _2674, 1.570728778839111328125);
    float _2684 = -_2628;
    float _2686 = fma(_2648, _2670, _2684);
    float _2688 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2690 = _2672 * _2662;
    float _2692 = _2676 * _2662;
    float _2694 = fma(_2690, 0.5, 0.5);
    float _2696 = fma(_2692, -0.5, 0.5);
    float _2698 = fma(_2686, 0.5, 0.5);
    float _2700 = _2678 * 0.636619746685028076171875;
    float3 _6961 = float3(_2694, _2696, _2688);
    float _2702 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6961, float3(0.0), isnan(_6961)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6961, float3(0.0), isnan(_6961)), level(0.0)).x;
    float _2704 = -_2682;
    float _2706 = fma(_2700, _2704, 1.0);
    float3 _6977 = float3(_2694, _2696, _2688);
    float4 _2709 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6977, float3(0.0), isnan(_6977)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6977, float3(0.0), isnan(_6977)), level(0.0)).xyzw;
    float _2711 = _2709.x;
    float _2713 = _2709.y;
    float _2715 = _2709.z;
    float _2717 = _2709.w;
    float2 _6994 = float2(_2706, _2698);
    float3 _2721 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6994, float2(0.0), isnan(_6994)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6994, float2(0.0), isnan(_6994)), level(0.0)).xyz;
    float _2723 = _2721.x;
    float _2725 = _2721.y;
    float _2727 = _2721.z;
    float _2729 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2731 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2733 = _2650 * 0.5;
    bool _2735 = _2392 > 0.0;
    bool _2737 = isnan(_2392);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan(0.0);
    bool _2743 = _2739 || _2741;
    float _2745 = _2672 + _2650;
    float _2747 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2731);
    float _2749 = exp2(_2729);
    float _2751 = _2745 * 0.5;
    float _2753 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2747);
    float _2755 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2753);
    float _2757 = _2392 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2759 = fma(_2676, -0.5, _2733);
    float _2761 = _2755 + _2650;
    float _2763 = _2757 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2672;
    out.gl_Position.y = _2676;
    out.gl_Position.z = _2755;
    out.gl_Position.w = _2650;
    float _2765 = _2761 * 0.5;
    float _2767 = -_2749;
    float _2769 = _2767 + 1.0;
    out.m_47.x = _2763;
    float _2771 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2751;
    out.m_79.y = _2759;
    out.m_79.z = _2765;
    out.m_79.w = _2650;
    float _2773 = _2771 * _2702;
    float _2775 = -_2771;
    float _2777 = _2775 + 1.0;
    float _2779 = _2717 * _2773;
    float _2781 = _2727 * _2773;
    float _2783 = fma(_2723, _2779, _2711);
    float _2785 = fma(_2725, _2779, _2713);
    float _2787 = _2717 * _2777;
    float _2789 = fma(_2717, _2781, _2715);
    out.m_81.x = _2783;
    out.m_81.y = _2785;
    out.m_81.z = _2789;
    out.m_81.w = _2787;
    if (_2743)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2791 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2791;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2162 = false;
    bool _1064 = false;
    bool _886 = false;
    bool _666 = false;
    bool _420 = false;
    bool _308 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2848 = as_type<float>(_116);
        out.gl_Position.z = _2848;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    float _122 = in.m_51.x;
    float _124 = in.m_51.y;
    bool _126 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_120);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_120;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _122;
    out.m_53.y = _124;
    float _140 = _138;
    float _142 = _124;
    float _144 = _122;
    if (_134)
    {
        float _146 = float(_100);
        _110 = _146;
    }
    float _148 = _110;
    bool _150 = _138 >= _148;
    bool _152 = !_134;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _118 = as_type<int>(_160);
    }
    int _162 = _118;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2928 = as_type<float>(_162);
        out.gl_Position.z = _2928;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_55.w;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = in.m_44.x;
    float _186 = in.m_44.y;
    float _188 = in.m_44.z;
    float _190 = 0.0;
    float _192 = _166;
    if (!_176)
    {
        float _194 = _166 * _166;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _198;
    if (!_176)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_176;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _166 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _166);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_176;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _166 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _192 = _262;
    }
    float _264 = _192;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _178, _268);
    float _276 = fma(_264, _180, _270);
    float _278 = fma(_264, _182, _272);
    float _280 = fma(_274, _164, _184);
    float _282 = fma(_276, _164, _186);
    float _284 = fma(_278, _164, _188);
    bool _286 = !_266;
    float _288 = _280;
    float _290 = _284;
    float _306;
    if (!_286)
    {
        float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _294 = _122 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _298 = _296 * _292;
        float _300 = floor(_298);
        float _302 = -_300;
        float _304 = _298 + _302;
        _306 = _304;
        _308 = true;
    }
    else
    {
        float _310 = float(_100);
        float _312 = 1.0 / _310;
        float _314 = _138 * _312;
        _306 = _314;
    }
    _308 = false;
    float _316 = _306;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _320 = _316 + _318;
    bool _322 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _324 = isnan(_316);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    bool _338 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_316);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_332;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = 1.0 / _336;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _362 = _348 * _352;
    float _364 = -_348;
    float _366 = _364 + 1.0;
    float _368 = _320 * _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _370;
    float _374 = fma(_356, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = _374 * _362;
    float _384 = fma(_378, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _388 = _384 * _362;
    float _390 = _380 * _362;
    float _392 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _394 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _396 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[144].x, _386);
    float _398 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[144].y, _392);
    float _400 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[144].z, _394);
    bool _402 = !_360;
    float _418;
    if (!_402)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _406 = _122 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _418 = _416;
        _420 = true;
    }
    else
    {
        float _422 = float(_100);
        float _424 = 1.0 / _422;
        float _426 = _138 * _424;
        _418 = _426;
    }
    _420 = false;
    float _428 = _418;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _432 = _428 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = _428 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _428 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _450;
    float _454 = 1.0 / _452;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _458 = 1.0 / _444;
    bool _460 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _462 = isnan(_428);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = 1.0 / _448;
    float _474 = _432 * _454;
    bool _476 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _478 = isnan(_428);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _436 * _458;
    bool _490 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _492 = isnan(_428);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _502;
    float _506 = -_500;
    float _508 = _506 + 1.0;
    float _510 = fma(_504, _488, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = _440 * _472;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _518;
    float _522 = _470 * _508;
    float _524 = -_470;
    float _526 = _524 + 1.0;
    float _528 = fma(_516, _488, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _530 = fma(_520, _488, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _532 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _534 = isnan(_428);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _556 = _542 * _526;
    float _558 = -_542;
    float _560 = _558 + 1.0;
    float _562 = fma(_546, _512, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _564 = fma(_550, _512, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _566 = _486 * _560;
    float _568 = fma(_554, _512, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _570 = -_486;
    float _572 = _570 + 1.0;
    float _574 = _510 * _566;
    float _576 = _528 * _566;
    float _578 = _530 * _566;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _584;
    float _588 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].x, _574);
    float _590 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].y, _576);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _592;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].z, _578);
    float _598 = fma(_582, _474, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _600 = fma(_586, _474, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _602 = fma(_594, _474, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _604 = fma(_562, _556, _588);
    float _606 = fma(_564, _556, _590);
    float _608 = fma(_568, _556, _596);
    float _610 = fma(_598, _522, _604);
    float _612 = fma(_600, _522, _606);
    float _614 = fma(_602, _522, _608);
    float _616 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[110].x, _610);
    float _618 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[110].y, _612);
    float _620 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[110].z, _614);
    float _622 = in.m_55.x;
    float _624 = in.m_55.y;
    float _626 = in.m_55.z;
    float _628 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _630 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _632 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _636 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _638 = _630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _636;
    out.m_57.y = _638;
    out.m_57.z = _640;
    out.m_57.w = _634;
    float _642 = _400 * _626;
    float _644 = _398 * _624;
    float _646 = _396 * _622;
    bool _648 = !_456;
    float _664;
    if (!_648)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _652 = _122 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_100);
        float _670 = 1.0 / _668;
        float _672 = _138 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _678 = _674 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _682 = _674 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _686 = _674 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _700 = 1.0 / _690;
    bool _702 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _704 = 1.0 / _694;
    float _706 = 1.0 / _698;
    bool _708 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _710 = isnan(_674);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _678 * _700;
    bool _722 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _724 = isnan(_674);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    bool _734 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _736 = isnan(_674);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_718;
    float _748 = _746 + 1.0;
    float _750 = _682 * _704;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _752;
    float _756 = _732 * _748;
    bool _758 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _760 = isnan(_674);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = -_732;
    float _772 = _770 + 1.0;
    float _774 = fma(_754, _750, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _780 = _686 * _706;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _786;
    float _790 = _744 * _772;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _796 = fma(_784, _750, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _798 = fma(_788, _750, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _800 = -_744;
    float _802 = _800 + 1.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _808 = fma(_778, _780, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _810 = fma(_794, _780, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _812 = _768 * _802;
    float _814 = -_768;
    float _816 = _814 + 1.0;
    float _818 = fma(_806, _780, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _820 = _774 * _812;
    float _822 = _796 * _812;
    float _824 = _798 * _812;
    float _826 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].x, _820);
    float _828 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].y, _822);
    float _830 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].z, _824);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _836;
    float _840 = fma(_808, _790, _826);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _842;
    float _846 = fma(_834, _720, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _848 = fma(_838, _720, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _850 = fma(_818, _790, _828);
    float _852 = fma(_844, _720, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _854 = fma(_810, _790, _830);
    float _856 = fma(_846, _756, _840);
    float _858 = fma(_848, _756, _850);
    float _860 = fma(_852, _756, _854);
    float _862 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[126].x, _856);
    float _864 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[126].y, _858);
    float _866 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[126].z, _860);
    bool _868 = !_702;
    float _884;
    if (!_868)
    {
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _872 = _122 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _876 = _874 * _870;
        float _878 = floor(_876);
        float _880 = -_878;
        float _882 = _876 + _880;
        _884 = _882;
        _886 = true;
    }
    else
    {
        float _888 = float(_100);
        float _890 = 1.0 / _888;
        float _892 = _138 * _890;
        _884 = _892;
    }
    _886 = false;
    float _894 = _884;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _898 = _894 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _904 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _906 = isnan(_894);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _924 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _926 = isnan(_894);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = 1.0 / _902;
    float _938 = -_914;
    float _940 = _938 + 1.0;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _942;
    bool _946 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _948 = isnan(_894);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _934 * _940;
    float _960 = -_934;
    float _962 = _960 + 1.0;
    bool _964 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _966 = 1.0 / _918;
    float _968 = _956 * _962;
    float _970 = -_956;
    float _972 = _970 + 1.0;
    float _974 = 1.0 / _922;
    float _976 = _944 * _936;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _982 = fma(_976, _898, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _984 = _980 * _966;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _988 = _894 + _986;
    bool _990 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _992 = isnan(_894);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1002;
    float _1006 = _982 * _968;
    float _1008 = fma(_984, _988, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1012 = _894 + _1010;
    float _1014 = -_1000;
    float _1016 = _1014 + 1.0;
    float _1018 = _1004 * _974;
    float _1020 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1006);
    float _1022 = _914 * _1016;
    float _1024 = fma(_1018, _1012, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1026 = fma(_1008, _958, _1020);
    float _1028 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1030 = _866 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1032 = fma(_1024, _1022, _1026);
    float _1034 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1036 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1038 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1032);
    float _1040 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    out.m_59.y = (*spvDescriptorSet0.vp_c9)._m0[159].y;
    out.m_59.z = (*spvDescriptorSet0.vp_c9)._m0[159].z;
    out.m_61.x = _1036;
    out.m_61.y = _1040;
    out.m_61.z = _1042;
    out.m_61.w = _1044;
    bool _1046 = !_964;
    float _1062;
    if (!_1046)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1050 = _122 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[14].z, _138);
        float _1054 = _1052 * _1048;
        float _1056 = floor(_1054);
        float _1058 = -_1056;
        float _1060 = _1054 + _1058;
        _1062 = _1060;
        _1064 = true;
    }
    else
    {
        float _1066 = float(_100);
        float _1068 = 1.0 / _1066;
        float _1070 = _138 * _1068;
        _1062 = _1070;
    }
    _1064 = false;
    float _1072 = _1062;
    float _1074 = _122 * 2.0;
    float _1076 = _122 + _124;
    float _1078 = _124 * 2.0;
    float _1080 = in.m_51.z;
    float _1082 = floor(_1074);
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1094 = _1092 != 0;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1100 = _1076 + (-1.0);
    float _1102 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1104 = floor(_1078);
    float _1106 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1108 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1114 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1116 = 1.0 / _1098;
    bool _1118 = _1082 > 0.0;
    bool _1120 = _1082 >= 0.0;
    bool _1122 = isnan(_1082);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = 1.0 / _1112;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1136 = _1104 > 0.0;
    float _1138 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _1140 = _1104 >= 0.0;
    bool _1142 = isnan(_1104);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan(0.0);
    bool _1148 = _1144 || _1146;
    float _1150 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1152 = 1.0 / _1134;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1158 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1150);
    float _1160 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1162 = 1.0 / _1156;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1168 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1160);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1178 = 1.0 / _1166;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1192 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1138);
    float _1194 = _1172 * _1152;
    float _1196 = _1186 * _1116;
    float _1198 = _1190 * _1130;
    float _1200 = _1080 * 2.0;
    float _1202 = 1.0 / _1182;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1208 = _1176 * _1162;
    int _1210 = _1128 ? 0 : 1;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1212;
    int _1216 = _1148 ? 0 : 1;
    float _1218 = floor(_1200);
    float _1220 = _124 + _1080;
    float _1222 = _1214 * _1178;
    bool _1224 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1226 = isnan(_1072);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = _122 + _1080;
    float _1238 = _1220 + (-1.0);
    float _1240 = 1.0 / _1206;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1246 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1254 = _1072 + _1252;
    float _1256 = _1244 * _1202;
    float _1258 = _1236 + (-1.0);
    bool _1260 = _1218 > 0.0;
    float _1262 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1168);
    float _1264 = fma(_1198, _1254, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    bool _1266 = _1218 >= 0.0;
    bool _1268 = isnan(_1218);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan(0.0);
    bool _1274 = _1270 || _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1278 = _1072 + _1276;
    bool _1280 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1282 = isnan(_1072);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    float _1292 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1192);
    bool _1294 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1296 = isnan(_1072);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = _1250 * _1240;
    float _1308 = -_1290;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_1208, _1278, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1314 = -_1304;
    float _1316 = _1314 + 1.0;
    bool _1318 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1320 = isnan(_1072);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1326 = _1322 || _1324;
    float _1328 = float(_1326);
    float _1330 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1158);
    float _1332 = _1304 * _1310;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1336 = _1072 + _1334;
    bool _1338 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1340 = isnan(_1072);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1346 = _1342 || _1344;
    float _1348 = float(_1346);
    float _1350 = _1234 * _1316;
    float _1352 = -_1234;
    float _1354 = _1352 + 1.0;
    float _1356 = fma(_1196, _1336, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1358 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1360 = isnan(_1072);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -_1348;
    float _1372 = _1370 + 1.0;
    float _1374 = _1348 * _1354;
    bool _1376 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1378 = isnan(_1072);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1384 = _1380 || _1382;
    float _1386 = float(_1384);
    float _1388 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1392 = _1072 + _1390;
    float _1394 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1396 = log2(_1394);
    bool _1398 = _1072 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1400 = isnan(_1072);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = -_1386;
    float _1412 = _1410 + 1.0;
    float _1414 = -_1328;
    float _1416 = _1414 + 1.0;
    float _1418 = _1368 * _1372;
    float _1420 = -_1368;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1194, _1392, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1428 = _1072 + _1426;
    float _1430 = _1328 * _1412;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1434 = _1072 + _1432;
    float _1436 = _1408 * _1416;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1440 = _1072 + _1438;
    float _1442 = _1386 * _1422;
    int _1444 = _1274 ? 0 : 1;
    float _1446 = fma(_1222, _1428, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1448 = fma(_1256, _1434, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1450 = _1356 * _1436;
    float _1452 = -_1408;
    float _1454 = _1452 + 1.0;
    float _1456 = fma(_1306, _1440, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    int _1458 = ~_1444;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = _1396 * _138;
    int _1466 = _1462;
    if (!_1260)
    {
        int _1468 = ~_1444;
        int _1470 = _1468 + 1;
        _1466 = _1470;
    }
    int _1472 = _1466;
    float _1474 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1450);
    bool _1476 = !_1090;
    int _1478 = _1476 ? 0 : 1;
    int _1480 = ~_1216;
    int _1482 = _1480 + 1;
    int _1484 = _1482 + 1;
    float _1486 = fma(_1264, _1430, _1474);
    int _1488 = abs(_1478);
    float _1490 = exp2(_1464);
    float _1492 = in.m_63.x;
    float _1494 = in.m_63.y;
    float _1496 = in.m_63.z;
    int _1498 = _1484;
    if (!_1136)
    {
        int _1500 = ~_1216;
        int _1502 = _1500 + 1;
        _1498 = _1502;
    }
    int _1504 = _1498;
    float _1506 = fma(_1424, _1442, _1486);
    int _1508 = ~_1210;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    float _1514 = fma(_1312, _1418, _1506);
    int _1516 = _1512;
    if (!_1118)
    {
        int _1518 = ~_1210;
        int _1520 = _1518 + 1;
        _1516 = _1520;
    }
    int _1522 = _1516;
    float _1524 = rsqrt(_1292);
    bool _1526 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1528 = isnan(1.0);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1534 = _1530 || _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1538 = 1.0 + _1536;
    bool _1540 = !_1094;
    int _1542 = _1540 ? 0 : 1;
    float _1544 = fma(_1446, _1374, _1514);
    bool _1546 = !_1086;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = float(_1488);
    float _1552 = 1.0 / _1538;
    float _1554 = float(_1522);
    float _1556 = -_1490;
    float _1558 = _1556 + 1.0;
    int _1560 = abs(_1542);
    float _1562 = fma(_1448, _1350, _1544);
    bool _1564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1566 = isnan(0.0);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1572 = _1568 || _1570;
    float _1574 = _1550 * _1554;
    float _1576 = float(_1472);
    float _1578 = rsqrt(_1330);
    int _1580 = abs(_1548);
    float _1582 = fma(_1456, _1332, _1562);
    float _1584 = float(_1504);
    float _1586 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1582);
    float _1588 = float(_1580);
    float _1590 = _1574 * (-2.0);
    float _1592 = _1572 ? _1558 : 0.0;
    float _1594 = _124 + (-0.5);
    float _1596 = float(_1560);
    float _1598 = fma(_1590, _1494, _1494);
    float _1600 = fma(_1246, _1590, _1246);
    if (_1534)
    {
        float _1602 = _1592 * _1552;
        _140 = _1602;
    }
    float _1604 = _140;
    float _1606 = _1588 * _1576;
    float _1608 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1598);
    float _1610 = _1596 * _1584;
    float _1612 = in.m_65.x;
    float _1614 = in.m_65.y;
    float _1616 = in.m_65.z;
    float _1618 = rsqrt(_1262);
    float _1620 = fma(_1600, _1604, _1608);
    float _1622 = _1610 * (-2.0);
    float _1624 = _1606 * (-2.0);
    float _1626 = _1620 * 0.15915493667125701904296875;
    float _1628 = fma(_1388, _1622, _1388);
    float _1630 = in.m_67.x;
    float _1632 = fma(_1106, _1624, _1106);
    float _1634 = sqrt(_1292);
    float _1636 = fma(_1624, _1492, _1492);
    float _1638 = in.m_69.x;
    float _1640 = in.m_69.y;
    float _1642 = in.m_69.z;
    float _1644 = _122 + (-0.5);
    float _1646 = fma(_1622, _1496, _1496);
    float _1648 = _1080 + (-0.5);
    float _1650 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1636);
    float _1652 = _1626 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    float _1656 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1646);
    float _1658 = fma(_1632, _1604, _1650);
    bool _1660 = _124 > 0.5;
    float _1662 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, 2.0, -1.0);
    float _1664 = precise::clamp(_1662, 0.0, 1.0);
    float _1666 = -_1612;
    float _1668 = fma(_1586, _1612, _1666);
    float _1670 = fma(_1628, _1604, _1656);
    float _1672 = -_1616;
    float _1674 = fma(_1586, _1616, _1672);
    float _1676 = fma(_1664, 0.10000002384185791015625, 0.699999988079071044921875);
    float _1678 = -_1614;
    float _1680 = fma(_1586, _1614, _1678);
    float _1682 = _1670 * 0.15915493667125701904296875;
    float _1684 = _1658 * 0.15915493667125701904296875;
    float _1686 = fma(_1668, _1630, _1612);
    float _1688 = fma(_1680, _1630, _1614);
    float _1690 = fma(_1674, _1630, _1616);
    float _1692 = _1626 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _282 * _1640;
    float _1698 = _1686 * _1676;
    float _1700 = _1688 * _1676;
    float _1702 = _1690 * _1676;
    float _1704 = fma(_280, _1638, _1696);
    float _1706 = _1698 * _1524;
    float _1708 = _1700 * _1578;
    float _1710 = _1682 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    float _1714 = _1634 * _1706;
    float _1716 = _1634 * _1708;
    float _1718 = _1702 * _1618;
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1714);
    float _1722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1716);
    float _1724 = _1684 * 6.283185482025146484375;
    float _1726 = sin(_1724);
    float _1728 = in.m_71.x;
    float _1730 = in.m_71.y;
    float _1732 = in.m_71.z;
    float _1734 = _1634 * _1718;
    float _1736 = _1102 * _1722;
    float _1738 = _1108 * _1720;
    float _1740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1734);
    float _1742 = _1684 * 6.283185482025146484375;
    float _1744 = cos(_1742);
    float _1746 = _1694 * _1712;
    float _1748 = _1654 * _1712;
    float _1750 = _1712 * _1736;
    float _1752 = _1114 * _1740;
    float _1754 = _1682 * 6.283185482025146484375;
    float _1756 = sin(_1754);
    float _1758 = _1726 * _1654;
    float _1760 = _1744 * _1694;
    float _1762 = _1726 * _1694;
    float _1764 = _1744 * _1654;
    float _1766 = _1744 * _1750;
    float _1768 = fma(_1756, _1764, _1762);
    float _1770 = -_1760;
    float _1772 = fma(_1756, _1758, _1770);
    float _1774 = -_1758;
    float _1776 = fma(_1756, _1760, _1774);
    float _1778 = -_1736;
    float _1780 = _1756 * _1778;
    float _1782 = fma(_1768, _1738, _1766);
    float _1784 = _1726 * _1750;
    float _1786 = fma(_1756, _1762, _1764);
    float _1788 = fma(_1748, _1738, _1780);
    float _1790 = fma(_1776, _1752, _1782);
    float _1792 = fma(_1772, _1738, _1784);
    float _1794 = _282 * _1730;
    float _1796 = fma(_1746, _1752, _1788);
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1800 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1802 = fma(_280, _1728, _1794);
    float _1804 = fma(_1786, _1752, _1792);
    float _1806 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1798);
    float _1808 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1800);
    float _1810 = fma(_284, _1642, _1704);
    float _1812 = fma(_284, _1732, _1802);
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1806);
    float _1816 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1808);
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1820 = _1812 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1822 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1824 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1826 = in.m_73.x;
    float _1828 = in.m_73.y;
    float _1830 = in.m_73.z;
    float _1832 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1834 = _1818 + _1822;
    float _1836 = _1820 + _1824;
    float _1838 = in.m_51.w;
    float _1840 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1832);
    float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1844 = _1834 + _1842;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1848 = _1836 + _1846;
    float _1850 = in.m_75.y;
    float _1852 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1840);
    float _1854 = _1844 * _1844;
    float _1856 = _1848 * _1848;
    float _1858 = in.m_75.x;
    float _1860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1862 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1864 = _1854 + _1856;
    float _1866 = sqrt(_1864);
    float _1868 = _282 * _1828;
    float _1870 = fma(_280, _1826, _1868);
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1874 = _1872 != 0;
    float _1876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1878 = _1838 > 0.5;
    float _1880 = fma(_284, _1830, _1870);
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1884 = _1882 != 0;
    float _1886 = -_1850;
    float _1888 = _1886 + 1.0;
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1892 = _1890 != 0;
    float _1894 = _1880 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1896 = _1866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1902 = _1900 != 0;
    float _1904 = _1894 + _1862;
    int _1906 = int(_1660);
    int _1908 = _1874 ? 2 : 0;
    int _1910 = _1906 | _1908;
    int _1912 = _1884 ? 4 : 0;
    int _1914 = _1910 | _1912;
    int _1916 = _1892 ? 8 : 0;
    int _1918 = _1914 | _1916;
    int _1920 = _1902 ? 16 : 0;
    int _1922 = _1918 | _1920;
    int _1924 = _1878 ? 32 : 0;
    int _1926 = _1922 | _1924;
    int _1928 = _1896 ? 64 : 0;
    int _1930 = _1926 | _1928;
    int _1932 = _1930 & 32;
    bool _1934 = _1878;
    float _1936 = _1830;
    float _1938 = as_type<float>(_1932);
    float _1940 = _1854;
    int _1942 = as_type<int>(_1904);
    float _1944 = _1850;
    float _1946 = _1818;
    float _1948 = _1834;
    if (_1874)
    {
        bool _1950 = _122 > 0.5;
        _1934 = _1950;
    }
    bool _1952 = _1934;
    if (!_1896)
    {
        _142 = _1856;
    }
    float _1954 = _142;
    float _1956 = _1954;
    if (!_1896)
    {
        _1936 = _1834;
    }
    float _1958 = _1936;
    float _1960 = _1958;
    if (!_1896)
    {
        _1938 = _1836;
    }
    float _1962 = _1938;
    float _1964 = _1962;
    if (!_1896)
    {
        _288 = _1904;
    }
    float _1966 = _288;
    bool _1968 = !_1896;
    float _1970 = _1966;
    if (!_1968)
    {
        float _1972 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1976 = _1866 + _1974;
        float _1978 = rsqrt(_1864);
        float _1980 = _1976 * _1972;
        float _1982 = _1904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1984 = _1980 * 0.15915493667125701904296875;
        float _1986 = _1984 * 6.283185482025146484375;
        float _1988 = sin(_1986);
        float _1990 = _1984 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        float _1994 = fma(_1988, _1982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1996 = _1978 * _1994;
        float _1998 = _1992 + (-1.0);
        float _2000 = fma(_1844, _1996, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2002 = fma(_1848, _1996, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2004 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2008 = _2000 + _2006;
        float _2010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2012 = _2002 + _2010;
        float _2014 = fma(_1904, _1992, _2004);
        float _2016 = _2008 * _2008;
        float _2018 = _2012 * _2012;
        _1970 = _2014;
        _1940 = _2016;
        _1956 = _2018;
        _290 = _1984;
        _144 = _2012;
        _1960 = _2000;
        _1964 = _2002;
    }
    float _2020 = _1970;
    float _2022 = _1940;
    float _2024 = _1956;
    float _2026 = _290;
    float _2028 = _144;
    float _2030 = _1960;
    float _2032 = _1964;
    bool _2034 = _1838 > 0.5;
    float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2038 = _2020 + _2036;
    float _2040 = _2026;
    bool _2042 = _2034;
    int _2044 = as_type<int>(_2022);
    float _2046 = _2028;
    float _2048 = _2032;
    float _2050 = _2020;
    if (_1884)
    {
        float _2052 = -_1858;
        float _2054 = _2052 + 1.0;
        _1942 = as_type<int>(_2054);
    }
    int _2056 = _1942;
    if (!_1874)
    {
        _2040 = _1858;
    }
    float _2058 = _2040;
    int _2060 = _2034 ? as_type<int>(_1888) : as_type<int>(_1850);
    float _2062 = fma(_2038, _2038, _2022);
    float _2064 = _2058;
    if (_1884)
    {
        bool _2066 = _1080 > 0.5;
        _2042 = _2066;
    }
    bool _2068 = _2042;
    if (_1874)
    {
        float _2070 = -_1858;
        float _2072 = _2070 + 1.0;
        _2044 = as_type<int>(_2072);
    }
    int _2074 = _2044;
    float _2076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2078 = _2062 + _2024;
    float _2080 = _1892 ? as_type<float>(_2060) : _1850;
    if (!_1884)
    {
        _2046 = _1858;
    }
    float _2082 = _2046;
    float _2084 = _2082;
    if (_1902)
    {
        float _2086 = _1660 ? _1888 : _1850;
        _1944 = _2086;
    }
    float _2088 = _1944;
    if (_1874)
    {
        float _2090 = _1952 ? as_type<float>(_2074) : _1858;
        _2064 = _2090;
    }
    float _2092 = _2064;
    float _2094 = sqrt(_2078);
    if (_1884)
    {
        float _2096 = _2068 ? as_type<float>(_2056) : _1858;
        _2084 = _2096;
    }
    float _2098 = _2084;
    float _2100 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2102 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2104 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2108 = _2100 * _1876;
    float _2110 = _2102 * _1898;
    float _2112 = _2104 * _1860;
    float _2114 = _2106 * _2076;
    out.m_77.x = _2112;
    out.m_77.y = _2108;
    out.m_77.z = _2114;
    out.m_77.w = _2110;
    bool _2116 = _2094 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2118 = isnan(_2094);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2124 = _2120 || _2122;
    float _2126 = _2106;
    if (!_2124)
    {
        _2126 = 1.0;
    }
    float _2128 = _2126;
    bool _2130 = !_2124;
    float _2132 = _2128;
    if (!_2130)
    {
        bool _2134 = _2094 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2136 = isnan(_2094);
        bool _2138 = _2134 || _2136;
        bool _2140 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2142 = _2138 || _2140;
        if (!_2142)
        {
            float _2144 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2146 = _2094 + _2144;
            float _2148 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2150 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2148;
            float _2152 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2154 = _2152 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2156 = 1.0 / _2150;
            float _2158 = _2146 * _2156;
            float _2160 = fma(_2158, _2154, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2132 = _2160;
            _2162 = true;
        }
        else
        {
            bool _2164 = _2094 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2166 = isnan(_2094);
            bool _2168 = _2164 || _2166;
            bool _2170 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2172 = _2168 || _2170;
            if (!_2172)
            {
                float _2174 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2176 = _2094 + _2174;
                float _2178 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2180 = _2178 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2182 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2184 = _2182 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2186 = 1.0 / _2180;
                float _2188 = _2176 * _2186;
                float _2190 = fma(_2188, _2184, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2132 = _2190;
                _2162 = true;
            }
            else
            {
                _2132 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2162 = false;
    float _2192 = _2132;
    float _2194 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2196 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2198 = _2030 + _2196;
    float _2200 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2194);
    bool _2202 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2204 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(0.5);
    bool _2210 = _2206 || _2208;
    float _2212 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2214 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2216 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan(0.5);
    bool _2222 = _2218 || _2220;
    float _2224 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2200);
    float _2226 = fma(_2198, _2192, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2228 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2212);
    float _2230 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2232 = _2020 + _2230;
    float _2234 = _2224 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2238 = _2032 + _2236;
    float _2240 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2228);
    float _2242 = fma(_2232, _2192, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2244 = 1.0 / _2234;
    float _2246 = fma(_2238, _2192, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2248 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2250 = _2192;
    float _2252 = _2234;
    if (_2222)
    {
        _2048 = _2226;
    }
    float _2254 = _2048;
    float _2256 = _2248 + _2234;
    float _2258 = _2254;
    if (_2222)
    {
        _2050 = _2242;
    }
    float _2260 = _2050;
    float _2262 = _2260;
    if (_2222)
    {
        _2250 = _2246;
    }
    float _2264 = _2250;
    float _2266 = _2264;
    if (!_2222)
    {
        float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2270 = _1894 + _2268;
        float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2274 = _1818 + _2272;
        float _2276 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2278 = -_1818;
        float _2280 = _2278 + _2226;
        float _2282 = _2270 * _2270;
        float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2286 = _1820 + _2284;
        float _2288 = fma(_2274, _2274, _2282);
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2292 = fma(_2286, _2286, _2288);
        float _2294 = sqrt(_2292);
        float _2296 = _2276 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2298 = -_1894;
        float _2300 = _2298 + _2242;
        float _2302 = precise::min(_2294, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2304 = _2302 * _2290;
        float _2306 = _2296 * _2304;
        float _2308 = -_1820;
        float _2310 = _2308 + _2246;
        float _2312 = fma(_2280, _2306, _1818);
        float _2314 = fma(_2300, _2306, _1894);
        float _2316 = fma(_2310, _2306, _1820);
        _2262 = _2314;
        _2258 = _2312;
        _2266 = _2316;
    }
    float _2318 = _2262;
    float _2320 = _2258;
    float _2322 = _2266;
    if (_2210)
    {
        _1946 = 1.0;
    }
    float _2324 = _1946;
    float _2326 = _2256 * _2244;
    float _2328 = _2326 * 0.5;
    float _2330 = _2324;
    float _2332 = _2328;
    if (!_2210)
    {
        float _2334 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2338 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2336);
        float _2340 = _2334 * 0.15915493667125701904296875;
        float _2342 = _2340 * 6.283185482025146484375;
        float _2344 = cos(_2342);
        float _2346 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2348 = _2346 * 0.15915493667125701904296875;
        float _2350 = _2340 * 6.283185482025146484375;
        float _2352 = sin(_2350);
        float _2354 = 1.0 / _2344;
        float _2356 = _2348 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        float _2360 = _2352 * _2354;
        float _2362 = 1.0 / _2338;
        float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2366 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2364;
        float _2368 = _2358 * _2360;
        float _2370 = _2348 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        float _2374 = 1.0 / _2368;
        float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2378 = _2362 * _2376;
        float _2380 = 1.0 / _2366;
        float _2382 = _2372 * _2374;
        float _2384 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2386 = fma(_2382, _2378, _2384);
        float _2388 = _2386 * _2380;
        float _2390 = precise::clamp(_2388, 0.0, 1.0);
        _2330 = _2390;
    }
    float _2392 = _2330;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2396 = _2318 + _2394;
    float _2398 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2400 = _2320 + _2398;
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2404 = _2322 + _2402;
    float _2406 = _2396 * _2396;
    float _2408 = fma(_2400, _2400, _2406);
    float _2410 = fma(_2404, _2404, _2408);
    float _2412 = rsqrt(_2410);
    float _2414 = _2412 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2416 = _2400 * _2414;
    float _2418 = _2404 * _2414;
    float _2420 = _2416 * _2416;
    float _2422 = _2418 * _2418;
    float _2424 = _2420 + _2422;
    float _2426 = sqrt(_2424);
    bool _2428 = _2426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2432 = _2426 + _2430;
    float _2434 = _2408;
    float _2436 = _2424;
    float _2438 = _2432;
    float _2440 = _2396;
    float _2442 = _2414;
    if (_2428)
    {
        float _2444 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2434 = _2444;
    }
    float _2446 = _2434;
    if (_2428)
    {
        float _2448 = rsqrt(_2424);
        _2436 = _2448;
    }
    float _2450 = _2436;
    if (_2428)
    {
        float _2452 = _2432 * _2446;
        _2438 = _2452;
    }
    float _2454 = _2438;
    if (_2428)
    {
        float _2456 = _2454 * 0.15915493667125701904296875;
        _2252 = _2456;
    }
    float _2458 = _2252;
    float _2460 = _2412;
    if (_2428)
    {
        float _2462 = _2458 * 6.283185482025146484375;
        float _2464 = sin(_2462);
        _2460 = _2464;
    }
    float _2466 = _2460;
    float _2468 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2470 = precise::max(0.0, _2468);
    float _2472 = _2404;
    float _2474 = _2470;
    float _2476 = _2468;
    if (_2428)
    {
        float _2478 = _2458 * 6.283185482025146484375;
        float _2480 = cos(_2478);
        _2472 = _2480;
    }
    float _2482 = _2472;
    float _2484 = -_2414;
    float _2486 = -_2470;
    float _2488 = fma(_2396, _2484, _2486);
    if (!_2428)
    {
        _2440 = _2418;
    }
    float _2490 = _2440;
    float _2492 = _2490;
    if (_2428)
    {
        float _2494 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2474 = _2494;
    }
    float _2496 = _2474;
    float _2498 = _2496;
    float _2500 = _2466;
    if (_2428)
    {
        float _2502 = fma(_2466, _2496, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2442 = _2502;
    }
    float _2504 = _2442;
    float _2506 = _2504;
    if (!_2428)
    {
        _2498 = _2416;
    }
    float _2508 = _2498;
    float _2510 = _2508;
    if (!_2428)
    {
        _2500 = _2488;
    }
    float _2512 = _2500;
    float _2514 = _2512;
    if (_2428)
    {
        float _2516 = _2482 + (-1.0);
        _2476 = _2516;
    }
    float _2518 = _2476;
    float _2520 = _2518;
    if (_2428)
    {
        float _2522 = _2450 * _2504;
        _1948 = _2522;
    }
    float _2524 = _1948;
    if (!_2428)
    {
        _2506 = _2420;
    }
    float _2526 = _2506;
    float _2528 = sqrt(_2410);
    float _2530 = _2526;
    if (_2428)
    {
        float _2532 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2332 = _2532;
    }
    float _2534 = _2332;
    if (_2428)
    {
        float _2536 = _2416 * _2524;
        _2510 = _2536;
    }
    float _2538 = _2510;
    if (_2428)
    {
        float _2540 = _2418 * _2524;
        _2492 = _2540;
    }
    float _2542 = _2492;
    if (!_2428)
    {
        _2520 = _2422;
    }
    float _2544 = _2520;
    float _2546 = _2544;
    if (_2428)
    {
        float _2548 = fma(_2488, _2482, _2534);
        _2514 = _2548;
    }
    float _2550 = _2514;
    if (_2428)
    {
        float _2552 = _2538 * _2538;
        _2530 = _2552;
    }
    float _2554 = _2530;
    if (_2428)
    {
        float _2556 = _2542 * _2542;
        _2546 = _2556;
    }
    float _2558 = _2546;
    float _2560 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2562 = fma(_2550, _2550, _2554);
    float _2564 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2560);
    float _2566 = _2562 + _2558;
    float _2568 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2572 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2570);
    float _2574 = precise::clamp(_2572, 0.0, 1.0);
    float _2576 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2578 = rsqrt(_2566);
    float _2580 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2568);
    float _2582 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2584 = -_2574;
    float _2586 = _2584 + 1.0;
    float _2588 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2590 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2580);
    float _2592 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2582);
    float _2594 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2588);
    float _2596 = _2590 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2598 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2592);
    float _2600 = abs(_2586);
    float _2602 = log2(_2600);
    float _2604 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2594);
    float _2606 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2608 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2610 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2564);
    float _2612 = _2604 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2614 = _2578 * _2538;
    float _2616 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2618 = _2578 * _2542;
    float _2620 = -_2606;
    float _2622 = fma(_2620, _2576, 1.0);
    float _2624 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2626 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2616);
    float _2628 = _2578 * _2550;
    float _2630 = _2610 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2632 = log2(_2622);
    float _2634 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2626);
    float _2636 = -_2624;
    float _2638 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2636);
    float _2640 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2642 = -_2618;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2638);
    float _2646 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2648 = exp2(_2640);
    float _2650 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2634);
    float _2652 = fma(_2644, -0.5, 0.5);
    float _2654 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2656 = fma(_2644, 0.5, 0.5);
    float _2658 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2646);
    float _2660 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2654);
    float _2662 = 1.0 / _2650;
    float _2664 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2658);
    float _2666 = fma(_2656, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2668 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2660);
    float _2670 = _2628 + 1.0;
    float _2672 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2664);
    float _2674 = fma(_2656, _2666, -0.212114393711090087890625);
    float _2676 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2668);
    float _2678 = sqrt(_2652);
    float _2680 = _2632 * 0.693147182464599609375;
    float _2682 = fma(_2656, _2674, 1.570728778839111328125);
    float _2684 = -_2628;
    float _2686 = fma(_2648, _2670, _2684);
    float _2688 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2690 = _2672 * _2662;
    float _2692 = _2676 * _2662;
    float _2694 = fma(_2690, 0.5, 0.5);
    float _2696 = fma(_2692, -0.5, 0.5);
    float _2698 = fma(_2686, 0.5, 0.5);
    float _2700 = _2678 * 0.636619746685028076171875;
    float3 _6961 = float3(_2694, _2696, _2688);
    float _2702 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6961, float3(0.0), isnan(_6961)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6961, float3(0.0), isnan(_6961)), level(0.0)).x;
    float _2704 = -_2682;
    float _2706 = fma(_2700, _2704, 1.0);
    float3 _6977 = float3(_2694, _2696, _2688);
    float4 _2709 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6977, float3(0.0), isnan(_6977)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6977, float3(0.0), isnan(_6977)), level(0.0)).xyzw;
    float _2711 = _2709.x;
    float _2713 = _2709.y;
    float _2715 = _2709.z;
    float _2717 = _2709.w;
    float2 _6994 = float2(_2706, _2698);
    float3 _2721 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6994, float2(0.0), isnan(_6994)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6994, float2(0.0), isnan(_6994)), level(0.0)).xyz;
    float _2723 = _2721.x;
    float _2725 = _2721.y;
    float _2727 = _2721.z;
    float _2729 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2731 = _2608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2733 = _2650 * 0.5;
    bool _2735 = _2392 > 0.0;
    bool _2737 = isnan(_2392);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan(0.0);
    bool _2743 = _2739 || _2741;
    float _2745 = _2672 + _2650;
    float _2747 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2731);
    float _2749 = exp2(_2729);
    float _2751 = _2745 * 0.5;
    float _2753 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2747);
    float _2755 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2753);
    float _2757 = _2392 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2759 = fma(_2676, -0.5, _2733);
    float _2761 = _2755 + _2650;
    float _2763 = _2757 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2672;
    out.gl_Position.y = _2676;
    out.gl_Position.z = _2755;
    out.gl_Position.w = _2650;
    float _2765 = _2761 * 0.5;
    float _2767 = -_2749;
    float _2769 = _2767 + 1.0;
    out.m_47.x = _2763;
    float _2771 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2751;
    out.m_79.y = _2759;
    out.m_79.z = _2765;
    out.m_79.w = _2650;
    float _2773 = _2771 * _2702;
    float _2775 = -_2771;
    float _2777 = _2775 + 1.0;
    float _2779 = _2717 * _2773;
    float _2781 = _2727 * _2773;
    float _2783 = fma(_2723, _2779, _2711);
    float _2785 = fma(_2725, _2779, _2713);
    float _2787 = _2717 * _2777;
    float _2789 = fma(_2717, _2781, _2715);
    out.m_81.x = _2783;
    out.m_81.y = _2785;
    out.m_81.z = _2789;
    out.m_81.w = _2787;
    if (_2743)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2791 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2791;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

