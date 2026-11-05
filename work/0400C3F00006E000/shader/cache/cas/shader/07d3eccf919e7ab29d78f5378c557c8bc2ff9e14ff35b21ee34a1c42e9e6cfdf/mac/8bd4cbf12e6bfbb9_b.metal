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
    float4 m_63 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1246 = false;
    bool _464 = false;
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
        float _1800 = as_type<float>(_104);
        out.gl_Position.z = _1800;
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
        float _1869 = as_type<float>(_140);
        out.gl_Position.z = _1869;
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
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
    float _390 = in.m_51.x;
    float _392 = in.m_51.y;
    float _394 = in.m_51.z;
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
    float _416 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _418 = fma(_404, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_408, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_412, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = fma(_418, _352, _414);
    float _428 = fma(_420, _352, _416);
    float _430 = fma(_422, _352, _424);
    float _432 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _426);
    float _434 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _428);
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _430);
    float _438 = _432 * _390;
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    bool _444 = !_362;
    float _462;
    if (!_444)
    {
        float _446 = in.m_53.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_88);
        float _468 = 1.0 / _466;
        float _470 = _122 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_55.y;
    float _476 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _478 = in.m_53.y;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _482 = _480 != 0;
    float _484 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _488 = _486 != 0;
    float _490 = in.m_53.w;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _494 = _492 != 0;
    float _496 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _498 = in.m_53.z;
    float _500 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _504 = _502 != 0;
    float _506 = in.m_53.x;
    float _508 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _496);
    float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _512 = in.m_55.x;
    float _514 = -_474;
    float _516 = _514 + 1.0;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _522 = _478 > 0.5;
    bool _524 = _490 > 0.5;
    int _526 = _522 ? as_type<int>(_516) : as_type<int>(_474);
    bool _528 = _498 > 0.5;
    float _530 = _482 ? as_type<float>(_526) : _474;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _536 = _506 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _538 = _528 ? as_type<int>(_516) : as_type<int>(_474);
    float _540 = 1.0 / _534;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _544 = _542 != 0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _550 = _494 ? as_type<float>(_538) : _474;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _554 = _552 != 0;
    float _556 = 1.0 / _548;
    float _558 = _474;
    float _560 = _484;
    bool _562 = _488;
    float _564 = _478;
    if (_488)
    {
        float _566 = _524 ? _516 : _474;
        _558 = _566;
    }
    float _568 = _558;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _476);
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _578 = _576 != 0;
    float _580 = _478 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _586 = -_570;
    float _588 = fma(_536, 2.0, _586);
    float _590 = fma(_580, -2.0, _572);
    float _592 = 1.0 / _584;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _602 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
    float _604 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _500);
    float _606 = _596 * _540;
    float _608 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    float _610 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _508);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _612;
    float _616 = _600 * _556;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _622 = _606;
    float _624 = _608;
    if (_578)
    {
        _560 = _506;
    }
    float _626 = _560;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _630 = _626;
    if (!_578)
    {
        _630 = _498;
    }
    float _632 = _630;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _636 = _614 * _592;
    float _638 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[78].w, _628);
    float _640 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[88].w, _618);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _644 = _472 + _642;
    if (_504)
    {
        bool _646 = _506 > 0.5;
        _562 = _646;
    }
    bool _648 = _562;
    float _650 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[78].z, _620);
    float _652 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[88].z, _634);
    if (!_578)
    {
        _564 = _506;
    }
    float _654 = _564;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _658 = _472 + _656;
    float _660 = fma(_606, _644, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _664 = _472 + _662;
    bool _666 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _668 = isnan(_472);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = fma(_636, _658, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _680 = _510 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _682 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _684 = isnan(_472);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = fma(_616, _664, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _696 = _520 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _698 = fma(_680, _530, -0.5);
    bool _700 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _702 = isnan(_472);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -_676;
    float _714 = _712 + 1.0;
    float _716 = -_692;
    float _718 = _716 + 1.0;
    float _720 = fma(_550, _696, -0.5);
    bool _722 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _724 = isnan(_472);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = _710 * _714;
    float _736 = _676 * _718;
    float _738 = -_710;
    float _740 = _738 + 1.0;
    float _742 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _638);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _746 = _632 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _748 = _732 * _740;
    float _750 = _654 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _752 = -_732;
    float _754 = _752 + 1.0;
    float _756 = -_744;
    float _758 = fma(_746, 2.0, _756);
    int _760 = as_type<int>(_746);
    float _762 = _748;
    int _764 = as_type<int>(_660);
    if (_544)
    {
        float _766 = -_512;
        float _768 = _766 + 1.0;
        _760 = as_type<int>(_768);
    }
    int _770 = _760;
    float _772 = _660 * _748;
    float _774 = fma(_750, -2.0, _518);
    float _776 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _778 = -_608;
    float _780 = fma(_742, _698, _778);
    if (!_544)
    {
        _762 = _512;
    }
    float _782 = _762;
    float _784 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[115].x, _772);
    float _786 = _782;
    if (_544)
    {
        float _788 = _528 ? as_type<float>(_770) : _512;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = -_122;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[76].x, _588);
    float _796 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _650);
    float _798 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _652);
    float _800 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _640);
    float _802 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _774);
    float _804 = -_122;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[86].x, _758);
    float _808 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _812 = _776 + _810;
    float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_504)
    {
        float _816 = -_512;
        float _818 = _816 + 1.0;
        _764 = as_type<int>(_818);
    }
    int _820 = _764;
    float _822 = -_802;
    float _824 = fma(_800, _720, _822);
    float _826 = _610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _830 = _808 + _828;
    float _832 = _812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _834 = as_type<int>(_824);
    if (!_504)
    {
        _622 = _512;
    }
    float _836 = _622;
    float _838 = fma(_694, _734, _784);
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _842 = _836;
    if (_504)
    {
        float _844 = _648 ? as_type<float>(_820) : _512;
        _842 = _844;
    }
    float _846 = _842;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _850 = _826 + _848;
    float _852 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[28].x, _832);
    int _854 = 0;
    if (_554)
    {
        float _856 = -_512;
        float _858 = _856 + 1.0;
        _854 = as_type<int>(_858);
    }
    int _860 = _854;
    float _862 = fma(_678, _736, _838);
    if (!_554)
    {
        _624 = _512;
    }
    float _864 = _624;
    float _866 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[28].z, _852);
    float _868 = _812 * _812;
    float _870 = _864;
    if (_554)
    {
        float _872 = _522 ? as_type<float>(_860) : _512;
        _870 = _872;
    }
    float _874 = _870;
    float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _878 = _814 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _880 = _866 >= 0.0;
    float _882 = _790 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _884 = fma(_830, _830, _868);
    float _886 = fma(_878, _846, -0.5);
    float _888 = _840 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _892 = fma(_850, _850, _884);
    float _894 = fma(_888, _874, -0.5);
    float _896 = fma(_796, _886, _794);
    float _898 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[118].x, _862);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _902 = rsqrt(_892);
    float _904 = fma(_798, _894, _806);
    float _906 = _568 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_880)
    {
        _910 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _912 = _910;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _922 = _882 * _876;
    float _924 = _824 + 0.5;
    float _926 = _906 * _890;
    float _928 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = _780 + 0.5;
    float _942 = _896 + 0.5;
    float _944 = _904 + 0.5;
    float _946 = _898 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_880)
    {
        float _948 = _912 * 5.0;
        _834 = as_type<int>(_948);
    }
    int _950 = _834;
    out.m_57.x = _934;
    out.m_57.y = _936;
    out.m_57.z = _938;
    float _952 = _812 * _902;
    float _954 = _830 * _902;
    out.m_59.x = _942;
    out.m_59.y = _940;
    out.m_59.z = _922;
    out.m_59.w = _926;
    out.m_61.x = _944;
    out.m_61.y = _924;
    out.m_63.x = _928;
    out.m_63.y = _930;
    out.m_63.z = _932;
    out.m_63.w = _946;
    float _956 = as_type<float>(_950);
    if (_880)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3271 = as_type<float>(_950);
        out.gl_Position.z = _3271;
    }
    if (_880)
    {
        out.m_47.x = 0.0;
    }
    if (_880)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _958 = -_952;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    float _962 = _850 * _902;
    float _964 = -_954;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _968 = -_952;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _812);
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _960 + _972;
    float _976 = -_962;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _826);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = _966 + _980;
    float _984 = -_954;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _830);
    float _988 = _974 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _992 = _978 + _990;
    float _994 = _970 * _970;
    float _996 = -_962;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[28].x, _988);
    float _1002 = fma(_986, _986, _994);
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1000);
    float _1006 = fma(_998, _998, _1002);
    bool _1008 = _1004 >= 0.0;
    float _1010 = _960;
    float _1012 = _974;
    float _1014 = _978;
    if (_1008)
    {
        _956 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1016 = _956;
    int _1018 = as_type<int>(_1016);
    if (_1008)
    {
        out.m_47.x = 0.0;
    }
    if (_1008)
    {
        float _1020 = _1016 * 5.0;
        _1018 = as_type<int>(_1020);
    }
    int _1022 = _1018;
    if (_1008)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3400 = as_type<float>(_1022);
        out.gl_Position.z = _3400;
    }
    if (_1008)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1024 = in.m_65.x;
    float _1026 = in.m_65.y;
    float _1028 = in.m_65.z;
    float _1030 = sqrt(_1006);
    float _1032 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1034 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1036 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1038 = _902 * _1030;
    float _1040 = _1038 * _1032;
    float _1042 = _1038 * _1034;
    float _1044 = _1038 * _1036;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1048 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1024);
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1028);
    float _1052 = _1046 * _1040;
    float _1054 = _1048 * _1042;
    float _1056 = _1050 * _1044;
    float _1058 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1064 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1060);
    float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1062);
    float _1070 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1064);
    float _1072 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1066);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    float _1076 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1078 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1082 = _808 + _1076;
    float _1084 = _826 + _1078;
    float _1086 = _776 + _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1090 = _1082 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1094 = _1084 + _1092;
    float _1096 = _1090 * _1090;
    float _1098 = _1094 * _1094;
    float _1100 = _1096 + _1098;
    float _1102 = sqrt(_1100);
    bool _1104 = _1102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1106 = _1054;
    float _1108 = _1080;
    float _1110 = _1056;
    float _1112 = _1098;
    float _1114 = _1082;
    float _1116 = _1086;
    if (!_1104)
    {
        _1106 = _1096;
    }
    float _1118 = _1106;
    float _1120 = _1118;
    if (!_1104)
    {
        _1108 = _1084;
    }
    float _1122 = _1108;
    float _1124 = _1122;
    if (!_1104)
    {
        _1110 = _1086;
    }
    float _1126 = _1110;
    bool _1128 = !_1104;
    float _1130 = _1126;
    if (!_1128)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1136 = _1102 + _1134;
        float _1138 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1140 = rsqrt(_1100);
        float _1142 = _1136 * _1132;
        float _1144 = _1142 * 0.15915493667125701904296875;
        float _1146 = _1144 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = _1144 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        float _1154 = fma(_1148, _1138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1156 = _1140 * _1154;
        float _1158 = _1152 + (-1.0);
        float _1160 = fma(_1090, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1162 = fma(_1094, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1164 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1168 = _1160 + _1166;
        float _1170 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1172 = _1162 + _1170;
        float _1174 = fma(_1086, _1152, _1164);
        float _1176 = _1168 * _1168;
        float _1178 = _1172 * _1172;
        _1130 = _1174;
        _1120 = _1176;
        _1112 = _1178;
        _1114 = _1160;
        _1124 = _1162;
    }
    float _1180 = _1130;
    float _1182 = _1120;
    float _1184 = _1112;
    float _1186 = _1114;
    float _1188 = _1124;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1192 = _1180 + _1190;
    float _1194 = fma(_1192, _1192, _1182);
    float _1196 = _1194 + _1184;
    float _1198 = sqrt(_1196);
    bool _1200 = _1198 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1202 = isnan(_1198);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1208 = _1204 || _1206;
    float _1210 = _1182;
    if (!_1208)
    {
        _1210 = 1.0;
    }
    float _1212 = _1210;
    bool _1214 = !_1208;
    float _1216 = _1212;
    if (!_1214)
    {
        bool _1218 = _1198 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1220 = isnan(_1198);
        bool _1222 = _1218 || _1220;
        bool _1224 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1226 = _1222 || _1224;
        if (!_1226)
        {
            float _1228 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1230 = _1198 + _1228;
            float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1234 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1232;
            float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1238 = _1236 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1240 = 1.0 / _1234;
            float _1242 = _1230 * _1240;
            float _1244 = fma(_1242, _1238, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1216 = _1244;
            _1246 = true;
        }
        else
        {
            bool _1248 = _1198 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1250 = isnan(_1198);
            bool _1252 = _1248 || _1250;
            bool _1254 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1256 = _1252 || _1254;
            if (!_1256)
            {
                float _1258 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1260 = _1198 + _1258;
                float _1262 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1264 = _1262 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1266 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1268 = _1266 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1270 = 1.0 / _1264;
                float _1272 = _1260 * _1270;
                float _1274 = fma(_1272, _1268, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1216 = _1274;
                _1246 = true;
            }
            else
            {
                _1216 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1246 = false;
    float _1276 = _1216;
    float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1280 = _1180 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1284 = _1186 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1288 = _1188 + _1286;
    bool _1290 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    float _1300 = fma(_1280, _1276, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1302 = fma(_1284, _1276, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1304 = fma(_1288, _1276, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1306 = -_952;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1310 = -_954;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1302);
    float _1314 = -_962;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1304);
    float _1318 = _1308;
    float _1320 = _1312;
    float _1322 = _1316;
    if (!_1298)
    {
        float _1324 = _974 * _974;
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1328 = -_826;
        float _1330 = _1328 + _1304;
        float _1332 = fma(_982, _982, _1324);
        float _1334 = fma(_992, _992, _1332);
        float _1336 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1338 = sqrt(_1334);
        float _1340 = 1.0 / _1038;
        float _1342 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1344 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1346 = _1344 * _1326;
        float _1348 = _1346 * _1340;
        float _1350 = -_808;
        float _1352 = _1350 + _1302;
        float _1354 = -_776;
        float _1356 = _1354 + _1300;
        float _1358 = _1342 * _1348;
        float _1360 = _1330 * _1348;
        float _1362 = fma(_1352, _1358, _966);
        float _1364 = fma(_1356, _1358, _960);
        float _1366 = fma(_1342, _1360, _978);
        _1318 = _1364;
        _1320 = _1362;
        _1322 = _1366;
    }
    float _1368 = _1318;
    float _1370 = _1320;
    float _1372 = _1322;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1376 = _1368 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1380 = _1370 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1384 = _1372 + _1382;
    float _1386 = _1376 * _1376;
    float _1388 = fma(_1380, _1380, _1386);
    float _1390 = fma(_1384, _1384, _1388);
    float _1392 = rsqrt(_1390);
    float _1394 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1380 * _1394;
    float _1398 = _1384 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 + _1402;
    float _1406 = sqrt(_1404);
    bool _1408 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1406 + _1410;
    float _1414 = _1384;
    float _1416 = _1412;
    float _1418 = _1396;
    if (_1408)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1420;
    }
    float _1422 = _1414;
    if (_1408)
    {
        float _1424 = rsqrt(_1404);
        _1010 = _1424;
    }
    float _1426 = _1010;
    float _1428 = _1426;
    if (_1408)
    {
        float _1430 = _1412 * _1422;
        _1416 = _1430;
    }
    float _1432 = _1416;
    if (_1408)
    {
        float _1434 = _1432 * 0.15915493667125701904296875;
        _1012 = _1434;
    }
    float _1436 = _1012;
    float _1438 = _1386;
    if (_1408)
    {
        float _1440 = _1436 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        _1438 = _1442;
    }
    float _1444 = _1438;
    float _1446 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1448 = precise::max(0.0, _1446);
    float _1450 = _1392;
    float _1452 = _1448;
    float _1454 = _1446;
    if (_1408)
    {
        float _1456 = _1436 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        _1450 = _1458;
    }
    float _1460 = _1450;
    float _1462 = -_1394;
    float _1464 = -_1448;
    float _1466 = fma(_1376, _1462, _1464);
    if (!_1408)
    {
        _1452 = _1400;
    }
    float _1468 = _1452;
    float _1470 = _1468;
    if (_1408)
    {
        float _1472 = _1466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1454 = _1472;
    }
    float _1474 = _1454;
    float _1476 = sqrt(_1390);
    float _1478 = _1444;
    float _1480 = _1474;
    if (_1408)
    {
        float _1482 = fma(_1444, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1482;
    }
    float _1484 = _1478;
    float _1486 = _1484;
    if (_1408)
    {
        float _1488 = _1460 + (-1.0);
        _1480 = _1488;
    }
    float _1490 = _1480;
    float _1492 = _1490;
    if (_1408)
    {
        float _1494 = _1426 * _1484;
        _1116 = _1494;
    }
    float _1496 = _1116;
    if (!_1408)
    {
        _1428 = _1466;
    }
    float _1498 = _1428;
    float _1500 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1502 = _1498;
    if (_1408)
    {
        float _1504 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1014 = _1504;
    }
    float _1506 = _1014;
    if (_1408)
    {
        float _1508 = _1396 * _1496;
        _1418 = _1508;
    }
    float _1510 = _1418;
    if (!_1408)
    {
        _1486 = _1398;
    }
    float _1512 = _1486;
    float _1514 = _1512;
    if (_1408)
    {
        float _1516 = _1398 * _1496;
        _1514 = _1516;
    }
    float _1518 = _1514;
    if (_1408)
    {
        float _1520 = fma(_1466, _1460, _1506);
        _1502 = _1520;
    }
    float _1522 = _1502;
    if (_1408)
    {
        float _1524 = _1510 * _1510;
        _1470 = _1524;
    }
    float _1526 = _1470;
    if (!_1408)
    {
        _1492 = _1402;
    }
    float _1528 = _1492;
    float _1530 = _1528;
    if (_1408)
    {
        float _1532 = _1518 * _1518;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1522, _1522, _1526);
    float _1538 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1500);
    float _1540 = _1536 + _1534;
    float _1542 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1552 = rsqrt(_1540);
    float _1554 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1556 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1558 = -_1548;
    float _1560 = _1558 + 1.0;
    float _1562 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1554);
    float _1566 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1556);
    float _1568 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1572 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1566);
    float _1574 = abs(_1560);
    float _1576 = log2(_1574);
    float _1578 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1568);
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1582 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1584 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1538);
    float _1586 = _1552 * _1510;
    float _1588 = -_1580;
    float _1590 = fma(_1588, _1550, 1.0);
    float _1592 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1596 = _1552 * _1522;
    float _1598 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1600 = _1552 * _1518;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1594);
    float _1604 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1606 = -_1598;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = log2(_1590);
    float _1612 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1602);
    float _1614 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1616 = -_1600;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1620 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1622 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1612);
    float _1624 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1626 = fma(_1618, -0.5, 0.5);
    float _1628 = exp2(_1614);
    float _1630 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1620);
    float _1632 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1624);
    float _1634 = fma(_1618, 0.5, 0.5);
    float _1636 = _1596 + 1.0;
    float _1638 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1640 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1632);
    float _1642 = fma(_1634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1644 = 1.0 / _1622;
    float _1646 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1648 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1640);
    float _1650 = fma(_1634, _1642, -0.212114393711090087890625);
    float _1652 = _1610 * 0.693147182464599609375;
    float _1654 = fma(_1634, _1650, 1.570728778839111328125);
    float _1656 = sqrt(_1626);
    float _1658 = -_1596;
    float _1660 = fma(_1628, _1636, _1658);
    float _1662 = fma(_1660, 0.5, 0.5);
    float _1664 = _1646 * _1644;
    float _1666 = _1648 * _1644;
    float _1668 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1666, -0.5, 0.5);
    float _1674 = _1656 * 0.636619746685028076171875;
    float3 _4479 = float3(_1670, _1672, _1668);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4479, float3(0.0), isnan(_4479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4479, float3(0.0), isnan(_4479)), level(0.0)).x;
    float3 _4490 = float3(_1670, _1672, _1668);
    float4 _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4490, float3(0.0), isnan(_4490)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4490, float3(0.0), isnan(_4490)), level(0.0)).xyzw;
    float _1681 = _1679.x;
    float _1683 = _1679.y;
    float _1685 = _1679.z;
    float _1687 = _1679.w;
    float _1689 = -_1654;
    float _1691 = fma(_1674, _1689, 1.0);
    float2 _4512 = float2(_1691, _1662);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4512, float2(0.0), isnan(_4512)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4512, float2(0.0), isnan(_4512)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1705 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1707 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1705);
    float _1709 = exp2(_1703);
    float _1711 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1707);
    float _1713 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1711);
    float _1715 = _1713 + _1622;
    float _1717 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1648;
    out.gl_Position.z = _1713;
    out.gl_Position.w = _1622;
    float _1719 = _1715 * 0.5;
    float _1721 = -_1709;
    float _1723 = _1721 + 1.0;
    out.m_47.x = _1717;
    float _1725 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1719;
    out.m_67.w = _1622;
    float _1727 = _1725 * _1676;
    float _1729 = -_1725;
    float _1731 = _1729 + 1.0;
    float _1733 = _1687 * _1727;
    float _1735 = _1687 * _1731;
    float _1737 = _1701 * _1727;
    float _1739 = fma(_1697, _1733, _1681);
    float _1741 = fma(_1699, _1733, _1683);
    float _1743 = fma(_1687, _1737, _1685);
    out.m_69.x = _1739;
    out.m_69.y = _1741;
    out.m_69.z = _1743;
    out.m_69.w = _1735;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1246 = false;
    bool _464 = false;
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
        float _1800 = as_type<float>(_104);
        out.gl_Position.z = _1800;
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
        float _1869 = as_type<float>(_140);
        out.gl_Position.z = _1869;
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
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
    float _390 = in.m_51.x;
    float _392 = in.m_51.y;
    float _394 = in.m_51.z;
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
    float _416 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _418 = fma(_404, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_408, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_412, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = fma(_418, _352, _414);
    float _428 = fma(_420, _352, _416);
    float _430 = fma(_422, _352, _424);
    float _432 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _426);
    float _434 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _428);
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _430);
    float _438 = _432 * _390;
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    bool _444 = !_362;
    float _462;
    if (!_444)
    {
        float _446 = in.m_53.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_88);
        float _468 = 1.0 / _466;
        float _470 = _122 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_55.y;
    float _476 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _478 = in.m_53.y;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _482 = _480 != 0;
    float _484 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _488 = _486 != 0;
    float _490 = in.m_53.w;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _494 = _492 != 0;
    float _496 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _498 = in.m_53.z;
    float _500 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _504 = _502 != 0;
    float _506 = in.m_53.x;
    float _508 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _496);
    float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _512 = in.m_55.x;
    float _514 = -_474;
    float _516 = _514 + 1.0;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _522 = _478 > 0.5;
    bool _524 = _490 > 0.5;
    int _526 = _522 ? as_type<int>(_516) : as_type<int>(_474);
    bool _528 = _498 > 0.5;
    float _530 = _482 ? as_type<float>(_526) : _474;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _536 = _506 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _538 = _528 ? as_type<int>(_516) : as_type<int>(_474);
    float _540 = 1.0 / _534;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _544 = _542 != 0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _550 = _494 ? as_type<float>(_538) : _474;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _554 = _552 != 0;
    float _556 = 1.0 / _548;
    float _558 = _474;
    float _560 = _484;
    bool _562 = _488;
    float _564 = _478;
    if (_488)
    {
        float _566 = _524 ? _516 : _474;
        _558 = _566;
    }
    float _568 = _558;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _476);
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _578 = _576 != 0;
    float _580 = _478 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _586 = -_570;
    float _588 = fma(_536, 2.0, _586);
    float _590 = fma(_580, -2.0, _572);
    float _592 = 1.0 / _584;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _602 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
    float _604 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _500);
    float _606 = _596 * _540;
    float _608 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    float _610 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _508);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _612;
    float _616 = _600 * _556;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _622 = _606;
    float _624 = _608;
    if (_578)
    {
        _560 = _506;
    }
    float _626 = _560;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _630 = _626;
    if (!_578)
    {
        _630 = _498;
    }
    float _632 = _630;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _636 = _614 * _592;
    float _638 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[78].w, _628);
    float _640 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[88].w, _618);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _644 = _472 + _642;
    if (_504)
    {
        bool _646 = _506 > 0.5;
        _562 = _646;
    }
    bool _648 = _562;
    float _650 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[78].z, _620);
    float _652 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[88].z, _634);
    if (!_578)
    {
        _564 = _506;
    }
    float _654 = _564;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _658 = _472 + _656;
    float _660 = fma(_606, _644, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _664 = _472 + _662;
    bool _666 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _668 = isnan(_472);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = fma(_636, _658, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _680 = _510 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _682 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _684 = isnan(_472);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = fma(_616, _664, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _696 = _520 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _698 = fma(_680, _530, -0.5);
    bool _700 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _702 = isnan(_472);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -_676;
    float _714 = _712 + 1.0;
    float _716 = -_692;
    float _718 = _716 + 1.0;
    float _720 = fma(_550, _696, -0.5);
    bool _722 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _724 = isnan(_472);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = _710 * _714;
    float _736 = _676 * _718;
    float _738 = -_710;
    float _740 = _738 + 1.0;
    float _742 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _638);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _746 = _632 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _748 = _732 * _740;
    float _750 = _654 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _752 = -_732;
    float _754 = _752 + 1.0;
    float _756 = -_744;
    float _758 = fma(_746, 2.0, _756);
    int _760 = as_type<int>(_746);
    float _762 = _748;
    int _764 = as_type<int>(_660);
    if (_544)
    {
        float _766 = -_512;
        float _768 = _766 + 1.0;
        _760 = as_type<int>(_768);
    }
    int _770 = _760;
    float _772 = _660 * _748;
    float _774 = fma(_750, -2.0, _518);
    float _776 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _778 = -_608;
    float _780 = fma(_742, _698, _778);
    if (!_544)
    {
        _762 = _512;
    }
    float _782 = _762;
    float _784 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[115].x, _772);
    float _786 = _782;
    if (_544)
    {
        float _788 = _528 ? as_type<float>(_770) : _512;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = -_122;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[76].x, _588);
    float _796 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _650);
    float _798 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _652);
    float _800 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _640);
    float _802 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _774);
    float _804 = -_122;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[86].x, _758);
    float _808 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _812 = _776 + _810;
    float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_504)
    {
        float _816 = -_512;
        float _818 = _816 + 1.0;
        _764 = as_type<int>(_818);
    }
    int _820 = _764;
    float _822 = -_802;
    float _824 = fma(_800, _720, _822);
    float _826 = _610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _830 = _808 + _828;
    float _832 = _812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _834 = as_type<int>(_824);
    if (!_504)
    {
        _622 = _512;
    }
    float _836 = _622;
    float _838 = fma(_694, _734, _784);
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _842 = _836;
    if (_504)
    {
        float _844 = _648 ? as_type<float>(_820) : _512;
        _842 = _844;
    }
    float _846 = _842;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _850 = _826 + _848;
    float _852 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[28].x, _832);
    int _854 = 0;
    if (_554)
    {
        float _856 = -_512;
        float _858 = _856 + 1.0;
        _854 = as_type<int>(_858);
    }
    int _860 = _854;
    float _862 = fma(_678, _736, _838);
    if (!_554)
    {
        _624 = _512;
    }
    float _864 = _624;
    float _866 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[28].z, _852);
    float _868 = _812 * _812;
    float _870 = _864;
    if (_554)
    {
        float _872 = _522 ? as_type<float>(_860) : _512;
        _870 = _872;
    }
    float _874 = _870;
    float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _878 = _814 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _880 = _866 >= 0.0;
    float _882 = _790 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _884 = fma(_830, _830, _868);
    float _886 = fma(_878, _846, -0.5);
    float _888 = _840 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _892 = fma(_850, _850, _884);
    float _894 = fma(_888, _874, -0.5);
    float _896 = fma(_796, _886, _794);
    float _898 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[118].x, _862);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _902 = rsqrt(_892);
    float _904 = fma(_798, _894, _806);
    float _906 = _568 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_880)
    {
        _910 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _912 = _910;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _922 = _882 * _876;
    float _924 = _824 + 0.5;
    float _926 = _906 * _890;
    float _928 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = _780 + 0.5;
    float _942 = _896 + 0.5;
    float _944 = _904 + 0.5;
    float _946 = _898 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_880)
    {
        float _948 = _912 * 5.0;
        _834 = as_type<int>(_948);
    }
    int _950 = _834;
    out.m_57.x = _934;
    out.m_57.y = _936;
    out.m_57.z = _938;
    float _952 = _812 * _902;
    float _954 = _830 * _902;
    out.m_59.x = _942;
    out.m_59.y = _940;
    out.m_59.z = _922;
    out.m_59.w = _926;
    out.m_61.x = _944;
    out.m_61.y = _924;
    out.m_63.x = _928;
    out.m_63.y = _930;
    out.m_63.z = _932;
    out.m_63.w = _946;
    float _956 = as_type<float>(_950);
    if (_880)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3271 = as_type<float>(_950);
        out.gl_Position.z = _3271;
    }
    if (_880)
    {
        out.m_47.x = 0.0;
    }
    if (_880)
    {
        return out;
    }
    float _958 = -_952;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    float _962 = _850 * _902;
    float _964 = -_954;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _968 = -_952;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _812);
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _960 + _972;
    float _976 = -_962;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _826);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = _966 + _980;
    float _984 = -_954;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _830);
    float _988 = _974 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _992 = _978 + _990;
    float _994 = _970 * _970;
    float _996 = -_962;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[28].x, _988);
    float _1002 = fma(_986, _986, _994);
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1000);
    float _1006 = fma(_998, _998, _1002);
    bool _1008 = _1004 >= 0.0;
    float _1010 = _960;
    float _1012 = _974;
    float _1014 = _978;
    if (_1008)
    {
        _956 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1016 = _956;
    int _1018 = as_type<int>(_1016);
    if (_1008)
    {
        out.m_47.x = 0.0;
    }
    if (_1008)
    {
        float _1020 = _1016 * 5.0;
        _1018 = as_type<int>(_1020);
    }
    int _1022 = _1018;
    if (_1008)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3400 = as_type<float>(_1022);
        out.gl_Position.z = _3400;
    }
    if (_1008)
    {
        return out;
    }
    float _1024 = in.m_65.x;
    float _1026 = in.m_65.y;
    float _1028 = in.m_65.z;
    float _1030 = sqrt(_1006);
    float _1032 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1034 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1036 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1038 = _902 * _1030;
    float _1040 = _1038 * _1032;
    float _1042 = _1038 * _1034;
    float _1044 = _1038 * _1036;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1048 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1024);
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1028);
    float _1052 = _1046 * _1040;
    float _1054 = _1048 * _1042;
    float _1056 = _1050 * _1044;
    float _1058 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1064 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1060);
    float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1062);
    float _1070 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1064);
    float _1072 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1066);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    float _1076 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1078 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1082 = _808 + _1076;
    float _1084 = _826 + _1078;
    float _1086 = _776 + _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1090 = _1082 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1094 = _1084 + _1092;
    float _1096 = _1090 * _1090;
    float _1098 = _1094 * _1094;
    float _1100 = _1096 + _1098;
    float _1102 = sqrt(_1100);
    bool _1104 = _1102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1106 = _1054;
    float _1108 = _1080;
    float _1110 = _1056;
    float _1112 = _1098;
    float _1114 = _1082;
    float _1116 = _1086;
    if (!_1104)
    {
        _1106 = _1096;
    }
    float _1118 = _1106;
    float _1120 = _1118;
    if (!_1104)
    {
        _1108 = _1084;
    }
    float _1122 = _1108;
    float _1124 = _1122;
    if (!_1104)
    {
        _1110 = _1086;
    }
    float _1126 = _1110;
    bool _1128 = !_1104;
    float _1130 = _1126;
    if (!_1128)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1136 = _1102 + _1134;
        float _1138 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1140 = rsqrt(_1100);
        float _1142 = _1136 * _1132;
        float _1144 = _1142 * 0.15915493667125701904296875;
        float _1146 = _1144 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = _1144 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        float _1154 = fma(_1148, _1138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1156 = _1140 * _1154;
        float _1158 = _1152 + (-1.0);
        float _1160 = fma(_1090, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1162 = fma(_1094, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1164 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1168 = _1160 + _1166;
        float _1170 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1172 = _1162 + _1170;
        float _1174 = fma(_1086, _1152, _1164);
        float _1176 = _1168 * _1168;
        float _1178 = _1172 * _1172;
        _1130 = _1174;
        _1120 = _1176;
        _1112 = _1178;
        _1114 = _1160;
        _1124 = _1162;
    }
    float _1180 = _1130;
    float _1182 = _1120;
    float _1184 = _1112;
    float _1186 = _1114;
    float _1188 = _1124;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1192 = _1180 + _1190;
    float _1194 = fma(_1192, _1192, _1182);
    float _1196 = _1194 + _1184;
    float _1198 = sqrt(_1196);
    bool _1200 = _1198 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1202 = isnan(_1198);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1208 = _1204 || _1206;
    float _1210 = _1182;
    if (!_1208)
    {
        _1210 = 1.0;
    }
    float _1212 = _1210;
    bool _1214 = !_1208;
    float _1216 = _1212;
    if (!_1214)
    {
        bool _1218 = _1198 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1220 = isnan(_1198);
        bool _1222 = _1218 || _1220;
        bool _1224 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1226 = _1222 || _1224;
        if (!_1226)
        {
            float _1228 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1230 = _1198 + _1228;
            float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1234 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1232;
            float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1238 = _1236 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1240 = 1.0 / _1234;
            float _1242 = _1230 * _1240;
            float _1244 = fma(_1242, _1238, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1216 = _1244;
            _1246 = true;
        }
        else
        {
            bool _1248 = _1198 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1250 = isnan(_1198);
            bool _1252 = _1248 || _1250;
            bool _1254 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1256 = _1252 || _1254;
            if (!_1256)
            {
                float _1258 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1260 = _1198 + _1258;
                float _1262 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1264 = _1262 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1266 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1268 = _1266 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1270 = 1.0 / _1264;
                float _1272 = _1260 * _1270;
                float _1274 = fma(_1272, _1268, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1216 = _1274;
                _1246 = true;
            }
            else
            {
                _1216 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1246 = false;
    float _1276 = _1216;
    float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1280 = _1180 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1284 = _1186 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1288 = _1188 + _1286;
    bool _1290 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    float _1300 = fma(_1280, _1276, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1302 = fma(_1284, _1276, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1304 = fma(_1288, _1276, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1306 = -_952;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1310 = -_954;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1302);
    float _1314 = -_962;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1304);
    float _1318 = _1308;
    float _1320 = _1312;
    float _1322 = _1316;
    if (!_1298)
    {
        float _1324 = _974 * _974;
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1328 = -_826;
        float _1330 = _1328 + _1304;
        float _1332 = fma(_982, _982, _1324);
        float _1334 = fma(_992, _992, _1332);
        float _1336 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1338 = sqrt(_1334);
        float _1340 = 1.0 / _1038;
        float _1342 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1344 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1346 = _1344 * _1326;
        float _1348 = _1346 * _1340;
        float _1350 = -_808;
        float _1352 = _1350 + _1302;
        float _1354 = -_776;
        float _1356 = _1354 + _1300;
        float _1358 = _1342 * _1348;
        float _1360 = _1330 * _1348;
        float _1362 = fma(_1352, _1358, _966);
        float _1364 = fma(_1356, _1358, _960);
        float _1366 = fma(_1342, _1360, _978);
        _1318 = _1364;
        _1320 = _1362;
        _1322 = _1366;
    }
    float _1368 = _1318;
    float _1370 = _1320;
    float _1372 = _1322;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1376 = _1368 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1380 = _1370 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1384 = _1372 + _1382;
    float _1386 = _1376 * _1376;
    float _1388 = fma(_1380, _1380, _1386);
    float _1390 = fma(_1384, _1384, _1388);
    float _1392 = rsqrt(_1390);
    float _1394 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1380 * _1394;
    float _1398 = _1384 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 + _1402;
    float _1406 = sqrt(_1404);
    bool _1408 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1406 + _1410;
    float _1414 = _1384;
    float _1416 = _1412;
    float _1418 = _1396;
    if (_1408)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1420;
    }
    float _1422 = _1414;
    if (_1408)
    {
        float _1424 = rsqrt(_1404);
        _1010 = _1424;
    }
    float _1426 = _1010;
    float _1428 = _1426;
    if (_1408)
    {
        float _1430 = _1412 * _1422;
        _1416 = _1430;
    }
    float _1432 = _1416;
    if (_1408)
    {
        float _1434 = _1432 * 0.15915493667125701904296875;
        _1012 = _1434;
    }
    float _1436 = _1012;
    float _1438 = _1386;
    if (_1408)
    {
        float _1440 = _1436 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        _1438 = _1442;
    }
    float _1444 = _1438;
    float _1446 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1448 = precise::max(0.0, _1446);
    float _1450 = _1392;
    float _1452 = _1448;
    float _1454 = _1446;
    if (_1408)
    {
        float _1456 = _1436 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        _1450 = _1458;
    }
    float _1460 = _1450;
    float _1462 = -_1394;
    float _1464 = -_1448;
    float _1466 = fma(_1376, _1462, _1464);
    if (!_1408)
    {
        _1452 = _1400;
    }
    float _1468 = _1452;
    float _1470 = _1468;
    if (_1408)
    {
        float _1472 = _1466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1454 = _1472;
    }
    float _1474 = _1454;
    float _1476 = sqrt(_1390);
    float _1478 = _1444;
    float _1480 = _1474;
    if (_1408)
    {
        float _1482 = fma(_1444, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1482;
    }
    float _1484 = _1478;
    float _1486 = _1484;
    if (_1408)
    {
        float _1488 = _1460 + (-1.0);
        _1480 = _1488;
    }
    float _1490 = _1480;
    float _1492 = _1490;
    if (_1408)
    {
        float _1494 = _1426 * _1484;
        _1116 = _1494;
    }
    float _1496 = _1116;
    if (!_1408)
    {
        _1428 = _1466;
    }
    float _1498 = _1428;
    float _1500 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1502 = _1498;
    if (_1408)
    {
        float _1504 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1014 = _1504;
    }
    float _1506 = _1014;
    if (_1408)
    {
        float _1508 = _1396 * _1496;
        _1418 = _1508;
    }
    float _1510 = _1418;
    if (!_1408)
    {
        _1486 = _1398;
    }
    float _1512 = _1486;
    float _1514 = _1512;
    if (_1408)
    {
        float _1516 = _1398 * _1496;
        _1514 = _1516;
    }
    float _1518 = _1514;
    if (_1408)
    {
        float _1520 = fma(_1466, _1460, _1506);
        _1502 = _1520;
    }
    float _1522 = _1502;
    if (_1408)
    {
        float _1524 = _1510 * _1510;
        _1470 = _1524;
    }
    float _1526 = _1470;
    if (!_1408)
    {
        _1492 = _1402;
    }
    float _1528 = _1492;
    float _1530 = _1528;
    if (_1408)
    {
        float _1532 = _1518 * _1518;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1522, _1522, _1526);
    float _1538 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1500);
    float _1540 = _1536 + _1534;
    float _1542 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1552 = rsqrt(_1540);
    float _1554 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1556 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1558 = -_1548;
    float _1560 = _1558 + 1.0;
    float _1562 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1554);
    float _1566 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1556);
    float _1568 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1572 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1566);
    float _1574 = abs(_1560);
    float _1576 = log2(_1574);
    float _1578 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1568);
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1582 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1584 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1538);
    float _1586 = _1552 * _1510;
    float _1588 = -_1580;
    float _1590 = fma(_1588, _1550, 1.0);
    float _1592 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1596 = _1552 * _1522;
    float _1598 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1600 = _1552 * _1518;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1594);
    float _1604 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1606 = -_1598;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = log2(_1590);
    float _1612 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1602);
    float _1614 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1616 = -_1600;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1620 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1622 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1612);
    float _1624 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1626 = fma(_1618, -0.5, 0.5);
    float _1628 = exp2(_1614);
    float _1630 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1620);
    float _1632 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1624);
    float _1634 = fma(_1618, 0.5, 0.5);
    float _1636 = _1596 + 1.0;
    float _1638 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1640 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1632);
    float _1642 = fma(_1634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1644 = 1.0 / _1622;
    float _1646 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1648 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1640);
    float _1650 = fma(_1634, _1642, -0.212114393711090087890625);
    float _1652 = _1610 * 0.693147182464599609375;
    float _1654 = fma(_1634, _1650, 1.570728778839111328125);
    float _1656 = sqrt(_1626);
    float _1658 = -_1596;
    float _1660 = fma(_1628, _1636, _1658);
    float _1662 = fma(_1660, 0.5, 0.5);
    float _1664 = _1646 * _1644;
    float _1666 = _1648 * _1644;
    float _1668 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1666, -0.5, 0.5);
    float _1674 = _1656 * 0.636619746685028076171875;
    float3 _4479 = float3(_1670, _1672, _1668);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4479, float3(0.0), isnan(_4479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4479, float3(0.0), isnan(_4479)), level(0.0)).x;
    float3 _4490 = float3(_1670, _1672, _1668);
    float4 _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4490, float3(0.0), isnan(_4490)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4490, float3(0.0), isnan(_4490)), level(0.0)).xyzw;
    float _1681 = _1679.x;
    float _1683 = _1679.y;
    float _1685 = _1679.z;
    float _1687 = _1679.w;
    float _1689 = -_1654;
    float _1691 = fma(_1674, _1689, 1.0);
    float2 _4512 = float2(_1691, _1662);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4512, float2(0.0), isnan(_4512)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4512, float2(0.0), isnan(_4512)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1705 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1707 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1705);
    float _1709 = exp2(_1703);
    float _1711 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1707);
    float _1713 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1711);
    float _1715 = _1713 + _1622;
    float _1717 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1648;
    out.gl_Position.z = _1713;
    out.gl_Position.w = _1622;
    float _1719 = _1715 * 0.5;
    float _1721 = -_1709;
    float _1723 = _1721 + 1.0;
    out.m_47.x = _1717;
    float _1725 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1719;
    out.m_67.w = _1622;
    float _1727 = _1725 * _1676;
    float _1729 = -_1725;
    float _1731 = _1729 + 1.0;
    float _1733 = _1687 * _1727;
    float _1735 = _1687 * _1731;
    float _1737 = _1701 * _1727;
    float _1739 = fma(_1697, _1733, _1681);
    float _1741 = fma(_1699, _1733, _1683);
    float _1743 = fma(_1687, _1737, _1685);
    out.m_69.x = _1739;
    out.m_69.y = _1741;
    out.m_69.z = _1743;
    out.m_69.w = _1735;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1246 = false;
    bool _464 = false;
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
        float _1800 = as_type<float>(_104);
        out.gl_Position.z = _1800;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1869 = as_type<float>(_140);
        out.gl_Position.z = _1869;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
    float _390 = in.m_51.x;
    float _392 = in.m_51.y;
    float _394 = in.m_51.z;
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
    float _416 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _418 = fma(_404, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_408, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_412, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = fma(_418, _352, _414);
    float _428 = fma(_420, _352, _416);
    float _430 = fma(_422, _352, _424);
    float _432 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _426);
    float _434 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _428);
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _430);
    float _438 = _432 * _390;
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    bool _444 = !_362;
    float _462;
    if (!_444)
    {
        float _446 = in.m_53.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_88);
        float _468 = 1.0 / _466;
        float _470 = _122 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_55.y;
    float _476 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _478 = in.m_53.y;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _482 = _480 != 0;
    float _484 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _488 = _486 != 0;
    float _490 = in.m_53.w;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _494 = _492 != 0;
    float _496 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _498 = in.m_53.z;
    float _500 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _504 = _502 != 0;
    float _506 = in.m_53.x;
    float _508 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _496);
    float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _512 = in.m_55.x;
    float _514 = -_474;
    float _516 = _514 + 1.0;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _522 = _478 > 0.5;
    bool _524 = _490 > 0.5;
    int _526 = _522 ? as_type<int>(_516) : as_type<int>(_474);
    bool _528 = _498 > 0.5;
    float _530 = _482 ? as_type<float>(_526) : _474;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _536 = _506 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _538 = _528 ? as_type<int>(_516) : as_type<int>(_474);
    float _540 = 1.0 / _534;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _544 = _542 != 0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _550 = _494 ? as_type<float>(_538) : _474;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _554 = _552 != 0;
    float _556 = 1.0 / _548;
    float _558 = _474;
    float _560 = _484;
    bool _562 = _488;
    float _564 = _478;
    if (_488)
    {
        float _566 = _524 ? _516 : _474;
        _558 = _566;
    }
    float _568 = _558;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _476);
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _578 = _576 != 0;
    float _580 = _478 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _586 = -_570;
    float _588 = fma(_536, 2.0, _586);
    float _590 = fma(_580, -2.0, _572);
    float _592 = 1.0 / _584;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _602 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
    float _604 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _500);
    float _606 = _596 * _540;
    float _608 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    float _610 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _508);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _612;
    float _616 = _600 * _556;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _622 = _606;
    float _624 = _608;
    if (_578)
    {
        _560 = _506;
    }
    float _626 = _560;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _630 = _626;
    if (!_578)
    {
        _630 = _498;
    }
    float _632 = _630;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _636 = _614 * _592;
    float _638 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[78].w, _628);
    float _640 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[88].w, _618);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _644 = _472 + _642;
    if (_504)
    {
        bool _646 = _506 > 0.5;
        _562 = _646;
    }
    bool _648 = _562;
    float _650 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[78].z, _620);
    float _652 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[88].z, _634);
    if (!_578)
    {
        _564 = _506;
    }
    float _654 = _564;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _658 = _472 + _656;
    float _660 = fma(_606, _644, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _664 = _472 + _662;
    bool _666 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _668 = isnan(_472);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = fma(_636, _658, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _680 = _510 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _682 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _684 = isnan(_472);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = fma(_616, _664, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _696 = _520 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _698 = fma(_680, _530, -0.5);
    bool _700 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _702 = isnan(_472);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -_676;
    float _714 = _712 + 1.0;
    float _716 = -_692;
    float _718 = _716 + 1.0;
    float _720 = fma(_550, _696, -0.5);
    bool _722 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _724 = isnan(_472);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = _710 * _714;
    float _736 = _676 * _718;
    float _738 = -_710;
    float _740 = _738 + 1.0;
    float _742 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _638);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _746 = _632 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _748 = _732 * _740;
    float _750 = _654 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _752 = -_732;
    float _754 = _752 + 1.0;
    float _756 = -_744;
    float _758 = fma(_746, 2.0, _756);
    int _760 = as_type<int>(_746);
    float _762 = _748;
    int _764 = as_type<int>(_660);
    if (_544)
    {
        float _766 = -_512;
        float _768 = _766 + 1.0;
        _760 = as_type<int>(_768);
    }
    int _770 = _760;
    float _772 = _660 * _748;
    float _774 = fma(_750, -2.0, _518);
    float _776 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _778 = -_608;
    float _780 = fma(_742, _698, _778);
    if (!_544)
    {
        _762 = _512;
    }
    float _782 = _762;
    float _784 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[115].x, _772);
    float _786 = _782;
    if (_544)
    {
        float _788 = _528 ? as_type<float>(_770) : _512;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = -_122;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[76].x, _588);
    float _796 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _650);
    float _798 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _652);
    float _800 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _640);
    float _802 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _774);
    float _804 = -_122;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[86].x, _758);
    float _808 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _812 = _776 + _810;
    float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_504)
    {
        float _816 = -_512;
        float _818 = _816 + 1.0;
        _764 = as_type<int>(_818);
    }
    int _820 = _764;
    float _822 = -_802;
    float _824 = fma(_800, _720, _822);
    float _826 = _610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _830 = _808 + _828;
    float _832 = _812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _834 = as_type<int>(_824);
    if (!_504)
    {
        _622 = _512;
    }
    float _836 = _622;
    float _838 = fma(_694, _734, _784);
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _842 = _836;
    if (_504)
    {
        float _844 = _648 ? as_type<float>(_820) : _512;
        _842 = _844;
    }
    float _846 = _842;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _850 = _826 + _848;
    float _852 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[28].x, _832);
    int _854 = 0;
    if (_554)
    {
        float _856 = -_512;
        float _858 = _856 + 1.0;
        _854 = as_type<int>(_858);
    }
    int _860 = _854;
    float _862 = fma(_678, _736, _838);
    if (!_554)
    {
        _624 = _512;
    }
    float _864 = _624;
    float _866 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[28].z, _852);
    float _868 = _812 * _812;
    float _870 = _864;
    if (_554)
    {
        float _872 = _522 ? as_type<float>(_860) : _512;
        _870 = _872;
    }
    float _874 = _870;
    float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _878 = _814 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _880 = _866 >= 0.0;
    float _882 = _790 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _884 = fma(_830, _830, _868);
    float _886 = fma(_878, _846, -0.5);
    float _888 = _840 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _892 = fma(_850, _850, _884);
    float _894 = fma(_888, _874, -0.5);
    float _896 = fma(_796, _886, _794);
    float _898 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[118].x, _862);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _902 = rsqrt(_892);
    float _904 = fma(_798, _894, _806);
    float _906 = _568 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_880)
    {
        _910 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _912 = _910;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _922 = _882 * _876;
    float _924 = _824 + 0.5;
    float _926 = _906 * _890;
    float _928 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = _780 + 0.5;
    float _942 = _896 + 0.5;
    float _944 = _904 + 0.5;
    float _946 = _898 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_880)
    {
        float _948 = _912 * 5.0;
        _834 = as_type<int>(_948);
    }
    int _950 = _834;
    out.m_57.x = _934;
    out.m_57.y = _936;
    out.m_57.z = _938;
    float _952 = _812 * _902;
    float _954 = _830 * _902;
    out.m_59.x = _942;
    out.m_59.y = _940;
    out.m_59.z = _922;
    out.m_59.w = _926;
    out.m_61.x = _944;
    out.m_61.y = _924;
    out.m_63.x = _928;
    out.m_63.y = _930;
    out.m_63.z = _932;
    out.m_63.w = _946;
    float _956 = as_type<float>(_950);
    if (_880)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3271 = as_type<float>(_950);
        out.gl_Position.z = _3271;
    }
    if (_880)
    {
        out.m_47.x = 0.0;
    }
    if (_880)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _958 = -_952;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    float _962 = _850 * _902;
    float _964 = -_954;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _968 = -_952;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _812);
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _960 + _972;
    float _976 = -_962;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _826);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = _966 + _980;
    float _984 = -_954;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _830);
    float _988 = _974 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _992 = _978 + _990;
    float _994 = _970 * _970;
    float _996 = -_962;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[28].x, _988);
    float _1002 = fma(_986, _986, _994);
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1000);
    float _1006 = fma(_998, _998, _1002);
    bool _1008 = _1004 >= 0.0;
    float _1010 = _960;
    float _1012 = _974;
    float _1014 = _978;
    if (_1008)
    {
        _956 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1016 = _956;
    int _1018 = as_type<int>(_1016);
    if (_1008)
    {
        out.m_47.x = 0.0;
    }
    if (_1008)
    {
        float _1020 = _1016 * 5.0;
        _1018 = as_type<int>(_1020);
    }
    int _1022 = _1018;
    if (_1008)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3400 = as_type<float>(_1022);
        out.gl_Position.z = _3400;
    }
    if (_1008)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1024 = in.m_65.x;
    float _1026 = in.m_65.y;
    float _1028 = in.m_65.z;
    float _1030 = sqrt(_1006);
    float _1032 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1034 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1036 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1038 = _902 * _1030;
    float _1040 = _1038 * _1032;
    float _1042 = _1038 * _1034;
    float _1044 = _1038 * _1036;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1048 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1024);
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1028);
    float _1052 = _1046 * _1040;
    float _1054 = _1048 * _1042;
    float _1056 = _1050 * _1044;
    float _1058 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1064 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1060);
    float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1062);
    float _1070 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1064);
    float _1072 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1066);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    float _1076 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1078 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1082 = _808 + _1076;
    float _1084 = _826 + _1078;
    float _1086 = _776 + _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1090 = _1082 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1094 = _1084 + _1092;
    float _1096 = _1090 * _1090;
    float _1098 = _1094 * _1094;
    float _1100 = _1096 + _1098;
    float _1102 = sqrt(_1100);
    bool _1104 = _1102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1106 = _1054;
    float _1108 = _1080;
    float _1110 = _1056;
    float _1112 = _1098;
    float _1114 = _1082;
    float _1116 = _1086;
    if (!_1104)
    {
        _1106 = _1096;
    }
    float _1118 = _1106;
    float _1120 = _1118;
    if (!_1104)
    {
        _1108 = _1084;
    }
    float _1122 = _1108;
    float _1124 = _1122;
    if (!_1104)
    {
        _1110 = _1086;
    }
    float _1126 = _1110;
    bool _1128 = !_1104;
    float _1130 = _1126;
    if (!_1128)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1136 = _1102 + _1134;
        float _1138 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1140 = rsqrt(_1100);
        float _1142 = _1136 * _1132;
        float _1144 = _1142 * 0.15915493667125701904296875;
        float _1146 = _1144 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = _1144 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        float _1154 = fma(_1148, _1138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1156 = _1140 * _1154;
        float _1158 = _1152 + (-1.0);
        float _1160 = fma(_1090, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1162 = fma(_1094, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1164 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1168 = _1160 + _1166;
        float _1170 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1172 = _1162 + _1170;
        float _1174 = fma(_1086, _1152, _1164);
        float _1176 = _1168 * _1168;
        float _1178 = _1172 * _1172;
        _1130 = _1174;
        _1120 = _1176;
        _1112 = _1178;
        _1114 = _1160;
        _1124 = _1162;
    }
    float _1180 = _1130;
    float _1182 = _1120;
    float _1184 = _1112;
    float _1186 = _1114;
    float _1188 = _1124;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1192 = _1180 + _1190;
    float _1194 = fma(_1192, _1192, _1182);
    float _1196 = _1194 + _1184;
    float _1198 = sqrt(_1196);
    bool _1200 = _1198 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1202 = isnan(_1198);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1208 = _1204 || _1206;
    float _1210 = _1182;
    if (!_1208)
    {
        _1210 = 1.0;
    }
    float _1212 = _1210;
    bool _1214 = !_1208;
    float _1216 = _1212;
    if (!_1214)
    {
        bool _1218 = _1198 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1220 = isnan(_1198);
        bool _1222 = _1218 || _1220;
        bool _1224 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1226 = _1222 || _1224;
        if (!_1226)
        {
            float _1228 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1230 = _1198 + _1228;
            float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1234 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1232;
            float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1238 = _1236 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1240 = 1.0 / _1234;
            float _1242 = _1230 * _1240;
            float _1244 = fma(_1242, _1238, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1216 = _1244;
            _1246 = true;
        }
        else
        {
            bool _1248 = _1198 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1250 = isnan(_1198);
            bool _1252 = _1248 || _1250;
            bool _1254 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1256 = _1252 || _1254;
            if (!_1256)
            {
                float _1258 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1260 = _1198 + _1258;
                float _1262 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1264 = _1262 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1266 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1268 = _1266 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1270 = 1.0 / _1264;
                float _1272 = _1260 * _1270;
                float _1274 = fma(_1272, _1268, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1216 = _1274;
                _1246 = true;
            }
            else
            {
                _1216 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1246 = false;
    float _1276 = _1216;
    float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1280 = _1180 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1284 = _1186 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1288 = _1188 + _1286;
    bool _1290 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    float _1300 = fma(_1280, _1276, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1302 = fma(_1284, _1276, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1304 = fma(_1288, _1276, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1306 = -_952;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1310 = -_954;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1302);
    float _1314 = -_962;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1304);
    float _1318 = _1308;
    float _1320 = _1312;
    float _1322 = _1316;
    if (!_1298)
    {
        float _1324 = _974 * _974;
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1328 = -_826;
        float _1330 = _1328 + _1304;
        float _1332 = fma(_982, _982, _1324);
        float _1334 = fma(_992, _992, _1332);
        float _1336 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1338 = sqrt(_1334);
        float _1340 = 1.0 / _1038;
        float _1342 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1344 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1346 = _1344 * _1326;
        float _1348 = _1346 * _1340;
        float _1350 = -_808;
        float _1352 = _1350 + _1302;
        float _1354 = -_776;
        float _1356 = _1354 + _1300;
        float _1358 = _1342 * _1348;
        float _1360 = _1330 * _1348;
        float _1362 = fma(_1352, _1358, _966);
        float _1364 = fma(_1356, _1358, _960);
        float _1366 = fma(_1342, _1360, _978);
        _1318 = _1364;
        _1320 = _1362;
        _1322 = _1366;
    }
    float _1368 = _1318;
    float _1370 = _1320;
    float _1372 = _1322;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1376 = _1368 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1380 = _1370 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1384 = _1372 + _1382;
    float _1386 = _1376 * _1376;
    float _1388 = fma(_1380, _1380, _1386);
    float _1390 = fma(_1384, _1384, _1388);
    float _1392 = rsqrt(_1390);
    float _1394 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1380 * _1394;
    float _1398 = _1384 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 + _1402;
    float _1406 = sqrt(_1404);
    bool _1408 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1406 + _1410;
    float _1414 = _1384;
    float _1416 = _1412;
    float _1418 = _1396;
    if (_1408)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1420;
    }
    float _1422 = _1414;
    if (_1408)
    {
        float _1424 = rsqrt(_1404);
        _1010 = _1424;
    }
    float _1426 = _1010;
    float _1428 = _1426;
    if (_1408)
    {
        float _1430 = _1412 * _1422;
        _1416 = _1430;
    }
    float _1432 = _1416;
    if (_1408)
    {
        float _1434 = _1432 * 0.15915493667125701904296875;
        _1012 = _1434;
    }
    float _1436 = _1012;
    float _1438 = _1386;
    if (_1408)
    {
        float _1440 = _1436 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        _1438 = _1442;
    }
    float _1444 = _1438;
    float _1446 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1448 = precise::max(0.0, _1446);
    float _1450 = _1392;
    float _1452 = _1448;
    float _1454 = _1446;
    if (_1408)
    {
        float _1456 = _1436 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        _1450 = _1458;
    }
    float _1460 = _1450;
    float _1462 = -_1394;
    float _1464 = -_1448;
    float _1466 = fma(_1376, _1462, _1464);
    if (!_1408)
    {
        _1452 = _1400;
    }
    float _1468 = _1452;
    float _1470 = _1468;
    if (_1408)
    {
        float _1472 = _1466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1454 = _1472;
    }
    float _1474 = _1454;
    float _1476 = sqrt(_1390);
    float _1478 = _1444;
    float _1480 = _1474;
    if (_1408)
    {
        float _1482 = fma(_1444, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1482;
    }
    float _1484 = _1478;
    float _1486 = _1484;
    if (_1408)
    {
        float _1488 = _1460 + (-1.0);
        _1480 = _1488;
    }
    float _1490 = _1480;
    float _1492 = _1490;
    if (_1408)
    {
        float _1494 = _1426 * _1484;
        _1116 = _1494;
    }
    float _1496 = _1116;
    if (!_1408)
    {
        _1428 = _1466;
    }
    float _1498 = _1428;
    float _1500 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1502 = _1498;
    if (_1408)
    {
        float _1504 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1014 = _1504;
    }
    float _1506 = _1014;
    if (_1408)
    {
        float _1508 = _1396 * _1496;
        _1418 = _1508;
    }
    float _1510 = _1418;
    if (!_1408)
    {
        _1486 = _1398;
    }
    float _1512 = _1486;
    float _1514 = _1512;
    if (_1408)
    {
        float _1516 = _1398 * _1496;
        _1514 = _1516;
    }
    float _1518 = _1514;
    if (_1408)
    {
        float _1520 = fma(_1466, _1460, _1506);
        _1502 = _1520;
    }
    float _1522 = _1502;
    if (_1408)
    {
        float _1524 = _1510 * _1510;
        _1470 = _1524;
    }
    float _1526 = _1470;
    if (!_1408)
    {
        _1492 = _1402;
    }
    float _1528 = _1492;
    float _1530 = _1528;
    if (_1408)
    {
        float _1532 = _1518 * _1518;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1522, _1522, _1526);
    float _1538 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1500);
    float _1540 = _1536 + _1534;
    float _1542 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1552 = rsqrt(_1540);
    float _1554 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1556 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1558 = -_1548;
    float _1560 = _1558 + 1.0;
    float _1562 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1554);
    float _1566 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1556);
    float _1568 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1572 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1566);
    float _1574 = abs(_1560);
    float _1576 = log2(_1574);
    float _1578 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1568);
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1582 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1584 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1538);
    float _1586 = _1552 * _1510;
    float _1588 = -_1580;
    float _1590 = fma(_1588, _1550, 1.0);
    float _1592 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1596 = _1552 * _1522;
    float _1598 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1600 = _1552 * _1518;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1594);
    float _1604 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1606 = -_1598;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = log2(_1590);
    float _1612 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1602);
    float _1614 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1616 = -_1600;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1620 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1622 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1612);
    float _1624 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1626 = fma(_1618, -0.5, 0.5);
    float _1628 = exp2(_1614);
    float _1630 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1620);
    float _1632 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1624);
    float _1634 = fma(_1618, 0.5, 0.5);
    float _1636 = _1596 + 1.0;
    float _1638 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1640 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1632);
    float _1642 = fma(_1634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1644 = 1.0 / _1622;
    float _1646 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1648 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1640);
    float _1650 = fma(_1634, _1642, -0.212114393711090087890625);
    float _1652 = _1610 * 0.693147182464599609375;
    float _1654 = fma(_1634, _1650, 1.570728778839111328125);
    float _1656 = sqrt(_1626);
    float _1658 = -_1596;
    float _1660 = fma(_1628, _1636, _1658);
    float _1662 = fma(_1660, 0.5, 0.5);
    float _1664 = _1646 * _1644;
    float _1666 = _1648 * _1644;
    float _1668 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1666, -0.5, 0.5);
    float _1674 = _1656 * 0.636619746685028076171875;
    float3 _4479 = float3(_1670, _1672, _1668);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4479, float3(0.0), isnan(_4479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4479, float3(0.0), isnan(_4479)), level(0.0)).x;
    float3 _4490 = float3(_1670, _1672, _1668);
    float4 _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4490, float3(0.0), isnan(_4490)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4490, float3(0.0), isnan(_4490)), level(0.0)).xyzw;
    float _1681 = _1679.x;
    float _1683 = _1679.y;
    float _1685 = _1679.z;
    float _1687 = _1679.w;
    float _1689 = -_1654;
    float _1691 = fma(_1674, _1689, 1.0);
    float2 _4512 = float2(_1691, _1662);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4512, float2(0.0), isnan(_4512)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4512, float2(0.0), isnan(_4512)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1705 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1707 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1705);
    float _1709 = exp2(_1703);
    float _1711 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1707);
    float _1713 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1711);
    float _1715 = _1713 + _1622;
    float _1717 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1648;
    out.gl_Position.z = _1713;
    out.gl_Position.w = _1622;
    float _1719 = _1715 * 0.5;
    float _1721 = -_1709;
    float _1723 = _1721 + 1.0;
    out.m_47.x = _1717;
    float _1725 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1719;
    out.m_67.w = _1622;
    float _1727 = _1725 * _1676;
    float _1729 = -_1725;
    float _1731 = _1729 + 1.0;
    float _1733 = _1687 * _1727;
    float _1735 = _1687 * _1731;
    float _1737 = _1701 * _1727;
    float _1739 = fma(_1697, _1733, _1681);
    float _1741 = fma(_1699, _1733, _1683);
    float _1743 = fma(_1687, _1737, _1685);
    out.m_69.x = _1739;
    out.m_69.y = _1741;
    out.m_69.z = _1743;
    out.m_69.w = _1735;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

