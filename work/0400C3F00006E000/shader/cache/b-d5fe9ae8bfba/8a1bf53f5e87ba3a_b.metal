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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_91 [[user(locn4)]];
    float4 m_89 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_55 [[user(locn13)]];
    float4 m_69 [[user(locn14)]];
    float4 m_83 [[user(locn15)]];
    float4 m_87 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_46 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_73 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3474 = false;
    bool _520 = false;
    bool _374 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_44.w;
    float _109 = in.m_46.w;
    float _111 = trunc(_107);
    int _114 = int(_111);
    float _116 = -_109;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _118;
    bool _122 = _114 >= 1;
    float _124 = 0.0;
    float _126 = as_type<float>(_114);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3738 = as_type<float>(_134);
        out.gl_Position.z = _3738;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _138 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_109);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = in.m_53.x;
    float _150 = float(_114);
    bool _152 = _118 >= _150;
    bool _154 = !_146;
    bool _156 = _152 || _154;
    if (_156)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _126;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _136 = as_type<int>(_160);
    }
    int _162 = _136;
    out.m_55.x = _148;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3797 = as_type<float>(_162);
        out.gl_Position.z = _3797;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_57.x;
    float _166 = in.m_57.y;
    float _168 = in.m_57.z;
    float _170 = 1.0 / _150;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _118 * _170;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_172;
    float _196 = _188;
    float _212;
    if (!_194)
    {
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _174;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _216 + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _258 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_216);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = -_232;
    float _272 = _270 + 1.0;
    float _274 = 1.0 / _256;
    float _276 = _268 * _272;
    float _278 = -_268;
    float _280 = _278 + 1.0;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _282;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _252;
    float _290 = _248 * _280;
    float _292 = -_248;
    float _294 = _292 + 1.0;
    float _296 = _236 * _274;
    float _298 = _220 * _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = fma(_284, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = fma(_306, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _314 = _308 * _290;
    float _316 = _310 * _290;
    float _318 = _312 * _290;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].x, _314);
    float _334 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _336 = fma(_322, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_326, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _340 = fma(_330, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _342 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].z, _318);
    float _344 = fma(_336, _276, _332);
    float _346 = fma(_338, _276, _334);
    float _348 = fma(_340, _276, _342);
    float _350 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].x, _344);
    float _352 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].y, _346);
    float _354 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].z, _348);
    bool _356 = !_286;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        _372 = _174;
    }
    _374 = false;
    float _376 = _372;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _380 = _376 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _386 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = isnan(_376);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _402 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _404 = isnan(_376);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _414;
    bool _418 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _420 = isnan(_376);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = 1.0 / _384;
    float _432 = -_396;
    float _434 = _432 + 1.0;
    bool _436 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _438 = _412 * _434;
    float _440 = -_412;
    float _442 = _440 + 1.0;
    float _444 = 1.0 / _400;
    float _446 = _416 * _430;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _452 = fma(_446, _380, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _454 = _450 * _444;
    float _456 = _452 * _438;
    float _458 = -_428;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _464 = _376 + _462;
    float _466 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _468 = _396 * _460;
    float _470 = fma(_454, _464, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _474 = fma(_470, _468, _466);
    float _476 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _478 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[117].x, _474);
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _484 = _478 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _486 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = in.m_59.x;
    float _492 = in.m_59.y;
    float _494 = in.m_59.z;
    out.m_61.x = _476;
    out.m_61.y = _486;
    out.m_61.z = _488;
    out.m_61.w = _484;
    float _496 = _350 * _490;
    float _498 = _352 * _492;
    float _500 = _354 * _494;
    bool _502 = !_436;
    float _518;
    if (!_502)
    {
        float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _506 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[11].w, _118);
        float _510 = _508 * _504;
        float _512 = floor(_510);
        float _514 = -_512;
        float _516 = _510 + _514;
        _518 = _516;
        _520 = true;
    }
    else
    {
        _518 = _174;
    }
    _520 = false;
    float _522 = _518;
    float _524 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _526 = int(_524);
    float _528 = in.m_63.y;
    float _530 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _532 = in.m_63.x;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _536 = _534 != 0;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _540 = int(_538);
    float _542 = in.m_53.z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _550 = _548 != 0;
    float _552 = float(_526);
    float _554 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _556 = int(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = float(_540);
    float _564 = 1.0 / _552;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _570 = 0.0;
    float _572 = _528;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _576 = _532;
    if (!_536)
    {
        _570 = _532;
    }
    float _578 = _570;
    float _580 = float(uint(_556));
    float _582 = 1.0 / _562;
    int _584 = ~_556;
    int _586 = _584 + 1;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _592 = _542 > 0.5;
    float _594 = _118 * _564;
    float _596 = 1.0 / _580;
    float _598 = trunc(_594);
    int _600 = int(_598);
    float _602 = _118 * _582;
    int _604 = ~_556;
    int _606 = _604 + 1;
    float _608 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _610 = int(_608);
    int _612 = as_type<int>(_596) + (-2);
    float _614 = float(uint(_600));
    float _616 = trunc(_602);
    int _618 = int(_616);
    float _620 = as_type<float>(_612) * _614;
    float _622 = float(uint(_610));
    float _624 = trunc(_620);
    float _626 = precise::max(_624, 0.0);
    uint _629 = uint(_626);
    float _631 = 1.0 / _622;
    float _633 = float(uint(_618));
    int _635 = ~_610;
    int _637 = _635 + 1;
    int _639 = _606 * int(_629);
    int _641 = _639 + _600;
    float _643 = in.m_53.y;
    float _645 = 1.0 / _560;
    int _647 = as_type<int>(_631) + (-2);
    float _649 = 1.0 / _590;
    float _651 = as_type<float>(_647) * _633;
    float _653 = float(uint(_641));
    float _655 = trunc(_651);
    float _657 = precise::max(_655, 0.0);
    uint _659 = uint(_657);
    float _661 = as_type<float>(_612) * _653;
    bool _663 = _643 > 0.5;
    float _665 = trunc(_661);
    float _667 = precise::max(_665, 0.0);
    uint _669 = uint(_667);
    float _671 = _643 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _673 = _637 * int(_659);
    int _675 = _673 + _618;
    float _677 = float(uint(_675));
    int _679 = int(_629) + int(_669);
    float _681 = -_528;
    float _683 = _681 + 1.0;
    float _685 = as_type<float>(_647) * _677;
    int _687 = as_type<int>(_677);
    bool _689 = _663;
    float _691 = _578;
    if (_536)
    {
        float _693 = -_532;
        float _695 = _693 + 1.0;
        _687 = as_type<int>(_695);
    }
    int _697 = _687;
    int _699 = _663 ? as_type<int>(_683) : as_type<int>(_528);
    float _701 = trunc(_685);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    if (_536)
    {
        bool _707 = _148 > 0.5;
        _689 = _707;
    }
    bool _709 = _689;
    float _711 = _550 ? as_type<float>(_699) : _528;
    if (_536)
    {
        float _713 = _709 ? as_type<float>(_697) : _532;
        _691 = _713;
    }
    float _715 = _691;
    int _717 = ~_610;
    int _719 = _717 + 1;
    if (_546)
    {
        float _721 = _592 ? _683 : _528;
        _572 = _721;
    }
    float _723 = _572;
    int _725 = _586 * _679;
    int _727 = _725 + _600;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _739 = _737 != 0;
    int _741 = int(_659) + int(_705);
    bool _743 = uint(_727) >= uint(_556);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _747 = _745 != 0;
    int _749 = _719 * _741;
    int _751 = _749 + _618;
    bool _753 = !_735;
    int _755 = _753 ? 0 : 1;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _759 = _757 != 0;
    bool _761 = !_747;
    int _763 = _761 ? 0 : 1;
    bool _765 = !_743;
    int _767 = _765 ? 0 : (-1);
    bool _769 = !_739;
    int _771 = _769 ? 0 : 1;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _787 = _785 != 0;
    bool _789 = !_731;
    int _791 = _789 ? 0 : 1;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _795 = _793 != 0;
    bool _797 = uint(_751) >= uint(_610);
    float _799 = in.m_44.x;
    float _801 = in.m_44.y;
    float _803 = in.m_44.z;
    bool _805 = !_779;
    int _807 = _805 ? 0 : 1;
    bool _809 = !_797;
    int _811 = _809 ? 0 : (-1);
    bool _813 = !_775;
    int _815 = _813 ? 0 : 1;
    bool _817 = !_783;
    int _819 = _817 ? 0 : 1;
    if (_795)
    {
        _574 = 1.0;
    }
    float _821 = _574;
    float _823 = _821;
    if (!_795)
    {
        _823 = 7.345489978790283203125;
    }
    float _825 = _823;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _833 = _831 != 0;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _837 = _835 != 0;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _841 = _839 != 0;
    float _843 = -_566;
    float _845 = fma(_530, 2.0, _843);
    float _847 = _825 * _148;
    float _849 = 0.0;
    if (_795)
    {
        _849 = _148;
    }
    float _851 = _849;
    float _853 = fma(_671, -2.0, _568);
    float _855 = 0.0;
    float _857 = _851;
    if (_795)
    {
        _855 = 1.0;
    }
    float _859 = _855;
    float _861 = floor(_847);
    float _863 = _859;
    if (!_795)
    {
        _857 = _643;
    }
    float _865 = _857;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _867;
    if (!_795)
    {
        _863 = 1.2345600128173828125;
    }
    float _871 = _863;
    float _873 = _801 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _875 = float(_556);
    float _877 = _801 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _879 = float(_600);
    float _881 = _865 * _871;
    float _883 = _801 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _885 = _869 * _645;
    bool _887 = _879 >= _875;
    bool _889 = isnan(_879);
    bool _891 = _887 || _889;
    bool _893 = isnan(_875);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].x, _873);
    float _901 = floor(_881);
    float _903 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].x, _877);
    float _905 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].x, _883);
    float _907 = float(_610);
    float _909 = -_861;
    float _911 = _847 + _909;
    float _913 = float(_618);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _917 = _522 + _915;
    int _919 = ~_679;
    int _921 = _919 + _767;
    int _923 = _921 + 1;
    float _925 = trunc(_897);
    int _927 = int(_925);
    bool _929 = _913 >= _907;
    bool _931 = isnan(_913);
    bool _933 = _929 || _931;
    bool _935 = isnan(_907);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = _911 * _875;
    float _943 = fma(_885, _917, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _945 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[4].z, _899);
    float _947 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _949 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[6].z, _905);
    bool _951 = !_787;
    int _953 = _951 ? 0 : 1;
    float _955 = trunc(_939);
    int _957 = int(_955);
    int _959 = _556 * _923;
    int _961 = _959 + _600;
    bool _963 = _556 == 0;
    float _965 = -_901;
    float _967 = _881 + _965;
    int _969 = ~_741;
    int _971 = _969 + _811;
    int _973 = _971 + 1;
    float _975 = _174 * _875;
    bool _977 = !_963;
    int _979 = _977 ? _961 : (-1);
    float _981 = _174 * _907;
    float _983 = trunc(_941);
    int _985 = int(_983);
    int _987 = ~_927;
    int _989 = _987 + 1;
    int _991 = _989 + 1;
    float _993 = _967 * _907;
    bool _995 = !_833;
    int _997 = _995 ? 0 : 1;
    int _999 = _610 * _973;
    int _1001 = _999 + _618;
    bool _1003 = _610 == 0;
    int _1005 = _979 * _991;
    int _1007 = _556 + (-1);
    float _1009 = trunc(_975);
    int _1011 = int(_1009);
    int _1013 = ~_957;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1023 = !_1003;
    int _1025 = _1023 ? _1001 : (-1);
    int _1027 = _927 * _1007;
    int _1029 = _1027 + _1005;
    int _1031 = abs(_763);
    float _1033 = _1021 * _649;
    int _1035 = abs(_755);
    float _1037 = trunc(_993);
    int _1039 = int(_1037);
    int _1041 = _1025 * _1017;
    int _1043 = _610 + (-1);
    int _1045 = _985 * _1031;
    int _1047 = _1045 + _600;
    int _1049 = abs(_791);
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1053 = _522 + _1051;
    int _1055 = abs(_815);
    int _1057 = _1029 * _1035;
    float _1059 = trunc(_981);
    int _1061 = int(_1059);
    bool _1063 = !_759;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = _957 * _1043;
    int _1069 = _1067 + _1041;
    int _1071 = abs(_807);
    int _1073 = _1011 * _1049;
    int _1075 = _1073 + _1057;
    int _1077 = abs(_771);
    float _1079 = fma(_1033, _1053, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1081 = abs(_1065);
    int _1083 = _1069 * _1071;
    int _1085 = abs(_997);
    float _1087 = -_118;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[76].x, _845);
    float _1091 = _949 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1093 = _1039 * _1085;
    int _1095 = _1093 + _618;
    int _1097 = abs(_819);
    int _1099 = _1061 * _1055;
    int _1101 = _1099 + _1083;
    int _1103 = abs(_953);
    int _1105 = _1047 * _1077;
    int _1107 = _1105 + _1075;
    int _1109 = _1095 * _1097;
    int _1111 = _1109 + _1101;
    float _1113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1115 = _985 * _1081;
    int _1117 = _1115 + _1107;
    bool _1119 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1121 = isnan(_522);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1133 = _1039 * _1103;
    int _1135 = _1133 + _1111;
    float _1137 = float(uint(_1117));
    float _1139 = -_1129;
    float _1141 = _1139 + 1.0;
    bool _1143 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1145 = isnan(_522);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1157 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1159 = isnan(_522);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = as_type<float>(_612) * _1137;
    int _1171 = _1061;
    float _1173 = _1167;
    float _1175 = _1091;
    if (_795)
    {
        _1171 = 0;
    }
    int _1177 = _1171;
    float _1179 = _1153 * _1141;
    float _1181 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1155);
    float _1183 = -_1153;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _853);
    int _1189 = _1177;
    if (!_795)
    {
        _1189 = 2;
    }
    int _1191 = _1189;
    float _1193 = trunc(_1169);
    float _1195 = precise::max(_1193, 0.0);
    uint _1197 = uint(_1195);
    float _1199 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1181);
    float _1201 = _1167 * _1185;
    float _1203 = float(uint(_1135));
    bool _1205 = _1191 != 2;
    float _1207 = _943 * _1201;
    int _1209 = ~_556;
    int _1211 = _1209 + 1;
    float _1213 = -_1187;
    float _1215 = fma(_1199, _1131, _1213);
    float _1217 = as_type<float>(_647) * _1203;
    float _1219 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1221 = as_type<int>(_1113);
    if (_837)
    {
        float _1223 = -_532;
        float _1225 = _1223 + 1.0;
        _1221 = as_type<int>(_1225);
    }
    int _1227 = _1221;
    bool _1229 = _643 > 0.5;
    float _1231 = fma(_1219, _723, -0.5);
    float _1233 = trunc(_1217);
    float _1235 = precise::max(_1233, 0.0);
    uint _1237 = uint(_1235);
    int _1239 = _1211 * int(_1197);
    int _1241 = _1239 + _1117;
    float _1243 = -_1167;
    float _1245 = _1243 + 1.0;
    if (_1205)
    {
        _1173 = _148;
    }
    float _1247 = _1173;
    float _1249 = _1247;
    if (!_1205)
    {
        _1249 = _542;
    }
    float _1251 = _1249;
    float _1253 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1207);
    float _1255 = float(uint(_1241));
    if (_837)
    {
        float _1257 = _1229 ? as_type<float>(_1227) : _532;
        _576 = _1257;
    }
    float _1259 = _576;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1263 = as_type<float>(_612) * _1255;
    float _1265 = fma(_1079, _1179, _1253);
    int _1267 = ~_610;
    int _1269 = _1267 + 1;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1273 = trunc(_1263);
    float _1275 = precise::max(_1273, 0.0);
    uint _1277 = uint(_1275);
    float _1279 = float(uint(_1047));
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1283 = _1269 * int(_1237);
    int _1285 = _1283 + _1135;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1289 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1271);
    float _1291 = as_type<float>(_612) * _1279;
    float _1293 = _1271;
    if (_1205)
    {
        _1293 = _643;
    }
    float _1295 = _1293;
    float _1297 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1281);
    float _1299 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1287);
    float _1301 = float(uint(_1285));
    float _1303 = trunc(_1291);
    float _1305 = precise::max(_1303, 0.0);
    uint _1307 = uint(_1305);
    float _1309 = _1295;
    if (!_1205)
    {
        _1309 = _148;
    }
    float _1311 = _1309;
    float _1313 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1315 = float(uint(_1095));
    float _1317 = as_type<float>(_647) * _1301;
    int _1319 = ~_556;
    int _1321 = _1319 + 1;
    float _1323 = fma(_1313, _1259, -0.5);
    float _1325 = as_type<float>(_647) * _1315;
    int _1327 = int(_1197) + int(_1277);
    float _1329 = trunc(_1317);
    float _1331 = precise::max(_1329, 0.0);
    uint _1333 = uint(_1331);
    float _1335 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1337 = ~_556;
    int _1339 = _1337 + 1;
    float _1341 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1297);
    float _1343 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1345 = _1321 * int(_1307);
    int _1347 = _1345 + _1047;
    float _1349 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1351 = trunc(_1325);
    float _1353 = precise::max(_1351, 0.0);
    uint _1355 = uint(_1353);
    float _1357 = fma(_1341, _1335, _1089);
    int _1359 = _1339 * _1327;
    int _1361 = _1359 + _1117;
    float _1363 = float(uint(_1347));
    float _1365 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1265);
    int _1367 = ~_610;
    int _1369 = _1367 + 1;
    float _1371 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1299);
    bool _1373 = uint(_1361) >= uint(_556);
    float _1375 = as_type<float>(_612) * _1363;
    int _1377 = int(_1237) + int(_1333);
    int _1379 = ~_610;
    int _1381 = _1379 + 1;
    float _1383 = trunc(_1375);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    bool _1389 = !_1373;
    int _1391 = _1389 ? 0 : (-1);
    int _1393 = _1369 * int(_1355);
    int _1395 = _1393 + _1095;
    int _1397 = _1381 * _1377;
    int _1399 = _1397 + _1135;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1403 = ~_1327;
    int _1405 = _1403 + _1391;
    int _1407 = _1405 + 1;
    float _1409 = float(uint(_1395));
    float _1411 = -_1401;
    float _1413 = fma(_1343, 2.0, _1411);
    bool _1415 = uint(_1399) >= uint(_610);
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1419 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1289);
    float _1421 = as_type<float>(_647) * _1409;
    int _1423 = _556 * _1407;
    int _1425 = _1423 + _1117;
    bool _1427 = !_1415;
    int _1429 = _1427 ? 0 : (-1);
    float _1431 = fma(_1349, -2.0, _1417);
    int _1433 = int(_1307) + int(_1387);
    float _1435 = -_118;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1413);
    bool _1439 = !_963;
    int _1441 = _1439 ? _1425 : (-1);
    float _1443 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1431);
    int _1445 = ~_1377;
    int _1447 = _1445 + _1429;
    int _1449 = _1447 + 1;
    float _1451 = trunc(_1421);
    float _1453 = precise::max(_1451, 0.0);
    uint _1455 = uint(_1453);
    int _1457 = _1441 & 3;
    bool _1459 = _1457 != 0;
    float _1461 = fma(_1371, _1323, _1437);
    int _1463 = _1441 & 3;
    bool _1465 = _1463 != 0;
    int _1467 = _610 * _1449;
    int _1469 = _1467 + _1135;
    bool _1471 = uint(_1457) > 1u;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1475 = _1091 + _1473;
    int _1477 = _1441 >> 31;
    float _1479 = -_1443;
    float _1481 = fma(_1419, _1231, _1479);
    bool _1483 = !_1003;
    int _1485 = _1483 ? _1469 : (-1);
    float _1487 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1489 = ~_556;
    int _1491 = _1489 + 1;
    int _1493 = _1485 >> 31;
    int _1495 = _1465 ? 0 : 1;
    int _1497 = _1491 * _1433;
    int _1499 = _1497 + _1047;
    int _1501 = _1477 & 3;
    int _1503 = _1493 & 3;
    int _1505 = ~_1495;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    int _1511 = _1509;
    float _1513 = _1365;
    if (!_1471)
    {
        int _1515 = ~_1495;
        int _1517 = _1515 + 1;
        _1511 = _1517;
    }
    int _1519 = _1511;
    float _1521 = _945 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1523 = _1441 + _1501;
    float _1525 = _947 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1527 = uint(_1457) >= 2u;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1531 = _1521 + _1529;
    int _1533 = _1485 + _1503;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1537 = _1525 + _1535;
    bool _1539 = uint(_1499) >= uint(_556);
    int _1541 = _1523 >> 2;
    float _1543 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1545 = _1527 ? 0 : 1;
    bool _1547 = _1457 != 3;
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1543);
    int _1551 = _1533 >> 2;
    int _1553 = _1541 << 4;
    int _1555 = _1553 + 368;
    float _1557 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1549);
    int _1559 = int(_1355) + int(_1455);
    int _1561 = ~_610;
    int _1563 = _1561 + 1;
    int _1565 = _1551 << 4;
    int _1567 = _1565 + 512;
    uint _1569 = uint(int(uint(_1555) >> uint(2)));
    uint _1571 = uint(int(uint(int(_1569)) >> uint(2)));
    int _1573 = int(_1569) & 3;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[int(_1571)][_1573];
    int _1577 = int(_1569) + 1;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    int _1581 = _1577 & 3;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[int(_1579)][_1581];
    int _1585 = _1563 * _1559;
    int _1587 = _1585 + _1095;
    int _1589 = ~_1545;
    int _1591 = _1589 + 1;
    int _1593 = _1591 + 1;
    int _1595 = _1593;
    if (_1547)
    {
        int _1597 = ~_1545;
        int _1599 = _1597 + 1;
        _1595 = _1599;
    }
    int _1601 = _1595;
    bool _1603 = uint(_1587) >= uint(_610);
    uint _1605 = uint(int(uint(_1567) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[int(_1615)][_1617];
    bool _1621 = !_1539;
    int _1623 = _1621 ? 0 : (-1);
    bool _1625 = !_1459;
    int _1627 = _1625 ? 0 : 1;
    int _1629 = _1485 & 3;
    bool _1631 = _1629 != 0;
    int _1633 = _1485 & 3;
    bool _1635 = _1633 != 0;
    int _1637 = _1555 + 8;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    uint _1641 = uint(int(uint(int(_1639)) >> uint(2)));
    int _1643 = int(_1639) & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = int(_1639) + 1;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    int _1651 = _1647 & 3;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[int(_1649)][_1651];
    bool _1655 = !_1631;
    int _1657 = _1655 ? 0 : 1;
    bool _1659 = uint(_1629) > 1u;
    int _1661 = _1635 ? 0 : 1;
    bool _1663 = !_1603;
    int _1665 = _1663 ? 0 : (-1);
    int _1667 = _1567 + 8;
    uint _1669 = uint(int(uint(_1667) >> uint(2)));
    uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
    int _1673 = int(_1669) & 3;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[int(_1671)][_1673];
    int _1677 = int(_1669) + 1;
    uint _1679 = uint(int(uint(_1677) >> uint(2)));
    int _1681 = _1677 & 3;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[int(_1679)][_1681];
    int _1685 = ~_1433;
    int _1687 = _1685 + _1623;
    int _1689 = _1687 + 1;
    int _1691 = ~_1661;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    int _1697 = ~_1559;
    int _1699 = _1697 + _1665;
    int _1701 = _1699 + 1;
    int _1703 = _556 * _1689;
    int _1705 = _1703 + _1047;
    bool _1707 = _1629 != 3;
    int _1709 = _1695;
    if (!_1659)
    {
        int _1711 = ~_1661;
        int _1713 = _1711 + 1;
        _1709 = _1713;
    }
    int _1715 = _1709;
    int _1717 = _610 * _1701;
    int _1719 = _1717 + _1095;
    bool _1721 = _1457 != 3;
    int _1723 = abs(_1519);
    int _1725 = abs(_1715);
    int _1727 = abs(_1627);
    int _1729 = ~_1723;
    int _1731 = _1729 + 1;
    int _1733 = _1731 + 1;
    bool _1735 = uint(_1629) >= 2u;
    int _1737 = abs(_1657);
    int _1739 = _1733 * as_type<int>(_1583);
    int _1741 = ~_1725;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    float _1747 = _1357 + 0.5;
    int _1749 = ~_1727;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    int _1755 = abs(_1601);
    int _1757 = _1735 ? 0 : 1;
    int _1759 = _1745 * as_type<int>(_1619);
    int _1761 = ~_1737;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    int _1767 = _1753 * as_type<int>(_1575);
    int _1769 = _1767 + _1739;
    int _1771 = ~_1755;
    int _1773 = _1771 + 1;
    int _1775 = _1773 + 1;
    int _1777 = ~_1757;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    int _1783 = _1765 * as_type<int>(_1611);
    int _1785 = _1783 + _1759;
    bool _1787 = !_1721;
    int _1789 = _1787 ? 0 : (-1);
    int _1791 = _1775 * as_type<int>(_1645);
    int _1793 = _1791 + _1769;
    int _1795 = _1781;
    if (_1707)
    {
        int _1797 = ~_1757;
        int _1799 = _1797 + 1;
        _1795 = _1799;
    }
    int _1801 = _1795;
    bool _1803 = _1629 != 3;
    bool _1805 = !_829;
    int _1807 = _1805 ? 0 : 1;
    int _1809 = abs(_1789);
    int _1811 = abs(_1801);
    bool _1813 = !_1803;
    int _1815 = _1813 ? 0 : (-1);
    int _1817 = abs(_1807);
    int _1819 = ~_1811;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    int _1825 = abs(_1815);
    bool _1827 = !_841;
    int _1829 = _1827 ? 0 : 1;
    int _1831 = _1823 * as_type<int>(_1675);
    int _1833 = _1831 + _1785;
    int _1835 = ~_1809;
    int _1837 = _1835 + 1;
    int _1839 = _1837 + 1;
    float _1841 = _1215 + 0.5;
    int _1843 = abs(_1829);
    int _1845 = ~_1817;
    int _1847 = _1845 + 1;
    int _1849 = _1847 + 1;
    int _1851 = _1839 * as_type<int>(_1653);
    int _1853 = _1851 + _1793;
    float _1855 = _1537 * _1537;
    out.m_65.x = _1747;
    out.m_65.y = _1841;
    int _1857 = _1853 * _1849;
    float _1859 = fma(_1531, _1531, _1855);
    bool _1861 = _1557 >= 0.0;
    int _1863 = ~_1825;
    int _1865 = _1863 + 1;
    int _1867 = _1865 + 1;
    float _1869 = fma(_1475, _1475, _1859);
    int _1871 = ~_1843;
    int _1873 = _1871 + 1;
    int _1875 = _1873 + 1;
    bool _1877 = !_963;
    float _1879 = _1877 ? as_type<float>(_1705) : as_type<float>(0xffffffffu /* nan */);
    int _1881 = _1867 * as_type<int>(_1683);
    int _1883 = _1881 + _1833;
    bool _1885 = !_1003;
    int _1887 = _1885 ? _1719 : (-1);
    float _1889 = rsqrt(_1869);
    float _1891 = _1481 + 0.5;
    int _1893 = _1883 * _1875;
    float _1895 = _1461 + 0.5;
    int _1897 = as_type<int>(_1879) * _1817;
    int _1899 = _1897 + _1857;
    float _1901 = _1879;
    if (_1861)
    {
        _1901 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1903 = _1901;
    int _1905 = _1887 * _1843;
    int _1907 = _1905 + _1893;
    float _1909 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1911 = float(_1899);
    int _1913 = as_type<int>(_1903);
    if (_1861)
    {
        float _1915 = _1903 * 5.0;
        _1913 = as_type<int>(_1915);
    }
    int _1917 = _1913;
    float _1919 = float(_1907);
    float _1921 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _1895;
    out.m_67.y = _1891;
    float _1923 = _1909 * _1889;
    if (_1861)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6421 = as_type<float>(_1917);
        out.gl_Position.z = _6421;
    }
    float _1925 = _1531 * _1923;
    out.m_69.x = _1911;
    out.m_69.y = _1919;
    float _1927 = _1537 * _1923;
    out.m_71.w = _1921;
    if (_1861)
    {
        out.m_51.x = 0.0;
    }
    if (_1861)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1929 = -_1927;
    float _1931 = _1525 + _1929;
    float _1933 = _1475 * _1923;
    float _1935 = -_1925;
    float _1937 = _1521 + _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1941 = _1931 + _1939;
    float _1943 = -_1933;
    float _1945 = _1091 + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = _1937 + _1947;
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1945 + _1953;
    float _1957 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1951);
    float _1959 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1957);
    bool _1961 = _1959 >= 0.0;
    float _1963 = _1933;
    float _1965 = _1941;
    float _1967 = _1949;
    float _1969 = _1931;
    float _1971 = _1937;
    if (_1961)
    {
        _1513 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1973 = _1513;
    int _1975 = as_type<int>(_1973);
    if (_1961)
    {
        out.m_51.x = 0.0;
    }
    if (_1961)
    {
        float _1977 = _1973 * 5.0;
        _1975 = as_type<int>(_1977);
    }
    int _1979 = _1975;
    if (_1961)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6525 = as_type<float>(_1979);
        out.gl_Position.z = _6525;
    }
    if (_1961)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1981 = -_1525;
    float _1983 = _1981 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1985 = -_1521;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1989 = -_1091;
    float _1991 = _1989 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1993 = _1983 * _1983;
    float _1995 = -_1927;
    float _1997 = _1537 + _1995;
    float _1999 = fma(_1987, _1987, _1993);
    float _2001 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2003 = -_1925;
    float _2005 = _1531 + _2003;
    float _2007 = fma(_1991, _1991, _1999);
    float _2009 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2011 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2013 = rsqrt(_2007);
    float _2015 = -_2001;
    float _2017 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2015);
    float _2019 = -_2009;
    float _2021 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2019);
    float _2023 = -_2011;
    float _2025 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2023);
    float _2027 = -_1933;
    float _2029 = _1475 + _2027;
    float _2031 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2035 = -_2031;
    float _2037 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2039 = -_2033;
    float _2041 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2039);
    float _2043 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2045 = _1987 * _2013;
    float _2047 = _1991 * _2013;
    float _2049 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2051 = _1983 * _2013;
    float _2053 = _2045 * _2045;
    float _2055 = fma(_2047, _2047, _2053);
    float _2057 = rsqrt(_2055);
    float _2059 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2061 = -_2043;
    float _2063 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2061);
    float _2065 = -_2059;
    float _2067 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2065);
    float _2069 = -_2049;
    float _2071 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2069);
    float _2073 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2063);
    float _2075 = _2047 * _2057;
    float _2077 = _2045 * _2057;
    float _2079 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2071);
    float _2081 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2083 = -_2075;
    float _2085 = _2047 * _2083;
    float _2087 = -_2075;
    float _2089 = _2051 * _2087;
    float _2091 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2093 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2095 = -_2085;
    float _2097 = fma(_2045, _2077, _2095);
    float _2099 = _2051 * _2077;
    float _2101 = -_2091;
    float _2103 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2101);
    float _2105 = -_2093;
    float _2107 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2105);
    float _2109 = _2097 * _2097;
    float _2111 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2107);
    float _2113 = fma(_2099, _2099, _2109);
    float _2115 = -_2081;
    float _2117 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2115);
    float _2119 = 1.0 / _500;
    float _2121 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2103);
    float _2123 = fma(_2089, _2089, _2113);
    float _2125 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2117);
    float _2127 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2129 = -_2125;
    float _2131 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2121);
    float _2133 = rsqrt(_2123);
    float _2135 = -_2127;
    float _2137 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2135);
    float _2139 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2141 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2137);
    float _2143 = -_2139;
    float _2145 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2143);
    float _2147 = 1.0 / _2131;
    float _2149 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2145);
    float _2151 = _2097 * _2133;
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2157 = -_2153;
    float _2159 = _2157 + 1.0;
    float _2161 = -_2155;
    float _2163 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2161);
    float _2165 = fma(_2141, _2147, -1.0);
    float _2167 = _2159 * _2147;
    float _2169 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2163);
    float _2171 = fma(_2159, _2165, 1.0);
    float _2173 = _2149 * _2167;
    float _2175 = _2169 * _2167;
    float _2177 = 1.0 / _498;
    float _2179 = _2171 * _2171;
    float _2181 = fma(_2173, _2173, _2179);
    float _2183 = fma(_2175, _2175, _2181);
    float _2185 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2187 = rsqrt(_2183);
    float _2189 = _2175 * _2187;
    float _2191 = _2173 * _2187;
    float _2193 = _2171 * _2187;
    float _2195 = -_2189;
    float _2197 = _2045 * _2195;
    float _2199 = -_2191;
    float _2201 = _2051 * _2199;
    float _2203 = _2047 * _2193;
    float _2205 = 1.0 / _496;
    float _2207 = -_2191;
    float _2209 = -_2197;
    float _2211 = fma(_2047, _2207, _2209);
    float _2213 = -_2201;
    float _2215 = fma(_2045, _2193, _2213);
    float _2217 = -_2189;
    float _2219 = -_2203;
    float _2221 = fma(_2051, _2217, _2219);
    float _2223 = _2211 * _2211;
    float _2225 = fma(_2221, _2221, _2223);
    float _2227 = fma(_2215, _2215, _2225);
    float _2229 = rsqrt(_2227);
    float _2231 = _2221 * _2229;
    float _2233 = _2215 * _2229;
    float _2235 = _2211 * _2229;
    float _2237 = _2047 * _2231;
    float _2239 = _2051 * _2233;
    float _2241 = -_2237;
    float _2243 = fma(_2045, _2233, _2241);
    float _2245 = _2045 * _2235;
    float _2247 = -_2239;
    float _2249 = fma(_2047, _2235, _2247);
    float _2251 = _2243 * _2243;
    float _2253 = -_2245;
    float _2255 = fma(_2051, _2231, _2253);
    float _2257 = fma(_2249, _2249, _2251);
    float _2259 = fma(_2255, _2255, _2257);
    float _2261 = _1997 * _1997;
    float _2263 = fma(_2005, _2005, _2261);
    float _2265 = rsqrt(_2259);
    float _2267 = fma(_2029, _2029, _2263);
    float _2269 = sqrt(_2267);
    float _2271 = _2255 * _2265;
    float _2273 = _2249 * _2265;
    float _2275 = _2243 * _2265;
    float _2277 = in.m_73.x;
    float _2279 = in.m_73.y;
    float _2281 = in.m_73.z;
    float _2283 = _2045 * _2271;
    float _2285 = _2047 * _2275;
    float _2287 = _2051 * _2273;
    float _2289 = -_2283;
    float _2291 = fma(_2047, _2273, _2289);
    float _2293 = -_2285;
    float _2295 = fma(_2051, _2271, _2293);
    float _2297 = -_2287;
    float _2299 = fma(_2045, _2275, _2297);
    float _2301 = _2291 * _2291;
    float _2303 = fma(_2295, _2295, _2301);
    float _2305 = fma(_2299, _2299, _2303);
    float _2307 = _1889 * _2269;
    float _2309 = rsqrt(_2305);
    float _2311 = _2177 * _2279;
    float _2313 = _2205 * _2277;
    float _2315 = _2307 * _2185;
    float _2317 = _1487 * _2307;
    float _2319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2311);
    float _2321 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2323 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2313);
    float _2325 = _2119 * _2281;
    float _2327 = _2319 * _2315;
    float _2329 = _2307 * _2321;
    float _2331 = _2323 * _2317;
    float _2333 = _2327 * _2273;
    float _2335 = _2295 * _2309;
    float _2337 = _2325 * _2329;
    float _2339 = _2327 * _2275;
    float _2341 = _2291 * _2309;
    float _2343 = fma(_2331, _2335, _2333);
    float _2345 = _2299 * _2309;
    float _2347 = _2327 * _2271;
    float _2349 = fma(_2331, _2341, _2339);
    float _2351 = fma(_2045, _2337, _2343);
    float _2353 = fma(_2331, _2345, _2347);
    float _2355 = fma(_2051, _2337, _2349);
    float _2357 = _1521 + _2351;
    float _2359 = fma(_2047, _2337, _2353);
    float _2361 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2363 = _2357 * 0.20000000298023223876953125;
    float _2365 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2367 = fma(_2351, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2361);
    float _2369 = floor(_2363);
    float _2371 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2373 = fma(_2351, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2365);
    float _2375 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2367);
    float _2377 = _1525 + _2355;
    float _2379 = fma(_2351, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2371);
    float _2381 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2373);
    float _2383 = _2375 * 64.0;
    float _2385 = _1091 + _2359;
    float _2387 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2379);
    float _2389 = _2381 * 49.0;
    float _2391 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2393 = _2385 * 0.20000000298023223876953125;
    float _2395 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2397 = _2387 * 64.0;
    float _2399 = fma(_2389, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2391);
    float _2401 = -_2369;
    float _2403 = _2363 + _2401;
    float _2405 = floor(_2393);
    float _2407 = fma(_2389, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2395);
    float _2409 = fma(_2397, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2399);
    float _2411 = _2403 * 6.283185482025146484375;
    float _2413 = fma(_2397, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2407);
    float _2415 = _2385 + _2409;
    float _2417 = _2411 * 0.15915493667125701904296875;
    float _2419 = _2357 + _2413;
    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2423 = _2415 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2427 = _2419 + _2425;
    float _2429 = _2423 * _2423;
    float _2431 = _2417 * 6.283185482025146484375;
    float _2433 = sin(_2431);
    float _2435 = -_2405;
    float _2437 = _2393 + _2435;
    float _2439 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2441 = fma(_2427, _2427, _2429);
    float _2443 = _2437 * 6.283185482025146484375;
    float _2445 = fma(_2389, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2439);
    float _2447 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2449 = sqrt(_2441);
    float _2451 = _2443 * 0.15915493667125701904296875;
    float _2453 = fma(_2397, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2445);
    float _2455 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2447);
    float _2457 = _2377 + _2453;
    float _2459 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2455);
    float _2461 = _2451 * 6.283185482025146484375;
    float _2463 = sin(_2461);
    bool _2465 = _2449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2467 = _2433 + _2463;
    float _2469 = fma(_2467, 0.20000000298023223876953125, _2457);
    float _2471 = _2383;
    float _2473 = _2453;
    float _2475 = _2445;
    float _2477 = _2307;
    float _2479 = _2311;
    if (!_2465)
    {
        _2471 = _2419;
    }
    float _2481 = _2471;
    float _2483 = _2481;
    if (!_2465)
    {
        _2473 = _2415;
    }
    float _2485 = _2473;
    float _2487 = _2485;
    if (!_2465)
    {
        _2475 = _2469;
    }
    float _2489 = _2475;
    bool _2491 = !_2465;
    float _2493 = _2489;
    if (!_2491)
    {
        float _2495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2499 = _2449 + _2497;
        float _2501 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2503 = rsqrt(_2441);
        float _2505 = _2499 * _2495;
        float _2507 = _2505 * 0.15915493667125701904296875;
        float _2509 = _2507 * 6.283185482025146484375;
        float _2511 = cos(_2509);
        float _2513 = _2507 * 6.283185482025146484375;
        float _2515 = sin(_2513);
        float _2517 = _2511 + (-1.0);
        float _2519 = fma(_2515, _2501, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2521 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2523 = _2503 * _2519;
        float _2525 = fma(_2469, _2511, _2521);
        float _2527 = fma(_2427, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2529 = fma(_2423, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2493 = _2525;
        _2483 = _2527;
        _2487 = _2529;
    }
    float _2531 = _2493;
    float _2533 = _2483;
    float _2535 = _2487;
    float _2537 = -_1525;
    float _2539 = _2537 + _2531;
    float _2541 = -_1521;
    float _2543 = _2541 + _2533;
    float _2545 = _2459 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2547 = -_1091;
    float _2549 = _2547 + _2535;
    float _2551 = _2539 * _2539;
    float _2553 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2555 = 1.0 / _2545;
    float _2557 = fma(_2543, _2543, _2551);
    float _2559 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2553);
    float _2561 = fma(_2549, _2549, _2557);
    float _2563 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2559);
    float _2565 = sqrt(_2561);
    float _2567 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2569 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2573 = _2569 || _2571;
    bool _2575 = isnan(0.5);
    bool _2577 = _2573 || _2575;
    float _2579 = _2567 + _2545;
    float _2581 = _2579 * _2555;
    float _2583 = _2581 * 0.5;
    bool _2585 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2589 = _2585 || _2587;
    bool _2591 = isnan(0.5);
    bool _2593 = _2589 || _2591;
    bool _2595 = _2565 > 0.0;
    float _2597 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2599 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2597);
    float _2601 = 1.0 / _2599;
    bool _2603 = !_2595;
    float _2605 = _2531;
    float _2607 = _2535;
    float _2609 = _2533;
    float _2611 = _2549;
    int _2613 = as_type<int>(_2583);
    if (!_2603)
    {
        float _2615 = _190 * _190;
        float _2617 = fma(_188, _188, _2615);
        float _2619 = rsqrt(_2561);
        float _2621 = fma(_192, _192, _2617);
        float _2623 = sqrt(_2621);
        float _2625 = _2543 * _2619;
        float _2627 = _2539 * _2619;
        float _2629 = _2549 * _2619;
        bool _2631 = _2623 > 0.0;
        bool _2633 = !_2631;
        _2613 = as_type<int>(_2623);
        if (!_2633)
        {
            float _2635 = rsqrt(_2621);
            float _2637 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2639 = _190 * _2635;
            float _2641 = _188 * _2635;
            float _2643 = _192 * _2635;
            float _2645 = _2627 * _2639;
            float _2647 = fma(_2625, _2641, _2645);
            float _2649 = _2637 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2651 = fma(_2629, _2643, _2647);
            float _2653 = _2651 * _2649;
            float _2655 = fma(_188, _2653, _2533);
            float _2657 = fma(_190, _2653, _2531);
            float _2659 = fma(_192, _2653, _2535);
            _2605 = _2657;
            _2607 = _2659;
            _2609 = _2655;
            _2611 = _2643;
            _2613 = as_type<int>(_2637);
        }
    }
    float _2661 = _2605;
    float _2663 = _2607;
    float _2665 = _2609;
    float _2667 = _2611;
    int _2669 = _2613;
    float _2671 = -_1927;
    float _2673 = _2671 + _2661;
    float _2675 = -_1933;
    float _2677 = _2675 + _2663;
    float _2679 = -_1925;
    float _2681 = _2679 + _2665;
    float _2683 = _2673;
    float _2685 = _2681;
    float _2687 = _2667;
    int _2689 = _2669;
    if (_2593)
    {
        _196 = 1.0;
    }
    float _2691 = _196;
    float _2693 = _2691;
    if (_2577)
    {
        _1963 = _2673;
    }
    float _2695 = _1963;
    float _2697 = _2695;
    if (_2577)
    {
        _2683 = _2677;
    }
    float _2699 = _2683;
    float _2701 = _2699;
    if (!_2577)
    {
        float _2703 = _1941 * _1941;
        float _2705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2707 = -_1091;
        float _2709 = _2707 + _2663;
        float _2711 = -_1521;
        float _2713 = _2711 + _2665;
        float _2715 = fma(_1949, _1949, _2703);
        float _2717 = -_1525;
        float _2719 = _2717 + _2661;
        float _2721 = fma(_1955, _1955, _2715);
        float _2723 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2725 = sqrt(_2721);
        float _2727 = 1.0 / _2307;
        float _2729 = precise::min(_2725, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2731 = _2729 * _2705;
        float _2733 = _2723 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2735 = _2731 * _2727;
        float _2737 = _2733 * _2735;
        float _2739 = _2709 * _2735;
        float _2741 = fma(_2713, _2737, _1937);
        float _2743 = fma(_2719, _2737, _1931);
        float _2745 = fma(_2733, _2739, _1945);
        _2477 = _2727;
        _2697 = _2743;
        _2685 = _2741;
        _2701 = _2745;
        _1965 = _2703;
        _1967 = _2725;
        _1175 = _2739;
    }
    float _2747 = _2477;
    float _2749 = _2697;
    float _2751 = _2685;
    float _2753 = _2701;
    float _2755 = _1965;
    float _2757 = _1967;
    float _2759 = _1175;
    float _2761 = _2759;
    float _2763 = _2747;
    float _2765 = _2757;
    float _2767 = _2755;
    if (_2593)
    {
        _2761 = 1.0;
    }
    float _2769 = _2761;
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2773 = _2601 * _2771;
    float _2775 = _2769;
    if (!_2593)
    {
        float _2777 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2779 = _2777 * 0.15915493667125701904296875;
        float _2781 = _2779 * 6.283185482025146484375;
        float _2783 = cos(_2781);
        float _2785 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2787 = _2785 * 0.15915493667125701904296875;
        float _2789 = _2779 * 6.283185482025146484375;
        float _2791 = sin(_2789);
        float _2793 = 1.0 / _2783;
        float _2795 = _2787 * 6.283185482025146484375;
        float _2797 = cos(_2795);
        float _2799 = _2791 * _2793;
        float _2801 = _2787 * 6.283185482025146484375;
        float _2803 = sin(_2801);
        float _2805 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2807 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2805;
        float _2809 = _2797 * _2799;
        float _2811 = 1.0 / _2807;
        float _2813 = 1.0 / _2809;
        float _2815 = _2803 * _2813;
        float _2817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2819 = fma(_2773, _2815, _2817);
        float _2821 = _2819 * _2811;
        float _2823 = precise::clamp(_2821, 0.0, 1.0);
        _2763 = _2779;
        _2765 = _2811;
        _2693 = _2823;
    }
    float _2825 = _2763;
    float _2827 = _2765;
    float _2829 = _2693;
    float _2831 = _2825;
    float _2833 = _2827;
    if (!_2593)
    {
        float _2835 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2837 = _2835 * 0.15915493667125701904296875;
        float _2839 = _2837 * 6.283185482025146484375;
        float _2841 = cos(_2839);
        float _2843 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2845 = _2843 * 0.15915493667125701904296875;
        float _2847 = _2837 * 6.283185482025146484375;
        float _2849 = sin(_2847);
        float _2851 = 1.0 / _2841;
        float _2853 = _2845 * 6.283185482025146484375;
        float _2855 = cos(_2853);
        float _2857 = _2849 * _2851;
        float _2859 = _2845 * 6.283185482025146484375;
        float _2861 = sin(_2859);
        float _2863 = _2855 * _2857;
        float _2865 = 1.0 / _2863;
        float _2867 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2869 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2867;
        float _2871 = 1.0 / _2869;
        float _2873 = _2861 * _2865;
        float _2875 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2877 = fma(_2773, _2873, _2875);
        float _2879 = _2877 * _2871;
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = -_2881;
        float _2885 = _2883 + 1.0;
        _2831 = _2851;
        _2775 = _2885;
    }
    float _2887 = _2831;
    float _2889 = _2775;
    float _2891 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2893 = _2749 + _2891;
    float _2895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2897 = _2751 + _2895;
    float _2899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2901 = _2753 + _2899;
    float _2903 = _2893 * _2893;
    float _2905 = fma(_2897, _2897, _2903);
    float _2907 = fma(_2901, _2901, _2905);
    float _2909 = rsqrt(_2907);
    float _2911 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2913 = _2897 * _2911;
    float _2915 = _2901 * _2911;
    float _2917 = _2913 * _2913;
    float _2919 = _2915 * _2915;
    float _2921 = _2917 + _2919;
    float _2923 = sqrt(_2921);
    bool _2925 = _2923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2929 = _2923 + _2927;
    float _2931 = _2901;
    float _2933 = _2921;
    float _2935 = _2929;
    float _2937 = _2893;
    if (_2925)
    {
        float _2939 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2931 = _2939;
    }
    float _2941 = _2931;
    if (_2925)
    {
        float _2943 = rsqrt(_2921);
        _2933 = _2943;
    }
    float _2945 = _2933;
    float _2947 = _2945;
    if (_2925)
    {
        float _2949 = _2929 * _2941;
        _2935 = _2949;
    }
    float _2951 = _2935;
    if (_2925)
    {
        float _2953 = _2951 * 0.15915493667125701904296875;
        _2767 = _2953;
    }
    float _2955 = _2767;
    float _2957 = _2909;
    if (_2925)
    {
        float _2959 = _2955 * 6.283185482025146484375;
        float _2961 = sin(_2959);
        _2957 = _2961;
    }
    float _2963 = _2957;
    float _2965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2967 = precise::max(0.0, _2965);
    float _2969 = _2887;
    float _2971 = _2967;
    float _2973 = _2965;
    if (_2925)
    {
        float _2975 = _2955 * 6.283185482025146484375;
        float _2977 = cos(_2975);
        _2969 = _2977;
    }
    float _2979 = _2969;
    float _2981 = -_2911;
    float _2983 = -_2967;
    float _2985 = fma(_2893, _2981, _2983);
    if (!_2925)
    {
        _2937 = _2915;
    }
    float _2987 = _2937;
    float _2989 = _2987;
    if (_2925)
    {
        float _2991 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2971 = _2991;
    }
    float _2993 = _2971;
    float _2995 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2997 = _2993;
    float _2999 = _2963;
    if (_2925)
    {
        float _3001 = fma(_2963, _2993, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2997 = _3001;
    }
    float _3003 = _2997;
    float _3005 = _3003;
    if (!_2925)
    {
        _2999 = _2913;
    }
    float _3007 = _2999;
    float _3009 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2995);
    float _3011 = _3007;
    float _3013 = _2979;
    if (_2925)
    {
        float _3015 = _2979 + (-1.0);
        _2973 = _3015;
    }
    float _3017 = _2973;
    if (_2925)
    {
        float _3019 = _2945 * _3003;
        _2687 = _3019;
    }
    float _3021 = _2687;
    if (!_2925)
    {
        _3005 = _2985;
    }
    float _3023 = _3005;
    float _3025 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3009);
    float _3027 = _3023;
    if (_2925)
    {
        float _3029 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2833 = _3029;
    }
    float _3031 = _2833;
    if (_2925)
    {
        float _3033 = _2913 * _3021;
        _3011 = _3033;
    }
    float _3035 = _3011;
    if (!_2925)
    {
        _2947 = _2917;
    }
    float _3037 = _2947;
    float _3039 = _3037;
    if (_2925)
    {
        float _3041 = _2915 * _3021;
        _2989 = _3041;
    }
    float _3043 = _2989;
    if (_2925)
    {
        float _3045 = fma(_2985, _2979, _3031);
        _3027 = _3045;
    }
    float _3047 = _3027;
    if (_2925)
    {
        float _3049 = _3035 * _3035;
        _3039 = _3049;
    }
    float _3051 = _3039;
    float _3053 = sqrt(_2907);
    if (!_2925)
    {
        _3013 = _2919;
    }
    float _3055 = _3013;
    float _3057 = _3055;
    if (_2925)
    {
        float _3059 = _3043 * _3043;
        _3057 = _3059;
    }
    float _3061 = _3057;
    float _3063 = fma(_3047, _3047, _3051);
    float _3065 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3067 = _3025 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3069 = _3063 + _3061;
    float _3071 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3065);
    float _3073 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3075 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3071);
    float _3077 = rsqrt(_3069);
    float _3079 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3081 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3073);
    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3085 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3083);
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = _3075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3091 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3079);
    float _3093 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3081);
    float _3095 = -_3087;
    float _3097 = _3095 + 1.0;
    float _3099 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3101 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3103 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3091);
    float _3105 = _3093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3107 = -_3101;
    float _3109 = fma(_3107, _3099, 1.0);
    float _3111 = _3103 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3113 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3115 = abs(_3097);
    float _3117 = log2(_3115);
    float _3119 = _3077 * _3035;
    float _3121 = _3077 * _3047;
    float _3123 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3113);
    float _3125 = _3077 * _3043;
    float _3127 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3129 = _3121 + 1.0;
    float _3131 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3123);
    float _3133 = log2(_3109);
    float _3135 = -_3127;
    float _3137 = fma(_3121, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3135);
    float _3139 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3131);
    float _3141 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3143 = -_3125;
    float _3145 = fma(_3143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3137);
    float _3147 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3149 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3151 = fma(_3145, -0.5, 0.5);
    float _3153 = 1.0 / _3139;
    float _3155 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3141);
    float _3157 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3155);
    float _3159 = _3133 * 0.693147182464599609375;
    float _3161 = exp2(_3149);
    float _3163 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3157);
    float _3165 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3167 = sqrt(_3151);
    float _3169 = fma(_3145, 0.5, 0.5);
    float _3171 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3147);
    float _3173 = _3163 * _3153;
    float _3175 = fma(_3169, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3177 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3171);
    float _3179 = -_3121;
    float _3181 = fma(_3161, _3129, _3179);
    float _3183 = fma(_3169, _3175, -0.212114393711090087890625);
    float _3185 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3177);
    float _3187 = fma(_3181, 0.5, 0.5);
    float _3189 = fma(_3169, _3183, 1.570728778839111328125);
    float _3191 = _3185 * _3153;
    float _3193 = fma(_3173, 0.5, 0.5);
    float _3195 = _3167 * 0.636619746685028076171875;
    float _3197 = fma(_3191, -0.5, 0.5);
    float _3199 = -_3189;
    float _3201 = fma(_3195, _3199, 1.0);
    float3 _8451 = float3(_3193, _3197, _3165);
    float _3203 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8451, float3(0.0), isnan(_8451)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8451, float3(0.0), isnan(_8451)), level(0.0)).x;
    float3 _8462 = float3(_3193, _3197, _3165);
    float4 _3206 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8462, float3(0.0), isnan(_8462)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8462, float3(0.0), isnan(_8462)), level(0.0)).xyzw;
    float _3208 = _3206.x;
    float _3210 = _3206.y;
    float _3212 = _3206.z;
    float _3214 = _3206.w;
    float2 _8479 = float2(_3201, _3187);
    float3 _3218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8479, float2(0.0), isnan(_8479)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8479, float2(0.0), isnan(_8479)), level(0.0)).xyz;
    float _3220 = _3218.x;
    float _3222 = _3218.y;
    float _3224 = _3218.z;
    float _3226 = in.m_75.y;
    bool _3228 = _2311 != 0.0;
    bool _3230 = isnan(_2311);
    bool _3232 = _3228 || _3230;
    bool _3234 = isnan(0.0);
    bool _3236 = _3232 || _3234;
    float _3238 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3240 = in.m_75.z;
    bool _3242 = _2313 == 0.0;
    bool _3244 = !_3236;
    bool _3246 = _3242 && _3244;
    float _3248 = in.m_75.x;
    bool _3250 = _2325 == 0.0;
    bool _3252 = _3250 && _3246;
    float _3254 = exp2(_3238);
    out.m_61.x = _476;
    out.m_61.y = _486;
    out.m_61.z = _488;
    out.m_61.w = _484;
    out.m_71.w = _1921;
    out.m_77.x = _2335;
    out.m_77.y = _2341;
    out.m_77.z = _2345;
    int _3256 = as_type<int>(_3193);
    float _3258 = _3105;
    if (_3252)
    {
        float _3260 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3226);
        _2689 = as_type<int>(_3260);
    }
    int _3262 = _2689;
    int _3264 = _3262;
    if (!_3252)
    {
        float _3266 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3226);
        _3264 = as_type<int>(_3266);
    }
    int _3268 = _3264;
    if (_3252)
    {
        _2479 = _3226;
    }
    float _3270 = _2479;
    float _3272 = -_3254;
    float _3274 = _3272 + 1.0;
    float _3276 = _3270;
    if (_3252)
    {
        float _3278 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3240);
        _3256 = as_type<int>(_3278);
    }
    int _3280 = _3256;
    int _3282 = _3280;
    if (!_3252)
    {
        float _3284 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3240);
        _3282 = as_type<int>(_3284);
    }
    int _3286 = _3282;
    bool _3288 = !_3252;
    float _3290 = _3288 ? as_type<float>(_3268) : _3226;
    float _3292 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_3252)
    {
        _3276 = as_type<float>(_3268);
    }
    float _3294 = _3276;
    float _3296 = _3248;
    if (!_3252)
    {
        float _3298 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3248);
        _3296 = _3298;
    }
    float _3300 = _3296;
    bool _3302 = !_3252;
    float _3304 = _3302 ? as_type<float>(_3286) : _3240;
    float _3306 = _3290 * _3290;
    float _3308 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3292);
    if (_3252)
    {
        _3258 = _3240;
    }
    float _3310 = _3258;
    out.m_79.x = _2751;
    out.m_79.y = _2749;
    out.m_79.z = _2753;
    float _3312 = fma(_3304, _3304, _3306);
    float _3314 = _3310;
    if (!_3252)
    {
        _3314 = as_type<float>(_3286);
    }
    float _3316 = _3314;
    float _3318 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3308);
    float _3320 = _3139 * 0.5;
    bool _3322 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3324 = isnan(_3053);
    bool _3326 = _3322 || _3324;
    bool _3328 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3330 = _3326 || _3328;
    out.m_81.x = _1937;
    out.m_81.y = _1931;
    out.m_81.z = _1945;
    float _3332 = rsqrt(_3312);
    float _3334 = fma(_3185, -0.5, _3320);
    if (!_3330)
    {
        _1969 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3336 = _1969;
    float _3338 = _3336;
    float _3340 = _3336;
    if (!_3330)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3342 = _1971;
    float _3344 = _3290 * _3332;
    float _3346 = _3304 * _3332;
    float _3348 = -_2051;
    float _3350 = _3344 * _3348;
    float _3352 = -_2047;
    float _3354 = _3344 * _3352;
    float _3356 = -_2045;
    float _3358 = _3344 * _3356;
    float _3360 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3318);
    float _3362 = fma(_3346, _2275, _3350);
    float _3364 = fma(_3346, _2271, _3354);
    float _3366 = _2273 * _3294;
    float _3368 = fma(_3346, _2273, _3358);
    float _3370 = _2275 * _3294;
    float _3372 = _2271 * _3294;
    float _3374 = fma(_2335, _3300, _3366);
    float _3376 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3368;
    out.m_83.y = _3362;
    out.m_83.z = _3364;
    float _3378 = fma(_2345, _3300, _3372);
    float _3380 = fma(_2341, _3300, _3370);
    float _3382 = _3360 + _3139;
    float _3384 = _3163 + _3139;
    out.gl_Position.x = _3163;
    out.gl_Position.y = _3185;
    out.gl_Position.z = _3360;
    out.gl_Position.w = _3139;
    float _3386 = _3382 * 0.5;
    float _3388 = _3384 * 0.5;
    float _3390 = _2829 * _2889;
    float _3392 = fma(_2047, _3316, _3378);
    float _3394 = fma(_2045, _3316, _3374);
    float _3396 = fma(_2051, _3316, _3380);
    out.m_85.x = _3388;
    out.m_85.y = _3334;
    out.m_85.z = _3386;
    out.m_85.w = _3139;
    float _3398 = _3390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3400 = _3390;
    float _3402 = _3342;
    float _3404 = _3342;
    if (!_3330)
    {
        _3400 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3406 = _3400;
    out.m_87.x = _3394;
    out.m_87.y = _3396;
    out.m_87.z = _3392;
    float _3408 = _3376 * _3203;
    float _3410 = -_3376;
    float _3412 = _3410 + 1.0;
    float _3414 = _3214 * _3408;
    float _3416 = _3224 * _3408;
    float _3418 = fma(_3220, _3414, _3208);
    float _3420 = fma(_3222, _3414, _3210);
    float _3422 = _3214 * _3412;
    float _3424 = fma(_3214, _3416, _3212);
    out.m_89.x = _3418;
    out.m_89.y = _3420;
    out.m_89.z = _3424;
    out.m_89.w = _3422;
    bool _3426 = !_3330;
    float _3428 = _3406;
    float _3430 = _3406;
    if (!_3426)
    {
        bool _3432 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3434 = isnan(_3053);
        bool _3436 = _3432 || _3434;
        bool _3438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3440 = _3436 || _3438;
        if (!_3440)
        {
            float _3442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3444 = _3053 + _3442;
            float _3446 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3448 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3446;
            float _3450 = 1.0 / _3448;
            float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3458 = _3456 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3460 = _3444 * _3450;
            float _3462 = precise::clamp(_3460, 0.0, 1.0);
            float _3464 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3466 = _3464 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3468 = fma(_3462, _3458, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3470 = fma(_3462, _3466, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3472 = fma(_3462, _3454, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3404 = _3472;
            _3340 = _3470;
            _3430 = _3468;
            _3474 = true;
        }
        else
        {
            bool _3476 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3478 = isnan(_3053);
            bool _3480 = _3476 || _3478;
            bool _3482 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3484 = _3480 || _3482;
            if (!_3484)
            {
                _3338 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3486 = _3338;
            _3340 = _3486;
            if (!_3484)
            {
                _3402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3488 = _3402;
            _3404 = _3488;
            if (!_3484)
            {
                _3428 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3490 = _3428;
            bool _3492 = !_3484;
            _3430 = _3490;
            if (!_3492)
            {
                bool _3494 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3496 = isnan(_3053);
                bool _3498 = _3494 || _3496;
                bool _3500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3502 = _3498 || _3500;
                if (!_3502)
                {
                    float _3504 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3506 = _3053 + _3504;
                    float _3508 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3510 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3508;
                    float _3512 = 1.0 / _3510;
                    float _3514 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3518 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3520 = _3518 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3522 = _3506 * _3512;
                    float _3524 = precise::clamp(_3522, 0.0, 1.0);
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3530 = fma(_3524, _3520, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3532 = fma(_3524, _3528, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3534 = fma(_3524, _3516, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3404 = _3534;
                    _3340 = _3532;
                    _3430 = _3530;
                    _3474 = true;
                }
                else
                {
                    _3404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3340 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3430 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3474 = false;
    float _3536 = _3404;
    float _3538 = _3340;
    float _3540 = _3430;
    float _3542 = _3398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _3544 = _3536 * 0.586610972881317138671875;
    bool _3546 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3542;
    float _3548 = fma(_3538, 0.298911988735198974609375, _3544);
    bool _3550 = _2829 > 0.0;
    bool _3552 = isnan(_2829);
    bool _3554 = _3550 || _3552;
    bool _3556 = isnan(0.0);
    bool _3558 = _3554 || _3556;
    float _3560 = fma(_3540, 0.114477999508380889892578125, _3548);
    bool _3562 = _2889 <= 0.0;
    bool _3564 = !_3558;
    bool _3566 = _3562 || _3564;
    float _3568 = -_3560;
    float _3570 = _3568 + _3538;
    float _3572 = -_3560;
    float _3574 = _3572 + _3536;
    float _3576 = -_3560;
    float _3578 = _3576 + _3540;
    float _3580 = fma(_3570, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3582 = fma(_3574, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3584 = fma(_3578, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    bool _3586 = !_3546;
    if (!_3586)
    {
        float _3588 = -_2749;
        float _3590 = _3588 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3592 = -_2751;
        float _3594 = _3592 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3596 = -_2753;
        float _3598 = _3596 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3600 = _3590 * _3590;
        float _3602 = fma(_3594, _3594, _3600);
        float _3604 = fma(_3598, _3598, _3602);
        float _3606 = sqrt(_3604);
        float _3608 = rsqrt(_3604);
        float _3610 = -_3606;
        float _3612 = _3610 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3614 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3616 = precise::clamp(_3614, 0.0, 1.0);
        float _3618 = _3594 * _3608;
        float _3620 = _3590 * _3608;
        float _3622 = abs(_3616);
        float _3624 = log2(_3622);
        float _3626 = _3598 * _3608;
        float _3628 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3630 = _3396 * _3620;
        float _3632 = -_3620;
        float _3634 = -_3628;
        float _3636 = fma(_3632, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3634);
        float _3638 = fma(_3394, _3618, _3630);
        float _3640 = -_3626;
        float _3642 = fma(_3640, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3636);
        float _3644 = fma(_3392, _3626, _3638);
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3650 = _3642 + _3648;
        float _3652 = _3624 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3654 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3656 = precise::clamp(_3654, 0.0, 1.0);
        float _3658 = exp2(_3652);
        float _3660 = _3658 * _3656;
        float _3662 = _3646 * _3660;
        float _3664 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3666 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3668 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3664;
        out.m_91.y = _3666;
        out.m_91.z = _3668;
    }
    out.m_93.x = _3580;
    out.m_93.y = _3582;
    out.m_93.z = _3584;
    if (!_3566)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3670 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3670;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3474 = false;
    bool _520 = false;
    bool _374 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_44.w;
    float _109 = in.m_46.w;
    float _111 = trunc(_107);
    int _114 = int(_111);
    float _116 = -_109;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _118;
    bool _122 = _114 >= 1;
    float _124 = 0.0;
    float _126 = as_type<float>(_114);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3738 = as_type<float>(_134);
        out.gl_Position.z = _3738;
    }
    if (!_122)
    {
        return out;
    }
    bool _138 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_109);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = in.m_53.x;
    float _150 = float(_114);
    bool _152 = _118 >= _150;
    bool _154 = !_146;
    bool _156 = _152 || _154;
    if (_156)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _126;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _136 = as_type<int>(_160);
    }
    int _162 = _136;
    out.m_55.x = _148;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3797 = as_type<float>(_162);
        out.gl_Position.z = _3797;
    }
    if (_156)
    {
        return out;
    }
    float _164 = in.m_57.x;
    float _166 = in.m_57.y;
    float _168 = in.m_57.z;
    float _170 = 1.0 / _150;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _118 * _170;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_172;
    float _196 = _188;
    float _212;
    if (!_194)
    {
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _174;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _216 + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _258 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_216);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = -_232;
    float _272 = _270 + 1.0;
    float _274 = 1.0 / _256;
    float _276 = _268 * _272;
    float _278 = -_268;
    float _280 = _278 + 1.0;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _282;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _252;
    float _290 = _248 * _280;
    float _292 = -_248;
    float _294 = _292 + 1.0;
    float _296 = _236 * _274;
    float _298 = _220 * _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = fma(_284, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = fma(_306, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _314 = _308 * _290;
    float _316 = _310 * _290;
    float _318 = _312 * _290;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].x, _314);
    float _334 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _336 = fma(_322, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_326, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _340 = fma(_330, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _342 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].z, _318);
    float _344 = fma(_336, _276, _332);
    float _346 = fma(_338, _276, _334);
    float _348 = fma(_340, _276, _342);
    float _350 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].x, _344);
    float _352 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].y, _346);
    float _354 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].z, _348);
    bool _356 = !_286;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        _372 = _174;
    }
    _374 = false;
    float _376 = _372;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _380 = _376 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _386 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = isnan(_376);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _402 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _404 = isnan(_376);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _414;
    bool _418 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _420 = isnan(_376);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = 1.0 / _384;
    float _432 = -_396;
    float _434 = _432 + 1.0;
    bool _436 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _438 = _412 * _434;
    float _440 = -_412;
    float _442 = _440 + 1.0;
    float _444 = 1.0 / _400;
    float _446 = _416 * _430;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _452 = fma(_446, _380, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _454 = _450 * _444;
    float _456 = _452 * _438;
    float _458 = -_428;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _464 = _376 + _462;
    float _466 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _468 = _396 * _460;
    float _470 = fma(_454, _464, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _474 = fma(_470, _468, _466);
    float _476 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _478 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[117].x, _474);
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _484 = _478 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _486 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = in.m_59.x;
    float _492 = in.m_59.y;
    float _494 = in.m_59.z;
    out.m_61.x = _476;
    out.m_61.y = _486;
    out.m_61.z = _488;
    out.m_61.w = _484;
    float _496 = _350 * _490;
    float _498 = _352 * _492;
    float _500 = _354 * _494;
    bool _502 = !_436;
    float _518;
    if (!_502)
    {
        float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _506 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[11].w, _118);
        float _510 = _508 * _504;
        float _512 = floor(_510);
        float _514 = -_512;
        float _516 = _510 + _514;
        _518 = _516;
        _520 = true;
    }
    else
    {
        _518 = _174;
    }
    _520 = false;
    float _522 = _518;
    float _524 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _526 = int(_524);
    float _528 = in.m_63.y;
    float _530 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _532 = in.m_63.x;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _536 = _534 != 0;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _540 = int(_538);
    float _542 = in.m_53.z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _550 = _548 != 0;
    float _552 = float(_526);
    float _554 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _556 = int(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = float(_540);
    float _564 = 1.0 / _552;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _570 = 0.0;
    float _572 = _528;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _576 = _532;
    if (!_536)
    {
        _570 = _532;
    }
    float _578 = _570;
    float _580 = float(uint(_556));
    float _582 = 1.0 / _562;
    int _584 = ~_556;
    int _586 = _584 + 1;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _592 = _542 > 0.5;
    float _594 = _118 * _564;
    float _596 = 1.0 / _580;
    float _598 = trunc(_594);
    int _600 = int(_598);
    float _602 = _118 * _582;
    int _604 = ~_556;
    int _606 = _604 + 1;
    float _608 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _610 = int(_608);
    int _612 = as_type<int>(_596) + (-2);
    float _614 = float(uint(_600));
    float _616 = trunc(_602);
    int _618 = int(_616);
    float _620 = as_type<float>(_612) * _614;
    float _622 = float(uint(_610));
    float _624 = trunc(_620);
    float _626 = precise::max(_624, 0.0);
    uint _629 = uint(_626);
    float _631 = 1.0 / _622;
    float _633 = float(uint(_618));
    int _635 = ~_610;
    int _637 = _635 + 1;
    int _639 = _606 * int(_629);
    int _641 = _639 + _600;
    float _643 = in.m_53.y;
    float _645 = 1.0 / _560;
    int _647 = as_type<int>(_631) + (-2);
    float _649 = 1.0 / _590;
    float _651 = as_type<float>(_647) * _633;
    float _653 = float(uint(_641));
    float _655 = trunc(_651);
    float _657 = precise::max(_655, 0.0);
    uint _659 = uint(_657);
    float _661 = as_type<float>(_612) * _653;
    bool _663 = _643 > 0.5;
    float _665 = trunc(_661);
    float _667 = precise::max(_665, 0.0);
    uint _669 = uint(_667);
    float _671 = _643 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _673 = _637 * int(_659);
    int _675 = _673 + _618;
    float _677 = float(uint(_675));
    int _679 = int(_629) + int(_669);
    float _681 = -_528;
    float _683 = _681 + 1.0;
    float _685 = as_type<float>(_647) * _677;
    int _687 = as_type<int>(_677);
    bool _689 = _663;
    float _691 = _578;
    if (_536)
    {
        float _693 = -_532;
        float _695 = _693 + 1.0;
        _687 = as_type<int>(_695);
    }
    int _697 = _687;
    int _699 = _663 ? as_type<int>(_683) : as_type<int>(_528);
    float _701 = trunc(_685);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    if (_536)
    {
        bool _707 = _148 > 0.5;
        _689 = _707;
    }
    bool _709 = _689;
    float _711 = _550 ? as_type<float>(_699) : _528;
    if (_536)
    {
        float _713 = _709 ? as_type<float>(_697) : _532;
        _691 = _713;
    }
    float _715 = _691;
    int _717 = ~_610;
    int _719 = _717 + 1;
    if (_546)
    {
        float _721 = _592 ? _683 : _528;
        _572 = _721;
    }
    float _723 = _572;
    int _725 = _586 * _679;
    int _727 = _725 + _600;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _739 = _737 != 0;
    int _741 = int(_659) + int(_705);
    bool _743 = uint(_727) >= uint(_556);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _747 = _745 != 0;
    int _749 = _719 * _741;
    int _751 = _749 + _618;
    bool _753 = !_735;
    int _755 = _753 ? 0 : 1;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _759 = _757 != 0;
    bool _761 = !_747;
    int _763 = _761 ? 0 : 1;
    bool _765 = !_743;
    int _767 = _765 ? 0 : (-1);
    bool _769 = !_739;
    int _771 = _769 ? 0 : 1;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _787 = _785 != 0;
    bool _789 = !_731;
    int _791 = _789 ? 0 : 1;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _795 = _793 != 0;
    bool _797 = uint(_751) >= uint(_610);
    float _799 = in.m_44.x;
    float _801 = in.m_44.y;
    float _803 = in.m_44.z;
    bool _805 = !_779;
    int _807 = _805 ? 0 : 1;
    bool _809 = !_797;
    int _811 = _809 ? 0 : (-1);
    bool _813 = !_775;
    int _815 = _813 ? 0 : 1;
    bool _817 = !_783;
    int _819 = _817 ? 0 : 1;
    if (_795)
    {
        _574 = 1.0;
    }
    float _821 = _574;
    float _823 = _821;
    if (!_795)
    {
        _823 = 7.345489978790283203125;
    }
    float _825 = _823;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _833 = _831 != 0;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _837 = _835 != 0;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _841 = _839 != 0;
    float _843 = -_566;
    float _845 = fma(_530, 2.0, _843);
    float _847 = _825 * _148;
    float _849 = 0.0;
    if (_795)
    {
        _849 = _148;
    }
    float _851 = _849;
    float _853 = fma(_671, -2.0, _568);
    float _855 = 0.0;
    float _857 = _851;
    if (_795)
    {
        _855 = 1.0;
    }
    float _859 = _855;
    float _861 = floor(_847);
    float _863 = _859;
    if (!_795)
    {
        _857 = _643;
    }
    float _865 = _857;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _867;
    if (!_795)
    {
        _863 = 1.2345600128173828125;
    }
    float _871 = _863;
    float _873 = _801 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _875 = float(_556);
    float _877 = _801 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _879 = float(_600);
    float _881 = _865 * _871;
    float _883 = _801 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _885 = _869 * _645;
    bool _887 = _879 >= _875;
    bool _889 = isnan(_879);
    bool _891 = _887 || _889;
    bool _893 = isnan(_875);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].x, _873);
    float _901 = floor(_881);
    float _903 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].x, _877);
    float _905 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].x, _883);
    float _907 = float(_610);
    float _909 = -_861;
    float _911 = _847 + _909;
    float _913 = float(_618);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _917 = _522 + _915;
    int _919 = ~_679;
    int _921 = _919 + _767;
    int _923 = _921 + 1;
    float _925 = trunc(_897);
    int _927 = int(_925);
    bool _929 = _913 >= _907;
    bool _931 = isnan(_913);
    bool _933 = _929 || _931;
    bool _935 = isnan(_907);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = _911 * _875;
    float _943 = fma(_885, _917, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _945 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[4].z, _899);
    float _947 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _949 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[6].z, _905);
    bool _951 = !_787;
    int _953 = _951 ? 0 : 1;
    float _955 = trunc(_939);
    int _957 = int(_955);
    int _959 = _556 * _923;
    int _961 = _959 + _600;
    bool _963 = _556 == 0;
    float _965 = -_901;
    float _967 = _881 + _965;
    int _969 = ~_741;
    int _971 = _969 + _811;
    int _973 = _971 + 1;
    float _975 = _174 * _875;
    bool _977 = !_963;
    int _979 = _977 ? _961 : (-1);
    float _981 = _174 * _907;
    float _983 = trunc(_941);
    int _985 = int(_983);
    int _987 = ~_927;
    int _989 = _987 + 1;
    int _991 = _989 + 1;
    float _993 = _967 * _907;
    bool _995 = !_833;
    int _997 = _995 ? 0 : 1;
    int _999 = _610 * _973;
    int _1001 = _999 + _618;
    bool _1003 = _610 == 0;
    int _1005 = _979 * _991;
    int _1007 = _556 + (-1);
    float _1009 = trunc(_975);
    int _1011 = int(_1009);
    int _1013 = ~_957;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1023 = !_1003;
    int _1025 = _1023 ? _1001 : (-1);
    int _1027 = _927 * _1007;
    int _1029 = _1027 + _1005;
    int _1031 = abs(_763);
    float _1033 = _1021 * _649;
    int _1035 = abs(_755);
    float _1037 = trunc(_993);
    int _1039 = int(_1037);
    int _1041 = _1025 * _1017;
    int _1043 = _610 + (-1);
    int _1045 = _985 * _1031;
    int _1047 = _1045 + _600;
    int _1049 = abs(_791);
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1053 = _522 + _1051;
    int _1055 = abs(_815);
    int _1057 = _1029 * _1035;
    float _1059 = trunc(_981);
    int _1061 = int(_1059);
    bool _1063 = !_759;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = _957 * _1043;
    int _1069 = _1067 + _1041;
    int _1071 = abs(_807);
    int _1073 = _1011 * _1049;
    int _1075 = _1073 + _1057;
    int _1077 = abs(_771);
    float _1079 = fma(_1033, _1053, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1081 = abs(_1065);
    int _1083 = _1069 * _1071;
    int _1085 = abs(_997);
    float _1087 = -_118;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[76].x, _845);
    float _1091 = _949 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1093 = _1039 * _1085;
    int _1095 = _1093 + _618;
    int _1097 = abs(_819);
    int _1099 = _1061 * _1055;
    int _1101 = _1099 + _1083;
    int _1103 = abs(_953);
    int _1105 = _1047 * _1077;
    int _1107 = _1105 + _1075;
    int _1109 = _1095 * _1097;
    int _1111 = _1109 + _1101;
    float _1113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1115 = _985 * _1081;
    int _1117 = _1115 + _1107;
    bool _1119 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1121 = isnan(_522);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1133 = _1039 * _1103;
    int _1135 = _1133 + _1111;
    float _1137 = float(uint(_1117));
    float _1139 = -_1129;
    float _1141 = _1139 + 1.0;
    bool _1143 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1145 = isnan(_522);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1157 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1159 = isnan(_522);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = as_type<float>(_612) * _1137;
    int _1171 = _1061;
    float _1173 = _1167;
    float _1175 = _1091;
    if (_795)
    {
        _1171 = 0;
    }
    int _1177 = _1171;
    float _1179 = _1153 * _1141;
    float _1181 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1155);
    float _1183 = -_1153;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _853);
    int _1189 = _1177;
    if (!_795)
    {
        _1189 = 2;
    }
    int _1191 = _1189;
    float _1193 = trunc(_1169);
    float _1195 = precise::max(_1193, 0.0);
    uint _1197 = uint(_1195);
    float _1199 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1181);
    float _1201 = _1167 * _1185;
    float _1203 = float(uint(_1135));
    bool _1205 = _1191 != 2;
    float _1207 = _943 * _1201;
    int _1209 = ~_556;
    int _1211 = _1209 + 1;
    float _1213 = -_1187;
    float _1215 = fma(_1199, _1131, _1213);
    float _1217 = as_type<float>(_647) * _1203;
    float _1219 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1221 = as_type<int>(_1113);
    if (_837)
    {
        float _1223 = -_532;
        float _1225 = _1223 + 1.0;
        _1221 = as_type<int>(_1225);
    }
    int _1227 = _1221;
    bool _1229 = _643 > 0.5;
    float _1231 = fma(_1219, _723, -0.5);
    float _1233 = trunc(_1217);
    float _1235 = precise::max(_1233, 0.0);
    uint _1237 = uint(_1235);
    int _1239 = _1211 * int(_1197);
    int _1241 = _1239 + _1117;
    float _1243 = -_1167;
    float _1245 = _1243 + 1.0;
    if (_1205)
    {
        _1173 = _148;
    }
    float _1247 = _1173;
    float _1249 = _1247;
    if (!_1205)
    {
        _1249 = _542;
    }
    float _1251 = _1249;
    float _1253 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1207);
    float _1255 = float(uint(_1241));
    if (_837)
    {
        float _1257 = _1229 ? as_type<float>(_1227) : _532;
        _576 = _1257;
    }
    float _1259 = _576;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1263 = as_type<float>(_612) * _1255;
    float _1265 = fma(_1079, _1179, _1253);
    int _1267 = ~_610;
    int _1269 = _1267 + 1;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1273 = trunc(_1263);
    float _1275 = precise::max(_1273, 0.0);
    uint _1277 = uint(_1275);
    float _1279 = float(uint(_1047));
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1283 = _1269 * int(_1237);
    int _1285 = _1283 + _1135;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1289 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1271);
    float _1291 = as_type<float>(_612) * _1279;
    float _1293 = _1271;
    if (_1205)
    {
        _1293 = _643;
    }
    float _1295 = _1293;
    float _1297 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1281);
    float _1299 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1287);
    float _1301 = float(uint(_1285));
    float _1303 = trunc(_1291);
    float _1305 = precise::max(_1303, 0.0);
    uint _1307 = uint(_1305);
    float _1309 = _1295;
    if (!_1205)
    {
        _1309 = _148;
    }
    float _1311 = _1309;
    float _1313 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1315 = float(uint(_1095));
    float _1317 = as_type<float>(_647) * _1301;
    int _1319 = ~_556;
    int _1321 = _1319 + 1;
    float _1323 = fma(_1313, _1259, -0.5);
    float _1325 = as_type<float>(_647) * _1315;
    int _1327 = int(_1197) + int(_1277);
    float _1329 = trunc(_1317);
    float _1331 = precise::max(_1329, 0.0);
    uint _1333 = uint(_1331);
    float _1335 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1337 = ~_556;
    int _1339 = _1337 + 1;
    float _1341 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1297);
    float _1343 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1345 = _1321 * int(_1307);
    int _1347 = _1345 + _1047;
    float _1349 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1351 = trunc(_1325);
    float _1353 = precise::max(_1351, 0.0);
    uint _1355 = uint(_1353);
    float _1357 = fma(_1341, _1335, _1089);
    int _1359 = _1339 * _1327;
    int _1361 = _1359 + _1117;
    float _1363 = float(uint(_1347));
    float _1365 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1265);
    int _1367 = ~_610;
    int _1369 = _1367 + 1;
    float _1371 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1299);
    bool _1373 = uint(_1361) >= uint(_556);
    float _1375 = as_type<float>(_612) * _1363;
    int _1377 = int(_1237) + int(_1333);
    int _1379 = ~_610;
    int _1381 = _1379 + 1;
    float _1383 = trunc(_1375);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    bool _1389 = !_1373;
    int _1391 = _1389 ? 0 : (-1);
    int _1393 = _1369 * int(_1355);
    int _1395 = _1393 + _1095;
    int _1397 = _1381 * _1377;
    int _1399 = _1397 + _1135;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1403 = ~_1327;
    int _1405 = _1403 + _1391;
    int _1407 = _1405 + 1;
    float _1409 = float(uint(_1395));
    float _1411 = -_1401;
    float _1413 = fma(_1343, 2.0, _1411);
    bool _1415 = uint(_1399) >= uint(_610);
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1419 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1289);
    float _1421 = as_type<float>(_647) * _1409;
    int _1423 = _556 * _1407;
    int _1425 = _1423 + _1117;
    bool _1427 = !_1415;
    int _1429 = _1427 ? 0 : (-1);
    float _1431 = fma(_1349, -2.0, _1417);
    int _1433 = int(_1307) + int(_1387);
    float _1435 = -_118;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1413);
    bool _1439 = !_963;
    int _1441 = _1439 ? _1425 : (-1);
    float _1443 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1431);
    int _1445 = ~_1377;
    int _1447 = _1445 + _1429;
    int _1449 = _1447 + 1;
    float _1451 = trunc(_1421);
    float _1453 = precise::max(_1451, 0.0);
    uint _1455 = uint(_1453);
    int _1457 = _1441 & 3;
    bool _1459 = _1457 != 0;
    float _1461 = fma(_1371, _1323, _1437);
    int _1463 = _1441 & 3;
    bool _1465 = _1463 != 0;
    int _1467 = _610 * _1449;
    int _1469 = _1467 + _1135;
    bool _1471 = uint(_1457) > 1u;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1475 = _1091 + _1473;
    int _1477 = _1441 >> 31;
    float _1479 = -_1443;
    float _1481 = fma(_1419, _1231, _1479);
    bool _1483 = !_1003;
    int _1485 = _1483 ? _1469 : (-1);
    float _1487 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1489 = ~_556;
    int _1491 = _1489 + 1;
    int _1493 = _1485 >> 31;
    int _1495 = _1465 ? 0 : 1;
    int _1497 = _1491 * _1433;
    int _1499 = _1497 + _1047;
    int _1501 = _1477 & 3;
    int _1503 = _1493 & 3;
    int _1505 = ~_1495;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    int _1511 = _1509;
    float _1513 = _1365;
    if (!_1471)
    {
        int _1515 = ~_1495;
        int _1517 = _1515 + 1;
        _1511 = _1517;
    }
    int _1519 = _1511;
    float _1521 = _945 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1523 = _1441 + _1501;
    float _1525 = _947 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1527 = uint(_1457) >= 2u;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1531 = _1521 + _1529;
    int _1533 = _1485 + _1503;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1537 = _1525 + _1535;
    bool _1539 = uint(_1499) >= uint(_556);
    int _1541 = _1523 >> 2;
    float _1543 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1545 = _1527 ? 0 : 1;
    bool _1547 = _1457 != 3;
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1543);
    int _1551 = _1533 >> 2;
    int _1553 = _1541 << 4;
    int _1555 = _1553 + 368;
    float _1557 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1549);
    int _1559 = int(_1355) + int(_1455);
    int _1561 = ~_610;
    int _1563 = _1561 + 1;
    int _1565 = _1551 << 4;
    int _1567 = _1565 + 512;
    uint _1569 = uint(int(uint(_1555) >> uint(2)));
    uint _1571 = uint(int(uint(int(_1569)) >> uint(2)));
    int _1573 = int(_1569) & 3;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[int(_1571)][_1573];
    int _1577 = int(_1569) + 1;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    int _1581 = _1577 & 3;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[int(_1579)][_1581];
    int _1585 = _1563 * _1559;
    int _1587 = _1585 + _1095;
    int _1589 = ~_1545;
    int _1591 = _1589 + 1;
    int _1593 = _1591 + 1;
    int _1595 = _1593;
    if (_1547)
    {
        int _1597 = ~_1545;
        int _1599 = _1597 + 1;
        _1595 = _1599;
    }
    int _1601 = _1595;
    bool _1603 = uint(_1587) >= uint(_610);
    uint _1605 = uint(int(uint(_1567) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[int(_1615)][_1617];
    bool _1621 = !_1539;
    int _1623 = _1621 ? 0 : (-1);
    bool _1625 = !_1459;
    int _1627 = _1625 ? 0 : 1;
    int _1629 = _1485 & 3;
    bool _1631 = _1629 != 0;
    int _1633 = _1485 & 3;
    bool _1635 = _1633 != 0;
    int _1637 = _1555 + 8;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    uint _1641 = uint(int(uint(int(_1639)) >> uint(2)));
    int _1643 = int(_1639) & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = int(_1639) + 1;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    int _1651 = _1647 & 3;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[int(_1649)][_1651];
    bool _1655 = !_1631;
    int _1657 = _1655 ? 0 : 1;
    bool _1659 = uint(_1629) > 1u;
    int _1661 = _1635 ? 0 : 1;
    bool _1663 = !_1603;
    int _1665 = _1663 ? 0 : (-1);
    int _1667 = _1567 + 8;
    uint _1669 = uint(int(uint(_1667) >> uint(2)));
    uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
    int _1673 = int(_1669) & 3;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[int(_1671)][_1673];
    int _1677 = int(_1669) + 1;
    uint _1679 = uint(int(uint(_1677) >> uint(2)));
    int _1681 = _1677 & 3;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[int(_1679)][_1681];
    int _1685 = ~_1433;
    int _1687 = _1685 + _1623;
    int _1689 = _1687 + 1;
    int _1691 = ~_1661;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    int _1697 = ~_1559;
    int _1699 = _1697 + _1665;
    int _1701 = _1699 + 1;
    int _1703 = _556 * _1689;
    int _1705 = _1703 + _1047;
    bool _1707 = _1629 != 3;
    int _1709 = _1695;
    if (!_1659)
    {
        int _1711 = ~_1661;
        int _1713 = _1711 + 1;
        _1709 = _1713;
    }
    int _1715 = _1709;
    int _1717 = _610 * _1701;
    int _1719 = _1717 + _1095;
    bool _1721 = _1457 != 3;
    int _1723 = abs(_1519);
    int _1725 = abs(_1715);
    int _1727 = abs(_1627);
    int _1729 = ~_1723;
    int _1731 = _1729 + 1;
    int _1733 = _1731 + 1;
    bool _1735 = uint(_1629) >= 2u;
    int _1737 = abs(_1657);
    int _1739 = _1733 * as_type<int>(_1583);
    int _1741 = ~_1725;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    float _1747 = _1357 + 0.5;
    int _1749 = ~_1727;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    int _1755 = abs(_1601);
    int _1757 = _1735 ? 0 : 1;
    int _1759 = _1745 * as_type<int>(_1619);
    int _1761 = ~_1737;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    int _1767 = _1753 * as_type<int>(_1575);
    int _1769 = _1767 + _1739;
    int _1771 = ~_1755;
    int _1773 = _1771 + 1;
    int _1775 = _1773 + 1;
    int _1777 = ~_1757;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    int _1783 = _1765 * as_type<int>(_1611);
    int _1785 = _1783 + _1759;
    bool _1787 = !_1721;
    int _1789 = _1787 ? 0 : (-1);
    int _1791 = _1775 * as_type<int>(_1645);
    int _1793 = _1791 + _1769;
    int _1795 = _1781;
    if (_1707)
    {
        int _1797 = ~_1757;
        int _1799 = _1797 + 1;
        _1795 = _1799;
    }
    int _1801 = _1795;
    bool _1803 = _1629 != 3;
    bool _1805 = !_829;
    int _1807 = _1805 ? 0 : 1;
    int _1809 = abs(_1789);
    int _1811 = abs(_1801);
    bool _1813 = !_1803;
    int _1815 = _1813 ? 0 : (-1);
    int _1817 = abs(_1807);
    int _1819 = ~_1811;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    int _1825 = abs(_1815);
    bool _1827 = !_841;
    int _1829 = _1827 ? 0 : 1;
    int _1831 = _1823 * as_type<int>(_1675);
    int _1833 = _1831 + _1785;
    int _1835 = ~_1809;
    int _1837 = _1835 + 1;
    int _1839 = _1837 + 1;
    float _1841 = _1215 + 0.5;
    int _1843 = abs(_1829);
    int _1845 = ~_1817;
    int _1847 = _1845 + 1;
    int _1849 = _1847 + 1;
    int _1851 = _1839 * as_type<int>(_1653);
    int _1853 = _1851 + _1793;
    float _1855 = _1537 * _1537;
    out.m_65.x = _1747;
    out.m_65.y = _1841;
    int _1857 = _1853 * _1849;
    float _1859 = fma(_1531, _1531, _1855);
    bool _1861 = _1557 >= 0.0;
    int _1863 = ~_1825;
    int _1865 = _1863 + 1;
    int _1867 = _1865 + 1;
    float _1869 = fma(_1475, _1475, _1859);
    int _1871 = ~_1843;
    int _1873 = _1871 + 1;
    int _1875 = _1873 + 1;
    bool _1877 = !_963;
    float _1879 = _1877 ? as_type<float>(_1705) : as_type<float>(0xffffffffu /* nan */);
    int _1881 = _1867 * as_type<int>(_1683);
    int _1883 = _1881 + _1833;
    bool _1885 = !_1003;
    int _1887 = _1885 ? _1719 : (-1);
    float _1889 = rsqrt(_1869);
    float _1891 = _1481 + 0.5;
    int _1893 = _1883 * _1875;
    float _1895 = _1461 + 0.5;
    int _1897 = as_type<int>(_1879) * _1817;
    int _1899 = _1897 + _1857;
    float _1901 = _1879;
    if (_1861)
    {
        _1901 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1903 = _1901;
    int _1905 = _1887 * _1843;
    int _1907 = _1905 + _1893;
    float _1909 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1911 = float(_1899);
    int _1913 = as_type<int>(_1903);
    if (_1861)
    {
        float _1915 = _1903 * 5.0;
        _1913 = as_type<int>(_1915);
    }
    int _1917 = _1913;
    float _1919 = float(_1907);
    float _1921 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _1895;
    out.m_67.y = _1891;
    float _1923 = _1909 * _1889;
    if (_1861)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6421 = as_type<float>(_1917);
        out.gl_Position.z = _6421;
    }
    float _1925 = _1531 * _1923;
    out.m_69.x = _1911;
    out.m_69.y = _1919;
    float _1927 = _1537 * _1923;
    out.m_71.w = _1921;
    if (_1861)
    {
        out.m_51.x = 0.0;
    }
    if (_1861)
    {
        return out;
    }
    float _1929 = -_1927;
    float _1931 = _1525 + _1929;
    float _1933 = _1475 * _1923;
    float _1935 = -_1925;
    float _1937 = _1521 + _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1941 = _1931 + _1939;
    float _1943 = -_1933;
    float _1945 = _1091 + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = _1937 + _1947;
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1945 + _1953;
    float _1957 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1951);
    float _1959 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1957);
    bool _1961 = _1959 >= 0.0;
    float _1963 = _1933;
    float _1965 = _1941;
    float _1967 = _1949;
    float _1969 = _1931;
    float _1971 = _1937;
    if (_1961)
    {
        _1513 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1973 = _1513;
    int _1975 = as_type<int>(_1973);
    if (_1961)
    {
        out.m_51.x = 0.0;
    }
    if (_1961)
    {
        float _1977 = _1973 * 5.0;
        _1975 = as_type<int>(_1977);
    }
    int _1979 = _1975;
    if (_1961)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6525 = as_type<float>(_1979);
        out.gl_Position.z = _6525;
    }
    if (_1961)
    {
        return out;
    }
    float _1981 = -_1525;
    float _1983 = _1981 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1985 = -_1521;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1989 = -_1091;
    float _1991 = _1989 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1993 = _1983 * _1983;
    float _1995 = -_1927;
    float _1997 = _1537 + _1995;
    float _1999 = fma(_1987, _1987, _1993);
    float _2001 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2003 = -_1925;
    float _2005 = _1531 + _2003;
    float _2007 = fma(_1991, _1991, _1999);
    float _2009 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2011 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2013 = rsqrt(_2007);
    float _2015 = -_2001;
    float _2017 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2015);
    float _2019 = -_2009;
    float _2021 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2019);
    float _2023 = -_2011;
    float _2025 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2023);
    float _2027 = -_1933;
    float _2029 = _1475 + _2027;
    float _2031 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2035 = -_2031;
    float _2037 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2039 = -_2033;
    float _2041 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2039);
    float _2043 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2045 = _1987 * _2013;
    float _2047 = _1991 * _2013;
    float _2049 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2051 = _1983 * _2013;
    float _2053 = _2045 * _2045;
    float _2055 = fma(_2047, _2047, _2053);
    float _2057 = rsqrt(_2055);
    float _2059 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2061 = -_2043;
    float _2063 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2061);
    float _2065 = -_2059;
    float _2067 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2065);
    float _2069 = -_2049;
    float _2071 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2069);
    float _2073 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2063);
    float _2075 = _2047 * _2057;
    float _2077 = _2045 * _2057;
    float _2079 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2071);
    float _2081 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2083 = -_2075;
    float _2085 = _2047 * _2083;
    float _2087 = -_2075;
    float _2089 = _2051 * _2087;
    float _2091 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2093 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2095 = -_2085;
    float _2097 = fma(_2045, _2077, _2095);
    float _2099 = _2051 * _2077;
    float _2101 = -_2091;
    float _2103 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2101);
    float _2105 = -_2093;
    float _2107 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2105);
    float _2109 = _2097 * _2097;
    float _2111 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2107);
    float _2113 = fma(_2099, _2099, _2109);
    float _2115 = -_2081;
    float _2117 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2115);
    float _2119 = 1.0 / _500;
    float _2121 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2103);
    float _2123 = fma(_2089, _2089, _2113);
    float _2125 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2117);
    float _2127 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2129 = -_2125;
    float _2131 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2121);
    float _2133 = rsqrt(_2123);
    float _2135 = -_2127;
    float _2137 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2135);
    float _2139 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2141 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2137);
    float _2143 = -_2139;
    float _2145 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2143);
    float _2147 = 1.0 / _2131;
    float _2149 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2145);
    float _2151 = _2097 * _2133;
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2157 = -_2153;
    float _2159 = _2157 + 1.0;
    float _2161 = -_2155;
    float _2163 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2161);
    float _2165 = fma(_2141, _2147, -1.0);
    float _2167 = _2159 * _2147;
    float _2169 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2163);
    float _2171 = fma(_2159, _2165, 1.0);
    float _2173 = _2149 * _2167;
    float _2175 = _2169 * _2167;
    float _2177 = 1.0 / _498;
    float _2179 = _2171 * _2171;
    float _2181 = fma(_2173, _2173, _2179);
    float _2183 = fma(_2175, _2175, _2181);
    float _2185 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2187 = rsqrt(_2183);
    float _2189 = _2175 * _2187;
    float _2191 = _2173 * _2187;
    float _2193 = _2171 * _2187;
    float _2195 = -_2189;
    float _2197 = _2045 * _2195;
    float _2199 = -_2191;
    float _2201 = _2051 * _2199;
    float _2203 = _2047 * _2193;
    float _2205 = 1.0 / _496;
    float _2207 = -_2191;
    float _2209 = -_2197;
    float _2211 = fma(_2047, _2207, _2209);
    float _2213 = -_2201;
    float _2215 = fma(_2045, _2193, _2213);
    float _2217 = -_2189;
    float _2219 = -_2203;
    float _2221 = fma(_2051, _2217, _2219);
    float _2223 = _2211 * _2211;
    float _2225 = fma(_2221, _2221, _2223);
    float _2227 = fma(_2215, _2215, _2225);
    float _2229 = rsqrt(_2227);
    float _2231 = _2221 * _2229;
    float _2233 = _2215 * _2229;
    float _2235 = _2211 * _2229;
    float _2237 = _2047 * _2231;
    float _2239 = _2051 * _2233;
    float _2241 = -_2237;
    float _2243 = fma(_2045, _2233, _2241);
    float _2245 = _2045 * _2235;
    float _2247 = -_2239;
    float _2249 = fma(_2047, _2235, _2247);
    float _2251 = _2243 * _2243;
    float _2253 = -_2245;
    float _2255 = fma(_2051, _2231, _2253);
    float _2257 = fma(_2249, _2249, _2251);
    float _2259 = fma(_2255, _2255, _2257);
    float _2261 = _1997 * _1997;
    float _2263 = fma(_2005, _2005, _2261);
    float _2265 = rsqrt(_2259);
    float _2267 = fma(_2029, _2029, _2263);
    float _2269 = sqrt(_2267);
    float _2271 = _2255 * _2265;
    float _2273 = _2249 * _2265;
    float _2275 = _2243 * _2265;
    float _2277 = in.m_73.x;
    float _2279 = in.m_73.y;
    float _2281 = in.m_73.z;
    float _2283 = _2045 * _2271;
    float _2285 = _2047 * _2275;
    float _2287 = _2051 * _2273;
    float _2289 = -_2283;
    float _2291 = fma(_2047, _2273, _2289);
    float _2293 = -_2285;
    float _2295 = fma(_2051, _2271, _2293);
    float _2297 = -_2287;
    float _2299 = fma(_2045, _2275, _2297);
    float _2301 = _2291 * _2291;
    float _2303 = fma(_2295, _2295, _2301);
    float _2305 = fma(_2299, _2299, _2303);
    float _2307 = _1889 * _2269;
    float _2309 = rsqrt(_2305);
    float _2311 = _2177 * _2279;
    float _2313 = _2205 * _2277;
    float _2315 = _2307 * _2185;
    float _2317 = _1487 * _2307;
    float _2319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2311);
    float _2321 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2323 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2313);
    float _2325 = _2119 * _2281;
    float _2327 = _2319 * _2315;
    float _2329 = _2307 * _2321;
    float _2331 = _2323 * _2317;
    float _2333 = _2327 * _2273;
    float _2335 = _2295 * _2309;
    float _2337 = _2325 * _2329;
    float _2339 = _2327 * _2275;
    float _2341 = _2291 * _2309;
    float _2343 = fma(_2331, _2335, _2333);
    float _2345 = _2299 * _2309;
    float _2347 = _2327 * _2271;
    float _2349 = fma(_2331, _2341, _2339);
    float _2351 = fma(_2045, _2337, _2343);
    float _2353 = fma(_2331, _2345, _2347);
    float _2355 = fma(_2051, _2337, _2349);
    float _2357 = _1521 + _2351;
    float _2359 = fma(_2047, _2337, _2353);
    float _2361 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2363 = _2357 * 0.20000000298023223876953125;
    float _2365 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2367 = fma(_2351, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2361);
    float _2369 = floor(_2363);
    float _2371 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2373 = fma(_2351, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2365);
    float _2375 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2367);
    float _2377 = _1525 + _2355;
    float _2379 = fma(_2351, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2371);
    float _2381 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2373);
    float _2383 = _2375 * 64.0;
    float _2385 = _1091 + _2359;
    float _2387 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2379);
    float _2389 = _2381 * 49.0;
    float _2391 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2393 = _2385 * 0.20000000298023223876953125;
    float _2395 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2397 = _2387 * 64.0;
    float _2399 = fma(_2389, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2391);
    float _2401 = -_2369;
    float _2403 = _2363 + _2401;
    float _2405 = floor(_2393);
    float _2407 = fma(_2389, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2395);
    float _2409 = fma(_2397, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2399);
    float _2411 = _2403 * 6.283185482025146484375;
    float _2413 = fma(_2397, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2407);
    float _2415 = _2385 + _2409;
    float _2417 = _2411 * 0.15915493667125701904296875;
    float _2419 = _2357 + _2413;
    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2423 = _2415 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2427 = _2419 + _2425;
    float _2429 = _2423 * _2423;
    float _2431 = _2417 * 6.283185482025146484375;
    float _2433 = sin(_2431);
    float _2435 = -_2405;
    float _2437 = _2393 + _2435;
    float _2439 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2441 = fma(_2427, _2427, _2429);
    float _2443 = _2437 * 6.283185482025146484375;
    float _2445 = fma(_2389, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2439);
    float _2447 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2449 = sqrt(_2441);
    float _2451 = _2443 * 0.15915493667125701904296875;
    float _2453 = fma(_2397, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2445);
    float _2455 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2447);
    float _2457 = _2377 + _2453;
    float _2459 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2455);
    float _2461 = _2451 * 6.283185482025146484375;
    float _2463 = sin(_2461);
    bool _2465 = _2449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2467 = _2433 + _2463;
    float _2469 = fma(_2467, 0.20000000298023223876953125, _2457);
    float _2471 = _2383;
    float _2473 = _2453;
    float _2475 = _2445;
    float _2477 = _2307;
    float _2479 = _2311;
    if (!_2465)
    {
        _2471 = _2419;
    }
    float _2481 = _2471;
    float _2483 = _2481;
    if (!_2465)
    {
        _2473 = _2415;
    }
    float _2485 = _2473;
    float _2487 = _2485;
    if (!_2465)
    {
        _2475 = _2469;
    }
    float _2489 = _2475;
    bool _2491 = !_2465;
    float _2493 = _2489;
    if (!_2491)
    {
        float _2495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2499 = _2449 + _2497;
        float _2501 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2503 = rsqrt(_2441);
        float _2505 = _2499 * _2495;
        float _2507 = _2505 * 0.15915493667125701904296875;
        float _2509 = _2507 * 6.283185482025146484375;
        float _2511 = cos(_2509);
        float _2513 = _2507 * 6.283185482025146484375;
        float _2515 = sin(_2513);
        float _2517 = _2511 + (-1.0);
        float _2519 = fma(_2515, _2501, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2521 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2523 = _2503 * _2519;
        float _2525 = fma(_2469, _2511, _2521);
        float _2527 = fma(_2427, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2529 = fma(_2423, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2493 = _2525;
        _2483 = _2527;
        _2487 = _2529;
    }
    float _2531 = _2493;
    float _2533 = _2483;
    float _2535 = _2487;
    float _2537 = -_1525;
    float _2539 = _2537 + _2531;
    float _2541 = -_1521;
    float _2543 = _2541 + _2533;
    float _2545 = _2459 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2547 = -_1091;
    float _2549 = _2547 + _2535;
    float _2551 = _2539 * _2539;
    float _2553 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2555 = 1.0 / _2545;
    float _2557 = fma(_2543, _2543, _2551);
    float _2559 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2553);
    float _2561 = fma(_2549, _2549, _2557);
    float _2563 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2559);
    float _2565 = sqrt(_2561);
    float _2567 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2569 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2573 = _2569 || _2571;
    bool _2575 = isnan(0.5);
    bool _2577 = _2573 || _2575;
    float _2579 = _2567 + _2545;
    float _2581 = _2579 * _2555;
    float _2583 = _2581 * 0.5;
    bool _2585 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2589 = _2585 || _2587;
    bool _2591 = isnan(0.5);
    bool _2593 = _2589 || _2591;
    bool _2595 = _2565 > 0.0;
    float _2597 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2599 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2597);
    float _2601 = 1.0 / _2599;
    bool _2603 = !_2595;
    float _2605 = _2531;
    float _2607 = _2535;
    float _2609 = _2533;
    float _2611 = _2549;
    int _2613 = as_type<int>(_2583);
    if (!_2603)
    {
        float _2615 = _190 * _190;
        float _2617 = fma(_188, _188, _2615);
        float _2619 = rsqrt(_2561);
        float _2621 = fma(_192, _192, _2617);
        float _2623 = sqrt(_2621);
        float _2625 = _2543 * _2619;
        float _2627 = _2539 * _2619;
        float _2629 = _2549 * _2619;
        bool _2631 = _2623 > 0.0;
        bool _2633 = !_2631;
        _2613 = as_type<int>(_2623);
        if (!_2633)
        {
            float _2635 = rsqrt(_2621);
            float _2637 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2639 = _190 * _2635;
            float _2641 = _188 * _2635;
            float _2643 = _192 * _2635;
            float _2645 = _2627 * _2639;
            float _2647 = fma(_2625, _2641, _2645);
            float _2649 = _2637 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2651 = fma(_2629, _2643, _2647);
            float _2653 = _2651 * _2649;
            float _2655 = fma(_188, _2653, _2533);
            float _2657 = fma(_190, _2653, _2531);
            float _2659 = fma(_192, _2653, _2535);
            _2605 = _2657;
            _2607 = _2659;
            _2609 = _2655;
            _2611 = _2643;
            _2613 = as_type<int>(_2637);
        }
    }
    float _2661 = _2605;
    float _2663 = _2607;
    float _2665 = _2609;
    float _2667 = _2611;
    int _2669 = _2613;
    float _2671 = -_1927;
    float _2673 = _2671 + _2661;
    float _2675 = -_1933;
    float _2677 = _2675 + _2663;
    float _2679 = -_1925;
    float _2681 = _2679 + _2665;
    float _2683 = _2673;
    float _2685 = _2681;
    float _2687 = _2667;
    int _2689 = _2669;
    if (_2593)
    {
        _196 = 1.0;
    }
    float _2691 = _196;
    float _2693 = _2691;
    if (_2577)
    {
        _1963 = _2673;
    }
    float _2695 = _1963;
    float _2697 = _2695;
    if (_2577)
    {
        _2683 = _2677;
    }
    float _2699 = _2683;
    float _2701 = _2699;
    if (!_2577)
    {
        float _2703 = _1941 * _1941;
        float _2705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2707 = -_1091;
        float _2709 = _2707 + _2663;
        float _2711 = -_1521;
        float _2713 = _2711 + _2665;
        float _2715 = fma(_1949, _1949, _2703);
        float _2717 = -_1525;
        float _2719 = _2717 + _2661;
        float _2721 = fma(_1955, _1955, _2715);
        float _2723 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2725 = sqrt(_2721);
        float _2727 = 1.0 / _2307;
        float _2729 = precise::min(_2725, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2731 = _2729 * _2705;
        float _2733 = _2723 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2735 = _2731 * _2727;
        float _2737 = _2733 * _2735;
        float _2739 = _2709 * _2735;
        float _2741 = fma(_2713, _2737, _1937);
        float _2743 = fma(_2719, _2737, _1931);
        float _2745 = fma(_2733, _2739, _1945);
        _2477 = _2727;
        _2697 = _2743;
        _2685 = _2741;
        _2701 = _2745;
        _1965 = _2703;
        _1967 = _2725;
        _1175 = _2739;
    }
    float _2747 = _2477;
    float _2749 = _2697;
    float _2751 = _2685;
    float _2753 = _2701;
    float _2755 = _1965;
    float _2757 = _1967;
    float _2759 = _1175;
    float _2761 = _2759;
    float _2763 = _2747;
    float _2765 = _2757;
    float _2767 = _2755;
    if (_2593)
    {
        _2761 = 1.0;
    }
    float _2769 = _2761;
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2773 = _2601 * _2771;
    float _2775 = _2769;
    if (!_2593)
    {
        float _2777 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2779 = _2777 * 0.15915493667125701904296875;
        float _2781 = _2779 * 6.283185482025146484375;
        float _2783 = cos(_2781);
        float _2785 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2787 = _2785 * 0.15915493667125701904296875;
        float _2789 = _2779 * 6.283185482025146484375;
        float _2791 = sin(_2789);
        float _2793 = 1.0 / _2783;
        float _2795 = _2787 * 6.283185482025146484375;
        float _2797 = cos(_2795);
        float _2799 = _2791 * _2793;
        float _2801 = _2787 * 6.283185482025146484375;
        float _2803 = sin(_2801);
        float _2805 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2807 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2805;
        float _2809 = _2797 * _2799;
        float _2811 = 1.0 / _2807;
        float _2813 = 1.0 / _2809;
        float _2815 = _2803 * _2813;
        float _2817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2819 = fma(_2773, _2815, _2817);
        float _2821 = _2819 * _2811;
        float _2823 = precise::clamp(_2821, 0.0, 1.0);
        _2763 = _2779;
        _2765 = _2811;
        _2693 = _2823;
    }
    float _2825 = _2763;
    float _2827 = _2765;
    float _2829 = _2693;
    float _2831 = _2825;
    float _2833 = _2827;
    if (!_2593)
    {
        float _2835 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2837 = _2835 * 0.15915493667125701904296875;
        float _2839 = _2837 * 6.283185482025146484375;
        float _2841 = cos(_2839);
        float _2843 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2845 = _2843 * 0.15915493667125701904296875;
        float _2847 = _2837 * 6.283185482025146484375;
        float _2849 = sin(_2847);
        float _2851 = 1.0 / _2841;
        float _2853 = _2845 * 6.283185482025146484375;
        float _2855 = cos(_2853);
        float _2857 = _2849 * _2851;
        float _2859 = _2845 * 6.283185482025146484375;
        float _2861 = sin(_2859);
        float _2863 = _2855 * _2857;
        float _2865 = 1.0 / _2863;
        float _2867 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2869 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2867;
        float _2871 = 1.0 / _2869;
        float _2873 = _2861 * _2865;
        float _2875 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2877 = fma(_2773, _2873, _2875);
        float _2879 = _2877 * _2871;
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = -_2881;
        float _2885 = _2883 + 1.0;
        _2831 = _2851;
        _2775 = _2885;
    }
    float _2887 = _2831;
    float _2889 = _2775;
    float _2891 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2893 = _2749 + _2891;
    float _2895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2897 = _2751 + _2895;
    float _2899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2901 = _2753 + _2899;
    float _2903 = _2893 * _2893;
    float _2905 = fma(_2897, _2897, _2903);
    float _2907 = fma(_2901, _2901, _2905);
    float _2909 = rsqrt(_2907);
    float _2911 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2913 = _2897 * _2911;
    float _2915 = _2901 * _2911;
    float _2917 = _2913 * _2913;
    float _2919 = _2915 * _2915;
    float _2921 = _2917 + _2919;
    float _2923 = sqrt(_2921);
    bool _2925 = _2923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2929 = _2923 + _2927;
    float _2931 = _2901;
    float _2933 = _2921;
    float _2935 = _2929;
    float _2937 = _2893;
    if (_2925)
    {
        float _2939 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2931 = _2939;
    }
    float _2941 = _2931;
    if (_2925)
    {
        float _2943 = rsqrt(_2921);
        _2933 = _2943;
    }
    float _2945 = _2933;
    float _2947 = _2945;
    if (_2925)
    {
        float _2949 = _2929 * _2941;
        _2935 = _2949;
    }
    float _2951 = _2935;
    if (_2925)
    {
        float _2953 = _2951 * 0.15915493667125701904296875;
        _2767 = _2953;
    }
    float _2955 = _2767;
    float _2957 = _2909;
    if (_2925)
    {
        float _2959 = _2955 * 6.283185482025146484375;
        float _2961 = sin(_2959);
        _2957 = _2961;
    }
    float _2963 = _2957;
    float _2965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2967 = precise::max(0.0, _2965);
    float _2969 = _2887;
    float _2971 = _2967;
    float _2973 = _2965;
    if (_2925)
    {
        float _2975 = _2955 * 6.283185482025146484375;
        float _2977 = cos(_2975);
        _2969 = _2977;
    }
    float _2979 = _2969;
    float _2981 = -_2911;
    float _2983 = -_2967;
    float _2985 = fma(_2893, _2981, _2983);
    if (!_2925)
    {
        _2937 = _2915;
    }
    float _2987 = _2937;
    float _2989 = _2987;
    if (_2925)
    {
        float _2991 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2971 = _2991;
    }
    float _2993 = _2971;
    float _2995 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2997 = _2993;
    float _2999 = _2963;
    if (_2925)
    {
        float _3001 = fma(_2963, _2993, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2997 = _3001;
    }
    float _3003 = _2997;
    float _3005 = _3003;
    if (!_2925)
    {
        _2999 = _2913;
    }
    float _3007 = _2999;
    float _3009 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2995);
    float _3011 = _3007;
    float _3013 = _2979;
    if (_2925)
    {
        float _3015 = _2979 + (-1.0);
        _2973 = _3015;
    }
    float _3017 = _2973;
    if (_2925)
    {
        float _3019 = _2945 * _3003;
        _2687 = _3019;
    }
    float _3021 = _2687;
    if (!_2925)
    {
        _3005 = _2985;
    }
    float _3023 = _3005;
    float _3025 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3009);
    float _3027 = _3023;
    if (_2925)
    {
        float _3029 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2833 = _3029;
    }
    float _3031 = _2833;
    if (_2925)
    {
        float _3033 = _2913 * _3021;
        _3011 = _3033;
    }
    float _3035 = _3011;
    if (!_2925)
    {
        _2947 = _2917;
    }
    float _3037 = _2947;
    float _3039 = _3037;
    if (_2925)
    {
        float _3041 = _2915 * _3021;
        _2989 = _3041;
    }
    float _3043 = _2989;
    if (_2925)
    {
        float _3045 = fma(_2985, _2979, _3031);
        _3027 = _3045;
    }
    float _3047 = _3027;
    if (_2925)
    {
        float _3049 = _3035 * _3035;
        _3039 = _3049;
    }
    float _3051 = _3039;
    float _3053 = sqrt(_2907);
    if (!_2925)
    {
        _3013 = _2919;
    }
    float _3055 = _3013;
    float _3057 = _3055;
    if (_2925)
    {
        float _3059 = _3043 * _3043;
        _3057 = _3059;
    }
    float _3061 = _3057;
    float _3063 = fma(_3047, _3047, _3051);
    float _3065 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3067 = _3025 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3069 = _3063 + _3061;
    float _3071 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3065);
    float _3073 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3075 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3071);
    float _3077 = rsqrt(_3069);
    float _3079 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3081 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3073);
    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3085 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3083);
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = _3075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3091 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3079);
    float _3093 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3081);
    float _3095 = -_3087;
    float _3097 = _3095 + 1.0;
    float _3099 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3101 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3103 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3091);
    float _3105 = _3093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3107 = -_3101;
    float _3109 = fma(_3107, _3099, 1.0);
    float _3111 = _3103 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3113 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3115 = abs(_3097);
    float _3117 = log2(_3115);
    float _3119 = _3077 * _3035;
    float _3121 = _3077 * _3047;
    float _3123 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3113);
    float _3125 = _3077 * _3043;
    float _3127 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3129 = _3121 + 1.0;
    float _3131 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3123);
    float _3133 = log2(_3109);
    float _3135 = -_3127;
    float _3137 = fma(_3121, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3135);
    float _3139 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3131);
    float _3141 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3143 = -_3125;
    float _3145 = fma(_3143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3137);
    float _3147 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3149 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3151 = fma(_3145, -0.5, 0.5);
    float _3153 = 1.0 / _3139;
    float _3155 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3141);
    float _3157 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3155);
    float _3159 = _3133 * 0.693147182464599609375;
    float _3161 = exp2(_3149);
    float _3163 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3157);
    float _3165 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3167 = sqrt(_3151);
    float _3169 = fma(_3145, 0.5, 0.5);
    float _3171 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3147);
    float _3173 = _3163 * _3153;
    float _3175 = fma(_3169, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3177 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3171);
    float _3179 = -_3121;
    float _3181 = fma(_3161, _3129, _3179);
    float _3183 = fma(_3169, _3175, -0.212114393711090087890625);
    float _3185 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3177);
    float _3187 = fma(_3181, 0.5, 0.5);
    float _3189 = fma(_3169, _3183, 1.570728778839111328125);
    float _3191 = _3185 * _3153;
    float _3193 = fma(_3173, 0.5, 0.5);
    float _3195 = _3167 * 0.636619746685028076171875;
    float _3197 = fma(_3191, -0.5, 0.5);
    float _3199 = -_3189;
    float _3201 = fma(_3195, _3199, 1.0);
    float3 _8451 = float3(_3193, _3197, _3165);
    float _3203 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8451, float3(0.0), isnan(_8451)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8451, float3(0.0), isnan(_8451)), level(0.0)).x;
    float3 _8462 = float3(_3193, _3197, _3165);
    float4 _3206 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8462, float3(0.0), isnan(_8462)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8462, float3(0.0), isnan(_8462)), level(0.0)).xyzw;
    float _3208 = _3206.x;
    float _3210 = _3206.y;
    float _3212 = _3206.z;
    float _3214 = _3206.w;
    float2 _8479 = float2(_3201, _3187);
    float3 _3218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8479, float2(0.0), isnan(_8479)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8479, float2(0.0), isnan(_8479)), level(0.0)).xyz;
    float _3220 = _3218.x;
    float _3222 = _3218.y;
    float _3224 = _3218.z;
    float _3226 = in.m_75.y;
    bool _3228 = _2311 != 0.0;
    bool _3230 = isnan(_2311);
    bool _3232 = _3228 || _3230;
    bool _3234 = isnan(0.0);
    bool _3236 = _3232 || _3234;
    float _3238 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3240 = in.m_75.z;
    bool _3242 = _2313 == 0.0;
    bool _3244 = !_3236;
    bool _3246 = _3242 && _3244;
    float _3248 = in.m_75.x;
    bool _3250 = _2325 == 0.0;
    bool _3252 = _3250 && _3246;
    float _3254 = exp2(_3238);
    out.m_61.x = _476;
    out.m_61.y = _486;
    out.m_61.z = _488;
    out.m_61.w = _484;
    out.m_71.w = _1921;
    out.m_77.x = _2335;
    out.m_77.y = _2341;
    out.m_77.z = _2345;
    int _3256 = as_type<int>(_3193);
    float _3258 = _3105;
    if (_3252)
    {
        float _3260 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3226);
        _2689 = as_type<int>(_3260);
    }
    int _3262 = _2689;
    int _3264 = _3262;
    if (!_3252)
    {
        float _3266 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3226);
        _3264 = as_type<int>(_3266);
    }
    int _3268 = _3264;
    if (_3252)
    {
        _2479 = _3226;
    }
    float _3270 = _2479;
    float _3272 = -_3254;
    float _3274 = _3272 + 1.0;
    float _3276 = _3270;
    if (_3252)
    {
        float _3278 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3240);
        _3256 = as_type<int>(_3278);
    }
    int _3280 = _3256;
    int _3282 = _3280;
    if (!_3252)
    {
        float _3284 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3240);
        _3282 = as_type<int>(_3284);
    }
    int _3286 = _3282;
    bool _3288 = !_3252;
    float _3290 = _3288 ? as_type<float>(_3268) : _3226;
    float _3292 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_3252)
    {
        _3276 = as_type<float>(_3268);
    }
    float _3294 = _3276;
    float _3296 = _3248;
    if (!_3252)
    {
        float _3298 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3248);
        _3296 = _3298;
    }
    float _3300 = _3296;
    bool _3302 = !_3252;
    float _3304 = _3302 ? as_type<float>(_3286) : _3240;
    float _3306 = _3290 * _3290;
    float _3308 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3292);
    if (_3252)
    {
        _3258 = _3240;
    }
    float _3310 = _3258;
    out.m_79.x = _2751;
    out.m_79.y = _2749;
    out.m_79.z = _2753;
    float _3312 = fma(_3304, _3304, _3306);
    float _3314 = _3310;
    if (!_3252)
    {
        _3314 = as_type<float>(_3286);
    }
    float _3316 = _3314;
    float _3318 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3308);
    float _3320 = _3139 * 0.5;
    bool _3322 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3324 = isnan(_3053);
    bool _3326 = _3322 || _3324;
    bool _3328 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3330 = _3326 || _3328;
    out.m_81.x = _1937;
    out.m_81.y = _1931;
    out.m_81.z = _1945;
    float _3332 = rsqrt(_3312);
    float _3334 = fma(_3185, -0.5, _3320);
    if (!_3330)
    {
        _1969 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3336 = _1969;
    float _3338 = _3336;
    float _3340 = _3336;
    if (!_3330)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3342 = _1971;
    float _3344 = _3290 * _3332;
    float _3346 = _3304 * _3332;
    float _3348 = -_2051;
    float _3350 = _3344 * _3348;
    float _3352 = -_2047;
    float _3354 = _3344 * _3352;
    float _3356 = -_2045;
    float _3358 = _3344 * _3356;
    float _3360 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3318);
    float _3362 = fma(_3346, _2275, _3350);
    float _3364 = fma(_3346, _2271, _3354);
    float _3366 = _2273 * _3294;
    float _3368 = fma(_3346, _2273, _3358);
    float _3370 = _2275 * _3294;
    float _3372 = _2271 * _3294;
    float _3374 = fma(_2335, _3300, _3366);
    float _3376 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3368;
    out.m_83.y = _3362;
    out.m_83.z = _3364;
    float _3378 = fma(_2345, _3300, _3372);
    float _3380 = fma(_2341, _3300, _3370);
    float _3382 = _3360 + _3139;
    float _3384 = _3163 + _3139;
    out.gl_Position.x = _3163;
    out.gl_Position.y = _3185;
    out.gl_Position.z = _3360;
    out.gl_Position.w = _3139;
    float _3386 = _3382 * 0.5;
    float _3388 = _3384 * 0.5;
    float _3390 = _2829 * _2889;
    float _3392 = fma(_2047, _3316, _3378);
    float _3394 = fma(_2045, _3316, _3374);
    float _3396 = fma(_2051, _3316, _3380);
    out.m_85.x = _3388;
    out.m_85.y = _3334;
    out.m_85.z = _3386;
    out.m_85.w = _3139;
    float _3398 = _3390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3400 = _3390;
    float _3402 = _3342;
    float _3404 = _3342;
    if (!_3330)
    {
        _3400 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3406 = _3400;
    out.m_87.x = _3394;
    out.m_87.y = _3396;
    out.m_87.z = _3392;
    float _3408 = _3376 * _3203;
    float _3410 = -_3376;
    float _3412 = _3410 + 1.0;
    float _3414 = _3214 * _3408;
    float _3416 = _3224 * _3408;
    float _3418 = fma(_3220, _3414, _3208);
    float _3420 = fma(_3222, _3414, _3210);
    float _3422 = _3214 * _3412;
    float _3424 = fma(_3214, _3416, _3212);
    out.m_89.x = _3418;
    out.m_89.y = _3420;
    out.m_89.z = _3424;
    out.m_89.w = _3422;
    bool _3426 = !_3330;
    float _3428 = _3406;
    float _3430 = _3406;
    if (!_3426)
    {
        bool _3432 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3434 = isnan(_3053);
        bool _3436 = _3432 || _3434;
        bool _3438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3440 = _3436 || _3438;
        if (!_3440)
        {
            float _3442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3444 = _3053 + _3442;
            float _3446 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3448 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3446;
            float _3450 = 1.0 / _3448;
            float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3458 = _3456 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3460 = _3444 * _3450;
            float _3462 = precise::clamp(_3460, 0.0, 1.0);
            float _3464 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3466 = _3464 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3468 = fma(_3462, _3458, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3470 = fma(_3462, _3466, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3472 = fma(_3462, _3454, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3404 = _3472;
            _3340 = _3470;
            _3430 = _3468;
            _3474 = true;
        }
        else
        {
            bool _3476 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3478 = isnan(_3053);
            bool _3480 = _3476 || _3478;
            bool _3482 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3484 = _3480 || _3482;
            if (!_3484)
            {
                _3338 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3486 = _3338;
            _3340 = _3486;
            if (!_3484)
            {
                _3402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3488 = _3402;
            _3404 = _3488;
            if (!_3484)
            {
                _3428 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3490 = _3428;
            bool _3492 = !_3484;
            _3430 = _3490;
            if (!_3492)
            {
                bool _3494 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3496 = isnan(_3053);
                bool _3498 = _3494 || _3496;
                bool _3500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3502 = _3498 || _3500;
                if (!_3502)
                {
                    float _3504 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3506 = _3053 + _3504;
                    float _3508 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3510 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3508;
                    float _3512 = 1.0 / _3510;
                    float _3514 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3518 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3520 = _3518 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3522 = _3506 * _3512;
                    float _3524 = precise::clamp(_3522, 0.0, 1.0);
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3530 = fma(_3524, _3520, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3532 = fma(_3524, _3528, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3534 = fma(_3524, _3516, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3404 = _3534;
                    _3340 = _3532;
                    _3430 = _3530;
                    _3474 = true;
                }
                else
                {
                    _3404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3340 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3430 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3474 = false;
    float _3536 = _3404;
    float _3538 = _3340;
    float _3540 = _3430;
    float _3542 = _3398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _3544 = _3536 * 0.586610972881317138671875;
    bool _3546 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3542;
    float _3548 = fma(_3538, 0.298911988735198974609375, _3544);
    bool _3550 = _2829 > 0.0;
    bool _3552 = isnan(_2829);
    bool _3554 = _3550 || _3552;
    bool _3556 = isnan(0.0);
    bool _3558 = _3554 || _3556;
    float _3560 = fma(_3540, 0.114477999508380889892578125, _3548);
    bool _3562 = _2889 <= 0.0;
    bool _3564 = !_3558;
    bool _3566 = _3562 || _3564;
    float _3568 = -_3560;
    float _3570 = _3568 + _3538;
    float _3572 = -_3560;
    float _3574 = _3572 + _3536;
    float _3576 = -_3560;
    float _3578 = _3576 + _3540;
    float _3580 = fma(_3570, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3582 = fma(_3574, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3584 = fma(_3578, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    bool _3586 = !_3546;
    if (!_3586)
    {
        float _3588 = -_2749;
        float _3590 = _3588 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3592 = -_2751;
        float _3594 = _3592 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3596 = -_2753;
        float _3598 = _3596 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3600 = _3590 * _3590;
        float _3602 = fma(_3594, _3594, _3600);
        float _3604 = fma(_3598, _3598, _3602);
        float _3606 = sqrt(_3604);
        float _3608 = rsqrt(_3604);
        float _3610 = -_3606;
        float _3612 = _3610 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3614 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3616 = precise::clamp(_3614, 0.0, 1.0);
        float _3618 = _3594 * _3608;
        float _3620 = _3590 * _3608;
        float _3622 = abs(_3616);
        float _3624 = log2(_3622);
        float _3626 = _3598 * _3608;
        float _3628 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3630 = _3396 * _3620;
        float _3632 = -_3620;
        float _3634 = -_3628;
        float _3636 = fma(_3632, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3634);
        float _3638 = fma(_3394, _3618, _3630);
        float _3640 = -_3626;
        float _3642 = fma(_3640, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3636);
        float _3644 = fma(_3392, _3626, _3638);
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3650 = _3642 + _3648;
        float _3652 = _3624 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3654 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3656 = precise::clamp(_3654, 0.0, 1.0);
        float _3658 = exp2(_3652);
        float _3660 = _3658 * _3656;
        float _3662 = _3646 * _3660;
        float _3664 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3666 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3668 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3664;
        out.m_91.y = _3666;
        out.m_91.z = _3668;
    }
    out.m_93.x = _3580;
    out.m_93.y = _3582;
    out.m_93.z = _3584;
    if (!_3566)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3670 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3670;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3474 = false;
    bool _520 = false;
    bool _374 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_44.w;
    float _109 = in.m_46.w;
    float _111 = trunc(_107);
    int _114 = int(_111);
    float _116 = -_109;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _118;
    bool _122 = _114 >= 1;
    float _124 = 0.0;
    float _126 = as_type<float>(_114);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3738 = as_type<float>(_134);
        out.gl_Position.z = _3738;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _138 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_109);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = in.m_53.x;
    float _150 = float(_114);
    bool _152 = _118 >= _150;
    bool _154 = !_146;
    bool _156 = _152 || _154;
    if (_156)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _126;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _136 = as_type<int>(_160);
    }
    int _162 = _136;
    out.m_55.x = _148;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3797 = as_type<float>(_162);
        out.gl_Position.z = _3797;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_57.x;
    float _166 = in.m_57.y;
    float _168 = in.m_57.z;
    float _170 = 1.0 / _150;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _118 * _170;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_172;
    float _196 = _188;
    float _212;
    if (!_194)
    {
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _174;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _216 + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _258 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_216);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = -_232;
    float _272 = _270 + 1.0;
    float _274 = 1.0 / _256;
    float _276 = _268 * _272;
    float _278 = -_268;
    float _280 = _278 + 1.0;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _282;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _252;
    float _290 = _248 * _280;
    float _292 = -_248;
    float _294 = _292 + 1.0;
    float _296 = _236 * _274;
    float _298 = _220 * _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = fma(_284, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = fma(_306, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _314 = _308 * _290;
    float _316 = _310 * _290;
    float _318 = _312 * _290;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].x, _314);
    float _334 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _336 = fma(_322, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_326, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _340 = fma(_330, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _342 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].z, _318);
    float _344 = fma(_336, _276, _332);
    float _346 = fma(_338, _276, _334);
    float _348 = fma(_340, _276, _342);
    float _350 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].x, _344);
    float _352 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].y, _346);
    float _354 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].z, _348);
    bool _356 = !_286;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        _372 = _174;
    }
    _374 = false;
    float _376 = _372;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _380 = _376 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _386 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = isnan(_376);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _402 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _404 = isnan(_376);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _414;
    bool _418 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _420 = isnan(_376);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = 1.0 / _384;
    float _432 = -_396;
    float _434 = _432 + 1.0;
    bool _436 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _438 = _412 * _434;
    float _440 = -_412;
    float _442 = _440 + 1.0;
    float _444 = 1.0 / _400;
    float _446 = _416 * _430;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _452 = fma(_446, _380, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _454 = _450 * _444;
    float _456 = _452 * _438;
    float _458 = -_428;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _464 = _376 + _462;
    float _466 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _468 = _396 * _460;
    float _470 = fma(_454, _464, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _474 = fma(_470, _468, _466);
    float _476 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _478 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[117].x, _474);
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _484 = _478 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _486 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = in.m_59.x;
    float _492 = in.m_59.y;
    float _494 = in.m_59.z;
    out.m_61.x = _476;
    out.m_61.y = _486;
    out.m_61.z = _488;
    out.m_61.w = _484;
    float _496 = _350 * _490;
    float _498 = _352 * _492;
    float _500 = _354 * _494;
    bool _502 = !_436;
    float _518;
    if (!_502)
    {
        float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _506 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[11].w, _118);
        float _510 = _508 * _504;
        float _512 = floor(_510);
        float _514 = -_512;
        float _516 = _510 + _514;
        _518 = _516;
        _520 = true;
    }
    else
    {
        _518 = _174;
    }
    _520 = false;
    float _522 = _518;
    float _524 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _526 = int(_524);
    float _528 = in.m_63.y;
    float _530 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _532 = in.m_63.x;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _536 = _534 != 0;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _540 = int(_538);
    float _542 = in.m_53.z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _550 = _548 != 0;
    float _552 = float(_526);
    float _554 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _556 = int(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = float(_540);
    float _564 = 1.0 / _552;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _570 = 0.0;
    float _572 = _528;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _576 = _532;
    if (!_536)
    {
        _570 = _532;
    }
    float _578 = _570;
    float _580 = float(uint(_556));
    float _582 = 1.0 / _562;
    int _584 = ~_556;
    int _586 = _584 + 1;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _592 = _542 > 0.5;
    float _594 = _118 * _564;
    float _596 = 1.0 / _580;
    float _598 = trunc(_594);
    int _600 = int(_598);
    float _602 = _118 * _582;
    int _604 = ~_556;
    int _606 = _604 + 1;
    float _608 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _610 = int(_608);
    int _612 = as_type<int>(_596) + (-2);
    float _614 = float(uint(_600));
    float _616 = trunc(_602);
    int _618 = int(_616);
    float _620 = as_type<float>(_612) * _614;
    float _622 = float(uint(_610));
    float _624 = trunc(_620);
    float _626 = precise::max(_624, 0.0);
    uint _629 = uint(_626);
    float _631 = 1.0 / _622;
    float _633 = float(uint(_618));
    int _635 = ~_610;
    int _637 = _635 + 1;
    int _639 = _606 * int(_629);
    int _641 = _639 + _600;
    float _643 = in.m_53.y;
    float _645 = 1.0 / _560;
    int _647 = as_type<int>(_631) + (-2);
    float _649 = 1.0 / _590;
    float _651 = as_type<float>(_647) * _633;
    float _653 = float(uint(_641));
    float _655 = trunc(_651);
    float _657 = precise::max(_655, 0.0);
    uint _659 = uint(_657);
    float _661 = as_type<float>(_612) * _653;
    bool _663 = _643 > 0.5;
    float _665 = trunc(_661);
    float _667 = precise::max(_665, 0.0);
    uint _669 = uint(_667);
    float _671 = _643 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _673 = _637 * int(_659);
    int _675 = _673 + _618;
    float _677 = float(uint(_675));
    int _679 = int(_629) + int(_669);
    float _681 = -_528;
    float _683 = _681 + 1.0;
    float _685 = as_type<float>(_647) * _677;
    int _687 = as_type<int>(_677);
    bool _689 = _663;
    float _691 = _578;
    if (_536)
    {
        float _693 = -_532;
        float _695 = _693 + 1.0;
        _687 = as_type<int>(_695);
    }
    int _697 = _687;
    int _699 = _663 ? as_type<int>(_683) : as_type<int>(_528);
    float _701 = trunc(_685);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    if (_536)
    {
        bool _707 = _148 > 0.5;
        _689 = _707;
    }
    bool _709 = _689;
    float _711 = _550 ? as_type<float>(_699) : _528;
    if (_536)
    {
        float _713 = _709 ? as_type<float>(_697) : _532;
        _691 = _713;
    }
    float _715 = _691;
    int _717 = ~_610;
    int _719 = _717 + 1;
    if (_546)
    {
        float _721 = _592 ? _683 : _528;
        _572 = _721;
    }
    float _723 = _572;
    int _725 = _586 * _679;
    int _727 = _725 + _600;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _739 = _737 != 0;
    int _741 = int(_659) + int(_705);
    bool _743 = uint(_727) >= uint(_556);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _747 = _745 != 0;
    int _749 = _719 * _741;
    int _751 = _749 + _618;
    bool _753 = !_735;
    int _755 = _753 ? 0 : 1;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _759 = _757 != 0;
    bool _761 = !_747;
    int _763 = _761 ? 0 : 1;
    bool _765 = !_743;
    int _767 = _765 ? 0 : (-1);
    bool _769 = !_739;
    int _771 = _769 ? 0 : 1;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _787 = _785 != 0;
    bool _789 = !_731;
    int _791 = _789 ? 0 : 1;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _795 = _793 != 0;
    bool _797 = uint(_751) >= uint(_610);
    float _799 = in.m_44.x;
    float _801 = in.m_44.y;
    float _803 = in.m_44.z;
    bool _805 = !_779;
    int _807 = _805 ? 0 : 1;
    bool _809 = !_797;
    int _811 = _809 ? 0 : (-1);
    bool _813 = !_775;
    int _815 = _813 ? 0 : 1;
    bool _817 = !_783;
    int _819 = _817 ? 0 : 1;
    if (_795)
    {
        _574 = 1.0;
    }
    float _821 = _574;
    float _823 = _821;
    if (!_795)
    {
        _823 = 7.345489978790283203125;
    }
    float _825 = _823;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _833 = _831 != 0;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _837 = _835 != 0;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _841 = _839 != 0;
    float _843 = -_566;
    float _845 = fma(_530, 2.0, _843);
    float _847 = _825 * _148;
    float _849 = 0.0;
    if (_795)
    {
        _849 = _148;
    }
    float _851 = _849;
    float _853 = fma(_671, -2.0, _568);
    float _855 = 0.0;
    float _857 = _851;
    if (_795)
    {
        _855 = 1.0;
    }
    float _859 = _855;
    float _861 = floor(_847);
    float _863 = _859;
    if (!_795)
    {
        _857 = _643;
    }
    float _865 = _857;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _867;
    if (!_795)
    {
        _863 = 1.2345600128173828125;
    }
    float _871 = _863;
    float _873 = _801 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _875 = float(_556);
    float _877 = _801 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _879 = float(_600);
    float _881 = _865 * _871;
    float _883 = _801 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _885 = _869 * _645;
    bool _887 = _879 >= _875;
    bool _889 = isnan(_879);
    bool _891 = _887 || _889;
    bool _893 = isnan(_875);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].x, _873);
    float _901 = floor(_881);
    float _903 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].x, _877);
    float _905 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].x, _883);
    float _907 = float(_610);
    float _909 = -_861;
    float _911 = _847 + _909;
    float _913 = float(_618);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _917 = _522 + _915;
    int _919 = ~_679;
    int _921 = _919 + _767;
    int _923 = _921 + 1;
    float _925 = trunc(_897);
    int _927 = int(_925);
    bool _929 = _913 >= _907;
    bool _931 = isnan(_913);
    bool _933 = _929 || _931;
    bool _935 = isnan(_907);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = _911 * _875;
    float _943 = fma(_885, _917, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _945 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[4].z, _899);
    float _947 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _949 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[6].z, _905);
    bool _951 = !_787;
    int _953 = _951 ? 0 : 1;
    float _955 = trunc(_939);
    int _957 = int(_955);
    int _959 = _556 * _923;
    int _961 = _959 + _600;
    bool _963 = _556 == 0;
    float _965 = -_901;
    float _967 = _881 + _965;
    int _969 = ~_741;
    int _971 = _969 + _811;
    int _973 = _971 + 1;
    float _975 = _174 * _875;
    bool _977 = !_963;
    int _979 = _977 ? _961 : (-1);
    float _981 = _174 * _907;
    float _983 = trunc(_941);
    int _985 = int(_983);
    int _987 = ~_927;
    int _989 = _987 + 1;
    int _991 = _989 + 1;
    float _993 = _967 * _907;
    bool _995 = !_833;
    int _997 = _995 ? 0 : 1;
    int _999 = _610 * _973;
    int _1001 = _999 + _618;
    bool _1003 = _610 == 0;
    int _1005 = _979 * _991;
    int _1007 = _556 + (-1);
    float _1009 = trunc(_975);
    int _1011 = int(_1009);
    int _1013 = ~_957;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1023 = !_1003;
    int _1025 = _1023 ? _1001 : (-1);
    int _1027 = _927 * _1007;
    int _1029 = _1027 + _1005;
    int _1031 = abs(_763);
    float _1033 = _1021 * _649;
    int _1035 = abs(_755);
    float _1037 = trunc(_993);
    int _1039 = int(_1037);
    int _1041 = _1025 * _1017;
    int _1043 = _610 + (-1);
    int _1045 = _985 * _1031;
    int _1047 = _1045 + _600;
    int _1049 = abs(_791);
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1053 = _522 + _1051;
    int _1055 = abs(_815);
    int _1057 = _1029 * _1035;
    float _1059 = trunc(_981);
    int _1061 = int(_1059);
    bool _1063 = !_759;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = _957 * _1043;
    int _1069 = _1067 + _1041;
    int _1071 = abs(_807);
    int _1073 = _1011 * _1049;
    int _1075 = _1073 + _1057;
    int _1077 = abs(_771);
    float _1079 = fma(_1033, _1053, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1081 = abs(_1065);
    int _1083 = _1069 * _1071;
    int _1085 = abs(_997);
    float _1087 = -_118;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[76].x, _845);
    float _1091 = _949 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1093 = _1039 * _1085;
    int _1095 = _1093 + _618;
    int _1097 = abs(_819);
    int _1099 = _1061 * _1055;
    int _1101 = _1099 + _1083;
    int _1103 = abs(_953);
    int _1105 = _1047 * _1077;
    int _1107 = _1105 + _1075;
    int _1109 = _1095 * _1097;
    int _1111 = _1109 + _1101;
    float _1113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1115 = _985 * _1081;
    int _1117 = _1115 + _1107;
    bool _1119 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1121 = isnan(_522);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1133 = _1039 * _1103;
    int _1135 = _1133 + _1111;
    float _1137 = float(uint(_1117));
    float _1139 = -_1129;
    float _1141 = _1139 + 1.0;
    bool _1143 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1145 = isnan(_522);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1157 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1159 = isnan(_522);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = as_type<float>(_612) * _1137;
    int _1171 = _1061;
    float _1173 = _1167;
    float _1175 = _1091;
    if (_795)
    {
        _1171 = 0;
    }
    int _1177 = _1171;
    float _1179 = _1153 * _1141;
    float _1181 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1155);
    float _1183 = -_1153;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _853);
    int _1189 = _1177;
    if (!_795)
    {
        _1189 = 2;
    }
    int _1191 = _1189;
    float _1193 = trunc(_1169);
    float _1195 = precise::max(_1193, 0.0);
    uint _1197 = uint(_1195);
    float _1199 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1181);
    float _1201 = _1167 * _1185;
    float _1203 = float(uint(_1135));
    bool _1205 = _1191 != 2;
    float _1207 = _943 * _1201;
    int _1209 = ~_556;
    int _1211 = _1209 + 1;
    float _1213 = -_1187;
    float _1215 = fma(_1199, _1131, _1213);
    float _1217 = as_type<float>(_647) * _1203;
    float _1219 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1221 = as_type<int>(_1113);
    if (_837)
    {
        float _1223 = -_532;
        float _1225 = _1223 + 1.0;
        _1221 = as_type<int>(_1225);
    }
    int _1227 = _1221;
    bool _1229 = _643 > 0.5;
    float _1231 = fma(_1219, _723, -0.5);
    float _1233 = trunc(_1217);
    float _1235 = precise::max(_1233, 0.0);
    uint _1237 = uint(_1235);
    int _1239 = _1211 * int(_1197);
    int _1241 = _1239 + _1117;
    float _1243 = -_1167;
    float _1245 = _1243 + 1.0;
    if (_1205)
    {
        _1173 = _148;
    }
    float _1247 = _1173;
    float _1249 = _1247;
    if (!_1205)
    {
        _1249 = _542;
    }
    float _1251 = _1249;
    float _1253 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1207);
    float _1255 = float(uint(_1241));
    if (_837)
    {
        float _1257 = _1229 ? as_type<float>(_1227) : _532;
        _576 = _1257;
    }
    float _1259 = _576;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1263 = as_type<float>(_612) * _1255;
    float _1265 = fma(_1079, _1179, _1253);
    int _1267 = ~_610;
    int _1269 = _1267 + 1;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1273 = trunc(_1263);
    float _1275 = precise::max(_1273, 0.0);
    uint _1277 = uint(_1275);
    float _1279 = float(uint(_1047));
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1283 = _1269 * int(_1237);
    int _1285 = _1283 + _1135;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1289 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1271);
    float _1291 = as_type<float>(_612) * _1279;
    float _1293 = _1271;
    if (_1205)
    {
        _1293 = _643;
    }
    float _1295 = _1293;
    float _1297 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1281);
    float _1299 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1287);
    float _1301 = float(uint(_1285));
    float _1303 = trunc(_1291);
    float _1305 = precise::max(_1303, 0.0);
    uint _1307 = uint(_1305);
    float _1309 = _1295;
    if (!_1205)
    {
        _1309 = _148;
    }
    float _1311 = _1309;
    float _1313 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1315 = float(uint(_1095));
    float _1317 = as_type<float>(_647) * _1301;
    int _1319 = ~_556;
    int _1321 = _1319 + 1;
    float _1323 = fma(_1313, _1259, -0.5);
    float _1325 = as_type<float>(_647) * _1315;
    int _1327 = int(_1197) + int(_1277);
    float _1329 = trunc(_1317);
    float _1331 = precise::max(_1329, 0.0);
    uint _1333 = uint(_1331);
    float _1335 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1337 = ~_556;
    int _1339 = _1337 + 1;
    float _1341 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1297);
    float _1343 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1345 = _1321 * int(_1307);
    int _1347 = _1345 + _1047;
    float _1349 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1351 = trunc(_1325);
    float _1353 = precise::max(_1351, 0.0);
    uint _1355 = uint(_1353);
    float _1357 = fma(_1341, _1335, _1089);
    int _1359 = _1339 * _1327;
    int _1361 = _1359 + _1117;
    float _1363 = float(uint(_1347));
    float _1365 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1265);
    int _1367 = ~_610;
    int _1369 = _1367 + 1;
    float _1371 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1299);
    bool _1373 = uint(_1361) >= uint(_556);
    float _1375 = as_type<float>(_612) * _1363;
    int _1377 = int(_1237) + int(_1333);
    int _1379 = ~_610;
    int _1381 = _1379 + 1;
    float _1383 = trunc(_1375);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    bool _1389 = !_1373;
    int _1391 = _1389 ? 0 : (-1);
    int _1393 = _1369 * int(_1355);
    int _1395 = _1393 + _1095;
    int _1397 = _1381 * _1377;
    int _1399 = _1397 + _1135;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1403 = ~_1327;
    int _1405 = _1403 + _1391;
    int _1407 = _1405 + 1;
    float _1409 = float(uint(_1395));
    float _1411 = -_1401;
    float _1413 = fma(_1343, 2.0, _1411);
    bool _1415 = uint(_1399) >= uint(_610);
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1419 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1289);
    float _1421 = as_type<float>(_647) * _1409;
    int _1423 = _556 * _1407;
    int _1425 = _1423 + _1117;
    bool _1427 = !_1415;
    int _1429 = _1427 ? 0 : (-1);
    float _1431 = fma(_1349, -2.0, _1417);
    int _1433 = int(_1307) + int(_1387);
    float _1435 = -_118;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1413);
    bool _1439 = !_963;
    int _1441 = _1439 ? _1425 : (-1);
    float _1443 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1431);
    int _1445 = ~_1377;
    int _1447 = _1445 + _1429;
    int _1449 = _1447 + 1;
    float _1451 = trunc(_1421);
    float _1453 = precise::max(_1451, 0.0);
    uint _1455 = uint(_1453);
    int _1457 = _1441 & 3;
    bool _1459 = _1457 != 0;
    float _1461 = fma(_1371, _1323, _1437);
    int _1463 = _1441 & 3;
    bool _1465 = _1463 != 0;
    int _1467 = _610 * _1449;
    int _1469 = _1467 + _1135;
    bool _1471 = uint(_1457) > 1u;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1475 = _1091 + _1473;
    int _1477 = _1441 >> 31;
    float _1479 = -_1443;
    float _1481 = fma(_1419, _1231, _1479);
    bool _1483 = !_1003;
    int _1485 = _1483 ? _1469 : (-1);
    float _1487 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1489 = ~_556;
    int _1491 = _1489 + 1;
    int _1493 = _1485 >> 31;
    int _1495 = _1465 ? 0 : 1;
    int _1497 = _1491 * _1433;
    int _1499 = _1497 + _1047;
    int _1501 = _1477 & 3;
    int _1503 = _1493 & 3;
    int _1505 = ~_1495;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    int _1511 = _1509;
    float _1513 = _1365;
    if (!_1471)
    {
        int _1515 = ~_1495;
        int _1517 = _1515 + 1;
        _1511 = _1517;
    }
    int _1519 = _1511;
    float _1521 = _945 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1523 = _1441 + _1501;
    float _1525 = _947 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1527 = uint(_1457) >= 2u;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1531 = _1521 + _1529;
    int _1533 = _1485 + _1503;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1537 = _1525 + _1535;
    bool _1539 = uint(_1499) >= uint(_556);
    int _1541 = _1523 >> 2;
    float _1543 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1545 = _1527 ? 0 : 1;
    bool _1547 = _1457 != 3;
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1543);
    int _1551 = _1533 >> 2;
    int _1553 = _1541 << 4;
    int _1555 = _1553 + 368;
    float _1557 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1549);
    int _1559 = int(_1355) + int(_1455);
    int _1561 = ~_610;
    int _1563 = _1561 + 1;
    int _1565 = _1551 << 4;
    int _1567 = _1565 + 512;
    uint _1569 = uint(int(uint(_1555) >> uint(2)));
    uint _1571 = uint(int(uint(int(_1569)) >> uint(2)));
    int _1573 = int(_1569) & 3;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[int(_1571)][_1573];
    int _1577 = int(_1569) + 1;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    int _1581 = _1577 & 3;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[int(_1579)][_1581];
    int _1585 = _1563 * _1559;
    int _1587 = _1585 + _1095;
    int _1589 = ~_1545;
    int _1591 = _1589 + 1;
    int _1593 = _1591 + 1;
    int _1595 = _1593;
    if (_1547)
    {
        int _1597 = ~_1545;
        int _1599 = _1597 + 1;
        _1595 = _1599;
    }
    int _1601 = _1595;
    bool _1603 = uint(_1587) >= uint(_610);
    uint _1605 = uint(int(uint(_1567) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[int(_1615)][_1617];
    bool _1621 = !_1539;
    int _1623 = _1621 ? 0 : (-1);
    bool _1625 = !_1459;
    int _1627 = _1625 ? 0 : 1;
    int _1629 = _1485 & 3;
    bool _1631 = _1629 != 0;
    int _1633 = _1485 & 3;
    bool _1635 = _1633 != 0;
    int _1637 = _1555 + 8;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    uint _1641 = uint(int(uint(int(_1639)) >> uint(2)));
    int _1643 = int(_1639) & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = int(_1639) + 1;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    int _1651 = _1647 & 3;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[int(_1649)][_1651];
    bool _1655 = !_1631;
    int _1657 = _1655 ? 0 : 1;
    bool _1659 = uint(_1629) > 1u;
    int _1661 = _1635 ? 0 : 1;
    bool _1663 = !_1603;
    int _1665 = _1663 ? 0 : (-1);
    int _1667 = _1567 + 8;
    uint _1669 = uint(int(uint(_1667) >> uint(2)));
    uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
    int _1673 = int(_1669) & 3;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[int(_1671)][_1673];
    int _1677 = int(_1669) + 1;
    uint _1679 = uint(int(uint(_1677) >> uint(2)));
    int _1681 = _1677 & 3;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[int(_1679)][_1681];
    int _1685 = ~_1433;
    int _1687 = _1685 + _1623;
    int _1689 = _1687 + 1;
    int _1691 = ~_1661;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    int _1697 = ~_1559;
    int _1699 = _1697 + _1665;
    int _1701 = _1699 + 1;
    int _1703 = _556 * _1689;
    int _1705 = _1703 + _1047;
    bool _1707 = _1629 != 3;
    int _1709 = _1695;
    if (!_1659)
    {
        int _1711 = ~_1661;
        int _1713 = _1711 + 1;
        _1709 = _1713;
    }
    int _1715 = _1709;
    int _1717 = _610 * _1701;
    int _1719 = _1717 + _1095;
    bool _1721 = _1457 != 3;
    int _1723 = abs(_1519);
    int _1725 = abs(_1715);
    int _1727 = abs(_1627);
    int _1729 = ~_1723;
    int _1731 = _1729 + 1;
    int _1733 = _1731 + 1;
    bool _1735 = uint(_1629) >= 2u;
    int _1737 = abs(_1657);
    int _1739 = _1733 * as_type<int>(_1583);
    int _1741 = ~_1725;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    float _1747 = _1357 + 0.5;
    int _1749 = ~_1727;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    int _1755 = abs(_1601);
    int _1757 = _1735 ? 0 : 1;
    int _1759 = _1745 * as_type<int>(_1619);
    int _1761 = ~_1737;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    int _1767 = _1753 * as_type<int>(_1575);
    int _1769 = _1767 + _1739;
    int _1771 = ~_1755;
    int _1773 = _1771 + 1;
    int _1775 = _1773 + 1;
    int _1777 = ~_1757;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    int _1783 = _1765 * as_type<int>(_1611);
    int _1785 = _1783 + _1759;
    bool _1787 = !_1721;
    int _1789 = _1787 ? 0 : (-1);
    int _1791 = _1775 * as_type<int>(_1645);
    int _1793 = _1791 + _1769;
    int _1795 = _1781;
    if (_1707)
    {
        int _1797 = ~_1757;
        int _1799 = _1797 + 1;
        _1795 = _1799;
    }
    int _1801 = _1795;
    bool _1803 = _1629 != 3;
    bool _1805 = !_829;
    int _1807 = _1805 ? 0 : 1;
    int _1809 = abs(_1789);
    int _1811 = abs(_1801);
    bool _1813 = !_1803;
    int _1815 = _1813 ? 0 : (-1);
    int _1817 = abs(_1807);
    int _1819 = ~_1811;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    int _1825 = abs(_1815);
    bool _1827 = !_841;
    int _1829 = _1827 ? 0 : 1;
    int _1831 = _1823 * as_type<int>(_1675);
    int _1833 = _1831 + _1785;
    int _1835 = ~_1809;
    int _1837 = _1835 + 1;
    int _1839 = _1837 + 1;
    float _1841 = _1215 + 0.5;
    int _1843 = abs(_1829);
    int _1845 = ~_1817;
    int _1847 = _1845 + 1;
    int _1849 = _1847 + 1;
    int _1851 = _1839 * as_type<int>(_1653);
    int _1853 = _1851 + _1793;
    float _1855 = _1537 * _1537;
    out.m_65.x = _1747;
    out.m_65.y = _1841;
    int _1857 = _1853 * _1849;
    float _1859 = fma(_1531, _1531, _1855);
    bool _1861 = _1557 >= 0.0;
    int _1863 = ~_1825;
    int _1865 = _1863 + 1;
    int _1867 = _1865 + 1;
    float _1869 = fma(_1475, _1475, _1859);
    int _1871 = ~_1843;
    int _1873 = _1871 + 1;
    int _1875 = _1873 + 1;
    bool _1877 = !_963;
    float _1879 = _1877 ? as_type<float>(_1705) : as_type<float>(0xffffffffu /* nan */);
    int _1881 = _1867 * as_type<int>(_1683);
    int _1883 = _1881 + _1833;
    bool _1885 = !_1003;
    int _1887 = _1885 ? _1719 : (-1);
    float _1889 = rsqrt(_1869);
    float _1891 = _1481 + 0.5;
    int _1893 = _1883 * _1875;
    float _1895 = _1461 + 0.5;
    int _1897 = as_type<int>(_1879) * _1817;
    int _1899 = _1897 + _1857;
    float _1901 = _1879;
    if (_1861)
    {
        _1901 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1903 = _1901;
    int _1905 = _1887 * _1843;
    int _1907 = _1905 + _1893;
    float _1909 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1911 = float(_1899);
    int _1913 = as_type<int>(_1903);
    if (_1861)
    {
        float _1915 = _1903 * 5.0;
        _1913 = as_type<int>(_1915);
    }
    int _1917 = _1913;
    float _1919 = float(_1907);
    float _1921 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _1895;
    out.m_67.y = _1891;
    float _1923 = _1909 * _1889;
    if (_1861)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6421 = as_type<float>(_1917);
        out.gl_Position.z = _6421;
    }
    float _1925 = _1531 * _1923;
    out.m_69.x = _1911;
    out.m_69.y = _1919;
    float _1927 = _1537 * _1923;
    out.m_71.w = _1921;
    if (_1861)
    {
        out.m_51.x = 0.0;
    }
    if (_1861)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1929 = -_1927;
    float _1931 = _1525 + _1929;
    float _1933 = _1475 * _1923;
    float _1935 = -_1925;
    float _1937 = _1521 + _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1941 = _1931 + _1939;
    float _1943 = -_1933;
    float _1945 = _1091 + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = _1937 + _1947;
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1945 + _1953;
    float _1957 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1951);
    float _1959 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1957);
    bool _1961 = _1959 >= 0.0;
    float _1963 = _1933;
    float _1965 = _1941;
    float _1967 = _1949;
    float _1969 = _1931;
    float _1971 = _1937;
    if (_1961)
    {
        _1513 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1973 = _1513;
    int _1975 = as_type<int>(_1973);
    if (_1961)
    {
        out.m_51.x = 0.0;
    }
    if (_1961)
    {
        float _1977 = _1973 * 5.0;
        _1975 = as_type<int>(_1977);
    }
    int _1979 = _1975;
    if (_1961)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6525 = as_type<float>(_1979);
        out.gl_Position.z = _6525;
    }
    if (_1961)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1981 = -_1525;
    float _1983 = _1981 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1985 = -_1521;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1989 = -_1091;
    float _1991 = _1989 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1993 = _1983 * _1983;
    float _1995 = -_1927;
    float _1997 = _1537 + _1995;
    float _1999 = fma(_1987, _1987, _1993);
    float _2001 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2003 = -_1925;
    float _2005 = _1531 + _2003;
    float _2007 = fma(_1991, _1991, _1999);
    float _2009 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2011 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2013 = rsqrt(_2007);
    float _2015 = -_2001;
    float _2017 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2015);
    float _2019 = -_2009;
    float _2021 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2019);
    float _2023 = -_2011;
    float _2025 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2023);
    float _2027 = -_1933;
    float _2029 = _1475 + _2027;
    float _2031 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2035 = -_2031;
    float _2037 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2039 = -_2033;
    float _2041 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2039);
    float _2043 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2045 = _1987 * _2013;
    float _2047 = _1991 * _2013;
    float _2049 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2051 = _1983 * _2013;
    float _2053 = _2045 * _2045;
    float _2055 = fma(_2047, _2047, _2053);
    float _2057 = rsqrt(_2055);
    float _2059 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2061 = -_2043;
    float _2063 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2061);
    float _2065 = -_2059;
    float _2067 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2065);
    float _2069 = -_2049;
    float _2071 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2069);
    float _2073 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2063);
    float _2075 = _2047 * _2057;
    float _2077 = _2045 * _2057;
    float _2079 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2071);
    float _2081 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2083 = -_2075;
    float _2085 = _2047 * _2083;
    float _2087 = -_2075;
    float _2089 = _2051 * _2087;
    float _2091 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2093 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2095 = -_2085;
    float _2097 = fma(_2045, _2077, _2095);
    float _2099 = _2051 * _2077;
    float _2101 = -_2091;
    float _2103 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2101);
    float _2105 = -_2093;
    float _2107 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2105);
    float _2109 = _2097 * _2097;
    float _2111 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2107);
    float _2113 = fma(_2099, _2099, _2109);
    float _2115 = -_2081;
    float _2117 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2115);
    float _2119 = 1.0 / _500;
    float _2121 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2103);
    float _2123 = fma(_2089, _2089, _2113);
    float _2125 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2117);
    float _2127 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2129 = -_2125;
    float _2131 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2121);
    float _2133 = rsqrt(_2123);
    float _2135 = -_2127;
    float _2137 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2135);
    float _2139 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2141 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2137);
    float _2143 = -_2139;
    float _2145 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2143);
    float _2147 = 1.0 / _2131;
    float _2149 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2145);
    float _2151 = _2097 * _2133;
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = _2041 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2157 = -_2153;
    float _2159 = _2157 + 1.0;
    float _2161 = -_2155;
    float _2163 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2161);
    float _2165 = fma(_2141, _2147, -1.0);
    float _2167 = _2159 * _2147;
    float _2169 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2163);
    float _2171 = fma(_2159, _2165, 1.0);
    float _2173 = _2149 * _2167;
    float _2175 = _2169 * _2167;
    float _2177 = 1.0 / _498;
    float _2179 = _2171 * _2171;
    float _2181 = fma(_2173, _2173, _2179);
    float _2183 = fma(_2175, _2175, _2181);
    float _2185 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2187 = rsqrt(_2183);
    float _2189 = _2175 * _2187;
    float _2191 = _2173 * _2187;
    float _2193 = _2171 * _2187;
    float _2195 = -_2189;
    float _2197 = _2045 * _2195;
    float _2199 = -_2191;
    float _2201 = _2051 * _2199;
    float _2203 = _2047 * _2193;
    float _2205 = 1.0 / _496;
    float _2207 = -_2191;
    float _2209 = -_2197;
    float _2211 = fma(_2047, _2207, _2209);
    float _2213 = -_2201;
    float _2215 = fma(_2045, _2193, _2213);
    float _2217 = -_2189;
    float _2219 = -_2203;
    float _2221 = fma(_2051, _2217, _2219);
    float _2223 = _2211 * _2211;
    float _2225 = fma(_2221, _2221, _2223);
    float _2227 = fma(_2215, _2215, _2225);
    float _2229 = rsqrt(_2227);
    float _2231 = _2221 * _2229;
    float _2233 = _2215 * _2229;
    float _2235 = _2211 * _2229;
    float _2237 = _2047 * _2231;
    float _2239 = _2051 * _2233;
    float _2241 = -_2237;
    float _2243 = fma(_2045, _2233, _2241);
    float _2245 = _2045 * _2235;
    float _2247 = -_2239;
    float _2249 = fma(_2047, _2235, _2247);
    float _2251 = _2243 * _2243;
    float _2253 = -_2245;
    float _2255 = fma(_2051, _2231, _2253);
    float _2257 = fma(_2249, _2249, _2251);
    float _2259 = fma(_2255, _2255, _2257);
    float _2261 = _1997 * _1997;
    float _2263 = fma(_2005, _2005, _2261);
    float _2265 = rsqrt(_2259);
    float _2267 = fma(_2029, _2029, _2263);
    float _2269 = sqrt(_2267);
    float _2271 = _2255 * _2265;
    float _2273 = _2249 * _2265;
    float _2275 = _2243 * _2265;
    float _2277 = in.m_73.x;
    float _2279 = in.m_73.y;
    float _2281 = in.m_73.z;
    float _2283 = _2045 * _2271;
    float _2285 = _2047 * _2275;
    float _2287 = _2051 * _2273;
    float _2289 = -_2283;
    float _2291 = fma(_2047, _2273, _2289);
    float _2293 = -_2285;
    float _2295 = fma(_2051, _2271, _2293);
    float _2297 = -_2287;
    float _2299 = fma(_2045, _2275, _2297);
    float _2301 = _2291 * _2291;
    float _2303 = fma(_2295, _2295, _2301);
    float _2305 = fma(_2299, _2299, _2303);
    float _2307 = _1889 * _2269;
    float _2309 = rsqrt(_2305);
    float _2311 = _2177 * _2279;
    float _2313 = _2205 * _2277;
    float _2315 = _2307 * _2185;
    float _2317 = _1487 * _2307;
    float _2319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2311);
    float _2321 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2323 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2313);
    float _2325 = _2119 * _2281;
    float _2327 = _2319 * _2315;
    float _2329 = _2307 * _2321;
    float _2331 = _2323 * _2317;
    float _2333 = _2327 * _2273;
    float _2335 = _2295 * _2309;
    float _2337 = _2325 * _2329;
    float _2339 = _2327 * _2275;
    float _2341 = _2291 * _2309;
    float _2343 = fma(_2331, _2335, _2333);
    float _2345 = _2299 * _2309;
    float _2347 = _2327 * _2271;
    float _2349 = fma(_2331, _2341, _2339);
    float _2351 = fma(_2045, _2337, _2343);
    float _2353 = fma(_2331, _2345, _2347);
    float _2355 = fma(_2051, _2337, _2349);
    float _2357 = _1521 + _2351;
    float _2359 = fma(_2047, _2337, _2353);
    float _2361 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2363 = _2357 * 0.20000000298023223876953125;
    float _2365 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2367 = fma(_2351, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2361);
    float _2369 = floor(_2363);
    float _2371 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2373 = fma(_2351, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2365);
    float _2375 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2367);
    float _2377 = _1525 + _2355;
    float _2379 = fma(_2351, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2371);
    float _2381 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2373);
    float _2383 = _2375 * 64.0;
    float _2385 = _1091 + _2359;
    float _2387 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2379);
    float _2389 = _2381 * 49.0;
    float _2391 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2393 = _2385 * 0.20000000298023223876953125;
    float _2395 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2397 = _2387 * 64.0;
    float _2399 = fma(_2389, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2391);
    float _2401 = -_2369;
    float _2403 = _2363 + _2401;
    float _2405 = floor(_2393);
    float _2407 = fma(_2389, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2395);
    float _2409 = fma(_2397, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2399);
    float _2411 = _2403 * 6.283185482025146484375;
    float _2413 = fma(_2397, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2407);
    float _2415 = _2385 + _2409;
    float _2417 = _2411 * 0.15915493667125701904296875;
    float _2419 = _2357 + _2413;
    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2423 = _2415 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2427 = _2419 + _2425;
    float _2429 = _2423 * _2423;
    float _2431 = _2417 * 6.283185482025146484375;
    float _2433 = sin(_2431);
    float _2435 = -_2405;
    float _2437 = _2393 + _2435;
    float _2439 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2441 = fma(_2427, _2427, _2429);
    float _2443 = _2437 * 6.283185482025146484375;
    float _2445 = fma(_2389, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2439);
    float _2447 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2449 = sqrt(_2441);
    float _2451 = _2443 * 0.15915493667125701904296875;
    float _2453 = fma(_2397, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2445);
    float _2455 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2447);
    float _2457 = _2377 + _2453;
    float _2459 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2455);
    float _2461 = _2451 * 6.283185482025146484375;
    float _2463 = sin(_2461);
    bool _2465 = _2449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2467 = _2433 + _2463;
    float _2469 = fma(_2467, 0.20000000298023223876953125, _2457);
    float _2471 = _2383;
    float _2473 = _2453;
    float _2475 = _2445;
    float _2477 = _2307;
    float _2479 = _2311;
    if (!_2465)
    {
        _2471 = _2419;
    }
    float _2481 = _2471;
    float _2483 = _2481;
    if (!_2465)
    {
        _2473 = _2415;
    }
    float _2485 = _2473;
    float _2487 = _2485;
    if (!_2465)
    {
        _2475 = _2469;
    }
    float _2489 = _2475;
    bool _2491 = !_2465;
    float _2493 = _2489;
    if (!_2491)
    {
        float _2495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2499 = _2449 + _2497;
        float _2501 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2503 = rsqrt(_2441);
        float _2505 = _2499 * _2495;
        float _2507 = _2505 * 0.15915493667125701904296875;
        float _2509 = _2507 * 6.283185482025146484375;
        float _2511 = cos(_2509);
        float _2513 = _2507 * 6.283185482025146484375;
        float _2515 = sin(_2513);
        float _2517 = _2511 + (-1.0);
        float _2519 = fma(_2515, _2501, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2521 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2523 = _2503 * _2519;
        float _2525 = fma(_2469, _2511, _2521);
        float _2527 = fma(_2427, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2529 = fma(_2423, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2493 = _2525;
        _2483 = _2527;
        _2487 = _2529;
    }
    float _2531 = _2493;
    float _2533 = _2483;
    float _2535 = _2487;
    float _2537 = -_1525;
    float _2539 = _2537 + _2531;
    float _2541 = -_1521;
    float _2543 = _2541 + _2533;
    float _2545 = _2459 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2547 = -_1091;
    float _2549 = _2547 + _2535;
    float _2551 = _2539 * _2539;
    float _2553 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2555 = 1.0 / _2545;
    float _2557 = fma(_2543, _2543, _2551);
    float _2559 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2553);
    float _2561 = fma(_2549, _2549, _2557);
    float _2563 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2559);
    float _2565 = sqrt(_2561);
    float _2567 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2569 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2573 = _2569 || _2571;
    bool _2575 = isnan(0.5);
    bool _2577 = _2573 || _2575;
    float _2579 = _2567 + _2545;
    float _2581 = _2579 * _2555;
    float _2583 = _2581 * 0.5;
    bool _2585 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2589 = _2585 || _2587;
    bool _2591 = isnan(0.5);
    bool _2593 = _2589 || _2591;
    bool _2595 = _2565 > 0.0;
    float _2597 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2599 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2597);
    float _2601 = 1.0 / _2599;
    bool _2603 = !_2595;
    float _2605 = _2531;
    float _2607 = _2535;
    float _2609 = _2533;
    float _2611 = _2549;
    int _2613 = as_type<int>(_2583);
    if (!_2603)
    {
        float _2615 = _190 * _190;
        float _2617 = fma(_188, _188, _2615);
        float _2619 = rsqrt(_2561);
        float _2621 = fma(_192, _192, _2617);
        float _2623 = sqrt(_2621);
        float _2625 = _2543 * _2619;
        float _2627 = _2539 * _2619;
        float _2629 = _2549 * _2619;
        bool _2631 = _2623 > 0.0;
        bool _2633 = !_2631;
        _2613 = as_type<int>(_2623);
        if (!_2633)
        {
            float _2635 = rsqrt(_2621);
            float _2637 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2639 = _190 * _2635;
            float _2641 = _188 * _2635;
            float _2643 = _192 * _2635;
            float _2645 = _2627 * _2639;
            float _2647 = fma(_2625, _2641, _2645);
            float _2649 = _2637 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2651 = fma(_2629, _2643, _2647);
            float _2653 = _2651 * _2649;
            float _2655 = fma(_188, _2653, _2533);
            float _2657 = fma(_190, _2653, _2531);
            float _2659 = fma(_192, _2653, _2535);
            _2605 = _2657;
            _2607 = _2659;
            _2609 = _2655;
            _2611 = _2643;
            _2613 = as_type<int>(_2637);
        }
    }
    float _2661 = _2605;
    float _2663 = _2607;
    float _2665 = _2609;
    float _2667 = _2611;
    int _2669 = _2613;
    float _2671 = -_1927;
    float _2673 = _2671 + _2661;
    float _2675 = -_1933;
    float _2677 = _2675 + _2663;
    float _2679 = -_1925;
    float _2681 = _2679 + _2665;
    float _2683 = _2673;
    float _2685 = _2681;
    float _2687 = _2667;
    int _2689 = _2669;
    if (_2593)
    {
        _196 = 1.0;
    }
    float _2691 = _196;
    float _2693 = _2691;
    if (_2577)
    {
        _1963 = _2673;
    }
    float _2695 = _1963;
    float _2697 = _2695;
    if (_2577)
    {
        _2683 = _2677;
    }
    float _2699 = _2683;
    float _2701 = _2699;
    if (!_2577)
    {
        float _2703 = _1941 * _1941;
        float _2705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2707 = -_1091;
        float _2709 = _2707 + _2663;
        float _2711 = -_1521;
        float _2713 = _2711 + _2665;
        float _2715 = fma(_1949, _1949, _2703);
        float _2717 = -_1525;
        float _2719 = _2717 + _2661;
        float _2721 = fma(_1955, _1955, _2715);
        float _2723 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2725 = sqrt(_2721);
        float _2727 = 1.0 / _2307;
        float _2729 = precise::min(_2725, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2731 = _2729 * _2705;
        float _2733 = _2723 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2735 = _2731 * _2727;
        float _2737 = _2733 * _2735;
        float _2739 = _2709 * _2735;
        float _2741 = fma(_2713, _2737, _1937);
        float _2743 = fma(_2719, _2737, _1931);
        float _2745 = fma(_2733, _2739, _1945);
        _2477 = _2727;
        _2697 = _2743;
        _2685 = _2741;
        _2701 = _2745;
        _1965 = _2703;
        _1967 = _2725;
        _1175 = _2739;
    }
    float _2747 = _2477;
    float _2749 = _2697;
    float _2751 = _2685;
    float _2753 = _2701;
    float _2755 = _1965;
    float _2757 = _1967;
    float _2759 = _1175;
    float _2761 = _2759;
    float _2763 = _2747;
    float _2765 = _2757;
    float _2767 = _2755;
    if (_2593)
    {
        _2761 = 1.0;
    }
    float _2769 = _2761;
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2773 = _2601 * _2771;
    float _2775 = _2769;
    if (!_2593)
    {
        float _2777 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2779 = _2777 * 0.15915493667125701904296875;
        float _2781 = _2779 * 6.283185482025146484375;
        float _2783 = cos(_2781);
        float _2785 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2787 = _2785 * 0.15915493667125701904296875;
        float _2789 = _2779 * 6.283185482025146484375;
        float _2791 = sin(_2789);
        float _2793 = 1.0 / _2783;
        float _2795 = _2787 * 6.283185482025146484375;
        float _2797 = cos(_2795);
        float _2799 = _2791 * _2793;
        float _2801 = _2787 * 6.283185482025146484375;
        float _2803 = sin(_2801);
        float _2805 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2807 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2805;
        float _2809 = _2797 * _2799;
        float _2811 = 1.0 / _2807;
        float _2813 = 1.0 / _2809;
        float _2815 = _2803 * _2813;
        float _2817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2819 = fma(_2773, _2815, _2817);
        float _2821 = _2819 * _2811;
        float _2823 = precise::clamp(_2821, 0.0, 1.0);
        _2763 = _2779;
        _2765 = _2811;
        _2693 = _2823;
    }
    float _2825 = _2763;
    float _2827 = _2765;
    float _2829 = _2693;
    float _2831 = _2825;
    float _2833 = _2827;
    if (!_2593)
    {
        float _2835 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2837 = _2835 * 0.15915493667125701904296875;
        float _2839 = _2837 * 6.283185482025146484375;
        float _2841 = cos(_2839);
        float _2843 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2845 = _2843 * 0.15915493667125701904296875;
        float _2847 = _2837 * 6.283185482025146484375;
        float _2849 = sin(_2847);
        float _2851 = 1.0 / _2841;
        float _2853 = _2845 * 6.283185482025146484375;
        float _2855 = cos(_2853);
        float _2857 = _2849 * _2851;
        float _2859 = _2845 * 6.283185482025146484375;
        float _2861 = sin(_2859);
        float _2863 = _2855 * _2857;
        float _2865 = 1.0 / _2863;
        float _2867 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2869 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2867;
        float _2871 = 1.0 / _2869;
        float _2873 = _2861 * _2865;
        float _2875 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2877 = fma(_2773, _2873, _2875);
        float _2879 = _2877 * _2871;
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = -_2881;
        float _2885 = _2883 + 1.0;
        _2831 = _2851;
        _2775 = _2885;
    }
    float _2887 = _2831;
    float _2889 = _2775;
    float _2891 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2893 = _2749 + _2891;
    float _2895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2897 = _2751 + _2895;
    float _2899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2901 = _2753 + _2899;
    float _2903 = _2893 * _2893;
    float _2905 = fma(_2897, _2897, _2903);
    float _2907 = fma(_2901, _2901, _2905);
    float _2909 = rsqrt(_2907);
    float _2911 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2913 = _2897 * _2911;
    float _2915 = _2901 * _2911;
    float _2917 = _2913 * _2913;
    float _2919 = _2915 * _2915;
    float _2921 = _2917 + _2919;
    float _2923 = sqrt(_2921);
    bool _2925 = _2923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2929 = _2923 + _2927;
    float _2931 = _2901;
    float _2933 = _2921;
    float _2935 = _2929;
    float _2937 = _2893;
    if (_2925)
    {
        float _2939 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2931 = _2939;
    }
    float _2941 = _2931;
    if (_2925)
    {
        float _2943 = rsqrt(_2921);
        _2933 = _2943;
    }
    float _2945 = _2933;
    float _2947 = _2945;
    if (_2925)
    {
        float _2949 = _2929 * _2941;
        _2935 = _2949;
    }
    float _2951 = _2935;
    if (_2925)
    {
        float _2953 = _2951 * 0.15915493667125701904296875;
        _2767 = _2953;
    }
    float _2955 = _2767;
    float _2957 = _2909;
    if (_2925)
    {
        float _2959 = _2955 * 6.283185482025146484375;
        float _2961 = sin(_2959);
        _2957 = _2961;
    }
    float _2963 = _2957;
    float _2965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2967 = precise::max(0.0, _2965);
    float _2969 = _2887;
    float _2971 = _2967;
    float _2973 = _2965;
    if (_2925)
    {
        float _2975 = _2955 * 6.283185482025146484375;
        float _2977 = cos(_2975);
        _2969 = _2977;
    }
    float _2979 = _2969;
    float _2981 = -_2911;
    float _2983 = -_2967;
    float _2985 = fma(_2893, _2981, _2983);
    if (!_2925)
    {
        _2937 = _2915;
    }
    float _2987 = _2937;
    float _2989 = _2987;
    if (_2925)
    {
        float _2991 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2971 = _2991;
    }
    float _2993 = _2971;
    float _2995 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2997 = _2993;
    float _2999 = _2963;
    if (_2925)
    {
        float _3001 = fma(_2963, _2993, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2997 = _3001;
    }
    float _3003 = _2997;
    float _3005 = _3003;
    if (!_2925)
    {
        _2999 = _2913;
    }
    float _3007 = _2999;
    float _3009 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2995);
    float _3011 = _3007;
    float _3013 = _2979;
    if (_2925)
    {
        float _3015 = _2979 + (-1.0);
        _2973 = _3015;
    }
    float _3017 = _2973;
    if (_2925)
    {
        float _3019 = _2945 * _3003;
        _2687 = _3019;
    }
    float _3021 = _2687;
    if (!_2925)
    {
        _3005 = _2985;
    }
    float _3023 = _3005;
    float _3025 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3009);
    float _3027 = _3023;
    if (_2925)
    {
        float _3029 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2833 = _3029;
    }
    float _3031 = _2833;
    if (_2925)
    {
        float _3033 = _2913 * _3021;
        _3011 = _3033;
    }
    float _3035 = _3011;
    if (!_2925)
    {
        _2947 = _2917;
    }
    float _3037 = _2947;
    float _3039 = _3037;
    if (_2925)
    {
        float _3041 = _2915 * _3021;
        _2989 = _3041;
    }
    float _3043 = _2989;
    if (_2925)
    {
        float _3045 = fma(_2985, _2979, _3031);
        _3027 = _3045;
    }
    float _3047 = _3027;
    if (_2925)
    {
        float _3049 = _3035 * _3035;
        _3039 = _3049;
    }
    float _3051 = _3039;
    float _3053 = sqrt(_2907);
    if (!_2925)
    {
        _3013 = _2919;
    }
    float _3055 = _3013;
    float _3057 = _3055;
    if (_2925)
    {
        float _3059 = _3043 * _3043;
        _3057 = _3059;
    }
    float _3061 = _3057;
    float _3063 = fma(_3047, _3047, _3051);
    float _3065 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3067 = _3025 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3069 = _3063 + _3061;
    float _3071 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3065);
    float _3073 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3075 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3071);
    float _3077 = rsqrt(_3069);
    float _3079 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3081 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3073);
    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3085 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3083);
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = _3075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3091 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3079);
    float _3093 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3081);
    float _3095 = -_3087;
    float _3097 = _3095 + 1.0;
    float _3099 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3101 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3103 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3091);
    float _3105 = _3093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3107 = -_3101;
    float _3109 = fma(_3107, _3099, 1.0);
    float _3111 = _3103 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3113 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3115 = abs(_3097);
    float _3117 = log2(_3115);
    float _3119 = _3077 * _3035;
    float _3121 = _3077 * _3047;
    float _3123 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3113);
    float _3125 = _3077 * _3043;
    float _3127 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3129 = _3121 + 1.0;
    float _3131 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3123);
    float _3133 = log2(_3109);
    float _3135 = -_3127;
    float _3137 = fma(_3121, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3135);
    float _3139 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3131);
    float _3141 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3143 = -_3125;
    float _3145 = fma(_3143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3137);
    float _3147 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3149 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3151 = fma(_3145, -0.5, 0.5);
    float _3153 = 1.0 / _3139;
    float _3155 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3141);
    float _3157 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3155);
    float _3159 = _3133 * 0.693147182464599609375;
    float _3161 = exp2(_3149);
    float _3163 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3157);
    float _3165 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3167 = sqrt(_3151);
    float _3169 = fma(_3145, 0.5, 0.5);
    float _3171 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3147);
    float _3173 = _3163 * _3153;
    float _3175 = fma(_3169, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3177 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3171);
    float _3179 = -_3121;
    float _3181 = fma(_3161, _3129, _3179);
    float _3183 = fma(_3169, _3175, -0.212114393711090087890625);
    float _3185 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3177);
    float _3187 = fma(_3181, 0.5, 0.5);
    float _3189 = fma(_3169, _3183, 1.570728778839111328125);
    float _3191 = _3185 * _3153;
    float _3193 = fma(_3173, 0.5, 0.5);
    float _3195 = _3167 * 0.636619746685028076171875;
    float _3197 = fma(_3191, -0.5, 0.5);
    float _3199 = -_3189;
    float _3201 = fma(_3195, _3199, 1.0);
    float3 _8451 = float3(_3193, _3197, _3165);
    float _3203 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8451, float3(0.0), isnan(_8451)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8451, float3(0.0), isnan(_8451)), level(0.0)).x;
    float3 _8462 = float3(_3193, _3197, _3165);
    float4 _3206 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8462, float3(0.0), isnan(_8462)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8462, float3(0.0), isnan(_8462)), level(0.0)).xyzw;
    float _3208 = _3206.x;
    float _3210 = _3206.y;
    float _3212 = _3206.z;
    float _3214 = _3206.w;
    float2 _8479 = float2(_3201, _3187);
    float3 _3218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8479, float2(0.0), isnan(_8479)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8479, float2(0.0), isnan(_8479)), level(0.0)).xyz;
    float _3220 = _3218.x;
    float _3222 = _3218.y;
    float _3224 = _3218.z;
    float _3226 = in.m_75.y;
    bool _3228 = _2311 != 0.0;
    bool _3230 = isnan(_2311);
    bool _3232 = _3228 || _3230;
    bool _3234 = isnan(0.0);
    bool _3236 = _3232 || _3234;
    float _3238 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3240 = in.m_75.z;
    bool _3242 = _2313 == 0.0;
    bool _3244 = !_3236;
    bool _3246 = _3242 && _3244;
    float _3248 = in.m_75.x;
    bool _3250 = _2325 == 0.0;
    bool _3252 = _3250 && _3246;
    float _3254 = exp2(_3238);
    out.m_61.x = _476;
    out.m_61.y = _486;
    out.m_61.z = _488;
    out.m_61.w = _484;
    out.m_71.w = _1921;
    out.m_77.x = _2335;
    out.m_77.y = _2341;
    out.m_77.z = _2345;
    int _3256 = as_type<int>(_3193);
    float _3258 = _3105;
    if (_3252)
    {
        float _3260 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3226);
        _2689 = as_type<int>(_3260);
    }
    int _3262 = _2689;
    int _3264 = _3262;
    if (!_3252)
    {
        float _3266 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3226);
        _3264 = as_type<int>(_3266);
    }
    int _3268 = _3264;
    if (_3252)
    {
        _2479 = _3226;
    }
    float _3270 = _2479;
    float _3272 = -_3254;
    float _3274 = _3272 + 1.0;
    float _3276 = _3270;
    if (_3252)
    {
        float _3278 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3240);
        _3256 = as_type<int>(_3278);
    }
    int _3280 = _3256;
    int _3282 = _3280;
    if (!_3252)
    {
        float _3284 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3240);
        _3282 = as_type<int>(_3284);
    }
    int _3286 = _3282;
    bool _3288 = !_3252;
    float _3290 = _3288 ? as_type<float>(_3268) : _3226;
    float _3292 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_3252)
    {
        _3276 = as_type<float>(_3268);
    }
    float _3294 = _3276;
    float _3296 = _3248;
    if (!_3252)
    {
        float _3298 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3248);
        _3296 = _3298;
    }
    float _3300 = _3296;
    bool _3302 = !_3252;
    float _3304 = _3302 ? as_type<float>(_3286) : _3240;
    float _3306 = _3290 * _3290;
    float _3308 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3292);
    if (_3252)
    {
        _3258 = _3240;
    }
    float _3310 = _3258;
    out.m_79.x = _2751;
    out.m_79.y = _2749;
    out.m_79.z = _2753;
    float _3312 = fma(_3304, _3304, _3306);
    float _3314 = _3310;
    if (!_3252)
    {
        _3314 = as_type<float>(_3286);
    }
    float _3316 = _3314;
    float _3318 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3308);
    float _3320 = _3139 * 0.5;
    bool _3322 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3324 = isnan(_3053);
    bool _3326 = _3322 || _3324;
    bool _3328 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3330 = _3326 || _3328;
    out.m_81.x = _1937;
    out.m_81.y = _1931;
    out.m_81.z = _1945;
    float _3332 = rsqrt(_3312);
    float _3334 = fma(_3185, -0.5, _3320);
    if (!_3330)
    {
        _1969 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3336 = _1969;
    float _3338 = _3336;
    float _3340 = _3336;
    if (!_3330)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3342 = _1971;
    float _3344 = _3290 * _3332;
    float _3346 = _3304 * _3332;
    float _3348 = -_2051;
    float _3350 = _3344 * _3348;
    float _3352 = -_2047;
    float _3354 = _3344 * _3352;
    float _3356 = -_2045;
    float _3358 = _3344 * _3356;
    float _3360 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3318);
    float _3362 = fma(_3346, _2275, _3350);
    float _3364 = fma(_3346, _2271, _3354);
    float _3366 = _2273 * _3294;
    float _3368 = fma(_3346, _2273, _3358);
    float _3370 = _2275 * _3294;
    float _3372 = _2271 * _3294;
    float _3374 = fma(_2335, _3300, _3366);
    float _3376 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3368;
    out.m_83.y = _3362;
    out.m_83.z = _3364;
    float _3378 = fma(_2345, _3300, _3372);
    float _3380 = fma(_2341, _3300, _3370);
    float _3382 = _3360 + _3139;
    float _3384 = _3163 + _3139;
    out.gl_Position.x = _3163;
    out.gl_Position.y = _3185;
    out.gl_Position.z = _3360;
    out.gl_Position.w = _3139;
    float _3386 = _3382 * 0.5;
    float _3388 = _3384 * 0.5;
    float _3390 = _2829 * _2889;
    float _3392 = fma(_2047, _3316, _3378);
    float _3394 = fma(_2045, _3316, _3374);
    float _3396 = fma(_2051, _3316, _3380);
    out.m_85.x = _3388;
    out.m_85.y = _3334;
    out.m_85.z = _3386;
    out.m_85.w = _3139;
    float _3398 = _3390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3400 = _3390;
    float _3402 = _3342;
    float _3404 = _3342;
    if (!_3330)
    {
        _3400 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3406 = _3400;
    out.m_87.x = _3394;
    out.m_87.y = _3396;
    out.m_87.z = _3392;
    float _3408 = _3376 * _3203;
    float _3410 = -_3376;
    float _3412 = _3410 + 1.0;
    float _3414 = _3214 * _3408;
    float _3416 = _3224 * _3408;
    float _3418 = fma(_3220, _3414, _3208);
    float _3420 = fma(_3222, _3414, _3210);
    float _3422 = _3214 * _3412;
    float _3424 = fma(_3214, _3416, _3212);
    out.m_89.x = _3418;
    out.m_89.y = _3420;
    out.m_89.z = _3424;
    out.m_89.w = _3422;
    bool _3426 = !_3330;
    float _3428 = _3406;
    float _3430 = _3406;
    if (!_3426)
    {
        bool _3432 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3434 = isnan(_3053);
        bool _3436 = _3432 || _3434;
        bool _3438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3440 = _3436 || _3438;
        if (!_3440)
        {
            float _3442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3444 = _3053 + _3442;
            float _3446 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3448 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3446;
            float _3450 = 1.0 / _3448;
            float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3458 = _3456 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3460 = _3444 * _3450;
            float _3462 = precise::clamp(_3460, 0.0, 1.0);
            float _3464 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3466 = _3464 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3468 = fma(_3462, _3458, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3470 = fma(_3462, _3466, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3472 = fma(_3462, _3454, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3404 = _3472;
            _3340 = _3470;
            _3430 = _3468;
            _3474 = true;
        }
        else
        {
            bool _3476 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3478 = isnan(_3053);
            bool _3480 = _3476 || _3478;
            bool _3482 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3484 = _3480 || _3482;
            if (!_3484)
            {
                _3338 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3486 = _3338;
            _3340 = _3486;
            if (!_3484)
            {
                _3402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3488 = _3402;
            _3404 = _3488;
            if (!_3484)
            {
                _3428 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3490 = _3428;
            bool _3492 = !_3484;
            _3430 = _3490;
            if (!_3492)
            {
                bool _3494 = _3053 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3496 = isnan(_3053);
                bool _3498 = _3494 || _3496;
                bool _3500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3502 = _3498 || _3500;
                if (!_3502)
                {
                    float _3504 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3506 = _3053 + _3504;
                    float _3508 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3510 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3508;
                    float _3512 = 1.0 / _3510;
                    float _3514 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3518 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3520 = _3518 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3522 = _3506 * _3512;
                    float _3524 = precise::clamp(_3522, 0.0, 1.0);
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3530 = fma(_3524, _3520, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3532 = fma(_3524, _3528, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3534 = fma(_3524, _3516, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3404 = _3534;
                    _3340 = _3532;
                    _3430 = _3530;
                    _3474 = true;
                }
                else
                {
                    _3404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3340 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3430 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3474 = false;
    float _3536 = _3404;
    float _3538 = _3340;
    float _3540 = _3430;
    float _3542 = _3398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _3544 = _3536 * 0.586610972881317138671875;
    bool _3546 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3542;
    float _3548 = fma(_3538, 0.298911988735198974609375, _3544);
    bool _3550 = _2829 > 0.0;
    bool _3552 = isnan(_2829);
    bool _3554 = _3550 || _3552;
    bool _3556 = isnan(0.0);
    bool _3558 = _3554 || _3556;
    float _3560 = fma(_3540, 0.114477999508380889892578125, _3548);
    bool _3562 = _2889 <= 0.0;
    bool _3564 = !_3558;
    bool _3566 = _3562 || _3564;
    float _3568 = -_3560;
    float _3570 = _3568 + _3538;
    float _3572 = -_3560;
    float _3574 = _3572 + _3536;
    float _3576 = -_3560;
    float _3578 = _3576 + _3540;
    float _3580 = fma(_3570, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3582 = fma(_3574, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3584 = fma(_3578, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    bool _3586 = !_3546;
    if (!_3586)
    {
        float _3588 = -_2749;
        float _3590 = _3588 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3592 = -_2751;
        float _3594 = _3592 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3596 = -_2753;
        float _3598 = _3596 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3600 = _3590 * _3590;
        float _3602 = fma(_3594, _3594, _3600);
        float _3604 = fma(_3598, _3598, _3602);
        float _3606 = sqrt(_3604);
        float _3608 = rsqrt(_3604);
        float _3610 = -_3606;
        float _3612 = _3610 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3614 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3616 = precise::clamp(_3614, 0.0, 1.0);
        float _3618 = _3594 * _3608;
        float _3620 = _3590 * _3608;
        float _3622 = abs(_3616);
        float _3624 = log2(_3622);
        float _3626 = _3598 * _3608;
        float _3628 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3630 = _3396 * _3620;
        float _3632 = -_3620;
        float _3634 = -_3628;
        float _3636 = fma(_3632, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3634);
        float _3638 = fma(_3394, _3618, _3630);
        float _3640 = -_3626;
        float _3642 = fma(_3640, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3636);
        float _3644 = fma(_3392, _3626, _3638);
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3650 = _3642 + _3648;
        float _3652 = _3624 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3654 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3656 = precise::clamp(_3654, 0.0, 1.0);
        float _3658 = exp2(_3652);
        float _3660 = _3658 * _3656;
        float _3662 = _3646 * _3660;
        float _3664 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3666 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3668 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3664;
        out.m_91.y = _3666;
        out.m_91.z = _3668;
    }
    out.m_93.x = _3580;
    out.m_93.y = _3582;
    out.m_93.z = _3584;
    if (!_3566)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3670 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3670;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

