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
    float4 m_65 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1534 = false;
    bool _888 = false;
    bool _720 = false;
    bool _578 = false;
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
        float _2154 = as_type<float>(_104);
        out.gl_Position.z = _2154;
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
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_140);
        out.gl_Position.z = _2222;
    }
    if (_134)
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
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
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
    float _358 = _350 * _338;
    float _360 = fma(_354, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = _356 * _338;
    float _364 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].x, _358);
    float _366 = _360 * _338;
    float _368 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _370 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].x, _364);
    float _372 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _374 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].z, _368);
    float _376 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
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
    float _408 = in.m_51.x;
    float _410 = in.m_51.y;
    float _412 = in.m_51.z;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _416 = _406 + _414;
    bool _418 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _420 = isnan(_406);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _438 = 1.0 / _432;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _442 = 1.0 / _436;
    float _444 = _374 * _412;
    bool _446 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _448 = isnan(_406);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = _416 * _438;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _462 = _406 + _460;
    bool _464 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _466 = isnan(_406);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -_428;
    float _478 = _476 + 1.0;
    float _480 = _376 * _410;
    float _482 = _370 * _408;
    float _484 = _474 * _478;
    float _486 = -_474;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _498;
    float _502 = _456 * _488;
    float _504 = fma(_492, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _506 = fma(_496, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = fma(_500, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _510 = _462 * _442;
    float _512 = _504 * _502;
    float _514 = _506 * _502;
    float _516 = _508 * _502;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _526 = -_456;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _536 = fma(_524, _510, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _538 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].x, _512);
    float _540 = fma(_532, _510, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].y, _514);
    float _544 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].z, _516);
    float _546 = fma(_534, _484, _538);
    float _548 = fma(_536, _484, _542);
    float _550 = fma(_540, _484, _544);
    float _552 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].x, _546);
    float _554 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].y, _548);
    float _556 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].z, _550);
    bool _558 = !_440;
    float _576;
    if (!_558)
    {
        float _560 = in.m_53.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_88);
        float _582 = 1.0 / _580;
        float _584 = _122 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _590 = _586 + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _596 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _598 = isnan(_586);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _612 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_586);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _624;
    bool _628 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _630 = isnan(_586);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = 1.0 / _594;
    float _642 = -_606;
    float _644 = _642 + 1.0;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _648 = _622 * _644;
    float _650 = -_622;
    float _652 = _650 + 1.0;
    float _654 = 1.0 / _610;
    float _656 = _626 * _640;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _662 = fma(_656, _590, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _664 = -_638;
    float _666 = _664 + 1.0;
    float _668 = _662 * _648;
    float _670 = _660 * _654;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = _586 + _672;
    float _676 = _606 * _666;
    float _678 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[115].x, _668);
    float _680 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_670, _674, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _684 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _686 = fma(_682, _676, _678);
    float _688 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[117].x, _686);
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _694 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _690;
    out.m_55.y = _696;
    out.m_55.z = _692;
    out.m_55.w = _698;
    bool _700 = !_646;
    float _718;
    if (!_700)
    {
        float _702 = in.m_53.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_88);
        float _724 = 1.0 / _722;
        float _726 = _122 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = _728 + _730;
    bool _734 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _736 = isnan(_728);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _728 + _746;
    bool _750 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _752 = isnan(_728);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _770 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _772 = isnan(_728);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -_744;
    float _784 = _782 + 1.0;
    float _786 = 1.0 / _768;
    float _788 = _780 * _784;
    float _790 = -_780;
    float _792 = _790 + 1.0;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _794;
    bool _798 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _800 = 1.0 / _764;
    float _802 = _760 * _792;
    float _804 = -_760;
    float _806 = _804 + 1.0;
    float _808 = _732 * _800;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _814;
    float _818 = fma(_796, _808, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _820 = fma(_812, _808, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _822 = fma(_816, _808, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _824 = _748 * _786;
    float _826 = _818 * _802;
    float _828 = _820 * _802;
    float _830 = _822 * _802;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _844 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[123].x, _826);
    float _846 = fma(_834, _824, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _848 = fma(_838, _824, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _850 = fma(_842, _824, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _852 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[123].y, _828);
    float _854 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[123].z, _830);
    float _856 = fma(_846, _788, _844);
    float _858 = fma(_848, _788, _852);
    float _860 = fma(_850, _788, _854);
    float _862 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[125].x, _856);
    float _864 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[125].y, _858);
    float _866 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[125].z, _860);
    bool _868 = !_798;
    float _886;
    if (!_868)
    {
        float _870 = in.m_53.x;
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _874 = _870 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _876 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _878 = _876 * _872;
        float _880 = floor(_878);
        float _882 = -_880;
        float _884 = _878 + _882;
        _886 = _884;
        _888 = true;
    }
    else
    {
        float _890 = float(_88);
        float _892 = 1.0 / _890;
        float _894 = _122 * _892;
        _886 = _894;
    }
    _888 = false;
    float _896 = _886;
    float _898 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _900 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _902 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _904 = in.m_53.w;
    float _906 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _898);
    float _908 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _900);
    float _910 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _902);
    float _912 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _906);
    float _914 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _908);
    float _916 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _910);
    float _918 = in.m_57.w;
    float _920 = _912 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _922 = _914 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _924 = _916 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _926 = in.m_59.x;
    float _928 = in.m_59.y;
    float _930 = in.m_59.z;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _920 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _938 = _922 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _942 = _924 + _940;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _946 = _944 != 0;
    float _948 = _934 * _934;
    float _950 = in.m_57.z;
    float _952 = fma(_938, _938, _948);
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _956 = _954 != 0;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _962 = _904 > 0.5;
    float _964 = fma(_942, _942, _952);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _970 = 1.0 / _960;
    float _972 = _904;
    float _974 = _918;
    float _976 = _950;
    if (_946)
    {
        float _978 = in.m_53.z;
        _972 = _978;
    }
    float _980 = _972;
    float _982 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _984 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = rsqrt(_964);
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _990 = _988 != 0;
    float _992 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1000 = _998 != 0;
    float _1002 = 1.0 / _968;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1006 = _1004 != 0;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _930);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _928);
    float _1012 = in.m_57.x;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _926);
    float _1016 = -_918;
    float _1018 = _1016 + 1.0;
    float _1020 = 1.0 / _996;
    float _1022 = _934 * _986;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1028 = _1014;
    float _1030 = _1010;
    float _1032 = _1012;
    if (_956)
    {
        float _1034 = _962 ? _1018 : _918;
        _974 = _1034;
    }
    float _1036 = _974;
    float _1038 = -_1022;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1042;
    float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1048 = _938 * _986;
    float _1050 = _1040 * _1040;
    float _1052 = 0.0;
    if (_1000)
    {
        float _1054 = in.m_53.x;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1058;
    float _1062 = -_1048;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _1066 = _1026 * _1002;
    float _1068 = _942 * _986;
    float _1070 = _1060 * _1020;
    float _1072 = fma(_1064, _1064, _1050);
    float _1074 = _1044 * _970;
    float _1076 = -_1068;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    bool _1080 = _980 > 0.5;
    bool _1082 = _1080 && _946;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1086 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1088 = isnan(_896);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = fma(_1078, _1078, _1072);
    float _1100 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1104 = _896 + _1102;
    bool _1106 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1108 = isnan(_896);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -_1096;
    float _1120 = _1118 + 1.0;
    float _1122 = fma(_1100, _1036, -0.5);
    float _1124 = fma(_1074, _1104, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1126 = sqrt(_1098);
    float _1128 = _1074;
    float _1130 = _1096;
    if (!_990)
    {
        float _1132 = in.m_53.y;
        _1128 = _1132;
    }
    float _1134 = _1128;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1138 = _896 + _1136;
    bool _1140 = _1056 > 0.5;
    bool _1142 = _1140 && _1000;
    float _1144 = fma(_1066, _1138, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1146 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1148 = isnan(_896);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1116 * _1120;
    float _1160 = -_1116;
    float _1162 = _1160 + 1.0;
    bool _1164 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1166 = isnan(_896);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1178 = _896 + _1176;
    float _1180 = -_1156;
    float _1182 = _1180 + 1.0;
    float _1184 = _1156 * _1162;
    float _1186 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1188 = fma(_1070, _1178, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1190 = _986 * _1126;
    float _1192 = _1174 * _1182;
    float _1194 = -_1174;
    float _1196 = _1194 + 1.0;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1200 = _982 * _1190;
    float _1202 = _984 * _1190;
    float _1204 = _992 * _1190;
    float _1206 = _1124 * _1192;
    float _1208 = _1200 * _1014;
    float _1210 = _1190;
    float _1212 = _1158;
    if (!_990)
    {
        _1028 = _1134;
    }
    float _1214 = _1028;
    float _1216 = _1202 * _1010;
    float _1218 = _1204 * _1008;
    float _1220 = _1192;
    if (!_990)
    {
        float _1222 = in.m_53.z;
        _1220 = _1222;
    }
    float _1224 = _1220;
    if (_946)
    {
        _1210 = _950;
    }
    float _1226 = _1210;
    float _1228 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1232 = _1214;
    float _1234 = _1134;
    float _1236 = _1226;
    if (_990)
    {
        float _1238 = in.m_53.x;
        float _1240 = in.m_53.y;
        _1232 = _1238;
        _1234 = _1240;
    }
    float _1242 = _1232;
    float _1244 = _1234;
    if (_1000)
    {
        _1030 = _1012;
    }
    float _1246 = _1030;
    float _1248 = fma(_1208, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1228);
    float _1250 = fma(_1208, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1230);
    float _1252 = _1246;
    if (_1082)
    {
        float _1254 = -_1226;
        float _1256 = _1254 + 1.0;
        _1236 = _1256;
    }
    float _1258 = _1236;
    float _1260 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1248);
    float _1262 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1250);
    if (_1142)
    {
        float _1264 = -_1246;
        float _1266 = _1264 + 1.0;
        _1252 = _1266;
    }
    float _1268 = _1252;
    if (_946)
    {
        _976 = _1258;
    }
    float _1270 = _976;
    float _1272 = _922 + _1260;
    float _1274 = _924 + _1262;
    float _1276 = in.m_57.y;
    float _1278 = _1272;
    float _1280 = _1274;
    if (_1000)
    {
        _1032 = _1268;
    }
    float _1282 = _1032;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1286 = _1272 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1274 + _1288;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1294 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1206);
    float _1296 = _1286 * _1286;
    float _1298 = _1290 * _1290;
    float _1300 = 0.0;
    float _1302 = _1224;
    float _1304 = _1296;
    float _1306 = _1298;
    if (!_990)
    {
        _1300 = _1224;
    }
    float _1308 = _1300;
    float _1310 = fma(_1144, _1184, _1294);
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1314 = _1296 + _1298;
    float _1316 = _1308;
    if (_990)
    {
        _1316 = _1244;
    }
    float _1318 = _1316;
    float _1320 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1292);
    if (_990)
    {
        _1302 = _1244;
    }
    float _1322 = _1302;
    float _1324 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1326 = _1244 > 0.5;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1330 = sqrt(_1314);
    float _1332 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1334 = fma(_1188, _1158, _1310);
    float _1336 = -_1328;
    float _1338 = fma(_1324, 2.0, _1336);
    float _1340 = fma(_1186, _1270, -0.5);
    float _1342 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1344 = -_1276;
    float _1346 = _1344 + 1.0;
    float _1348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1350 = fma(_1208, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1342);
    float _1352 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1356 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1312);
    float _1358 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1350);
    float _1360 = _1276;
    if (_1006)
    {
        float _1362 = _1326 ? _1346 : _1276;
        _1360 = _1362;
    }
    float _1364 = _1360;
    float _1366 = fma(_1352, -2.0, _1354);
    bool _1368 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1370 = _920 + _1358;
    float _1372 = _1332 * _1198;
    if (!_1368)
    {
        _1212 = _1370;
    }
    float _1374 = _1212;
    bool _1376 = !_1368;
    float _1378 = _1374;
    if (!_1376)
    {
        float _1380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1384 = _1330 + _1382;
        float _1386 = _1370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = rsqrt(_1314);
        float _1390 = _1384 * _1380;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = _1392 * 6.283185482025146484375;
        float _1396 = sin(_1394);
        float _1398 = _1392 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = fma(_1396, _1386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1404 = _1388 * _1402;
        float _1406 = fma(_1286, _1404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1408 = _1400 + (-1.0);
        float _1410 = fma(_1290, _1404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1414 = _1406 + _1412;
        float _1416 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1420 = _1410 + _1418;
        float _1422 = _1414 * _1414;
        float _1424 = fma(_1370, _1400, _1416);
        float _1426 = _1420 * _1420;
        _1378 = _1424;
        _1304 = _1422;
        _1306 = _1426;
        _1278 = _1406;
        _1280 = _1410;
    }
    float _1428 = _1378;
    float _1430 = _1304;
    float _1432 = _1306;
    float _1434 = _1278;
    float _1436 = _1280;
    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1440 = _1428 + _1438;
    float _1442 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1320);
    float _1444 = -_122;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1338);
    float _1448 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1356);
    float _1450 = fma(_1440, _1440, _1430);
    float _1452 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1366);
    float _1454 = fma(_1442, _1340, _1446);
    float _1456 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1458 = _1450 + _1432;
    float _1460 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1462 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1464 = -_1452;
    float _1466 = fma(_1448, _1122, _1464);
    float _1468 = _866 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1470 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1334);
    float _1472 = sqrt(_1458);
    float _1474 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1462 * _1348;
    float _1478 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1480 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = _1454 + 0.5;
    float _1484 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1486 = _1466 + 0.5;
    out.m_63.x = _1372;
    out.m_63.y = _1476;
    out.m_63.z = _1482;
    bool _1488 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1490 = isnan(_1472);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1496 = _1492 || _1494;
    out.m_65.x = _1478;
    out.m_65.y = _1474;
    out.m_65.z = _1480;
    out.m_65.w = _1484;
    out.m_63.w = _1486;
    float _1498 = _1468;
    if (!_1496)
    {
        _1498 = 1.0;
    }
    float _1500 = _1498;
    bool _1502 = !_1496;
    float _1504 = _1500;
    if (!_1502)
    {
        bool _1506 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1508 = isnan(_1472);
        bool _1510 = _1506 || _1508;
        bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1514 = _1510 || _1512;
        if (!_1514)
        {
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = _1472 + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1526 = _1524 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1528 = 1.0 / _1522;
            float _1530 = _1518 * _1528;
            float _1532 = fma(_1530, _1526, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1504 = _1532;
            _1534 = true;
        }
        else
        {
            bool _1536 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1538 = isnan(_1472);
            bool _1540 = _1536 || _1538;
            bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1544 = _1540 || _1542;
            if (!_1544)
            {
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1472 + _1546;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1558 = 1.0 / _1552;
                float _1560 = _1548 * _1558;
                float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1504 = _1562;
                _1534 = true;
            }
            else
            {
                _1504 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1534 = false;
    float _1564 = _1504;
    float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1568 = _1428 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1572 = _1434 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1576 = _1436 + _1574;
    float _1578 = fma(_1568, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1580 = fma(_1572, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1582 = fma(_1576, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1584 = -_1022;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    float _1588 = -_1048;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1580);
    float _1592 = -_1068;
    float _1594 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1582);
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1598 = _1586 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1602 = _1590 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1606 = _1594 + _1604;
    float _1608 = _1598 * _1598;
    float _1610 = fma(_1602, _1602, _1608);
    float _1612 = fma(_1606, _1606, _1610);
    float _1614 = rsqrt(_1612);
    float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1618 = _1602 * _1616;
    float _1620 = _1606 * _1616;
    float _1622 = _1618 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 + _1624;
    float _1628 = sqrt(_1626);
    bool _1630 = _1628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = _1628 + _1632;
    float _1636 = _1606;
    float _1638 = _1626;
    float _1640 = _1634;
    float _1642 = _1582;
    float _1644 = _1618;
    if (_1630)
    {
        float _1646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1646;
    }
    float _1648 = _1636;
    if (_1630)
    {
        float _1650 = rsqrt(_1626);
        _1638 = _1650;
    }
    float _1652 = _1638;
    float _1654 = _1652;
    if (_1630)
    {
        float _1656 = _1634 * _1648;
        _1640 = _1656;
    }
    float _1658 = _1640;
    if (_1630)
    {
        float _1660 = _1658 * 0.15915493667125701904296875;
        _1130 = _1660;
    }
    float _1662 = _1130;
    float _1664 = _1614;
    float _1666 = _1662;
    if (_1630)
    {
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1664 = _1670;
    }
    float _1672 = _1664;
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1676 = precise::max(0.0, _1674);
    float _1678 = _1486;
    float _1680 = _1676;
    float _1682 = _1674;
    if (_1630)
    {
        float _1684 = _1662 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        _1678 = _1686;
    }
    float _1688 = _1678;
    float _1690 = -_1616;
    float _1692 = -_1676;
    float _1694 = fma(_1598, _1690, _1692);
    if (_1630)
    {
        float _1696 = _1694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1680 = _1696;
    }
    float _1698 = _1680;
    float _1700 = sqrt(_1612);
    float _1702 = _1672;
    float _1704 = _1698;
    if (_1630)
    {
        float _1706 = fma(_1672, _1698, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1702 = _1706;
    }
    float _1708 = _1702;
    float _1710 = _1708;
    if (!_1630)
    {
        _1704 = _1620;
    }
    float _1712 = _1704;
    float _1714 = _1712;
    if (_1630)
    {
        float _1716 = _1688 + (-1.0);
        _1682 = _1716;
    }
    float _1718 = _1682;
    float _1720 = _1718;
    if (_1630)
    {
        float _1722 = _1652 * _1708;
        _1642 = _1722;
    }
    float _1724 = _1642;
    if (!_1630)
    {
        _1710 = _1694;
    }
    float _1726 = _1710;
    float _1728 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1730 = _1726;
    if (_1630)
    {
        float _1732 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1732;
    }
    float _1734 = _1666;
    if (_1630)
    {
        float _1736 = _1618 * _1724;
        _1644 = _1736;
    }
    float _1738 = _1644;
    if (!_1630)
    {
        _1654 = _1622;
    }
    float _1740 = _1654;
    float _1742 = _1740;
    if (_1630)
    {
        float _1744 = _1620 * _1724;
        _1714 = _1744;
    }
    float _1746 = _1714;
    if (_1630)
    {
        float _1748 = fma(_1694, _1688, _1734);
        _1730 = _1748;
    }
    float _1750 = _1730;
    if (_1630)
    {
        float _1752 = _1738 * _1738;
        _1742 = _1752;
    }
    float _1754 = _1742;
    if (!_1630)
    {
        _1720 = _1624;
    }
    float _1756 = _1720;
    float _1758 = _1756;
    if (_1630)
    {
        float _1760 = _1746 * _1746;
        _1758 = _1760;
    }
    float _1762 = _1758;
    float _1764 = fma(_1750, _1750, _1754);
    float _1766 = _1764 + _1762;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1770 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1768);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1776 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1778 = rsqrt(_1766);
    float _1780 = -_1772;
    float _1782 = _1780 + 1.0;
    float _1784 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1774);
    float _1786 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1788 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1790 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1784);
    float _1792 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1786);
    float _1794 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1788);
    float _1796 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1728);
    float _1798 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1800 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1792);
    float _1802 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1794);
    float _1804 = abs(_1782);
    float _1806 = log2(_1804);
    float _1808 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1810 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1812 = _1778 * _1738;
    float _1814 = _1778 * _1750;
    float _1816 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1818 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1820 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1822 = _1778 * _1746;
    float _1824 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1796);
    float _1826 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1818);
    float _1828 = -_1820;
    float _1830 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1828);
    float _1832 = -_1808;
    float _1834 = fma(_1832, _1776, 1.0);
    float _1836 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1838 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1826);
    float _1840 = -_1822;
    float _1842 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1830);
    float _1844 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1846 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1838);
    float _1850 = fma(_1842, -0.5, 0.5);
    float _1852 = log2(_1834);
    float _1854 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1856 = fma(_1842, 0.5, 0.5);
    float _1858 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1846);
    float _1860 = _1814 + 1.0;
    float _1862 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1854);
    float _1864 = fma(_1856, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1866 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1858);
    float _1868 = exp2(_1844);
    float _1870 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1862);
    float _1872 = fma(_1856, _1864, -0.212114393711090087890625);
    float _1874 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1876 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1870);
    float _1878 = fma(_1856, _1872, 1.570728778839111328125);
    float _1880 = 1.0 / _1848;
    float _1882 = _1852 * 0.693147182464599609375;
    float _1884 = sqrt(_1850);
    float _1886 = -_1814;
    float _1888 = fma(_1868, _1860, _1886);
    float _1890 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1892 = fma(_1888, 0.5, 0.5);
    float _1894 = _1874 * _1880;
    float _1896 = _1876 * _1880;
    float _1898 = fma(_1894, 0.5, 0.5);
    float _1900 = fma(_1896, -0.5, 0.5);
    float _1902 = _1884 * 0.636619746685028076171875;
    float _1904 = -_1878;
    float _1906 = fma(_1902, _1904, 1.0);
    float3 _5103 = float3(_1898, _1900, _1890);
    float _1908 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5103, float3(0.0), isnan(_5103)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5103, float3(0.0), isnan(_5103)), level(0.0)).x;
    float3 _5114 = float3(_1898, _1900, _1890);
    float4 _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5114, float3(0.0), isnan(_5114)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5114, float3(0.0), isnan(_5114)), level(0.0)).xyzw;
    float _1913 = _1911.x;
    float _1915 = _1911.y;
    float _1917 = _1911.z;
    float _1919 = _1911.w;
    float2 _5131 = float2(_1906, _1892);
    float3 _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5131, float2(0.0), isnan(_5131)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5131, float2(0.0), isnan(_5131)), level(0.0)).xyz;
    float _1925 = _1923.x;
    float _1927 = _1923.y;
    float _1929 = _1923.z;
    float _1931 = -_1022;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _920);
    float _1935 = -_1048;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _922);
    float _1939 = -_1068;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _1943 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1947 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1943);
    float _1949 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1945);
    float _1951 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1953 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1947);
    float _1955 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1949);
    float _1957 = exp2(_1951);
    float _1959 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1961 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1963 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(0.5);
    bool _1971 = _1967 || _1969;
    float _1973 = 1.0 / _1959;
    float _1975 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1977 = _1961 + _1959;
    float _1979 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1975);
    float _1981 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1979);
    float _1983 = _1941;
    if (_1971)
    {
        _1983 = 1.0;
    }
    float _1985 = _1983;
    float _1987 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1989 = _1977 * _1973;
    float _1991 = _1989 * 0.5;
    float _1993 = _1985;
    if (!_1971)
    {
        float _1995 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1999 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1997);
        float _2001 = _1995 * 0.15915493667125701904296875;
        float _2003 = _2001 * 6.283185482025146484375;
        float _2005 = cos(_2003);
        float _2007 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2009 = _2007 * 0.15915493667125701904296875;
        float _2011 = _2001 * 6.283185482025146484375;
        float _2013 = sin(_2011);
        float _2015 = 1.0 / _2005;
        float _2017 = _2009 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = _2013 * _2015;
        float _2023 = 1.0 / _1999;
        float _2025 = _2019 * _2021;
        float _2027 = _2009 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2031;
        float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2037 = _2023 * _2035;
        float _2039 = 1.0 / _2025;
        float _2041 = 1.0 / _2033;
        float _2043 = _2029 * _2039;
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2047 = fma(_2043, _2037, _2045);
        float _2049 = _2047 * _2041;
        float _2051 = precise::clamp(_2049, 0.0, 1.0);
        _1993 = _2051;
    }
    float _2053 = _1993;
    float _2055 = -_1957;
    float _2057 = _2055 + 1.0;
    float _2059 = _1987 + _1848;
    bool _2061 = _2053 > 0.0;
    bool _2063 = isnan(_2053);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(0.0);
    bool _2069 = _2065 || _2067;
    float _2071 = _2053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2073 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2075 = _2059 * 0.5;
    float _2077 = _2071 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2079 = _2073 * _1908;
    float _2081 = -_2073;
    float _2083 = _2081 + 1.0;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1876;
    out.gl_Position.z = _1987;
    out.gl_Position.w = _1848;
    float _2085 = _1919 * _2079;
    float _2087 = _1929 * _2079;
    out.m_67.z = _2075;
    out.m_67.w = _1848;
    float _2089 = fma(_1925, _2085, _1913);
    float _2091 = fma(_1927, _2085, _1915);
    float _2093 = _1919 * _2083;
    float _2095 = fma(_1919, _2087, _1917);
    out.m_47.x = _2077;
    out.m_69.x = _2089;
    out.m_69.y = _2091;
    out.m_69.z = _2095;
    out.m_69.w = _2093;
    if (_2069)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2097 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2097;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1534 = false;
    bool _888 = false;
    bool _720 = false;
    bool _578 = false;
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
        float _2154 = as_type<float>(_104);
        out.gl_Position.z = _2154;
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
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_140);
        out.gl_Position.z = _2222;
    }
    if (_134)
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
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
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
    float _358 = _350 * _338;
    float _360 = fma(_354, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = _356 * _338;
    float _364 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].x, _358);
    float _366 = _360 * _338;
    float _368 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _370 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].x, _364);
    float _372 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _374 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].z, _368);
    float _376 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
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
    float _408 = in.m_51.x;
    float _410 = in.m_51.y;
    float _412 = in.m_51.z;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _416 = _406 + _414;
    bool _418 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _420 = isnan(_406);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _438 = 1.0 / _432;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _442 = 1.0 / _436;
    float _444 = _374 * _412;
    bool _446 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _448 = isnan(_406);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = _416 * _438;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _462 = _406 + _460;
    bool _464 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _466 = isnan(_406);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -_428;
    float _478 = _476 + 1.0;
    float _480 = _376 * _410;
    float _482 = _370 * _408;
    float _484 = _474 * _478;
    float _486 = -_474;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _498;
    float _502 = _456 * _488;
    float _504 = fma(_492, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _506 = fma(_496, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = fma(_500, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _510 = _462 * _442;
    float _512 = _504 * _502;
    float _514 = _506 * _502;
    float _516 = _508 * _502;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _526 = -_456;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _536 = fma(_524, _510, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _538 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].x, _512);
    float _540 = fma(_532, _510, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].y, _514);
    float _544 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].z, _516);
    float _546 = fma(_534, _484, _538);
    float _548 = fma(_536, _484, _542);
    float _550 = fma(_540, _484, _544);
    float _552 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].x, _546);
    float _554 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].y, _548);
    float _556 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].z, _550);
    bool _558 = !_440;
    float _576;
    if (!_558)
    {
        float _560 = in.m_53.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_88);
        float _582 = 1.0 / _580;
        float _584 = _122 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _590 = _586 + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _596 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _598 = isnan(_586);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _612 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_586);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _624;
    bool _628 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _630 = isnan(_586);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = 1.0 / _594;
    float _642 = -_606;
    float _644 = _642 + 1.0;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _648 = _622 * _644;
    float _650 = -_622;
    float _652 = _650 + 1.0;
    float _654 = 1.0 / _610;
    float _656 = _626 * _640;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _662 = fma(_656, _590, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _664 = -_638;
    float _666 = _664 + 1.0;
    float _668 = _662 * _648;
    float _670 = _660 * _654;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = _586 + _672;
    float _676 = _606 * _666;
    float _678 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[115].x, _668);
    float _680 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_670, _674, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _684 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _686 = fma(_682, _676, _678);
    float _688 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[117].x, _686);
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _694 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _690;
    out.m_55.y = _696;
    out.m_55.z = _692;
    out.m_55.w = _698;
    bool _700 = !_646;
    float _718;
    if (!_700)
    {
        float _702 = in.m_53.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_88);
        float _724 = 1.0 / _722;
        float _726 = _122 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = _728 + _730;
    bool _734 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _736 = isnan(_728);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _728 + _746;
    bool _750 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _752 = isnan(_728);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _770 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _772 = isnan(_728);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -_744;
    float _784 = _782 + 1.0;
    float _786 = 1.0 / _768;
    float _788 = _780 * _784;
    float _790 = -_780;
    float _792 = _790 + 1.0;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _794;
    bool _798 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _800 = 1.0 / _764;
    float _802 = _760 * _792;
    float _804 = -_760;
    float _806 = _804 + 1.0;
    float _808 = _732 * _800;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _814;
    float _818 = fma(_796, _808, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _820 = fma(_812, _808, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _822 = fma(_816, _808, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _824 = _748 * _786;
    float _826 = _818 * _802;
    float _828 = _820 * _802;
    float _830 = _822 * _802;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _844 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[123].x, _826);
    float _846 = fma(_834, _824, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _848 = fma(_838, _824, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _850 = fma(_842, _824, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _852 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[123].y, _828);
    float _854 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[123].z, _830);
    float _856 = fma(_846, _788, _844);
    float _858 = fma(_848, _788, _852);
    float _860 = fma(_850, _788, _854);
    float _862 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[125].x, _856);
    float _864 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[125].y, _858);
    float _866 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[125].z, _860);
    bool _868 = !_798;
    float _886;
    if (!_868)
    {
        float _870 = in.m_53.x;
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _874 = _870 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _876 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _878 = _876 * _872;
        float _880 = floor(_878);
        float _882 = -_880;
        float _884 = _878 + _882;
        _886 = _884;
        _888 = true;
    }
    else
    {
        float _890 = float(_88);
        float _892 = 1.0 / _890;
        float _894 = _122 * _892;
        _886 = _894;
    }
    _888 = false;
    float _896 = _886;
    float _898 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _900 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _902 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _904 = in.m_53.w;
    float _906 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _898);
    float _908 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _900);
    float _910 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _902);
    float _912 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _906);
    float _914 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _908);
    float _916 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _910);
    float _918 = in.m_57.w;
    float _920 = _912 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _922 = _914 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _924 = _916 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _926 = in.m_59.x;
    float _928 = in.m_59.y;
    float _930 = in.m_59.z;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _920 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _938 = _922 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _942 = _924 + _940;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _946 = _944 != 0;
    float _948 = _934 * _934;
    float _950 = in.m_57.z;
    float _952 = fma(_938, _938, _948);
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _956 = _954 != 0;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _962 = _904 > 0.5;
    float _964 = fma(_942, _942, _952);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _970 = 1.0 / _960;
    float _972 = _904;
    float _974 = _918;
    float _976 = _950;
    if (_946)
    {
        float _978 = in.m_53.z;
        _972 = _978;
    }
    float _980 = _972;
    float _982 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _984 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = rsqrt(_964);
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _990 = _988 != 0;
    float _992 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1000 = _998 != 0;
    float _1002 = 1.0 / _968;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1006 = _1004 != 0;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _930);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _928);
    float _1012 = in.m_57.x;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _926);
    float _1016 = -_918;
    float _1018 = _1016 + 1.0;
    float _1020 = 1.0 / _996;
    float _1022 = _934 * _986;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1028 = _1014;
    float _1030 = _1010;
    float _1032 = _1012;
    if (_956)
    {
        float _1034 = _962 ? _1018 : _918;
        _974 = _1034;
    }
    float _1036 = _974;
    float _1038 = -_1022;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1042;
    float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1048 = _938 * _986;
    float _1050 = _1040 * _1040;
    float _1052 = 0.0;
    if (_1000)
    {
        float _1054 = in.m_53.x;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1058;
    float _1062 = -_1048;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _1066 = _1026 * _1002;
    float _1068 = _942 * _986;
    float _1070 = _1060 * _1020;
    float _1072 = fma(_1064, _1064, _1050);
    float _1074 = _1044 * _970;
    float _1076 = -_1068;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    bool _1080 = _980 > 0.5;
    bool _1082 = _1080 && _946;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1086 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1088 = isnan(_896);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = fma(_1078, _1078, _1072);
    float _1100 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1104 = _896 + _1102;
    bool _1106 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1108 = isnan(_896);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -_1096;
    float _1120 = _1118 + 1.0;
    float _1122 = fma(_1100, _1036, -0.5);
    float _1124 = fma(_1074, _1104, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1126 = sqrt(_1098);
    float _1128 = _1074;
    float _1130 = _1096;
    if (!_990)
    {
        float _1132 = in.m_53.y;
        _1128 = _1132;
    }
    float _1134 = _1128;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1138 = _896 + _1136;
    bool _1140 = _1056 > 0.5;
    bool _1142 = _1140 && _1000;
    float _1144 = fma(_1066, _1138, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1146 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1148 = isnan(_896);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1116 * _1120;
    float _1160 = -_1116;
    float _1162 = _1160 + 1.0;
    bool _1164 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1166 = isnan(_896);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1178 = _896 + _1176;
    float _1180 = -_1156;
    float _1182 = _1180 + 1.0;
    float _1184 = _1156 * _1162;
    float _1186 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1188 = fma(_1070, _1178, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1190 = _986 * _1126;
    float _1192 = _1174 * _1182;
    float _1194 = -_1174;
    float _1196 = _1194 + 1.0;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1200 = _982 * _1190;
    float _1202 = _984 * _1190;
    float _1204 = _992 * _1190;
    float _1206 = _1124 * _1192;
    float _1208 = _1200 * _1014;
    float _1210 = _1190;
    float _1212 = _1158;
    if (!_990)
    {
        _1028 = _1134;
    }
    float _1214 = _1028;
    float _1216 = _1202 * _1010;
    float _1218 = _1204 * _1008;
    float _1220 = _1192;
    if (!_990)
    {
        float _1222 = in.m_53.z;
        _1220 = _1222;
    }
    float _1224 = _1220;
    if (_946)
    {
        _1210 = _950;
    }
    float _1226 = _1210;
    float _1228 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1232 = _1214;
    float _1234 = _1134;
    float _1236 = _1226;
    if (_990)
    {
        float _1238 = in.m_53.x;
        float _1240 = in.m_53.y;
        _1232 = _1238;
        _1234 = _1240;
    }
    float _1242 = _1232;
    float _1244 = _1234;
    if (_1000)
    {
        _1030 = _1012;
    }
    float _1246 = _1030;
    float _1248 = fma(_1208, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1228);
    float _1250 = fma(_1208, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1230);
    float _1252 = _1246;
    if (_1082)
    {
        float _1254 = -_1226;
        float _1256 = _1254 + 1.0;
        _1236 = _1256;
    }
    float _1258 = _1236;
    float _1260 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1248);
    float _1262 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1250);
    if (_1142)
    {
        float _1264 = -_1246;
        float _1266 = _1264 + 1.0;
        _1252 = _1266;
    }
    float _1268 = _1252;
    if (_946)
    {
        _976 = _1258;
    }
    float _1270 = _976;
    float _1272 = _922 + _1260;
    float _1274 = _924 + _1262;
    float _1276 = in.m_57.y;
    float _1278 = _1272;
    float _1280 = _1274;
    if (_1000)
    {
        _1032 = _1268;
    }
    float _1282 = _1032;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1286 = _1272 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1274 + _1288;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1294 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1206);
    float _1296 = _1286 * _1286;
    float _1298 = _1290 * _1290;
    float _1300 = 0.0;
    float _1302 = _1224;
    float _1304 = _1296;
    float _1306 = _1298;
    if (!_990)
    {
        _1300 = _1224;
    }
    float _1308 = _1300;
    float _1310 = fma(_1144, _1184, _1294);
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1314 = _1296 + _1298;
    float _1316 = _1308;
    if (_990)
    {
        _1316 = _1244;
    }
    float _1318 = _1316;
    float _1320 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1292);
    if (_990)
    {
        _1302 = _1244;
    }
    float _1322 = _1302;
    float _1324 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1326 = _1244 > 0.5;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1330 = sqrt(_1314);
    float _1332 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1334 = fma(_1188, _1158, _1310);
    float _1336 = -_1328;
    float _1338 = fma(_1324, 2.0, _1336);
    float _1340 = fma(_1186, _1270, -0.5);
    float _1342 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1344 = -_1276;
    float _1346 = _1344 + 1.0;
    float _1348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1350 = fma(_1208, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1342);
    float _1352 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1356 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1312);
    float _1358 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1350);
    float _1360 = _1276;
    if (_1006)
    {
        float _1362 = _1326 ? _1346 : _1276;
        _1360 = _1362;
    }
    float _1364 = _1360;
    float _1366 = fma(_1352, -2.0, _1354);
    bool _1368 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1370 = _920 + _1358;
    float _1372 = _1332 * _1198;
    if (!_1368)
    {
        _1212 = _1370;
    }
    float _1374 = _1212;
    bool _1376 = !_1368;
    float _1378 = _1374;
    if (!_1376)
    {
        float _1380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1384 = _1330 + _1382;
        float _1386 = _1370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = rsqrt(_1314);
        float _1390 = _1384 * _1380;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = _1392 * 6.283185482025146484375;
        float _1396 = sin(_1394);
        float _1398 = _1392 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = fma(_1396, _1386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1404 = _1388 * _1402;
        float _1406 = fma(_1286, _1404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1408 = _1400 + (-1.0);
        float _1410 = fma(_1290, _1404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1414 = _1406 + _1412;
        float _1416 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1420 = _1410 + _1418;
        float _1422 = _1414 * _1414;
        float _1424 = fma(_1370, _1400, _1416);
        float _1426 = _1420 * _1420;
        _1378 = _1424;
        _1304 = _1422;
        _1306 = _1426;
        _1278 = _1406;
        _1280 = _1410;
    }
    float _1428 = _1378;
    float _1430 = _1304;
    float _1432 = _1306;
    float _1434 = _1278;
    float _1436 = _1280;
    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1440 = _1428 + _1438;
    float _1442 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1320);
    float _1444 = -_122;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1338);
    float _1448 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1356);
    float _1450 = fma(_1440, _1440, _1430);
    float _1452 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1366);
    float _1454 = fma(_1442, _1340, _1446);
    float _1456 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1458 = _1450 + _1432;
    float _1460 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1462 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1464 = -_1452;
    float _1466 = fma(_1448, _1122, _1464);
    float _1468 = _866 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1470 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1334);
    float _1472 = sqrt(_1458);
    float _1474 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1462 * _1348;
    float _1478 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1480 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = _1454 + 0.5;
    float _1484 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1486 = _1466 + 0.5;
    out.m_63.x = _1372;
    out.m_63.y = _1476;
    out.m_63.z = _1482;
    bool _1488 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1490 = isnan(_1472);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1496 = _1492 || _1494;
    out.m_65.x = _1478;
    out.m_65.y = _1474;
    out.m_65.z = _1480;
    out.m_65.w = _1484;
    out.m_63.w = _1486;
    float _1498 = _1468;
    if (!_1496)
    {
        _1498 = 1.0;
    }
    float _1500 = _1498;
    bool _1502 = !_1496;
    float _1504 = _1500;
    if (!_1502)
    {
        bool _1506 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1508 = isnan(_1472);
        bool _1510 = _1506 || _1508;
        bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1514 = _1510 || _1512;
        if (!_1514)
        {
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = _1472 + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1526 = _1524 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1528 = 1.0 / _1522;
            float _1530 = _1518 * _1528;
            float _1532 = fma(_1530, _1526, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1504 = _1532;
            _1534 = true;
        }
        else
        {
            bool _1536 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1538 = isnan(_1472);
            bool _1540 = _1536 || _1538;
            bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1544 = _1540 || _1542;
            if (!_1544)
            {
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1472 + _1546;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1558 = 1.0 / _1552;
                float _1560 = _1548 * _1558;
                float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1504 = _1562;
                _1534 = true;
            }
            else
            {
                _1504 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1534 = false;
    float _1564 = _1504;
    float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1568 = _1428 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1572 = _1434 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1576 = _1436 + _1574;
    float _1578 = fma(_1568, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1580 = fma(_1572, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1582 = fma(_1576, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1584 = -_1022;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    float _1588 = -_1048;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1580);
    float _1592 = -_1068;
    float _1594 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1582);
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1598 = _1586 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1602 = _1590 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1606 = _1594 + _1604;
    float _1608 = _1598 * _1598;
    float _1610 = fma(_1602, _1602, _1608);
    float _1612 = fma(_1606, _1606, _1610);
    float _1614 = rsqrt(_1612);
    float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1618 = _1602 * _1616;
    float _1620 = _1606 * _1616;
    float _1622 = _1618 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 + _1624;
    float _1628 = sqrt(_1626);
    bool _1630 = _1628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = _1628 + _1632;
    float _1636 = _1606;
    float _1638 = _1626;
    float _1640 = _1634;
    float _1642 = _1582;
    float _1644 = _1618;
    if (_1630)
    {
        float _1646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1646;
    }
    float _1648 = _1636;
    if (_1630)
    {
        float _1650 = rsqrt(_1626);
        _1638 = _1650;
    }
    float _1652 = _1638;
    float _1654 = _1652;
    if (_1630)
    {
        float _1656 = _1634 * _1648;
        _1640 = _1656;
    }
    float _1658 = _1640;
    if (_1630)
    {
        float _1660 = _1658 * 0.15915493667125701904296875;
        _1130 = _1660;
    }
    float _1662 = _1130;
    float _1664 = _1614;
    float _1666 = _1662;
    if (_1630)
    {
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1664 = _1670;
    }
    float _1672 = _1664;
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1676 = precise::max(0.0, _1674);
    float _1678 = _1486;
    float _1680 = _1676;
    float _1682 = _1674;
    if (_1630)
    {
        float _1684 = _1662 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        _1678 = _1686;
    }
    float _1688 = _1678;
    float _1690 = -_1616;
    float _1692 = -_1676;
    float _1694 = fma(_1598, _1690, _1692);
    if (_1630)
    {
        float _1696 = _1694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1680 = _1696;
    }
    float _1698 = _1680;
    float _1700 = sqrt(_1612);
    float _1702 = _1672;
    float _1704 = _1698;
    if (_1630)
    {
        float _1706 = fma(_1672, _1698, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1702 = _1706;
    }
    float _1708 = _1702;
    float _1710 = _1708;
    if (!_1630)
    {
        _1704 = _1620;
    }
    float _1712 = _1704;
    float _1714 = _1712;
    if (_1630)
    {
        float _1716 = _1688 + (-1.0);
        _1682 = _1716;
    }
    float _1718 = _1682;
    float _1720 = _1718;
    if (_1630)
    {
        float _1722 = _1652 * _1708;
        _1642 = _1722;
    }
    float _1724 = _1642;
    if (!_1630)
    {
        _1710 = _1694;
    }
    float _1726 = _1710;
    float _1728 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1730 = _1726;
    if (_1630)
    {
        float _1732 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1732;
    }
    float _1734 = _1666;
    if (_1630)
    {
        float _1736 = _1618 * _1724;
        _1644 = _1736;
    }
    float _1738 = _1644;
    if (!_1630)
    {
        _1654 = _1622;
    }
    float _1740 = _1654;
    float _1742 = _1740;
    if (_1630)
    {
        float _1744 = _1620 * _1724;
        _1714 = _1744;
    }
    float _1746 = _1714;
    if (_1630)
    {
        float _1748 = fma(_1694, _1688, _1734);
        _1730 = _1748;
    }
    float _1750 = _1730;
    if (_1630)
    {
        float _1752 = _1738 * _1738;
        _1742 = _1752;
    }
    float _1754 = _1742;
    if (!_1630)
    {
        _1720 = _1624;
    }
    float _1756 = _1720;
    float _1758 = _1756;
    if (_1630)
    {
        float _1760 = _1746 * _1746;
        _1758 = _1760;
    }
    float _1762 = _1758;
    float _1764 = fma(_1750, _1750, _1754);
    float _1766 = _1764 + _1762;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1770 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1768);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1776 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1778 = rsqrt(_1766);
    float _1780 = -_1772;
    float _1782 = _1780 + 1.0;
    float _1784 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1774);
    float _1786 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1788 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1790 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1784);
    float _1792 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1786);
    float _1794 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1788);
    float _1796 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1728);
    float _1798 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1800 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1792);
    float _1802 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1794);
    float _1804 = abs(_1782);
    float _1806 = log2(_1804);
    float _1808 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1810 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1812 = _1778 * _1738;
    float _1814 = _1778 * _1750;
    float _1816 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1818 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1820 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1822 = _1778 * _1746;
    float _1824 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1796);
    float _1826 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1818);
    float _1828 = -_1820;
    float _1830 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1828);
    float _1832 = -_1808;
    float _1834 = fma(_1832, _1776, 1.0);
    float _1836 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1838 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1826);
    float _1840 = -_1822;
    float _1842 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1830);
    float _1844 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1846 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1838);
    float _1850 = fma(_1842, -0.5, 0.5);
    float _1852 = log2(_1834);
    float _1854 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1856 = fma(_1842, 0.5, 0.5);
    float _1858 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1846);
    float _1860 = _1814 + 1.0;
    float _1862 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1854);
    float _1864 = fma(_1856, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1866 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1858);
    float _1868 = exp2(_1844);
    float _1870 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1862);
    float _1872 = fma(_1856, _1864, -0.212114393711090087890625);
    float _1874 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1876 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1870);
    float _1878 = fma(_1856, _1872, 1.570728778839111328125);
    float _1880 = 1.0 / _1848;
    float _1882 = _1852 * 0.693147182464599609375;
    float _1884 = sqrt(_1850);
    float _1886 = -_1814;
    float _1888 = fma(_1868, _1860, _1886);
    float _1890 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1892 = fma(_1888, 0.5, 0.5);
    float _1894 = _1874 * _1880;
    float _1896 = _1876 * _1880;
    float _1898 = fma(_1894, 0.5, 0.5);
    float _1900 = fma(_1896, -0.5, 0.5);
    float _1902 = _1884 * 0.636619746685028076171875;
    float _1904 = -_1878;
    float _1906 = fma(_1902, _1904, 1.0);
    float3 _5103 = float3(_1898, _1900, _1890);
    float _1908 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5103, float3(0.0), isnan(_5103)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5103, float3(0.0), isnan(_5103)), level(0.0)).x;
    float3 _5114 = float3(_1898, _1900, _1890);
    float4 _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5114, float3(0.0), isnan(_5114)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5114, float3(0.0), isnan(_5114)), level(0.0)).xyzw;
    float _1913 = _1911.x;
    float _1915 = _1911.y;
    float _1917 = _1911.z;
    float _1919 = _1911.w;
    float2 _5131 = float2(_1906, _1892);
    float3 _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5131, float2(0.0), isnan(_5131)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5131, float2(0.0), isnan(_5131)), level(0.0)).xyz;
    float _1925 = _1923.x;
    float _1927 = _1923.y;
    float _1929 = _1923.z;
    float _1931 = -_1022;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _920);
    float _1935 = -_1048;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _922);
    float _1939 = -_1068;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _1943 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1947 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1943);
    float _1949 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1945);
    float _1951 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1953 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1947);
    float _1955 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1949);
    float _1957 = exp2(_1951);
    float _1959 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1961 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1963 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(0.5);
    bool _1971 = _1967 || _1969;
    float _1973 = 1.0 / _1959;
    float _1975 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1977 = _1961 + _1959;
    float _1979 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1975);
    float _1981 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1979);
    float _1983 = _1941;
    if (_1971)
    {
        _1983 = 1.0;
    }
    float _1985 = _1983;
    float _1987 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1989 = _1977 * _1973;
    float _1991 = _1989 * 0.5;
    float _1993 = _1985;
    if (!_1971)
    {
        float _1995 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1999 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1997);
        float _2001 = _1995 * 0.15915493667125701904296875;
        float _2003 = _2001 * 6.283185482025146484375;
        float _2005 = cos(_2003);
        float _2007 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2009 = _2007 * 0.15915493667125701904296875;
        float _2011 = _2001 * 6.283185482025146484375;
        float _2013 = sin(_2011);
        float _2015 = 1.0 / _2005;
        float _2017 = _2009 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = _2013 * _2015;
        float _2023 = 1.0 / _1999;
        float _2025 = _2019 * _2021;
        float _2027 = _2009 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2031;
        float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2037 = _2023 * _2035;
        float _2039 = 1.0 / _2025;
        float _2041 = 1.0 / _2033;
        float _2043 = _2029 * _2039;
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2047 = fma(_2043, _2037, _2045);
        float _2049 = _2047 * _2041;
        float _2051 = precise::clamp(_2049, 0.0, 1.0);
        _1993 = _2051;
    }
    float _2053 = _1993;
    float _2055 = -_1957;
    float _2057 = _2055 + 1.0;
    float _2059 = _1987 + _1848;
    bool _2061 = _2053 > 0.0;
    bool _2063 = isnan(_2053);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(0.0);
    bool _2069 = _2065 || _2067;
    float _2071 = _2053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2073 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2075 = _2059 * 0.5;
    float _2077 = _2071 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2079 = _2073 * _1908;
    float _2081 = -_2073;
    float _2083 = _2081 + 1.0;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1876;
    out.gl_Position.z = _1987;
    out.gl_Position.w = _1848;
    float _2085 = _1919 * _2079;
    float _2087 = _1929 * _2079;
    out.m_67.z = _2075;
    out.m_67.w = _1848;
    float _2089 = fma(_1925, _2085, _1913);
    float _2091 = fma(_1927, _2085, _1915);
    float _2093 = _1919 * _2083;
    float _2095 = fma(_1919, _2087, _1917);
    out.m_47.x = _2077;
    out.m_69.x = _2089;
    out.m_69.y = _2091;
    out.m_69.z = _2095;
    out.m_69.w = _2093;
    if (_2069)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2097 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2097;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1534 = false;
    bool _888 = false;
    bool _720 = false;
    bool _578 = false;
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
        float _2154 = as_type<float>(_104);
        out.gl_Position.z = _2154;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_140);
        out.gl_Position.z = _2222;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
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
    float _358 = _350 * _338;
    float _360 = fma(_354, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = _356 * _338;
    float _364 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].x, _358);
    float _366 = _360 * _338;
    float _368 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _370 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].x, _364);
    float _372 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _374 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].z, _368);
    float _376 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
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
    float _408 = in.m_51.x;
    float _410 = in.m_51.y;
    float _412 = in.m_51.z;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _416 = _406 + _414;
    bool _418 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _420 = isnan(_406);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _438 = 1.0 / _432;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _442 = 1.0 / _436;
    float _444 = _374 * _412;
    bool _446 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _448 = isnan(_406);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = _416 * _438;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _462 = _406 + _460;
    bool _464 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _466 = isnan(_406);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -_428;
    float _478 = _476 + 1.0;
    float _480 = _376 * _410;
    float _482 = _370 * _408;
    float _484 = _474 * _478;
    float _486 = -_474;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _498;
    float _502 = _456 * _488;
    float _504 = fma(_492, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _506 = fma(_496, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = fma(_500, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _510 = _462 * _442;
    float _512 = _504 * _502;
    float _514 = _506 * _502;
    float _516 = _508 * _502;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _526 = -_456;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _536 = fma(_524, _510, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _538 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].x, _512);
    float _540 = fma(_532, _510, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].y, _514);
    float _544 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].z, _516);
    float _546 = fma(_534, _484, _538);
    float _548 = fma(_536, _484, _542);
    float _550 = fma(_540, _484, _544);
    float _552 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].x, _546);
    float _554 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].y, _548);
    float _556 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].z, _550);
    bool _558 = !_440;
    float _576;
    if (!_558)
    {
        float _560 = in.m_53.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_88);
        float _582 = 1.0 / _580;
        float _584 = _122 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _590 = _586 + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _596 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _598 = isnan(_586);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _612 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_586);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _624;
    bool _628 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _630 = isnan(_586);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = 1.0 / _594;
    float _642 = -_606;
    float _644 = _642 + 1.0;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _648 = _622 * _644;
    float _650 = -_622;
    float _652 = _650 + 1.0;
    float _654 = 1.0 / _610;
    float _656 = _626 * _640;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _662 = fma(_656, _590, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _664 = -_638;
    float _666 = _664 + 1.0;
    float _668 = _662 * _648;
    float _670 = _660 * _654;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = _586 + _672;
    float _676 = _606 * _666;
    float _678 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[115].x, _668);
    float _680 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_670, _674, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _684 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _686 = fma(_682, _676, _678);
    float _688 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[117].x, _686);
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _694 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _690;
    out.m_55.y = _696;
    out.m_55.z = _692;
    out.m_55.w = _698;
    bool _700 = !_646;
    float _718;
    if (!_700)
    {
        float _702 = in.m_53.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_88);
        float _724 = 1.0 / _722;
        float _726 = _122 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = _728 + _730;
    bool _734 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _736 = isnan(_728);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _728 + _746;
    bool _750 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _752 = isnan(_728);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _770 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _772 = isnan(_728);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -_744;
    float _784 = _782 + 1.0;
    float _786 = 1.0 / _768;
    float _788 = _780 * _784;
    float _790 = -_780;
    float _792 = _790 + 1.0;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _794;
    bool _798 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _800 = 1.0 / _764;
    float _802 = _760 * _792;
    float _804 = -_760;
    float _806 = _804 + 1.0;
    float _808 = _732 * _800;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _814;
    float _818 = fma(_796, _808, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _820 = fma(_812, _808, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _822 = fma(_816, _808, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _824 = _748 * _786;
    float _826 = _818 * _802;
    float _828 = _820 * _802;
    float _830 = _822 * _802;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _844 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[123].x, _826);
    float _846 = fma(_834, _824, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _848 = fma(_838, _824, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _850 = fma(_842, _824, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _852 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[123].y, _828);
    float _854 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[123].z, _830);
    float _856 = fma(_846, _788, _844);
    float _858 = fma(_848, _788, _852);
    float _860 = fma(_850, _788, _854);
    float _862 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[125].x, _856);
    float _864 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[125].y, _858);
    float _866 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[125].z, _860);
    bool _868 = !_798;
    float _886;
    if (!_868)
    {
        float _870 = in.m_53.x;
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _874 = _870 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _876 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _878 = _876 * _872;
        float _880 = floor(_878);
        float _882 = -_880;
        float _884 = _878 + _882;
        _886 = _884;
        _888 = true;
    }
    else
    {
        float _890 = float(_88);
        float _892 = 1.0 / _890;
        float _894 = _122 * _892;
        _886 = _894;
    }
    _888 = false;
    float _896 = _886;
    float _898 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _900 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _902 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _904 = in.m_53.w;
    float _906 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _898);
    float _908 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _900);
    float _910 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _902);
    float _912 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _906);
    float _914 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _908);
    float _916 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _910);
    float _918 = in.m_57.w;
    float _920 = _912 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _922 = _914 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _924 = _916 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _926 = in.m_59.x;
    float _928 = in.m_59.y;
    float _930 = in.m_59.z;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _920 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _938 = _922 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _942 = _924 + _940;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _946 = _944 != 0;
    float _948 = _934 * _934;
    float _950 = in.m_57.z;
    float _952 = fma(_938, _938, _948);
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _956 = _954 != 0;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _962 = _904 > 0.5;
    float _964 = fma(_942, _942, _952);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _970 = 1.0 / _960;
    float _972 = _904;
    float _974 = _918;
    float _976 = _950;
    if (_946)
    {
        float _978 = in.m_53.z;
        _972 = _978;
    }
    float _980 = _972;
    float _982 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _984 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = rsqrt(_964);
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _990 = _988 != 0;
    float _992 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1000 = _998 != 0;
    float _1002 = 1.0 / _968;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1006 = _1004 != 0;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _930);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _928);
    float _1012 = in.m_57.x;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _926);
    float _1016 = -_918;
    float _1018 = _1016 + 1.0;
    float _1020 = 1.0 / _996;
    float _1022 = _934 * _986;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1028 = _1014;
    float _1030 = _1010;
    float _1032 = _1012;
    if (_956)
    {
        float _1034 = _962 ? _1018 : _918;
        _974 = _1034;
    }
    float _1036 = _974;
    float _1038 = -_1022;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1042;
    float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1048 = _938 * _986;
    float _1050 = _1040 * _1040;
    float _1052 = 0.0;
    if (_1000)
    {
        float _1054 = in.m_53.x;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1058;
    float _1062 = -_1048;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _1066 = _1026 * _1002;
    float _1068 = _942 * _986;
    float _1070 = _1060 * _1020;
    float _1072 = fma(_1064, _1064, _1050);
    float _1074 = _1044 * _970;
    float _1076 = -_1068;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    bool _1080 = _980 > 0.5;
    bool _1082 = _1080 && _946;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1086 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1088 = isnan(_896);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = fma(_1078, _1078, _1072);
    float _1100 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1104 = _896 + _1102;
    bool _1106 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1108 = isnan(_896);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -_1096;
    float _1120 = _1118 + 1.0;
    float _1122 = fma(_1100, _1036, -0.5);
    float _1124 = fma(_1074, _1104, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1126 = sqrt(_1098);
    float _1128 = _1074;
    float _1130 = _1096;
    if (!_990)
    {
        float _1132 = in.m_53.y;
        _1128 = _1132;
    }
    float _1134 = _1128;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1138 = _896 + _1136;
    bool _1140 = _1056 > 0.5;
    bool _1142 = _1140 && _1000;
    float _1144 = fma(_1066, _1138, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1146 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1148 = isnan(_896);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1116 * _1120;
    float _1160 = -_1116;
    float _1162 = _1160 + 1.0;
    bool _1164 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1166 = isnan(_896);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1178 = _896 + _1176;
    float _1180 = -_1156;
    float _1182 = _1180 + 1.0;
    float _1184 = _1156 * _1162;
    float _1186 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1188 = fma(_1070, _1178, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1190 = _986 * _1126;
    float _1192 = _1174 * _1182;
    float _1194 = -_1174;
    float _1196 = _1194 + 1.0;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1200 = _982 * _1190;
    float _1202 = _984 * _1190;
    float _1204 = _992 * _1190;
    float _1206 = _1124 * _1192;
    float _1208 = _1200 * _1014;
    float _1210 = _1190;
    float _1212 = _1158;
    if (!_990)
    {
        _1028 = _1134;
    }
    float _1214 = _1028;
    float _1216 = _1202 * _1010;
    float _1218 = _1204 * _1008;
    float _1220 = _1192;
    if (!_990)
    {
        float _1222 = in.m_53.z;
        _1220 = _1222;
    }
    float _1224 = _1220;
    if (_946)
    {
        _1210 = _950;
    }
    float _1226 = _1210;
    float _1228 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1232 = _1214;
    float _1234 = _1134;
    float _1236 = _1226;
    if (_990)
    {
        float _1238 = in.m_53.x;
        float _1240 = in.m_53.y;
        _1232 = _1238;
        _1234 = _1240;
    }
    float _1242 = _1232;
    float _1244 = _1234;
    if (_1000)
    {
        _1030 = _1012;
    }
    float _1246 = _1030;
    float _1248 = fma(_1208, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1228);
    float _1250 = fma(_1208, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1230);
    float _1252 = _1246;
    if (_1082)
    {
        float _1254 = -_1226;
        float _1256 = _1254 + 1.0;
        _1236 = _1256;
    }
    float _1258 = _1236;
    float _1260 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1248);
    float _1262 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1250);
    if (_1142)
    {
        float _1264 = -_1246;
        float _1266 = _1264 + 1.0;
        _1252 = _1266;
    }
    float _1268 = _1252;
    if (_946)
    {
        _976 = _1258;
    }
    float _1270 = _976;
    float _1272 = _922 + _1260;
    float _1274 = _924 + _1262;
    float _1276 = in.m_57.y;
    float _1278 = _1272;
    float _1280 = _1274;
    if (_1000)
    {
        _1032 = _1268;
    }
    float _1282 = _1032;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1286 = _1272 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1274 + _1288;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1294 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1206);
    float _1296 = _1286 * _1286;
    float _1298 = _1290 * _1290;
    float _1300 = 0.0;
    float _1302 = _1224;
    float _1304 = _1296;
    float _1306 = _1298;
    if (!_990)
    {
        _1300 = _1224;
    }
    float _1308 = _1300;
    float _1310 = fma(_1144, _1184, _1294);
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1314 = _1296 + _1298;
    float _1316 = _1308;
    if (_990)
    {
        _1316 = _1244;
    }
    float _1318 = _1316;
    float _1320 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1292);
    if (_990)
    {
        _1302 = _1244;
    }
    float _1322 = _1302;
    float _1324 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1326 = _1244 > 0.5;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1330 = sqrt(_1314);
    float _1332 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1334 = fma(_1188, _1158, _1310);
    float _1336 = -_1328;
    float _1338 = fma(_1324, 2.0, _1336);
    float _1340 = fma(_1186, _1270, -0.5);
    float _1342 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1344 = -_1276;
    float _1346 = _1344 + 1.0;
    float _1348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1350 = fma(_1208, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1342);
    float _1352 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1356 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1312);
    float _1358 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1350);
    float _1360 = _1276;
    if (_1006)
    {
        float _1362 = _1326 ? _1346 : _1276;
        _1360 = _1362;
    }
    float _1364 = _1360;
    float _1366 = fma(_1352, -2.0, _1354);
    bool _1368 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1370 = _920 + _1358;
    float _1372 = _1332 * _1198;
    if (!_1368)
    {
        _1212 = _1370;
    }
    float _1374 = _1212;
    bool _1376 = !_1368;
    float _1378 = _1374;
    if (!_1376)
    {
        float _1380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1384 = _1330 + _1382;
        float _1386 = _1370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = rsqrt(_1314);
        float _1390 = _1384 * _1380;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = _1392 * 6.283185482025146484375;
        float _1396 = sin(_1394);
        float _1398 = _1392 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = fma(_1396, _1386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1404 = _1388 * _1402;
        float _1406 = fma(_1286, _1404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1408 = _1400 + (-1.0);
        float _1410 = fma(_1290, _1404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1414 = _1406 + _1412;
        float _1416 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1420 = _1410 + _1418;
        float _1422 = _1414 * _1414;
        float _1424 = fma(_1370, _1400, _1416);
        float _1426 = _1420 * _1420;
        _1378 = _1424;
        _1304 = _1422;
        _1306 = _1426;
        _1278 = _1406;
        _1280 = _1410;
    }
    float _1428 = _1378;
    float _1430 = _1304;
    float _1432 = _1306;
    float _1434 = _1278;
    float _1436 = _1280;
    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1440 = _1428 + _1438;
    float _1442 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1320);
    float _1444 = -_122;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1338);
    float _1448 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1356);
    float _1450 = fma(_1440, _1440, _1430);
    float _1452 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1366);
    float _1454 = fma(_1442, _1340, _1446);
    float _1456 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1458 = _1450 + _1432;
    float _1460 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1462 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1464 = -_1452;
    float _1466 = fma(_1448, _1122, _1464);
    float _1468 = _866 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1470 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1334);
    float _1472 = sqrt(_1458);
    float _1474 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1462 * _1348;
    float _1478 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1480 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = _1454 + 0.5;
    float _1484 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1486 = _1466 + 0.5;
    out.m_63.x = _1372;
    out.m_63.y = _1476;
    out.m_63.z = _1482;
    bool _1488 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1490 = isnan(_1472);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1496 = _1492 || _1494;
    out.m_65.x = _1478;
    out.m_65.y = _1474;
    out.m_65.z = _1480;
    out.m_65.w = _1484;
    out.m_63.w = _1486;
    float _1498 = _1468;
    if (!_1496)
    {
        _1498 = 1.0;
    }
    float _1500 = _1498;
    bool _1502 = !_1496;
    float _1504 = _1500;
    if (!_1502)
    {
        bool _1506 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1508 = isnan(_1472);
        bool _1510 = _1506 || _1508;
        bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1514 = _1510 || _1512;
        if (!_1514)
        {
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = _1472 + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1526 = _1524 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1528 = 1.0 / _1522;
            float _1530 = _1518 * _1528;
            float _1532 = fma(_1530, _1526, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1504 = _1532;
            _1534 = true;
        }
        else
        {
            bool _1536 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1538 = isnan(_1472);
            bool _1540 = _1536 || _1538;
            bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1544 = _1540 || _1542;
            if (!_1544)
            {
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1472 + _1546;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1558 = 1.0 / _1552;
                float _1560 = _1548 * _1558;
                float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1504 = _1562;
                _1534 = true;
            }
            else
            {
                _1504 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1534 = false;
    float _1564 = _1504;
    float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1568 = _1428 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1572 = _1434 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1576 = _1436 + _1574;
    float _1578 = fma(_1568, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1580 = fma(_1572, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1582 = fma(_1576, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1584 = -_1022;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    float _1588 = -_1048;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1580);
    float _1592 = -_1068;
    float _1594 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1582);
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1598 = _1586 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1602 = _1590 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1606 = _1594 + _1604;
    float _1608 = _1598 * _1598;
    float _1610 = fma(_1602, _1602, _1608);
    float _1612 = fma(_1606, _1606, _1610);
    float _1614 = rsqrt(_1612);
    float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1618 = _1602 * _1616;
    float _1620 = _1606 * _1616;
    float _1622 = _1618 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 + _1624;
    float _1628 = sqrt(_1626);
    bool _1630 = _1628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = _1628 + _1632;
    float _1636 = _1606;
    float _1638 = _1626;
    float _1640 = _1634;
    float _1642 = _1582;
    float _1644 = _1618;
    if (_1630)
    {
        float _1646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1646;
    }
    float _1648 = _1636;
    if (_1630)
    {
        float _1650 = rsqrt(_1626);
        _1638 = _1650;
    }
    float _1652 = _1638;
    float _1654 = _1652;
    if (_1630)
    {
        float _1656 = _1634 * _1648;
        _1640 = _1656;
    }
    float _1658 = _1640;
    if (_1630)
    {
        float _1660 = _1658 * 0.15915493667125701904296875;
        _1130 = _1660;
    }
    float _1662 = _1130;
    float _1664 = _1614;
    float _1666 = _1662;
    if (_1630)
    {
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1664 = _1670;
    }
    float _1672 = _1664;
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1676 = precise::max(0.0, _1674);
    float _1678 = _1486;
    float _1680 = _1676;
    float _1682 = _1674;
    if (_1630)
    {
        float _1684 = _1662 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        _1678 = _1686;
    }
    float _1688 = _1678;
    float _1690 = -_1616;
    float _1692 = -_1676;
    float _1694 = fma(_1598, _1690, _1692);
    if (_1630)
    {
        float _1696 = _1694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1680 = _1696;
    }
    float _1698 = _1680;
    float _1700 = sqrt(_1612);
    float _1702 = _1672;
    float _1704 = _1698;
    if (_1630)
    {
        float _1706 = fma(_1672, _1698, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1702 = _1706;
    }
    float _1708 = _1702;
    float _1710 = _1708;
    if (!_1630)
    {
        _1704 = _1620;
    }
    float _1712 = _1704;
    float _1714 = _1712;
    if (_1630)
    {
        float _1716 = _1688 + (-1.0);
        _1682 = _1716;
    }
    float _1718 = _1682;
    float _1720 = _1718;
    if (_1630)
    {
        float _1722 = _1652 * _1708;
        _1642 = _1722;
    }
    float _1724 = _1642;
    if (!_1630)
    {
        _1710 = _1694;
    }
    float _1726 = _1710;
    float _1728 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1730 = _1726;
    if (_1630)
    {
        float _1732 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1732;
    }
    float _1734 = _1666;
    if (_1630)
    {
        float _1736 = _1618 * _1724;
        _1644 = _1736;
    }
    float _1738 = _1644;
    if (!_1630)
    {
        _1654 = _1622;
    }
    float _1740 = _1654;
    float _1742 = _1740;
    if (_1630)
    {
        float _1744 = _1620 * _1724;
        _1714 = _1744;
    }
    float _1746 = _1714;
    if (_1630)
    {
        float _1748 = fma(_1694, _1688, _1734);
        _1730 = _1748;
    }
    float _1750 = _1730;
    if (_1630)
    {
        float _1752 = _1738 * _1738;
        _1742 = _1752;
    }
    float _1754 = _1742;
    if (!_1630)
    {
        _1720 = _1624;
    }
    float _1756 = _1720;
    float _1758 = _1756;
    if (_1630)
    {
        float _1760 = _1746 * _1746;
        _1758 = _1760;
    }
    float _1762 = _1758;
    float _1764 = fma(_1750, _1750, _1754);
    float _1766 = _1764 + _1762;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1770 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1768);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1776 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1778 = rsqrt(_1766);
    float _1780 = -_1772;
    float _1782 = _1780 + 1.0;
    float _1784 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1774);
    float _1786 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1788 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1790 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1784);
    float _1792 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1786);
    float _1794 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1788);
    float _1796 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1728);
    float _1798 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1800 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1792);
    float _1802 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1794);
    float _1804 = abs(_1782);
    float _1806 = log2(_1804);
    float _1808 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1810 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1812 = _1778 * _1738;
    float _1814 = _1778 * _1750;
    float _1816 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1818 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1820 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1822 = _1778 * _1746;
    float _1824 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1796);
    float _1826 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1818);
    float _1828 = -_1820;
    float _1830 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1828);
    float _1832 = -_1808;
    float _1834 = fma(_1832, _1776, 1.0);
    float _1836 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1838 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1826);
    float _1840 = -_1822;
    float _1842 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1830);
    float _1844 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1846 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1838);
    float _1850 = fma(_1842, -0.5, 0.5);
    float _1852 = log2(_1834);
    float _1854 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1856 = fma(_1842, 0.5, 0.5);
    float _1858 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1846);
    float _1860 = _1814 + 1.0;
    float _1862 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1854);
    float _1864 = fma(_1856, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1866 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1858);
    float _1868 = exp2(_1844);
    float _1870 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1862);
    float _1872 = fma(_1856, _1864, -0.212114393711090087890625);
    float _1874 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1876 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1870);
    float _1878 = fma(_1856, _1872, 1.570728778839111328125);
    float _1880 = 1.0 / _1848;
    float _1882 = _1852 * 0.693147182464599609375;
    float _1884 = sqrt(_1850);
    float _1886 = -_1814;
    float _1888 = fma(_1868, _1860, _1886);
    float _1890 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1892 = fma(_1888, 0.5, 0.5);
    float _1894 = _1874 * _1880;
    float _1896 = _1876 * _1880;
    float _1898 = fma(_1894, 0.5, 0.5);
    float _1900 = fma(_1896, -0.5, 0.5);
    float _1902 = _1884 * 0.636619746685028076171875;
    float _1904 = -_1878;
    float _1906 = fma(_1902, _1904, 1.0);
    float3 _5103 = float3(_1898, _1900, _1890);
    float _1908 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5103, float3(0.0), isnan(_5103)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5103, float3(0.0), isnan(_5103)), level(0.0)).x;
    float3 _5114 = float3(_1898, _1900, _1890);
    float4 _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5114, float3(0.0), isnan(_5114)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5114, float3(0.0), isnan(_5114)), level(0.0)).xyzw;
    float _1913 = _1911.x;
    float _1915 = _1911.y;
    float _1917 = _1911.z;
    float _1919 = _1911.w;
    float2 _5131 = float2(_1906, _1892);
    float3 _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5131, float2(0.0), isnan(_5131)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5131, float2(0.0), isnan(_5131)), level(0.0)).xyz;
    float _1925 = _1923.x;
    float _1927 = _1923.y;
    float _1929 = _1923.z;
    float _1931 = -_1022;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _920);
    float _1935 = -_1048;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _922);
    float _1939 = -_1068;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _1943 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1947 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1943);
    float _1949 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1945);
    float _1951 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1953 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1947);
    float _1955 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1949);
    float _1957 = exp2(_1951);
    float _1959 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1961 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1963 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(0.5);
    bool _1971 = _1967 || _1969;
    float _1973 = 1.0 / _1959;
    float _1975 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1977 = _1961 + _1959;
    float _1979 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1975);
    float _1981 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1979);
    float _1983 = _1941;
    if (_1971)
    {
        _1983 = 1.0;
    }
    float _1985 = _1983;
    float _1987 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1989 = _1977 * _1973;
    float _1991 = _1989 * 0.5;
    float _1993 = _1985;
    if (!_1971)
    {
        float _1995 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1999 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1997);
        float _2001 = _1995 * 0.15915493667125701904296875;
        float _2003 = _2001 * 6.283185482025146484375;
        float _2005 = cos(_2003);
        float _2007 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2009 = _2007 * 0.15915493667125701904296875;
        float _2011 = _2001 * 6.283185482025146484375;
        float _2013 = sin(_2011);
        float _2015 = 1.0 / _2005;
        float _2017 = _2009 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = _2013 * _2015;
        float _2023 = 1.0 / _1999;
        float _2025 = _2019 * _2021;
        float _2027 = _2009 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2031;
        float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2037 = _2023 * _2035;
        float _2039 = 1.0 / _2025;
        float _2041 = 1.0 / _2033;
        float _2043 = _2029 * _2039;
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2047 = fma(_2043, _2037, _2045);
        float _2049 = _2047 * _2041;
        float _2051 = precise::clamp(_2049, 0.0, 1.0);
        _1993 = _2051;
    }
    float _2053 = _1993;
    float _2055 = -_1957;
    float _2057 = _2055 + 1.0;
    float _2059 = _1987 + _1848;
    bool _2061 = _2053 > 0.0;
    bool _2063 = isnan(_2053);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(0.0);
    bool _2069 = _2065 || _2067;
    float _2071 = _2053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2073 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2075 = _2059 * 0.5;
    float _2077 = _2071 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2079 = _2073 * _1908;
    float _2081 = -_2073;
    float _2083 = _2081 + 1.0;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1876;
    out.gl_Position.z = _1987;
    out.gl_Position.w = _1848;
    float _2085 = _1919 * _2079;
    float _2087 = _1929 * _2079;
    out.m_67.z = _2075;
    out.m_67.w = _1848;
    float _2089 = fma(_1925, _2085, _1913);
    float _2091 = fma(_1927, _2085, _1915);
    float _2093 = _1919 * _2083;
    float _2095 = fma(_1919, _2087, _1917);
    out.m_47.x = _2077;
    out.m_69.x = _2089;
    out.m_69.y = _2091;
    out.m_69.z = _2095;
    out.m_69.w = _2093;
    if (_2069)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2097 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2097;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

