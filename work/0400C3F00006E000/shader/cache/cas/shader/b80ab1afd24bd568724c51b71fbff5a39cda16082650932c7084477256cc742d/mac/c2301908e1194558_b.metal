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
    float4 m_61 [[user(locn0)]];
    float4 m_65 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _742 = false;
    bool _506 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1716 = as_type<float>(_104);
        out.gl_Position.z = _1716;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _1785 = as_type<float>(_140);
        out.gl_Position.z = _1785;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
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
        float _266 = in.m_51.x;
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
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _292 + _298;
    bool _302 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_292);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _320 = _292 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = 1.0 / _316;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _334 = 1.0 / _328;
    float _336 = 1.0 / _324;
    float _338 = _296 * _330;
    bool _340 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_292);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_312;
    float _354 = _352 + 1.0;
    float _356 = _350 * _354;
    float _358 = _300 * _334;
    bool _360 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _362 = isnan(_292);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _372;
    bool _376 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_292);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _392 = -_350;
    float _394 = _392 + 1.0;
    float _396 = -_370;
    float _398 = _396 + 1.0;
    float _400 = _320 * _336;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = _386 * _398;
    float _412 = fma(_374, _400, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _414 = fma(_404, _400, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = fma(_408, _400, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = _370 * _394;
    float _420 = -_386;
    float _422 = _420 + 1.0;
    float _424 = _414 * _410;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = _416 * _410;
    float _436 = _412 * _410;
    float _438 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].x, _424);
    float _440 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _444 = fma(_390, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = fma(_428, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _448 = fma(_432, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_444, _418, _438);
    float _464 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_456, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_460, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = fma(_446, _418, _440);
    float _472 = fma(_448, _418, _442);
    float _474 = fma(_464, _356, _462);
    float _476 = fma(_466, _356, _470);
    float _478 = fma(_468, _356, _472);
    float _480 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].x, _474);
    float _482 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].y, _476);
    float _484 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].z, _478);
    bool _486 = !_332;
    float _504;
    if (!_486)
    {
        float _488 = in.m_51.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        float _508 = float(_88);
        float _510 = 1.0 / _508;
        float _512 = _122 * _510;
        _504 = _512;
    }
    _506 = false;
    float _514 = _504;
    float _516 = in.m_49.x;
    float _518 = in.m_49.y;
    float _520 = in.m_49.z;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _514 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _528 = _514 + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _538;
    bool _542 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _544 = isnan(_514);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = 1.0 / _532;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _558 = 1.0 / _536;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _560;
    float _564 = 1.0 / _540;
    float _566 = _484 * _520;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _570 = _514 + _568;
    float _572 = _482 * _518;
    float _574 = _480 * _516;
    float _576 = _570 * _554;
    float _578 = _524 * _558;
    bool _580 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _582 = isnan(_514);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _592;
    bool _596 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _598 = isnan(_514);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _608;
    float _612 = fma(_562, _576, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _614 = fma(_594, _576, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _616 = _528 * _564;
    float _618 = -_552;
    float _620 = _618 + 1.0;
    float _622 = -_606;
    float _624 = _622 + 1.0;
    float _626 = fma(_610, _576, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _628 = _590 * _620;
    bool _630 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _632 = isnan(_514);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _646 = -_590;
    float _648 = _646 + 1.0;
    float _650 = _640 * _624;
    float _652 = _606 * _648;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _658 = -_640;
    float _660 = _658 + 1.0;
    float _662 = _626 * _650;
    float _664 = _614 * _650;
    float _666 = _612 * _650;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _672 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].x, _662);
    float _674 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].y, _664);
    float _676 = fma(_644, _578, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _678 = fma(_670, _578, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _680 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].z, _666);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _686;
    float _690 = fma(_656, _578, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _692;
    float _696 = fma(_676, _652, _672);
    float _698 = fma(_684, _616, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _700 = fma(_688, _616, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _702 = fma(_678, _652, _674);
    float _704 = fma(_694, _616, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _706 = fma(_690, _652, _680);
    float _708 = fma(_698, _628, _696);
    float _710 = fma(_700, _628, _702);
    float _712 = fma(_704, _628, _706);
    float _714 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].x, _708);
    float _716 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].y, _710);
    float _718 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].z, _712);
    bool _720 = !_556;
    float _722 = _708;
    float _740;
    if (!_720)
    {
        float _724 = in.m_51.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_88);
        float _746 = 1.0 / _744;
        float _748 = _122 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = in.m_53.x;
    float _754 = in.m_53.y;
    float _756 = in.m_53.z;
    float _758 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _762 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _764 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _766 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _768 = isnan(0.5);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _774 = _770 || _772;
    float _776 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _762);
    float _778 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _776);
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _754);
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _752);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _756);
    float _786 = _780 * _758;
    float _788 = _782 * _760;
    float _790 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = _784 * _764;
    float _794 = _786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _796 = _786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _798 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    float _800 = _778 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _802 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].x, _794);
    float _804 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].x, _796);
    float _806 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    float _808 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _810 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[10].z, _802);
    float _812 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[8].z, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _816 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _808);
    float _818 = _800 + _810;
    float _820 = _786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _822 = _814 + _812;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _826 = _818 + _824;
    float _828 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].x, _820);
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _832 = _822 + _830;
    float _834 = _826 * _826;
    float _836 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[9].z, _828);
    float _838 = fma(_832, _832, _834);
    float _840 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _816);
    float _842 = sqrt(_838);
    float _844 = _840 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _846 = _844 + _836;
    bool _848 = _842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _836;
    float _852 = _828;
    float _854 = _822;
    float _856 = _818;
    float _858 = _826;
    if (!_848)
    {
        _850 = _818;
    }
    float _860 = _850;
    float _862 = _860;
    if (!_848)
    {
        _722 = _846;
    }
    float _864 = _722;
    bool _866 = !_848;
    float _868 = _864;
    if (!_866)
    {
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _874 = _842 + _872;
        float _876 = _846 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _878 = rsqrt(_838);
        float _880 = _874 * _870;
        float _882 = _880 * 0.15915493667125701904296875;
        float _884 = _882 * 6.283185482025146484375;
        float _886 = cos(_884);
        float _888 = _882 * 6.283185482025146484375;
        float _890 = sin(_888);
        float _892 = _886 + (-1.0);
        float _894 = fma(_890, _876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _896 = _892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = _878 * _894;
        float _900 = fma(_846, _886, _896);
        float _902 = fma(_832, _898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _904 = fma(_826, _898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _852 = _882;
        _854 = _902;
        _868 = _900;
        _862 = _904;
    }
    float _906 = _852;
    float _908 = _854;
    float _910 = _868;
    float _912 = _862;
    float _914 = _910;
    float _916 = _908;
    float _918 = _912;
    float _920 = _906;
    if (!_774)
    {
        float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _924 = _844 + _922;
        float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _928 = _814 + _926;
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _932 = -_814;
        float _934 = _932 + _908;
        float _936 = _924 * _924;
        float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _940 = _800 + _938;
        float _942 = -_844;
        float _944 = _942 + _910;
        float _946 = fma(_928, _928, _936);
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _950 = fma(_940, _940, _946);
        float _952 = sqrt(_950);
        float _954 = _930 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _956 = precise::min(_952, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _958 = _956 * _948;
        float _960 = _954 * _958;
        float _962 = -_800;
        float _964 = _962 + _912;
        float _966 = fma(_934, _960, _814);
        float _968 = fma(_944, _960, _844);
        float _970 = fma(_964, _960, _800);
        _914 = _968;
        _916 = _966;
        _918 = _970;
        _920 = _930;
    }
    float _972 = _914;
    float _974 = _916;
    float _976 = _918;
    float _978 = _920;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _982 = _972 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _986 = _974 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _976 + _988;
    float _992 = _982 * _982;
    float _994 = fma(_986, _986, _992);
    float _996 = fma(_990, _990, _994);
    float _998 = rsqrt(_996);
    float _1000 = sqrt(_996);
    float _1002 = _998 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1004 = _986 * _1002;
    float _1006 = _990 * _1002;
    float _1008 = _1004 * _1004;
    float _1010 = _1006 * _1006;
    float _1012 = _1008 + _1010;
    float _1014 = sqrt(_1012);
    bool _1016 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _1014 + _1018;
    float _1022 = _846;
    float _1024 = _1020;
    if (_1016)
    {
        float _1026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1026;
    }
    float _1028 = _1022;
    if (_1016)
    {
        float _1030 = rsqrt(_1012);
        _856 = _1030;
    }
    float _1032 = _856;
    float _1034 = _1032;
    if (_1016)
    {
        float _1036 = _1020 * _1028;
        _1024 = _1036;
    }
    float _1038 = _1024;
    if (_1016)
    {
        float _1040 = _1038 * 0.15915493667125701904296875;
        _858 = _1040;
    }
    float _1042 = _858;
    float _1044 = _978;
    if (_1016)
    {
        float _1046 = _1042 * 6.283185482025146484375;
        float _1048 = sin(_1046);
        _1044 = _1048;
    }
    float _1050 = _1044;
    float _1052 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1054 = precise::max(0.0, _1052);
    float _1056 = _832;
    float _1058 = _1054;
    float _1060 = _1052;
    if (_1016)
    {
        float _1062 = _1042 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        _1056 = _1064;
    }
    float _1066 = _1056;
    float _1068 = -_1002;
    float _1070 = -_1054;
    float _1072 = fma(_982, _1068, _1070);
    if (_1016)
    {
        float _1074 = _1072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1058 = _1074;
    }
    float _1076 = _1058;
    float _1078 = _972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1080 = _1076;
    float _1082 = _1050;
    if (_1016)
    {
        float _1084 = fma(_1050, _1076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1080 = _1084;
    }
    float _1086 = _1080;
    float _1088 = _1086;
    if (!_1016)
    {
        _1082 = _1004;
    }
    float _1090 = _1082;
    float _1092 = _1090;
    float _1094 = _1066;
    if (_1016)
    {
        float _1096 = _1066 + (-1.0);
        _1060 = _1096;
    }
    float _1098 = _1060;
    float _1100 = 0.0;
    float _1102 = _1098;
    if (_1016)
    {
        float _1104 = _1032 * _1086;
        _1100 = _1104;
    }
    float _1106 = _1100;
    if (!_1016)
    {
        _1088 = _1072;
    }
    float _1108 = _1088;
    float _1110 = _1108;
    if (_1016)
    {
        float _1112 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1112;
    }
    float _1114 = _1034;
    float _1116 = _1114;
    if (_1016)
    {
        float _1118 = _1004 * _1106;
        _1092 = _1118;
    }
    float _1120 = _1092;
    if (!_1016)
    {
        _1102 = _1006;
    }
    float _1122 = _1102;
    float _1124 = _1122;
    if (_1016)
    {
        float _1126 = _1006 * _1106;
        _1124 = _1126;
    }
    float _1128 = _1124;
    if (_1016)
    {
        float _1130 = fma(_1072, _1066, _1114);
        _1110 = _1130;
    }
    float _1132 = _1110;
    if (!_1016)
    {
        _1116 = _1008;
    }
    float _1134 = _1116;
    float _1136 = _1134;
    if (_1016)
    {
        float _1138 = _1120 * _1120;
        _1136 = _1138;
    }
    float _1140 = _1136;
    float _1142 = _972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1016)
    {
        _1094 = _1010;
    }
    float _1146 = _1094;
    float _1148 = _972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = _1146;
    if (_1016)
    {
        float _1152 = _1128 * _1128;
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = fma(_1132, _1132, _1140);
    float _1158 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1078);
    float _1160 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1162 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1144);
    float _1164 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1166 = _1156 + _1154;
    float _1168 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1160);
    float _1170 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1172 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1162);
    float _1174 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1158);
    float _1176 = rsqrt(_1166);
    float _1178 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1182 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1180);
    float _1184 = precise::clamp(_1182, 0.0, 1.0);
    float _1186 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1188 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1192 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1164);
    float _1194 = -_1184;
    float _1196 = _1194 + 1.0;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1190);
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1204 = -_1198;
    float _1206 = fma(_1204, _1170, 1.0);
    float _1208 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1200);
    float _1210 = abs(_1196);
    float _1212 = log2(_1210);
    float _1214 = _1176 * _1120;
    float _1216 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1208);
    float _1218 = _1176 * _1132;
    float _1220 = _1176 * _1128;
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1224 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1226 = log2(_1206);
    float _1228 = _1218 + 1.0;
    float _1230 = -_1222;
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1230);
    float _1234 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1224);
    float _1236 = -_1220;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1232);
    float _1240 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1242 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1244 = 1.0 / _1216;
    float _1246 = fma(_1238, -0.5, 0.5);
    float _1248 = fma(_1238, 0.5, 0.5);
    float _1250 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1240);
    float _1252 = fma(_1248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1254 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1250);
    float _1256 = sqrt(_1246);
    float _1258 = fma(_1248, _1252, -0.212114393711090087890625);
    float _1260 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1254);
    float _1262 = fma(_1248, _1258, 1.570728778839111328125);
    float _1264 = exp2(_1242);
    float _1266 = _1256 * 0.636619746685028076171875;
    float _1268 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1234);
    float _1270 = _1226 * 0.693147182464599609375;
    float _1272 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1268);
    float _1274 = _1260 * _1244;
    float _1276 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1278 = -_1218;
    float _1280 = fma(_1264, _1228, _1278);
    float _1282 = _1272 * _1244;
    float _1284 = -_1262;
    float _1286 = fma(_1266, _1284, 1.0);
    float _1288 = fma(_1274, 0.5, 0.5);
    float _1290 = fma(_1280, 0.5, 0.5);
    float _1292 = fma(_1282, -0.5, 0.5);
    float3 _3665 = float3(_1288, _1292, _1276);
    float _1294 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3665, float3(0.0), isnan(_3665)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3665, float3(0.0), isnan(_3665)), level(0.0)).x;
    float3 _3676 = float3(_1288, _1292, _1276);
    float4 _1297 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3676, float3(0.0), isnan(_3676)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3676, float3(0.0), isnan(_3676)), level(0.0)).xyzw;
    float _1299 = _1297.x;
    float _1301 = _1297.y;
    float _1303 = _1297.z;
    float _1305 = _1297.w;
    float2 _3693 = float2(_1286, _1290);
    float3 _1309 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3693, float2(0.0), isnan(_3693)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3693, float2(0.0), isnan(_3693)), level(0.0)).xyz;
    float _1311 = _1309.x;
    float _1313 = _1309.y;
    float _1315 = _1309.z;
    float _1317 = in.m_55.x;
    float _1319 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1321 = in.m_55.z;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1325 = _1323 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1331 = _754 != 0.0;
    bool _1333 = isnan(_754);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.0);
    bool _1339 = _1335 || _1337;
    float _1341 = in.m_55.y;
    bool _1343 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1345 = isnan(_750);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1351);
    float _1355 = 1.0 / _1329;
    bool _1357 = _752 == 0.0;
    bool _1359 = !_1339;
    bool _1361 = _1357 && _1359;
    float _1363 = in.m_57.x;
    float _1365 = in.m_57.y;
    float _1367 = in.m_57.z;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1377 = _756 == 0.0;
    bool _1379 = _1377 && _1361;
    float _1381 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1383 = 1.0 / _1325;
    bool _1385 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1387 = isnan(_750);
    bool _1389 = _1385 || _1387;
    bool _1391 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1393 = _1389 || _1391;
    float _1395 = float(_1393);
    float _1397 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1381);
    out.m_59.x = _1317;
    float _1399 = _1371 * _1355;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1403 = _750 + _1401;
    out.m_59.z = _1321;
    float _1405 = exp2(_1319);
    bool _1407 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1409 = isnan(_750);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1415 = _1411 || _1413;
    float _1417 = float(_1415);
    out.m_59.y = _1341;
    float _1419 = _1375 * _1383;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1423 = _750 + _1421;
    float _1425 = -_1353;
    float _1427 = _1425 + 1.0;
    float _1429 = in.m_55.w;
    float _1431 = _1365;
    float _1433 = _1363;
    float _1435 = _1367;
    if (!_1379)
    {
        float _1437 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1365);
        _1431 = _1437;
    }
    float _1439 = _1431;
    float _1441 = fma(_1399, _1423, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1443 = _1417 * _1427;
    float _1445 = -_1395;
    float _1447 = _1445 + 1.0;
    float _1449 = -_1417;
    float _1451 = _1449 + 1.0;
    float _1453 = fma(_1419, _1403, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1455 = _1441 * _1443;
    float _1457 = _1353 * _1447;
    if (!_1379)
    {
        float _1459 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1363);
        _1433 = _1459;
    }
    float _1461 = _1433;
    float _1463 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1465 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1455);
    float _1467 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1469 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_1379)
    {
        float _1471 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1367);
        _1435 = _1471;
    }
    float _1473 = _1435;
    float _1475 = fma(_1453, _1457, _1465);
    float _1477 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1463);
    float _1479 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1467);
    float _1481 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1469);
    float _1483 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1475);
    float _1485 = _844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1487 = fma(_1473, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1477);
    float _1489 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1491 = _716 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1493 = _718 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1495 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1485);
    float _1497 = _844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1505 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1507 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1495);
    out.m_59.w = _1429;
    float _1509 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1497);
    bool _1511 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1519 = _1515 || _1517;
    float _1521 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_61.x = _1499;
    out.m_61.y = _1501;
    out.m_61.z = _1503;
    out.m_61.w = _1505;
    float _1523 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1509);
    float _1525 = fma(_1473, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1479);
    float _1527 = 1.0 / _1521;
    float _1529 = fma(_1473, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1481);
    float _1531 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1397);
    float _1535 = _1531 + _1521;
    out.m_63.x = _1487;
    out.m_63.y = _1525;
    out.m_63.z = _1529;
    float _1537 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1533);
    float _1539 = _1535 * _1527;
    float _1541 = _1539 * 0.5;
    float _1543 = _1487;
    if (_1519)
    {
        _1543 = 1.0;
    }
    float _1545 = _1543;
    float _1547 = _1545;
    if (!_1519)
    {
        float _1549 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1551 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1553 = _1549 * 0.15915493667125701904296875;
        float _1555 = _1551 * 0.15915493667125701904296875;
        float _1557 = _1553 * 6.283185482025146484375;
        float _1559 = cos(_1557);
        float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1563 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1561);
        float _1565 = _1553 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        float _1569 = 1.0 / _1559;
        float _1571 = _1555 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = _1567 * _1569;
        float _1577 = _1555 * 6.283185482025146484375;
        float _1579 = sin(_1577);
        float _1581 = _1573 * _1575;
        float _1583 = 1.0 / _1563;
        float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1587 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1585;
        float _1589 = 1.0 / _1581;
        float _1591 = 1.0 / _1587;
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1595 = _1583 * _1593;
        float _1597 = _1579 * _1589;
        float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1601 = fma(_1597, _1595, _1599);
        float _1603 = _1601 * _1591;
        float _1605 = precise::clamp(_1603, 0.0, 1.0);
        _1547 = _1605;
    }
    float _1607 = _1547;
    float _1609 = _1216 * 0.5;
    float _1611 = -_1405;
    float _1613 = _1611 + 1.0;
    bool _1615 = _1607 > 0.0;
    bool _1617 = isnan(_1607);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan(0.0);
    bool _1623 = _1619 || _1621;
    float _1625 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1627 = fma(_1272, -0.5, _1609);
    float _1629 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1631 = _1537 + _1216;
    float _1633 = _1260 + _1216;
    out.m_65.x = _986;
    out.m_65.y = _982;
    out.m_65.z = _990;
    float _1635 = _1629 * _1294;
    float _1637 = -_1629;
    float _1639 = _1637 + 1.0;
    float _1641 = _1631 * 0.5;
    float _1643 = _1305 * _1635;
    float _1645 = _1315 * _1635;
    float _1647 = _1633 * 0.5;
    float _1649 = _1625 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1651 = fma(_1311, _1643, _1299);
    float _1653 = fma(_1313, _1643, _1301);
    float _1655 = _1305 * _1639;
    float _1657 = fma(_1305, _1645, _1303);
    out.gl_Position.x = _1260;
    out.gl_Position.y = _1272;
    out.gl_Position.z = _1537;
    out.gl_Position.w = _1216;
    out.m_67.x = _1647;
    out.m_67.y = _1627;
    out.m_67.z = _1641;
    out.m_67.w = _1216;
    out.m_45.x = _1649;
    out.m_69.x = _1651;
    out.m_69.y = _1653;
    out.m_69.z = _1657;
    out.m_69.w = _1655;
    if (_1623)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1659 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1659;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _742 = false;
    bool _506 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1716 = as_type<float>(_104);
        out.gl_Position.z = _1716;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _1785 = as_type<float>(_140);
        out.gl_Position.z = _1785;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
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
        float _266 = in.m_51.x;
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
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _292 + _298;
    bool _302 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_292);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _320 = _292 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = 1.0 / _316;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _334 = 1.0 / _328;
    float _336 = 1.0 / _324;
    float _338 = _296 * _330;
    bool _340 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_292);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_312;
    float _354 = _352 + 1.0;
    float _356 = _350 * _354;
    float _358 = _300 * _334;
    bool _360 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _362 = isnan(_292);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _372;
    bool _376 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_292);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _392 = -_350;
    float _394 = _392 + 1.0;
    float _396 = -_370;
    float _398 = _396 + 1.0;
    float _400 = _320 * _336;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = _386 * _398;
    float _412 = fma(_374, _400, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _414 = fma(_404, _400, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = fma(_408, _400, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = _370 * _394;
    float _420 = -_386;
    float _422 = _420 + 1.0;
    float _424 = _414 * _410;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = _416 * _410;
    float _436 = _412 * _410;
    float _438 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].x, _424);
    float _440 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _444 = fma(_390, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = fma(_428, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _448 = fma(_432, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_444, _418, _438);
    float _464 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_456, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_460, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = fma(_446, _418, _440);
    float _472 = fma(_448, _418, _442);
    float _474 = fma(_464, _356, _462);
    float _476 = fma(_466, _356, _470);
    float _478 = fma(_468, _356, _472);
    float _480 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].x, _474);
    float _482 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].y, _476);
    float _484 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].z, _478);
    bool _486 = !_332;
    float _504;
    if (!_486)
    {
        float _488 = in.m_51.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        float _508 = float(_88);
        float _510 = 1.0 / _508;
        float _512 = _122 * _510;
        _504 = _512;
    }
    _506 = false;
    float _514 = _504;
    float _516 = in.m_49.x;
    float _518 = in.m_49.y;
    float _520 = in.m_49.z;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _514 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _528 = _514 + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _538;
    bool _542 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _544 = isnan(_514);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = 1.0 / _532;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _558 = 1.0 / _536;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _560;
    float _564 = 1.0 / _540;
    float _566 = _484 * _520;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _570 = _514 + _568;
    float _572 = _482 * _518;
    float _574 = _480 * _516;
    float _576 = _570 * _554;
    float _578 = _524 * _558;
    bool _580 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _582 = isnan(_514);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _592;
    bool _596 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _598 = isnan(_514);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _608;
    float _612 = fma(_562, _576, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _614 = fma(_594, _576, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _616 = _528 * _564;
    float _618 = -_552;
    float _620 = _618 + 1.0;
    float _622 = -_606;
    float _624 = _622 + 1.0;
    float _626 = fma(_610, _576, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _628 = _590 * _620;
    bool _630 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _632 = isnan(_514);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _646 = -_590;
    float _648 = _646 + 1.0;
    float _650 = _640 * _624;
    float _652 = _606 * _648;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _658 = -_640;
    float _660 = _658 + 1.0;
    float _662 = _626 * _650;
    float _664 = _614 * _650;
    float _666 = _612 * _650;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _672 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].x, _662);
    float _674 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].y, _664);
    float _676 = fma(_644, _578, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _678 = fma(_670, _578, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _680 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].z, _666);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _686;
    float _690 = fma(_656, _578, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _692;
    float _696 = fma(_676, _652, _672);
    float _698 = fma(_684, _616, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _700 = fma(_688, _616, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _702 = fma(_678, _652, _674);
    float _704 = fma(_694, _616, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _706 = fma(_690, _652, _680);
    float _708 = fma(_698, _628, _696);
    float _710 = fma(_700, _628, _702);
    float _712 = fma(_704, _628, _706);
    float _714 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].x, _708);
    float _716 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].y, _710);
    float _718 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].z, _712);
    bool _720 = !_556;
    float _722 = _708;
    float _740;
    if (!_720)
    {
        float _724 = in.m_51.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_88);
        float _746 = 1.0 / _744;
        float _748 = _122 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = in.m_53.x;
    float _754 = in.m_53.y;
    float _756 = in.m_53.z;
    float _758 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _762 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _764 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _766 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _768 = isnan(0.5);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _774 = _770 || _772;
    float _776 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _762);
    float _778 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _776);
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _754);
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _752);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _756);
    float _786 = _780 * _758;
    float _788 = _782 * _760;
    float _790 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = _784 * _764;
    float _794 = _786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _796 = _786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _798 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    float _800 = _778 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _802 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].x, _794);
    float _804 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].x, _796);
    float _806 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    float _808 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _810 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[10].z, _802);
    float _812 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[8].z, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _816 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _808);
    float _818 = _800 + _810;
    float _820 = _786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _822 = _814 + _812;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _826 = _818 + _824;
    float _828 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].x, _820);
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _832 = _822 + _830;
    float _834 = _826 * _826;
    float _836 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[9].z, _828);
    float _838 = fma(_832, _832, _834);
    float _840 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _816);
    float _842 = sqrt(_838);
    float _844 = _840 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _846 = _844 + _836;
    bool _848 = _842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _836;
    float _852 = _828;
    float _854 = _822;
    float _856 = _818;
    float _858 = _826;
    if (!_848)
    {
        _850 = _818;
    }
    float _860 = _850;
    float _862 = _860;
    if (!_848)
    {
        _722 = _846;
    }
    float _864 = _722;
    bool _866 = !_848;
    float _868 = _864;
    if (!_866)
    {
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _874 = _842 + _872;
        float _876 = _846 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _878 = rsqrt(_838);
        float _880 = _874 * _870;
        float _882 = _880 * 0.15915493667125701904296875;
        float _884 = _882 * 6.283185482025146484375;
        float _886 = cos(_884);
        float _888 = _882 * 6.283185482025146484375;
        float _890 = sin(_888);
        float _892 = _886 + (-1.0);
        float _894 = fma(_890, _876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _896 = _892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = _878 * _894;
        float _900 = fma(_846, _886, _896);
        float _902 = fma(_832, _898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _904 = fma(_826, _898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _852 = _882;
        _854 = _902;
        _868 = _900;
        _862 = _904;
    }
    float _906 = _852;
    float _908 = _854;
    float _910 = _868;
    float _912 = _862;
    float _914 = _910;
    float _916 = _908;
    float _918 = _912;
    float _920 = _906;
    if (!_774)
    {
        float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _924 = _844 + _922;
        float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _928 = _814 + _926;
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _932 = -_814;
        float _934 = _932 + _908;
        float _936 = _924 * _924;
        float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _940 = _800 + _938;
        float _942 = -_844;
        float _944 = _942 + _910;
        float _946 = fma(_928, _928, _936);
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _950 = fma(_940, _940, _946);
        float _952 = sqrt(_950);
        float _954 = _930 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _956 = precise::min(_952, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _958 = _956 * _948;
        float _960 = _954 * _958;
        float _962 = -_800;
        float _964 = _962 + _912;
        float _966 = fma(_934, _960, _814);
        float _968 = fma(_944, _960, _844);
        float _970 = fma(_964, _960, _800);
        _914 = _968;
        _916 = _966;
        _918 = _970;
        _920 = _930;
    }
    float _972 = _914;
    float _974 = _916;
    float _976 = _918;
    float _978 = _920;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _982 = _972 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _986 = _974 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _976 + _988;
    float _992 = _982 * _982;
    float _994 = fma(_986, _986, _992);
    float _996 = fma(_990, _990, _994);
    float _998 = rsqrt(_996);
    float _1000 = sqrt(_996);
    float _1002 = _998 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1004 = _986 * _1002;
    float _1006 = _990 * _1002;
    float _1008 = _1004 * _1004;
    float _1010 = _1006 * _1006;
    float _1012 = _1008 + _1010;
    float _1014 = sqrt(_1012);
    bool _1016 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _1014 + _1018;
    float _1022 = _846;
    float _1024 = _1020;
    if (_1016)
    {
        float _1026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1026;
    }
    float _1028 = _1022;
    if (_1016)
    {
        float _1030 = rsqrt(_1012);
        _856 = _1030;
    }
    float _1032 = _856;
    float _1034 = _1032;
    if (_1016)
    {
        float _1036 = _1020 * _1028;
        _1024 = _1036;
    }
    float _1038 = _1024;
    if (_1016)
    {
        float _1040 = _1038 * 0.15915493667125701904296875;
        _858 = _1040;
    }
    float _1042 = _858;
    float _1044 = _978;
    if (_1016)
    {
        float _1046 = _1042 * 6.283185482025146484375;
        float _1048 = sin(_1046);
        _1044 = _1048;
    }
    float _1050 = _1044;
    float _1052 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1054 = precise::max(0.0, _1052);
    float _1056 = _832;
    float _1058 = _1054;
    float _1060 = _1052;
    if (_1016)
    {
        float _1062 = _1042 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        _1056 = _1064;
    }
    float _1066 = _1056;
    float _1068 = -_1002;
    float _1070 = -_1054;
    float _1072 = fma(_982, _1068, _1070);
    if (_1016)
    {
        float _1074 = _1072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1058 = _1074;
    }
    float _1076 = _1058;
    float _1078 = _972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1080 = _1076;
    float _1082 = _1050;
    if (_1016)
    {
        float _1084 = fma(_1050, _1076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1080 = _1084;
    }
    float _1086 = _1080;
    float _1088 = _1086;
    if (!_1016)
    {
        _1082 = _1004;
    }
    float _1090 = _1082;
    float _1092 = _1090;
    float _1094 = _1066;
    if (_1016)
    {
        float _1096 = _1066 + (-1.0);
        _1060 = _1096;
    }
    float _1098 = _1060;
    float _1100 = 0.0;
    float _1102 = _1098;
    if (_1016)
    {
        float _1104 = _1032 * _1086;
        _1100 = _1104;
    }
    float _1106 = _1100;
    if (!_1016)
    {
        _1088 = _1072;
    }
    float _1108 = _1088;
    float _1110 = _1108;
    if (_1016)
    {
        float _1112 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1112;
    }
    float _1114 = _1034;
    float _1116 = _1114;
    if (_1016)
    {
        float _1118 = _1004 * _1106;
        _1092 = _1118;
    }
    float _1120 = _1092;
    if (!_1016)
    {
        _1102 = _1006;
    }
    float _1122 = _1102;
    float _1124 = _1122;
    if (_1016)
    {
        float _1126 = _1006 * _1106;
        _1124 = _1126;
    }
    float _1128 = _1124;
    if (_1016)
    {
        float _1130 = fma(_1072, _1066, _1114);
        _1110 = _1130;
    }
    float _1132 = _1110;
    if (!_1016)
    {
        _1116 = _1008;
    }
    float _1134 = _1116;
    float _1136 = _1134;
    if (_1016)
    {
        float _1138 = _1120 * _1120;
        _1136 = _1138;
    }
    float _1140 = _1136;
    float _1142 = _972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1016)
    {
        _1094 = _1010;
    }
    float _1146 = _1094;
    float _1148 = _972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = _1146;
    if (_1016)
    {
        float _1152 = _1128 * _1128;
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = fma(_1132, _1132, _1140);
    float _1158 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1078);
    float _1160 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1162 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1144);
    float _1164 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1166 = _1156 + _1154;
    float _1168 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1160);
    float _1170 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1172 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1162);
    float _1174 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1158);
    float _1176 = rsqrt(_1166);
    float _1178 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1182 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1180);
    float _1184 = precise::clamp(_1182, 0.0, 1.0);
    float _1186 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1188 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1192 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1164);
    float _1194 = -_1184;
    float _1196 = _1194 + 1.0;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1190);
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1204 = -_1198;
    float _1206 = fma(_1204, _1170, 1.0);
    float _1208 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1200);
    float _1210 = abs(_1196);
    float _1212 = log2(_1210);
    float _1214 = _1176 * _1120;
    float _1216 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1208);
    float _1218 = _1176 * _1132;
    float _1220 = _1176 * _1128;
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1224 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1226 = log2(_1206);
    float _1228 = _1218 + 1.0;
    float _1230 = -_1222;
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1230);
    float _1234 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1224);
    float _1236 = -_1220;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1232);
    float _1240 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1242 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1244 = 1.0 / _1216;
    float _1246 = fma(_1238, -0.5, 0.5);
    float _1248 = fma(_1238, 0.5, 0.5);
    float _1250 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1240);
    float _1252 = fma(_1248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1254 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1250);
    float _1256 = sqrt(_1246);
    float _1258 = fma(_1248, _1252, -0.212114393711090087890625);
    float _1260 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1254);
    float _1262 = fma(_1248, _1258, 1.570728778839111328125);
    float _1264 = exp2(_1242);
    float _1266 = _1256 * 0.636619746685028076171875;
    float _1268 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1234);
    float _1270 = _1226 * 0.693147182464599609375;
    float _1272 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1268);
    float _1274 = _1260 * _1244;
    float _1276 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1278 = -_1218;
    float _1280 = fma(_1264, _1228, _1278);
    float _1282 = _1272 * _1244;
    float _1284 = -_1262;
    float _1286 = fma(_1266, _1284, 1.0);
    float _1288 = fma(_1274, 0.5, 0.5);
    float _1290 = fma(_1280, 0.5, 0.5);
    float _1292 = fma(_1282, -0.5, 0.5);
    float3 _3665 = float3(_1288, _1292, _1276);
    float _1294 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3665, float3(0.0), isnan(_3665)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3665, float3(0.0), isnan(_3665)), level(0.0)).x;
    float3 _3676 = float3(_1288, _1292, _1276);
    float4 _1297 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3676, float3(0.0), isnan(_3676)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3676, float3(0.0), isnan(_3676)), level(0.0)).xyzw;
    float _1299 = _1297.x;
    float _1301 = _1297.y;
    float _1303 = _1297.z;
    float _1305 = _1297.w;
    float2 _3693 = float2(_1286, _1290);
    float3 _1309 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3693, float2(0.0), isnan(_3693)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3693, float2(0.0), isnan(_3693)), level(0.0)).xyz;
    float _1311 = _1309.x;
    float _1313 = _1309.y;
    float _1315 = _1309.z;
    float _1317 = in.m_55.x;
    float _1319 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1321 = in.m_55.z;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1325 = _1323 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1331 = _754 != 0.0;
    bool _1333 = isnan(_754);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.0);
    bool _1339 = _1335 || _1337;
    float _1341 = in.m_55.y;
    bool _1343 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1345 = isnan(_750);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1351);
    float _1355 = 1.0 / _1329;
    bool _1357 = _752 == 0.0;
    bool _1359 = !_1339;
    bool _1361 = _1357 && _1359;
    float _1363 = in.m_57.x;
    float _1365 = in.m_57.y;
    float _1367 = in.m_57.z;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1377 = _756 == 0.0;
    bool _1379 = _1377 && _1361;
    float _1381 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1383 = 1.0 / _1325;
    bool _1385 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1387 = isnan(_750);
    bool _1389 = _1385 || _1387;
    bool _1391 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1393 = _1389 || _1391;
    float _1395 = float(_1393);
    float _1397 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1381);
    out.m_59.x = _1317;
    float _1399 = _1371 * _1355;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1403 = _750 + _1401;
    out.m_59.z = _1321;
    float _1405 = exp2(_1319);
    bool _1407 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1409 = isnan(_750);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1415 = _1411 || _1413;
    float _1417 = float(_1415);
    out.m_59.y = _1341;
    float _1419 = _1375 * _1383;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1423 = _750 + _1421;
    float _1425 = -_1353;
    float _1427 = _1425 + 1.0;
    float _1429 = in.m_55.w;
    float _1431 = _1365;
    float _1433 = _1363;
    float _1435 = _1367;
    if (!_1379)
    {
        float _1437 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1365);
        _1431 = _1437;
    }
    float _1439 = _1431;
    float _1441 = fma(_1399, _1423, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1443 = _1417 * _1427;
    float _1445 = -_1395;
    float _1447 = _1445 + 1.0;
    float _1449 = -_1417;
    float _1451 = _1449 + 1.0;
    float _1453 = fma(_1419, _1403, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1455 = _1441 * _1443;
    float _1457 = _1353 * _1447;
    if (!_1379)
    {
        float _1459 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1363);
        _1433 = _1459;
    }
    float _1461 = _1433;
    float _1463 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1465 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1455);
    float _1467 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1469 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_1379)
    {
        float _1471 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1367);
        _1435 = _1471;
    }
    float _1473 = _1435;
    float _1475 = fma(_1453, _1457, _1465);
    float _1477 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1463);
    float _1479 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1467);
    float _1481 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1469);
    float _1483 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1475);
    float _1485 = _844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1487 = fma(_1473, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1477);
    float _1489 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1491 = _716 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1493 = _718 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1495 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1485);
    float _1497 = _844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1505 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1507 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1495);
    out.m_59.w = _1429;
    float _1509 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1497);
    bool _1511 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1519 = _1515 || _1517;
    float _1521 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_61.x = _1499;
    out.m_61.y = _1501;
    out.m_61.z = _1503;
    out.m_61.w = _1505;
    float _1523 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1509);
    float _1525 = fma(_1473, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1479);
    float _1527 = 1.0 / _1521;
    float _1529 = fma(_1473, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1481);
    float _1531 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1397);
    float _1535 = _1531 + _1521;
    out.m_63.x = _1487;
    out.m_63.y = _1525;
    out.m_63.z = _1529;
    float _1537 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1533);
    float _1539 = _1535 * _1527;
    float _1541 = _1539 * 0.5;
    float _1543 = _1487;
    if (_1519)
    {
        _1543 = 1.0;
    }
    float _1545 = _1543;
    float _1547 = _1545;
    if (!_1519)
    {
        float _1549 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1551 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1553 = _1549 * 0.15915493667125701904296875;
        float _1555 = _1551 * 0.15915493667125701904296875;
        float _1557 = _1553 * 6.283185482025146484375;
        float _1559 = cos(_1557);
        float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1563 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1561);
        float _1565 = _1553 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        float _1569 = 1.0 / _1559;
        float _1571 = _1555 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = _1567 * _1569;
        float _1577 = _1555 * 6.283185482025146484375;
        float _1579 = sin(_1577);
        float _1581 = _1573 * _1575;
        float _1583 = 1.0 / _1563;
        float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1587 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1585;
        float _1589 = 1.0 / _1581;
        float _1591 = 1.0 / _1587;
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1595 = _1583 * _1593;
        float _1597 = _1579 * _1589;
        float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1601 = fma(_1597, _1595, _1599);
        float _1603 = _1601 * _1591;
        float _1605 = precise::clamp(_1603, 0.0, 1.0);
        _1547 = _1605;
    }
    float _1607 = _1547;
    float _1609 = _1216 * 0.5;
    float _1611 = -_1405;
    float _1613 = _1611 + 1.0;
    bool _1615 = _1607 > 0.0;
    bool _1617 = isnan(_1607);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan(0.0);
    bool _1623 = _1619 || _1621;
    float _1625 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1627 = fma(_1272, -0.5, _1609);
    float _1629 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1631 = _1537 + _1216;
    float _1633 = _1260 + _1216;
    out.m_65.x = _986;
    out.m_65.y = _982;
    out.m_65.z = _990;
    float _1635 = _1629 * _1294;
    float _1637 = -_1629;
    float _1639 = _1637 + 1.0;
    float _1641 = _1631 * 0.5;
    float _1643 = _1305 * _1635;
    float _1645 = _1315 * _1635;
    float _1647 = _1633 * 0.5;
    float _1649 = _1625 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1651 = fma(_1311, _1643, _1299);
    float _1653 = fma(_1313, _1643, _1301);
    float _1655 = _1305 * _1639;
    float _1657 = fma(_1305, _1645, _1303);
    out.gl_Position.x = _1260;
    out.gl_Position.y = _1272;
    out.gl_Position.z = _1537;
    out.gl_Position.w = _1216;
    out.m_67.x = _1647;
    out.m_67.y = _1627;
    out.m_67.z = _1641;
    out.m_67.w = _1216;
    out.m_45.x = _1649;
    out.m_69.x = _1651;
    out.m_69.y = _1653;
    out.m_69.z = _1657;
    out.m_69.w = _1655;
    if (_1623)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1659 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1659;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _742 = false;
    bool _506 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1716 = as_type<float>(_104);
        out.gl_Position.z = _1716;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _1785 = as_type<float>(_140);
        out.gl_Position.z = _1785;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
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
        float _266 = in.m_51.x;
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
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _292 + _298;
    bool _302 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_292);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _320 = _292 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = 1.0 / _316;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _334 = 1.0 / _328;
    float _336 = 1.0 / _324;
    float _338 = _296 * _330;
    bool _340 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_292);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_312;
    float _354 = _352 + 1.0;
    float _356 = _350 * _354;
    float _358 = _300 * _334;
    bool _360 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _362 = isnan(_292);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _372;
    bool _376 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_292);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _392 = -_350;
    float _394 = _392 + 1.0;
    float _396 = -_370;
    float _398 = _396 + 1.0;
    float _400 = _320 * _336;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = _386 * _398;
    float _412 = fma(_374, _400, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _414 = fma(_404, _400, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = fma(_408, _400, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = _370 * _394;
    float _420 = -_386;
    float _422 = _420 + 1.0;
    float _424 = _414 * _410;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = _416 * _410;
    float _436 = _412 * _410;
    float _438 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].x, _424);
    float _440 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _444 = fma(_390, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = fma(_428, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _448 = fma(_432, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_444, _418, _438);
    float _464 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_456, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_460, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = fma(_446, _418, _440);
    float _472 = fma(_448, _418, _442);
    float _474 = fma(_464, _356, _462);
    float _476 = fma(_466, _356, _470);
    float _478 = fma(_468, _356, _472);
    float _480 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].x, _474);
    float _482 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].y, _476);
    float _484 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].z, _478);
    bool _486 = !_332;
    float _504;
    if (!_486)
    {
        float _488 = in.m_51.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        float _508 = float(_88);
        float _510 = 1.0 / _508;
        float _512 = _122 * _510;
        _504 = _512;
    }
    _506 = false;
    float _514 = _504;
    float _516 = in.m_49.x;
    float _518 = in.m_49.y;
    float _520 = in.m_49.z;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _514 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _528 = _514 + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _538;
    bool _542 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _544 = isnan(_514);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = 1.0 / _532;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _558 = 1.0 / _536;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _560;
    float _564 = 1.0 / _540;
    float _566 = _484 * _520;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _570 = _514 + _568;
    float _572 = _482 * _518;
    float _574 = _480 * _516;
    float _576 = _570 * _554;
    float _578 = _524 * _558;
    bool _580 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _582 = isnan(_514);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _592;
    bool _596 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _598 = isnan(_514);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _608;
    float _612 = fma(_562, _576, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _614 = fma(_594, _576, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _616 = _528 * _564;
    float _618 = -_552;
    float _620 = _618 + 1.0;
    float _622 = -_606;
    float _624 = _622 + 1.0;
    float _626 = fma(_610, _576, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _628 = _590 * _620;
    bool _630 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _632 = isnan(_514);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _646 = -_590;
    float _648 = _646 + 1.0;
    float _650 = _640 * _624;
    float _652 = _606 * _648;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _658 = -_640;
    float _660 = _658 + 1.0;
    float _662 = _626 * _650;
    float _664 = _614 * _650;
    float _666 = _612 * _650;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _672 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].x, _662);
    float _674 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].y, _664);
    float _676 = fma(_644, _578, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _678 = fma(_670, _578, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _680 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].z, _666);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _686;
    float _690 = fma(_656, _578, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _692;
    float _696 = fma(_676, _652, _672);
    float _698 = fma(_684, _616, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _700 = fma(_688, _616, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _702 = fma(_678, _652, _674);
    float _704 = fma(_694, _616, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _706 = fma(_690, _652, _680);
    float _708 = fma(_698, _628, _696);
    float _710 = fma(_700, _628, _702);
    float _712 = fma(_704, _628, _706);
    float _714 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].x, _708);
    float _716 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].y, _710);
    float _718 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].z, _712);
    bool _720 = !_556;
    float _722 = _708;
    float _740;
    if (!_720)
    {
        float _724 = in.m_51.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_88);
        float _746 = 1.0 / _744;
        float _748 = _122 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = in.m_53.x;
    float _754 = in.m_53.y;
    float _756 = in.m_53.z;
    float _758 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _762 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _764 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _766 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _768 = isnan(0.5);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _774 = _770 || _772;
    float _776 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _762);
    float _778 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _776);
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _754);
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _752);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _756);
    float _786 = _780 * _758;
    float _788 = _782 * _760;
    float _790 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = _784 * _764;
    float _794 = _786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _796 = _786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _798 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    float _800 = _778 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _802 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].x, _794);
    float _804 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].x, _796);
    float _806 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    float _808 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _810 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[10].z, _802);
    float _812 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[8].z, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _816 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _808);
    float _818 = _800 + _810;
    float _820 = _786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _822 = _814 + _812;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _826 = _818 + _824;
    float _828 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].x, _820);
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _832 = _822 + _830;
    float _834 = _826 * _826;
    float _836 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[9].z, _828);
    float _838 = fma(_832, _832, _834);
    float _840 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _816);
    float _842 = sqrt(_838);
    float _844 = _840 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _846 = _844 + _836;
    bool _848 = _842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _836;
    float _852 = _828;
    float _854 = _822;
    float _856 = _818;
    float _858 = _826;
    if (!_848)
    {
        _850 = _818;
    }
    float _860 = _850;
    float _862 = _860;
    if (!_848)
    {
        _722 = _846;
    }
    float _864 = _722;
    bool _866 = !_848;
    float _868 = _864;
    if (!_866)
    {
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _874 = _842 + _872;
        float _876 = _846 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _878 = rsqrt(_838);
        float _880 = _874 * _870;
        float _882 = _880 * 0.15915493667125701904296875;
        float _884 = _882 * 6.283185482025146484375;
        float _886 = cos(_884);
        float _888 = _882 * 6.283185482025146484375;
        float _890 = sin(_888);
        float _892 = _886 + (-1.0);
        float _894 = fma(_890, _876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _896 = _892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = _878 * _894;
        float _900 = fma(_846, _886, _896);
        float _902 = fma(_832, _898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _904 = fma(_826, _898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _852 = _882;
        _854 = _902;
        _868 = _900;
        _862 = _904;
    }
    float _906 = _852;
    float _908 = _854;
    float _910 = _868;
    float _912 = _862;
    float _914 = _910;
    float _916 = _908;
    float _918 = _912;
    float _920 = _906;
    if (!_774)
    {
        float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _924 = _844 + _922;
        float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _928 = _814 + _926;
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _932 = -_814;
        float _934 = _932 + _908;
        float _936 = _924 * _924;
        float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _940 = _800 + _938;
        float _942 = -_844;
        float _944 = _942 + _910;
        float _946 = fma(_928, _928, _936);
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _950 = fma(_940, _940, _946);
        float _952 = sqrt(_950);
        float _954 = _930 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _956 = precise::min(_952, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _958 = _956 * _948;
        float _960 = _954 * _958;
        float _962 = -_800;
        float _964 = _962 + _912;
        float _966 = fma(_934, _960, _814);
        float _968 = fma(_944, _960, _844);
        float _970 = fma(_964, _960, _800);
        _914 = _968;
        _916 = _966;
        _918 = _970;
        _920 = _930;
    }
    float _972 = _914;
    float _974 = _916;
    float _976 = _918;
    float _978 = _920;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _982 = _972 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _986 = _974 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _976 + _988;
    float _992 = _982 * _982;
    float _994 = fma(_986, _986, _992);
    float _996 = fma(_990, _990, _994);
    float _998 = rsqrt(_996);
    float _1000 = sqrt(_996);
    float _1002 = _998 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1004 = _986 * _1002;
    float _1006 = _990 * _1002;
    float _1008 = _1004 * _1004;
    float _1010 = _1006 * _1006;
    float _1012 = _1008 + _1010;
    float _1014 = sqrt(_1012);
    bool _1016 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _1014 + _1018;
    float _1022 = _846;
    float _1024 = _1020;
    if (_1016)
    {
        float _1026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1026;
    }
    float _1028 = _1022;
    if (_1016)
    {
        float _1030 = rsqrt(_1012);
        _856 = _1030;
    }
    float _1032 = _856;
    float _1034 = _1032;
    if (_1016)
    {
        float _1036 = _1020 * _1028;
        _1024 = _1036;
    }
    float _1038 = _1024;
    if (_1016)
    {
        float _1040 = _1038 * 0.15915493667125701904296875;
        _858 = _1040;
    }
    float _1042 = _858;
    float _1044 = _978;
    if (_1016)
    {
        float _1046 = _1042 * 6.283185482025146484375;
        float _1048 = sin(_1046);
        _1044 = _1048;
    }
    float _1050 = _1044;
    float _1052 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1054 = precise::max(0.0, _1052);
    float _1056 = _832;
    float _1058 = _1054;
    float _1060 = _1052;
    if (_1016)
    {
        float _1062 = _1042 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        _1056 = _1064;
    }
    float _1066 = _1056;
    float _1068 = -_1002;
    float _1070 = -_1054;
    float _1072 = fma(_982, _1068, _1070);
    if (_1016)
    {
        float _1074 = _1072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1058 = _1074;
    }
    float _1076 = _1058;
    float _1078 = _972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1080 = _1076;
    float _1082 = _1050;
    if (_1016)
    {
        float _1084 = fma(_1050, _1076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1080 = _1084;
    }
    float _1086 = _1080;
    float _1088 = _1086;
    if (!_1016)
    {
        _1082 = _1004;
    }
    float _1090 = _1082;
    float _1092 = _1090;
    float _1094 = _1066;
    if (_1016)
    {
        float _1096 = _1066 + (-1.0);
        _1060 = _1096;
    }
    float _1098 = _1060;
    float _1100 = 0.0;
    float _1102 = _1098;
    if (_1016)
    {
        float _1104 = _1032 * _1086;
        _1100 = _1104;
    }
    float _1106 = _1100;
    if (!_1016)
    {
        _1088 = _1072;
    }
    float _1108 = _1088;
    float _1110 = _1108;
    if (_1016)
    {
        float _1112 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1112;
    }
    float _1114 = _1034;
    float _1116 = _1114;
    if (_1016)
    {
        float _1118 = _1004 * _1106;
        _1092 = _1118;
    }
    float _1120 = _1092;
    if (!_1016)
    {
        _1102 = _1006;
    }
    float _1122 = _1102;
    float _1124 = _1122;
    if (_1016)
    {
        float _1126 = _1006 * _1106;
        _1124 = _1126;
    }
    float _1128 = _1124;
    if (_1016)
    {
        float _1130 = fma(_1072, _1066, _1114);
        _1110 = _1130;
    }
    float _1132 = _1110;
    if (!_1016)
    {
        _1116 = _1008;
    }
    float _1134 = _1116;
    float _1136 = _1134;
    if (_1016)
    {
        float _1138 = _1120 * _1120;
        _1136 = _1138;
    }
    float _1140 = _1136;
    float _1142 = _972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1016)
    {
        _1094 = _1010;
    }
    float _1146 = _1094;
    float _1148 = _972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = _1146;
    if (_1016)
    {
        float _1152 = _1128 * _1128;
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = fma(_1132, _1132, _1140);
    float _1158 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1078);
    float _1160 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1162 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1144);
    float _1164 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1166 = _1156 + _1154;
    float _1168 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1160);
    float _1170 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1172 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1162);
    float _1174 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1158);
    float _1176 = rsqrt(_1166);
    float _1178 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1182 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1180);
    float _1184 = precise::clamp(_1182, 0.0, 1.0);
    float _1186 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1188 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1192 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1164);
    float _1194 = -_1184;
    float _1196 = _1194 + 1.0;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1190);
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1204 = -_1198;
    float _1206 = fma(_1204, _1170, 1.0);
    float _1208 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1200);
    float _1210 = abs(_1196);
    float _1212 = log2(_1210);
    float _1214 = _1176 * _1120;
    float _1216 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1208);
    float _1218 = _1176 * _1132;
    float _1220 = _1176 * _1128;
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1224 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1226 = log2(_1206);
    float _1228 = _1218 + 1.0;
    float _1230 = -_1222;
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1230);
    float _1234 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1224);
    float _1236 = -_1220;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1232);
    float _1240 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1242 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1244 = 1.0 / _1216;
    float _1246 = fma(_1238, -0.5, 0.5);
    float _1248 = fma(_1238, 0.5, 0.5);
    float _1250 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1240);
    float _1252 = fma(_1248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1254 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1250);
    float _1256 = sqrt(_1246);
    float _1258 = fma(_1248, _1252, -0.212114393711090087890625);
    float _1260 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1254);
    float _1262 = fma(_1248, _1258, 1.570728778839111328125);
    float _1264 = exp2(_1242);
    float _1266 = _1256 * 0.636619746685028076171875;
    float _1268 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1234);
    float _1270 = _1226 * 0.693147182464599609375;
    float _1272 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1268);
    float _1274 = _1260 * _1244;
    float _1276 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1278 = -_1218;
    float _1280 = fma(_1264, _1228, _1278);
    float _1282 = _1272 * _1244;
    float _1284 = -_1262;
    float _1286 = fma(_1266, _1284, 1.0);
    float _1288 = fma(_1274, 0.5, 0.5);
    float _1290 = fma(_1280, 0.5, 0.5);
    float _1292 = fma(_1282, -0.5, 0.5);
    float3 _3665 = float3(_1288, _1292, _1276);
    float _1294 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3665, float3(0.0), isnan(_3665)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3665, float3(0.0), isnan(_3665)), level(0.0)).x;
    float3 _3676 = float3(_1288, _1292, _1276);
    float4 _1297 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3676, float3(0.0), isnan(_3676)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3676, float3(0.0), isnan(_3676)), level(0.0)).xyzw;
    float _1299 = _1297.x;
    float _1301 = _1297.y;
    float _1303 = _1297.z;
    float _1305 = _1297.w;
    float2 _3693 = float2(_1286, _1290);
    float3 _1309 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3693, float2(0.0), isnan(_3693)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3693, float2(0.0), isnan(_3693)), level(0.0)).xyz;
    float _1311 = _1309.x;
    float _1313 = _1309.y;
    float _1315 = _1309.z;
    float _1317 = in.m_55.x;
    float _1319 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1321 = in.m_55.z;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1325 = _1323 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1331 = _754 != 0.0;
    bool _1333 = isnan(_754);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.0);
    bool _1339 = _1335 || _1337;
    float _1341 = in.m_55.y;
    bool _1343 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1345 = isnan(_750);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1351);
    float _1355 = 1.0 / _1329;
    bool _1357 = _752 == 0.0;
    bool _1359 = !_1339;
    bool _1361 = _1357 && _1359;
    float _1363 = in.m_57.x;
    float _1365 = in.m_57.y;
    float _1367 = in.m_57.z;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1377 = _756 == 0.0;
    bool _1379 = _1377 && _1361;
    float _1381 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1383 = 1.0 / _1325;
    bool _1385 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1387 = isnan(_750);
    bool _1389 = _1385 || _1387;
    bool _1391 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1393 = _1389 || _1391;
    float _1395 = float(_1393);
    float _1397 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1381);
    out.m_59.x = _1317;
    float _1399 = _1371 * _1355;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1403 = _750 + _1401;
    out.m_59.z = _1321;
    float _1405 = exp2(_1319);
    bool _1407 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1409 = isnan(_750);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1415 = _1411 || _1413;
    float _1417 = float(_1415);
    out.m_59.y = _1341;
    float _1419 = _1375 * _1383;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1423 = _750 + _1421;
    float _1425 = -_1353;
    float _1427 = _1425 + 1.0;
    float _1429 = in.m_55.w;
    float _1431 = _1365;
    float _1433 = _1363;
    float _1435 = _1367;
    if (!_1379)
    {
        float _1437 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1365);
        _1431 = _1437;
    }
    float _1439 = _1431;
    float _1441 = fma(_1399, _1423, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1443 = _1417 * _1427;
    float _1445 = -_1395;
    float _1447 = _1445 + 1.0;
    float _1449 = -_1417;
    float _1451 = _1449 + 1.0;
    float _1453 = fma(_1419, _1403, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1455 = _1441 * _1443;
    float _1457 = _1353 * _1447;
    if (!_1379)
    {
        float _1459 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1363);
        _1433 = _1459;
    }
    float _1461 = _1433;
    float _1463 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1465 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1455);
    float _1467 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1469 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_1379)
    {
        float _1471 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1367);
        _1435 = _1471;
    }
    float _1473 = _1435;
    float _1475 = fma(_1453, _1457, _1465);
    float _1477 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1463);
    float _1479 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1467);
    float _1481 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1469);
    float _1483 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1475);
    float _1485 = _844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1487 = fma(_1473, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1477);
    float _1489 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1491 = _716 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1493 = _718 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1495 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1485);
    float _1497 = _844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1505 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1507 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1495);
    out.m_59.w = _1429;
    float _1509 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1497);
    bool _1511 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1519 = _1515 || _1517;
    float _1521 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_61.x = _1499;
    out.m_61.y = _1501;
    out.m_61.z = _1503;
    out.m_61.w = _1505;
    float _1523 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1509);
    float _1525 = fma(_1473, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1479);
    float _1527 = 1.0 / _1521;
    float _1529 = fma(_1473, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1481);
    float _1531 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1397);
    float _1535 = _1531 + _1521;
    out.m_63.x = _1487;
    out.m_63.y = _1525;
    out.m_63.z = _1529;
    float _1537 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1533);
    float _1539 = _1535 * _1527;
    float _1541 = _1539 * 0.5;
    float _1543 = _1487;
    if (_1519)
    {
        _1543 = 1.0;
    }
    float _1545 = _1543;
    float _1547 = _1545;
    if (!_1519)
    {
        float _1549 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1551 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1553 = _1549 * 0.15915493667125701904296875;
        float _1555 = _1551 * 0.15915493667125701904296875;
        float _1557 = _1553 * 6.283185482025146484375;
        float _1559 = cos(_1557);
        float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1563 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1561);
        float _1565 = _1553 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        float _1569 = 1.0 / _1559;
        float _1571 = _1555 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = _1567 * _1569;
        float _1577 = _1555 * 6.283185482025146484375;
        float _1579 = sin(_1577);
        float _1581 = _1573 * _1575;
        float _1583 = 1.0 / _1563;
        float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1587 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1585;
        float _1589 = 1.0 / _1581;
        float _1591 = 1.0 / _1587;
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1595 = _1583 * _1593;
        float _1597 = _1579 * _1589;
        float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1601 = fma(_1597, _1595, _1599);
        float _1603 = _1601 * _1591;
        float _1605 = precise::clamp(_1603, 0.0, 1.0);
        _1547 = _1605;
    }
    float _1607 = _1547;
    float _1609 = _1216 * 0.5;
    float _1611 = -_1405;
    float _1613 = _1611 + 1.0;
    bool _1615 = _1607 > 0.0;
    bool _1617 = isnan(_1607);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan(0.0);
    bool _1623 = _1619 || _1621;
    float _1625 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1627 = fma(_1272, -0.5, _1609);
    float _1629 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1631 = _1537 + _1216;
    float _1633 = _1260 + _1216;
    out.m_65.x = _986;
    out.m_65.y = _982;
    out.m_65.z = _990;
    float _1635 = _1629 * _1294;
    float _1637 = -_1629;
    float _1639 = _1637 + 1.0;
    float _1641 = _1631 * 0.5;
    float _1643 = _1305 * _1635;
    float _1645 = _1315 * _1635;
    float _1647 = _1633 * 0.5;
    float _1649 = _1625 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1651 = fma(_1311, _1643, _1299);
    float _1653 = fma(_1313, _1643, _1301);
    float _1655 = _1305 * _1639;
    float _1657 = fma(_1305, _1645, _1303);
    out.gl_Position.x = _1260;
    out.gl_Position.y = _1272;
    out.gl_Position.z = _1537;
    out.gl_Position.w = _1216;
    out.m_67.x = _1647;
    out.m_67.y = _1627;
    out.m_67.z = _1641;
    out.m_67.w = _1216;
    out.m_45.x = _1649;
    out.m_69.x = _1651;
    out.m_69.y = _1653;
    out.m_69.z = _1657;
    out.m_69.w = _1655;
    if (_1623)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1659 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1659;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

