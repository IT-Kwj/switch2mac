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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_61 [[user(locn1)]];
    float4 m_103 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_95 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_91 [[user(locn14)]];
    float4 m_101 [[user(locn15)]];
    float4 m_99 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_73 [[attribute(1)]];
    float4 m_71 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_87 [[attribute(7)]];
    float4 m_85 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
    float4 m_89 [[attribute(11)]];
    float4 m_55 [[attribute(12)]];
    float4 m_65 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3878 = false;
    bool _746 = false;
    bool _542 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_44.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_122);
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    float _134 = _132;
    if (!_126)
    {
        out.m_47.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4179 = as_type<float>(_140);
        out.gl_Position.z = _4179;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.w;
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    bool _152 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_144);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_144;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _146;
    out.m_53.y = _148;
    out.m_53.z = _150;
    float _166 = 0.0;
    float _168 = _164;
    if (_160)
    {
        float _170 = float(_122);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    if (_178)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _134;
    if (_178)
    {
        out.m_47.x = 0.0;
    }
    if (_178)
    {
        float _182 = _180 * 5.0;
        _142 = as_type<int>(_182);
    }
    int _184 = _142;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4260 = as_type<float>(_184);
        out.gl_Position.z = _4260;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _186 = in.m_55.x;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = in.m_55.y;
    out.m_57.x = _186;
    out.m_57.y = _190;
    bool _192 = !_188;
    float _194 = _190;
    float _196 = _186;
    float _212;
    if (!_192)
    {
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        float _216 = float(_122);
        float _218 = 1.0 / _216;
        float _220 = _164 * _218;
        _212 = _220;
    }
    _214 = false;
    float _222 = _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _222 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = 1.0 / _230;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _246;
    float _250 = 1.0 / _238;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _222 + _252;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _234;
    float _260 = _254 * _244;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _222 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    float _270 = fma(_268, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = 1.0 / _242;
    float _274 = _264 * _250;
    bool _276 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _278 = isnan(_222);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _290 = _222 + _288;
    bool _292 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_222);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _248;
    float _306 = _226 * _258;
    bool _308 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _310 = isnan(_222);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_302;
    float _322 = _320 + 1.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = _222 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = _290 * _272;
    float _334 = -_286;
    float _336 = _334 + 1.0;
    bool _338 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_222);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = fma(_330, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = _302 * _336;
    float _354 = _318 * _322;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    bool _360 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _362 = isnan(_222);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -_348;
    float _374 = _372 + 1.0;
    float _376 = _326 * _304;
    float _378 = fma(_358, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _380 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_222);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _370 * _374;
    float _394 = -_370;
    float _396 = _394 + 1.0;
    float _398 = -_318;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = _390 * _396;
    float _408 = _348 * _400;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = _350 * _406;
    float _420 = -_390;
    float _422 = _420 + 1.0;
    float _424 = _378 * _406;
    float _426 = _270 * _406;
    float _428 = fma(_404, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_412, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_416, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].x, _418);
    float _440 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _456 = fma(_436, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_428, _392, _438);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_450, _332, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _466 = fma(_446, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_430, _392, _440);
    float _470 = fma(_456, _408, _458);
    float _472 = fma(_462, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_432, _392, _442);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_466, _408, _468);
    float _482 = fma(_472, _408, _474);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _488;
    float _492 = fma(_454, _332, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_478, _332, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _496;
    float _500 = fma(_464, _354, _470);
    float _502 = fma(_486, _376, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _504 = fma(_490, _376, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _506 = fma(_498, _376, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _508 = fma(_492, _354, _480);
    float _510 = fma(_494, _354, _482);
    float _512 = fma(_502, _352, _500);
    float _514 = fma(_504, _352, _508);
    float _516 = fma(_506, _352, _510);
    float _518 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[148].x, _512);
    float _520 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[148].y, _514);
    float _522 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[148].z, _516);
    bool _524 = !_256;
    float _540;
    if (!_524)
    {
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _528 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _540 = _538;
        _542 = true;
    }
    else
    {
        float _544 = float(_122);
        float _546 = 1.0 / _544;
        float _548 = _164 * _546;
        _540 = _548;
    }
    _542 = false;
    float _550 = _540;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _550 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = isnan(_550);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _580 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _582 = isnan(_550);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _558;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    float _598 = -_574;
    float _600 = _598 + 1.0;
    bool _602 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _604 = isnan(_550);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / _562;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _620 = 1.0 / _578;
    float _622 = _596 * _592;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _628 = _590 * _600;
    float _630 = -_590;
    float _632 = _630 + 1.0;
    float _634 = fma(_622, _554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _636;
    float _640 = _612 * _632;
    float _642 = _626 * _614;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _550 + _644;
    bool _648 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _650 = isnan(_550);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _634 * _640;
    float _662 = -_612;
    float _664 = _662 + 1.0;
    float _666 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _670 = _550 + _668;
    float _672 = _638 * _620;
    float _674 = -_658;
    float _676 = _674 + 1.0;
    float _678 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _660);
    float _680 = fma(_672, _670, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _682 = _574 * _676;
    float _684 = fma(_666, _628, _678);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = fma(_680, _682, _684);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _692 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[118].x, _688);
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _702 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _716 = in.m_59.x;
    float _718 = in.m_59.y;
    float _720 = in.m_59.z;
    out.m_61.x = _702;
    out.m_61.y = _704;
    out.m_61.z = _706;
    out.m_61.w = _618;
    out.m_63.x = _708;
    out.m_63.y = _710;
    out.m_63.z = _712;
    out.m_63.w = _714;
    float _722 = _522 * _720;
    float _724 = _520 * _718;
    float _726 = _518 * _716;
    bool _728 = !_616;
    float _744;
    if (!_728)
    {
        float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _732 = _146 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _734 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _736 = _734 * _730;
        float _738 = floor(_736);
        float _740 = -_738;
        float _742 = _736 + _740;
        _744 = _742;
        _746 = true;
    }
    else
    {
        float _748 = float(_122);
        float _750 = 1.0 / _748;
        float _752 = _164 * _750;
        _744 = _752;
    }
    _746 = false;
    float _754 = _744;
    float _756 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _758 = int(_756);
    float _760 = in.m_65.w;
    float _762 = float(_122);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _766 = _764 != 0;
    float _768 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _770 = int(_768);
    float _772 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _774 = int(_772);
    float _776 = float(_758);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _778;
    if (_766)
    {
        _130 = 1.0;
    }
    float _782 = _130;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _788 = _782;
    if (!_766)
    {
        _788 = 1.2345600128173828125;
    }
    float _790 = _788;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _794 = 1.0 / _776;
    float _796 = float(_770);
    out.m_67.w = _760;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _806 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _808 = int(_806);
    float _810 = float(uint(_774));
    float _812 = _148 * 2.0;
    int _814 = ~_774;
    int _816 = _814 + 1;
    bool _818 = _774 == 0;
    float _820 = 1.0 / _796;
    float _822 = _794 * _164;
    bool _824 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _826 = isnan(_754);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _836;
    float _840 = float(uint(_808));
    float _842 = 1.0 / _810;
    int _844 = ~_808;
    int _846 = _844 + 1;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _848;
    bool _852 = _808 == 0;
    int _854 = ~_808;
    int _856 = _854 + 1;
    float _858 = _820 * _164;
    float _860 = trunc(_822);
    int _862 = int(_860);
    float _864 = 1.0 / _840;
    int _866 = as_type<int>(_842) + (-2);
    float _868 = trunc(_858);
    int _870 = int(_868);
    float _872 = float(uint(_862));
    float _874 = as_type<float>(_866) * _872;
    int _876 = as_type<int>(_864) + (-2);
    float _878 = 1.0 / _762;
    int _880 = ~_808;
    int _882 = _880 + 1;
    float _884 = float(uint(_870));
    float _886 = trunc(_874);
    float _888 = precise::max(_886, 0.0);
    uint _891 = uint(_888);
    float _893 = as_type<float>(_876) * _884;
    float _895 = trunc(_893);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = _878 * _164;
    int _903 = _816 * int(_891);
    int _905 = _903 + _862;
    float _907 = _893;
    float _909 = as_type<float>(_905);
    if (_766)
    {
        _907 = _146;
    }
    float _911 = _907;
    float _913 = floor(_812);
    float _915 = _911;
    if (!_766)
    {
        _915 = _148;
    }
    float _917 = _915;
    float _919 = float(uint(_905));
    if (_766)
    {
        _909 = 1.0;
    }
    float _921 = _909;
    int _923 = _882 * int(_899);
    int _925 = _923 + _870;
    float _927 = _921;
    if (!_766)
    {
        _927 = 7.345489978790283203125;
    }
    float _929 = _927;
    float _931 = as_type<float>(_866) * _919;
    float _933 = 1.0 / _780;
    float _935 = float(uint(_925));
    float _937 = _929 * _146;
    float _939 = as_type<float>(_876) * _935;
    float _941 = trunc(_931);
    float _943 = precise::max(_941, 0.0);
    uint _945 = uint(_943);
    float _947 = trunc(_939);
    float _949 = precise::max(_947, 0.0);
    uint _951 = uint(_949);
    int _953 = ~_774;
    int _955 = _953 + 1;
    float _957 = floor(_937);
    float _959 = _917 * _790;
    float _961 = float(_774);
    float _963 = float(_862);
    int _965 = int(_891) + int(_945);
    float _967 = floor(_959);
    bool _969 = _963 >= _961;
    bool _971 = isnan(_963);
    bool _973 = _969 || _971;
    bool _975 = isnan(_961);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    int _981 = int(_899) + int(_951);
    float _983 = float(_808);
    float _985 = -_957;
    float _987 = _937 + _985;
    float _989 = float(_870);
    int _991 = _955 * _965;
    int _993 = _991 + _862;
    float _995 = trunc(_979);
    int _997 = int(_995);
    int _999 = _846 * _981;
    int _1001 = _999 + _870;
    bool _1003 = _989 >= _983;
    bool _1005 = isnan(_989);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(_983);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = _961 * _901;
    bool _1017 = uint(_993) >= uint(_774);
    float _1019 = -_967;
    float _1021 = _959 + _1019;
    bool _1023 = uint(_1001) >= uint(_808);
    float _1025 = _961 * _987;
    float _1027 = trunc(_1013);
    int _1029 = int(_1027);
    bool _1031 = !_1017;
    int _1033 = _1031 ? 0 : (-1);
    float _1035 = _983 * _901;
    bool _1037 = !_1023;
    int _1039 = _1037 ? 0 : (-1);
    float _1041 = _983 * _1021;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1045 = _1043 != 0;
    int _1047 = ~_981;
    int _1049 = _1047 + _1039;
    int _1051 = _1049 + 1;
    float _1053 = trunc(_1025);
    int _1055 = int(_1053);
    int _1057 = ~_965;
    int _1059 = _1057 + _1033;
    int _1061 = _1059 + 1;
    bool _1063 = !_1045;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = _808 * _1051;
    int _1069 = _1067 + _870;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1073 = _1071 != 0;
    int _1075 = abs(_1065);
    int _1077 = _774 * _1061;
    int _1079 = _1077 + _862;
    bool _1081 = !_1073;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = trunc(_1015);
    int _1087 = int(_1085);
    int _1089 = ~_1029;
    int _1091 = _1089 + 1;
    int _1093 = _1091 + 1;
    int _1095 = abs(_1083);
    int _1097 = ~_997;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    int _1103 = _1055 * _1075;
    int _1105 = _1103 + _862;
    bool _1107 = !_818;
    int _1109 = _1107 ? _1079 : (-1);
    float _1111 = trunc(_1041);
    int _1113 = int(_1111);
    bool _1115 = !_852;
    int _1117 = _1115 ? _1069 : (-1);
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1121 = _1119 != 0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1125 = _1123 != 0;
    int _1127 = _1101 * _1109;
    int _1129 = _774 + (-1);
    int _1131 = _1093 * _1117;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1135 = _1133 != 0;
    float _1137 = trunc(_1035);
    int _1139 = int(_1137);
    bool _1141 = !_1125;
    int _1143 = _1141 ? 0 : 1;
    int _1145 = _997 * _1129;
    int _1147 = _1145 + _1127;
    bool _1149 = !_1121;
    int _1151 = _1149 ? 0 : 1;
    int _1153 = abs(_1143);
    int _1155 = abs(_1151);
    int _1157 = _1113 * _1095;
    int _1159 = _1157 + _870;
    bool _1161 = !_1135;
    int _1163 = _1161 ? 0 : 1;
    int _1165 = _1147 * _1153;
    float _1167 = 1.0 / _786;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1171 = _1169 != 0;
    int _1173 = abs(_1163);
    int _1175 = _1087 * _1155;
    int _1177 = _1175 + _1165;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1181 = _1179 != 0;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1185 = _1183 != 0;
    float _1187 = 1.0 / _800;
    int _1189 = _808 + (-1);
    bool _1191 = !_1171;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = _1105 * _1173;
    int _1197 = _1195 + _1177;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1201 = _1199 != 0;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1205 = _1203 != 0;
    int _1207 = _1029 * _1189;
    int _1209 = _1207 + _1131;
    bool _1211 = !_1185;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = 1.0 / _804;
    bool _1217 = !_1181;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = abs(_1193);
    int _1223 = abs(_1213);
    bool _1225 = !_1201;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1231 = log2(_1229);
    int _1233 = abs(_1219);
    int _1235 = _1209 * _1223;
    int _1237 = abs(_1227);
    bool _1239 = !_1205;
    int _1241 = _1239 ? 0 : 1;
    int _1243 = _1055 * _1221;
    int _1245 = _1243 + _1197;
    int _1247 = abs(_1241);
    int _1249 = _1139 * _1233;
    int _1251 = _1249 + _1235;
    float _1253 = float(uint(_1245));
    float _1255 = in.m_44.x;
    float _1257 = in.m_44.y;
    float _1259 = in.m_44.z;
    int _1261 = _1159 * _1237;
    int _1263 = _1261 + _1251;
    int _1265 = ~_808;
    int _1267 = _1265 + 1;
    float _1269 = as_type<float>(_866) * _1253;
    int _1271 = ~_774;
    int _1273 = _1271 + 1;
    int _1275 = _1113 * _1247;
    int _1277 = _1275 + _1263;
    int _1279 = ~_774;
    int _1281 = _1279 + 1;
    float _1283 = in.m_69.x;
    float _1285 = in.m_69.y;
    float _1287 = in.m_69.z;
    float _1289 = in.m_69.w;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1293 = _1291 != 0;
    float _1295 = trunc(_1269);
    float _1297 = precise::max(_1295, 0.0);
    uint _1299 = uint(_1297);
    float _1301 = float(uint(_1277));
    bool _1303 = _774 == 0;
    float _1305 = float(uint(_1159));
    float _1307 = as_type<float>(_876) * _1301;
    float _1309 = float(uint(_1105));
    float _1311 = trunc(_1307);
    float _1313 = precise::max(_1311, 0.0);
    uint _1315 = uint(_1313);
    bool _1317 = _1181;
    if (_1293)
    {
        bool _1319 = _146 > 0.5;
        _1317 = _1319;
    }
    bool _1321 = _1317;
    float _1323 = as_type<float>(_866) * _1309;
    float _1325 = 0.0;
    if (!_1293)
    {
        _1325 = _186;
    }
    float _1327 = _1325;
    int _1329 = _1281 * int(_1299);
    int _1331 = _1329 + _1245;
    float _1333 = trunc(_1323);
    float _1335 = precise::max(_1333, 0.0);
    uint _1337 = uint(_1335);
    float _1339 = float(uint(_1331));
    float _1341 = _1257 * _1285;
    float _1343 = as_type<float>(_866) * _1339;
    int _1345 = _1267 * int(_1315);
    int _1347 = _1345 + _1277;
    float _1349 = trunc(_1343);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    float _1355 = float(uint(_1347));
    float _1357 = as_type<float>(_876) * _1355;
    int _1359 = as_type<int>(_1343);
    float _1361 = _1327;
    if (_1293)
    {
        float _1363 = -_186;
        float _1365 = _1363 + 1.0;
        _1359 = as_type<int>(_1365);
    }
    int _1367 = _1359;
    float _1369 = trunc(_1357);
    float _1371 = precise::max(_1369, 0.0);
    uint _1373 = uint(_1371);
    if (_1293)
    {
        float _1375 = _1321 ? as_type<float>(_1367) : _186;
        _1361 = _1375;
    }
    float _1377 = _1361;
    float _1379 = -_190;
    float _1381 = _1379 + 1.0;
    int _1383 = int(_1299) + int(_1353);
    int _1385 = ~_808;
    int _1387 = _1385 + 1;
    bool _1389 = _148 > 0.5;
    int _1391 = _1273 * _1383;
    int _1393 = _1391 + _1245;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1397 = _1395 != 0;
    bool _1399 = uint(_1393) >= uint(_774);
    int _1401 = int(_1315) + int(_1373);
    bool _1403 = !_1399;
    int _1405 = _1403 ? 0 : (-1);
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1409 = _1407 != 0;
    int _1411 = _1387 * _1401;
    int _1413 = _1411 + _1277;
    int _1415 = ~_1383;
    int _1417 = _1415 + _1405;
    int _1419 = _1417 + 1;
    int _1421 = _1389 ? as_type<int>(_1381) : as_type<int>(_190);
    bool _1423 = uint(_1413) >= uint(_808);
    int _1425 = _774 * _1419;
    int _1427 = _1425 + _1245;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1431 = _1429 != 0;
    bool _1433 = !_1423;
    int _1435 = _1433 ? 0 : (-1);
    bool _1437 = !_1303;
    int _1439 = _1437 ? _1427 : (-1);
    int _1441 = ~_1401;
    int _1443 = _1441 + _1435;
    int _1445 = _1443 + 1;
    bool _1447 = _150 > 0.5;
    int _1449 = _1439 & 3;
    int _1451 = _808 * _1445;
    int _1453 = _1451 + _1277;
    float _1455 = _1397 ? as_type<float>(_1421) : _190;
    float _1457 = in.m_71.x;
    float _1459 = in.m_71.y;
    float _1461 = in.m_71.z;
    float _1463 = in.m_71.w;
    bool _1465 = _148 > 0.5;
    bool _1467 = _1465 && _1431;
    if (_1409)
    {
        float _1469 = _1447 ? _1381 : _190;
        _194 = _1469;
    }
    float _1471 = _194;
    bool _1473 = _1449 != 3;
    float _1475 = in.m_73.x;
    float _1477 = in.m_73.y;
    float _1479 = in.m_73.z;
    float _1481 = in.m_73.w;
    bool _1483 = uint(_1449) >= 2u;
    bool _1485 = !_852;
    int _1487 = _1485 ? _1453 : (-1);
    int _1489 = _1483 ? 0 : 1;
    int _1491 = _1487 & 3;
    float _1493 = 0.0;
    if (!_1431)
    {
        _1493 = _186;
    }
    float _1495 = _1493;
    float _1497 = _1495;
    if (_1467)
    {
        float _1499 = -_186;
        float _1501 = _1499 + 1.0;
        _196 = _1501;
    }
    float _1503 = _196;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1507 = _1505 != 0;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1511 = _1509 != 0;
    int _1513 = ~_1489;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    bool _1519 = uint(_1491) >= 2u;
    float _1521 = _1257 * _1459;
    int _1523 = _1517;
    if (_1473)
    {
        int _1525 = ~_1489;
        int _1527 = _1525 + 1;
        _1523 = _1527;
    }
    int _1529 = _1523;
    float _1531 = as_type<float>(_876) * _1305;
    int _1533 = _1519 ? 0 : 1;
    bool _1535 = _1491 != 3;
    float _1537 = _1257 * _1477;
    bool _1539 = uint(_1449) > 1u;
    float _1541 = trunc(_1531);
    float _1543 = precise::max(_1541, 0.0);
    uint _1545 = uint(_1543);
    if (_1431)
    {
        _1497 = _1503;
    }
    float _1547 = _1497;
    float _1549 = _146 * 2.0;
    int _1551 = _1439 & 3;
    bool _1553 = _1551 != 0;
    int _1555 = ~_774;
    int _1557 = _1555 + 1;
    int _1559 = _1553 ? 0 : 1;
    float _1561 = floor(_1549);
    int _1563 = ~_1533;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = _1567;
    if (_1535)
    {
        int _1571 = ~_1533;
        int _1573 = _1571 + 1;
        _1569 = _1573;
    }
    int _1575 = _1569;
    bool _1577 = uint(_1491) > 1u;
    float _1579 = fma(_1255, _1475, _1537);
    int _1581 = ~_1559;
    int _1583 = _1581 + 1;
    int _1585 = _1583 + 1;
    int _1587 = _856 * int(_1545);
    int _1589 = _1587 + _1159;
    int _1591 = _1585;
    if (!_1539)
    {
        int _1593 = ~_1559;
        int _1595 = _1593 + 1;
        _1591 = _1595;
    }
    int _1597 = _1591;
    int _1599 = _1557 * int(_1337);
    int _1601 = _1599 + _1105;
    int _1603 = _1487 & 3;
    bool _1605 = _1603 != 0;
    float _1607 = fma(_1255, _1457, _1521);
    float _1609 = float(uint(_1589));
    float _1611 = _150 * 2.0;
    int _1613 = _1605 ? 0 : 1;
    float _1615 = fma(_1259, _1461, _1607);
    float _1617 = float(uint(_1601));
    float _1619 = fma(_1259, _1479, _1579);
    int _1621 = ~_1613;
    int _1623 = _1621 + 1;
    int _1625 = _1623 + 1;
    float _1627 = floor(_1611);
    int _1629 = _1625;
    if (!_1577)
    {
        int _1631 = ~_1613;
        int _1633 = _1631 + 1;
        _1629 = _1633;
    }
    int _1635 = _1629;
    float _1637 = fma(_1255, _1283, _1341);
    bool _1639 = _1561 >= 0.0;
    bool _1641 = isnan(_1561);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan(0.0);
    bool _1647 = _1643 || _1645;
    float _1649 = as_type<float>(_876) * _1609;
    float _1651 = as_type<float>(_866) * _1617;
    float _1653 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1655 = _1647 ? 0 : 1;
    float _1657 = trunc(_1651);
    float _1659 = precise::max(_1657, 0.0);
    uint _1661 = uint(_1659);
    bool _1663 = _1561 > 0.0;
    float _1665 = fma(_1653, -2.0, _792);
    int _1667 = ~_1655;
    int _1669 = _1667 + 1;
    int _1671 = _1669 + 1;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1673;
    float _1677 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1679 = !_1507;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1687 = trunc(_1649);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1695 = _913 > 0.0;
    float _1697 = fma(_1259, _1287, _1637);
    float _1699 = -_1693;
    float _1701 = fma(_1677, 2.0, _1699);
    int _1703 = _1671;
    if (!_1663)
    {
        int _1705 = ~_1655;
        int _1707 = _1705 + 1;
        _1703 = _1707;
    }
    int _1709 = _1703;
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1713 = _754 + _1711;
    int _1715 = ~_808;
    int _1717 = _1715 + 1;
    float _1719 = 1.0 / _1675;
    bool _1721 = _913 >= 0.0;
    bool _1723 = isnan(_913);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan(0.0);
    bool _1729 = _1725 || _1727;
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1731;
    int _1735 = int(_1337) + int(_1661);
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1739 = _754 + _1737;
    int _1741 = ~_774;
    int _1743 = _1741 + 1;
    float _1745 = _1713 * _933;
    int _1747 = int(_1545) + int(_1691);
    float _1749 = 1.0 / _1685;
    int _1751 = _1743 * _1735;
    int _1753 = _1751 + _1105;
    int _1755 = _1729 ? 0 : 1;
    float _1757 = _1739 * _1167;
    int _1759 = _1717 * _1747;
    int _1761 = _1759 + _1159;
    int _1763 = ~_1755;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    float _1769 = 1.0 / _1733;
    bool _1771 = !_1511;
    int _1773 = _1771 ? 0 : 1;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1777 = uint(_1761) >= uint(_808);
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1781 = _754 + _1779;
    int _1783 = _1767;
    if (!_1695)
    {
        int _1785 = ~_1755;
        int _1787 = _1785 + 1;
        _1783 = _1787;
    }
    int _1789 = _1783;
    float _1791 = _146 + _148;
    bool _1793 = uint(_1753) >= uint(_774);
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1797 = _754 + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1801 = _754 + _1799;
    float _1803 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1775);
    bool _1805 = !_1777;
    int _1807 = _1805 ? 0 : (-1);
    float _1809 = _1791 + (-1.0);
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1813 = _1811 != 0;
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1817 = _1815 != 0;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1821 = _1819 != 0;
    float _1823 = _1781 * _1187;
    bool _1825 = _1627 >= 0.0;
    bool _1827 = isnan(_1627);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan(0.0);
    bool _1833 = _1829 || _1831;
    float _1835 = _1797 * _1215;
    float _1837 = _1801 * _1719;
    float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1841 = _754 + _1839;
    float _1843 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1845 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1803);
    float _1847 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1665);
    float _1849 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1851 = _1841 * _1749;
    int _1853 = _1833 ? 0 : 1;
    float _1855 = -_1847;
    float _1857 = fma(_1845, _1843, _1855);
    bool _1859 = _1627 > 0.0;
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1863 = _754 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1869;
    float _1873 = _1863 * _1769;
    float _1875 = _148 + _150;
    float _1877 = fma(_1867, _1745, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1879 = fma(_1871, _1745, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1881;
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1887 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1885;
    float _1889 = _1875 + (-1.0);
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1895 = fma(_1883, _1823, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1901 = fma(_1887, _1823, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1905 = _1903 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1907 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1909;
    float _1913 = fma(_1893, _1757, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1915;
    float _1919 = fma(_1899, _1757, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _1921 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1923 = isnan(_754);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    float _1933 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1935 = _1933 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1937 = fma(_1911, _1837, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1939 = fma(_1917, _1837, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _1941 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1943 = isnan(_754);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1949 = _1945 || _1947;
    float _1951 = float(_1949);
    float _1953 = fma(_1905, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1955 = fma(_1935, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1957 = -_1931;
    float _1959 = _1957 + 1.0;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1963 = _1961 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1965 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1967 = isnan(_754);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1979 = _1977 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1981 = -_1951;
    float _1983 = _1981 + 1.0;
    float _1985 = _1951 * _1959;
    float _1987 = fma(_1963, _1851, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1989 = fma(_1979, _1851, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _1991 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1993 = isnan(_754);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1999 = _1995 || _1997;
    float _2001 = float(_1999);
    float _2003 = _1975 * _1983;
    float _2005 = -_1975;
    float _2007 = _2005 + 1.0;
    bool _2009 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2011 = isnan(_754);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2017 = _2013 || _2015;
    float _2019 = float(_2017);
    float _2021 = _1697 + _1289;
    bool _2023 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2025 = isnan(_754);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    float _2035 = _2001 * _2007;
    float _2037 = -_2001;
    float _2039 = _2037 + 1.0;
    float _2041 = -_2019;
    float _2043 = _2041 + 1.0;
    float _2045 = -_164;
    float _2047 = fma(_2045, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1701);
    float _2049 = -_2033;
    float _2051 = _2049 + 1.0;
    float _2053 = _2019 * _2039;
    float _2055 = fma(_838, _1873, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2057 = _2033 * _2043;
    float _2059 = fma(_850, _1873, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2061 = _1619 + _1481;
    bool _2063 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2065 = isnan(_754);
    bool _2067 = _2063 || _2065;
    bool _2069 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2071 = _2067 || _2069;
    float _2073 = float(_2071);
    float _2075 = -_834;
    float _2077 = _2075 + 1.0;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2081 = _834 * _2051;
    float _2083 = _1615 + _1463;
    float _2085 = _1231 * _164;
    float _2087 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2079);
    float _2089 = _2073 * _2077;
    float _2091 = -_2073;
    float _2093 = _2091 + 1.0;
    bool _2095 = !_1817;
    int _2097 = _2095 ? 0 : 1;
    float _2099 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2087);
    float _2101 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2103 = _1879 * _2089;
    float _2105 = exp2(_2085);
    float _2107 = _1877 * _2089;
    float _2109 = fma(_2099, _2101, _2047);
    float _2111 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2103);
    int _2113 = ~_1853;
    int _2115 = _2113 + 1;
    int _2117 = _2115 + 1;
    float _2119 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2107);
    int _2121 = _2117;
    if (!_1859)
    {
        int _2123 = ~_1853;
        int _2125 = _2123 + 1;
        _2121 = _2125;
    }
    int _2127 = _2121;
    float _2129 = fma(_1919, _2081, _2111);
    int _2131 = _1439 >> 31;
    float _2133 = fma(_1913, _2081, _2119);
    int _2135 = _1487 >> 31;
    float _2137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2139 = _2131 & 3;
    float _2141 = _1857 + 0.5;
    float _2143 = _2109 + 0.5;
    int _2145 = _2135 & 3;
    float _2147 = -_2105;
    float _2149 = _2147 + 1.0;
    int _2151 = _1439 + _2139;
    float _2153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2155 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2157 = 1.0 + _2155;
    int _2159 = _1487 + _2145;
    float _2161 = fma(_1901, _2057, _2129);
    bool _2163 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2165 = isnan(0.0);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2171 = _2167 || _2169;
    out.m_75.x = _2143;
    out.m_75.y = _2141;
    int _2173 = _2151 >> 2;
    float _2175 = fma(_1955, _2053, _2161);
    float _2177 = 1.0 / _2157;
    int _2179 = _2159 >> 2;
    float _2181 = _2171 ? _2149 : 0.0;
    float _2183 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2185 = _2173 << 4;
    int _2187 = _2185 + 368;
    float _2189 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2191 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2193 = isnan(1.0);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2199 = _2195 || _2197;
    float _2201 = _2183 * _2137;
    int _2203 = _2179 << 4;
    int _2205 = _2203 + 512;
    float _2207 = _2189 * _2153;
    uint _2209 = uint(int(uint(_2187) >> uint(2)));
    uint _2211 = uint(int(uint(int(_2209)) >> uint(2)));
    int _2213 = int(_2209) & 3;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[int(_2211)][_2213];
    int _2217 = int(_2209) + 1;
    uint _2219 = uint(int(uint(_2217) >> uint(2)));
    int _2221 = _2217 & 3;
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[int(_2219)][_2221];
    float _2225 = fma(_1895, _2057, _2133);
    int _2227 = abs(_1597);
    float _2229 = fma(_1939, _2035, _2175);
    out.m_77.x = _2207;
    out.m_77.y = _2201;
    float _2231 = fma(_1953, _2053, _2225);
    float _2233 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2235 = _2083 + _2233;
    int _2237 = ~_1747;
    int _2239 = _2237 + _1807;
    int _2241 = _2239 + 1;
    uint _2243 = uint(int(uint(_2205) >> uint(2)));
    uint _2245 = uint(int(uint(int(_2243)) >> uint(2)));
    int _2247 = int(_2243) & 3;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[int(_2245)][_2247];
    int _2251 = int(_2243) + 1;
    uint _2253 = uint(int(uint(_2251) >> uint(2)));
    int _2255 = _2251 & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    float _2259 = as_type<float>(_2127);
    float _2261 = _2175;
    if (_2199)
    {
        float _2263 = _2181 * _2177;
        _168 = _2263;
    }
    float _2265 = _168;
    int _2267 = abs(_2097);
    float _2269 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2271 = float(_1709);
    int _2273 = _808 * _2241;
    int _2275 = _2273 + _1159;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2279 = _2061 + _2277;
    int _2281 = _2187 + 8;
    uint _2283 = uint(int(uint(_2281) >> uint(2)));
    uint _2285 = uint(int(uint(int(_2283)) >> uint(2)));
    int _2287 = int(_2283) & 3;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[int(_2285)][_2287];
    int _2291 = int(_2283) + 1;
    uint _2293 = uint(int(uint(_2291) >> uint(2)));
    int _2295 = _2291 & 3;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[int(_2293)][_2295];
    float _2299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2301 = _2021 + _2299;
    float _2303 = float(_2267);
    float _2305 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2269);
    bool _2307 = !_1793;
    int _2309 = _2307 ? 0 : (-1);
    float _2311 = fma(_1937, _2035, _2231);
    int _2313 = abs(_1635);
    float _2315 = _2303 * _2271;
    int _2317 = _2205 + 8;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    uint _2321 = uint(int(uint(int(_2319)) >> uint(2)));
    int _2323 = int(_2319) & 3;
    float _2325 = (*spvDescriptorSet0.vp_c9)._m0[int(_2321)][_2323];
    int _2327 = int(_2319) + 1;
    uint _2329 = uint(int(uint(_2327) >> uint(2)));
    int _2331 = _2327 & 3;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[int(_2329)][_2331];
    float _2335 = fma(_2301, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2305);
    bool _2337 = !_1553;
    int _2339 = _2337 ? 0 : 1;
    float _2341 = fma(_1987, _2003, _2311);
    int _2343 = ~_1735;
    int _2345 = _2343 + _2309;
    int _2347 = _2345 + 1;
    float _2349 = fma(_1989, _2003, _2229);
    int _2351 = abs(_2339);
    float _2353 = fma(_2055, _1985, _2341);
    int _2355 = _774 * _2347;
    int _2357 = _2355 + _1105;
    float _2359 = fma(_2059, _1985, _2349);
    int _2361 = ~_2227;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    float _2367 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2353);
    bool _2369 = !_1605;
    int _2371 = _2369 ? 0 : 1;
    float _2373 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2359);
    int _2375 = abs(_1529);
    int _2377 = ~_2351;
    int _2379 = _2377 + 1;
    int _2381 = _2379 + 1;
    int _2383 = abs(_2371);
    out.m_79.x = _2367;
    out.m_79.y = _2373;
    int _2385 = ~_2313;
    int _2387 = _2385 + 1;
    int _2389 = _2387 + 1;
    int _2391 = _2365 * as_type<int>(_2223);
    bool _2393 = _1449 != 3;
    int _2395 = ~_2383;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    int _2401 = _2381 * as_type<int>(_2215);
    int _2403 = _2401 + _2391;
    bool _2405 = !_2393;
    int _2407 = _2405 ? 0 : (-1);
    bool _2409 = _1491 != 3;
    int _2411 = _2389 * as_type<int>(_2257);
    int _2413 = abs(_2407);
    int _2415 = _2399 * as_type<int>(_2249);
    int _2417 = _2415 + _2411;
    bool _2419 = !_2409;
    int _2421 = _2419 ? 0 : (-1);
    int _2423 = abs(_1575);
    int _2425 = abs(_2421);
    int _2427 = ~_2375;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    int _2433 = ~_2423;
    int _2435 = _2433 + 1;
    int _2437 = _2435 + 1;
    int _2439 = _2431 * as_type<int>(_2289);
    int _2441 = _2439 + _2403;
    int _2443 = _2437 * as_type<int>(_2325);
    int _2445 = _2443 + _2417;
    int _2447 = abs(_1773);
    int _2449 = abs(_1681);
    int _2451 = ~_2413;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = ~_2425;
    int _2459 = _2457 + 1;
    int _2461 = _2459 + 1;
    int _2463 = _2455 * as_type<int>(_2297);
    int _2465 = _2463 + _2441;
    int _2467 = ~_2449;
    int _2469 = _2467 + 1;
    int _2471 = _2469 + 1;
    int _2473 = _2461 * as_type<int>(_2333);
    int _2475 = _2473 + _2445;
    int _2477 = ~_2447;
    int _2479 = _2477 + 1;
    int _2481 = _2479 + 1;
    float _2483 = _2235 * _2235;
    bool _2485 = _808 == 0;
    int _2487 = _2471 * _2465;
    bool _2489 = _2335 >= 0.0;
    float _2491 = fma(_2279, _2279, _2483);
    bool _2493 = !_2485;
    int _2495 = _2493 ? _2275 : (-1);
    int _2497 = _2481 * _2475;
    bool _2499 = _774 == 0;
    float _2501 = fma(_2301, _2301, _2491);
    bool _2503 = !_1813;
    int _2505 = _2503 ? 0 : 1;
    int _2507 = _2495 * _2447;
    int _2509 = _2507 + _2497;
    bool _2511 = !_2499;
    int _2513 = _2511 ? _2357 : (-1);
    float _2515 = in.m_81.x;
    float _2517 = in.m_81.y;
    float _2519 = in.m_81.z;
    int _2521 = abs(_2505);
    float _2523 = rsqrt(_2501);
    float _2525 = float(_2509);
    int _2527 = _2513 * _2449;
    int _2529 = _2527 + _2487;
    float _2531 = as_type<float>(_2497);
    float _2533 = _2311;
    float _2535 = _2341;
    if (_2489)
    {
        _2531 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2537 = _2531;
    int _2539 = as_type<int>(_2537);
    if (_2489)
    {
        out.m_47.x = 0.0;
    }
    float _2541 = float(_2127);
    if (_2489)
    {
        float _2543 = _2537 * 5.0;
        _2539 = as_type<int>(_2543);
    }
    int _2545 = _2539;
    float _2547 = float(_2529);
    bool _2549 = !_1821;
    int _2551 = _2549 ? 0 : 1;
    float _2553 = as_type<float>(_2545);
    if (_2489)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7783 = as_type<float>(_2545);
        out.gl_Position.z = _7783;
    }
    float _2555 = float(_2521);
    float _2557 = _2235 * _2523;
    out.m_83.x = _2547;
    out.m_83.y = _2525;
    float _2559 = _2279 * _2523;
    float _2561 = _2557;
    if (_2489)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2563 = -_2557;
    float _2565 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2083);
    float _2567 = _2555 * _2541;
    float _2569 = _2301 * _2523;
    float _2571 = -_2559;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2061);
    float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2577 = _2565 + _2575;
    float _2579 = _2567 * (-2.0);
    float _2581 = -_2569;
    float _2583 = fma(_2581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2021);
    float _2585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2587 = _2573 + _2585;
    float _2589 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2591 = fma(_2579, _2515, _2515);
    float _2593 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2595 = _2583 + _2593;
    float _2597 = _146 + (-0.5);
    float _2599 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2589);
    float _2601 = _2315 * (-2.0);
    float _2603 = _148 + (-0.5);
    float _2605 = fma(_2597, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2591);
    float _2607 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2599);
    float _2609 = fma(_2601, _2517, _2517);
    float _2611 = fma(_1849, _2579, _1849);
    float _2613 = fma(_1907, _2601, _1907);
    int _2615 = abs(_2551);
    float _2617 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2609);
    bool _2619 = _2607 >= 0.0;
    float _2621 = fma(_2611, _2265, _2605);
    float _2623 = -_2557;
    float _2625 = fma(_2623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2235);
    float _2627 = fma(_2613, _2265, _2617);
    float _2629 = -_2559;
    float _2631 = fma(_2629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2279);
    float _2633 = _2621 * 0.15915493667125701904296875;
    float _2635 = _2625 * _2625;
    float _2637 = _2627 * 0.15915493667125701904296875;
    float _2639 = _2633 * 6.283185482025146484375;
    float _2641 = sin(_2639);
    float _2643 = float(_1789);
    float _2645 = fma(_2631, _2631, _2635);
    float _2647 = float(_2615);
    float _2649 = -_2569;
    float _2651 = fma(_2649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2301);
    float _2653 = _2569;
    if (_2619)
    {
        _2553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2655 = _2553;
    int _2657 = as_type<int>(_2655);
    if (_2619)
    {
        out.m_47.x = 0.0;
    }
    float _2659 = _2633 * 6.283185482025146484375;
    float _2661 = cos(_2659);
    float _2663 = _2647 * _2643;
    if (_2619)
    {
        float _2665 = _2655 * 5.0;
        _2657 = as_type<int>(_2665);
    }
    int _2667 = _2657;
    float _2669 = fma(_2651, _2651, _2645);
    if (_2619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7988 = as_type<float>(_2667);
        out.gl_Position.z = _7988;
    }
    float _2671 = _2637 * 6.283185482025146484375;
    float _2673 = sin(_2671);
    if (_2619)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2675 = -_2083;
    float _2677 = _2675 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2679 = -_2061;
    float _2681 = _2679 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2683 = _146 + _150;
    float _2685 = -_2021;
    float _2687 = _2685 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2689 = _2677 * _2677;
    float _2691 = _2683 + (-1.0);
    float _2693 = _2663 * (-2.0);
    float _2695 = fma(_2681, _2681, _2689);
    float _2697 = _150 + (-0.5);
    float _2699 = fma(_2691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2701 = sqrt(_2669);
    float _2703 = fma(_2687, _2687, _2695);
    float _2705 = fma(_2693, _2519, _2519);
    float _2707 = fma(_2699, _2693, _2699);
    float _2709 = _2641 * _2673;
    float _2711 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2713 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2705);
    float _2715 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2717 = rsqrt(_2703);
    float _2719 = _2661 * _2673;
    float _2721 = fma(_2707, _2265, _2713);
    bool _2723 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2725 = isnan(0.5);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2731 = _2727 || _2729;
    float _2733 = _2721 * 0.15915493667125701904296875;
    bool _2735 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2737 = isnan(0.5);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2743 = _2739 || _2741;
    float _2745 = _2637 * 6.283185482025146484375;
    float _2747 = cos(_2745);
    float _2749 = _2523 * _2701;
    float _2751 = _2749 * _2711;
    float _2753 = _2749 * _2715;
    float _2755 = _2733 * 6.283185482025146484375;
    float _2757 = sin(_2755);
    float _2759 = _2681 * _2717;
    float _2761 = _2687 * _2717;
    float _2763 = in.m_85.x;
    float _2765 = in.m_85.y;
    float _2767 = in.m_85.z;
    float _2769 = _2677 * _2717;
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2773 = _2759 * _2771;
    float _2775 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2777 = _2761 * _2775;
    float _2779 = _2661 * _2747;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2783 = -_2773;
    float _2785 = fma(_2761, _2781, _2783);
    float _2787 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2789 = -_2777;
    float _2791 = fma(_2769, _2787, _2789);
    float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2795 = _2769 * _2793;
    float _2797 = _2733 * 6.283185482025146484375;
    float _2799 = cos(_2797);
    float _2801 = _2785 * _2785;
    float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2805 = -_2795;
    float _2807 = fma(_2759, _2803, _2805);
    float _2809 = fma(_2757, _2779, _2709);
    float _2811 = fma(_2757, _2709, _2779);
    float _2813 = fma(_2791, _2791, _2801);
    float _2815 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2817 = fma(_2807, _2807, _2813);
    float _2819 = _2641 * _2747;
    float _2821 = _2749 * _2815;
    float _2823 = rsqrt(_2817);
    float _2825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2765);
    float _2827 = _2661 * _2799;
    float _2829 = -_2719;
    float _2831 = fma(_2757, _2819, _2829);
    float _2833 = _2747 * _2799;
    float _2835 = _2825 * _2751;
    float _2837 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2763);
    float _2839 = _2641 * _2799;
    float _2841 = _2673 * _2799;
    float _2843 = -_2819;
    float _2845 = fma(_2757, _2719, _2843);
    float _2847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2767);
    float _2849 = _2837 * _2821;
    float _2851 = _2827 * _2835;
    float _2853 = _2839 * _2835;
    float _2855 = _2847 * _2753;
    float _2857 = -_2835;
    float _2859 = _2757 * _2857;
    float _2861 = _2791 * _2823;
    float _2863 = fma(_2809, _2849, _2851);
    float _2865 = _2785 * _2823;
    float _2867 = _2807 * _2823;
    float _2869 = _2769 * _2861;
    float _2871 = fma(_2845, _2855, _2863);
    float _2873 = fma(_2833, _2849, _2859);
    float _2875 = _2761 * _2865;
    float _2877 = -_2869;
    float _2879 = fma(_2759, _2865, _2877);
    float _2881 = fma(_2831, _2849, _2853);
    float _2883 = fma(_2841, _2855, _2873);
    float _2885 = -_2875;
    float _2887 = fma(_2769, _2867, _2885);
    float _2889 = _2879 * _2871;
    float _2891 = fma(_2811, _2855, _2881);
    float _2893 = _2759 * _2867;
    float _2895 = _2887 * _2871;
    float _2897 = fma(_2867, _2883, _2889);
    float _2899 = _2565 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2901 = -_2893;
    float _2903 = fma(_2761, _2861, _2901);
    float _2905 = fma(_2861, _2883, _2895);
    float _2907 = fma(_2761, _2891, _2897);
    float _2909 = fma(_2759, _2891, _2905);
    float _2911 = _2021 + _2907;
    float _2913 = _2061 + _2909;
    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2917 = _2911 + _2915;
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2921 = _2913 + _2919;
    float _2923 = _2917 * _2917;
    float _2925 = fma(_2921, _2921, _2923);
    float _2927 = _2565 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2929 = sqrt(_2925);
    float _2931 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2927);
    float _2933 = _2903 * _2871;
    float _2935 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2931);
    float _2937 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2899);
    float _2939 = fma(_2865, _2883, _2933);
    float _2941 = _2935 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2943 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2937);
    float _2945 = fma(_2769, _2891, _2939);
    float _2947 = 1.0 / _2941;
    float _2949 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2951 = _2083 + _2945;
    bool _2953 = _2929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2955 = _2949 + _2941;
    float _2957 = _2883;
    float _2959 = _2949;
    float _2961 = _2939;
    if (!_2953)
    {
        _2957 = _2913;
    }
    float _2963 = _2957;
    float _2965 = _2963;
    if (!_2953)
    {
        _2959 = _2911;
    }
    float _2967 = _2959;
    float _2969 = _2967;
    if (!_2953)
    {
        _2961 = _2951;
    }
    float _2971 = _2961;
    bool _2973 = !_2953;
    float _2975 = _2971;
    if (!_2973)
    {
        float _2977 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2981 = _2929 + _2979;
        float _2983 = rsqrt(_2925);
        float _2985 = _2981 * _2977;
        float _2987 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2989 = _2985 * 0.15915493667125701904296875;
        float _2991 = _2989 * 6.283185482025146484375;
        float _2993 = cos(_2991);
        float _2995 = _2989 * 6.283185482025146484375;
        float _2997 = sin(_2995);
        float _2999 = _2993 + (-1.0);
        float _3001 = fma(_2997, _2987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3003 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3005 = _2983 * _3001;
        float _3007 = fma(_2951, _2993, _3003);
        float _3009 = fma(_2921, _3005, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3011 = fma(_2917, _3005, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2975 = _3007;
        _2969 = _3011;
        _2965 = _3009;
    }
    float _3013 = _2975;
    float _3015 = _2969;
    float _3017 = _2965;
    float _3019 = -_2557;
    float _3021 = fma(_3019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3013);
    float _3023 = -_2569;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3015);
    float _3027 = -_2559;
    float _3029 = fma(_3027, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3017);
    float _3031 = _2955 * _2947;
    float _3033 = _3031 * 0.5;
    float _3035 = _3029;
    float _3037 = _3025;
    float _3039 = _3013;
    if (_2743)
    {
        _2561 = 1.0;
    }
    float _3041 = _2561;
    float _3043 = _3041;
    if (_2731)
    {
        _2653 = _3021;
    }
    float _3045 = _2653;
    float _3047 = _3045;
    if (!_2731)
    {
        float _3049 = _2577 * _2577;
        float _3051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3053 = -_2061;
        float _3055 = _3053 + _3017;
        float _3057 = -_2021;
        float _3059 = _3057 + _3015;
        float _3061 = fma(_2587, _2587, _3049);
        float _3063 = fma(_2595, _2595, _3061);
        float _3065 = 1.0 / _2749;
        float _3067 = sqrt(_3063);
        float _3069 = precise::min(_3067, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3071 = _3069 * _3051;
        float _3073 = -_2083;
        float _3075 = _3073 + _3013;
        float _3077 = _3071 * _3065;
        float _3079 = fma(_3055, _3077, _2573);
        float _3081 = fma(_3075, _3077, _2565);
        float _3083 = fma(_3059, _3077, _2583);
        _3047 = _3081;
        _3035 = _3079;
        _3037 = _3083;
    }
    float _3085 = _3047;
    float _3087 = _3035;
    float _3089 = _3037;
    if (!_2743)
    {
        float _3091 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3093 = _3091 * 0.15915493667125701904296875;
        float _3095 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3099 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3097);
        float _3101 = _3093 * 6.283185482025146484375;
        float _3103 = cos(_3101);
        float _3105 = _3095 * 0.15915493667125701904296875;
        float _3107 = _3093 * 6.283185482025146484375;
        float _3109 = sin(_3107);
        float _3111 = 1.0 / _3103;
        float _3113 = _3105 * 6.283185482025146484375;
        float _3115 = cos(_3113);
        float _3117 = _3109 * _3111;
        float _3119 = _3105 * 6.283185482025146484375;
        float _3121 = sin(_3119);
        float _3123 = _3115 * _3117;
        float _3125 = 1.0 / _3099;
        float _3127 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3129 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3127;
        float _3131 = 1.0 / _3123;
        float _3133 = 1.0 / _3129;
        float _3135 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3137 = _3125 * _3135;
        float _3139 = _3121 * _3131;
        float _3141 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3143 = fma(_3139, _3137, _3141);
        float _3145 = _3143 * _3133;
        float _3147 = precise::clamp(_3145, 0.0, 1.0);
        _3039 = _3133;
        _3043 = _3147;
    }
    float _3149 = _3039;
    float _3151 = _3043;
    float _3153 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3155 = _3085 + _3153;
    float _3157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3159 = _3087 + _3157;
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3163 = _3089 + _3161;
    float _3165 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3167 = _3155 * _3155;
    float _3169 = fma(_3159, _3159, _3167);
    float _3171 = fma(_3163, _3163, _3169);
    float _3173 = rsqrt(_3171);
    float _3175 = sqrt(_3171);
    float _3177 = _3173 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3179 = _3159 * _3177;
    float _3181 = _3163 * _3177;
    float _3183 = _3179 * _3179;
    float _3185 = _3181 * _3181;
    float _3187 = _3183 + _3185;
    float _3189 = sqrt(_3187);
    bool _3191 = _3189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3195 = _3189 + _3193;
    float _3197 = _3163;
    float _3199 = _3187;
    float _3201 = _3195;
    float _3203 = _3149;
    float _3205 = _3177;
    if (_3191)
    {
        float _3207 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3197 = _3207;
    }
    float _3209 = _3197;
    if (_3191)
    {
        float _3211 = rsqrt(_3187);
        _3199 = _3211;
    }
    float _3213 = _3199;
    float _3215 = _3213;
    if (_3191)
    {
        float _3217 = _3195 * _3209;
        _3201 = _3217;
    }
    float _3219 = _3201;
    if (_3191)
    {
        float _3221 = _3219 * 0.15915493667125701904296875;
        _3203 = _3221;
    }
    float _3223 = _3203;
    float _3225 = _3209;
    float _3227 = _3223;
    if (_3191)
    {
        float _3229 = _3223 * 6.283185482025146484375;
        float _3231 = sin(_3229);
        _3225 = _3231;
    }
    float _3233 = _3225;
    float _3235 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3237 = precise::max(0.0, _3235);
    float _3239 = _3167;
    float _3241 = _3237;
    if (_3191)
    {
        float _3243 = _3223 * 6.283185482025146484375;
        float _3245 = cos(_3243);
        _3239 = _3245;
    }
    float _3247 = _3239;
    float _3249 = -_3177;
    float _3251 = -_3237;
    float _3253 = fma(_3155, _3249, _3251);
    float _3255 = _3253;
    if (_3191)
    {
        float _3257 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3241 = _3257;
    }
    float _3259 = _3241;
    float _3261 = _3233;
    float _3263 = _3259;
    if (_3191)
    {
        float _3265 = fma(_3233, _3259, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3261 = _3265;
    }
    float _3267 = _3261;
    float _3269 = _3267;
    float _3271 = _3247;
    if (_3191)
    {
        float _3273 = _3247 + (-1.0);
        _3263 = _3273;
    }
    float _3275 = _3263;
    float _3277 = _3275;
    if (_3191)
    {
        float _3279 = _3213 * _3267;
        _3205 = _3279;
    }
    float _3281 = _3205;
    if (!_3191)
    {
        _3269 = _3179;
    }
    float _3283 = _3269;
    float _3285 = _3283;
    if (_3191)
    {
        float _3287 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3227 = _3287;
    }
    float _3289 = _3227;
    if (_3191)
    {
        float _3291 = _3179 * _3281;
        _3285 = _3291;
    }
    float _3293 = _3285;
    if (!_3191)
    {
        _3277 = _3181;
    }
    float _3295 = _3277;
    float _3297 = _3295;
    if (_3191)
    {
        float _3299 = _3181 * _3281;
        _3297 = _3299;
    }
    float _3301 = _3297;
    if (!_3191)
    {
        _3215 = _3183;
    }
    float _3303 = _3215;
    float _3305 = _3303;
    if (_3191)
    {
        float _3307 = fma(_3253, _3247, _3289);
        _3255 = _3307;
    }
    float _3309 = _3255;
    if (_3191)
    {
        float _3311 = _3293 * _3293;
        _3305 = _3311;
    }
    float _3313 = _3305;
    if (!_3191)
    {
        _3271 = _3185;
    }
    float _3315 = _3271;
    float _3317 = _3315;
    if (_3191)
    {
        float _3319 = _3301 * _3301;
        _3317 = _3319;
    }
    float _3321 = _3317;
    float _3323 = fma(_3309, _3309, _3313);
    float _3325 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3327 = _3323 + _3321;
    float _3329 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3325);
    float _3331 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3335 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3333);
    float _3337 = precise::clamp(_3335, 0.0, 1.0);
    float _3339 = rsqrt(_3327);
    float _3341 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3329);
    float _3343 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3345 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3331);
    float _3347 = -_3337;
    float _3349 = _3347 + 1.0;
    float _3351 = _3341 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3353 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3343);
    float _3355 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3345);
    float _3357 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3359 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3361 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3353);
    float _3363 = _3355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3365 = abs(_3349);
    float _3367 = log2(_3365);
    float _3369 = -_3359;
    float _3371 = fma(_3369, _3165, 1.0);
    float _3373 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3357);
    float _3375 = _3361 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3377 = _3339 * _3293;
    float _3379 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3381 = _3339 * _3309;
    float _3383 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3373);
    float _3385 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3387 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3379);
    float _3389 = _3339 * _3301;
    float _3391 = _3383 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3393 = -_3385;
    float _3395 = fma(_3381, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3393);
    float _3397 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3387);
    float _3399 = log2(_3371);
    float _3401 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3403 = -_3389;
    float _3405 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3395);
    float _3407 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3397);
    float _3409 = _3367 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3411 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3413 = fma(_3405, -0.5, 0.5);
    float _3415 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3401);
    float _3417 = 1.0 / _3407;
    float _3419 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3411);
    float _3421 = fma(_3405, 0.5, 0.5);
    float _3423 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3415);
    float _3425 = _3381 + 1.0;
    float _3427 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3419);
    float _3429 = fma(_3421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3431 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3423);
    float _3433 = exp2(_3409);
    float _3435 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3427);
    float _3437 = fma(_3421, _3429, -0.212114393711090087890625);
    float _3439 = _3399 * 0.693147182464599609375;
    float _3441 = fma(_3421, _3437, 1.570728778839111328125);
    float _3443 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3445 = sqrt(_3413);
    float _3447 = _3435 * _3417;
    float _3449 = _3431 * _3417;
    float _3451 = fma(_3447, 0.5, 0.5);
    float _3453 = fma(_3449, -0.5, 0.5);
    float _3455 = -_3381;
    float _3457 = fma(_3433, _3425, _3455);
    float3 _9241 = float3(_3451, _3453, _3443);
    float _3459 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9241, float3(0.0), isnan(_9241)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9241, float3(0.0), isnan(_9241)), level(0.0)).x;
    float3 _9252 = float3(_3451, _3453, _3443);
    float4 _3462 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9252, float3(0.0), isnan(_9252)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9252, float3(0.0), isnan(_9252)), level(0.0)).xyzw;
    float _3464 = _3462.x;
    float _3466 = _3462.y;
    float _3468 = _3462.z;
    float _3470 = _3462.w;
    float _3472 = fma(_3457, 0.5, 0.5);
    float _3474 = _3445 * 0.636619746685028076171875;
    float _3476 = -_3441;
    float _3478 = fma(_3474, _3476, 1.0);
    float2 _9279 = float2(_3478, _3472);
    float3 _3482 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9279, float2(0.0), isnan(_9279)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9279, float2(0.0), isnan(_9279)), level(0.0)).xyz;
    float _3484 = _3482.x;
    float _3486 = _3482.y;
    float _3488 = _3482.z;
    float _3490 = in.m_87.x;
    float _3492 = in.m_87.y;
    float _3494 = in.m_87.z;
    bool _3496 = _2765 != 0.0;
    bool _3498 = isnan(_2765);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan(0.0);
    bool _3504 = _3500 || _3502;
    float _3506 = _3367 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3508 = in.m_89.x;
    float _3510 = in.m_89.y;
    float _3512 = in.m_89.z;
    float _3514 = in.m_89.w;
    bool _3516 = _2763 == 0.0;
    bool _3518 = !_3504;
    bool _3520 = _3516 && _3518;
    float _3522 = _2845 * _2903;
    float _3524 = exp2(_3506);
    bool _3526 = _2767 == 0.0;
    bool _3528 = _3526 && _3520;
    float _3530 = _3490;
    float _3532 = _3494;
    float _3534 = _3407;
    float _3536 = _3435;
    float _3538 = _3431;
    if (_3528)
    {
        _2259 = _3490;
    }
    float _3540 = _2259;
    float _3542 = -_3524;
    float _3544 = _3542 + 1.0;
    float _3546 = _3540;
    if (_3528)
    {
        _2533 = _3494;
    }
    float _3548 = _2533;
    float _3550 = _3548;
    if (_3528)
    {
        _2261 = _3492;
    }
    float _3552 = _2261;
    float _3554 = _3552;
    if (_3528)
    {
        _2535 = _3540;
    }
    float _3556 = _2535;
    float _3558 = _3556;
    if (!_3528)
    {
        _3546 = _3490;
    }
    float _3560 = _3546;
    if (_3528)
    {
        _3530 = _3548;
    }
    float _3562 = _3530;
    float _3564 = _3562;
    if (!_3528)
    {
        _3550 = _3494;
    }
    float _3566 = _3550;
    if (!_3528)
    {
        float _3568 = fma(_2763, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3560);
        _3558 = _3568;
    }
    float _3570 = _3558;
    if (_3528)
    {
        _3532 = _3552;
    }
    float _3572 = _3532;
    float _3574 = _3512 * _3560;
    float _3576 = _3572;
    if (!_3528)
    {
        _3554 = _3492;
    }
    float _3578 = _3554;
    float _3580 = _3510 * _3566;
    if (!_3528)
    {
        float _3582 = fma(_2767, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3566);
        _3564 = _3582;
    }
    float _3584 = _3564;
    float _3586 = -_3574;
    float _3588 = fma(_3508, _3566, _3586);
    float _3590 = _2827 * _2879;
    float _3592 = _3508 * _3578;
    if (!_3528)
    {
        float _3594 = fma(_2765, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3578);
        _3576 = _3594;
    }
    float _3596 = _3576;
    float _3598 = -_3580;
    float _3600 = fma(_3512, _3578, _3598);
    float _3602 = _2809 * _2887;
    float _3604 = -_3592;
    float _3606 = fma(_3510, _3560, _3604);
    float _3608 = _3588 * _3514;
    float _3610 = _3600 * _3514;
    float _3612 = _2809 * _2903;
    float _3614 = _3606 * _3514;
    float _3616 = _2809 * _2879;
    float _3618 = _2827 * _2887;
    float _3620 = _2827 * _2903;
    float _3622 = _2845 * _2887;
    float _3624 = fma(_2833, _2861, _3602);
    float _3626 = _2845 * _2879;
    float _3628 = fma(_2833, _2865, _3612);
    float _3630 = fma(_2833, _2867, _3616);
    float _3632 = -_2757;
    float _3634 = fma(_3632, _2861, _3618);
    float _3636 = -_2757;
    float _3638 = fma(_3636, _2865, _3620);
    float _3640 = -_2757;
    float _3642 = fma(_3640, _2867, _3590);
    float _3644 = fma(_2841, _2861, _3622);
    float _3646 = fma(_2841, _2865, _3522);
    float _3648 = fma(_2841, _2867, _3626);
    float _3650 = fma(_2839, _2759, _3634);
    float _3652 = fma(_2839, _2769, _3638);
    float _3654 = fma(_2839, _2761, _3642);
    float _3656 = fma(_2831, _2759, _3624);
    float _3658 = fma(_2831, _2769, _3628);
    float _3660 = fma(_2831, _2761, _3630);
    float _3662 = fma(_2811, _2761, _3648);
    float _3664 = _3650 * _3510;
    float _3666 = _3652 * _3510;
    float _3668 = _3654 * _3510;
    float _3670 = _3650 * _3596;
    float _3672 = fma(_2811, _2759, _3644);
    float _3674 = _3652 * _3596;
    float _3676 = fma(_2811, _2769, _3646);
    float _3678 = fma(_3656, _3570, _3670);
    float _3680 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3682 = _3608 * _3650;
    float _3684 = _3608 * _3652;
    float _3686 = _3654 * _3596;
    float _3688 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3680);
    float _3690 = _3608 * _3654;
    float _3692 = fma(_3658, _3570, _3674);
    float _3694 = fma(_3656, _3508, _3664);
    float _3696 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3688);
    float _3698 = _3544 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3700 = fma(_3658, _3508, _3666);
    float _3702 = fma(_3610, _3656, _3682);
    float _3704 = fma(_3610, _3658, _3684);
    float _3706 = fma(_3660, _3508, _3668);
    float _3708 = fma(_3610, _3660, _3690);
    float _3710 = fma(_3660, _3570, _3686);
    float _3712 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3696);
    float _3714 = fma(_3672, _3512, _3694);
    float _3716 = fma(_3676, _3512, _3700);
    float _3718 = fma(_3614, _3672, _3702);
    float _3720 = fma(_3614, _3676, _3704);
    float _3722 = fma(_3662, _3512, _3706);
    float _3724 = fma(_3614, _3662, _3708);
    float _3726 = fma(_3672, _3584, _3678);
    float _3728 = fma(_3676, _3584, _3692);
    float _3730 = fma(_3662, _3584, _3710);
    float _3732 = _3712 + _3407;
    float _3734 = _3435 + _3407;
    float _3736 = _3407 * 0.5;
    float _3738 = -_3698;
    float _3740 = _3738 + 1.0;
    out.m_91.x = _3714;
    out.m_91.y = _3716;
    out.m_91.z = _3722;
    float _3742 = _3732 * 0.5;
    float _3744 = _3734 * 0.5;
    float _3746 = fma(_3431, -0.5, _3736);
    out.m_93.x = _3726;
    out.m_93.y = _3728;
    out.m_93.z = _3730;
    bool _3748 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3750 = isnan(_3175);
    bool _3752 = _3748 || _3750;
    bool _3754 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3756 = _3752 || _3754;
    out.m_95.x = _3744;
    out.m_95.y = _3746;
    out.m_95.z = _3742;
    out.m_95.w = _3407;
    out.m_97.x = _3718;
    out.m_97.y = _3720;
    out.m_97.z = _3724;
    out.gl_Position.x = _3435;
    out.gl_Position.y = _3431;
    out.gl_Position.z = _3712;
    out.gl_Position.w = _3407;
    float _3758 = _3724;
    float _3760 = _3720;
    float _3762 = _3718;
    if (!_3756)
    {
        _3758 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3764 = _3758;
    float _3766 = _3764;
    float _3768 = _3764;
    if (!_3756)
    {
        _3760 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3770 = _3760;
    float _3772 = _3770;
    float _3774 = _3770;
    if (!_3756)
    {
        _3762 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3776 = _3762;
    float _3778 = _3776;
    float _3780 = _3776;
    if (!_3756)
    {
        _3534 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3782 = _3534;
    float _3784 = _3782;
    float _3786 = _3782;
    if (!_3756)
    {
        _3536 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3788 = _3536;
    float _3790 = _3788;
    float _3792 = _3788;
    if (!_3756)
    {
        _3538 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3794 = _3538;
    float _3796 = _3698 * _3459;
    float _3798 = _3470 * _3740;
    float _3800 = _3470 * _3796;
    float _3802 = _3488 * _3796;
    float _3804 = fma(_3484, _3800, _3464);
    float _3806 = fma(_3486, _3800, _3466);
    float _3808 = _3151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3810 = fma(_3470, _3802, _3468);
    out.m_99.x = _3804;
    out.m_99.y = _3806;
    out.m_99.z = _3810;
    out.m_99.w = _3798;
    bool _3812 = !_3756;
    float _3814 = _3794;
    float _3816 = _3794;
    if (!_3812)
    {
        bool _3818 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3820 = isnan(_3175);
        bool _3822 = _3818 || _3820;
        bool _3824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3826 = _3822 || _3824;
        if (!_3826)
        {
            float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3830 = _3175 + _3828;
            float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3834 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3832;
            float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3840 = 1.0 / _3834;
            float _3842 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3844 = _3842 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3848 = _3846 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3850 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3852 = _3850 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3854 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3856 = _3854 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3858 = _3830 * _3840;
            float _3860 = precise::clamp(_3858, 0.0, 1.0);
            float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3866 = fma(_3860, _3838, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3868 = fma(_3860, _3864, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3870 = fma(_3860, _3844, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3872 = fma(_3860, _3848, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3874 = fma(_3860, _3852, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3876 = fma(_3860, _3856, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3792 = _3870;
            _3774 = _3874;
            _3786 = _3866;
            _3768 = _3872;
            _3816 = _3868;
            _3780 = _3876;
            _3878 = true;
        }
        else
        {
            bool _3880 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3882 = isnan(_3175);
            bool _3884 = _3880 || _3882;
            bool _3886 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3888 = _3884 || _3886;
            if (!_3888)
            {
                _3784 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3890 = _3784;
            _3786 = _3890;
            if (!_3888)
            {
                _3790 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3892 = _3790;
            _3792 = _3892;
            if (!_3888)
            {
                _3814 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3894 = _3814;
            _3816 = _3894;
            if (!_3888)
            {
                _3766 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3896 = _3766;
            _3768 = _3896;
            if (!_3888)
            {
                _3772 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3898 = _3772;
            _3774 = _3898;
            if (!_3888)
            {
                _3778 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3900 = _3778;
            bool _3902 = !_3888;
            _3780 = _3900;
            if (!_3902)
            {
                bool _3904 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3906 = isnan(_3175);
                bool _3908 = _3904 || _3906;
                bool _3910 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3912 = _3908 || _3910;
                if (!_3912)
                {
                    float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3916 = _3175 + _3914;
                    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3920 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3918;
                    float _3922 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3924 = _3922 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3926 = 1.0 / _3920;
                    float _3928 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3930 = _3928 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3932 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3934 = _3932 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3938 = _3936 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3940 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3942 = _3940 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3944 = _3916 * _3926;
                    float _3946 = precise::clamp(_3944, 0.0, 1.0);
                    float _3948 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3950 = _3948 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3952 = fma(_3946, _3924, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3954 = fma(_3946, _3950, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3956 = fma(_3946, _3930, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3958 = fma(_3946, _3934, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3960 = fma(_3946, _3938, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3962 = fma(_3946, _3942, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3792 = _3956;
                    _3774 = _3960;
                    _3786 = _3952;
                    _3768 = _3958;
                    _3816 = _3954;
                    _3780 = _3962;
                    _3878 = true;
                }
                else
                {
                    _3792 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3774 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3786 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3768 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3816 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3780 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3878 = false;
    float _3964 = _3792;
    float _3966 = _3774;
    float _3968 = _3786;
    float _3970 = _3768;
    float _3972 = _3816;
    float _3974 = _3780;
    float _3976 = fma(_3728, -0.5, 0.5);
    float _3978 = precise::clamp(_3976, 0.0, 1.0);
    float _3980 = -_3964;
    float _3982 = _3980 + _3966;
    float _3984 = -_3968;
    float _3986 = _3984 + _3970;
    out.m_101.x = 0.0;
    float _3988 = fma(_3978, _3982, _3964);
    float _3990 = -_3972;
    float _3992 = _3990 + _3974;
    float _3994 = fma(_3978, _3986, _3968);
    float _3996 = _3988 * 0.586610972881317138671875;
    bool _3998 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4000 = fma(_3978, _3992, _3972);
    float _4002 = _3808 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4004 = fma(_3994, 0.298911988735198974609375, _3996);
    bool _4006 = _3151 > 0.0;
    bool _4008 = isnan(_3151);
    bool _4010 = _4006 || _4008;
    bool _4012 = isnan(0.0);
    bool _4014 = _4010 || _4012;
    float _4016 = fma(_4000, 0.114477999508380889892578125, _4004);
    out.m_47.x = _4002;
    float _4018 = -_4016;
    float _4020 = _3994 + _4018;
    float _4022 = -_4016;
    float _4024 = _3988 + _4022;
    float _4026 = -_4016;
    float _4028 = _4000 + _4026;
    float _4030 = fma(_4020, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4016);
    float _4032 = fma(_4024, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4016);
    float _4034 = fma(_4028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4016);
    bool _4036 = !_3998;
    if (!_4036)
    {
        float _4038 = -_3085;
        float _4040 = _4038 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4042 = -_3087;
        float _4044 = _4042 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4046 = -_3089;
        float _4048 = _4046 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4050 = _4040 * _4040;
        float _4052 = fma(_4044, _4044, _4050);
        float _4054 = fma(_4048, _4048, _4052);
        float _4056 = sqrt(_4054);
        float _4058 = rsqrt(_4054);
        float _4060 = -_4056;
        float _4062 = _4060 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4064 = _4062 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4066 = precise::clamp(_4064, 0.0, 1.0);
        float _4068 = _4044 * _4058;
        float _4070 = _4040 * _4058;
        float _4072 = abs(_4066);
        float _4074 = log2(_4072);
        float _4076 = _4048 * _4058;
        float _4078 = _4068 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4080 = _3728 * _4070;
        float _4082 = -_4070;
        float _4084 = -_4078;
        float _4086 = fma(_4082, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4084);
        float _4088 = fma(_3726, _4068, _4080);
        float _4090 = -_4076;
        float _4092 = fma(_4090, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4086);
        float _4094 = fma(_3730, _4076, _4088);
        float _4096 = precise::clamp(_4094, 0.0, 1.0);
        float _4098 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4100 = _4092 + _4098;
        float _4102 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4104 = _4100 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4106 = precise::clamp(_4104, 0.0, 1.0);
        float _4108 = exp2(_4102);
        float _4110 = _4108 * _4106;
        float _4112 = _4096 * _4110;
        float _4114 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4116 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4118 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _4114;
        out.m_101.y = _4116;
        out.m_101.z = _4118;
    }
    out.m_103.x = _4030;
    out.m_103.y = _4032;
    out.m_103.z = _4034;
    if (_4014)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4120 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4120;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3878 = false;
    bool _746 = false;
    bool _542 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_44.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_122);
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    float _134 = _132;
    if (!_126)
    {
        out.m_47.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4179 = as_type<float>(_140);
        out.gl_Position.z = _4179;
    }
    if (!_126)
    {
        return out;
    }
    float _144 = in.m_49.w;
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    bool _152 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_144);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_144;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _146;
    out.m_53.y = _148;
    out.m_53.z = _150;
    float _166 = 0.0;
    float _168 = _164;
    if (_160)
    {
        float _170 = float(_122);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    if (_178)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _134;
    if (_178)
    {
        out.m_47.x = 0.0;
    }
    if (_178)
    {
        float _182 = _180 * 5.0;
        _142 = as_type<int>(_182);
    }
    int _184 = _142;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4260 = as_type<float>(_184);
        out.gl_Position.z = _4260;
    }
    if (_178)
    {
        return out;
    }
    float _186 = in.m_55.x;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = in.m_55.y;
    out.m_57.x = _186;
    out.m_57.y = _190;
    bool _192 = !_188;
    float _194 = _190;
    float _196 = _186;
    float _212;
    if (!_192)
    {
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        float _216 = float(_122);
        float _218 = 1.0 / _216;
        float _220 = _164 * _218;
        _212 = _220;
    }
    _214 = false;
    float _222 = _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _222 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = 1.0 / _230;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _246;
    float _250 = 1.0 / _238;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _222 + _252;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _234;
    float _260 = _254 * _244;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _222 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    float _270 = fma(_268, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = 1.0 / _242;
    float _274 = _264 * _250;
    bool _276 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _278 = isnan(_222);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _290 = _222 + _288;
    bool _292 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_222);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _248;
    float _306 = _226 * _258;
    bool _308 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _310 = isnan(_222);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_302;
    float _322 = _320 + 1.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = _222 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = _290 * _272;
    float _334 = -_286;
    float _336 = _334 + 1.0;
    bool _338 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_222);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = fma(_330, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = _302 * _336;
    float _354 = _318 * _322;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    bool _360 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _362 = isnan(_222);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -_348;
    float _374 = _372 + 1.0;
    float _376 = _326 * _304;
    float _378 = fma(_358, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _380 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_222);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _370 * _374;
    float _394 = -_370;
    float _396 = _394 + 1.0;
    float _398 = -_318;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = _390 * _396;
    float _408 = _348 * _400;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = _350 * _406;
    float _420 = -_390;
    float _422 = _420 + 1.0;
    float _424 = _378 * _406;
    float _426 = _270 * _406;
    float _428 = fma(_404, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_412, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_416, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].x, _418);
    float _440 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _456 = fma(_436, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_428, _392, _438);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_450, _332, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _466 = fma(_446, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_430, _392, _440);
    float _470 = fma(_456, _408, _458);
    float _472 = fma(_462, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_432, _392, _442);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_466, _408, _468);
    float _482 = fma(_472, _408, _474);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _488;
    float _492 = fma(_454, _332, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_478, _332, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _496;
    float _500 = fma(_464, _354, _470);
    float _502 = fma(_486, _376, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _504 = fma(_490, _376, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _506 = fma(_498, _376, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _508 = fma(_492, _354, _480);
    float _510 = fma(_494, _354, _482);
    float _512 = fma(_502, _352, _500);
    float _514 = fma(_504, _352, _508);
    float _516 = fma(_506, _352, _510);
    float _518 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[148].x, _512);
    float _520 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[148].y, _514);
    float _522 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[148].z, _516);
    bool _524 = !_256;
    float _540;
    if (!_524)
    {
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _528 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _540 = _538;
        _542 = true;
    }
    else
    {
        float _544 = float(_122);
        float _546 = 1.0 / _544;
        float _548 = _164 * _546;
        _540 = _548;
    }
    _542 = false;
    float _550 = _540;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _550 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = isnan(_550);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _580 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _582 = isnan(_550);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _558;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    float _598 = -_574;
    float _600 = _598 + 1.0;
    bool _602 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _604 = isnan(_550);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / _562;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _620 = 1.0 / _578;
    float _622 = _596 * _592;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _628 = _590 * _600;
    float _630 = -_590;
    float _632 = _630 + 1.0;
    float _634 = fma(_622, _554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _636;
    float _640 = _612 * _632;
    float _642 = _626 * _614;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _550 + _644;
    bool _648 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _650 = isnan(_550);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _634 * _640;
    float _662 = -_612;
    float _664 = _662 + 1.0;
    float _666 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _670 = _550 + _668;
    float _672 = _638 * _620;
    float _674 = -_658;
    float _676 = _674 + 1.0;
    float _678 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _660);
    float _680 = fma(_672, _670, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _682 = _574 * _676;
    float _684 = fma(_666, _628, _678);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = fma(_680, _682, _684);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _692 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[118].x, _688);
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _702 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _716 = in.m_59.x;
    float _718 = in.m_59.y;
    float _720 = in.m_59.z;
    out.m_61.x = _702;
    out.m_61.y = _704;
    out.m_61.z = _706;
    out.m_61.w = _618;
    out.m_63.x = _708;
    out.m_63.y = _710;
    out.m_63.z = _712;
    out.m_63.w = _714;
    float _722 = _522 * _720;
    float _724 = _520 * _718;
    float _726 = _518 * _716;
    bool _728 = !_616;
    float _744;
    if (!_728)
    {
        float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _732 = _146 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _734 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _736 = _734 * _730;
        float _738 = floor(_736);
        float _740 = -_738;
        float _742 = _736 + _740;
        _744 = _742;
        _746 = true;
    }
    else
    {
        float _748 = float(_122);
        float _750 = 1.0 / _748;
        float _752 = _164 * _750;
        _744 = _752;
    }
    _746 = false;
    float _754 = _744;
    float _756 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _758 = int(_756);
    float _760 = in.m_65.w;
    float _762 = float(_122);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _766 = _764 != 0;
    float _768 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _770 = int(_768);
    float _772 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _774 = int(_772);
    float _776 = float(_758);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _778;
    if (_766)
    {
        _130 = 1.0;
    }
    float _782 = _130;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _788 = _782;
    if (!_766)
    {
        _788 = 1.2345600128173828125;
    }
    float _790 = _788;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _794 = 1.0 / _776;
    float _796 = float(_770);
    out.m_67.w = _760;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _806 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _808 = int(_806);
    float _810 = float(uint(_774));
    float _812 = _148 * 2.0;
    int _814 = ~_774;
    int _816 = _814 + 1;
    bool _818 = _774 == 0;
    float _820 = 1.0 / _796;
    float _822 = _794 * _164;
    bool _824 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _826 = isnan(_754);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _836;
    float _840 = float(uint(_808));
    float _842 = 1.0 / _810;
    int _844 = ~_808;
    int _846 = _844 + 1;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _848;
    bool _852 = _808 == 0;
    int _854 = ~_808;
    int _856 = _854 + 1;
    float _858 = _820 * _164;
    float _860 = trunc(_822);
    int _862 = int(_860);
    float _864 = 1.0 / _840;
    int _866 = as_type<int>(_842) + (-2);
    float _868 = trunc(_858);
    int _870 = int(_868);
    float _872 = float(uint(_862));
    float _874 = as_type<float>(_866) * _872;
    int _876 = as_type<int>(_864) + (-2);
    float _878 = 1.0 / _762;
    int _880 = ~_808;
    int _882 = _880 + 1;
    float _884 = float(uint(_870));
    float _886 = trunc(_874);
    float _888 = precise::max(_886, 0.0);
    uint _891 = uint(_888);
    float _893 = as_type<float>(_876) * _884;
    float _895 = trunc(_893);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = _878 * _164;
    int _903 = _816 * int(_891);
    int _905 = _903 + _862;
    float _907 = _893;
    float _909 = as_type<float>(_905);
    if (_766)
    {
        _907 = _146;
    }
    float _911 = _907;
    float _913 = floor(_812);
    float _915 = _911;
    if (!_766)
    {
        _915 = _148;
    }
    float _917 = _915;
    float _919 = float(uint(_905));
    if (_766)
    {
        _909 = 1.0;
    }
    float _921 = _909;
    int _923 = _882 * int(_899);
    int _925 = _923 + _870;
    float _927 = _921;
    if (!_766)
    {
        _927 = 7.345489978790283203125;
    }
    float _929 = _927;
    float _931 = as_type<float>(_866) * _919;
    float _933 = 1.0 / _780;
    float _935 = float(uint(_925));
    float _937 = _929 * _146;
    float _939 = as_type<float>(_876) * _935;
    float _941 = trunc(_931);
    float _943 = precise::max(_941, 0.0);
    uint _945 = uint(_943);
    float _947 = trunc(_939);
    float _949 = precise::max(_947, 0.0);
    uint _951 = uint(_949);
    int _953 = ~_774;
    int _955 = _953 + 1;
    float _957 = floor(_937);
    float _959 = _917 * _790;
    float _961 = float(_774);
    float _963 = float(_862);
    int _965 = int(_891) + int(_945);
    float _967 = floor(_959);
    bool _969 = _963 >= _961;
    bool _971 = isnan(_963);
    bool _973 = _969 || _971;
    bool _975 = isnan(_961);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    int _981 = int(_899) + int(_951);
    float _983 = float(_808);
    float _985 = -_957;
    float _987 = _937 + _985;
    float _989 = float(_870);
    int _991 = _955 * _965;
    int _993 = _991 + _862;
    float _995 = trunc(_979);
    int _997 = int(_995);
    int _999 = _846 * _981;
    int _1001 = _999 + _870;
    bool _1003 = _989 >= _983;
    bool _1005 = isnan(_989);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(_983);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = _961 * _901;
    bool _1017 = uint(_993) >= uint(_774);
    float _1019 = -_967;
    float _1021 = _959 + _1019;
    bool _1023 = uint(_1001) >= uint(_808);
    float _1025 = _961 * _987;
    float _1027 = trunc(_1013);
    int _1029 = int(_1027);
    bool _1031 = !_1017;
    int _1033 = _1031 ? 0 : (-1);
    float _1035 = _983 * _901;
    bool _1037 = !_1023;
    int _1039 = _1037 ? 0 : (-1);
    float _1041 = _983 * _1021;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1045 = _1043 != 0;
    int _1047 = ~_981;
    int _1049 = _1047 + _1039;
    int _1051 = _1049 + 1;
    float _1053 = trunc(_1025);
    int _1055 = int(_1053);
    int _1057 = ~_965;
    int _1059 = _1057 + _1033;
    int _1061 = _1059 + 1;
    bool _1063 = !_1045;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = _808 * _1051;
    int _1069 = _1067 + _870;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1073 = _1071 != 0;
    int _1075 = abs(_1065);
    int _1077 = _774 * _1061;
    int _1079 = _1077 + _862;
    bool _1081 = !_1073;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = trunc(_1015);
    int _1087 = int(_1085);
    int _1089 = ~_1029;
    int _1091 = _1089 + 1;
    int _1093 = _1091 + 1;
    int _1095 = abs(_1083);
    int _1097 = ~_997;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    int _1103 = _1055 * _1075;
    int _1105 = _1103 + _862;
    bool _1107 = !_818;
    int _1109 = _1107 ? _1079 : (-1);
    float _1111 = trunc(_1041);
    int _1113 = int(_1111);
    bool _1115 = !_852;
    int _1117 = _1115 ? _1069 : (-1);
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1121 = _1119 != 0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1125 = _1123 != 0;
    int _1127 = _1101 * _1109;
    int _1129 = _774 + (-1);
    int _1131 = _1093 * _1117;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1135 = _1133 != 0;
    float _1137 = trunc(_1035);
    int _1139 = int(_1137);
    bool _1141 = !_1125;
    int _1143 = _1141 ? 0 : 1;
    int _1145 = _997 * _1129;
    int _1147 = _1145 + _1127;
    bool _1149 = !_1121;
    int _1151 = _1149 ? 0 : 1;
    int _1153 = abs(_1143);
    int _1155 = abs(_1151);
    int _1157 = _1113 * _1095;
    int _1159 = _1157 + _870;
    bool _1161 = !_1135;
    int _1163 = _1161 ? 0 : 1;
    int _1165 = _1147 * _1153;
    float _1167 = 1.0 / _786;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1171 = _1169 != 0;
    int _1173 = abs(_1163);
    int _1175 = _1087 * _1155;
    int _1177 = _1175 + _1165;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1181 = _1179 != 0;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1185 = _1183 != 0;
    float _1187 = 1.0 / _800;
    int _1189 = _808 + (-1);
    bool _1191 = !_1171;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = _1105 * _1173;
    int _1197 = _1195 + _1177;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1201 = _1199 != 0;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1205 = _1203 != 0;
    int _1207 = _1029 * _1189;
    int _1209 = _1207 + _1131;
    bool _1211 = !_1185;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = 1.0 / _804;
    bool _1217 = !_1181;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = abs(_1193);
    int _1223 = abs(_1213);
    bool _1225 = !_1201;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1231 = log2(_1229);
    int _1233 = abs(_1219);
    int _1235 = _1209 * _1223;
    int _1237 = abs(_1227);
    bool _1239 = !_1205;
    int _1241 = _1239 ? 0 : 1;
    int _1243 = _1055 * _1221;
    int _1245 = _1243 + _1197;
    int _1247 = abs(_1241);
    int _1249 = _1139 * _1233;
    int _1251 = _1249 + _1235;
    float _1253 = float(uint(_1245));
    float _1255 = in.m_44.x;
    float _1257 = in.m_44.y;
    float _1259 = in.m_44.z;
    int _1261 = _1159 * _1237;
    int _1263 = _1261 + _1251;
    int _1265 = ~_808;
    int _1267 = _1265 + 1;
    float _1269 = as_type<float>(_866) * _1253;
    int _1271 = ~_774;
    int _1273 = _1271 + 1;
    int _1275 = _1113 * _1247;
    int _1277 = _1275 + _1263;
    int _1279 = ~_774;
    int _1281 = _1279 + 1;
    float _1283 = in.m_69.x;
    float _1285 = in.m_69.y;
    float _1287 = in.m_69.z;
    float _1289 = in.m_69.w;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1293 = _1291 != 0;
    float _1295 = trunc(_1269);
    float _1297 = precise::max(_1295, 0.0);
    uint _1299 = uint(_1297);
    float _1301 = float(uint(_1277));
    bool _1303 = _774 == 0;
    float _1305 = float(uint(_1159));
    float _1307 = as_type<float>(_876) * _1301;
    float _1309 = float(uint(_1105));
    float _1311 = trunc(_1307);
    float _1313 = precise::max(_1311, 0.0);
    uint _1315 = uint(_1313);
    bool _1317 = _1181;
    if (_1293)
    {
        bool _1319 = _146 > 0.5;
        _1317 = _1319;
    }
    bool _1321 = _1317;
    float _1323 = as_type<float>(_866) * _1309;
    float _1325 = 0.0;
    if (!_1293)
    {
        _1325 = _186;
    }
    float _1327 = _1325;
    int _1329 = _1281 * int(_1299);
    int _1331 = _1329 + _1245;
    float _1333 = trunc(_1323);
    float _1335 = precise::max(_1333, 0.0);
    uint _1337 = uint(_1335);
    float _1339 = float(uint(_1331));
    float _1341 = _1257 * _1285;
    float _1343 = as_type<float>(_866) * _1339;
    int _1345 = _1267 * int(_1315);
    int _1347 = _1345 + _1277;
    float _1349 = trunc(_1343);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    float _1355 = float(uint(_1347));
    float _1357 = as_type<float>(_876) * _1355;
    int _1359 = as_type<int>(_1343);
    float _1361 = _1327;
    if (_1293)
    {
        float _1363 = -_186;
        float _1365 = _1363 + 1.0;
        _1359 = as_type<int>(_1365);
    }
    int _1367 = _1359;
    float _1369 = trunc(_1357);
    float _1371 = precise::max(_1369, 0.0);
    uint _1373 = uint(_1371);
    if (_1293)
    {
        float _1375 = _1321 ? as_type<float>(_1367) : _186;
        _1361 = _1375;
    }
    float _1377 = _1361;
    float _1379 = -_190;
    float _1381 = _1379 + 1.0;
    int _1383 = int(_1299) + int(_1353);
    int _1385 = ~_808;
    int _1387 = _1385 + 1;
    bool _1389 = _148 > 0.5;
    int _1391 = _1273 * _1383;
    int _1393 = _1391 + _1245;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1397 = _1395 != 0;
    bool _1399 = uint(_1393) >= uint(_774);
    int _1401 = int(_1315) + int(_1373);
    bool _1403 = !_1399;
    int _1405 = _1403 ? 0 : (-1);
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1409 = _1407 != 0;
    int _1411 = _1387 * _1401;
    int _1413 = _1411 + _1277;
    int _1415 = ~_1383;
    int _1417 = _1415 + _1405;
    int _1419 = _1417 + 1;
    int _1421 = _1389 ? as_type<int>(_1381) : as_type<int>(_190);
    bool _1423 = uint(_1413) >= uint(_808);
    int _1425 = _774 * _1419;
    int _1427 = _1425 + _1245;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1431 = _1429 != 0;
    bool _1433 = !_1423;
    int _1435 = _1433 ? 0 : (-1);
    bool _1437 = !_1303;
    int _1439 = _1437 ? _1427 : (-1);
    int _1441 = ~_1401;
    int _1443 = _1441 + _1435;
    int _1445 = _1443 + 1;
    bool _1447 = _150 > 0.5;
    int _1449 = _1439 & 3;
    int _1451 = _808 * _1445;
    int _1453 = _1451 + _1277;
    float _1455 = _1397 ? as_type<float>(_1421) : _190;
    float _1457 = in.m_71.x;
    float _1459 = in.m_71.y;
    float _1461 = in.m_71.z;
    float _1463 = in.m_71.w;
    bool _1465 = _148 > 0.5;
    bool _1467 = _1465 && _1431;
    if (_1409)
    {
        float _1469 = _1447 ? _1381 : _190;
        _194 = _1469;
    }
    float _1471 = _194;
    bool _1473 = _1449 != 3;
    float _1475 = in.m_73.x;
    float _1477 = in.m_73.y;
    float _1479 = in.m_73.z;
    float _1481 = in.m_73.w;
    bool _1483 = uint(_1449) >= 2u;
    bool _1485 = !_852;
    int _1487 = _1485 ? _1453 : (-1);
    int _1489 = _1483 ? 0 : 1;
    int _1491 = _1487 & 3;
    float _1493 = 0.0;
    if (!_1431)
    {
        _1493 = _186;
    }
    float _1495 = _1493;
    float _1497 = _1495;
    if (_1467)
    {
        float _1499 = -_186;
        float _1501 = _1499 + 1.0;
        _196 = _1501;
    }
    float _1503 = _196;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1507 = _1505 != 0;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1511 = _1509 != 0;
    int _1513 = ~_1489;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    bool _1519 = uint(_1491) >= 2u;
    float _1521 = _1257 * _1459;
    int _1523 = _1517;
    if (_1473)
    {
        int _1525 = ~_1489;
        int _1527 = _1525 + 1;
        _1523 = _1527;
    }
    int _1529 = _1523;
    float _1531 = as_type<float>(_876) * _1305;
    int _1533 = _1519 ? 0 : 1;
    bool _1535 = _1491 != 3;
    float _1537 = _1257 * _1477;
    bool _1539 = uint(_1449) > 1u;
    float _1541 = trunc(_1531);
    float _1543 = precise::max(_1541, 0.0);
    uint _1545 = uint(_1543);
    if (_1431)
    {
        _1497 = _1503;
    }
    float _1547 = _1497;
    float _1549 = _146 * 2.0;
    int _1551 = _1439 & 3;
    bool _1553 = _1551 != 0;
    int _1555 = ~_774;
    int _1557 = _1555 + 1;
    int _1559 = _1553 ? 0 : 1;
    float _1561 = floor(_1549);
    int _1563 = ~_1533;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = _1567;
    if (_1535)
    {
        int _1571 = ~_1533;
        int _1573 = _1571 + 1;
        _1569 = _1573;
    }
    int _1575 = _1569;
    bool _1577 = uint(_1491) > 1u;
    float _1579 = fma(_1255, _1475, _1537);
    int _1581 = ~_1559;
    int _1583 = _1581 + 1;
    int _1585 = _1583 + 1;
    int _1587 = _856 * int(_1545);
    int _1589 = _1587 + _1159;
    int _1591 = _1585;
    if (!_1539)
    {
        int _1593 = ~_1559;
        int _1595 = _1593 + 1;
        _1591 = _1595;
    }
    int _1597 = _1591;
    int _1599 = _1557 * int(_1337);
    int _1601 = _1599 + _1105;
    int _1603 = _1487 & 3;
    bool _1605 = _1603 != 0;
    float _1607 = fma(_1255, _1457, _1521);
    float _1609 = float(uint(_1589));
    float _1611 = _150 * 2.0;
    int _1613 = _1605 ? 0 : 1;
    float _1615 = fma(_1259, _1461, _1607);
    float _1617 = float(uint(_1601));
    float _1619 = fma(_1259, _1479, _1579);
    int _1621 = ~_1613;
    int _1623 = _1621 + 1;
    int _1625 = _1623 + 1;
    float _1627 = floor(_1611);
    int _1629 = _1625;
    if (!_1577)
    {
        int _1631 = ~_1613;
        int _1633 = _1631 + 1;
        _1629 = _1633;
    }
    int _1635 = _1629;
    float _1637 = fma(_1255, _1283, _1341);
    bool _1639 = _1561 >= 0.0;
    bool _1641 = isnan(_1561);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan(0.0);
    bool _1647 = _1643 || _1645;
    float _1649 = as_type<float>(_876) * _1609;
    float _1651 = as_type<float>(_866) * _1617;
    float _1653 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1655 = _1647 ? 0 : 1;
    float _1657 = trunc(_1651);
    float _1659 = precise::max(_1657, 0.0);
    uint _1661 = uint(_1659);
    bool _1663 = _1561 > 0.0;
    float _1665 = fma(_1653, -2.0, _792);
    int _1667 = ~_1655;
    int _1669 = _1667 + 1;
    int _1671 = _1669 + 1;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1673;
    float _1677 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1679 = !_1507;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1687 = trunc(_1649);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1695 = _913 > 0.0;
    float _1697 = fma(_1259, _1287, _1637);
    float _1699 = -_1693;
    float _1701 = fma(_1677, 2.0, _1699);
    int _1703 = _1671;
    if (!_1663)
    {
        int _1705 = ~_1655;
        int _1707 = _1705 + 1;
        _1703 = _1707;
    }
    int _1709 = _1703;
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1713 = _754 + _1711;
    int _1715 = ~_808;
    int _1717 = _1715 + 1;
    float _1719 = 1.0 / _1675;
    bool _1721 = _913 >= 0.0;
    bool _1723 = isnan(_913);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan(0.0);
    bool _1729 = _1725 || _1727;
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1731;
    int _1735 = int(_1337) + int(_1661);
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1739 = _754 + _1737;
    int _1741 = ~_774;
    int _1743 = _1741 + 1;
    float _1745 = _1713 * _933;
    int _1747 = int(_1545) + int(_1691);
    float _1749 = 1.0 / _1685;
    int _1751 = _1743 * _1735;
    int _1753 = _1751 + _1105;
    int _1755 = _1729 ? 0 : 1;
    float _1757 = _1739 * _1167;
    int _1759 = _1717 * _1747;
    int _1761 = _1759 + _1159;
    int _1763 = ~_1755;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    float _1769 = 1.0 / _1733;
    bool _1771 = !_1511;
    int _1773 = _1771 ? 0 : 1;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1777 = uint(_1761) >= uint(_808);
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1781 = _754 + _1779;
    int _1783 = _1767;
    if (!_1695)
    {
        int _1785 = ~_1755;
        int _1787 = _1785 + 1;
        _1783 = _1787;
    }
    int _1789 = _1783;
    float _1791 = _146 + _148;
    bool _1793 = uint(_1753) >= uint(_774);
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1797 = _754 + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1801 = _754 + _1799;
    float _1803 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1775);
    bool _1805 = !_1777;
    int _1807 = _1805 ? 0 : (-1);
    float _1809 = _1791 + (-1.0);
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1813 = _1811 != 0;
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1817 = _1815 != 0;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1821 = _1819 != 0;
    float _1823 = _1781 * _1187;
    bool _1825 = _1627 >= 0.0;
    bool _1827 = isnan(_1627);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan(0.0);
    bool _1833 = _1829 || _1831;
    float _1835 = _1797 * _1215;
    float _1837 = _1801 * _1719;
    float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1841 = _754 + _1839;
    float _1843 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1845 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1803);
    float _1847 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1665);
    float _1849 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1851 = _1841 * _1749;
    int _1853 = _1833 ? 0 : 1;
    float _1855 = -_1847;
    float _1857 = fma(_1845, _1843, _1855);
    bool _1859 = _1627 > 0.0;
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1863 = _754 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1869;
    float _1873 = _1863 * _1769;
    float _1875 = _148 + _150;
    float _1877 = fma(_1867, _1745, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1879 = fma(_1871, _1745, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1881;
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1887 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1885;
    float _1889 = _1875 + (-1.0);
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1895 = fma(_1883, _1823, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1901 = fma(_1887, _1823, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1905 = _1903 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1907 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1909;
    float _1913 = fma(_1893, _1757, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1915;
    float _1919 = fma(_1899, _1757, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _1921 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1923 = isnan(_754);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    float _1933 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1935 = _1933 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1937 = fma(_1911, _1837, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1939 = fma(_1917, _1837, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _1941 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1943 = isnan(_754);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1949 = _1945 || _1947;
    float _1951 = float(_1949);
    float _1953 = fma(_1905, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1955 = fma(_1935, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1957 = -_1931;
    float _1959 = _1957 + 1.0;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1963 = _1961 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1965 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1967 = isnan(_754);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1979 = _1977 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1981 = -_1951;
    float _1983 = _1981 + 1.0;
    float _1985 = _1951 * _1959;
    float _1987 = fma(_1963, _1851, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1989 = fma(_1979, _1851, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _1991 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1993 = isnan(_754);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1999 = _1995 || _1997;
    float _2001 = float(_1999);
    float _2003 = _1975 * _1983;
    float _2005 = -_1975;
    float _2007 = _2005 + 1.0;
    bool _2009 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2011 = isnan(_754);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2017 = _2013 || _2015;
    float _2019 = float(_2017);
    float _2021 = _1697 + _1289;
    bool _2023 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2025 = isnan(_754);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    float _2035 = _2001 * _2007;
    float _2037 = -_2001;
    float _2039 = _2037 + 1.0;
    float _2041 = -_2019;
    float _2043 = _2041 + 1.0;
    float _2045 = -_164;
    float _2047 = fma(_2045, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1701);
    float _2049 = -_2033;
    float _2051 = _2049 + 1.0;
    float _2053 = _2019 * _2039;
    float _2055 = fma(_838, _1873, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2057 = _2033 * _2043;
    float _2059 = fma(_850, _1873, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2061 = _1619 + _1481;
    bool _2063 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2065 = isnan(_754);
    bool _2067 = _2063 || _2065;
    bool _2069 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2071 = _2067 || _2069;
    float _2073 = float(_2071);
    float _2075 = -_834;
    float _2077 = _2075 + 1.0;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2081 = _834 * _2051;
    float _2083 = _1615 + _1463;
    float _2085 = _1231 * _164;
    float _2087 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2079);
    float _2089 = _2073 * _2077;
    float _2091 = -_2073;
    float _2093 = _2091 + 1.0;
    bool _2095 = !_1817;
    int _2097 = _2095 ? 0 : 1;
    float _2099 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2087);
    float _2101 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2103 = _1879 * _2089;
    float _2105 = exp2(_2085);
    float _2107 = _1877 * _2089;
    float _2109 = fma(_2099, _2101, _2047);
    float _2111 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2103);
    int _2113 = ~_1853;
    int _2115 = _2113 + 1;
    int _2117 = _2115 + 1;
    float _2119 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2107);
    int _2121 = _2117;
    if (!_1859)
    {
        int _2123 = ~_1853;
        int _2125 = _2123 + 1;
        _2121 = _2125;
    }
    int _2127 = _2121;
    float _2129 = fma(_1919, _2081, _2111);
    int _2131 = _1439 >> 31;
    float _2133 = fma(_1913, _2081, _2119);
    int _2135 = _1487 >> 31;
    float _2137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2139 = _2131 & 3;
    float _2141 = _1857 + 0.5;
    float _2143 = _2109 + 0.5;
    int _2145 = _2135 & 3;
    float _2147 = -_2105;
    float _2149 = _2147 + 1.0;
    int _2151 = _1439 + _2139;
    float _2153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2155 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2157 = 1.0 + _2155;
    int _2159 = _1487 + _2145;
    float _2161 = fma(_1901, _2057, _2129);
    bool _2163 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2165 = isnan(0.0);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2171 = _2167 || _2169;
    out.m_75.x = _2143;
    out.m_75.y = _2141;
    int _2173 = _2151 >> 2;
    float _2175 = fma(_1955, _2053, _2161);
    float _2177 = 1.0 / _2157;
    int _2179 = _2159 >> 2;
    float _2181 = _2171 ? _2149 : 0.0;
    float _2183 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2185 = _2173 << 4;
    int _2187 = _2185 + 368;
    float _2189 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2191 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2193 = isnan(1.0);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2199 = _2195 || _2197;
    float _2201 = _2183 * _2137;
    int _2203 = _2179 << 4;
    int _2205 = _2203 + 512;
    float _2207 = _2189 * _2153;
    uint _2209 = uint(int(uint(_2187) >> uint(2)));
    uint _2211 = uint(int(uint(int(_2209)) >> uint(2)));
    int _2213 = int(_2209) & 3;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[int(_2211)][_2213];
    int _2217 = int(_2209) + 1;
    uint _2219 = uint(int(uint(_2217) >> uint(2)));
    int _2221 = _2217 & 3;
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[int(_2219)][_2221];
    float _2225 = fma(_1895, _2057, _2133);
    int _2227 = abs(_1597);
    float _2229 = fma(_1939, _2035, _2175);
    out.m_77.x = _2207;
    out.m_77.y = _2201;
    float _2231 = fma(_1953, _2053, _2225);
    float _2233 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2235 = _2083 + _2233;
    int _2237 = ~_1747;
    int _2239 = _2237 + _1807;
    int _2241 = _2239 + 1;
    uint _2243 = uint(int(uint(_2205) >> uint(2)));
    uint _2245 = uint(int(uint(int(_2243)) >> uint(2)));
    int _2247 = int(_2243) & 3;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[int(_2245)][_2247];
    int _2251 = int(_2243) + 1;
    uint _2253 = uint(int(uint(_2251) >> uint(2)));
    int _2255 = _2251 & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    float _2259 = as_type<float>(_2127);
    float _2261 = _2175;
    if (_2199)
    {
        float _2263 = _2181 * _2177;
        _168 = _2263;
    }
    float _2265 = _168;
    int _2267 = abs(_2097);
    float _2269 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2271 = float(_1709);
    int _2273 = _808 * _2241;
    int _2275 = _2273 + _1159;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2279 = _2061 + _2277;
    int _2281 = _2187 + 8;
    uint _2283 = uint(int(uint(_2281) >> uint(2)));
    uint _2285 = uint(int(uint(int(_2283)) >> uint(2)));
    int _2287 = int(_2283) & 3;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[int(_2285)][_2287];
    int _2291 = int(_2283) + 1;
    uint _2293 = uint(int(uint(_2291) >> uint(2)));
    int _2295 = _2291 & 3;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[int(_2293)][_2295];
    float _2299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2301 = _2021 + _2299;
    float _2303 = float(_2267);
    float _2305 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2269);
    bool _2307 = !_1793;
    int _2309 = _2307 ? 0 : (-1);
    float _2311 = fma(_1937, _2035, _2231);
    int _2313 = abs(_1635);
    float _2315 = _2303 * _2271;
    int _2317 = _2205 + 8;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    uint _2321 = uint(int(uint(int(_2319)) >> uint(2)));
    int _2323 = int(_2319) & 3;
    float _2325 = (*spvDescriptorSet0.vp_c9)._m0[int(_2321)][_2323];
    int _2327 = int(_2319) + 1;
    uint _2329 = uint(int(uint(_2327) >> uint(2)));
    int _2331 = _2327 & 3;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[int(_2329)][_2331];
    float _2335 = fma(_2301, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2305);
    bool _2337 = !_1553;
    int _2339 = _2337 ? 0 : 1;
    float _2341 = fma(_1987, _2003, _2311);
    int _2343 = ~_1735;
    int _2345 = _2343 + _2309;
    int _2347 = _2345 + 1;
    float _2349 = fma(_1989, _2003, _2229);
    int _2351 = abs(_2339);
    float _2353 = fma(_2055, _1985, _2341);
    int _2355 = _774 * _2347;
    int _2357 = _2355 + _1105;
    float _2359 = fma(_2059, _1985, _2349);
    int _2361 = ~_2227;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    float _2367 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2353);
    bool _2369 = !_1605;
    int _2371 = _2369 ? 0 : 1;
    float _2373 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2359);
    int _2375 = abs(_1529);
    int _2377 = ~_2351;
    int _2379 = _2377 + 1;
    int _2381 = _2379 + 1;
    int _2383 = abs(_2371);
    out.m_79.x = _2367;
    out.m_79.y = _2373;
    int _2385 = ~_2313;
    int _2387 = _2385 + 1;
    int _2389 = _2387 + 1;
    int _2391 = _2365 * as_type<int>(_2223);
    bool _2393 = _1449 != 3;
    int _2395 = ~_2383;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    int _2401 = _2381 * as_type<int>(_2215);
    int _2403 = _2401 + _2391;
    bool _2405 = !_2393;
    int _2407 = _2405 ? 0 : (-1);
    bool _2409 = _1491 != 3;
    int _2411 = _2389 * as_type<int>(_2257);
    int _2413 = abs(_2407);
    int _2415 = _2399 * as_type<int>(_2249);
    int _2417 = _2415 + _2411;
    bool _2419 = !_2409;
    int _2421 = _2419 ? 0 : (-1);
    int _2423 = abs(_1575);
    int _2425 = abs(_2421);
    int _2427 = ~_2375;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    int _2433 = ~_2423;
    int _2435 = _2433 + 1;
    int _2437 = _2435 + 1;
    int _2439 = _2431 * as_type<int>(_2289);
    int _2441 = _2439 + _2403;
    int _2443 = _2437 * as_type<int>(_2325);
    int _2445 = _2443 + _2417;
    int _2447 = abs(_1773);
    int _2449 = abs(_1681);
    int _2451 = ~_2413;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = ~_2425;
    int _2459 = _2457 + 1;
    int _2461 = _2459 + 1;
    int _2463 = _2455 * as_type<int>(_2297);
    int _2465 = _2463 + _2441;
    int _2467 = ~_2449;
    int _2469 = _2467 + 1;
    int _2471 = _2469 + 1;
    int _2473 = _2461 * as_type<int>(_2333);
    int _2475 = _2473 + _2445;
    int _2477 = ~_2447;
    int _2479 = _2477 + 1;
    int _2481 = _2479 + 1;
    float _2483 = _2235 * _2235;
    bool _2485 = _808 == 0;
    int _2487 = _2471 * _2465;
    bool _2489 = _2335 >= 0.0;
    float _2491 = fma(_2279, _2279, _2483);
    bool _2493 = !_2485;
    int _2495 = _2493 ? _2275 : (-1);
    int _2497 = _2481 * _2475;
    bool _2499 = _774 == 0;
    float _2501 = fma(_2301, _2301, _2491);
    bool _2503 = !_1813;
    int _2505 = _2503 ? 0 : 1;
    int _2507 = _2495 * _2447;
    int _2509 = _2507 + _2497;
    bool _2511 = !_2499;
    int _2513 = _2511 ? _2357 : (-1);
    float _2515 = in.m_81.x;
    float _2517 = in.m_81.y;
    float _2519 = in.m_81.z;
    int _2521 = abs(_2505);
    float _2523 = rsqrt(_2501);
    float _2525 = float(_2509);
    int _2527 = _2513 * _2449;
    int _2529 = _2527 + _2487;
    float _2531 = as_type<float>(_2497);
    float _2533 = _2311;
    float _2535 = _2341;
    if (_2489)
    {
        _2531 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2537 = _2531;
    int _2539 = as_type<int>(_2537);
    if (_2489)
    {
        out.m_47.x = 0.0;
    }
    float _2541 = float(_2127);
    if (_2489)
    {
        float _2543 = _2537 * 5.0;
        _2539 = as_type<int>(_2543);
    }
    int _2545 = _2539;
    float _2547 = float(_2529);
    bool _2549 = !_1821;
    int _2551 = _2549 ? 0 : 1;
    float _2553 = as_type<float>(_2545);
    if (_2489)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7783 = as_type<float>(_2545);
        out.gl_Position.z = _7783;
    }
    float _2555 = float(_2521);
    float _2557 = _2235 * _2523;
    out.m_83.x = _2547;
    out.m_83.y = _2525;
    float _2559 = _2279 * _2523;
    float _2561 = _2557;
    if (_2489)
    {
        return out;
    }
    float _2563 = -_2557;
    float _2565 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2083);
    float _2567 = _2555 * _2541;
    float _2569 = _2301 * _2523;
    float _2571 = -_2559;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2061);
    float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2577 = _2565 + _2575;
    float _2579 = _2567 * (-2.0);
    float _2581 = -_2569;
    float _2583 = fma(_2581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2021);
    float _2585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2587 = _2573 + _2585;
    float _2589 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2591 = fma(_2579, _2515, _2515);
    float _2593 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2595 = _2583 + _2593;
    float _2597 = _146 + (-0.5);
    float _2599 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2589);
    float _2601 = _2315 * (-2.0);
    float _2603 = _148 + (-0.5);
    float _2605 = fma(_2597, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2591);
    float _2607 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2599);
    float _2609 = fma(_2601, _2517, _2517);
    float _2611 = fma(_1849, _2579, _1849);
    float _2613 = fma(_1907, _2601, _1907);
    int _2615 = abs(_2551);
    float _2617 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2609);
    bool _2619 = _2607 >= 0.0;
    float _2621 = fma(_2611, _2265, _2605);
    float _2623 = -_2557;
    float _2625 = fma(_2623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2235);
    float _2627 = fma(_2613, _2265, _2617);
    float _2629 = -_2559;
    float _2631 = fma(_2629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2279);
    float _2633 = _2621 * 0.15915493667125701904296875;
    float _2635 = _2625 * _2625;
    float _2637 = _2627 * 0.15915493667125701904296875;
    float _2639 = _2633 * 6.283185482025146484375;
    float _2641 = sin(_2639);
    float _2643 = float(_1789);
    float _2645 = fma(_2631, _2631, _2635);
    float _2647 = float(_2615);
    float _2649 = -_2569;
    float _2651 = fma(_2649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2301);
    float _2653 = _2569;
    if (_2619)
    {
        _2553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2655 = _2553;
    int _2657 = as_type<int>(_2655);
    if (_2619)
    {
        out.m_47.x = 0.0;
    }
    float _2659 = _2633 * 6.283185482025146484375;
    float _2661 = cos(_2659);
    float _2663 = _2647 * _2643;
    if (_2619)
    {
        float _2665 = _2655 * 5.0;
        _2657 = as_type<int>(_2665);
    }
    int _2667 = _2657;
    float _2669 = fma(_2651, _2651, _2645);
    if (_2619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7988 = as_type<float>(_2667);
        out.gl_Position.z = _7988;
    }
    float _2671 = _2637 * 6.283185482025146484375;
    float _2673 = sin(_2671);
    if (_2619)
    {
        return out;
    }
    float _2675 = -_2083;
    float _2677 = _2675 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2679 = -_2061;
    float _2681 = _2679 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2683 = _146 + _150;
    float _2685 = -_2021;
    float _2687 = _2685 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2689 = _2677 * _2677;
    float _2691 = _2683 + (-1.0);
    float _2693 = _2663 * (-2.0);
    float _2695 = fma(_2681, _2681, _2689);
    float _2697 = _150 + (-0.5);
    float _2699 = fma(_2691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2701 = sqrt(_2669);
    float _2703 = fma(_2687, _2687, _2695);
    float _2705 = fma(_2693, _2519, _2519);
    float _2707 = fma(_2699, _2693, _2699);
    float _2709 = _2641 * _2673;
    float _2711 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2713 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2705);
    float _2715 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2717 = rsqrt(_2703);
    float _2719 = _2661 * _2673;
    float _2721 = fma(_2707, _2265, _2713);
    bool _2723 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2725 = isnan(0.5);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2731 = _2727 || _2729;
    float _2733 = _2721 * 0.15915493667125701904296875;
    bool _2735 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2737 = isnan(0.5);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2743 = _2739 || _2741;
    float _2745 = _2637 * 6.283185482025146484375;
    float _2747 = cos(_2745);
    float _2749 = _2523 * _2701;
    float _2751 = _2749 * _2711;
    float _2753 = _2749 * _2715;
    float _2755 = _2733 * 6.283185482025146484375;
    float _2757 = sin(_2755);
    float _2759 = _2681 * _2717;
    float _2761 = _2687 * _2717;
    float _2763 = in.m_85.x;
    float _2765 = in.m_85.y;
    float _2767 = in.m_85.z;
    float _2769 = _2677 * _2717;
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2773 = _2759 * _2771;
    float _2775 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2777 = _2761 * _2775;
    float _2779 = _2661 * _2747;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2783 = -_2773;
    float _2785 = fma(_2761, _2781, _2783);
    float _2787 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2789 = -_2777;
    float _2791 = fma(_2769, _2787, _2789);
    float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2795 = _2769 * _2793;
    float _2797 = _2733 * 6.283185482025146484375;
    float _2799 = cos(_2797);
    float _2801 = _2785 * _2785;
    float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2805 = -_2795;
    float _2807 = fma(_2759, _2803, _2805);
    float _2809 = fma(_2757, _2779, _2709);
    float _2811 = fma(_2757, _2709, _2779);
    float _2813 = fma(_2791, _2791, _2801);
    float _2815 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2817 = fma(_2807, _2807, _2813);
    float _2819 = _2641 * _2747;
    float _2821 = _2749 * _2815;
    float _2823 = rsqrt(_2817);
    float _2825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2765);
    float _2827 = _2661 * _2799;
    float _2829 = -_2719;
    float _2831 = fma(_2757, _2819, _2829);
    float _2833 = _2747 * _2799;
    float _2835 = _2825 * _2751;
    float _2837 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2763);
    float _2839 = _2641 * _2799;
    float _2841 = _2673 * _2799;
    float _2843 = -_2819;
    float _2845 = fma(_2757, _2719, _2843);
    float _2847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2767);
    float _2849 = _2837 * _2821;
    float _2851 = _2827 * _2835;
    float _2853 = _2839 * _2835;
    float _2855 = _2847 * _2753;
    float _2857 = -_2835;
    float _2859 = _2757 * _2857;
    float _2861 = _2791 * _2823;
    float _2863 = fma(_2809, _2849, _2851);
    float _2865 = _2785 * _2823;
    float _2867 = _2807 * _2823;
    float _2869 = _2769 * _2861;
    float _2871 = fma(_2845, _2855, _2863);
    float _2873 = fma(_2833, _2849, _2859);
    float _2875 = _2761 * _2865;
    float _2877 = -_2869;
    float _2879 = fma(_2759, _2865, _2877);
    float _2881 = fma(_2831, _2849, _2853);
    float _2883 = fma(_2841, _2855, _2873);
    float _2885 = -_2875;
    float _2887 = fma(_2769, _2867, _2885);
    float _2889 = _2879 * _2871;
    float _2891 = fma(_2811, _2855, _2881);
    float _2893 = _2759 * _2867;
    float _2895 = _2887 * _2871;
    float _2897 = fma(_2867, _2883, _2889);
    float _2899 = _2565 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2901 = -_2893;
    float _2903 = fma(_2761, _2861, _2901);
    float _2905 = fma(_2861, _2883, _2895);
    float _2907 = fma(_2761, _2891, _2897);
    float _2909 = fma(_2759, _2891, _2905);
    float _2911 = _2021 + _2907;
    float _2913 = _2061 + _2909;
    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2917 = _2911 + _2915;
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2921 = _2913 + _2919;
    float _2923 = _2917 * _2917;
    float _2925 = fma(_2921, _2921, _2923);
    float _2927 = _2565 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2929 = sqrt(_2925);
    float _2931 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2927);
    float _2933 = _2903 * _2871;
    float _2935 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2931);
    float _2937 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2899);
    float _2939 = fma(_2865, _2883, _2933);
    float _2941 = _2935 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2943 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2937);
    float _2945 = fma(_2769, _2891, _2939);
    float _2947 = 1.0 / _2941;
    float _2949 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2951 = _2083 + _2945;
    bool _2953 = _2929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2955 = _2949 + _2941;
    float _2957 = _2883;
    float _2959 = _2949;
    float _2961 = _2939;
    if (!_2953)
    {
        _2957 = _2913;
    }
    float _2963 = _2957;
    float _2965 = _2963;
    if (!_2953)
    {
        _2959 = _2911;
    }
    float _2967 = _2959;
    float _2969 = _2967;
    if (!_2953)
    {
        _2961 = _2951;
    }
    float _2971 = _2961;
    bool _2973 = !_2953;
    float _2975 = _2971;
    if (!_2973)
    {
        float _2977 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2981 = _2929 + _2979;
        float _2983 = rsqrt(_2925);
        float _2985 = _2981 * _2977;
        float _2987 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2989 = _2985 * 0.15915493667125701904296875;
        float _2991 = _2989 * 6.283185482025146484375;
        float _2993 = cos(_2991);
        float _2995 = _2989 * 6.283185482025146484375;
        float _2997 = sin(_2995);
        float _2999 = _2993 + (-1.0);
        float _3001 = fma(_2997, _2987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3003 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3005 = _2983 * _3001;
        float _3007 = fma(_2951, _2993, _3003);
        float _3009 = fma(_2921, _3005, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3011 = fma(_2917, _3005, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2975 = _3007;
        _2969 = _3011;
        _2965 = _3009;
    }
    float _3013 = _2975;
    float _3015 = _2969;
    float _3017 = _2965;
    float _3019 = -_2557;
    float _3021 = fma(_3019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3013);
    float _3023 = -_2569;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3015);
    float _3027 = -_2559;
    float _3029 = fma(_3027, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3017);
    float _3031 = _2955 * _2947;
    float _3033 = _3031 * 0.5;
    float _3035 = _3029;
    float _3037 = _3025;
    float _3039 = _3013;
    if (_2743)
    {
        _2561 = 1.0;
    }
    float _3041 = _2561;
    float _3043 = _3041;
    if (_2731)
    {
        _2653 = _3021;
    }
    float _3045 = _2653;
    float _3047 = _3045;
    if (!_2731)
    {
        float _3049 = _2577 * _2577;
        float _3051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3053 = -_2061;
        float _3055 = _3053 + _3017;
        float _3057 = -_2021;
        float _3059 = _3057 + _3015;
        float _3061 = fma(_2587, _2587, _3049);
        float _3063 = fma(_2595, _2595, _3061);
        float _3065 = 1.0 / _2749;
        float _3067 = sqrt(_3063);
        float _3069 = precise::min(_3067, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3071 = _3069 * _3051;
        float _3073 = -_2083;
        float _3075 = _3073 + _3013;
        float _3077 = _3071 * _3065;
        float _3079 = fma(_3055, _3077, _2573);
        float _3081 = fma(_3075, _3077, _2565);
        float _3083 = fma(_3059, _3077, _2583);
        _3047 = _3081;
        _3035 = _3079;
        _3037 = _3083;
    }
    float _3085 = _3047;
    float _3087 = _3035;
    float _3089 = _3037;
    if (!_2743)
    {
        float _3091 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3093 = _3091 * 0.15915493667125701904296875;
        float _3095 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3099 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3097);
        float _3101 = _3093 * 6.283185482025146484375;
        float _3103 = cos(_3101);
        float _3105 = _3095 * 0.15915493667125701904296875;
        float _3107 = _3093 * 6.283185482025146484375;
        float _3109 = sin(_3107);
        float _3111 = 1.0 / _3103;
        float _3113 = _3105 * 6.283185482025146484375;
        float _3115 = cos(_3113);
        float _3117 = _3109 * _3111;
        float _3119 = _3105 * 6.283185482025146484375;
        float _3121 = sin(_3119);
        float _3123 = _3115 * _3117;
        float _3125 = 1.0 / _3099;
        float _3127 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3129 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3127;
        float _3131 = 1.0 / _3123;
        float _3133 = 1.0 / _3129;
        float _3135 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3137 = _3125 * _3135;
        float _3139 = _3121 * _3131;
        float _3141 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3143 = fma(_3139, _3137, _3141);
        float _3145 = _3143 * _3133;
        float _3147 = precise::clamp(_3145, 0.0, 1.0);
        _3039 = _3133;
        _3043 = _3147;
    }
    float _3149 = _3039;
    float _3151 = _3043;
    float _3153 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3155 = _3085 + _3153;
    float _3157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3159 = _3087 + _3157;
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3163 = _3089 + _3161;
    float _3165 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3167 = _3155 * _3155;
    float _3169 = fma(_3159, _3159, _3167);
    float _3171 = fma(_3163, _3163, _3169);
    float _3173 = rsqrt(_3171);
    float _3175 = sqrt(_3171);
    float _3177 = _3173 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3179 = _3159 * _3177;
    float _3181 = _3163 * _3177;
    float _3183 = _3179 * _3179;
    float _3185 = _3181 * _3181;
    float _3187 = _3183 + _3185;
    float _3189 = sqrt(_3187);
    bool _3191 = _3189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3195 = _3189 + _3193;
    float _3197 = _3163;
    float _3199 = _3187;
    float _3201 = _3195;
    float _3203 = _3149;
    float _3205 = _3177;
    if (_3191)
    {
        float _3207 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3197 = _3207;
    }
    float _3209 = _3197;
    if (_3191)
    {
        float _3211 = rsqrt(_3187);
        _3199 = _3211;
    }
    float _3213 = _3199;
    float _3215 = _3213;
    if (_3191)
    {
        float _3217 = _3195 * _3209;
        _3201 = _3217;
    }
    float _3219 = _3201;
    if (_3191)
    {
        float _3221 = _3219 * 0.15915493667125701904296875;
        _3203 = _3221;
    }
    float _3223 = _3203;
    float _3225 = _3209;
    float _3227 = _3223;
    if (_3191)
    {
        float _3229 = _3223 * 6.283185482025146484375;
        float _3231 = sin(_3229);
        _3225 = _3231;
    }
    float _3233 = _3225;
    float _3235 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3237 = precise::max(0.0, _3235);
    float _3239 = _3167;
    float _3241 = _3237;
    if (_3191)
    {
        float _3243 = _3223 * 6.283185482025146484375;
        float _3245 = cos(_3243);
        _3239 = _3245;
    }
    float _3247 = _3239;
    float _3249 = -_3177;
    float _3251 = -_3237;
    float _3253 = fma(_3155, _3249, _3251);
    float _3255 = _3253;
    if (_3191)
    {
        float _3257 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3241 = _3257;
    }
    float _3259 = _3241;
    float _3261 = _3233;
    float _3263 = _3259;
    if (_3191)
    {
        float _3265 = fma(_3233, _3259, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3261 = _3265;
    }
    float _3267 = _3261;
    float _3269 = _3267;
    float _3271 = _3247;
    if (_3191)
    {
        float _3273 = _3247 + (-1.0);
        _3263 = _3273;
    }
    float _3275 = _3263;
    float _3277 = _3275;
    if (_3191)
    {
        float _3279 = _3213 * _3267;
        _3205 = _3279;
    }
    float _3281 = _3205;
    if (!_3191)
    {
        _3269 = _3179;
    }
    float _3283 = _3269;
    float _3285 = _3283;
    if (_3191)
    {
        float _3287 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3227 = _3287;
    }
    float _3289 = _3227;
    if (_3191)
    {
        float _3291 = _3179 * _3281;
        _3285 = _3291;
    }
    float _3293 = _3285;
    if (!_3191)
    {
        _3277 = _3181;
    }
    float _3295 = _3277;
    float _3297 = _3295;
    if (_3191)
    {
        float _3299 = _3181 * _3281;
        _3297 = _3299;
    }
    float _3301 = _3297;
    if (!_3191)
    {
        _3215 = _3183;
    }
    float _3303 = _3215;
    float _3305 = _3303;
    if (_3191)
    {
        float _3307 = fma(_3253, _3247, _3289);
        _3255 = _3307;
    }
    float _3309 = _3255;
    if (_3191)
    {
        float _3311 = _3293 * _3293;
        _3305 = _3311;
    }
    float _3313 = _3305;
    if (!_3191)
    {
        _3271 = _3185;
    }
    float _3315 = _3271;
    float _3317 = _3315;
    if (_3191)
    {
        float _3319 = _3301 * _3301;
        _3317 = _3319;
    }
    float _3321 = _3317;
    float _3323 = fma(_3309, _3309, _3313);
    float _3325 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3327 = _3323 + _3321;
    float _3329 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3325);
    float _3331 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3335 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3333);
    float _3337 = precise::clamp(_3335, 0.0, 1.0);
    float _3339 = rsqrt(_3327);
    float _3341 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3329);
    float _3343 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3345 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3331);
    float _3347 = -_3337;
    float _3349 = _3347 + 1.0;
    float _3351 = _3341 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3353 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3343);
    float _3355 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3345);
    float _3357 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3359 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3361 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3353);
    float _3363 = _3355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3365 = abs(_3349);
    float _3367 = log2(_3365);
    float _3369 = -_3359;
    float _3371 = fma(_3369, _3165, 1.0);
    float _3373 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3357);
    float _3375 = _3361 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3377 = _3339 * _3293;
    float _3379 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3381 = _3339 * _3309;
    float _3383 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3373);
    float _3385 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3387 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3379);
    float _3389 = _3339 * _3301;
    float _3391 = _3383 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3393 = -_3385;
    float _3395 = fma(_3381, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3393);
    float _3397 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3387);
    float _3399 = log2(_3371);
    float _3401 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3403 = -_3389;
    float _3405 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3395);
    float _3407 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3397);
    float _3409 = _3367 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3411 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3413 = fma(_3405, -0.5, 0.5);
    float _3415 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3401);
    float _3417 = 1.0 / _3407;
    float _3419 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3411);
    float _3421 = fma(_3405, 0.5, 0.5);
    float _3423 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3415);
    float _3425 = _3381 + 1.0;
    float _3427 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3419);
    float _3429 = fma(_3421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3431 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3423);
    float _3433 = exp2(_3409);
    float _3435 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3427);
    float _3437 = fma(_3421, _3429, -0.212114393711090087890625);
    float _3439 = _3399 * 0.693147182464599609375;
    float _3441 = fma(_3421, _3437, 1.570728778839111328125);
    float _3443 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3445 = sqrt(_3413);
    float _3447 = _3435 * _3417;
    float _3449 = _3431 * _3417;
    float _3451 = fma(_3447, 0.5, 0.5);
    float _3453 = fma(_3449, -0.5, 0.5);
    float _3455 = -_3381;
    float _3457 = fma(_3433, _3425, _3455);
    float3 _9241 = float3(_3451, _3453, _3443);
    float _3459 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9241, float3(0.0), isnan(_9241)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9241, float3(0.0), isnan(_9241)), level(0.0)).x;
    float3 _9252 = float3(_3451, _3453, _3443);
    float4 _3462 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9252, float3(0.0), isnan(_9252)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9252, float3(0.0), isnan(_9252)), level(0.0)).xyzw;
    float _3464 = _3462.x;
    float _3466 = _3462.y;
    float _3468 = _3462.z;
    float _3470 = _3462.w;
    float _3472 = fma(_3457, 0.5, 0.5);
    float _3474 = _3445 * 0.636619746685028076171875;
    float _3476 = -_3441;
    float _3478 = fma(_3474, _3476, 1.0);
    float2 _9279 = float2(_3478, _3472);
    float3 _3482 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9279, float2(0.0), isnan(_9279)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9279, float2(0.0), isnan(_9279)), level(0.0)).xyz;
    float _3484 = _3482.x;
    float _3486 = _3482.y;
    float _3488 = _3482.z;
    float _3490 = in.m_87.x;
    float _3492 = in.m_87.y;
    float _3494 = in.m_87.z;
    bool _3496 = _2765 != 0.0;
    bool _3498 = isnan(_2765);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan(0.0);
    bool _3504 = _3500 || _3502;
    float _3506 = _3367 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3508 = in.m_89.x;
    float _3510 = in.m_89.y;
    float _3512 = in.m_89.z;
    float _3514 = in.m_89.w;
    bool _3516 = _2763 == 0.0;
    bool _3518 = !_3504;
    bool _3520 = _3516 && _3518;
    float _3522 = _2845 * _2903;
    float _3524 = exp2(_3506);
    bool _3526 = _2767 == 0.0;
    bool _3528 = _3526 && _3520;
    float _3530 = _3490;
    float _3532 = _3494;
    float _3534 = _3407;
    float _3536 = _3435;
    float _3538 = _3431;
    if (_3528)
    {
        _2259 = _3490;
    }
    float _3540 = _2259;
    float _3542 = -_3524;
    float _3544 = _3542 + 1.0;
    float _3546 = _3540;
    if (_3528)
    {
        _2533 = _3494;
    }
    float _3548 = _2533;
    float _3550 = _3548;
    if (_3528)
    {
        _2261 = _3492;
    }
    float _3552 = _2261;
    float _3554 = _3552;
    if (_3528)
    {
        _2535 = _3540;
    }
    float _3556 = _2535;
    float _3558 = _3556;
    if (!_3528)
    {
        _3546 = _3490;
    }
    float _3560 = _3546;
    if (_3528)
    {
        _3530 = _3548;
    }
    float _3562 = _3530;
    float _3564 = _3562;
    if (!_3528)
    {
        _3550 = _3494;
    }
    float _3566 = _3550;
    if (!_3528)
    {
        float _3568 = fma(_2763, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3560);
        _3558 = _3568;
    }
    float _3570 = _3558;
    if (_3528)
    {
        _3532 = _3552;
    }
    float _3572 = _3532;
    float _3574 = _3512 * _3560;
    float _3576 = _3572;
    if (!_3528)
    {
        _3554 = _3492;
    }
    float _3578 = _3554;
    float _3580 = _3510 * _3566;
    if (!_3528)
    {
        float _3582 = fma(_2767, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3566);
        _3564 = _3582;
    }
    float _3584 = _3564;
    float _3586 = -_3574;
    float _3588 = fma(_3508, _3566, _3586);
    float _3590 = _2827 * _2879;
    float _3592 = _3508 * _3578;
    if (!_3528)
    {
        float _3594 = fma(_2765, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3578);
        _3576 = _3594;
    }
    float _3596 = _3576;
    float _3598 = -_3580;
    float _3600 = fma(_3512, _3578, _3598);
    float _3602 = _2809 * _2887;
    float _3604 = -_3592;
    float _3606 = fma(_3510, _3560, _3604);
    float _3608 = _3588 * _3514;
    float _3610 = _3600 * _3514;
    float _3612 = _2809 * _2903;
    float _3614 = _3606 * _3514;
    float _3616 = _2809 * _2879;
    float _3618 = _2827 * _2887;
    float _3620 = _2827 * _2903;
    float _3622 = _2845 * _2887;
    float _3624 = fma(_2833, _2861, _3602);
    float _3626 = _2845 * _2879;
    float _3628 = fma(_2833, _2865, _3612);
    float _3630 = fma(_2833, _2867, _3616);
    float _3632 = -_2757;
    float _3634 = fma(_3632, _2861, _3618);
    float _3636 = -_2757;
    float _3638 = fma(_3636, _2865, _3620);
    float _3640 = -_2757;
    float _3642 = fma(_3640, _2867, _3590);
    float _3644 = fma(_2841, _2861, _3622);
    float _3646 = fma(_2841, _2865, _3522);
    float _3648 = fma(_2841, _2867, _3626);
    float _3650 = fma(_2839, _2759, _3634);
    float _3652 = fma(_2839, _2769, _3638);
    float _3654 = fma(_2839, _2761, _3642);
    float _3656 = fma(_2831, _2759, _3624);
    float _3658 = fma(_2831, _2769, _3628);
    float _3660 = fma(_2831, _2761, _3630);
    float _3662 = fma(_2811, _2761, _3648);
    float _3664 = _3650 * _3510;
    float _3666 = _3652 * _3510;
    float _3668 = _3654 * _3510;
    float _3670 = _3650 * _3596;
    float _3672 = fma(_2811, _2759, _3644);
    float _3674 = _3652 * _3596;
    float _3676 = fma(_2811, _2769, _3646);
    float _3678 = fma(_3656, _3570, _3670);
    float _3680 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3682 = _3608 * _3650;
    float _3684 = _3608 * _3652;
    float _3686 = _3654 * _3596;
    float _3688 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3680);
    float _3690 = _3608 * _3654;
    float _3692 = fma(_3658, _3570, _3674);
    float _3694 = fma(_3656, _3508, _3664);
    float _3696 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3688);
    float _3698 = _3544 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3700 = fma(_3658, _3508, _3666);
    float _3702 = fma(_3610, _3656, _3682);
    float _3704 = fma(_3610, _3658, _3684);
    float _3706 = fma(_3660, _3508, _3668);
    float _3708 = fma(_3610, _3660, _3690);
    float _3710 = fma(_3660, _3570, _3686);
    float _3712 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3696);
    float _3714 = fma(_3672, _3512, _3694);
    float _3716 = fma(_3676, _3512, _3700);
    float _3718 = fma(_3614, _3672, _3702);
    float _3720 = fma(_3614, _3676, _3704);
    float _3722 = fma(_3662, _3512, _3706);
    float _3724 = fma(_3614, _3662, _3708);
    float _3726 = fma(_3672, _3584, _3678);
    float _3728 = fma(_3676, _3584, _3692);
    float _3730 = fma(_3662, _3584, _3710);
    float _3732 = _3712 + _3407;
    float _3734 = _3435 + _3407;
    float _3736 = _3407 * 0.5;
    float _3738 = -_3698;
    float _3740 = _3738 + 1.0;
    out.m_91.x = _3714;
    out.m_91.y = _3716;
    out.m_91.z = _3722;
    float _3742 = _3732 * 0.5;
    float _3744 = _3734 * 0.5;
    float _3746 = fma(_3431, -0.5, _3736);
    out.m_93.x = _3726;
    out.m_93.y = _3728;
    out.m_93.z = _3730;
    bool _3748 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3750 = isnan(_3175);
    bool _3752 = _3748 || _3750;
    bool _3754 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3756 = _3752 || _3754;
    out.m_95.x = _3744;
    out.m_95.y = _3746;
    out.m_95.z = _3742;
    out.m_95.w = _3407;
    out.m_97.x = _3718;
    out.m_97.y = _3720;
    out.m_97.z = _3724;
    out.gl_Position.x = _3435;
    out.gl_Position.y = _3431;
    out.gl_Position.z = _3712;
    out.gl_Position.w = _3407;
    float _3758 = _3724;
    float _3760 = _3720;
    float _3762 = _3718;
    if (!_3756)
    {
        _3758 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3764 = _3758;
    float _3766 = _3764;
    float _3768 = _3764;
    if (!_3756)
    {
        _3760 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3770 = _3760;
    float _3772 = _3770;
    float _3774 = _3770;
    if (!_3756)
    {
        _3762 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3776 = _3762;
    float _3778 = _3776;
    float _3780 = _3776;
    if (!_3756)
    {
        _3534 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3782 = _3534;
    float _3784 = _3782;
    float _3786 = _3782;
    if (!_3756)
    {
        _3536 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3788 = _3536;
    float _3790 = _3788;
    float _3792 = _3788;
    if (!_3756)
    {
        _3538 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3794 = _3538;
    float _3796 = _3698 * _3459;
    float _3798 = _3470 * _3740;
    float _3800 = _3470 * _3796;
    float _3802 = _3488 * _3796;
    float _3804 = fma(_3484, _3800, _3464);
    float _3806 = fma(_3486, _3800, _3466);
    float _3808 = _3151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3810 = fma(_3470, _3802, _3468);
    out.m_99.x = _3804;
    out.m_99.y = _3806;
    out.m_99.z = _3810;
    out.m_99.w = _3798;
    bool _3812 = !_3756;
    float _3814 = _3794;
    float _3816 = _3794;
    if (!_3812)
    {
        bool _3818 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3820 = isnan(_3175);
        bool _3822 = _3818 || _3820;
        bool _3824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3826 = _3822 || _3824;
        if (!_3826)
        {
            float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3830 = _3175 + _3828;
            float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3834 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3832;
            float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3840 = 1.0 / _3834;
            float _3842 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3844 = _3842 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3848 = _3846 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3850 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3852 = _3850 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3854 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3856 = _3854 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3858 = _3830 * _3840;
            float _3860 = precise::clamp(_3858, 0.0, 1.0);
            float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3866 = fma(_3860, _3838, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3868 = fma(_3860, _3864, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3870 = fma(_3860, _3844, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3872 = fma(_3860, _3848, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3874 = fma(_3860, _3852, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3876 = fma(_3860, _3856, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3792 = _3870;
            _3774 = _3874;
            _3786 = _3866;
            _3768 = _3872;
            _3816 = _3868;
            _3780 = _3876;
            _3878 = true;
        }
        else
        {
            bool _3880 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3882 = isnan(_3175);
            bool _3884 = _3880 || _3882;
            bool _3886 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3888 = _3884 || _3886;
            if (!_3888)
            {
                _3784 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3890 = _3784;
            _3786 = _3890;
            if (!_3888)
            {
                _3790 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3892 = _3790;
            _3792 = _3892;
            if (!_3888)
            {
                _3814 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3894 = _3814;
            _3816 = _3894;
            if (!_3888)
            {
                _3766 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3896 = _3766;
            _3768 = _3896;
            if (!_3888)
            {
                _3772 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3898 = _3772;
            _3774 = _3898;
            if (!_3888)
            {
                _3778 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3900 = _3778;
            bool _3902 = !_3888;
            _3780 = _3900;
            if (!_3902)
            {
                bool _3904 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3906 = isnan(_3175);
                bool _3908 = _3904 || _3906;
                bool _3910 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3912 = _3908 || _3910;
                if (!_3912)
                {
                    float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3916 = _3175 + _3914;
                    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3920 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3918;
                    float _3922 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3924 = _3922 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3926 = 1.0 / _3920;
                    float _3928 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3930 = _3928 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3932 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3934 = _3932 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3938 = _3936 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3940 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3942 = _3940 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3944 = _3916 * _3926;
                    float _3946 = precise::clamp(_3944, 0.0, 1.0);
                    float _3948 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3950 = _3948 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3952 = fma(_3946, _3924, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3954 = fma(_3946, _3950, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3956 = fma(_3946, _3930, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3958 = fma(_3946, _3934, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3960 = fma(_3946, _3938, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3962 = fma(_3946, _3942, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3792 = _3956;
                    _3774 = _3960;
                    _3786 = _3952;
                    _3768 = _3958;
                    _3816 = _3954;
                    _3780 = _3962;
                    _3878 = true;
                }
                else
                {
                    _3792 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3774 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3786 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3768 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3816 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3780 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3878 = false;
    float _3964 = _3792;
    float _3966 = _3774;
    float _3968 = _3786;
    float _3970 = _3768;
    float _3972 = _3816;
    float _3974 = _3780;
    float _3976 = fma(_3728, -0.5, 0.5);
    float _3978 = precise::clamp(_3976, 0.0, 1.0);
    float _3980 = -_3964;
    float _3982 = _3980 + _3966;
    float _3984 = -_3968;
    float _3986 = _3984 + _3970;
    out.m_101.x = 0.0;
    float _3988 = fma(_3978, _3982, _3964);
    float _3990 = -_3972;
    float _3992 = _3990 + _3974;
    float _3994 = fma(_3978, _3986, _3968);
    float _3996 = _3988 * 0.586610972881317138671875;
    bool _3998 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4000 = fma(_3978, _3992, _3972);
    float _4002 = _3808 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4004 = fma(_3994, 0.298911988735198974609375, _3996);
    bool _4006 = _3151 > 0.0;
    bool _4008 = isnan(_3151);
    bool _4010 = _4006 || _4008;
    bool _4012 = isnan(0.0);
    bool _4014 = _4010 || _4012;
    float _4016 = fma(_4000, 0.114477999508380889892578125, _4004);
    out.m_47.x = _4002;
    float _4018 = -_4016;
    float _4020 = _3994 + _4018;
    float _4022 = -_4016;
    float _4024 = _3988 + _4022;
    float _4026 = -_4016;
    float _4028 = _4000 + _4026;
    float _4030 = fma(_4020, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4016);
    float _4032 = fma(_4024, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4016);
    float _4034 = fma(_4028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4016);
    bool _4036 = !_3998;
    if (!_4036)
    {
        float _4038 = -_3085;
        float _4040 = _4038 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4042 = -_3087;
        float _4044 = _4042 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4046 = -_3089;
        float _4048 = _4046 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4050 = _4040 * _4040;
        float _4052 = fma(_4044, _4044, _4050);
        float _4054 = fma(_4048, _4048, _4052);
        float _4056 = sqrt(_4054);
        float _4058 = rsqrt(_4054);
        float _4060 = -_4056;
        float _4062 = _4060 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4064 = _4062 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4066 = precise::clamp(_4064, 0.0, 1.0);
        float _4068 = _4044 * _4058;
        float _4070 = _4040 * _4058;
        float _4072 = abs(_4066);
        float _4074 = log2(_4072);
        float _4076 = _4048 * _4058;
        float _4078 = _4068 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4080 = _3728 * _4070;
        float _4082 = -_4070;
        float _4084 = -_4078;
        float _4086 = fma(_4082, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4084);
        float _4088 = fma(_3726, _4068, _4080);
        float _4090 = -_4076;
        float _4092 = fma(_4090, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4086);
        float _4094 = fma(_3730, _4076, _4088);
        float _4096 = precise::clamp(_4094, 0.0, 1.0);
        float _4098 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4100 = _4092 + _4098;
        float _4102 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4104 = _4100 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4106 = precise::clamp(_4104, 0.0, 1.0);
        float _4108 = exp2(_4102);
        float _4110 = _4108 * _4106;
        float _4112 = _4096 * _4110;
        float _4114 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4116 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4118 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _4114;
        out.m_101.y = _4116;
        out.m_101.z = _4118;
    }
    out.m_103.x = _4030;
    out.m_103.y = _4032;
    out.m_103.z = _4034;
    if (_4014)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4120 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4120;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3878 = false;
    bool _746 = false;
    bool _542 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_44.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_122);
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    float _134 = _132;
    if (!_126)
    {
        out.m_47.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4179 = as_type<float>(_140);
        out.gl_Position.z = _4179;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.w;
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    bool _152 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_144);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_144;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _146;
    out.m_53.y = _148;
    out.m_53.z = _150;
    float _166 = 0.0;
    float _168 = _164;
    if (_160)
    {
        float _170 = float(_122);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    if (_178)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _134;
    if (_178)
    {
        out.m_47.x = 0.0;
    }
    if (_178)
    {
        float _182 = _180 * 5.0;
        _142 = as_type<int>(_182);
    }
    int _184 = _142;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4260 = as_type<float>(_184);
        out.gl_Position.z = _4260;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _186 = in.m_55.x;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = in.m_55.y;
    out.m_57.x = _186;
    out.m_57.y = _190;
    bool _192 = !_188;
    float _194 = _190;
    float _196 = _186;
    float _212;
    if (!_192)
    {
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        float _216 = float(_122);
        float _218 = 1.0 / _216;
        float _220 = _164 * _218;
        _212 = _220;
    }
    _214 = false;
    float _222 = _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _222 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = 1.0 / _230;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _246;
    float _250 = 1.0 / _238;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _222 + _252;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _234;
    float _260 = _254 * _244;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _222 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    float _270 = fma(_268, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = 1.0 / _242;
    float _274 = _264 * _250;
    bool _276 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _278 = isnan(_222);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _290 = _222 + _288;
    bool _292 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_222);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _248;
    float _306 = _226 * _258;
    bool _308 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _310 = isnan(_222);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_302;
    float _322 = _320 + 1.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = _222 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = _290 * _272;
    float _334 = -_286;
    float _336 = _334 + 1.0;
    bool _338 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_222);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = fma(_330, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = _302 * _336;
    float _354 = _318 * _322;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    bool _360 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _362 = isnan(_222);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -_348;
    float _374 = _372 + 1.0;
    float _376 = _326 * _304;
    float _378 = fma(_358, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _380 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_222);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _370 * _374;
    float _394 = -_370;
    float _396 = _394 + 1.0;
    float _398 = -_318;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = _390 * _396;
    float _408 = _348 * _400;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = _350 * _406;
    float _420 = -_390;
    float _422 = _420 + 1.0;
    float _424 = _378 * _406;
    float _426 = _270 * _406;
    float _428 = fma(_404, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_412, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_416, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].x, _418);
    float _440 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _456 = fma(_436, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_428, _392, _438);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_450, _332, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _466 = fma(_446, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_430, _392, _440);
    float _470 = fma(_456, _408, _458);
    float _472 = fma(_462, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_432, _392, _442);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_466, _408, _468);
    float _482 = fma(_472, _408, _474);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _488;
    float _492 = fma(_454, _332, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_478, _332, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _496;
    float _500 = fma(_464, _354, _470);
    float _502 = fma(_486, _376, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _504 = fma(_490, _376, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _506 = fma(_498, _376, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _508 = fma(_492, _354, _480);
    float _510 = fma(_494, _354, _482);
    float _512 = fma(_502, _352, _500);
    float _514 = fma(_504, _352, _508);
    float _516 = fma(_506, _352, _510);
    float _518 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[148].x, _512);
    float _520 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[148].y, _514);
    float _522 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[148].z, _516);
    bool _524 = !_256;
    float _540;
    if (!_524)
    {
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _528 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _540 = _538;
        _542 = true;
    }
    else
    {
        float _544 = float(_122);
        float _546 = 1.0 / _544;
        float _548 = _164 * _546;
        _540 = _548;
    }
    _542 = false;
    float _550 = _540;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _550 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = isnan(_550);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _580 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _582 = isnan(_550);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _558;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    float _598 = -_574;
    float _600 = _598 + 1.0;
    bool _602 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _604 = isnan(_550);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / _562;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _620 = 1.0 / _578;
    float _622 = _596 * _592;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _628 = _590 * _600;
    float _630 = -_590;
    float _632 = _630 + 1.0;
    float _634 = fma(_622, _554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _636;
    float _640 = _612 * _632;
    float _642 = _626 * _614;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _550 + _644;
    bool _648 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _650 = isnan(_550);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _634 * _640;
    float _662 = -_612;
    float _664 = _662 + 1.0;
    float _666 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _670 = _550 + _668;
    float _672 = _638 * _620;
    float _674 = -_658;
    float _676 = _674 + 1.0;
    float _678 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _660);
    float _680 = fma(_672, _670, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _682 = _574 * _676;
    float _684 = fma(_666, _628, _678);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = fma(_680, _682, _684);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _692 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[118].x, _688);
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _702 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _716 = in.m_59.x;
    float _718 = in.m_59.y;
    float _720 = in.m_59.z;
    out.m_61.x = _702;
    out.m_61.y = _704;
    out.m_61.z = _706;
    out.m_61.w = _618;
    out.m_63.x = _708;
    out.m_63.y = _710;
    out.m_63.z = _712;
    out.m_63.w = _714;
    float _722 = _522 * _720;
    float _724 = _520 * _718;
    float _726 = _518 * _716;
    bool _728 = !_616;
    float _744;
    if (!_728)
    {
        float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _732 = _146 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _734 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _736 = _734 * _730;
        float _738 = floor(_736);
        float _740 = -_738;
        float _742 = _736 + _740;
        _744 = _742;
        _746 = true;
    }
    else
    {
        float _748 = float(_122);
        float _750 = 1.0 / _748;
        float _752 = _164 * _750;
        _744 = _752;
    }
    _746 = false;
    float _754 = _744;
    float _756 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _758 = int(_756);
    float _760 = in.m_65.w;
    float _762 = float(_122);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _766 = _764 != 0;
    float _768 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _770 = int(_768);
    float _772 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _774 = int(_772);
    float _776 = float(_758);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _778;
    if (_766)
    {
        _130 = 1.0;
    }
    float _782 = _130;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _788 = _782;
    if (!_766)
    {
        _788 = 1.2345600128173828125;
    }
    float _790 = _788;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _794 = 1.0 / _776;
    float _796 = float(_770);
    out.m_67.w = _760;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _806 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _808 = int(_806);
    float _810 = float(uint(_774));
    float _812 = _148 * 2.0;
    int _814 = ~_774;
    int _816 = _814 + 1;
    bool _818 = _774 == 0;
    float _820 = 1.0 / _796;
    float _822 = _794 * _164;
    bool _824 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _826 = isnan(_754);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _836;
    float _840 = float(uint(_808));
    float _842 = 1.0 / _810;
    int _844 = ~_808;
    int _846 = _844 + 1;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _848;
    bool _852 = _808 == 0;
    int _854 = ~_808;
    int _856 = _854 + 1;
    float _858 = _820 * _164;
    float _860 = trunc(_822);
    int _862 = int(_860);
    float _864 = 1.0 / _840;
    int _866 = as_type<int>(_842) + (-2);
    float _868 = trunc(_858);
    int _870 = int(_868);
    float _872 = float(uint(_862));
    float _874 = as_type<float>(_866) * _872;
    int _876 = as_type<int>(_864) + (-2);
    float _878 = 1.0 / _762;
    int _880 = ~_808;
    int _882 = _880 + 1;
    float _884 = float(uint(_870));
    float _886 = trunc(_874);
    float _888 = precise::max(_886, 0.0);
    uint _891 = uint(_888);
    float _893 = as_type<float>(_876) * _884;
    float _895 = trunc(_893);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = _878 * _164;
    int _903 = _816 * int(_891);
    int _905 = _903 + _862;
    float _907 = _893;
    float _909 = as_type<float>(_905);
    if (_766)
    {
        _907 = _146;
    }
    float _911 = _907;
    float _913 = floor(_812);
    float _915 = _911;
    if (!_766)
    {
        _915 = _148;
    }
    float _917 = _915;
    float _919 = float(uint(_905));
    if (_766)
    {
        _909 = 1.0;
    }
    float _921 = _909;
    int _923 = _882 * int(_899);
    int _925 = _923 + _870;
    float _927 = _921;
    if (!_766)
    {
        _927 = 7.345489978790283203125;
    }
    float _929 = _927;
    float _931 = as_type<float>(_866) * _919;
    float _933 = 1.0 / _780;
    float _935 = float(uint(_925));
    float _937 = _929 * _146;
    float _939 = as_type<float>(_876) * _935;
    float _941 = trunc(_931);
    float _943 = precise::max(_941, 0.0);
    uint _945 = uint(_943);
    float _947 = trunc(_939);
    float _949 = precise::max(_947, 0.0);
    uint _951 = uint(_949);
    int _953 = ~_774;
    int _955 = _953 + 1;
    float _957 = floor(_937);
    float _959 = _917 * _790;
    float _961 = float(_774);
    float _963 = float(_862);
    int _965 = int(_891) + int(_945);
    float _967 = floor(_959);
    bool _969 = _963 >= _961;
    bool _971 = isnan(_963);
    bool _973 = _969 || _971;
    bool _975 = isnan(_961);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    int _981 = int(_899) + int(_951);
    float _983 = float(_808);
    float _985 = -_957;
    float _987 = _937 + _985;
    float _989 = float(_870);
    int _991 = _955 * _965;
    int _993 = _991 + _862;
    float _995 = trunc(_979);
    int _997 = int(_995);
    int _999 = _846 * _981;
    int _1001 = _999 + _870;
    bool _1003 = _989 >= _983;
    bool _1005 = isnan(_989);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(_983);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = _961 * _901;
    bool _1017 = uint(_993) >= uint(_774);
    float _1019 = -_967;
    float _1021 = _959 + _1019;
    bool _1023 = uint(_1001) >= uint(_808);
    float _1025 = _961 * _987;
    float _1027 = trunc(_1013);
    int _1029 = int(_1027);
    bool _1031 = !_1017;
    int _1033 = _1031 ? 0 : (-1);
    float _1035 = _983 * _901;
    bool _1037 = !_1023;
    int _1039 = _1037 ? 0 : (-1);
    float _1041 = _983 * _1021;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1045 = _1043 != 0;
    int _1047 = ~_981;
    int _1049 = _1047 + _1039;
    int _1051 = _1049 + 1;
    float _1053 = trunc(_1025);
    int _1055 = int(_1053);
    int _1057 = ~_965;
    int _1059 = _1057 + _1033;
    int _1061 = _1059 + 1;
    bool _1063 = !_1045;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = _808 * _1051;
    int _1069 = _1067 + _870;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1073 = _1071 != 0;
    int _1075 = abs(_1065);
    int _1077 = _774 * _1061;
    int _1079 = _1077 + _862;
    bool _1081 = !_1073;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = trunc(_1015);
    int _1087 = int(_1085);
    int _1089 = ~_1029;
    int _1091 = _1089 + 1;
    int _1093 = _1091 + 1;
    int _1095 = abs(_1083);
    int _1097 = ~_997;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    int _1103 = _1055 * _1075;
    int _1105 = _1103 + _862;
    bool _1107 = !_818;
    int _1109 = _1107 ? _1079 : (-1);
    float _1111 = trunc(_1041);
    int _1113 = int(_1111);
    bool _1115 = !_852;
    int _1117 = _1115 ? _1069 : (-1);
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1121 = _1119 != 0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1125 = _1123 != 0;
    int _1127 = _1101 * _1109;
    int _1129 = _774 + (-1);
    int _1131 = _1093 * _1117;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1135 = _1133 != 0;
    float _1137 = trunc(_1035);
    int _1139 = int(_1137);
    bool _1141 = !_1125;
    int _1143 = _1141 ? 0 : 1;
    int _1145 = _997 * _1129;
    int _1147 = _1145 + _1127;
    bool _1149 = !_1121;
    int _1151 = _1149 ? 0 : 1;
    int _1153 = abs(_1143);
    int _1155 = abs(_1151);
    int _1157 = _1113 * _1095;
    int _1159 = _1157 + _870;
    bool _1161 = !_1135;
    int _1163 = _1161 ? 0 : 1;
    int _1165 = _1147 * _1153;
    float _1167 = 1.0 / _786;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1171 = _1169 != 0;
    int _1173 = abs(_1163);
    int _1175 = _1087 * _1155;
    int _1177 = _1175 + _1165;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1181 = _1179 != 0;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1185 = _1183 != 0;
    float _1187 = 1.0 / _800;
    int _1189 = _808 + (-1);
    bool _1191 = !_1171;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = _1105 * _1173;
    int _1197 = _1195 + _1177;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1201 = _1199 != 0;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1205 = _1203 != 0;
    int _1207 = _1029 * _1189;
    int _1209 = _1207 + _1131;
    bool _1211 = !_1185;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = 1.0 / _804;
    bool _1217 = !_1181;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = abs(_1193);
    int _1223 = abs(_1213);
    bool _1225 = !_1201;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1231 = log2(_1229);
    int _1233 = abs(_1219);
    int _1235 = _1209 * _1223;
    int _1237 = abs(_1227);
    bool _1239 = !_1205;
    int _1241 = _1239 ? 0 : 1;
    int _1243 = _1055 * _1221;
    int _1245 = _1243 + _1197;
    int _1247 = abs(_1241);
    int _1249 = _1139 * _1233;
    int _1251 = _1249 + _1235;
    float _1253 = float(uint(_1245));
    float _1255 = in.m_44.x;
    float _1257 = in.m_44.y;
    float _1259 = in.m_44.z;
    int _1261 = _1159 * _1237;
    int _1263 = _1261 + _1251;
    int _1265 = ~_808;
    int _1267 = _1265 + 1;
    float _1269 = as_type<float>(_866) * _1253;
    int _1271 = ~_774;
    int _1273 = _1271 + 1;
    int _1275 = _1113 * _1247;
    int _1277 = _1275 + _1263;
    int _1279 = ~_774;
    int _1281 = _1279 + 1;
    float _1283 = in.m_69.x;
    float _1285 = in.m_69.y;
    float _1287 = in.m_69.z;
    float _1289 = in.m_69.w;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1293 = _1291 != 0;
    float _1295 = trunc(_1269);
    float _1297 = precise::max(_1295, 0.0);
    uint _1299 = uint(_1297);
    float _1301 = float(uint(_1277));
    bool _1303 = _774 == 0;
    float _1305 = float(uint(_1159));
    float _1307 = as_type<float>(_876) * _1301;
    float _1309 = float(uint(_1105));
    float _1311 = trunc(_1307);
    float _1313 = precise::max(_1311, 0.0);
    uint _1315 = uint(_1313);
    bool _1317 = _1181;
    if (_1293)
    {
        bool _1319 = _146 > 0.5;
        _1317 = _1319;
    }
    bool _1321 = _1317;
    float _1323 = as_type<float>(_866) * _1309;
    float _1325 = 0.0;
    if (!_1293)
    {
        _1325 = _186;
    }
    float _1327 = _1325;
    int _1329 = _1281 * int(_1299);
    int _1331 = _1329 + _1245;
    float _1333 = trunc(_1323);
    float _1335 = precise::max(_1333, 0.0);
    uint _1337 = uint(_1335);
    float _1339 = float(uint(_1331));
    float _1341 = _1257 * _1285;
    float _1343 = as_type<float>(_866) * _1339;
    int _1345 = _1267 * int(_1315);
    int _1347 = _1345 + _1277;
    float _1349 = trunc(_1343);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    float _1355 = float(uint(_1347));
    float _1357 = as_type<float>(_876) * _1355;
    int _1359 = as_type<int>(_1343);
    float _1361 = _1327;
    if (_1293)
    {
        float _1363 = -_186;
        float _1365 = _1363 + 1.0;
        _1359 = as_type<int>(_1365);
    }
    int _1367 = _1359;
    float _1369 = trunc(_1357);
    float _1371 = precise::max(_1369, 0.0);
    uint _1373 = uint(_1371);
    if (_1293)
    {
        float _1375 = _1321 ? as_type<float>(_1367) : _186;
        _1361 = _1375;
    }
    float _1377 = _1361;
    float _1379 = -_190;
    float _1381 = _1379 + 1.0;
    int _1383 = int(_1299) + int(_1353);
    int _1385 = ~_808;
    int _1387 = _1385 + 1;
    bool _1389 = _148 > 0.5;
    int _1391 = _1273 * _1383;
    int _1393 = _1391 + _1245;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1397 = _1395 != 0;
    bool _1399 = uint(_1393) >= uint(_774);
    int _1401 = int(_1315) + int(_1373);
    bool _1403 = !_1399;
    int _1405 = _1403 ? 0 : (-1);
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1409 = _1407 != 0;
    int _1411 = _1387 * _1401;
    int _1413 = _1411 + _1277;
    int _1415 = ~_1383;
    int _1417 = _1415 + _1405;
    int _1419 = _1417 + 1;
    int _1421 = _1389 ? as_type<int>(_1381) : as_type<int>(_190);
    bool _1423 = uint(_1413) >= uint(_808);
    int _1425 = _774 * _1419;
    int _1427 = _1425 + _1245;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1431 = _1429 != 0;
    bool _1433 = !_1423;
    int _1435 = _1433 ? 0 : (-1);
    bool _1437 = !_1303;
    int _1439 = _1437 ? _1427 : (-1);
    int _1441 = ~_1401;
    int _1443 = _1441 + _1435;
    int _1445 = _1443 + 1;
    bool _1447 = _150 > 0.5;
    int _1449 = _1439 & 3;
    int _1451 = _808 * _1445;
    int _1453 = _1451 + _1277;
    float _1455 = _1397 ? as_type<float>(_1421) : _190;
    float _1457 = in.m_71.x;
    float _1459 = in.m_71.y;
    float _1461 = in.m_71.z;
    float _1463 = in.m_71.w;
    bool _1465 = _148 > 0.5;
    bool _1467 = _1465 && _1431;
    if (_1409)
    {
        float _1469 = _1447 ? _1381 : _190;
        _194 = _1469;
    }
    float _1471 = _194;
    bool _1473 = _1449 != 3;
    float _1475 = in.m_73.x;
    float _1477 = in.m_73.y;
    float _1479 = in.m_73.z;
    float _1481 = in.m_73.w;
    bool _1483 = uint(_1449) >= 2u;
    bool _1485 = !_852;
    int _1487 = _1485 ? _1453 : (-1);
    int _1489 = _1483 ? 0 : 1;
    int _1491 = _1487 & 3;
    float _1493 = 0.0;
    if (!_1431)
    {
        _1493 = _186;
    }
    float _1495 = _1493;
    float _1497 = _1495;
    if (_1467)
    {
        float _1499 = -_186;
        float _1501 = _1499 + 1.0;
        _196 = _1501;
    }
    float _1503 = _196;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1507 = _1505 != 0;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1511 = _1509 != 0;
    int _1513 = ~_1489;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    bool _1519 = uint(_1491) >= 2u;
    float _1521 = _1257 * _1459;
    int _1523 = _1517;
    if (_1473)
    {
        int _1525 = ~_1489;
        int _1527 = _1525 + 1;
        _1523 = _1527;
    }
    int _1529 = _1523;
    float _1531 = as_type<float>(_876) * _1305;
    int _1533 = _1519 ? 0 : 1;
    bool _1535 = _1491 != 3;
    float _1537 = _1257 * _1477;
    bool _1539 = uint(_1449) > 1u;
    float _1541 = trunc(_1531);
    float _1543 = precise::max(_1541, 0.0);
    uint _1545 = uint(_1543);
    if (_1431)
    {
        _1497 = _1503;
    }
    float _1547 = _1497;
    float _1549 = _146 * 2.0;
    int _1551 = _1439 & 3;
    bool _1553 = _1551 != 0;
    int _1555 = ~_774;
    int _1557 = _1555 + 1;
    int _1559 = _1553 ? 0 : 1;
    float _1561 = floor(_1549);
    int _1563 = ~_1533;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = _1567;
    if (_1535)
    {
        int _1571 = ~_1533;
        int _1573 = _1571 + 1;
        _1569 = _1573;
    }
    int _1575 = _1569;
    bool _1577 = uint(_1491) > 1u;
    float _1579 = fma(_1255, _1475, _1537);
    int _1581 = ~_1559;
    int _1583 = _1581 + 1;
    int _1585 = _1583 + 1;
    int _1587 = _856 * int(_1545);
    int _1589 = _1587 + _1159;
    int _1591 = _1585;
    if (!_1539)
    {
        int _1593 = ~_1559;
        int _1595 = _1593 + 1;
        _1591 = _1595;
    }
    int _1597 = _1591;
    int _1599 = _1557 * int(_1337);
    int _1601 = _1599 + _1105;
    int _1603 = _1487 & 3;
    bool _1605 = _1603 != 0;
    float _1607 = fma(_1255, _1457, _1521);
    float _1609 = float(uint(_1589));
    float _1611 = _150 * 2.0;
    int _1613 = _1605 ? 0 : 1;
    float _1615 = fma(_1259, _1461, _1607);
    float _1617 = float(uint(_1601));
    float _1619 = fma(_1259, _1479, _1579);
    int _1621 = ~_1613;
    int _1623 = _1621 + 1;
    int _1625 = _1623 + 1;
    float _1627 = floor(_1611);
    int _1629 = _1625;
    if (!_1577)
    {
        int _1631 = ~_1613;
        int _1633 = _1631 + 1;
        _1629 = _1633;
    }
    int _1635 = _1629;
    float _1637 = fma(_1255, _1283, _1341);
    bool _1639 = _1561 >= 0.0;
    bool _1641 = isnan(_1561);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan(0.0);
    bool _1647 = _1643 || _1645;
    float _1649 = as_type<float>(_876) * _1609;
    float _1651 = as_type<float>(_866) * _1617;
    float _1653 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1655 = _1647 ? 0 : 1;
    float _1657 = trunc(_1651);
    float _1659 = precise::max(_1657, 0.0);
    uint _1661 = uint(_1659);
    bool _1663 = _1561 > 0.0;
    float _1665 = fma(_1653, -2.0, _792);
    int _1667 = ~_1655;
    int _1669 = _1667 + 1;
    int _1671 = _1669 + 1;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1673;
    float _1677 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1679 = !_1507;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1687 = trunc(_1649);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1695 = _913 > 0.0;
    float _1697 = fma(_1259, _1287, _1637);
    float _1699 = -_1693;
    float _1701 = fma(_1677, 2.0, _1699);
    int _1703 = _1671;
    if (!_1663)
    {
        int _1705 = ~_1655;
        int _1707 = _1705 + 1;
        _1703 = _1707;
    }
    int _1709 = _1703;
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1713 = _754 + _1711;
    int _1715 = ~_808;
    int _1717 = _1715 + 1;
    float _1719 = 1.0 / _1675;
    bool _1721 = _913 >= 0.0;
    bool _1723 = isnan(_913);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan(0.0);
    bool _1729 = _1725 || _1727;
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1731;
    int _1735 = int(_1337) + int(_1661);
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1739 = _754 + _1737;
    int _1741 = ~_774;
    int _1743 = _1741 + 1;
    float _1745 = _1713 * _933;
    int _1747 = int(_1545) + int(_1691);
    float _1749 = 1.0 / _1685;
    int _1751 = _1743 * _1735;
    int _1753 = _1751 + _1105;
    int _1755 = _1729 ? 0 : 1;
    float _1757 = _1739 * _1167;
    int _1759 = _1717 * _1747;
    int _1761 = _1759 + _1159;
    int _1763 = ~_1755;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    float _1769 = 1.0 / _1733;
    bool _1771 = !_1511;
    int _1773 = _1771 ? 0 : 1;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1777 = uint(_1761) >= uint(_808);
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1781 = _754 + _1779;
    int _1783 = _1767;
    if (!_1695)
    {
        int _1785 = ~_1755;
        int _1787 = _1785 + 1;
        _1783 = _1787;
    }
    int _1789 = _1783;
    float _1791 = _146 + _148;
    bool _1793 = uint(_1753) >= uint(_774);
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1797 = _754 + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1801 = _754 + _1799;
    float _1803 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1775);
    bool _1805 = !_1777;
    int _1807 = _1805 ? 0 : (-1);
    float _1809 = _1791 + (-1.0);
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1813 = _1811 != 0;
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1817 = _1815 != 0;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1821 = _1819 != 0;
    float _1823 = _1781 * _1187;
    bool _1825 = _1627 >= 0.0;
    bool _1827 = isnan(_1627);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan(0.0);
    bool _1833 = _1829 || _1831;
    float _1835 = _1797 * _1215;
    float _1837 = _1801 * _1719;
    float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1841 = _754 + _1839;
    float _1843 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1845 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1803);
    float _1847 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1665);
    float _1849 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1851 = _1841 * _1749;
    int _1853 = _1833 ? 0 : 1;
    float _1855 = -_1847;
    float _1857 = fma(_1845, _1843, _1855);
    bool _1859 = _1627 > 0.0;
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1863 = _754 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1869;
    float _1873 = _1863 * _1769;
    float _1875 = _148 + _150;
    float _1877 = fma(_1867, _1745, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1879 = fma(_1871, _1745, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1881;
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1887 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1885;
    float _1889 = _1875 + (-1.0);
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1895 = fma(_1883, _1823, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1901 = fma(_1887, _1823, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1905 = _1903 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1907 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1909;
    float _1913 = fma(_1893, _1757, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1915;
    float _1919 = fma(_1899, _1757, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _1921 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1923 = isnan(_754);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    float _1933 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1935 = _1933 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1937 = fma(_1911, _1837, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1939 = fma(_1917, _1837, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _1941 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1943 = isnan(_754);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1949 = _1945 || _1947;
    float _1951 = float(_1949);
    float _1953 = fma(_1905, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1955 = fma(_1935, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1957 = -_1931;
    float _1959 = _1957 + 1.0;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1963 = _1961 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1965 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1967 = isnan(_754);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1979 = _1977 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1981 = -_1951;
    float _1983 = _1981 + 1.0;
    float _1985 = _1951 * _1959;
    float _1987 = fma(_1963, _1851, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1989 = fma(_1979, _1851, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _1991 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1993 = isnan(_754);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1999 = _1995 || _1997;
    float _2001 = float(_1999);
    float _2003 = _1975 * _1983;
    float _2005 = -_1975;
    float _2007 = _2005 + 1.0;
    bool _2009 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2011 = isnan(_754);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2017 = _2013 || _2015;
    float _2019 = float(_2017);
    float _2021 = _1697 + _1289;
    bool _2023 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2025 = isnan(_754);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    float _2035 = _2001 * _2007;
    float _2037 = -_2001;
    float _2039 = _2037 + 1.0;
    float _2041 = -_2019;
    float _2043 = _2041 + 1.0;
    float _2045 = -_164;
    float _2047 = fma(_2045, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1701);
    float _2049 = -_2033;
    float _2051 = _2049 + 1.0;
    float _2053 = _2019 * _2039;
    float _2055 = fma(_838, _1873, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2057 = _2033 * _2043;
    float _2059 = fma(_850, _1873, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2061 = _1619 + _1481;
    bool _2063 = _754 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2065 = isnan(_754);
    bool _2067 = _2063 || _2065;
    bool _2069 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2071 = _2067 || _2069;
    float _2073 = float(_2071);
    float _2075 = -_834;
    float _2077 = _2075 + 1.0;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2081 = _834 * _2051;
    float _2083 = _1615 + _1463;
    float _2085 = _1231 * _164;
    float _2087 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2079);
    float _2089 = _2073 * _2077;
    float _2091 = -_2073;
    float _2093 = _2091 + 1.0;
    bool _2095 = !_1817;
    int _2097 = _2095 ? 0 : 1;
    float _2099 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2087);
    float _2101 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2103 = _1879 * _2089;
    float _2105 = exp2(_2085);
    float _2107 = _1877 * _2089;
    float _2109 = fma(_2099, _2101, _2047);
    float _2111 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2103);
    int _2113 = ~_1853;
    int _2115 = _2113 + 1;
    int _2117 = _2115 + 1;
    float _2119 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2107);
    int _2121 = _2117;
    if (!_1859)
    {
        int _2123 = ~_1853;
        int _2125 = _2123 + 1;
        _2121 = _2125;
    }
    int _2127 = _2121;
    float _2129 = fma(_1919, _2081, _2111);
    int _2131 = _1439 >> 31;
    float _2133 = fma(_1913, _2081, _2119);
    int _2135 = _1487 >> 31;
    float _2137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2139 = _2131 & 3;
    float _2141 = _1857 + 0.5;
    float _2143 = _2109 + 0.5;
    int _2145 = _2135 & 3;
    float _2147 = -_2105;
    float _2149 = _2147 + 1.0;
    int _2151 = _1439 + _2139;
    float _2153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2155 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2157 = 1.0 + _2155;
    int _2159 = _1487 + _2145;
    float _2161 = fma(_1901, _2057, _2129);
    bool _2163 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2165 = isnan(0.0);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2171 = _2167 || _2169;
    out.m_75.x = _2143;
    out.m_75.y = _2141;
    int _2173 = _2151 >> 2;
    float _2175 = fma(_1955, _2053, _2161);
    float _2177 = 1.0 / _2157;
    int _2179 = _2159 >> 2;
    float _2181 = _2171 ? _2149 : 0.0;
    float _2183 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2185 = _2173 << 4;
    int _2187 = _2185 + 368;
    float _2189 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2191 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2193 = isnan(1.0);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2199 = _2195 || _2197;
    float _2201 = _2183 * _2137;
    int _2203 = _2179 << 4;
    int _2205 = _2203 + 512;
    float _2207 = _2189 * _2153;
    uint _2209 = uint(int(uint(_2187) >> uint(2)));
    uint _2211 = uint(int(uint(int(_2209)) >> uint(2)));
    int _2213 = int(_2209) & 3;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[int(_2211)][_2213];
    int _2217 = int(_2209) + 1;
    uint _2219 = uint(int(uint(_2217) >> uint(2)));
    int _2221 = _2217 & 3;
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[int(_2219)][_2221];
    float _2225 = fma(_1895, _2057, _2133);
    int _2227 = abs(_1597);
    float _2229 = fma(_1939, _2035, _2175);
    out.m_77.x = _2207;
    out.m_77.y = _2201;
    float _2231 = fma(_1953, _2053, _2225);
    float _2233 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2235 = _2083 + _2233;
    int _2237 = ~_1747;
    int _2239 = _2237 + _1807;
    int _2241 = _2239 + 1;
    uint _2243 = uint(int(uint(_2205) >> uint(2)));
    uint _2245 = uint(int(uint(int(_2243)) >> uint(2)));
    int _2247 = int(_2243) & 3;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[int(_2245)][_2247];
    int _2251 = int(_2243) + 1;
    uint _2253 = uint(int(uint(_2251) >> uint(2)));
    int _2255 = _2251 & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    float _2259 = as_type<float>(_2127);
    float _2261 = _2175;
    if (_2199)
    {
        float _2263 = _2181 * _2177;
        _168 = _2263;
    }
    float _2265 = _168;
    int _2267 = abs(_2097);
    float _2269 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2271 = float(_1709);
    int _2273 = _808 * _2241;
    int _2275 = _2273 + _1159;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2279 = _2061 + _2277;
    int _2281 = _2187 + 8;
    uint _2283 = uint(int(uint(_2281) >> uint(2)));
    uint _2285 = uint(int(uint(int(_2283)) >> uint(2)));
    int _2287 = int(_2283) & 3;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[int(_2285)][_2287];
    int _2291 = int(_2283) + 1;
    uint _2293 = uint(int(uint(_2291) >> uint(2)));
    int _2295 = _2291 & 3;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[int(_2293)][_2295];
    float _2299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2301 = _2021 + _2299;
    float _2303 = float(_2267);
    float _2305 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2269);
    bool _2307 = !_1793;
    int _2309 = _2307 ? 0 : (-1);
    float _2311 = fma(_1937, _2035, _2231);
    int _2313 = abs(_1635);
    float _2315 = _2303 * _2271;
    int _2317 = _2205 + 8;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    uint _2321 = uint(int(uint(int(_2319)) >> uint(2)));
    int _2323 = int(_2319) & 3;
    float _2325 = (*spvDescriptorSet0.vp_c9)._m0[int(_2321)][_2323];
    int _2327 = int(_2319) + 1;
    uint _2329 = uint(int(uint(_2327) >> uint(2)));
    int _2331 = _2327 & 3;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[int(_2329)][_2331];
    float _2335 = fma(_2301, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2305);
    bool _2337 = !_1553;
    int _2339 = _2337 ? 0 : 1;
    float _2341 = fma(_1987, _2003, _2311);
    int _2343 = ~_1735;
    int _2345 = _2343 + _2309;
    int _2347 = _2345 + 1;
    float _2349 = fma(_1989, _2003, _2229);
    int _2351 = abs(_2339);
    float _2353 = fma(_2055, _1985, _2341);
    int _2355 = _774 * _2347;
    int _2357 = _2355 + _1105;
    float _2359 = fma(_2059, _1985, _2349);
    int _2361 = ~_2227;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    float _2367 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2353);
    bool _2369 = !_1605;
    int _2371 = _2369 ? 0 : 1;
    float _2373 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2359);
    int _2375 = abs(_1529);
    int _2377 = ~_2351;
    int _2379 = _2377 + 1;
    int _2381 = _2379 + 1;
    int _2383 = abs(_2371);
    out.m_79.x = _2367;
    out.m_79.y = _2373;
    int _2385 = ~_2313;
    int _2387 = _2385 + 1;
    int _2389 = _2387 + 1;
    int _2391 = _2365 * as_type<int>(_2223);
    bool _2393 = _1449 != 3;
    int _2395 = ~_2383;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    int _2401 = _2381 * as_type<int>(_2215);
    int _2403 = _2401 + _2391;
    bool _2405 = !_2393;
    int _2407 = _2405 ? 0 : (-1);
    bool _2409 = _1491 != 3;
    int _2411 = _2389 * as_type<int>(_2257);
    int _2413 = abs(_2407);
    int _2415 = _2399 * as_type<int>(_2249);
    int _2417 = _2415 + _2411;
    bool _2419 = !_2409;
    int _2421 = _2419 ? 0 : (-1);
    int _2423 = abs(_1575);
    int _2425 = abs(_2421);
    int _2427 = ~_2375;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    int _2433 = ~_2423;
    int _2435 = _2433 + 1;
    int _2437 = _2435 + 1;
    int _2439 = _2431 * as_type<int>(_2289);
    int _2441 = _2439 + _2403;
    int _2443 = _2437 * as_type<int>(_2325);
    int _2445 = _2443 + _2417;
    int _2447 = abs(_1773);
    int _2449 = abs(_1681);
    int _2451 = ~_2413;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = ~_2425;
    int _2459 = _2457 + 1;
    int _2461 = _2459 + 1;
    int _2463 = _2455 * as_type<int>(_2297);
    int _2465 = _2463 + _2441;
    int _2467 = ~_2449;
    int _2469 = _2467 + 1;
    int _2471 = _2469 + 1;
    int _2473 = _2461 * as_type<int>(_2333);
    int _2475 = _2473 + _2445;
    int _2477 = ~_2447;
    int _2479 = _2477 + 1;
    int _2481 = _2479 + 1;
    float _2483 = _2235 * _2235;
    bool _2485 = _808 == 0;
    int _2487 = _2471 * _2465;
    bool _2489 = _2335 >= 0.0;
    float _2491 = fma(_2279, _2279, _2483);
    bool _2493 = !_2485;
    int _2495 = _2493 ? _2275 : (-1);
    int _2497 = _2481 * _2475;
    bool _2499 = _774 == 0;
    float _2501 = fma(_2301, _2301, _2491);
    bool _2503 = !_1813;
    int _2505 = _2503 ? 0 : 1;
    int _2507 = _2495 * _2447;
    int _2509 = _2507 + _2497;
    bool _2511 = !_2499;
    int _2513 = _2511 ? _2357 : (-1);
    float _2515 = in.m_81.x;
    float _2517 = in.m_81.y;
    float _2519 = in.m_81.z;
    int _2521 = abs(_2505);
    float _2523 = rsqrt(_2501);
    float _2525 = float(_2509);
    int _2527 = _2513 * _2449;
    int _2529 = _2527 + _2487;
    float _2531 = as_type<float>(_2497);
    float _2533 = _2311;
    float _2535 = _2341;
    if (_2489)
    {
        _2531 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2537 = _2531;
    int _2539 = as_type<int>(_2537);
    if (_2489)
    {
        out.m_47.x = 0.0;
    }
    float _2541 = float(_2127);
    if (_2489)
    {
        float _2543 = _2537 * 5.0;
        _2539 = as_type<int>(_2543);
    }
    int _2545 = _2539;
    float _2547 = float(_2529);
    bool _2549 = !_1821;
    int _2551 = _2549 ? 0 : 1;
    float _2553 = as_type<float>(_2545);
    if (_2489)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7783 = as_type<float>(_2545);
        out.gl_Position.z = _7783;
    }
    float _2555 = float(_2521);
    float _2557 = _2235 * _2523;
    out.m_83.x = _2547;
    out.m_83.y = _2525;
    float _2559 = _2279 * _2523;
    float _2561 = _2557;
    if (_2489)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2563 = -_2557;
    float _2565 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2083);
    float _2567 = _2555 * _2541;
    float _2569 = _2301 * _2523;
    float _2571 = -_2559;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2061);
    float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2577 = _2565 + _2575;
    float _2579 = _2567 * (-2.0);
    float _2581 = -_2569;
    float _2583 = fma(_2581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2021);
    float _2585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2587 = _2573 + _2585;
    float _2589 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2591 = fma(_2579, _2515, _2515);
    float _2593 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2595 = _2583 + _2593;
    float _2597 = _146 + (-0.5);
    float _2599 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2589);
    float _2601 = _2315 * (-2.0);
    float _2603 = _148 + (-0.5);
    float _2605 = fma(_2597, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2591);
    float _2607 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2599);
    float _2609 = fma(_2601, _2517, _2517);
    float _2611 = fma(_1849, _2579, _1849);
    float _2613 = fma(_1907, _2601, _1907);
    int _2615 = abs(_2551);
    float _2617 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2609);
    bool _2619 = _2607 >= 0.0;
    float _2621 = fma(_2611, _2265, _2605);
    float _2623 = -_2557;
    float _2625 = fma(_2623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2235);
    float _2627 = fma(_2613, _2265, _2617);
    float _2629 = -_2559;
    float _2631 = fma(_2629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2279);
    float _2633 = _2621 * 0.15915493667125701904296875;
    float _2635 = _2625 * _2625;
    float _2637 = _2627 * 0.15915493667125701904296875;
    float _2639 = _2633 * 6.283185482025146484375;
    float _2641 = sin(_2639);
    float _2643 = float(_1789);
    float _2645 = fma(_2631, _2631, _2635);
    float _2647 = float(_2615);
    float _2649 = -_2569;
    float _2651 = fma(_2649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2301);
    float _2653 = _2569;
    if (_2619)
    {
        _2553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2655 = _2553;
    int _2657 = as_type<int>(_2655);
    if (_2619)
    {
        out.m_47.x = 0.0;
    }
    float _2659 = _2633 * 6.283185482025146484375;
    float _2661 = cos(_2659);
    float _2663 = _2647 * _2643;
    if (_2619)
    {
        float _2665 = _2655 * 5.0;
        _2657 = as_type<int>(_2665);
    }
    int _2667 = _2657;
    float _2669 = fma(_2651, _2651, _2645);
    if (_2619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7988 = as_type<float>(_2667);
        out.gl_Position.z = _7988;
    }
    float _2671 = _2637 * 6.283185482025146484375;
    float _2673 = sin(_2671);
    if (_2619)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2675 = -_2083;
    float _2677 = _2675 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2679 = -_2061;
    float _2681 = _2679 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2683 = _146 + _150;
    float _2685 = -_2021;
    float _2687 = _2685 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2689 = _2677 * _2677;
    float _2691 = _2683 + (-1.0);
    float _2693 = _2663 * (-2.0);
    float _2695 = fma(_2681, _2681, _2689);
    float _2697 = _150 + (-0.5);
    float _2699 = fma(_2691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2701 = sqrt(_2669);
    float _2703 = fma(_2687, _2687, _2695);
    float _2705 = fma(_2693, _2519, _2519);
    float _2707 = fma(_2699, _2693, _2699);
    float _2709 = _2641 * _2673;
    float _2711 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2713 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2705);
    float _2715 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2717 = rsqrt(_2703);
    float _2719 = _2661 * _2673;
    float _2721 = fma(_2707, _2265, _2713);
    bool _2723 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2725 = isnan(0.5);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2731 = _2727 || _2729;
    float _2733 = _2721 * 0.15915493667125701904296875;
    bool _2735 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2737 = isnan(0.5);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2743 = _2739 || _2741;
    float _2745 = _2637 * 6.283185482025146484375;
    float _2747 = cos(_2745);
    float _2749 = _2523 * _2701;
    float _2751 = _2749 * _2711;
    float _2753 = _2749 * _2715;
    float _2755 = _2733 * 6.283185482025146484375;
    float _2757 = sin(_2755);
    float _2759 = _2681 * _2717;
    float _2761 = _2687 * _2717;
    float _2763 = in.m_85.x;
    float _2765 = in.m_85.y;
    float _2767 = in.m_85.z;
    float _2769 = _2677 * _2717;
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2773 = _2759 * _2771;
    float _2775 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2777 = _2761 * _2775;
    float _2779 = _2661 * _2747;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2783 = -_2773;
    float _2785 = fma(_2761, _2781, _2783);
    float _2787 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2789 = -_2777;
    float _2791 = fma(_2769, _2787, _2789);
    float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2795 = _2769 * _2793;
    float _2797 = _2733 * 6.283185482025146484375;
    float _2799 = cos(_2797);
    float _2801 = _2785 * _2785;
    float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2805 = -_2795;
    float _2807 = fma(_2759, _2803, _2805);
    float _2809 = fma(_2757, _2779, _2709);
    float _2811 = fma(_2757, _2709, _2779);
    float _2813 = fma(_2791, _2791, _2801);
    float _2815 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2817 = fma(_2807, _2807, _2813);
    float _2819 = _2641 * _2747;
    float _2821 = _2749 * _2815;
    float _2823 = rsqrt(_2817);
    float _2825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2765);
    float _2827 = _2661 * _2799;
    float _2829 = -_2719;
    float _2831 = fma(_2757, _2819, _2829);
    float _2833 = _2747 * _2799;
    float _2835 = _2825 * _2751;
    float _2837 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2763);
    float _2839 = _2641 * _2799;
    float _2841 = _2673 * _2799;
    float _2843 = -_2819;
    float _2845 = fma(_2757, _2719, _2843);
    float _2847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2767);
    float _2849 = _2837 * _2821;
    float _2851 = _2827 * _2835;
    float _2853 = _2839 * _2835;
    float _2855 = _2847 * _2753;
    float _2857 = -_2835;
    float _2859 = _2757 * _2857;
    float _2861 = _2791 * _2823;
    float _2863 = fma(_2809, _2849, _2851);
    float _2865 = _2785 * _2823;
    float _2867 = _2807 * _2823;
    float _2869 = _2769 * _2861;
    float _2871 = fma(_2845, _2855, _2863);
    float _2873 = fma(_2833, _2849, _2859);
    float _2875 = _2761 * _2865;
    float _2877 = -_2869;
    float _2879 = fma(_2759, _2865, _2877);
    float _2881 = fma(_2831, _2849, _2853);
    float _2883 = fma(_2841, _2855, _2873);
    float _2885 = -_2875;
    float _2887 = fma(_2769, _2867, _2885);
    float _2889 = _2879 * _2871;
    float _2891 = fma(_2811, _2855, _2881);
    float _2893 = _2759 * _2867;
    float _2895 = _2887 * _2871;
    float _2897 = fma(_2867, _2883, _2889);
    float _2899 = _2565 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2901 = -_2893;
    float _2903 = fma(_2761, _2861, _2901);
    float _2905 = fma(_2861, _2883, _2895);
    float _2907 = fma(_2761, _2891, _2897);
    float _2909 = fma(_2759, _2891, _2905);
    float _2911 = _2021 + _2907;
    float _2913 = _2061 + _2909;
    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2917 = _2911 + _2915;
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2921 = _2913 + _2919;
    float _2923 = _2917 * _2917;
    float _2925 = fma(_2921, _2921, _2923);
    float _2927 = _2565 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2929 = sqrt(_2925);
    float _2931 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2927);
    float _2933 = _2903 * _2871;
    float _2935 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2931);
    float _2937 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2899);
    float _2939 = fma(_2865, _2883, _2933);
    float _2941 = _2935 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2943 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2937);
    float _2945 = fma(_2769, _2891, _2939);
    float _2947 = 1.0 / _2941;
    float _2949 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2951 = _2083 + _2945;
    bool _2953 = _2929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2955 = _2949 + _2941;
    float _2957 = _2883;
    float _2959 = _2949;
    float _2961 = _2939;
    if (!_2953)
    {
        _2957 = _2913;
    }
    float _2963 = _2957;
    float _2965 = _2963;
    if (!_2953)
    {
        _2959 = _2911;
    }
    float _2967 = _2959;
    float _2969 = _2967;
    if (!_2953)
    {
        _2961 = _2951;
    }
    float _2971 = _2961;
    bool _2973 = !_2953;
    float _2975 = _2971;
    if (!_2973)
    {
        float _2977 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2981 = _2929 + _2979;
        float _2983 = rsqrt(_2925);
        float _2985 = _2981 * _2977;
        float _2987 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2989 = _2985 * 0.15915493667125701904296875;
        float _2991 = _2989 * 6.283185482025146484375;
        float _2993 = cos(_2991);
        float _2995 = _2989 * 6.283185482025146484375;
        float _2997 = sin(_2995);
        float _2999 = _2993 + (-1.0);
        float _3001 = fma(_2997, _2987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3003 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3005 = _2983 * _3001;
        float _3007 = fma(_2951, _2993, _3003);
        float _3009 = fma(_2921, _3005, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3011 = fma(_2917, _3005, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2975 = _3007;
        _2969 = _3011;
        _2965 = _3009;
    }
    float _3013 = _2975;
    float _3015 = _2969;
    float _3017 = _2965;
    float _3019 = -_2557;
    float _3021 = fma(_3019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3013);
    float _3023 = -_2569;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3015);
    float _3027 = -_2559;
    float _3029 = fma(_3027, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3017);
    float _3031 = _2955 * _2947;
    float _3033 = _3031 * 0.5;
    float _3035 = _3029;
    float _3037 = _3025;
    float _3039 = _3013;
    if (_2743)
    {
        _2561 = 1.0;
    }
    float _3041 = _2561;
    float _3043 = _3041;
    if (_2731)
    {
        _2653 = _3021;
    }
    float _3045 = _2653;
    float _3047 = _3045;
    if (!_2731)
    {
        float _3049 = _2577 * _2577;
        float _3051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3053 = -_2061;
        float _3055 = _3053 + _3017;
        float _3057 = -_2021;
        float _3059 = _3057 + _3015;
        float _3061 = fma(_2587, _2587, _3049);
        float _3063 = fma(_2595, _2595, _3061);
        float _3065 = 1.0 / _2749;
        float _3067 = sqrt(_3063);
        float _3069 = precise::min(_3067, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3071 = _3069 * _3051;
        float _3073 = -_2083;
        float _3075 = _3073 + _3013;
        float _3077 = _3071 * _3065;
        float _3079 = fma(_3055, _3077, _2573);
        float _3081 = fma(_3075, _3077, _2565);
        float _3083 = fma(_3059, _3077, _2583);
        _3047 = _3081;
        _3035 = _3079;
        _3037 = _3083;
    }
    float _3085 = _3047;
    float _3087 = _3035;
    float _3089 = _3037;
    if (!_2743)
    {
        float _3091 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3093 = _3091 * 0.15915493667125701904296875;
        float _3095 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3099 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3097);
        float _3101 = _3093 * 6.283185482025146484375;
        float _3103 = cos(_3101);
        float _3105 = _3095 * 0.15915493667125701904296875;
        float _3107 = _3093 * 6.283185482025146484375;
        float _3109 = sin(_3107);
        float _3111 = 1.0 / _3103;
        float _3113 = _3105 * 6.283185482025146484375;
        float _3115 = cos(_3113);
        float _3117 = _3109 * _3111;
        float _3119 = _3105 * 6.283185482025146484375;
        float _3121 = sin(_3119);
        float _3123 = _3115 * _3117;
        float _3125 = 1.0 / _3099;
        float _3127 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3129 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3127;
        float _3131 = 1.0 / _3123;
        float _3133 = 1.0 / _3129;
        float _3135 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3137 = _3125 * _3135;
        float _3139 = _3121 * _3131;
        float _3141 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3143 = fma(_3139, _3137, _3141);
        float _3145 = _3143 * _3133;
        float _3147 = precise::clamp(_3145, 0.0, 1.0);
        _3039 = _3133;
        _3043 = _3147;
    }
    float _3149 = _3039;
    float _3151 = _3043;
    float _3153 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3155 = _3085 + _3153;
    float _3157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3159 = _3087 + _3157;
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3163 = _3089 + _3161;
    float _3165 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3167 = _3155 * _3155;
    float _3169 = fma(_3159, _3159, _3167);
    float _3171 = fma(_3163, _3163, _3169);
    float _3173 = rsqrt(_3171);
    float _3175 = sqrt(_3171);
    float _3177 = _3173 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3179 = _3159 * _3177;
    float _3181 = _3163 * _3177;
    float _3183 = _3179 * _3179;
    float _3185 = _3181 * _3181;
    float _3187 = _3183 + _3185;
    float _3189 = sqrt(_3187);
    bool _3191 = _3189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3195 = _3189 + _3193;
    float _3197 = _3163;
    float _3199 = _3187;
    float _3201 = _3195;
    float _3203 = _3149;
    float _3205 = _3177;
    if (_3191)
    {
        float _3207 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3197 = _3207;
    }
    float _3209 = _3197;
    if (_3191)
    {
        float _3211 = rsqrt(_3187);
        _3199 = _3211;
    }
    float _3213 = _3199;
    float _3215 = _3213;
    if (_3191)
    {
        float _3217 = _3195 * _3209;
        _3201 = _3217;
    }
    float _3219 = _3201;
    if (_3191)
    {
        float _3221 = _3219 * 0.15915493667125701904296875;
        _3203 = _3221;
    }
    float _3223 = _3203;
    float _3225 = _3209;
    float _3227 = _3223;
    if (_3191)
    {
        float _3229 = _3223 * 6.283185482025146484375;
        float _3231 = sin(_3229);
        _3225 = _3231;
    }
    float _3233 = _3225;
    float _3235 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3237 = precise::max(0.0, _3235);
    float _3239 = _3167;
    float _3241 = _3237;
    if (_3191)
    {
        float _3243 = _3223 * 6.283185482025146484375;
        float _3245 = cos(_3243);
        _3239 = _3245;
    }
    float _3247 = _3239;
    float _3249 = -_3177;
    float _3251 = -_3237;
    float _3253 = fma(_3155, _3249, _3251);
    float _3255 = _3253;
    if (_3191)
    {
        float _3257 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3241 = _3257;
    }
    float _3259 = _3241;
    float _3261 = _3233;
    float _3263 = _3259;
    if (_3191)
    {
        float _3265 = fma(_3233, _3259, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3261 = _3265;
    }
    float _3267 = _3261;
    float _3269 = _3267;
    float _3271 = _3247;
    if (_3191)
    {
        float _3273 = _3247 + (-1.0);
        _3263 = _3273;
    }
    float _3275 = _3263;
    float _3277 = _3275;
    if (_3191)
    {
        float _3279 = _3213 * _3267;
        _3205 = _3279;
    }
    float _3281 = _3205;
    if (!_3191)
    {
        _3269 = _3179;
    }
    float _3283 = _3269;
    float _3285 = _3283;
    if (_3191)
    {
        float _3287 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3227 = _3287;
    }
    float _3289 = _3227;
    if (_3191)
    {
        float _3291 = _3179 * _3281;
        _3285 = _3291;
    }
    float _3293 = _3285;
    if (!_3191)
    {
        _3277 = _3181;
    }
    float _3295 = _3277;
    float _3297 = _3295;
    if (_3191)
    {
        float _3299 = _3181 * _3281;
        _3297 = _3299;
    }
    float _3301 = _3297;
    if (!_3191)
    {
        _3215 = _3183;
    }
    float _3303 = _3215;
    float _3305 = _3303;
    if (_3191)
    {
        float _3307 = fma(_3253, _3247, _3289);
        _3255 = _3307;
    }
    float _3309 = _3255;
    if (_3191)
    {
        float _3311 = _3293 * _3293;
        _3305 = _3311;
    }
    float _3313 = _3305;
    if (!_3191)
    {
        _3271 = _3185;
    }
    float _3315 = _3271;
    float _3317 = _3315;
    if (_3191)
    {
        float _3319 = _3301 * _3301;
        _3317 = _3319;
    }
    float _3321 = _3317;
    float _3323 = fma(_3309, _3309, _3313);
    float _3325 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3327 = _3323 + _3321;
    float _3329 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3325);
    float _3331 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3335 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3333);
    float _3337 = precise::clamp(_3335, 0.0, 1.0);
    float _3339 = rsqrt(_3327);
    float _3341 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3329);
    float _3343 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3345 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3331);
    float _3347 = -_3337;
    float _3349 = _3347 + 1.0;
    float _3351 = _3341 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3353 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3343);
    float _3355 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3345);
    float _3357 = _3085 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3359 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3361 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3353);
    float _3363 = _3355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3365 = abs(_3349);
    float _3367 = log2(_3365);
    float _3369 = -_3359;
    float _3371 = fma(_3369, _3165, 1.0);
    float _3373 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3357);
    float _3375 = _3361 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3377 = _3339 * _3293;
    float _3379 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3381 = _3339 * _3309;
    float _3383 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3373);
    float _3385 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3387 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3379);
    float _3389 = _3339 * _3301;
    float _3391 = _3383 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3393 = -_3385;
    float _3395 = fma(_3381, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3393);
    float _3397 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3387);
    float _3399 = log2(_3371);
    float _3401 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3403 = -_3389;
    float _3405 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3395);
    float _3407 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3397);
    float _3409 = _3367 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3411 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3413 = fma(_3405, -0.5, 0.5);
    float _3415 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3401);
    float _3417 = 1.0 / _3407;
    float _3419 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3411);
    float _3421 = fma(_3405, 0.5, 0.5);
    float _3423 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3415);
    float _3425 = _3381 + 1.0;
    float _3427 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3419);
    float _3429 = fma(_3421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3431 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3423);
    float _3433 = exp2(_3409);
    float _3435 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3427);
    float _3437 = fma(_3421, _3429, -0.212114393711090087890625);
    float _3439 = _3399 * 0.693147182464599609375;
    float _3441 = fma(_3421, _3437, 1.570728778839111328125);
    float _3443 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3445 = sqrt(_3413);
    float _3447 = _3435 * _3417;
    float _3449 = _3431 * _3417;
    float _3451 = fma(_3447, 0.5, 0.5);
    float _3453 = fma(_3449, -0.5, 0.5);
    float _3455 = -_3381;
    float _3457 = fma(_3433, _3425, _3455);
    float3 _9241 = float3(_3451, _3453, _3443);
    float _3459 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9241, float3(0.0), isnan(_9241)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9241, float3(0.0), isnan(_9241)), level(0.0)).x;
    float3 _9252 = float3(_3451, _3453, _3443);
    float4 _3462 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9252, float3(0.0), isnan(_9252)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9252, float3(0.0), isnan(_9252)), level(0.0)).xyzw;
    float _3464 = _3462.x;
    float _3466 = _3462.y;
    float _3468 = _3462.z;
    float _3470 = _3462.w;
    float _3472 = fma(_3457, 0.5, 0.5);
    float _3474 = _3445 * 0.636619746685028076171875;
    float _3476 = -_3441;
    float _3478 = fma(_3474, _3476, 1.0);
    float2 _9279 = float2(_3478, _3472);
    float3 _3482 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9279, float2(0.0), isnan(_9279)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9279, float2(0.0), isnan(_9279)), level(0.0)).xyz;
    float _3484 = _3482.x;
    float _3486 = _3482.y;
    float _3488 = _3482.z;
    float _3490 = in.m_87.x;
    float _3492 = in.m_87.y;
    float _3494 = in.m_87.z;
    bool _3496 = _2765 != 0.0;
    bool _3498 = isnan(_2765);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan(0.0);
    bool _3504 = _3500 || _3502;
    float _3506 = _3367 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3508 = in.m_89.x;
    float _3510 = in.m_89.y;
    float _3512 = in.m_89.z;
    float _3514 = in.m_89.w;
    bool _3516 = _2763 == 0.0;
    bool _3518 = !_3504;
    bool _3520 = _3516 && _3518;
    float _3522 = _2845 * _2903;
    float _3524 = exp2(_3506);
    bool _3526 = _2767 == 0.0;
    bool _3528 = _3526 && _3520;
    float _3530 = _3490;
    float _3532 = _3494;
    float _3534 = _3407;
    float _3536 = _3435;
    float _3538 = _3431;
    if (_3528)
    {
        _2259 = _3490;
    }
    float _3540 = _2259;
    float _3542 = -_3524;
    float _3544 = _3542 + 1.0;
    float _3546 = _3540;
    if (_3528)
    {
        _2533 = _3494;
    }
    float _3548 = _2533;
    float _3550 = _3548;
    if (_3528)
    {
        _2261 = _3492;
    }
    float _3552 = _2261;
    float _3554 = _3552;
    if (_3528)
    {
        _2535 = _3540;
    }
    float _3556 = _2535;
    float _3558 = _3556;
    if (!_3528)
    {
        _3546 = _3490;
    }
    float _3560 = _3546;
    if (_3528)
    {
        _3530 = _3548;
    }
    float _3562 = _3530;
    float _3564 = _3562;
    if (!_3528)
    {
        _3550 = _3494;
    }
    float _3566 = _3550;
    if (!_3528)
    {
        float _3568 = fma(_2763, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3560);
        _3558 = _3568;
    }
    float _3570 = _3558;
    if (_3528)
    {
        _3532 = _3552;
    }
    float _3572 = _3532;
    float _3574 = _3512 * _3560;
    float _3576 = _3572;
    if (!_3528)
    {
        _3554 = _3492;
    }
    float _3578 = _3554;
    float _3580 = _3510 * _3566;
    if (!_3528)
    {
        float _3582 = fma(_2767, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3566);
        _3564 = _3582;
    }
    float _3584 = _3564;
    float _3586 = -_3574;
    float _3588 = fma(_3508, _3566, _3586);
    float _3590 = _2827 * _2879;
    float _3592 = _3508 * _3578;
    if (!_3528)
    {
        float _3594 = fma(_2765, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3578);
        _3576 = _3594;
    }
    float _3596 = _3576;
    float _3598 = -_3580;
    float _3600 = fma(_3512, _3578, _3598);
    float _3602 = _2809 * _2887;
    float _3604 = -_3592;
    float _3606 = fma(_3510, _3560, _3604);
    float _3608 = _3588 * _3514;
    float _3610 = _3600 * _3514;
    float _3612 = _2809 * _2903;
    float _3614 = _3606 * _3514;
    float _3616 = _2809 * _2879;
    float _3618 = _2827 * _2887;
    float _3620 = _2827 * _2903;
    float _3622 = _2845 * _2887;
    float _3624 = fma(_2833, _2861, _3602);
    float _3626 = _2845 * _2879;
    float _3628 = fma(_2833, _2865, _3612);
    float _3630 = fma(_2833, _2867, _3616);
    float _3632 = -_2757;
    float _3634 = fma(_3632, _2861, _3618);
    float _3636 = -_2757;
    float _3638 = fma(_3636, _2865, _3620);
    float _3640 = -_2757;
    float _3642 = fma(_3640, _2867, _3590);
    float _3644 = fma(_2841, _2861, _3622);
    float _3646 = fma(_2841, _2865, _3522);
    float _3648 = fma(_2841, _2867, _3626);
    float _3650 = fma(_2839, _2759, _3634);
    float _3652 = fma(_2839, _2769, _3638);
    float _3654 = fma(_2839, _2761, _3642);
    float _3656 = fma(_2831, _2759, _3624);
    float _3658 = fma(_2831, _2769, _3628);
    float _3660 = fma(_2831, _2761, _3630);
    float _3662 = fma(_2811, _2761, _3648);
    float _3664 = _3650 * _3510;
    float _3666 = _3652 * _3510;
    float _3668 = _3654 * _3510;
    float _3670 = _3650 * _3596;
    float _3672 = fma(_2811, _2759, _3644);
    float _3674 = _3652 * _3596;
    float _3676 = fma(_2811, _2769, _3646);
    float _3678 = fma(_3656, _3570, _3670);
    float _3680 = _3363 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3682 = _3608 * _3650;
    float _3684 = _3608 * _3652;
    float _3686 = _3654 * _3596;
    float _3688 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3680);
    float _3690 = _3608 * _3654;
    float _3692 = fma(_3658, _3570, _3674);
    float _3694 = fma(_3656, _3508, _3664);
    float _3696 = fma(_3351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3688);
    float _3698 = _3544 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3700 = fma(_3658, _3508, _3666);
    float _3702 = fma(_3610, _3656, _3682);
    float _3704 = fma(_3610, _3658, _3684);
    float _3706 = fma(_3660, _3508, _3668);
    float _3708 = fma(_3610, _3660, _3690);
    float _3710 = fma(_3660, _3570, _3686);
    float _3712 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3696);
    float _3714 = fma(_3672, _3512, _3694);
    float _3716 = fma(_3676, _3512, _3700);
    float _3718 = fma(_3614, _3672, _3702);
    float _3720 = fma(_3614, _3676, _3704);
    float _3722 = fma(_3662, _3512, _3706);
    float _3724 = fma(_3614, _3662, _3708);
    float _3726 = fma(_3672, _3584, _3678);
    float _3728 = fma(_3676, _3584, _3692);
    float _3730 = fma(_3662, _3584, _3710);
    float _3732 = _3712 + _3407;
    float _3734 = _3435 + _3407;
    float _3736 = _3407 * 0.5;
    float _3738 = -_3698;
    float _3740 = _3738 + 1.0;
    out.m_91.x = _3714;
    out.m_91.y = _3716;
    out.m_91.z = _3722;
    float _3742 = _3732 * 0.5;
    float _3744 = _3734 * 0.5;
    float _3746 = fma(_3431, -0.5, _3736);
    out.m_93.x = _3726;
    out.m_93.y = _3728;
    out.m_93.z = _3730;
    bool _3748 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3750 = isnan(_3175);
    bool _3752 = _3748 || _3750;
    bool _3754 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3756 = _3752 || _3754;
    out.m_95.x = _3744;
    out.m_95.y = _3746;
    out.m_95.z = _3742;
    out.m_95.w = _3407;
    out.m_97.x = _3718;
    out.m_97.y = _3720;
    out.m_97.z = _3724;
    out.gl_Position.x = _3435;
    out.gl_Position.y = _3431;
    out.gl_Position.z = _3712;
    out.gl_Position.w = _3407;
    float _3758 = _3724;
    float _3760 = _3720;
    float _3762 = _3718;
    if (!_3756)
    {
        _3758 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3764 = _3758;
    float _3766 = _3764;
    float _3768 = _3764;
    if (!_3756)
    {
        _3760 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3770 = _3760;
    float _3772 = _3770;
    float _3774 = _3770;
    if (!_3756)
    {
        _3762 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3776 = _3762;
    float _3778 = _3776;
    float _3780 = _3776;
    if (!_3756)
    {
        _3534 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3782 = _3534;
    float _3784 = _3782;
    float _3786 = _3782;
    if (!_3756)
    {
        _3536 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3788 = _3536;
    float _3790 = _3788;
    float _3792 = _3788;
    if (!_3756)
    {
        _3538 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3794 = _3538;
    float _3796 = _3698 * _3459;
    float _3798 = _3470 * _3740;
    float _3800 = _3470 * _3796;
    float _3802 = _3488 * _3796;
    float _3804 = fma(_3484, _3800, _3464);
    float _3806 = fma(_3486, _3800, _3466);
    float _3808 = _3151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3810 = fma(_3470, _3802, _3468);
    out.m_99.x = _3804;
    out.m_99.y = _3806;
    out.m_99.z = _3810;
    out.m_99.w = _3798;
    bool _3812 = !_3756;
    float _3814 = _3794;
    float _3816 = _3794;
    if (!_3812)
    {
        bool _3818 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3820 = isnan(_3175);
        bool _3822 = _3818 || _3820;
        bool _3824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3826 = _3822 || _3824;
        if (!_3826)
        {
            float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3830 = _3175 + _3828;
            float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3834 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3832;
            float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3840 = 1.0 / _3834;
            float _3842 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3844 = _3842 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3848 = _3846 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3850 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3852 = _3850 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3854 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3856 = _3854 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3858 = _3830 * _3840;
            float _3860 = precise::clamp(_3858, 0.0, 1.0);
            float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3866 = fma(_3860, _3838, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3868 = fma(_3860, _3864, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3870 = fma(_3860, _3844, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3872 = fma(_3860, _3848, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3874 = fma(_3860, _3852, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3876 = fma(_3860, _3856, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3792 = _3870;
            _3774 = _3874;
            _3786 = _3866;
            _3768 = _3872;
            _3816 = _3868;
            _3780 = _3876;
            _3878 = true;
        }
        else
        {
            bool _3880 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3882 = isnan(_3175);
            bool _3884 = _3880 || _3882;
            bool _3886 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3888 = _3884 || _3886;
            if (!_3888)
            {
                _3784 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3890 = _3784;
            _3786 = _3890;
            if (!_3888)
            {
                _3790 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3892 = _3790;
            _3792 = _3892;
            if (!_3888)
            {
                _3814 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3894 = _3814;
            _3816 = _3894;
            if (!_3888)
            {
                _3766 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3896 = _3766;
            _3768 = _3896;
            if (!_3888)
            {
                _3772 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3898 = _3772;
            _3774 = _3898;
            if (!_3888)
            {
                _3778 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3900 = _3778;
            bool _3902 = !_3888;
            _3780 = _3900;
            if (!_3902)
            {
                bool _3904 = _3175 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3906 = isnan(_3175);
                bool _3908 = _3904 || _3906;
                bool _3910 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3912 = _3908 || _3910;
                if (!_3912)
                {
                    float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3916 = _3175 + _3914;
                    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3920 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3918;
                    float _3922 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3924 = _3922 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3926 = 1.0 / _3920;
                    float _3928 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3930 = _3928 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3932 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3934 = _3932 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3938 = _3936 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3940 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3942 = _3940 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3944 = _3916 * _3926;
                    float _3946 = precise::clamp(_3944, 0.0, 1.0);
                    float _3948 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3950 = _3948 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3952 = fma(_3946, _3924, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3954 = fma(_3946, _3950, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3956 = fma(_3946, _3930, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3958 = fma(_3946, _3934, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3960 = fma(_3946, _3938, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3962 = fma(_3946, _3942, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3792 = _3956;
                    _3774 = _3960;
                    _3786 = _3952;
                    _3768 = _3958;
                    _3816 = _3954;
                    _3780 = _3962;
                    _3878 = true;
                }
                else
                {
                    _3792 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3774 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3786 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3768 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3816 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3780 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3878 = false;
    float _3964 = _3792;
    float _3966 = _3774;
    float _3968 = _3786;
    float _3970 = _3768;
    float _3972 = _3816;
    float _3974 = _3780;
    float _3976 = fma(_3728, -0.5, 0.5);
    float _3978 = precise::clamp(_3976, 0.0, 1.0);
    float _3980 = -_3964;
    float _3982 = _3980 + _3966;
    float _3984 = -_3968;
    float _3986 = _3984 + _3970;
    out.m_101.x = 0.0;
    float _3988 = fma(_3978, _3982, _3964);
    float _3990 = -_3972;
    float _3992 = _3990 + _3974;
    float _3994 = fma(_3978, _3986, _3968);
    float _3996 = _3988 * 0.586610972881317138671875;
    bool _3998 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4000 = fma(_3978, _3992, _3972);
    float _4002 = _3808 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4004 = fma(_3994, 0.298911988735198974609375, _3996);
    bool _4006 = _3151 > 0.0;
    bool _4008 = isnan(_3151);
    bool _4010 = _4006 || _4008;
    bool _4012 = isnan(0.0);
    bool _4014 = _4010 || _4012;
    float _4016 = fma(_4000, 0.114477999508380889892578125, _4004);
    out.m_47.x = _4002;
    float _4018 = -_4016;
    float _4020 = _3994 + _4018;
    float _4022 = -_4016;
    float _4024 = _3988 + _4022;
    float _4026 = -_4016;
    float _4028 = _4000 + _4026;
    float _4030 = fma(_4020, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4016);
    float _4032 = fma(_4024, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4016);
    float _4034 = fma(_4028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4016);
    bool _4036 = !_3998;
    if (!_4036)
    {
        float _4038 = -_3085;
        float _4040 = _4038 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4042 = -_3087;
        float _4044 = _4042 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4046 = -_3089;
        float _4048 = _4046 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4050 = _4040 * _4040;
        float _4052 = fma(_4044, _4044, _4050);
        float _4054 = fma(_4048, _4048, _4052);
        float _4056 = sqrt(_4054);
        float _4058 = rsqrt(_4054);
        float _4060 = -_4056;
        float _4062 = _4060 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4064 = _4062 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4066 = precise::clamp(_4064, 0.0, 1.0);
        float _4068 = _4044 * _4058;
        float _4070 = _4040 * _4058;
        float _4072 = abs(_4066);
        float _4074 = log2(_4072);
        float _4076 = _4048 * _4058;
        float _4078 = _4068 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4080 = _3728 * _4070;
        float _4082 = -_4070;
        float _4084 = -_4078;
        float _4086 = fma(_4082, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4084);
        float _4088 = fma(_3726, _4068, _4080);
        float _4090 = -_4076;
        float _4092 = fma(_4090, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4086);
        float _4094 = fma(_3730, _4076, _4088);
        float _4096 = precise::clamp(_4094, 0.0, 1.0);
        float _4098 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4100 = _4092 + _4098;
        float _4102 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4104 = _4100 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4106 = precise::clamp(_4104, 0.0, 1.0);
        float _4108 = exp2(_4102);
        float _4110 = _4108 * _4106;
        float _4112 = _4096 * _4110;
        float _4114 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4116 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4118 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _4114;
        out.m_101.y = _4116;
        out.m_101.z = _4118;
    }
    out.m_103.x = _4030;
    out.m_103.y = _4032;
    out.m_103.z = _4034;
    if (_4014)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4120 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4120;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

