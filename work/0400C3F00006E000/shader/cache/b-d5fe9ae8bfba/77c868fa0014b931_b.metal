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
    float4 m_57 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1488 = false;
    bool _984 = false;
    bool _844 = false;
    bool _462 = false;
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
        float _1996 = as_type<float>(_104);
        out.gl_Position.z = _1996;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    float _110 = in.m_51.x;
    bool _112 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_108);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_108;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _110;
    if (_120)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2069 = as_type<float>(_142);
        out.gl_Position.z = _2069;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_55.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _282;
    if (!_266)
    {
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _110 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
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
        float _290 = _124 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _292 + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_308;
    float _348 = _346 + 1.0;
    float _350 = 1.0 / _332;
    float _352 = _344 * _348;
    float _354 = -_344;
    float _356 = _354 + 1.0;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = 1.0 / _328;
    float _366 = _324 * _356;
    float _368 = -_324;
    float _370 = _368 + 1.0;
    float _372 = _312 * _350;
    float _374 = _296 * _364;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = fma(_360, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _386 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = in.m_55.x;
    float _392 = in.m_55.y;
    float _394 = in.m_55.z;
    float _396 = _384 * _366;
    float _398 = _386 * _366;
    float _400 = _388 * _366;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _416 = fma(_404, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_408, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _422 = fma(_412, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = fma(_416, _352, _414);
    float _428 = fma(_418, _352, _420);
    float _430 = fma(_422, _352, _424);
    float _432 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _426);
    float _434 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _428);
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _430);
    float _438 = _432 * _390;
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    bool _444 = !_362;
    float _460;
    if (!_444)
    {
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _448 = _110 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_88);
        float _466 = 1.0 / _464;
        float _468 = _124 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _492 = 1.0 / _478;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _502 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _504 = isnan(_470);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _486;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _470 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _520;
    float _524 = 1.0 / _482;
    float _526 = _518 * _492;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _530 = _470 + _528;
    bool _532 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _534 = isnan(_470);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _544;
    float _548 = fma(_522, _526, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _552 = 1.0 / _500;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _556 = _470 + _554;
    float _558 = _530 * _514;
    bool _560 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _562 = isnan(_470);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = 1.0 / _490;
    float _578 = _556 * _524;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _582 = _470 + _580;
    float _584 = -_570;
    float _586 = _584 + 1.0;
    float _588 = _542 * _586;
    float _590 = 1.0 / _496;
    float _592 = _582 * _552;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _594;
    float _598 = fma(_596, _526, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _602 = _470 + _600;
    float _604 = _602 * _576;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _606;
    float _610 = _474 * _590;
    bool _612 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _614 = isnan(_470);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = fma(_608, _526, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _626 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _628 = isnan(_470);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = _622 * _574;
    float _640 = -_622;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _656 = -_636;
    float _658 = _656 + 1.0;
    float _660 = _636 * _642;
    float _662 = fma(_646, _578, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _664 = fma(_650, _578, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _666 = fma(_654, _578, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _668 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _670 = isnan(_470);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _680;
    bool _684 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _686 = isnan(_470);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = _512 * _658;
    float _698 = -_512;
    float _700 = _698 + 1.0;
    float _702 = fma(_682, _610, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _708 = -_694;
    float _710 = _708 + 1.0;
    float _712 = _694 * _700;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _714;
    float _718 = _678 * _710;
    float _720 = -_678;
    float _722 = _720 + 1.0;
    float _724 = fma(_716, _610, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _726 = fma(_546, _610, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _728 = _598 * _718;
    float _730 = _624 * _718;
    float _732 = _548 * _718;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _742 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[107].x, _728);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[107].y, _730);
    float _746 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[107].z, _732);
    float _748 = fma(_740, _592, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _750 = fma(_662, _712, _742);
    float _752 = fma(_664, _712, _744);
    float _754 = fma(_666, _712, _746);
    float _756 = fma(_736, _592, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _758 = fma(_706, _592, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _760 = fma(_724, _696, _750);
    float _762 = fma(_702, _696, _752);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _764;
    float _768 = fma(_726, _696, _754);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _774;
    float _778 = fma(_766, _558, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _780 = fma(_756, _660, _760);
    float _782 = fma(_748, _660, _762);
    float _784 = fma(_758, _660, _768);
    float _786 = fma(_772, _558, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _796 = fma(_776, _558, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _802 = fma(_778, _638, _780);
    float _804 = fma(_790, _604, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _806 = fma(_794, _604, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _808 = fma(_800, _604, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _810 = fma(_786, _638, _782);
    float _812 = fma(_796, _638, _784);
    float _814 = fma(_804, _588, _802);
    float _816 = fma(_806, _588, _810);
    float _818 = fma(_808, _588, _812);
    float _820 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[113].x, _814);
    float _822 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[113].y, _816);
    float _824 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[113].z, _818);
    bool _826 = !_550;
    float _842;
    if (!_826)
    {
        float _828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _830 = _110 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _832 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _834 = _832 * _828;
        float _836 = floor(_834);
        float _838 = -_836;
        float _840 = _834 + _838;
        _842 = _840;
        _844 = true;
    }
    else
    {
        float _846 = float(_88);
        float _848 = 1.0 / _846;
        float _850 = _124 * _848;
        _842 = _850;
    }
    _844 = false;
    float _852 = _842;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _856 = _852 + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _862 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _864 = isnan(_852);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _878 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _880 = isnan(_852);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _890;
    bool _894 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _896 = isnan(_852);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = 1.0 / _860;
    float _908 = -_872;
    float _910 = _908 + 1.0;
    bool _912 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _914 = _888 * _910;
    float _916 = -_888;
    float _918 = _916 + 1.0;
    float _920 = 1.0 / _876;
    float _922 = _892 * _906;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _928 = fma(_922, _856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _930 = _926 * _920;
    float _932 = _928 * _914;
    float _934 = -_904;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _940 = _852 + _938;
    float _942 = _820 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _944 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[115].x, _932);
    float _946 = _872 * _936;
    float _948 = fma(_930, _940, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _950 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = fma(_948, _946, _944);
    float _956 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[117].x, _954);
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _960 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _952;
    out.m_57.y = _962;
    out.m_57.z = _958;
    out.m_57.w = _964;
    bool _966 = !_912;
    float _982;
    if (!_966)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _970 = _110 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _974 = _972 * _968;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _982 = _980;
        _984 = true;
    }
    else
    {
        float _986 = float(_88);
        float _988 = 1.0 / _986;
        float _990 = _124 * _988;
        _982 = _990;
    }
    _984 = false;
    float _992 = _982;
    float _994 = in.m_51.y;
    float _996 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _998 = in.m_59.y;
    float _1000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1008 = _1006 != 0;
    float _1010 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _996);
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1014 = _1012 != 0;
    float _1016 = in.m_59.x;
    float _1018 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1010);
    float _1020 = 1.0 / _1004;
    bool _1022 = _110 > 0.5;
    bool _1024 = _1022 && _1008;
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1028;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1034 = _994 > 0.5;
    float _1036 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1038 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1040 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1036);
    float _1044 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1038);
    bool _1046 = _992 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1048 = isnan(_992);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1054 = _1050 || _1052;
    float _1056 = float(_1054);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1060 = _992 + _1058;
    float _1062 = _1030 * _1020;
    bool _1064 = _992 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1066 = isnan(_992);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1072 = _1068 || _1070;
    float _1074 = float(_1072);
    float _1076 = -_998;
    float _1078 = _1076 + 1.0;
    float _1080 = -_1056;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_1062, _1060, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1086 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1042);
    float _1088 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1044);
    float _1090 = _1074 * _1082;
    float _1092 = _998;
    float _1094 = _1060;
    int _1096 = as_type<int>(_1040);
    if (_1014)
    {
        float _1098 = _1034 ? _1078 : _998;
        _1092 = _1098;
    }
    float _1100 = _1092;
    float _1102 = -_1074;
    float _1104 = _1102 + 1.0;
    float _1106 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = _1084 * _1090;
    float _1110 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1112 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1116 = _1106 + _1114;
    float _1118 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1108);
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1122 = _1110 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1126 = _1112 + _1124;
    float _1128 = _1016;
    float _1130 = _1110;
    if (!_1008)
    {
        _1094 = _1016;
    }
    float _1132 = _1094;
    float _1134 = _1132;
    if (_1024)
    {
        float _1136 = -_1016;
        float _1138 = _1136 + 1.0;
        _1128 = _1138;
    }
    float _1140 = _1128;
    float _1142 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1144 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1118);
    float _1146 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1148 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1142);
    float _1150 = _1122 * _1122;
    float _1152 = _1150;
    int _1154 = as_type<int>(_1144);
    if (_1008)
    {
        _1134 = _1140;
    }
    float _1156 = _1134;
    float _1158 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1160 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1148);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1166 = _1160 >= 0.0;
    float _1168 = _1146 * _1000;
    float _1170 = fma(_1116, _1116, _1150);
    float _1172 = _1164 * _1026;
    float _1174 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = fma(_1126, _1126, _1170);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1180 = rsqrt(_1176);
    out.m_61.x = _1172;
    out.m_61.y = _1168;
    if (_1166)
    {
        _1152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1182 = _1152;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1166)
    {
        out.m_47.x = 0.0;
    }
    if (_1166)
    {
        float _1186 = _1182 * 5.0;
        _1154 = as_type<int>(_1186);
    }
    int _1188 = _1154;
    out.m_63.x = _1174;
    out.m_63.y = _1184;
    out.m_63.z = _1040;
    out.m_63.w = _1158;
    if (_1166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3802 = as_type<float>(_1188);
        out.gl_Position.z = _3802;
    }
    float _1190 = _1122 * _1180;
    float _1192 = _1116 * _1180;
    if (_1166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1194 = -_1190;
    float _1196 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1110);
    float _1198 = _1126 * _1180;
    float _1200 = -_1192;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1106);
    float _1204 = -_1190;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1210 = _1196 + _1208;
    float _1212 = -_1198;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1112);
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1218 = _1202 + _1216;
    float _1220 = -_1192;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1224 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1214 + _1226;
    float _1230 = -_1198;
    float _1232 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    float _1234 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1224);
    float _1236 = _1206 * _1206;
    float _1238 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1234);
    float _1240 = fma(_1222, _1222, _1236);
    bool _1242 = _1238 >= 0.0;
    float _1244 = fma(_1232, _1232, _1240);
    float _1246 = _1238;
    if (_1242)
    {
        _1246 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1248 = _1246;
    if (_1242)
    {
        out.m_47.x = 0.0;
    }
    if (_1242)
    {
        float _1250 = _1248 * 5.0;
        _1096 = as_type<int>(_1250);
    }
    int _1252 = _1096;
    if (_1242)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3929 = as_type<float>(_1252);
        out.gl_Position.z = _3929;
    }
    if (_1242)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1254 = in.m_65.x;
    float _1256 = in.m_65.y;
    float _1258 = in.m_65.z;
    float _1260 = sqrt(_1244);
    float _1262 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1264 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1266 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1268 = _1180 * _1260;
    float _1270 = _1268 * _1262;
    float _1272 = _1268 * _1264;
    float _1274 = _1268 * _1266;
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1256);
    float _1278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1254);
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1258);
    float _1282 = _1270 * _1276;
    float _1284 = _1272 * _1278;
    float _1286 = _1274 * _1280;
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1294 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1288);
    float _1296 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1290);
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1292);
    float _1300 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1294);
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1296);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1298);
    float _1306 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1308 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1310 = _1106 + _1306;
    float _1312 = _1112 + _1308;
    float _1314 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1318 = _1310 + _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1322 = _1312 + _1320;
    float _1324 = _1110 + _1314;
    float _1326 = _1318 * _1318;
    float _1328 = _1322 * _1322;
    float _1330 = _1326 + _1328;
    float _1332 = sqrt(_1330);
    bool _1334 = _1332 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1336 = _1314;
    float _1338 = _1284;
    float _1340 = _1310;
    float _1342 = _1326;
    float _1344 = _1332;
    if (!_1334)
    {
        _1336 = _1326;
    }
    float _1346 = _1336;
    float _1348 = _1346;
    if (!_1334)
    {
        _1130 = _1310;
    }
    float _1350 = _1130;
    float _1352 = _1350;
    if (!_1334)
    {
        _1338 = _1328;
    }
    float _1354 = _1338;
    float _1356 = _1354;
    if (!_1334)
    {
        _1340 = _1312;
    }
    float _1358 = _1340;
    float _1360 = _1358;
    if (!_1334)
    {
        _1342 = _1324;
    }
    float _1362 = _1342;
    bool _1364 = !_1334;
    float _1366 = _1362;
    if (!_1364)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1372 = _1332 + _1370;
        float _1374 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = rsqrt(_1330);
        float _1378 = _1372 * _1368;
        float _1380 = _1378 * 0.15915493667125701904296875;
        float _1382 = _1380 * 6.283185482025146484375;
        float _1384 = sin(_1382);
        float _1386 = _1380 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = fma(_1384, _1374, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1392 = _1376 * _1390;
        float _1394 = _1388 + (-1.0);
        float _1396 = fma(_1318, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1398 = fma(_1322, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1400 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1404 = _1396 + _1402;
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1408 = _1398 + _1406;
        float _1410 = fma(_1324, _1388, _1400);
        float _1412 = _1404 * _1404;
        float _1414 = _1408 * _1408;
        _1366 = _1410;
        _1348 = _1412;
        _1356 = _1414;
        _1344 = _1372;
        _1352 = _1396;
        _1360 = _1398;
    }
    float _1416 = _1366;
    float _1418 = _1348;
    float _1420 = _1356;
    float _1422 = _1344;
    float _1424 = _1352;
    float _1426 = _1360;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1430 = _1416 + _1428;
    float _1432 = fma(_1430, _1430, _1418);
    float _1434 = _1432 + _1420;
    float _1436 = sqrt(_1434);
    bool _1438 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1440 = isnan(_1436);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1446 = _1442 || _1444;
    float _1448 = _1418;
    float _1450 = _1422;
    float _1452 = _1434;
    if (!_1446)
    {
        _1448 = 1.0;
    }
    float _1454 = _1448;
    bool _1456 = !_1446;
    float _1458 = _1454;
    if (!_1456)
    {
        bool _1460 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1462 = isnan(_1436);
        bool _1464 = _1460 || _1462;
        bool _1466 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1468 = _1464 || _1466;
        if (!_1468)
        {
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = _1436 + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1476 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1474;
            float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1480 = _1478 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1482 = 1.0 / _1476;
            float _1484 = _1472 * _1482;
            float _1486 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1458 = _1486;
            _1450 = _1482;
            _1452 = _1476;
            _1488 = true;
        }
        else
        {
            bool _1490 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1492 = isnan(_1436);
            bool _1494 = _1490 || _1492;
            bool _1496 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1498 = _1494 || _1496;
            if (!_1498)
            {
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1436 + _1500;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1510 = _1508 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1512 = 1.0 / _1506;
                float _1514 = _1502 * _1512;
                float _1516 = fma(_1514, _1510, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1458 = _1516;
                _1450 = _1512;
                _1452 = _1506;
                _1488 = true;
            }
            else
            {
                _1458 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1488 = false;
    float _1518 = _1458;
    float _1520 = _1450;
    float _1522 = _1452;
    float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1526 = _1416 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1530 = _1424 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1534 = _1426 + _1532;
    float _1536 = fma(_1526, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1538 = fma(_1530, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1540 = fma(_1534, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1542 = -_1190;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1536);
    float _1546 = -_1192;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1550 = -_1198;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1556 = _1544 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1560 = _1548 + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1564 = _1552 + _1562;
    float _1566 = _1556 * _1556;
    float _1568 = fma(_1560, _1560, _1566);
    float _1570 = fma(_1564, _1564, _1568);
    float _1572 = rsqrt(_1570);
    float _1574 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1576 = _1560 * _1574;
    float _1578 = _1564 * _1574;
    float _1580 = _1576 * _1576;
    float _1582 = _1578 * _1578;
    float _1584 = _1580 + _1582;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1586 + _1590;
    float _1594 = _1520;
    float _1596 = _1584;
    float _1598 = _1592;
    float _1600 = _1556;
    float _1602 = _1574;
    float _1604 = _1576;
    if (_1588)
    {
        float _1606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1606;
    }
    float _1608 = _1594;
    if (_1588)
    {
        float _1610 = rsqrt(_1584);
        _1596 = _1610;
    }
    float _1612 = _1596;
    float _1614 = _1608;
    if (_1588)
    {
        float _1616 = _1592 * _1608;
        _1598 = _1616;
    }
    float _1618 = _1598;
    if (_1588)
    {
        float _1620 = _1618 * 0.15915493667125701904296875;
        _1614 = _1620;
    }
    float _1622 = _1614;
    float _1624 = _1564;
    float _1626 = _1622;
    if (_1588)
    {
        float _1628 = _1622 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        _1624 = _1630;
    }
    float _1632 = _1624;
    float _1634 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1636 = precise::max(0.0, _1634);
    float _1638 = _1522;
    float _1640 = _1636;
    if (_1588)
    {
        float _1642 = _1622 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        _1638 = _1644;
    }
    float _1646 = _1638;
    float _1648 = -_1574;
    float _1650 = -_1636;
    float _1652 = fma(_1556, _1648, _1650);
    if (_1588)
    {
        float _1654 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1654;
    }
    float _1656 = _1600;
    float _1658 = _1656;
    float _1660 = _1632;
    if (_1588)
    {
        float _1662 = fma(_1632, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = _1664;
    if (!_1588)
    {
        _1660 = _1580;
    }
    float _1668 = _1660;
    float _1670 = _1668;
    float _1672 = _1646;
    if (_1588)
    {
        float _1674 = _1646 + (-1.0);
        _1640 = _1674;
    }
    float _1676 = _1640;
    float _1678 = _1676;
    if (_1588)
    {
        float _1680 = _1612 * _1664;
        _1602 = _1680;
    }
    float _1682 = _1602;
    if (!_1588)
    {
        _1666 = _1652;
    }
    float _1684 = _1666;
    float _1686 = sqrt(_1570);
    float _1688 = _1684;
    if (_1588)
    {
        float _1690 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1690;
    }
    float _1692 = _1626;
    if (_1588)
    {
        float _1694 = _1576 * _1682;
        _1604 = _1694;
    }
    float _1696 = _1604;
    if (!_1588)
    {
        _1678 = _1578;
    }
    float _1698 = _1678;
    float _1700 = _1698;
    if (_1588)
    {
        float _1702 = _1578 * _1682;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (_1588)
    {
        float _1706 = fma(_1652, _1646, _1692);
        _1688 = _1706;
    }
    float _1708 = _1688;
    if (_1588)
    {
        float _1710 = _1696 * _1696;
        _1670 = _1710;
    }
    float _1712 = _1670;
    if (!_1588)
    {
        _1672 = _1582;
    }
    float _1714 = _1672;
    float _1716 = _1714;
    if (_1588)
    {
        float _1718 = _1704 * _1704;
        _1716 = _1718;
    }
    float _1720 = _1716;
    float _1722 = fma(_1708, _1708, _1712);
    float _1724 = _1722 + _1720;
    float _1726 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1730 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1728);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1736 = rsqrt(_1724);
    float _1738 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1726);
    float _1740 = -_1732;
    float _1742 = _1740 + 1.0;
    float _1744 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1746 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1734);
    float _1748 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1750 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1738);
    float _1752 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1744);
    float _1754 = abs(_1742);
    float _1756 = log2(_1754);
    float _1758 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1746);
    float _1760 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1748);
    float _1762 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1764 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1766 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1768 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1760);
    float _1770 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1772 = _1736 * _1696;
    float _1774 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1776 = _1736 * _1708;
    float _1778 = _1736 * _1704;
    float _1780 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1782 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1774);
    float _1784 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1786 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1788 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1790 = -_1780;
    float _1792 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1790);
    float _1794 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1798 = -_1786;
    float _1800 = fma(_1798, _1784, 1.0);
    float _1802 = -_1778;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1792);
    float _1806 = exp2(_1788);
    float _1808 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1796);
    float _1810 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1812 = fma(_1804, -0.5, 0.5);
    float _1814 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1816 = fma(_1804, 0.5, 0.5);
    float _1818 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1810);
    float _1820 = _1776 + 1.0;
    float _1822 = log2(_1800);
    float _1824 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1818);
    float _1826 = 1.0 / _1808;
    float _1828 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1814);
    float _1830 = fma(_1816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1832 = -_1776;
    float _1834 = fma(_1806, _1820, _1832);
    float _1836 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1824);
    float _1838 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1828);
    float _1840 = fma(_1816, _1830, -0.212114393711090087890625);
    float _1842 = fma(_1834, 0.5, 0.5);
    float _1844 = sqrt(_1812);
    float _1846 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1838);
    float _1848 = fma(_1816, _1840, 1.570728778839111328125);
    float _1850 = _1822 * 0.693147182464599609375;
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1854 = _1836 * _1826;
    float _1856 = _1846 * _1826;
    float _1858 = fma(_1854, 0.5, 0.5);
    float _1860 = fma(_1856, -0.5, 0.5);
    float _1862 = _1844 * 0.636619746685028076171875;
    float3 _4939 = float3(_1858, _1860, _1852);
    float _1864 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4939, float3(0.0), isnan(_4939)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4939, float3(0.0), isnan(_4939)), level(0.0)).x;
    float _1866 = -_1848;
    float _1868 = fma(_1862, _1866, 1.0);
    float3 _4955 = float3(_1858, _1860, _1852);
    float4 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4955, float3(0.0), isnan(_4955)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4955, float3(0.0), isnan(_4955)), level(0.0)).xyzw;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1871.w;
    float2 _4972 = float2(_1868, _1842);
    float3 _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4972, float2(0.0), isnan(_4972)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4972, float2(0.0), isnan(_4972)), level(0.0)).xyz;
    float _1885 = _1883.x;
    float _1887 = _1883.y;
    float _1889 = _1883.z;
    float _1891 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1893 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1895 = _1836 + _1808;
    float _1897 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1891);
    float _1899 = _1895 * 0.5;
    float _1901 = exp2(_1893);
    float _1903 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1897);
    float _1905 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1903);
    float _1907 = _1808 * 0.5;
    float _1909 = _1905 + _1808;
    float _1911 = -_1901;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_1846, -0.5, _1907);
    float _1917 = _1909 * 0.5;
    float _1919 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1836;
    out.gl_Position.y = _1846;
    out.gl_Position.z = _1905;
    out.gl_Position.w = _1808;
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1899;
    out.m_67.y = _1915;
    out.m_67.z = _1917;
    out.m_67.w = _1808;
    out.m_47.x = _1921;
    float _1923 = _1919 * _1864;
    float _1925 = -_1919;
    float _1927 = _1925 + 1.0;
    float _1929 = _1879 * _1923;
    float _1931 = _1889 * _1923;
    float _1933 = fma(_1885, _1929, _1873);
    float _1935 = fma(_1887, _1929, _1875);
    float _1937 = _1879 * _1927;
    float _1939 = fma(_1879, _1931, _1877);
    out.m_69.x = _1933;
    out.m_69.y = _1935;
    out.m_69.z = _1939;
    out.m_69.w = _1937;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1488 = false;
    bool _984 = false;
    bool _844 = false;
    bool _462 = false;
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
        float _1996 = as_type<float>(_104);
        out.gl_Position.z = _1996;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_49.w;
    float _110 = in.m_51.x;
    bool _112 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_108);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_108;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _110;
    if (_120)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2069 = as_type<float>(_142);
        out.gl_Position.z = _2069;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_55.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _282;
    if (!_266)
    {
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _110 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
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
        float _290 = _124 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _292 + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_308;
    float _348 = _346 + 1.0;
    float _350 = 1.0 / _332;
    float _352 = _344 * _348;
    float _354 = -_344;
    float _356 = _354 + 1.0;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = 1.0 / _328;
    float _366 = _324 * _356;
    float _368 = -_324;
    float _370 = _368 + 1.0;
    float _372 = _312 * _350;
    float _374 = _296 * _364;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = fma(_360, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _386 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = in.m_55.x;
    float _392 = in.m_55.y;
    float _394 = in.m_55.z;
    float _396 = _384 * _366;
    float _398 = _386 * _366;
    float _400 = _388 * _366;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _416 = fma(_404, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_408, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _422 = fma(_412, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = fma(_416, _352, _414);
    float _428 = fma(_418, _352, _420);
    float _430 = fma(_422, _352, _424);
    float _432 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _426);
    float _434 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _428);
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _430);
    float _438 = _432 * _390;
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    bool _444 = !_362;
    float _460;
    if (!_444)
    {
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _448 = _110 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_88);
        float _466 = 1.0 / _464;
        float _468 = _124 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _492 = 1.0 / _478;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _502 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _504 = isnan(_470);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _486;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _470 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _520;
    float _524 = 1.0 / _482;
    float _526 = _518 * _492;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _530 = _470 + _528;
    bool _532 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _534 = isnan(_470);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _544;
    float _548 = fma(_522, _526, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _552 = 1.0 / _500;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _556 = _470 + _554;
    float _558 = _530 * _514;
    bool _560 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _562 = isnan(_470);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = 1.0 / _490;
    float _578 = _556 * _524;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _582 = _470 + _580;
    float _584 = -_570;
    float _586 = _584 + 1.0;
    float _588 = _542 * _586;
    float _590 = 1.0 / _496;
    float _592 = _582 * _552;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _594;
    float _598 = fma(_596, _526, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _602 = _470 + _600;
    float _604 = _602 * _576;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _606;
    float _610 = _474 * _590;
    bool _612 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _614 = isnan(_470);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = fma(_608, _526, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _626 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _628 = isnan(_470);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = _622 * _574;
    float _640 = -_622;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _656 = -_636;
    float _658 = _656 + 1.0;
    float _660 = _636 * _642;
    float _662 = fma(_646, _578, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _664 = fma(_650, _578, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _666 = fma(_654, _578, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _668 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _670 = isnan(_470);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _680;
    bool _684 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _686 = isnan(_470);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = _512 * _658;
    float _698 = -_512;
    float _700 = _698 + 1.0;
    float _702 = fma(_682, _610, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _708 = -_694;
    float _710 = _708 + 1.0;
    float _712 = _694 * _700;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _714;
    float _718 = _678 * _710;
    float _720 = -_678;
    float _722 = _720 + 1.0;
    float _724 = fma(_716, _610, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _726 = fma(_546, _610, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _728 = _598 * _718;
    float _730 = _624 * _718;
    float _732 = _548 * _718;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _742 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[107].x, _728);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[107].y, _730);
    float _746 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[107].z, _732);
    float _748 = fma(_740, _592, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _750 = fma(_662, _712, _742);
    float _752 = fma(_664, _712, _744);
    float _754 = fma(_666, _712, _746);
    float _756 = fma(_736, _592, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _758 = fma(_706, _592, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _760 = fma(_724, _696, _750);
    float _762 = fma(_702, _696, _752);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _764;
    float _768 = fma(_726, _696, _754);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _774;
    float _778 = fma(_766, _558, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _780 = fma(_756, _660, _760);
    float _782 = fma(_748, _660, _762);
    float _784 = fma(_758, _660, _768);
    float _786 = fma(_772, _558, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _796 = fma(_776, _558, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _802 = fma(_778, _638, _780);
    float _804 = fma(_790, _604, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _806 = fma(_794, _604, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _808 = fma(_800, _604, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _810 = fma(_786, _638, _782);
    float _812 = fma(_796, _638, _784);
    float _814 = fma(_804, _588, _802);
    float _816 = fma(_806, _588, _810);
    float _818 = fma(_808, _588, _812);
    float _820 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[113].x, _814);
    float _822 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[113].y, _816);
    float _824 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[113].z, _818);
    bool _826 = !_550;
    float _842;
    if (!_826)
    {
        float _828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _830 = _110 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _832 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _834 = _832 * _828;
        float _836 = floor(_834);
        float _838 = -_836;
        float _840 = _834 + _838;
        _842 = _840;
        _844 = true;
    }
    else
    {
        float _846 = float(_88);
        float _848 = 1.0 / _846;
        float _850 = _124 * _848;
        _842 = _850;
    }
    _844 = false;
    float _852 = _842;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _856 = _852 + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _862 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _864 = isnan(_852);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _878 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _880 = isnan(_852);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _890;
    bool _894 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _896 = isnan(_852);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = 1.0 / _860;
    float _908 = -_872;
    float _910 = _908 + 1.0;
    bool _912 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _914 = _888 * _910;
    float _916 = -_888;
    float _918 = _916 + 1.0;
    float _920 = 1.0 / _876;
    float _922 = _892 * _906;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _928 = fma(_922, _856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _930 = _926 * _920;
    float _932 = _928 * _914;
    float _934 = -_904;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _940 = _852 + _938;
    float _942 = _820 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _944 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[115].x, _932);
    float _946 = _872 * _936;
    float _948 = fma(_930, _940, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _950 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = fma(_948, _946, _944);
    float _956 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[117].x, _954);
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _960 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _952;
    out.m_57.y = _962;
    out.m_57.z = _958;
    out.m_57.w = _964;
    bool _966 = !_912;
    float _982;
    if (!_966)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _970 = _110 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _974 = _972 * _968;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _982 = _980;
        _984 = true;
    }
    else
    {
        float _986 = float(_88);
        float _988 = 1.0 / _986;
        float _990 = _124 * _988;
        _982 = _990;
    }
    _984 = false;
    float _992 = _982;
    float _994 = in.m_51.y;
    float _996 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _998 = in.m_59.y;
    float _1000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1008 = _1006 != 0;
    float _1010 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _996);
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1014 = _1012 != 0;
    float _1016 = in.m_59.x;
    float _1018 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1010);
    float _1020 = 1.0 / _1004;
    bool _1022 = _110 > 0.5;
    bool _1024 = _1022 && _1008;
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1028;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1034 = _994 > 0.5;
    float _1036 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1038 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1040 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1036);
    float _1044 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1038);
    bool _1046 = _992 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1048 = isnan(_992);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1054 = _1050 || _1052;
    float _1056 = float(_1054);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1060 = _992 + _1058;
    float _1062 = _1030 * _1020;
    bool _1064 = _992 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1066 = isnan(_992);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1072 = _1068 || _1070;
    float _1074 = float(_1072);
    float _1076 = -_998;
    float _1078 = _1076 + 1.0;
    float _1080 = -_1056;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_1062, _1060, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1086 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1042);
    float _1088 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1044);
    float _1090 = _1074 * _1082;
    float _1092 = _998;
    float _1094 = _1060;
    int _1096 = as_type<int>(_1040);
    if (_1014)
    {
        float _1098 = _1034 ? _1078 : _998;
        _1092 = _1098;
    }
    float _1100 = _1092;
    float _1102 = -_1074;
    float _1104 = _1102 + 1.0;
    float _1106 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = _1084 * _1090;
    float _1110 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1112 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1116 = _1106 + _1114;
    float _1118 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1108);
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1122 = _1110 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1126 = _1112 + _1124;
    float _1128 = _1016;
    float _1130 = _1110;
    if (!_1008)
    {
        _1094 = _1016;
    }
    float _1132 = _1094;
    float _1134 = _1132;
    if (_1024)
    {
        float _1136 = -_1016;
        float _1138 = _1136 + 1.0;
        _1128 = _1138;
    }
    float _1140 = _1128;
    float _1142 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1144 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1118);
    float _1146 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1148 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1142);
    float _1150 = _1122 * _1122;
    float _1152 = _1150;
    int _1154 = as_type<int>(_1144);
    if (_1008)
    {
        _1134 = _1140;
    }
    float _1156 = _1134;
    float _1158 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1160 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1148);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1166 = _1160 >= 0.0;
    float _1168 = _1146 * _1000;
    float _1170 = fma(_1116, _1116, _1150);
    float _1172 = _1164 * _1026;
    float _1174 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = fma(_1126, _1126, _1170);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1180 = rsqrt(_1176);
    out.m_61.x = _1172;
    out.m_61.y = _1168;
    if (_1166)
    {
        _1152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1182 = _1152;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1166)
    {
        out.m_47.x = 0.0;
    }
    if (_1166)
    {
        float _1186 = _1182 * 5.0;
        _1154 = as_type<int>(_1186);
    }
    int _1188 = _1154;
    out.m_63.x = _1174;
    out.m_63.y = _1184;
    out.m_63.z = _1040;
    out.m_63.w = _1158;
    if (_1166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3802 = as_type<float>(_1188);
        out.gl_Position.z = _3802;
    }
    float _1190 = _1122 * _1180;
    float _1192 = _1116 * _1180;
    if (_1166)
    {
        return out;
    }
    float _1194 = -_1190;
    float _1196 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1110);
    float _1198 = _1126 * _1180;
    float _1200 = -_1192;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1106);
    float _1204 = -_1190;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1210 = _1196 + _1208;
    float _1212 = -_1198;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1112);
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1218 = _1202 + _1216;
    float _1220 = -_1192;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1224 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1214 + _1226;
    float _1230 = -_1198;
    float _1232 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    float _1234 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1224);
    float _1236 = _1206 * _1206;
    float _1238 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1234);
    float _1240 = fma(_1222, _1222, _1236);
    bool _1242 = _1238 >= 0.0;
    float _1244 = fma(_1232, _1232, _1240);
    float _1246 = _1238;
    if (_1242)
    {
        _1246 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1248 = _1246;
    if (_1242)
    {
        out.m_47.x = 0.0;
    }
    if (_1242)
    {
        float _1250 = _1248 * 5.0;
        _1096 = as_type<int>(_1250);
    }
    int _1252 = _1096;
    if (_1242)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3929 = as_type<float>(_1252);
        out.gl_Position.z = _3929;
    }
    if (_1242)
    {
        return out;
    }
    float _1254 = in.m_65.x;
    float _1256 = in.m_65.y;
    float _1258 = in.m_65.z;
    float _1260 = sqrt(_1244);
    float _1262 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1264 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1266 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1268 = _1180 * _1260;
    float _1270 = _1268 * _1262;
    float _1272 = _1268 * _1264;
    float _1274 = _1268 * _1266;
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1256);
    float _1278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1254);
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1258);
    float _1282 = _1270 * _1276;
    float _1284 = _1272 * _1278;
    float _1286 = _1274 * _1280;
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1294 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1288);
    float _1296 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1290);
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1292);
    float _1300 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1294);
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1296);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1298);
    float _1306 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1308 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1310 = _1106 + _1306;
    float _1312 = _1112 + _1308;
    float _1314 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1318 = _1310 + _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1322 = _1312 + _1320;
    float _1324 = _1110 + _1314;
    float _1326 = _1318 * _1318;
    float _1328 = _1322 * _1322;
    float _1330 = _1326 + _1328;
    float _1332 = sqrt(_1330);
    bool _1334 = _1332 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1336 = _1314;
    float _1338 = _1284;
    float _1340 = _1310;
    float _1342 = _1326;
    float _1344 = _1332;
    if (!_1334)
    {
        _1336 = _1326;
    }
    float _1346 = _1336;
    float _1348 = _1346;
    if (!_1334)
    {
        _1130 = _1310;
    }
    float _1350 = _1130;
    float _1352 = _1350;
    if (!_1334)
    {
        _1338 = _1328;
    }
    float _1354 = _1338;
    float _1356 = _1354;
    if (!_1334)
    {
        _1340 = _1312;
    }
    float _1358 = _1340;
    float _1360 = _1358;
    if (!_1334)
    {
        _1342 = _1324;
    }
    float _1362 = _1342;
    bool _1364 = !_1334;
    float _1366 = _1362;
    if (!_1364)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1372 = _1332 + _1370;
        float _1374 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = rsqrt(_1330);
        float _1378 = _1372 * _1368;
        float _1380 = _1378 * 0.15915493667125701904296875;
        float _1382 = _1380 * 6.283185482025146484375;
        float _1384 = sin(_1382);
        float _1386 = _1380 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = fma(_1384, _1374, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1392 = _1376 * _1390;
        float _1394 = _1388 + (-1.0);
        float _1396 = fma(_1318, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1398 = fma(_1322, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1400 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1404 = _1396 + _1402;
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1408 = _1398 + _1406;
        float _1410 = fma(_1324, _1388, _1400);
        float _1412 = _1404 * _1404;
        float _1414 = _1408 * _1408;
        _1366 = _1410;
        _1348 = _1412;
        _1356 = _1414;
        _1344 = _1372;
        _1352 = _1396;
        _1360 = _1398;
    }
    float _1416 = _1366;
    float _1418 = _1348;
    float _1420 = _1356;
    float _1422 = _1344;
    float _1424 = _1352;
    float _1426 = _1360;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1430 = _1416 + _1428;
    float _1432 = fma(_1430, _1430, _1418);
    float _1434 = _1432 + _1420;
    float _1436 = sqrt(_1434);
    bool _1438 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1440 = isnan(_1436);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1446 = _1442 || _1444;
    float _1448 = _1418;
    float _1450 = _1422;
    float _1452 = _1434;
    if (!_1446)
    {
        _1448 = 1.0;
    }
    float _1454 = _1448;
    bool _1456 = !_1446;
    float _1458 = _1454;
    if (!_1456)
    {
        bool _1460 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1462 = isnan(_1436);
        bool _1464 = _1460 || _1462;
        bool _1466 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1468 = _1464 || _1466;
        if (!_1468)
        {
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = _1436 + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1476 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1474;
            float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1480 = _1478 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1482 = 1.0 / _1476;
            float _1484 = _1472 * _1482;
            float _1486 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1458 = _1486;
            _1450 = _1482;
            _1452 = _1476;
            _1488 = true;
        }
        else
        {
            bool _1490 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1492 = isnan(_1436);
            bool _1494 = _1490 || _1492;
            bool _1496 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1498 = _1494 || _1496;
            if (!_1498)
            {
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1436 + _1500;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1510 = _1508 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1512 = 1.0 / _1506;
                float _1514 = _1502 * _1512;
                float _1516 = fma(_1514, _1510, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1458 = _1516;
                _1450 = _1512;
                _1452 = _1506;
                _1488 = true;
            }
            else
            {
                _1458 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1488 = false;
    float _1518 = _1458;
    float _1520 = _1450;
    float _1522 = _1452;
    float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1526 = _1416 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1530 = _1424 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1534 = _1426 + _1532;
    float _1536 = fma(_1526, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1538 = fma(_1530, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1540 = fma(_1534, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1542 = -_1190;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1536);
    float _1546 = -_1192;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1550 = -_1198;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1556 = _1544 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1560 = _1548 + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1564 = _1552 + _1562;
    float _1566 = _1556 * _1556;
    float _1568 = fma(_1560, _1560, _1566);
    float _1570 = fma(_1564, _1564, _1568);
    float _1572 = rsqrt(_1570);
    float _1574 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1576 = _1560 * _1574;
    float _1578 = _1564 * _1574;
    float _1580 = _1576 * _1576;
    float _1582 = _1578 * _1578;
    float _1584 = _1580 + _1582;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1586 + _1590;
    float _1594 = _1520;
    float _1596 = _1584;
    float _1598 = _1592;
    float _1600 = _1556;
    float _1602 = _1574;
    float _1604 = _1576;
    if (_1588)
    {
        float _1606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1606;
    }
    float _1608 = _1594;
    if (_1588)
    {
        float _1610 = rsqrt(_1584);
        _1596 = _1610;
    }
    float _1612 = _1596;
    float _1614 = _1608;
    if (_1588)
    {
        float _1616 = _1592 * _1608;
        _1598 = _1616;
    }
    float _1618 = _1598;
    if (_1588)
    {
        float _1620 = _1618 * 0.15915493667125701904296875;
        _1614 = _1620;
    }
    float _1622 = _1614;
    float _1624 = _1564;
    float _1626 = _1622;
    if (_1588)
    {
        float _1628 = _1622 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        _1624 = _1630;
    }
    float _1632 = _1624;
    float _1634 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1636 = precise::max(0.0, _1634);
    float _1638 = _1522;
    float _1640 = _1636;
    if (_1588)
    {
        float _1642 = _1622 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        _1638 = _1644;
    }
    float _1646 = _1638;
    float _1648 = -_1574;
    float _1650 = -_1636;
    float _1652 = fma(_1556, _1648, _1650);
    if (_1588)
    {
        float _1654 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1654;
    }
    float _1656 = _1600;
    float _1658 = _1656;
    float _1660 = _1632;
    if (_1588)
    {
        float _1662 = fma(_1632, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = _1664;
    if (!_1588)
    {
        _1660 = _1580;
    }
    float _1668 = _1660;
    float _1670 = _1668;
    float _1672 = _1646;
    if (_1588)
    {
        float _1674 = _1646 + (-1.0);
        _1640 = _1674;
    }
    float _1676 = _1640;
    float _1678 = _1676;
    if (_1588)
    {
        float _1680 = _1612 * _1664;
        _1602 = _1680;
    }
    float _1682 = _1602;
    if (!_1588)
    {
        _1666 = _1652;
    }
    float _1684 = _1666;
    float _1686 = sqrt(_1570);
    float _1688 = _1684;
    if (_1588)
    {
        float _1690 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1690;
    }
    float _1692 = _1626;
    if (_1588)
    {
        float _1694 = _1576 * _1682;
        _1604 = _1694;
    }
    float _1696 = _1604;
    if (!_1588)
    {
        _1678 = _1578;
    }
    float _1698 = _1678;
    float _1700 = _1698;
    if (_1588)
    {
        float _1702 = _1578 * _1682;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (_1588)
    {
        float _1706 = fma(_1652, _1646, _1692);
        _1688 = _1706;
    }
    float _1708 = _1688;
    if (_1588)
    {
        float _1710 = _1696 * _1696;
        _1670 = _1710;
    }
    float _1712 = _1670;
    if (!_1588)
    {
        _1672 = _1582;
    }
    float _1714 = _1672;
    float _1716 = _1714;
    if (_1588)
    {
        float _1718 = _1704 * _1704;
        _1716 = _1718;
    }
    float _1720 = _1716;
    float _1722 = fma(_1708, _1708, _1712);
    float _1724 = _1722 + _1720;
    float _1726 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1730 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1728);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1736 = rsqrt(_1724);
    float _1738 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1726);
    float _1740 = -_1732;
    float _1742 = _1740 + 1.0;
    float _1744 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1746 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1734);
    float _1748 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1750 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1738);
    float _1752 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1744);
    float _1754 = abs(_1742);
    float _1756 = log2(_1754);
    float _1758 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1746);
    float _1760 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1748);
    float _1762 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1764 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1766 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1768 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1760);
    float _1770 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1772 = _1736 * _1696;
    float _1774 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1776 = _1736 * _1708;
    float _1778 = _1736 * _1704;
    float _1780 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1782 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1774);
    float _1784 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1786 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1788 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1790 = -_1780;
    float _1792 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1790);
    float _1794 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1798 = -_1786;
    float _1800 = fma(_1798, _1784, 1.0);
    float _1802 = -_1778;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1792);
    float _1806 = exp2(_1788);
    float _1808 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1796);
    float _1810 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1812 = fma(_1804, -0.5, 0.5);
    float _1814 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1816 = fma(_1804, 0.5, 0.5);
    float _1818 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1810);
    float _1820 = _1776 + 1.0;
    float _1822 = log2(_1800);
    float _1824 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1818);
    float _1826 = 1.0 / _1808;
    float _1828 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1814);
    float _1830 = fma(_1816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1832 = -_1776;
    float _1834 = fma(_1806, _1820, _1832);
    float _1836 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1824);
    float _1838 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1828);
    float _1840 = fma(_1816, _1830, -0.212114393711090087890625);
    float _1842 = fma(_1834, 0.5, 0.5);
    float _1844 = sqrt(_1812);
    float _1846 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1838);
    float _1848 = fma(_1816, _1840, 1.570728778839111328125);
    float _1850 = _1822 * 0.693147182464599609375;
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1854 = _1836 * _1826;
    float _1856 = _1846 * _1826;
    float _1858 = fma(_1854, 0.5, 0.5);
    float _1860 = fma(_1856, -0.5, 0.5);
    float _1862 = _1844 * 0.636619746685028076171875;
    float3 _4939 = float3(_1858, _1860, _1852);
    float _1864 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4939, float3(0.0), isnan(_4939)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4939, float3(0.0), isnan(_4939)), level(0.0)).x;
    float _1866 = -_1848;
    float _1868 = fma(_1862, _1866, 1.0);
    float3 _4955 = float3(_1858, _1860, _1852);
    float4 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4955, float3(0.0), isnan(_4955)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4955, float3(0.0), isnan(_4955)), level(0.0)).xyzw;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1871.w;
    float2 _4972 = float2(_1868, _1842);
    float3 _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4972, float2(0.0), isnan(_4972)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4972, float2(0.0), isnan(_4972)), level(0.0)).xyz;
    float _1885 = _1883.x;
    float _1887 = _1883.y;
    float _1889 = _1883.z;
    float _1891 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1893 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1895 = _1836 + _1808;
    float _1897 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1891);
    float _1899 = _1895 * 0.5;
    float _1901 = exp2(_1893);
    float _1903 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1897);
    float _1905 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1903);
    float _1907 = _1808 * 0.5;
    float _1909 = _1905 + _1808;
    float _1911 = -_1901;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_1846, -0.5, _1907);
    float _1917 = _1909 * 0.5;
    float _1919 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1836;
    out.gl_Position.y = _1846;
    out.gl_Position.z = _1905;
    out.gl_Position.w = _1808;
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1899;
    out.m_67.y = _1915;
    out.m_67.z = _1917;
    out.m_67.w = _1808;
    out.m_47.x = _1921;
    float _1923 = _1919 * _1864;
    float _1925 = -_1919;
    float _1927 = _1925 + 1.0;
    float _1929 = _1879 * _1923;
    float _1931 = _1889 * _1923;
    float _1933 = fma(_1885, _1929, _1873);
    float _1935 = fma(_1887, _1929, _1875);
    float _1937 = _1879 * _1927;
    float _1939 = fma(_1879, _1931, _1877);
    out.m_69.x = _1933;
    out.m_69.y = _1935;
    out.m_69.z = _1939;
    out.m_69.w = _1937;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1488 = false;
    bool _984 = false;
    bool _844 = false;
    bool _462 = false;
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
        float _1996 = as_type<float>(_104);
        out.gl_Position.z = _1996;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    float _110 = in.m_51.x;
    bool _112 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_108);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_108;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _110;
    if (_120)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2069 = as_type<float>(_142);
        out.gl_Position.z = _2069;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_55.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _282;
    if (!_266)
    {
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _110 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
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
        float _290 = _124 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _292 + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_308;
    float _348 = _346 + 1.0;
    float _350 = 1.0 / _332;
    float _352 = _344 * _348;
    float _354 = -_344;
    float _356 = _354 + 1.0;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = 1.0 / _328;
    float _366 = _324 * _356;
    float _368 = -_324;
    float _370 = _368 + 1.0;
    float _372 = _312 * _350;
    float _374 = _296 * _364;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = fma(_360, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _386 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = in.m_55.x;
    float _392 = in.m_55.y;
    float _394 = in.m_55.z;
    float _396 = _384 * _366;
    float _398 = _386 * _366;
    float _400 = _388 * _366;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _416 = fma(_404, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_408, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _422 = fma(_412, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = fma(_416, _352, _414);
    float _428 = fma(_418, _352, _420);
    float _430 = fma(_422, _352, _424);
    float _432 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _426);
    float _434 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _428);
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _430);
    float _438 = _432 * _390;
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    bool _444 = !_362;
    float _460;
    if (!_444)
    {
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _448 = _110 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_88);
        float _466 = 1.0 / _464;
        float _468 = _124 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _492 = 1.0 / _478;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _502 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _504 = isnan(_470);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _486;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _470 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _520;
    float _524 = 1.0 / _482;
    float _526 = _518 * _492;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _530 = _470 + _528;
    bool _532 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _534 = isnan(_470);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _544;
    float _548 = fma(_522, _526, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _552 = 1.0 / _500;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _556 = _470 + _554;
    float _558 = _530 * _514;
    bool _560 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _562 = isnan(_470);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = 1.0 / _490;
    float _578 = _556 * _524;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _582 = _470 + _580;
    float _584 = -_570;
    float _586 = _584 + 1.0;
    float _588 = _542 * _586;
    float _590 = 1.0 / _496;
    float _592 = _582 * _552;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _594;
    float _598 = fma(_596, _526, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _602 = _470 + _600;
    float _604 = _602 * _576;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _606;
    float _610 = _474 * _590;
    bool _612 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _614 = isnan(_470);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = fma(_608, _526, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _626 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _628 = isnan(_470);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = _622 * _574;
    float _640 = -_622;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _656 = -_636;
    float _658 = _656 + 1.0;
    float _660 = _636 * _642;
    float _662 = fma(_646, _578, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _664 = fma(_650, _578, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _666 = fma(_654, _578, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _668 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _670 = isnan(_470);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _680;
    bool _684 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _686 = isnan(_470);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = _512 * _658;
    float _698 = -_512;
    float _700 = _698 + 1.0;
    float _702 = fma(_682, _610, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _708 = -_694;
    float _710 = _708 + 1.0;
    float _712 = _694 * _700;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _714;
    float _718 = _678 * _710;
    float _720 = -_678;
    float _722 = _720 + 1.0;
    float _724 = fma(_716, _610, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _726 = fma(_546, _610, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _728 = _598 * _718;
    float _730 = _624 * _718;
    float _732 = _548 * _718;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _742 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[107].x, _728);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[107].y, _730);
    float _746 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[107].z, _732);
    float _748 = fma(_740, _592, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _750 = fma(_662, _712, _742);
    float _752 = fma(_664, _712, _744);
    float _754 = fma(_666, _712, _746);
    float _756 = fma(_736, _592, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _758 = fma(_706, _592, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _760 = fma(_724, _696, _750);
    float _762 = fma(_702, _696, _752);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _764;
    float _768 = fma(_726, _696, _754);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _774;
    float _778 = fma(_766, _558, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _780 = fma(_756, _660, _760);
    float _782 = fma(_748, _660, _762);
    float _784 = fma(_758, _660, _768);
    float _786 = fma(_772, _558, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _796 = fma(_776, _558, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _802 = fma(_778, _638, _780);
    float _804 = fma(_790, _604, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _806 = fma(_794, _604, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _808 = fma(_800, _604, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _810 = fma(_786, _638, _782);
    float _812 = fma(_796, _638, _784);
    float _814 = fma(_804, _588, _802);
    float _816 = fma(_806, _588, _810);
    float _818 = fma(_808, _588, _812);
    float _820 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[113].x, _814);
    float _822 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[113].y, _816);
    float _824 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[113].z, _818);
    bool _826 = !_550;
    float _842;
    if (!_826)
    {
        float _828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _830 = _110 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _832 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _834 = _832 * _828;
        float _836 = floor(_834);
        float _838 = -_836;
        float _840 = _834 + _838;
        _842 = _840;
        _844 = true;
    }
    else
    {
        float _846 = float(_88);
        float _848 = 1.0 / _846;
        float _850 = _124 * _848;
        _842 = _850;
    }
    _844 = false;
    float _852 = _842;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _856 = _852 + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _862 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _864 = isnan(_852);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _878 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _880 = isnan(_852);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _890;
    bool _894 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _896 = isnan(_852);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = 1.0 / _860;
    float _908 = -_872;
    float _910 = _908 + 1.0;
    bool _912 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _914 = _888 * _910;
    float _916 = -_888;
    float _918 = _916 + 1.0;
    float _920 = 1.0 / _876;
    float _922 = _892 * _906;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _928 = fma(_922, _856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _930 = _926 * _920;
    float _932 = _928 * _914;
    float _934 = -_904;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _940 = _852 + _938;
    float _942 = _820 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _944 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[115].x, _932);
    float _946 = _872 * _936;
    float _948 = fma(_930, _940, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _950 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = fma(_948, _946, _944);
    float _956 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[117].x, _954);
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _960 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _952;
    out.m_57.y = _962;
    out.m_57.z = _958;
    out.m_57.w = _964;
    bool _966 = !_912;
    float _982;
    if (!_966)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _970 = _110 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _974 = _972 * _968;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _982 = _980;
        _984 = true;
    }
    else
    {
        float _986 = float(_88);
        float _988 = 1.0 / _986;
        float _990 = _124 * _988;
        _982 = _990;
    }
    _984 = false;
    float _992 = _982;
    float _994 = in.m_51.y;
    float _996 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _998 = in.m_59.y;
    float _1000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1008 = _1006 != 0;
    float _1010 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _996);
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1014 = _1012 != 0;
    float _1016 = in.m_59.x;
    float _1018 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1010);
    float _1020 = 1.0 / _1004;
    bool _1022 = _110 > 0.5;
    bool _1024 = _1022 && _1008;
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1028;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1034 = _994 > 0.5;
    float _1036 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1038 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1040 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1036);
    float _1044 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1038);
    bool _1046 = _992 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1048 = isnan(_992);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1054 = _1050 || _1052;
    float _1056 = float(_1054);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1060 = _992 + _1058;
    float _1062 = _1030 * _1020;
    bool _1064 = _992 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1066 = isnan(_992);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1072 = _1068 || _1070;
    float _1074 = float(_1072);
    float _1076 = -_998;
    float _1078 = _1076 + 1.0;
    float _1080 = -_1056;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_1062, _1060, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1086 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1042);
    float _1088 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1044);
    float _1090 = _1074 * _1082;
    float _1092 = _998;
    float _1094 = _1060;
    int _1096 = as_type<int>(_1040);
    if (_1014)
    {
        float _1098 = _1034 ? _1078 : _998;
        _1092 = _1098;
    }
    float _1100 = _1092;
    float _1102 = -_1074;
    float _1104 = _1102 + 1.0;
    float _1106 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = _1084 * _1090;
    float _1110 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1112 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1116 = _1106 + _1114;
    float _1118 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1108);
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1122 = _1110 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1126 = _1112 + _1124;
    float _1128 = _1016;
    float _1130 = _1110;
    if (!_1008)
    {
        _1094 = _1016;
    }
    float _1132 = _1094;
    float _1134 = _1132;
    if (_1024)
    {
        float _1136 = -_1016;
        float _1138 = _1136 + 1.0;
        _1128 = _1138;
    }
    float _1140 = _1128;
    float _1142 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1144 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1118);
    float _1146 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1148 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1142);
    float _1150 = _1122 * _1122;
    float _1152 = _1150;
    int _1154 = as_type<int>(_1144);
    if (_1008)
    {
        _1134 = _1140;
    }
    float _1156 = _1134;
    float _1158 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1160 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1148);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1166 = _1160 >= 0.0;
    float _1168 = _1146 * _1000;
    float _1170 = fma(_1116, _1116, _1150);
    float _1172 = _1164 * _1026;
    float _1174 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = fma(_1126, _1126, _1170);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1180 = rsqrt(_1176);
    out.m_61.x = _1172;
    out.m_61.y = _1168;
    if (_1166)
    {
        _1152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1182 = _1152;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1166)
    {
        out.m_47.x = 0.0;
    }
    if (_1166)
    {
        float _1186 = _1182 * 5.0;
        _1154 = as_type<int>(_1186);
    }
    int _1188 = _1154;
    out.m_63.x = _1174;
    out.m_63.y = _1184;
    out.m_63.z = _1040;
    out.m_63.w = _1158;
    if (_1166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3802 = as_type<float>(_1188);
        out.gl_Position.z = _3802;
    }
    float _1190 = _1122 * _1180;
    float _1192 = _1116 * _1180;
    if (_1166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1194 = -_1190;
    float _1196 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1110);
    float _1198 = _1126 * _1180;
    float _1200 = -_1192;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1106);
    float _1204 = -_1190;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1210 = _1196 + _1208;
    float _1212 = -_1198;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1112);
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1218 = _1202 + _1216;
    float _1220 = -_1192;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1224 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1214 + _1226;
    float _1230 = -_1198;
    float _1232 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    float _1234 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1224);
    float _1236 = _1206 * _1206;
    float _1238 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1234);
    float _1240 = fma(_1222, _1222, _1236);
    bool _1242 = _1238 >= 0.0;
    float _1244 = fma(_1232, _1232, _1240);
    float _1246 = _1238;
    if (_1242)
    {
        _1246 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1248 = _1246;
    if (_1242)
    {
        out.m_47.x = 0.0;
    }
    if (_1242)
    {
        float _1250 = _1248 * 5.0;
        _1096 = as_type<int>(_1250);
    }
    int _1252 = _1096;
    if (_1242)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3929 = as_type<float>(_1252);
        out.gl_Position.z = _3929;
    }
    if (_1242)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1254 = in.m_65.x;
    float _1256 = in.m_65.y;
    float _1258 = in.m_65.z;
    float _1260 = sqrt(_1244);
    float _1262 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1264 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1266 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1268 = _1180 * _1260;
    float _1270 = _1268 * _1262;
    float _1272 = _1268 * _1264;
    float _1274 = _1268 * _1266;
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1256);
    float _1278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1254);
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1258);
    float _1282 = _1270 * _1276;
    float _1284 = _1272 * _1278;
    float _1286 = _1274 * _1280;
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1294 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1288);
    float _1296 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1290);
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1292);
    float _1300 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1294);
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1296);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1298);
    float _1306 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1308 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1310 = _1106 + _1306;
    float _1312 = _1112 + _1308;
    float _1314 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1318 = _1310 + _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1322 = _1312 + _1320;
    float _1324 = _1110 + _1314;
    float _1326 = _1318 * _1318;
    float _1328 = _1322 * _1322;
    float _1330 = _1326 + _1328;
    float _1332 = sqrt(_1330);
    bool _1334 = _1332 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1336 = _1314;
    float _1338 = _1284;
    float _1340 = _1310;
    float _1342 = _1326;
    float _1344 = _1332;
    if (!_1334)
    {
        _1336 = _1326;
    }
    float _1346 = _1336;
    float _1348 = _1346;
    if (!_1334)
    {
        _1130 = _1310;
    }
    float _1350 = _1130;
    float _1352 = _1350;
    if (!_1334)
    {
        _1338 = _1328;
    }
    float _1354 = _1338;
    float _1356 = _1354;
    if (!_1334)
    {
        _1340 = _1312;
    }
    float _1358 = _1340;
    float _1360 = _1358;
    if (!_1334)
    {
        _1342 = _1324;
    }
    float _1362 = _1342;
    bool _1364 = !_1334;
    float _1366 = _1362;
    if (!_1364)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1372 = _1332 + _1370;
        float _1374 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = rsqrt(_1330);
        float _1378 = _1372 * _1368;
        float _1380 = _1378 * 0.15915493667125701904296875;
        float _1382 = _1380 * 6.283185482025146484375;
        float _1384 = sin(_1382);
        float _1386 = _1380 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = fma(_1384, _1374, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1392 = _1376 * _1390;
        float _1394 = _1388 + (-1.0);
        float _1396 = fma(_1318, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1398 = fma(_1322, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1400 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1404 = _1396 + _1402;
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1408 = _1398 + _1406;
        float _1410 = fma(_1324, _1388, _1400);
        float _1412 = _1404 * _1404;
        float _1414 = _1408 * _1408;
        _1366 = _1410;
        _1348 = _1412;
        _1356 = _1414;
        _1344 = _1372;
        _1352 = _1396;
        _1360 = _1398;
    }
    float _1416 = _1366;
    float _1418 = _1348;
    float _1420 = _1356;
    float _1422 = _1344;
    float _1424 = _1352;
    float _1426 = _1360;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1430 = _1416 + _1428;
    float _1432 = fma(_1430, _1430, _1418);
    float _1434 = _1432 + _1420;
    float _1436 = sqrt(_1434);
    bool _1438 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1440 = isnan(_1436);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1446 = _1442 || _1444;
    float _1448 = _1418;
    float _1450 = _1422;
    float _1452 = _1434;
    if (!_1446)
    {
        _1448 = 1.0;
    }
    float _1454 = _1448;
    bool _1456 = !_1446;
    float _1458 = _1454;
    if (!_1456)
    {
        bool _1460 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1462 = isnan(_1436);
        bool _1464 = _1460 || _1462;
        bool _1466 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1468 = _1464 || _1466;
        if (!_1468)
        {
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = _1436 + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1476 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1474;
            float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1480 = _1478 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1482 = 1.0 / _1476;
            float _1484 = _1472 * _1482;
            float _1486 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1458 = _1486;
            _1450 = _1482;
            _1452 = _1476;
            _1488 = true;
        }
        else
        {
            bool _1490 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1492 = isnan(_1436);
            bool _1494 = _1490 || _1492;
            bool _1496 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1498 = _1494 || _1496;
            if (!_1498)
            {
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1436 + _1500;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1510 = _1508 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1512 = 1.0 / _1506;
                float _1514 = _1502 * _1512;
                float _1516 = fma(_1514, _1510, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1458 = _1516;
                _1450 = _1512;
                _1452 = _1506;
                _1488 = true;
            }
            else
            {
                _1458 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1488 = false;
    float _1518 = _1458;
    float _1520 = _1450;
    float _1522 = _1452;
    float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1526 = _1416 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1530 = _1424 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1534 = _1426 + _1532;
    float _1536 = fma(_1526, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1538 = fma(_1530, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1540 = fma(_1534, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1542 = -_1190;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1536);
    float _1546 = -_1192;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1550 = -_1198;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1556 = _1544 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1560 = _1548 + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1564 = _1552 + _1562;
    float _1566 = _1556 * _1556;
    float _1568 = fma(_1560, _1560, _1566);
    float _1570 = fma(_1564, _1564, _1568);
    float _1572 = rsqrt(_1570);
    float _1574 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1576 = _1560 * _1574;
    float _1578 = _1564 * _1574;
    float _1580 = _1576 * _1576;
    float _1582 = _1578 * _1578;
    float _1584 = _1580 + _1582;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1586 + _1590;
    float _1594 = _1520;
    float _1596 = _1584;
    float _1598 = _1592;
    float _1600 = _1556;
    float _1602 = _1574;
    float _1604 = _1576;
    if (_1588)
    {
        float _1606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1606;
    }
    float _1608 = _1594;
    if (_1588)
    {
        float _1610 = rsqrt(_1584);
        _1596 = _1610;
    }
    float _1612 = _1596;
    float _1614 = _1608;
    if (_1588)
    {
        float _1616 = _1592 * _1608;
        _1598 = _1616;
    }
    float _1618 = _1598;
    if (_1588)
    {
        float _1620 = _1618 * 0.15915493667125701904296875;
        _1614 = _1620;
    }
    float _1622 = _1614;
    float _1624 = _1564;
    float _1626 = _1622;
    if (_1588)
    {
        float _1628 = _1622 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        _1624 = _1630;
    }
    float _1632 = _1624;
    float _1634 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1636 = precise::max(0.0, _1634);
    float _1638 = _1522;
    float _1640 = _1636;
    if (_1588)
    {
        float _1642 = _1622 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        _1638 = _1644;
    }
    float _1646 = _1638;
    float _1648 = -_1574;
    float _1650 = -_1636;
    float _1652 = fma(_1556, _1648, _1650);
    if (_1588)
    {
        float _1654 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1654;
    }
    float _1656 = _1600;
    float _1658 = _1656;
    float _1660 = _1632;
    if (_1588)
    {
        float _1662 = fma(_1632, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = _1664;
    if (!_1588)
    {
        _1660 = _1580;
    }
    float _1668 = _1660;
    float _1670 = _1668;
    float _1672 = _1646;
    if (_1588)
    {
        float _1674 = _1646 + (-1.0);
        _1640 = _1674;
    }
    float _1676 = _1640;
    float _1678 = _1676;
    if (_1588)
    {
        float _1680 = _1612 * _1664;
        _1602 = _1680;
    }
    float _1682 = _1602;
    if (!_1588)
    {
        _1666 = _1652;
    }
    float _1684 = _1666;
    float _1686 = sqrt(_1570);
    float _1688 = _1684;
    if (_1588)
    {
        float _1690 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1690;
    }
    float _1692 = _1626;
    if (_1588)
    {
        float _1694 = _1576 * _1682;
        _1604 = _1694;
    }
    float _1696 = _1604;
    if (!_1588)
    {
        _1678 = _1578;
    }
    float _1698 = _1678;
    float _1700 = _1698;
    if (_1588)
    {
        float _1702 = _1578 * _1682;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (_1588)
    {
        float _1706 = fma(_1652, _1646, _1692);
        _1688 = _1706;
    }
    float _1708 = _1688;
    if (_1588)
    {
        float _1710 = _1696 * _1696;
        _1670 = _1710;
    }
    float _1712 = _1670;
    if (!_1588)
    {
        _1672 = _1582;
    }
    float _1714 = _1672;
    float _1716 = _1714;
    if (_1588)
    {
        float _1718 = _1704 * _1704;
        _1716 = _1718;
    }
    float _1720 = _1716;
    float _1722 = fma(_1708, _1708, _1712);
    float _1724 = _1722 + _1720;
    float _1726 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1730 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1728);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1736 = rsqrt(_1724);
    float _1738 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1726);
    float _1740 = -_1732;
    float _1742 = _1740 + 1.0;
    float _1744 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1746 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1734);
    float _1748 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1750 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1738);
    float _1752 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1744);
    float _1754 = abs(_1742);
    float _1756 = log2(_1754);
    float _1758 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1746);
    float _1760 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1748);
    float _1762 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1764 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1766 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1768 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1760);
    float _1770 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1772 = _1736 * _1696;
    float _1774 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1776 = _1736 * _1708;
    float _1778 = _1736 * _1704;
    float _1780 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1782 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1774);
    float _1784 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1786 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1788 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1790 = -_1780;
    float _1792 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1790);
    float _1794 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1798 = -_1786;
    float _1800 = fma(_1798, _1784, 1.0);
    float _1802 = -_1778;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1792);
    float _1806 = exp2(_1788);
    float _1808 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1796);
    float _1810 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1812 = fma(_1804, -0.5, 0.5);
    float _1814 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1816 = fma(_1804, 0.5, 0.5);
    float _1818 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1810);
    float _1820 = _1776 + 1.0;
    float _1822 = log2(_1800);
    float _1824 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1818);
    float _1826 = 1.0 / _1808;
    float _1828 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1814);
    float _1830 = fma(_1816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1832 = -_1776;
    float _1834 = fma(_1806, _1820, _1832);
    float _1836 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1824);
    float _1838 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1828);
    float _1840 = fma(_1816, _1830, -0.212114393711090087890625);
    float _1842 = fma(_1834, 0.5, 0.5);
    float _1844 = sqrt(_1812);
    float _1846 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1838);
    float _1848 = fma(_1816, _1840, 1.570728778839111328125);
    float _1850 = _1822 * 0.693147182464599609375;
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1854 = _1836 * _1826;
    float _1856 = _1846 * _1826;
    float _1858 = fma(_1854, 0.5, 0.5);
    float _1860 = fma(_1856, -0.5, 0.5);
    float _1862 = _1844 * 0.636619746685028076171875;
    float3 _4939 = float3(_1858, _1860, _1852);
    float _1864 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4939, float3(0.0), isnan(_4939)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4939, float3(0.0), isnan(_4939)), level(0.0)).x;
    float _1866 = -_1848;
    float _1868 = fma(_1862, _1866, 1.0);
    float3 _4955 = float3(_1858, _1860, _1852);
    float4 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4955, float3(0.0), isnan(_4955)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4955, float3(0.0), isnan(_4955)), level(0.0)).xyzw;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1871.w;
    float2 _4972 = float2(_1868, _1842);
    float3 _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4972, float2(0.0), isnan(_4972)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4972, float2(0.0), isnan(_4972)), level(0.0)).xyz;
    float _1885 = _1883.x;
    float _1887 = _1883.y;
    float _1889 = _1883.z;
    float _1891 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1893 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1895 = _1836 + _1808;
    float _1897 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1891);
    float _1899 = _1895 * 0.5;
    float _1901 = exp2(_1893);
    float _1903 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1897);
    float _1905 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1903);
    float _1907 = _1808 * 0.5;
    float _1909 = _1905 + _1808;
    float _1911 = -_1901;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_1846, -0.5, _1907);
    float _1917 = _1909 * 0.5;
    float _1919 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1836;
    out.gl_Position.y = _1846;
    out.gl_Position.z = _1905;
    out.gl_Position.w = _1808;
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1899;
    out.m_67.y = _1915;
    out.m_67.z = _1917;
    out.m_67.w = _1808;
    out.m_47.x = _1921;
    float _1923 = _1919 * _1864;
    float _1925 = -_1919;
    float _1927 = _1925 + 1.0;
    float _1929 = _1879 * _1923;
    float _1931 = _1889 * _1923;
    float _1933 = fma(_1885, _1929, _1873);
    float _1935 = fma(_1887, _1929, _1875);
    float _1937 = _1879 * _1927;
    float _1939 = fma(_1879, _1931, _1877);
    out.m_69.x = _1933;
    out.m_69.y = _1935;
    out.m_69.z = _1939;
    out.m_69.w = _1937;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

