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
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1464 = false;
    bool _816 = false;
    bool _594 = false;
    bool _398 = false;
    bool _284 = false;
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
        float _2082 = as_type<float>(_104);
        out.gl_Position.z = _2082;
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
        float _2151 = as_type<float>(_140);
        out.gl_Position.z = _2151;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_308;
    float _328 = _326 + 1.0;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = 1.0 / _312;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _338 = _324 * _328;
    float _340 = -_324;
    float _342 = _340 + 1.0;
    float _344 = _296 * _334;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _346;
    float _350 = fma(_332, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = fma(_348, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _358 = fma(_354, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = _350 * _338;
    float _362 = _358 * _338;
    float _364 = _356 * _338;
    float _366 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].x, _360);
    float _368 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].y, _362);
    float _370 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].z, _364);
    float _372 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _374 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].y, _368);
    float _376 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].z, _370);
    bool _378 = !_336;
    float _396;
    if (!_378)
    {
        float _380 = in.m_53.x;
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _384 = _380 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_88);
        float _402 = 1.0 / _400;
        float _404 = _122 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _406 + _408;
    bool _412 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _414 = isnan(_406);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _426 = _406 + _424;
    bool _428 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _430 = isnan(_406);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _448 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _450 = isnan(_406);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -_422;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _446;
    float _466 = _458 * _462;
    float _468 = -_458;
    float _470 = _468 + 1.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _472;
    bool _476 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _478 = 1.0 / _442;
    float _480 = _438 * _470;
    float _482 = -_438;
    float _484 = _482 + 1.0;
    float _486 = _426 * _464;
    float _488 = _410 * _478;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _494;
    float _498 = fma(_474, _488, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _500 = fma(_492, _488, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _502 = fma(_496, _488, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _504 = _498 * _480;
    float _506 = _500 * _480;
    float _508 = _502 * _480;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _522 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].x, _504);
    float _524 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].y, _506);
    float _526 = fma(_512, _486, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _528 = fma(_516, _486, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _530 = fma(_520, _486, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _532 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].z, _508);
    float _534 = fma(_526, _466, _522);
    float _536 = fma(_528, _466, _524);
    float _538 = fma(_530, _466, _532);
    float _540 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[109].x, _534);
    float _542 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[109].y, _536);
    float _544 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[109].z, _538);
    float _546 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _548 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _552 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _554 = _546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = in.m_51.x;
    float _560 = in.m_51.y;
    float _562 = in.m_51.z;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _554;
    out.m_55.y = _556;
    out.m_55.z = _564;
    out.m_55.w = _550;
    float _566 = _376 * _562;
    float _568 = _374 * _560;
    float _570 = _372 * _558;
    bool _572 = !_476;
    float _574 = _566;
    float _592;
    if (!_572)
    {
        float _576 = in.m_53.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_88);
        float _598 = 1.0 / _596;
        float _600 = _122 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _606 = _602 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _610 = _602 + _608;
    bool _612 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _614 = isnan(_602);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _630 = _602 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _640 = 1.0 / _626;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _644 = 1.0 / _634;
    float _646 = 1.0 / _638;
    float _648 = _606 * _640;
    bool _650 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _652 = isnan(_602);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -_622;
    float _664 = _662 + 1.0;
    float _666 = _660 * _664;
    float _668 = _610 * _644;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _674;
    bool _678 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _680 = isnan(_602);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = -_660;
    float _692 = _690 + 1.0;
    float _694 = fma(_672, _668, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = fma(_676, _668, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _702 = _630 * _646;
    bool _704 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _706 = isnan(_602);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _724 = fma(_700, _702, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _726 = fma(_718, _668, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _728 = -_714;
    float _730 = _728 + 1.0;
    float _732 = _714 * _692;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _738 = fma(_722, _702, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _740 = _688 * _730;
    float _742 = -_688;
    float _744 = _742 + 1.0;
    float _746 = fma(_736, _702, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _748 = _694 * _740;
    float _750 = _696 * _740;
    float _752 = _726 * _740;
    float _754 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[123].x, _748);
    float _756 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[123].y, _750);
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[123].z, _752);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _760;
    float _764 = fma(_738, _732, _754);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _770;
    float _774 = fma(_762, _648, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _776 = fma(_746, _732, _756);
    float _778 = fma(_768, _648, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _780 = fma(_772, _648, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _782 = fma(_724, _732, _758);
    float _784 = fma(_774, _666, _764);
    float _786 = fma(_778, _666, _776);
    float _788 = fma(_780, _666, _782);
    float _790 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[126].x, _784);
    float _792 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[126].y, _786);
    float _794 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[126].z, _788);
    bool _796 = !_642;
    float _814;
    if (!_796)
    {
        float _798 = in.m_53.x;
        float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _802 = _798 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _806 = _804 * _800;
        float _808 = floor(_806);
        float _810 = -_808;
        float _812 = _806 + _810;
        _814 = _812;
        _816 = true;
    }
    else
    {
        float _818 = float(_88);
        float _820 = 1.0 / _818;
        float _822 = _122 * _820;
        _814 = _822;
    }
    _816 = false;
    float _824 = _814;
    float _826 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _828 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _830 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _832 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _826);
    float _834 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _828);
    float _836 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _830);
    float _838 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _832);
    float _840 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _834);
    float _842 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _836);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _846 = _844 != 0;
    float _848 = _838 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _850 = _840 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _852 = in.m_53.w;
    float _854 = _842 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _858 = _848 + _856;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _862 = _850 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _866 = _854 + _864;
    float _868 = _858 * _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _876 = _874 != 0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _882 = fma(_862, _862, _868);
    float _884 = 1.0 / _872;
    float _886 = 0.0;
    float _888 = _884;
    if (_846)
    {
        float _890 = in.m_53.x;
        _886 = _890;
    }
    float _892 = _886;
    float _894 = fma(_866, _866, _882);
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _898 = _896 != 0;
    float _900 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = in.m_57.y;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _906 = _904 != 0;
    float _908 = rsqrt(_894);
    float _910 = in.m_57.x;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _914 = _912 != 0;
    float _916 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _918 = _852 > 0.5;
    float _920 = 0.0;
    bool _922 = _918;
    float _924 = _902;
    if (_876)
    {
        float _926 = in.m_53.z;
        _920 = _926;
    }
    float _928 = _920;
    bool _930 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _932 = isnan(_824);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = 1.0 / _880;
    float _944 = in.m_59.x;
    float _946 = in.m_59.y;
    float _948 = in.m_59.z;
    float _950 = _858 * _908;
    float _952 = _862 * _908;
    float _954 = _866 * _908;
    bool _956 = false;
    if (_846)
    {
        bool _958 = _892 > 0.5;
        _956 = _958;
    }
    bool _960 = _956;
    float _962 = -_950;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    float _966 = -_952;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _970 = -_954;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _976 = _824 + _974;
    float _978 = _964 * _964;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _988 = fma(_968, _968, _978);
    float _990 = fma(_972, _972, _988);
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _944);
    float _996 = sqrt(_990);
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _948);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _824 + _1008;
    float _1012 = _1002 * _884;
    float _1014 = _1006 * _942;
    float _1016 = _1002;
    if (!_898)
    {
        float _1018 = in.m_53.y;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = 1.0 / _982;
    float _1024 = fma(_1012, _1010, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1026 = fma(_1014, _976, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1028 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = _1028;
    if (!_846)
    {
        _888 = _910;
    }
    float _1032 = _888;
    float _1034 = _908 * _996;
    float _1036 = _1032;
    if (!_846)
    {
        _574 = _1032;
    }
    float _1038 = _574;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1046 = _824 + _1044;
    float _1048 = _900 * _1034;
    float _1050 = _916 * _1034;
    float _1052 = _1028 * _1034;
    float _1054 = _1038;
    if (_846)
    {
        _1036 = _910;
    }
    float _1056 = _1036;
    float _1058 = _1048 * _992;
    float _1060 = _1042 * _1022;
    float _1062 = -_902;
    float _1064 = _1062 + 1.0;
    bool _1066 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1068 = isnan(_824);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _1050 * _994;
    float _1080 = fma(_1060, _1046, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1082 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1084 = isnan(_824);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1096 = _918 ? as_type<int>(_1064) : as_type<int>(_902);
    float _1098 = -_1076;
    float _1100 = _1098 + 1.0;
    float _1102 = _1056;
    if (!_898)
    {
        _1030 = _1020;
    }
    float _1104 = _1030;
    float _1106 = _1052 * _998;
    if (_876)
    {
        bool _1108 = _928 > 0.5;
        _922 = _1108;
    }
    bool _1110 = _922;
    float _1112 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1114 = _1092 * _1100;
    float _1116 = _910;
    if (!_898)
    {
        float _1118 = in.m_53.z;
        _1116 = _1118;
    }
    float _1120 = _1116;
    float _1122 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1094);
    float _1124 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1112);
    bool _1126 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1128 = isnan(_824);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = _1104;
    float _1140 = _1020;
    if (_898)
    {
        float _1142 = in.m_53.x;
        float _1144 = in.m_53.y;
        _1138 = _1142;
        _1140 = _1144;
    }
    float _1146 = _1138;
    float _1148 = _1140;
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1122);
    float _1152 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1124);
    float _1154 = -_1092;
    float _1156 = _1154 + 1.0;
    float _1158 = _906 ? as_type<float>(_1096) : _902;
    float _1160 = _984 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1162 = _850 + _1150;
    float _1164 = _854 + _1152;
    float _1166 = _1136 * _1156;
    float _1168 = -_1136;
    float _1170 = _1168 + 1.0;
    float _1172 = fma(_1160, _1158, -0.5);
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1176 = _1162 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1180 = _1164 + _1178;
    float _1182 = _940 * _1170;
    int _1184 = as_type<int>(_1152);
    float _1186 = _1162;
    float _1188 = _1164;
    float _1190 = _1176;
    if (_846)
    {
        float _1192 = -_1056;
        float _1194 = _1192 + 1.0;
        _1184 = as_type<int>(_1194);
    }
    int _1196 = _1184;
    float _1198 = _1176 * _1176;
    float _1200 = _1180 * _1180;
    float _1202 = _1026 * _1182;
    int _1204 = 0;
    float _1206 = _1198;
    float _1208 = _1200;
    if (_876)
    {
        float _1210 = -_1056;
        float _1212 = _1210 + 1.0;
        _1204 = as_type<int>(_1212);
    }
    int _1214 = _1204;
    if (_846)
    {
        float _1216 = _960 ? as_type<float>(_1196) : _1056;
        _1054 = _1216;
    }
    float _1218 = _1054;
    float _1220 = _1198 + _1200;
    float _1222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1224 = 0.0;
    float _1226 = _1120;
    if (!_898)
    {
        _1224 = _1120;
    }
    float _1228 = _1224;
    float _1230 = -_940;
    float _1232 = _1230 + 1.0;
    float _1234 = _1228;
    if (_898)
    {
        _1234 = _1148;
    }
    float _1236 = _1234;
    if (_898)
    {
        _1226 = _1148;
    }
    float _1238 = _1226;
    float _1240 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1202);
    bool _1242 = _1148 > 0.5;
    float _1244 = sqrt(_1220);
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[83].w, _986);
    if (_876)
    {
        float _1250 = _1110 ? as_type<float>(_1214) : _1056;
        _1102 = _1250;
    }
    float _1252 = _1102;
    float _1254 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1246);
    float _1256 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1260 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_914)
    {
        float _1262 = _1242 ? _1064 : _902;
        _924 = _1262;
    }
    float _1264 = _924;
    float _1266 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1268 = -_1258;
    float _1270 = fma(_1256, 2.0, _1268);
    float _1272 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1274 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1260);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1278 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1280 = fma(_1272, _1252, -0.5);
    float _1282 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1274);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1286 = -_122;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1270);
    float _1290 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1248);
    float _1292 = _848 + _1282;
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1296 = fma(_1266, -2.0, _1284);
    float _1298 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1254);
    float _1300 = fma(_1024, _1166, _1240);
    float _1302 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1296);
    float _1304 = _1282;
    if (!_1278)
    {
        _1304 = _1292;
    }
    float _1306 = _1304;
    bool _1308 = !_1278;
    float _1310 = _1306;
    if (!_1308)
    {
        float _1312 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1316 = _1244 + _1314;
        float _1318 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1320 = rsqrt(_1220);
        float _1322 = _1316 * _1312;
        float _1324 = _1322 * 0.15915493667125701904296875;
        float _1326 = _1324 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = _1324 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        float _1334 = fma(_1328, _1318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1336 = _1320 * _1334;
        float _1338 = fma(_1176, _1336, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1340 = _1332 + (-1.0);
        float _1342 = fma(_1180, _1336, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1346 = _1338 + _1344;
        float _1348 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1352 = _1342 + _1350;
        float _1354 = _1346 * _1346;
        float _1356 = fma(_1292, _1332, _1348);
        float _1358 = _1352 * _1352;
        _1310 = _1356;
        _1206 = _1354;
        _1208 = _1358;
        _1186 = _1338;
        _1188 = _1342;
    }
    float _1360 = _1310;
    float _1362 = _1206;
    float _1364 = _1208;
    float _1366 = _1186;
    float _1368 = _1188;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1372 = _1360 + _1370;
    float _1374 = fma(_1080, _1114, _1300);
    float _1376 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1378 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = fma(_1372, _1372, _1362);
    float _1382 = fma(_1298, _1280, _1288);
    float _1384 = -_1302;
    float _1386 = fma(_1290, _1172, _1384);
    float _1388 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1374);
    float _1390 = _1380 + _1364;
    float _1392 = _790 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1394 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1396 = _794 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1398 = _1376 * _1276;
    float _1400 = _1378 * _1294;
    float _1402 = sqrt(_1390);
    float _1404 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1382 + 0.5;
    float _1412 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1414 = _1386 + 0.5;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    out.m_63.x = _1404;
    out.m_63.y = _1406;
    out.m_63.z = _1408;
    out.m_63.w = _1412;
    bool _1416 = _1402 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1418 = isnan(_1402);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1424 = _1420 || _1422;
    out.m_65.x = _1398;
    out.m_65.y = _1400;
    out.m_65.z = _1410;
    out.m_65.w = _1414;
    float _1426 = _1392;
    float _1428 = _1406;
    if (!_1424)
    {
        _1426 = 1.0;
    }
    float _1430 = _1426;
    bool _1432 = !_1424;
    float _1434 = _1430;
    if (!_1432)
    {
        bool _1436 = _1402 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1438 = isnan(_1402);
        bool _1440 = _1436 || _1438;
        bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1444 = _1440 || _1442;
        if (!_1444)
        {
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = _1402 + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1452 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1450;
            float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1458 = 1.0 / _1452;
            float _1460 = _1448 * _1458;
            float _1462 = fma(_1460, _1456, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1434 = _1462;
            _1464 = true;
        }
        else
        {
            bool _1466 = _1402 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1468 = isnan(_1402);
            bool _1470 = _1466 || _1468;
            bool _1472 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1474 = _1470 || _1472;
            if (!_1474)
            {
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1402 + _1476;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1486 = _1484 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1488 = 1.0 / _1482;
                float _1490 = _1478 * _1488;
                float _1492 = fma(_1490, _1486, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1434 = _1492;
                _1464 = true;
            }
            else
            {
                _1434 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1464 = false;
    float _1494 = _1434;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1498 = _1360 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1502 = _1366 + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1506 = _1368 + _1504;
    float _1508 = fma(_1498, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1510 = fma(_1502, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1512 = fma(_1506, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1514 = -_950;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1508);
    float _1518 = -_952;
    float _1520 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1510);
    float _1522 = -_954;
    float _1524 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1512);
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1528 = _1516 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1532 = _1520 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1536 = _1524 + _1534;
    float _1538 = _1528 * _1528;
    float _1540 = fma(_1532, _1532, _1538);
    float _1542 = fma(_1536, _1536, _1540);
    float _1544 = rsqrt(_1542);
    float _1546 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1532 * _1546;
    float _1550 = _1536 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 + _1554;
    float _1558 = sqrt(_1556);
    bool _1560 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = _1558 + _1562;
    float _1566 = _1544;
    float _1568 = _1556;
    float _1570 = _1564;
    float _1572 = _1528;
    float _1574 = _1548;
    if (_1560)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1576;
    }
    float _1578 = _1566;
    if (_1560)
    {
        float _1580 = rsqrt(_1556);
        _1568 = _1580;
    }
    float _1582 = _1568;
    if (_1560)
    {
        float _1584 = _1564 * _1578;
        _1570 = _1584;
    }
    float _1586 = _1570;
    if (_1560)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _1428 = _1588;
    }
    float _1590 = _1428;
    float _1592 = _1536;
    if (_1560)
    {
        float _1594 = _1590 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1494;
    float _1606 = _1602;
    float _1608 = _1600;
    if (_1560)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = -_1546;
    float _1618 = -_1602;
    float _1620 = fma(_1528, _1616, _1618);
    if (_1560)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1622;
    }
    float _1624 = _1606;
    float _1626 = _1624;
    float _1628 = _1598;
    if (_1560)
    {
        float _1630 = fma(_1598, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    if (!_1560)
    {
        _1628 = _1550;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    if (_1560)
    {
        float _1640 = _1614 + (-1.0);
        _1608 = _1640;
    }
    float _1642 = _1608;
    float _1644 = _1642;
    if (_1560)
    {
        float _1646 = _1582 * _1632;
        _1190 = _1646;
    }
    float _1648 = _1190;
    if (!_1560)
    {
        _1634 = _1620;
    }
    float _1650 = _1634;
    float _1652 = sqrt(_1542);
    float _1654 = _1650;
    if (_1560)
    {
        float _1656 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1656;
    }
    float _1658 = _1572;
    float _1660 = _1658;
    if (_1560)
    {
        float _1662 = _1548 * _1648;
        _1574 = _1662;
    }
    float _1664 = _1574;
    if (!_1560)
    {
        _1644 = _1552;
    }
    float _1666 = _1644;
    float _1668 = _1666;
    if (_1560)
    {
        float _1670 = _1550 * _1648;
        _1638 = _1670;
    }
    float _1672 = _1638;
    if (_1560)
    {
        float _1674 = fma(_1620, _1614, _1658);
        _1654 = _1674;
    }
    float _1676 = _1654;
    if (_1560)
    {
        float _1678 = _1664 * _1664;
        _1668 = _1678;
    }
    float _1680 = _1668;
    if (!_1560)
    {
        _1660 = _1554;
    }
    float _1682 = _1660;
    float _1684 = _1682;
    if (_1560)
    {
        float _1686 = _1672 * _1672;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1692 = fma(_1676, _1676, _1680);
    float _1694 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1696 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1690);
    float _1698 = _1692 + _1688;
    float _1700 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1694);
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1704 = fma(_1652, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1702);
    float _1706 = precise::clamp(_1704, 0.0, 1.0);
    float _1708 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1710 = rsqrt(_1698);
    float _1712 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1700);
    float _1714 = -_1706;
    float _1716 = _1714 + 1.0;
    float _1718 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1708);
    float _1722 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1696);
    float _1724 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1726 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1728 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1720);
    float _1730 = abs(_1716);
    float _1732 = log2(_1730);
    float _1734 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1736 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1740 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1748 = _1710 * _1664;
    float _1750 = _1710 * _1676;
    float _1752 = _1710 * _1672;
    float _1754 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1746);
    float _1756 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1758 = -_1740;
    float _1760 = fma(_1758, _1734, 1.0);
    float _1762 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1764 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1754);
    float _1766 = -_1756;
    float _1768 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1766);
    float _1770 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1764);
    float _1774 = -_1752;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1768);
    float _1778 = log2(_1760);
    float _1780 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1782 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1762);
    float _1784 = fma(_1776, -0.5, 0.5);
    float _1786 = fma(_1776, 0.5, 0.5);
    float _1788 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1780);
    float _1790 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1782);
    float _1792 = _1750 + 1.0;
    float _1794 = exp2(_1770);
    float _1796 = fma(_1786, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1798 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1788);
    float _1800 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1790);
    float _1802 = fma(_1786, _1796, -0.212114393711090087890625);
    float _1804 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1806 = 1.0 / _1772;
    float _1808 = _1778 * 0.693147182464599609375;
    float _1810 = fma(_1786, _1802, 1.570728778839111328125);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1814 = sqrt(_1784);
    float _1816 = -_1750;
    float _1818 = fma(_1794, _1792, _1816);
    float _1820 = fma(_1818, 0.5, 0.5);
    float _1822 = _1804 * _1806;
    float _1824 = _1800 * _1806;
    float _1826 = fma(_1822, 0.5, 0.5);
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = _1814 * 0.636619746685028076171875;
    float _1832 = -_1810;
    float _1834 = fma(_1830, _1832, 1.0);
    float3 _4949 = float3(_1826, _1828, _1812);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4949, float3(0.0), isnan(_4949)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4949, float3(0.0), isnan(_4949)), level(0.0)).x;
    float3 _4960 = float3(_1826, _1828, _1812);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4960, float3(0.0), isnan(_4960)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4960, float3(0.0), isnan(_4960)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float2 _4977 = float2(_1834, _1820);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4977, float2(0.0), isnan(_4977)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4977, float2(0.0), isnan(_4977)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = -_950;
    float _1861 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _848);
    float _1863 = -_952;
    float _1865 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1867 = -_954;
    float _1869 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _1871 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1873 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1871);
    float _1875 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1877 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1873);
    float _1879 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1875);
    float _1881 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1883 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan(0.5);
    bool _1891 = _1887 || _1889;
    float _1893 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1895 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1879);
    float _1897 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1899 = exp2(_1881);
    float _1901 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1897);
    float _1905 = _1901 + _1893;
    float _1907 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1903);
    float _1909 = 1.0 / _1893;
    float _1911 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1891)
    {
        _1911 = 1.0;
    }
    float _1913 = _1911;
    float _1915 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1907);
    float _1917 = _1905 * _1909;
    float _1919 = _1917 * 0.5;
    float _1921 = _1913;
    if (!_1891)
    {
        float _1923 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1927 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1925);
        float _1929 = _1923 * 0.15915493667125701904296875;
        float _1931 = _1929 * 6.283185482025146484375;
        float _1933 = cos(_1931);
        float _1935 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1937 = _1935 * 0.15915493667125701904296875;
        float _1939 = _1929 * 6.283185482025146484375;
        float _1941 = sin(_1939);
        float _1943 = 1.0 / _1933;
        float _1945 = _1937 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        float _1949 = _1941 * _1943;
        float _1951 = 1.0 / _1927;
        float _1953 = _1947 * _1949;
        float _1955 = _1937 * 6.283185482025146484375;
        float _1957 = sin(_1955);
        float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1961 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1959;
        float _1963 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1965 = _1951 * _1963;
        float _1967 = 1.0 / _1953;
        float _1969 = 1.0 / _1961;
        float _1971 = _1957 * _1967;
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1975 = fma(_1971, _1965, _1973);
        float _1977 = _1975 * _1969;
        float _1979 = precise::clamp(_1977, 0.0, 1.0);
        _1921 = _1979;
    }
    float _1981 = _1921;
    float _1983 = _1915 + _1772;
    float _1985 = -_1899;
    float _1987 = _1985 + 1.0;
    bool _1989 = _1981 > 0.0;
    bool _1991 = isnan(_1981);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    float _1999 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2001 = _1983 * 0.5;
    float _2003 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2005 = _1999 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2007 = _2003 * _1836;
    float _2009 = -_2003;
    float _2011 = _2009 + 1.0;
    out.gl_Position.x = _1804;
    out.gl_Position.y = _1800;
    out.gl_Position.z = _1915;
    out.gl_Position.w = _1772;
    float _2013 = _1847 * _2007;
    float _2015 = _1857 * _2007;
    out.m_67.z = _2001;
    out.m_67.w = _1772;
    float _2017 = fma(_1853, _2013, _1841);
    float _2019 = fma(_1855, _2013, _1843);
    float _2021 = _1847 * _2011;
    float _2023 = fma(_1847, _2015, _1845);
    out.m_47.x = _2005;
    out.m_69.x = _2017;
    out.m_69.y = _2019;
    out.m_69.z = _2023;
    out.m_69.w = _2021;
    if (_1997)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2025 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2025;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1464 = false;
    bool _816 = false;
    bool _594 = false;
    bool _398 = false;
    bool _284 = false;
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
        float _2082 = as_type<float>(_104);
        out.gl_Position.z = _2082;
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
        float _2151 = as_type<float>(_140);
        out.gl_Position.z = _2151;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_308;
    float _328 = _326 + 1.0;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = 1.0 / _312;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _338 = _324 * _328;
    float _340 = -_324;
    float _342 = _340 + 1.0;
    float _344 = _296 * _334;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _346;
    float _350 = fma(_332, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = fma(_348, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _358 = fma(_354, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = _350 * _338;
    float _362 = _358 * _338;
    float _364 = _356 * _338;
    float _366 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].x, _360);
    float _368 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].y, _362);
    float _370 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].z, _364);
    float _372 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _374 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].y, _368);
    float _376 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].z, _370);
    bool _378 = !_336;
    float _396;
    if (!_378)
    {
        float _380 = in.m_53.x;
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _384 = _380 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_88);
        float _402 = 1.0 / _400;
        float _404 = _122 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _406 + _408;
    bool _412 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _414 = isnan(_406);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _426 = _406 + _424;
    bool _428 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _430 = isnan(_406);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _448 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _450 = isnan(_406);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -_422;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _446;
    float _466 = _458 * _462;
    float _468 = -_458;
    float _470 = _468 + 1.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _472;
    bool _476 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _478 = 1.0 / _442;
    float _480 = _438 * _470;
    float _482 = -_438;
    float _484 = _482 + 1.0;
    float _486 = _426 * _464;
    float _488 = _410 * _478;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _494;
    float _498 = fma(_474, _488, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _500 = fma(_492, _488, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _502 = fma(_496, _488, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _504 = _498 * _480;
    float _506 = _500 * _480;
    float _508 = _502 * _480;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _522 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].x, _504);
    float _524 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].y, _506);
    float _526 = fma(_512, _486, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _528 = fma(_516, _486, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _530 = fma(_520, _486, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _532 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].z, _508);
    float _534 = fma(_526, _466, _522);
    float _536 = fma(_528, _466, _524);
    float _538 = fma(_530, _466, _532);
    float _540 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[109].x, _534);
    float _542 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[109].y, _536);
    float _544 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[109].z, _538);
    float _546 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _548 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _552 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _554 = _546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = in.m_51.x;
    float _560 = in.m_51.y;
    float _562 = in.m_51.z;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _554;
    out.m_55.y = _556;
    out.m_55.z = _564;
    out.m_55.w = _550;
    float _566 = _376 * _562;
    float _568 = _374 * _560;
    float _570 = _372 * _558;
    bool _572 = !_476;
    float _574 = _566;
    float _592;
    if (!_572)
    {
        float _576 = in.m_53.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_88);
        float _598 = 1.0 / _596;
        float _600 = _122 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _606 = _602 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _610 = _602 + _608;
    bool _612 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _614 = isnan(_602);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _630 = _602 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _640 = 1.0 / _626;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _644 = 1.0 / _634;
    float _646 = 1.0 / _638;
    float _648 = _606 * _640;
    bool _650 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _652 = isnan(_602);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -_622;
    float _664 = _662 + 1.0;
    float _666 = _660 * _664;
    float _668 = _610 * _644;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _674;
    bool _678 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _680 = isnan(_602);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = -_660;
    float _692 = _690 + 1.0;
    float _694 = fma(_672, _668, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = fma(_676, _668, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _702 = _630 * _646;
    bool _704 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _706 = isnan(_602);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _724 = fma(_700, _702, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _726 = fma(_718, _668, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _728 = -_714;
    float _730 = _728 + 1.0;
    float _732 = _714 * _692;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _738 = fma(_722, _702, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _740 = _688 * _730;
    float _742 = -_688;
    float _744 = _742 + 1.0;
    float _746 = fma(_736, _702, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _748 = _694 * _740;
    float _750 = _696 * _740;
    float _752 = _726 * _740;
    float _754 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[123].x, _748);
    float _756 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[123].y, _750);
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[123].z, _752);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _760;
    float _764 = fma(_738, _732, _754);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _770;
    float _774 = fma(_762, _648, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _776 = fma(_746, _732, _756);
    float _778 = fma(_768, _648, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _780 = fma(_772, _648, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _782 = fma(_724, _732, _758);
    float _784 = fma(_774, _666, _764);
    float _786 = fma(_778, _666, _776);
    float _788 = fma(_780, _666, _782);
    float _790 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[126].x, _784);
    float _792 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[126].y, _786);
    float _794 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[126].z, _788);
    bool _796 = !_642;
    float _814;
    if (!_796)
    {
        float _798 = in.m_53.x;
        float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _802 = _798 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _806 = _804 * _800;
        float _808 = floor(_806);
        float _810 = -_808;
        float _812 = _806 + _810;
        _814 = _812;
        _816 = true;
    }
    else
    {
        float _818 = float(_88);
        float _820 = 1.0 / _818;
        float _822 = _122 * _820;
        _814 = _822;
    }
    _816 = false;
    float _824 = _814;
    float _826 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _828 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _830 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _832 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _826);
    float _834 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _828);
    float _836 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _830);
    float _838 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _832);
    float _840 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _834);
    float _842 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _836);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _846 = _844 != 0;
    float _848 = _838 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _850 = _840 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _852 = in.m_53.w;
    float _854 = _842 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _858 = _848 + _856;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _862 = _850 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _866 = _854 + _864;
    float _868 = _858 * _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _876 = _874 != 0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _882 = fma(_862, _862, _868);
    float _884 = 1.0 / _872;
    float _886 = 0.0;
    float _888 = _884;
    if (_846)
    {
        float _890 = in.m_53.x;
        _886 = _890;
    }
    float _892 = _886;
    float _894 = fma(_866, _866, _882);
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _898 = _896 != 0;
    float _900 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = in.m_57.y;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _906 = _904 != 0;
    float _908 = rsqrt(_894);
    float _910 = in.m_57.x;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _914 = _912 != 0;
    float _916 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _918 = _852 > 0.5;
    float _920 = 0.0;
    bool _922 = _918;
    float _924 = _902;
    if (_876)
    {
        float _926 = in.m_53.z;
        _920 = _926;
    }
    float _928 = _920;
    bool _930 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _932 = isnan(_824);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = 1.0 / _880;
    float _944 = in.m_59.x;
    float _946 = in.m_59.y;
    float _948 = in.m_59.z;
    float _950 = _858 * _908;
    float _952 = _862 * _908;
    float _954 = _866 * _908;
    bool _956 = false;
    if (_846)
    {
        bool _958 = _892 > 0.5;
        _956 = _958;
    }
    bool _960 = _956;
    float _962 = -_950;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    float _966 = -_952;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _970 = -_954;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _976 = _824 + _974;
    float _978 = _964 * _964;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _988 = fma(_968, _968, _978);
    float _990 = fma(_972, _972, _988);
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _944);
    float _996 = sqrt(_990);
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _948);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _824 + _1008;
    float _1012 = _1002 * _884;
    float _1014 = _1006 * _942;
    float _1016 = _1002;
    if (!_898)
    {
        float _1018 = in.m_53.y;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = 1.0 / _982;
    float _1024 = fma(_1012, _1010, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1026 = fma(_1014, _976, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1028 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = _1028;
    if (!_846)
    {
        _888 = _910;
    }
    float _1032 = _888;
    float _1034 = _908 * _996;
    float _1036 = _1032;
    if (!_846)
    {
        _574 = _1032;
    }
    float _1038 = _574;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1046 = _824 + _1044;
    float _1048 = _900 * _1034;
    float _1050 = _916 * _1034;
    float _1052 = _1028 * _1034;
    float _1054 = _1038;
    if (_846)
    {
        _1036 = _910;
    }
    float _1056 = _1036;
    float _1058 = _1048 * _992;
    float _1060 = _1042 * _1022;
    float _1062 = -_902;
    float _1064 = _1062 + 1.0;
    bool _1066 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1068 = isnan(_824);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _1050 * _994;
    float _1080 = fma(_1060, _1046, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1082 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1084 = isnan(_824);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1096 = _918 ? as_type<int>(_1064) : as_type<int>(_902);
    float _1098 = -_1076;
    float _1100 = _1098 + 1.0;
    float _1102 = _1056;
    if (!_898)
    {
        _1030 = _1020;
    }
    float _1104 = _1030;
    float _1106 = _1052 * _998;
    if (_876)
    {
        bool _1108 = _928 > 0.5;
        _922 = _1108;
    }
    bool _1110 = _922;
    float _1112 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1114 = _1092 * _1100;
    float _1116 = _910;
    if (!_898)
    {
        float _1118 = in.m_53.z;
        _1116 = _1118;
    }
    float _1120 = _1116;
    float _1122 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1094);
    float _1124 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1112);
    bool _1126 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1128 = isnan(_824);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = _1104;
    float _1140 = _1020;
    if (_898)
    {
        float _1142 = in.m_53.x;
        float _1144 = in.m_53.y;
        _1138 = _1142;
        _1140 = _1144;
    }
    float _1146 = _1138;
    float _1148 = _1140;
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1122);
    float _1152 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1124);
    float _1154 = -_1092;
    float _1156 = _1154 + 1.0;
    float _1158 = _906 ? as_type<float>(_1096) : _902;
    float _1160 = _984 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1162 = _850 + _1150;
    float _1164 = _854 + _1152;
    float _1166 = _1136 * _1156;
    float _1168 = -_1136;
    float _1170 = _1168 + 1.0;
    float _1172 = fma(_1160, _1158, -0.5);
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1176 = _1162 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1180 = _1164 + _1178;
    float _1182 = _940 * _1170;
    int _1184 = as_type<int>(_1152);
    float _1186 = _1162;
    float _1188 = _1164;
    float _1190 = _1176;
    if (_846)
    {
        float _1192 = -_1056;
        float _1194 = _1192 + 1.0;
        _1184 = as_type<int>(_1194);
    }
    int _1196 = _1184;
    float _1198 = _1176 * _1176;
    float _1200 = _1180 * _1180;
    float _1202 = _1026 * _1182;
    int _1204 = 0;
    float _1206 = _1198;
    float _1208 = _1200;
    if (_876)
    {
        float _1210 = -_1056;
        float _1212 = _1210 + 1.0;
        _1204 = as_type<int>(_1212);
    }
    int _1214 = _1204;
    if (_846)
    {
        float _1216 = _960 ? as_type<float>(_1196) : _1056;
        _1054 = _1216;
    }
    float _1218 = _1054;
    float _1220 = _1198 + _1200;
    float _1222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1224 = 0.0;
    float _1226 = _1120;
    if (!_898)
    {
        _1224 = _1120;
    }
    float _1228 = _1224;
    float _1230 = -_940;
    float _1232 = _1230 + 1.0;
    float _1234 = _1228;
    if (_898)
    {
        _1234 = _1148;
    }
    float _1236 = _1234;
    if (_898)
    {
        _1226 = _1148;
    }
    float _1238 = _1226;
    float _1240 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1202);
    bool _1242 = _1148 > 0.5;
    float _1244 = sqrt(_1220);
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[83].w, _986);
    if (_876)
    {
        float _1250 = _1110 ? as_type<float>(_1214) : _1056;
        _1102 = _1250;
    }
    float _1252 = _1102;
    float _1254 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1246);
    float _1256 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1260 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_914)
    {
        float _1262 = _1242 ? _1064 : _902;
        _924 = _1262;
    }
    float _1264 = _924;
    float _1266 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1268 = -_1258;
    float _1270 = fma(_1256, 2.0, _1268);
    float _1272 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1274 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1260);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1278 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1280 = fma(_1272, _1252, -0.5);
    float _1282 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1274);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1286 = -_122;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1270);
    float _1290 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1248);
    float _1292 = _848 + _1282;
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1296 = fma(_1266, -2.0, _1284);
    float _1298 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1254);
    float _1300 = fma(_1024, _1166, _1240);
    float _1302 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1296);
    float _1304 = _1282;
    if (!_1278)
    {
        _1304 = _1292;
    }
    float _1306 = _1304;
    bool _1308 = !_1278;
    float _1310 = _1306;
    if (!_1308)
    {
        float _1312 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1316 = _1244 + _1314;
        float _1318 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1320 = rsqrt(_1220);
        float _1322 = _1316 * _1312;
        float _1324 = _1322 * 0.15915493667125701904296875;
        float _1326 = _1324 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = _1324 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        float _1334 = fma(_1328, _1318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1336 = _1320 * _1334;
        float _1338 = fma(_1176, _1336, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1340 = _1332 + (-1.0);
        float _1342 = fma(_1180, _1336, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1346 = _1338 + _1344;
        float _1348 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1352 = _1342 + _1350;
        float _1354 = _1346 * _1346;
        float _1356 = fma(_1292, _1332, _1348);
        float _1358 = _1352 * _1352;
        _1310 = _1356;
        _1206 = _1354;
        _1208 = _1358;
        _1186 = _1338;
        _1188 = _1342;
    }
    float _1360 = _1310;
    float _1362 = _1206;
    float _1364 = _1208;
    float _1366 = _1186;
    float _1368 = _1188;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1372 = _1360 + _1370;
    float _1374 = fma(_1080, _1114, _1300);
    float _1376 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1378 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = fma(_1372, _1372, _1362);
    float _1382 = fma(_1298, _1280, _1288);
    float _1384 = -_1302;
    float _1386 = fma(_1290, _1172, _1384);
    float _1388 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1374);
    float _1390 = _1380 + _1364;
    float _1392 = _790 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1394 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1396 = _794 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1398 = _1376 * _1276;
    float _1400 = _1378 * _1294;
    float _1402 = sqrt(_1390);
    float _1404 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1382 + 0.5;
    float _1412 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1414 = _1386 + 0.5;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    out.m_63.x = _1404;
    out.m_63.y = _1406;
    out.m_63.z = _1408;
    out.m_63.w = _1412;
    bool _1416 = _1402 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1418 = isnan(_1402);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1424 = _1420 || _1422;
    out.m_65.x = _1398;
    out.m_65.y = _1400;
    out.m_65.z = _1410;
    out.m_65.w = _1414;
    float _1426 = _1392;
    float _1428 = _1406;
    if (!_1424)
    {
        _1426 = 1.0;
    }
    float _1430 = _1426;
    bool _1432 = !_1424;
    float _1434 = _1430;
    if (!_1432)
    {
        bool _1436 = _1402 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1438 = isnan(_1402);
        bool _1440 = _1436 || _1438;
        bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1444 = _1440 || _1442;
        if (!_1444)
        {
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = _1402 + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1452 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1450;
            float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1458 = 1.0 / _1452;
            float _1460 = _1448 * _1458;
            float _1462 = fma(_1460, _1456, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1434 = _1462;
            _1464 = true;
        }
        else
        {
            bool _1466 = _1402 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1468 = isnan(_1402);
            bool _1470 = _1466 || _1468;
            bool _1472 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1474 = _1470 || _1472;
            if (!_1474)
            {
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1402 + _1476;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1486 = _1484 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1488 = 1.0 / _1482;
                float _1490 = _1478 * _1488;
                float _1492 = fma(_1490, _1486, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1434 = _1492;
                _1464 = true;
            }
            else
            {
                _1434 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1464 = false;
    float _1494 = _1434;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1498 = _1360 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1502 = _1366 + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1506 = _1368 + _1504;
    float _1508 = fma(_1498, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1510 = fma(_1502, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1512 = fma(_1506, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1514 = -_950;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1508);
    float _1518 = -_952;
    float _1520 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1510);
    float _1522 = -_954;
    float _1524 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1512);
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1528 = _1516 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1532 = _1520 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1536 = _1524 + _1534;
    float _1538 = _1528 * _1528;
    float _1540 = fma(_1532, _1532, _1538);
    float _1542 = fma(_1536, _1536, _1540);
    float _1544 = rsqrt(_1542);
    float _1546 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1532 * _1546;
    float _1550 = _1536 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 + _1554;
    float _1558 = sqrt(_1556);
    bool _1560 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = _1558 + _1562;
    float _1566 = _1544;
    float _1568 = _1556;
    float _1570 = _1564;
    float _1572 = _1528;
    float _1574 = _1548;
    if (_1560)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1576;
    }
    float _1578 = _1566;
    if (_1560)
    {
        float _1580 = rsqrt(_1556);
        _1568 = _1580;
    }
    float _1582 = _1568;
    if (_1560)
    {
        float _1584 = _1564 * _1578;
        _1570 = _1584;
    }
    float _1586 = _1570;
    if (_1560)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _1428 = _1588;
    }
    float _1590 = _1428;
    float _1592 = _1536;
    if (_1560)
    {
        float _1594 = _1590 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1494;
    float _1606 = _1602;
    float _1608 = _1600;
    if (_1560)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = -_1546;
    float _1618 = -_1602;
    float _1620 = fma(_1528, _1616, _1618);
    if (_1560)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1622;
    }
    float _1624 = _1606;
    float _1626 = _1624;
    float _1628 = _1598;
    if (_1560)
    {
        float _1630 = fma(_1598, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    if (!_1560)
    {
        _1628 = _1550;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    if (_1560)
    {
        float _1640 = _1614 + (-1.0);
        _1608 = _1640;
    }
    float _1642 = _1608;
    float _1644 = _1642;
    if (_1560)
    {
        float _1646 = _1582 * _1632;
        _1190 = _1646;
    }
    float _1648 = _1190;
    if (!_1560)
    {
        _1634 = _1620;
    }
    float _1650 = _1634;
    float _1652 = sqrt(_1542);
    float _1654 = _1650;
    if (_1560)
    {
        float _1656 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1656;
    }
    float _1658 = _1572;
    float _1660 = _1658;
    if (_1560)
    {
        float _1662 = _1548 * _1648;
        _1574 = _1662;
    }
    float _1664 = _1574;
    if (!_1560)
    {
        _1644 = _1552;
    }
    float _1666 = _1644;
    float _1668 = _1666;
    if (_1560)
    {
        float _1670 = _1550 * _1648;
        _1638 = _1670;
    }
    float _1672 = _1638;
    if (_1560)
    {
        float _1674 = fma(_1620, _1614, _1658);
        _1654 = _1674;
    }
    float _1676 = _1654;
    if (_1560)
    {
        float _1678 = _1664 * _1664;
        _1668 = _1678;
    }
    float _1680 = _1668;
    if (!_1560)
    {
        _1660 = _1554;
    }
    float _1682 = _1660;
    float _1684 = _1682;
    if (_1560)
    {
        float _1686 = _1672 * _1672;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1692 = fma(_1676, _1676, _1680);
    float _1694 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1696 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1690);
    float _1698 = _1692 + _1688;
    float _1700 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1694);
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1704 = fma(_1652, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1702);
    float _1706 = precise::clamp(_1704, 0.0, 1.0);
    float _1708 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1710 = rsqrt(_1698);
    float _1712 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1700);
    float _1714 = -_1706;
    float _1716 = _1714 + 1.0;
    float _1718 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1708);
    float _1722 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1696);
    float _1724 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1726 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1728 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1720);
    float _1730 = abs(_1716);
    float _1732 = log2(_1730);
    float _1734 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1736 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1740 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1748 = _1710 * _1664;
    float _1750 = _1710 * _1676;
    float _1752 = _1710 * _1672;
    float _1754 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1746);
    float _1756 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1758 = -_1740;
    float _1760 = fma(_1758, _1734, 1.0);
    float _1762 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1764 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1754);
    float _1766 = -_1756;
    float _1768 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1766);
    float _1770 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1764);
    float _1774 = -_1752;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1768);
    float _1778 = log2(_1760);
    float _1780 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1782 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1762);
    float _1784 = fma(_1776, -0.5, 0.5);
    float _1786 = fma(_1776, 0.5, 0.5);
    float _1788 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1780);
    float _1790 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1782);
    float _1792 = _1750 + 1.0;
    float _1794 = exp2(_1770);
    float _1796 = fma(_1786, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1798 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1788);
    float _1800 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1790);
    float _1802 = fma(_1786, _1796, -0.212114393711090087890625);
    float _1804 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1806 = 1.0 / _1772;
    float _1808 = _1778 * 0.693147182464599609375;
    float _1810 = fma(_1786, _1802, 1.570728778839111328125);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1814 = sqrt(_1784);
    float _1816 = -_1750;
    float _1818 = fma(_1794, _1792, _1816);
    float _1820 = fma(_1818, 0.5, 0.5);
    float _1822 = _1804 * _1806;
    float _1824 = _1800 * _1806;
    float _1826 = fma(_1822, 0.5, 0.5);
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = _1814 * 0.636619746685028076171875;
    float _1832 = -_1810;
    float _1834 = fma(_1830, _1832, 1.0);
    float3 _4949 = float3(_1826, _1828, _1812);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4949, float3(0.0), isnan(_4949)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4949, float3(0.0), isnan(_4949)), level(0.0)).x;
    float3 _4960 = float3(_1826, _1828, _1812);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4960, float3(0.0), isnan(_4960)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4960, float3(0.0), isnan(_4960)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float2 _4977 = float2(_1834, _1820);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4977, float2(0.0), isnan(_4977)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4977, float2(0.0), isnan(_4977)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = -_950;
    float _1861 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _848);
    float _1863 = -_952;
    float _1865 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1867 = -_954;
    float _1869 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _1871 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1873 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1871);
    float _1875 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1877 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1873);
    float _1879 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1875);
    float _1881 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1883 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan(0.5);
    bool _1891 = _1887 || _1889;
    float _1893 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1895 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1879);
    float _1897 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1899 = exp2(_1881);
    float _1901 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1897);
    float _1905 = _1901 + _1893;
    float _1907 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1903);
    float _1909 = 1.0 / _1893;
    float _1911 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1891)
    {
        _1911 = 1.0;
    }
    float _1913 = _1911;
    float _1915 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1907);
    float _1917 = _1905 * _1909;
    float _1919 = _1917 * 0.5;
    float _1921 = _1913;
    if (!_1891)
    {
        float _1923 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1927 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1925);
        float _1929 = _1923 * 0.15915493667125701904296875;
        float _1931 = _1929 * 6.283185482025146484375;
        float _1933 = cos(_1931);
        float _1935 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1937 = _1935 * 0.15915493667125701904296875;
        float _1939 = _1929 * 6.283185482025146484375;
        float _1941 = sin(_1939);
        float _1943 = 1.0 / _1933;
        float _1945 = _1937 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        float _1949 = _1941 * _1943;
        float _1951 = 1.0 / _1927;
        float _1953 = _1947 * _1949;
        float _1955 = _1937 * 6.283185482025146484375;
        float _1957 = sin(_1955);
        float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1961 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1959;
        float _1963 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1965 = _1951 * _1963;
        float _1967 = 1.0 / _1953;
        float _1969 = 1.0 / _1961;
        float _1971 = _1957 * _1967;
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1975 = fma(_1971, _1965, _1973);
        float _1977 = _1975 * _1969;
        float _1979 = precise::clamp(_1977, 0.0, 1.0);
        _1921 = _1979;
    }
    float _1981 = _1921;
    float _1983 = _1915 + _1772;
    float _1985 = -_1899;
    float _1987 = _1985 + 1.0;
    bool _1989 = _1981 > 0.0;
    bool _1991 = isnan(_1981);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    float _1999 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2001 = _1983 * 0.5;
    float _2003 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2005 = _1999 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2007 = _2003 * _1836;
    float _2009 = -_2003;
    float _2011 = _2009 + 1.0;
    out.gl_Position.x = _1804;
    out.gl_Position.y = _1800;
    out.gl_Position.z = _1915;
    out.gl_Position.w = _1772;
    float _2013 = _1847 * _2007;
    float _2015 = _1857 * _2007;
    out.m_67.z = _2001;
    out.m_67.w = _1772;
    float _2017 = fma(_1853, _2013, _1841);
    float _2019 = fma(_1855, _2013, _1843);
    float _2021 = _1847 * _2011;
    float _2023 = fma(_1847, _2015, _1845);
    out.m_47.x = _2005;
    out.m_69.x = _2017;
    out.m_69.y = _2019;
    out.m_69.z = _2023;
    out.m_69.w = _2021;
    if (_1997)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2025 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2025;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1464 = false;
    bool _816 = false;
    bool _594 = false;
    bool _398 = false;
    bool _284 = false;
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
        float _2082 = as_type<float>(_104);
        out.gl_Position.z = _2082;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2151 = as_type<float>(_140);
        out.gl_Position.z = _2151;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_308;
    float _328 = _326 + 1.0;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = 1.0 / _312;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _338 = _324 * _328;
    float _340 = -_324;
    float _342 = _340 + 1.0;
    float _344 = _296 * _334;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _346;
    float _350 = fma(_332, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = fma(_348, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _358 = fma(_354, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = _350 * _338;
    float _362 = _358 * _338;
    float _364 = _356 * _338;
    float _366 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].x, _360);
    float _368 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].y, _362);
    float _370 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].z, _364);
    float _372 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _374 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].y, _368);
    float _376 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].z, _370);
    bool _378 = !_336;
    float _396;
    if (!_378)
    {
        float _380 = in.m_53.x;
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _384 = _380 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_88);
        float _402 = 1.0 / _400;
        float _404 = _122 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _406 + _408;
    bool _412 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _414 = isnan(_406);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _426 = _406 + _424;
    bool _428 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _430 = isnan(_406);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _448 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _450 = isnan(_406);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -_422;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _446;
    float _466 = _458 * _462;
    float _468 = -_458;
    float _470 = _468 + 1.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _472;
    bool _476 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _478 = 1.0 / _442;
    float _480 = _438 * _470;
    float _482 = -_438;
    float _484 = _482 + 1.0;
    float _486 = _426 * _464;
    float _488 = _410 * _478;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _494;
    float _498 = fma(_474, _488, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _500 = fma(_492, _488, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _502 = fma(_496, _488, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _504 = _498 * _480;
    float _506 = _500 * _480;
    float _508 = _502 * _480;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _522 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].x, _504);
    float _524 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].y, _506);
    float _526 = fma(_512, _486, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _528 = fma(_516, _486, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _530 = fma(_520, _486, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _532 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].z, _508);
    float _534 = fma(_526, _466, _522);
    float _536 = fma(_528, _466, _524);
    float _538 = fma(_530, _466, _532);
    float _540 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[109].x, _534);
    float _542 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[109].y, _536);
    float _544 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[109].z, _538);
    float _546 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _548 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _552 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _554 = _546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = in.m_51.x;
    float _560 = in.m_51.y;
    float _562 = in.m_51.z;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _554;
    out.m_55.y = _556;
    out.m_55.z = _564;
    out.m_55.w = _550;
    float _566 = _376 * _562;
    float _568 = _374 * _560;
    float _570 = _372 * _558;
    bool _572 = !_476;
    float _574 = _566;
    float _592;
    if (!_572)
    {
        float _576 = in.m_53.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_88);
        float _598 = 1.0 / _596;
        float _600 = _122 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _606 = _602 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _610 = _602 + _608;
    bool _612 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _614 = isnan(_602);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _630 = _602 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _640 = 1.0 / _626;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _644 = 1.0 / _634;
    float _646 = 1.0 / _638;
    float _648 = _606 * _640;
    bool _650 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _652 = isnan(_602);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -_622;
    float _664 = _662 + 1.0;
    float _666 = _660 * _664;
    float _668 = _610 * _644;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _674;
    bool _678 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _680 = isnan(_602);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = -_660;
    float _692 = _690 + 1.0;
    float _694 = fma(_672, _668, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = fma(_676, _668, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _702 = _630 * _646;
    bool _704 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _706 = isnan(_602);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _724 = fma(_700, _702, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _726 = fma(_718, _668, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _728 = -_714;
    float _730 = _728 + 1.0;
    float _732 = _714 * _692;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _738 = fma(_722, _702, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _740 = _688 * _730;
    float _742 = -_688;
    float _744 = _742 + 1.0;
    float _746 = fma(_736, _702, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _748 = _694 * _740;
    float _750 = _696 * _740;
    float _752 = _726 * _740;
    float _754 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[123].x, _748);
    float _756 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[123].y, _750);
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[123].z, _752);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _760;
    float _764 = fma(_738, _732, _754);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _770;
    float _774 = fma(_762, _648, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _776 = fma(_746, _732, _756);
    float _778 = fma(_768, _648, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _780 = fma(_772, _648, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _782 = fma(_724, _732, _758);
    float _784 = fma(_774, _666, _764);
    float _786 = fma(_778, _666, _776);
    float _788 = fma(_780, _666, _782);
    float _790 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[126].x, _784);
    float _792 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[126].y, _786);
    float _794 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[126].z, _788);
    bool _796 = !_642;
    float _814;
    if (!_796)
    {
        float _798 = in.m_53.x;
        float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _802 = _798 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _806 = _804 * _800;
        float _808 = floor(_806);
        float _810 = -_808;
        float _812 = _806 + _810;
        _814 = _812;
        _816 = true;
    }
    else
    {
        float _818 = float(_88);
        float _820 = 1.0 / _818;
        float _822 = _122 * _820;
        _814 = _822;
    }
    _816 = false;
    float _824 = _814;
    float _826 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _828 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _830 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _832 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _826);
    float _834 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _828);
    float _836 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _830);
    float _838 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _832);
    float _840 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _834);
    float _842 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _836);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _846 = _844 != 0;
    float _848 = _838 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _850 = _840 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _852 = in.m_53.w;
    float _854 = _842 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _858 = _848 + _856;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _862 = _850 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _866 = _854 + _864;
    float _868 = _858 * _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _876 = _874 != 0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _882 = fma(_862, _862, _868);
    float _884 = 1.0 / _872;
    float _886 = 0.0;
    float _888 = _884;
    if (_846)
    {
        float _890 = in.m_53.x;
        _886 = _890;
    }
    float _892 = _886;
    float _894 = fma(_866, _866, _882);
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _898 = _896 != 0;
    float _900 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = in.m_57.y;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _906 = _904 != 0;
    float _908 = rsqrt(_894);
    float _910 = in.m_57.x;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _914 = _912 != 0;
    float _916 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _918 = _852 > 0.5;
    float _920 = 0.0;
    bool _922 = _918;
    float _924 = _902;
    if (_876)
    {
        float _926 = in.m_53.z;
        _920 = _926;
    }
    float _928 = _920;
    bool _930 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _932 = isnan(_824);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = 1.0 / _880;
    float _944 = in.m_59.x;
    float _946 = in.m_59.y;
    float _948 = in.m_59.z;
    float _950 = _858 * _908;
    float _952 = _862 * _908;
    float _954 = _866 * _908;
    bool _956 = false;
    if (_846)
    {
        bool _958 = _892 > 0.5;
        _956 = _958;
    }
    bool _960 = _956;
    float _962 = -_950;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    float _966 = -_952;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _970 = -_954;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _976 = _824 + _974;
    float _978 = _964 * _964;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _988 = fma(_968, _968, _978);
    float _990 = fma(_972, _972, _988);
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _944);
    float _996 = sqrt(_990);
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _948);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _824 + _1008;
    float _1012 = _1002 * _884;
    float _1014 = _1006 * _942;
    float _1016 = _1002;
    if (!_898)
    {
        float _1018 = in.m_53.y;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = 1.0 / _982;
    float _1024 = fma(_1012, _1010, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1026 = fma(_1014, _976, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1028 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = _1028;
    if (!_846)
    {
        _888 = _910;
    }
    float _1032 = _888;
    float _1034 = _908 * _996;
    float _1036 = _1032;
    if (!_846)
    {
        _574 = _1032;
    }
    float _1038 = _574;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1046 = _824 + _1044;
    float _1048 = _900 * _1034;
    float _1050 = _916 * _1034;
    float _1052 = _1028 * _1034;
    float _1054 = _1038;
    if (_846)
    {
        _1036 = _910;
    }
    float _1056 = _1036;
    float _1058 = _1048 * _992;
    float _1060 = _1042 * _1022;
    float _1062 = -_902;
    float _1064 = _1062 + 1.0;
    bool _1066 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1068 = isnan(_824);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _1050 * _994;
    float _1080 = fma(_1060, _1046, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1082 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1084 = isnan(_824);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1096 = _918 ? as_type<int>(_1064) : as_type<int>(_902);
    float _1098 = -_1076;
    float _1100 = _1098 + 1.0;
    float _1102 = _1056;
    if (!_898)
    {
        _1030 = _1020;
    }
    float _1104 = _1030;
    float _1106 = _1052 * _998;
    if (_876)
    {
        bool _1108 = _928 > 0.5;
        _922 = _1108;
    }
    bool _1110 = _922;
    float _1112 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1114 = _1092 * _1100;
    float _1116 = _910;
    if (!_898)
    {
        float _1118 = in.m_53.z;
        _1116 = _1118;
    }
    float _1120 = _1116;
    float _1122 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1094);
    float _1124 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1112);
    bool _1126 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1128 = isnan(_824);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = _1104;
    float _1140 = _1020;
    if (_898)
    {
        float _1142 = in.m_53.x;
        float _1144 = in.m_53.y;
        _1138 = _1142;
        _1140 = _1144;
    }
    float _1146 = _1138;
    float _1148 = _1140;
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1122);
    float _1152 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1124);
    float _1154 = -_1092;
    float _1156 = _1154 + 1.0;
    float _1158 = _906 ? as_type<float>(_1096) : _902;
    float _1160 = _984 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1162 = _850 + _1150;
    float _1164 = _854 + _1152;
    float _1166 = _1136 * _1156;
    float _1168 = -_1136;
    float _1170 = _1168 + 1.0;
    float _1172 = fma(_1160, _1158, -0.5);
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1176 = _1162 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1180 = _1164 + _1178;
    float _1182 = _940 * _1170;
    int _1184 = as_type<int>(_1152);
    float _1186 = _1162;
    float _1188 = _1164;
    float _1190 = _1176;
    if (_846)
    {
        float _1192 = -_1056;
        float _1194 = _1192 + 1.0;
        _1184 = as_type<int>(_1194);
    }
    int _1196 = _1184;
    float _1198 = _1176 * _1176;
    float _1200 = _1180 * _1180;
    float _1202 = _1026 * _1182;
    int _1204 = 0;
    float _1206 = _1198;
    float _1208 = _1200;
    if (_876)
    {
        float _1210 = -_1056;
        float _1212 = _1210 + 1.0;
        _1204 = as_type<int>(_1212);
    }
    int _1214 = _1204;
    if (_846)
    {
        float _1216 = _960 ? as_type<float>(_1196) : _1056;
        _1054 = _1216;
    }
    float _1218 = _1054;
    float _1220 = _1198 + _1200;
    float _1222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1224 = 0.0;
    float _1226 = _1120;
    if (!_898)
    {
        _1224 = _1120;
    }
    float _1228 = _1224;
    float _1230 = -_940;
    float _1232 = _1230 + 1.0;
    float _1234 = _1228;
    if (_898)
    {
        _1234 = _1148;
    }
    float _1236 = _1234;
    if (_898)
    {
        _1226 = _1148;
    }
    float _1238 = _1226;
    float _1240 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1202);
    bool _1242 = _1148 > 0.5;
    float _1244 = sqrt(_1220);
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[83].w, _986);
    if (_876)
    {
        float _1250 = _1110 ? as_type<float>(_1214) : _1056;
        _1102 = _1250;
    }
    float _1252 = _1102;
    float _1254 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1246);
    float _1256 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1260 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_914)
    {
        float _1262 = _1242 ? _1064 : _902;
        _924 = _1262;
    }
    float _1264 = _924;
    float _1266 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1268 = -_1258;
    float _1270 = fma(_1256, 2.0, _1268);
    float _1272 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1274 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1260);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1278 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1280 = fma(_1272, _1252, -0.5);
    float _1282 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1274);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1286 = -_122;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1270);
    float _1290 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1248);
    float _1292 = _848 + _1282;
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1296 = fma(_1266, -2.0, _1284);
    float _1298 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1254);
    float _1300 = fma(_1024, _1166, _1240);
    float _1302 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1296);
    float _1304 = _1282;
    if (!_1278)
    {
        _1304 = _1292;
    }
    float _1306 = _1304;
    bool _1308 = !_1278;
    float _1310 = _1306;
    if (!_1308)
    {
        float _1312 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1316 = _1244 + _1314;
        float _1318 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1320 = rsqrt(_1220);
        float _1322 = _1316 * _1312;
        float _1324 = _1322 * 0.15915493667125701904296875;
        float _1326 = _1324 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = _1324 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        float _1334 = fma(_1328, _1318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1336 = _1320 * _1334;
        float _1338 = fma(_1176, _1336, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1340 = _1332 + (-1.0);
        float _1342 = fma(_1180, _1336, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1346 = _1338 + _1344;
        float _1348 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1352 = _1342 + _1350;
        float _1354 = _1346 * _1346;
        float _1356 = fma(_1292, _1332, _1348);
        float _1358 = _1352 * _1352;
        _1310 = _1356;
        _1206 = _1354;
        _1208 = _1358;
        _1186 = _1338;
        _1188 = _1342;
    }
    float _1360 = _1310;
    float _1362 = _1206;
    float _1364 = _1208;
    float _1366 = _1186;
    float _1368 = _1188;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1372 = _1360 + _1370;
    float _1374 = fma(_1080, _1114, _1300);
    float _1376 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1378 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = fma(_1372, _1372, _1362);
    float _1382 = fma(_1298, _1280, _1288);
    float _1384 = -_1302;
    float _1386 = fma(_1290, _1172, _1384);
    float _1388 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1374);
    float _1390 = _1380 + _1364;
    float _1392 = _790 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1394 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1396 = _794 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1398 = _1376 * _1276;
    float _1400 = _1378 * _1294;
    float _1402 = sqrt(_1390);
    float _1404 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1382 + 0.5;
    float _1412 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1414 = _1386 + 0.5;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    out.m_63.x = _1404;
    out.m_63.y = _1406;
    out.m_63.z = _1408;
    out.m_63.w = _1412;
    bool _1416 = _1402 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1418 = isnan(_1402);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1424 = _1420 || _1422;
    out.m_65.x = _1398;
    out.m_65.y = _1400;
    out.m_65.z = _1410;
    out.m_65.w = _1414;
    float _1426 = _1392;
    float _1428 = _1406;
    if (!_1424)
    {
        _1426 = 1.0;
    }
    float _1430 = _1426;
    bool _1432 = !_1424;
    float _1434 = _1430;
    if (!_1432)
    {
        bool _1436 = _1402 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1438 = isnan(_1402);
        bool _1440 = _1436 || _1438;
        bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1444 = _1440 || _1442;
        if (!_1444)
        {
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = _1402 + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1452 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1450;
            float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1458 = 1.0 / _1452;
            float _1460 = _1448 * _1458;
            float _1462 = fma(_1460, _1456, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1434 = _1462;
            _1464 = true;
        }
        else
        {
            bool _1466 = _1402 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1468 = isnan(_1402);
            bool _1470 = _1466 || _1468;
            bool _1472 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1474 = _1470 || _1472;
            if (!_1474)
            {
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1402 + _1476;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1486 = _1484 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1488 = 1.0 / _1482;
                float _1490 = _1478 * _1488;
                float _1492 = fma(_1490, _1486, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1434 = _1492;
                _1464 = true;
            }
            else
            {
                _1434 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1464 = false;
    float _1494 = _1434;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1498 = _1360 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1502 = _1366 + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1506 = _1368 + _1504;
    float _1508 = fma(_1498, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1510 = fma(_1502, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1512 = fma(_1506, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1514 = -_950;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1508);
    float _1518 = -_952;
    float _1520 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1510);
    float _1522 = -_954;
    float _1524 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1512);
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1528 = _1516 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1532 = _1520 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1536 = _1524 + _1534;
    float _1538 = _1528 * _1528;
    float _1540 = fma(_1532, _1532, _1538);
    float _1542 = fma(_1536, _1536, _1540);
    float _1544 = rsqrt(_1542);
    float _1546 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1532 * _1546;
    float _1550 = _1536 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 + _1554;
    float _1558 = sqrt(_1556);
    bool _1560 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = _1558 + _1562;
    float _1566 = _1544;
    float _1568 = _1556;
    float _1570 = _1564;
    float _1572 = _1528;
    float _1574 = _1548;
    if (_1560)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1576;
    }
    float _1578 = _1566;
    if (_1560)
    {
        float _1580 = rsqrt(_1556);
        _1568 = _1580;
    }
    float _1582 = _1568;
    if (_1560)
    {
        float _1584 = _1564 * _1578;
        _1570 = _1584;
    }
    float _1586 = _1570;
    if (_1560)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _1428 = _1588;
    }
    float _1590 = _1428;
    float _1592 = _1536;
    if (_1560)
    {
        float _1594 = _1590 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1494;
    float _1606 = _1602;
    float _1608 = _1600;
    if (_1560)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = -_1546;
    float _1618 = -_1602;
    float _1620 = fma(_1528, _1616, _1618);
    if (_1560)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1622;
    }
    float _1624 = _1606;
    float _1626 = _1624;
    float _1628 = _1598;
    if (_1560)
    {
        float _1630 = fma(_1598, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    if (!_1560)
    {
        _1628 = _1550;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    if (_1560)
    {
        float _1640 = _1614 + (-1.0);
        _1608 = _1640;
    }
    float _1642 = _1608;
    float _1644 = _1642;
    if (_1560)
    {
        float _1646 = _1582 * _1632;
        _1190 = _1646;
    }
    float _1648 = _1190;
    if (!_1560)
    {
        _1634 = _1620;
    }
    float _1650 = _1634;
    float _1652 = sqrt(_1542);
    float _1654 = _1650;
    if (_1560)
    {
        float _1656 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1656;
    }
    float _1658 = _1572;
    float _1660 = _1658;
    if (_1560)
    {
        float _1662 = _1548 * _1648;
        _1574 = _1662;
    }
    float _1664 = _1574;
    if (!_1560)
    {
        _1644 = _1552;
    }
    float _1666 = _1644;
    float _1668 = _1666;
    if (_1560)
    {
        float _1670 = _1550 * _1648;
        _1638 = _1670;
    }
    float _1672 = _1638;
    if (_1560)
    {
        float _1674 = fma(_1620, _1614, _1658);
        _1654 = _1674;
    }
    float _1676 = _1654;
    if (_1560)
    {
        float _1678 = _1664 * _1664;
        _1668 = _1678;
    }
    float _1680 = _1668;
    if (!_1560)
    {
        _1660 = _1554;
    }
    float _1682 = _1660;
    float _1684 = _1682;
    if (_1560)
    {
        float _1686 = _1672 * _1672;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1692 = fma(_1676, _1676, _1680);
    float _1694 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1696 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1690);
    float _1698 = _1692 + _1688;
    float _1700 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1694);
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1704 = fma(_1652, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1702);
    float _1706 = precise::clamp(_1704, 0.0, 1.0);
    float _1708 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1710 = rsqrt(_1698);
    float _1712 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1700);
    float _1714 = -_1706;
    float _1716 = _1714 + 1.0;
    float _1718 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1708);
    float _1722 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1696);
    float _1724 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1726 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1728 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1720);
    float _1730 = abs(_1716);
    float _1732 = log2(_1730);
    float _1734 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1736 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1740 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1748 = _1710 * _1664;
    float _1750 = _1710 * _1676;
    float _1752 = _1710 * _1672;
    float _1754 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1746);
    float _1756 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1758 = -_1740;
    float _1760 = fma(_1758, _1734, 1.0);
    float _1762 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1764 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1754);
    float _1766 = -_1756;
    float _1768 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1766);
    float _1770 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1764);
    float _1774 = -_1752;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1768);
    float _1778 = log2(_1760);
    float _1780 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1782 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1762);
    float _1784 = fma(_1776, -0.5, 0.5);
    float _1786 = fma(_1776, 0.5, 0.5);
    float _1788 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1780);
    float _1790 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1782);
    float _1792 = _1750 + 1.0;
    float _1794 = exp2(_1770);
    float _1796 = fma(_1786, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1798 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1788);
    float _1800 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1790);
    float _1802 = fma(_1786, _1796, -0.212114393711090087890625);
    float _1804 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1806 = 1.0 / _1772;
    float _1808 = _1778 * 0.693147182464599609375;
    float _1810 = fma(_1786, _1802, 1.570728778839111328125);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1814 = sqrt(_1784);
    float _1816 = -_1750;
    float _1818 = fma(_1794, _1792, _1816);
    float _1820 = fma(_1818, 0.5, 0.5);
    float _1822 = _1804 * _1806;
    float _1824 = _1800 * _1806;
    float _1826 = fma(_1822, 0.5, 0.5);
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = _1814 * 0.636619746685028076171875;
    float _1832 = -_1810;
    float _1834 = fma(_1830, _1832, 1.0);
    float3 _4949 = float3(_1826, _1828, _1812);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4949, float3(0.0), isnan(_4949)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4949, float3(0.0), isnan(_4949)), level(0.0)).x;
    float3 _4960 = float3(_1826, _1828, _1812);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4960, float3(0.0), isnan(_4960)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4960, float3(0.0), isnan(_4960)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float2 _4977 = float2(_1834, _1820);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4977, float2(0.0), isnan(_4977)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4977, float2(0.0), isnan(_4977)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = -_950;
    float _1861 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _848);
    float _1863 = -_952;
    float _1865 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1867 = -_954;
    float _1869 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _1871 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1873 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1871);
    float _1875 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1877 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1873);
    float _1879 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1875);
    float _1881 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1883 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan(0.5);
    bool _1891 = _1887 || _1889;
    float _1893 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1895 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1879);
    float _1897 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1899 = exp2(_1881);
    float _1901 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1897);
    float _1905 = _1901 + _1893;
    float _1907 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1903);
    float _1909 = 1.0 / _1893;
    float _1911 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1891)
    {
        _1911 = 1.0;
    }
    float _1913 = _1911;
    float _1915 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1907);
    float _1917 = _1905 * _1909;
    float _1919 = _1917 * 0.5;
    float _1921 = _1913;
    if (!_1891)
    {
        float _1923 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1927 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1925);
        float _1929 = _1923 * 0.15915493667125701904296875;
        float _1931 = _1929 * 6.283185482025146484375;
        float _1933 = cos(_1931);
        float _1935 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1937 = _1935 * 0.15915493667125701904296875;
        float _1939 = _1929 * 6.283185482025146484375;
        float _1941 = sin(_1939);
        float _1943 = 1.0 / _1933;
        float _1945 = _1937 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        float _1949 = _1941 * _1943;
        float _1951 = 1.0 / _1927;
        float _1953 = _1947 * _1949;
        float _1955 = _1937 * 6.283185482025146484375;
        float _1957 = sin(_1955);
        float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1961 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1959;
        float _1963 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1965 = _1951 * _1963;
        float _1967 = 1.0 / _1953;
        float _1969 = 1.0 / _1961;
        float _1971 = _1957 * _1967;
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1975 = fma(_1971, _1965, _1973);
        float _1977 = _1975 * _1969;
        float _1979 = precise::clamp(_1977, 0.0, 1.0);
        _1921 = _1979;
    }
    float _1981 = _1921;
    float _1983 = _1915 + _1772;
    float _1985 = -_1899;
    float _1987 = _1985 + 1.0;
    bool _1989 = _1981 > 0.0;
    bool _1991 = isnan(_1981);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    float _1999 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2001 = _1983 * 0.5;
    float _2003 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2005 = _1999 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2007 = _2003 * _1836;
    float _2009 = -_2003;
    float _2011 = _2009 + 1.0;
    out.gl_Position.x = _1804;
    out.gl_Position.y = _1800;
    out.gl_Position.z = _1915;
    out.gl_Position.w = _1772;
    float _2013 = _1847 * _2007;
    float _2015 = _1857 * _2007;
    out.m_67.z = _2001;
    out.m_67.w = _1772;
    float _2017 = fma(_1853, _2013, _1841);
    float _2019 = fma(_1855, _2013, _1843);
    float _2021 = _1847 * _2011;
    float _2023 = fma(_1847, _2015, _1845);
    out.m_47.x = _2005;
    out.m_69.x = _2017;
    out.m_69.y = _2019;
    out.m_69.z = _2023;
    out.m_69.w = _2021;
    if (_1997)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2025 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2025;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

