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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_2C [[id(7)]];
    sampler vp_t_tcb_2CSmplr [[id(8)]];
    texture2d<float> vp_t_tcb_28 [[id(9)]];
    sampler vp_t_tcb_28Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_24 [[id(11)]];
    sampler vp_t_tcb_24Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_2CSmplr_w [[id(19)]];
    sampler vp_t_tcb_28Smplr_w [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_32Smplr_w [[id(22)]];
    sampler vp_t_tcb_30Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_77 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_91 [[user(locn13)]];
    float4 m_95 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_87 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_52 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2559 = false;
    bool _1852 = false;
    bool _572 = false;
    bool _418 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_52.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_55.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2858 = as_type<float>(_134);
        out.gl_Position.z = _2858;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_57.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_55.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2928 = as_type<float>(_172);
        out.gl_Position.z = _2928;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_59.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _204 + _210;
    bool _214 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _216 = isnan(_204);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _204 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = 1.0 / _228;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _240;
    float _248 = 1.0 / _236;
    float _250 = _208 * _242;
    bool _252 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_204);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_224;
    float _266 = _264 + 1.0;
    float _268 = _262 * _266;
    float _270 = _212 * _246;
    bool _272 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _274 = isnan(_204);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    bool _288 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _290 = isnan(_204);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = -_262;
    float _306 = _304 + 1.0;
    float _308 = -_282;
    float _310 = _308 + 1.0;
    float _312 = _232 * _248;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _318;
    float _322 = _298 * _310;
    float _324 = fma(_286, _312, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _326 = fma(_316, _312, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _328 = fma(_320, _312, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _330 = _282 * _306;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _336 = _326 * _322;
    float _338 = _328 * _322;
    float _340 = _324 * _322;
    float _342 = -_298;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].x, _338);
    float _352 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].y, _336);
    float _354 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].z, _340);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = fma(_302, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_348, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_334, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_360, _330, _350);
    float _376 = fma(_358, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_368, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _380 = fma(_372, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _382 = fma(_362, _330, _352);
    float _384 = fma(_364, _330, _354);
    float _386 = fma(_376, _268, _374);
    float _388 = fma(_378, _268, _382);
    float _390 = fma(_380, _268, _384);
    float _392 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_244;
    float _416;
    if (!_398)
    {
        float _400 = in.m_59.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _152 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _430 = _426 + _428;
    float _432 = in.m_61.x;
    float _434 = in.m_61.y;
    float _436 = in.m_61.z;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _442 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = isnan(_426);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _458 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _460 = isnan(_426);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _470;
    bool _474 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _476 = isnan(_426);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = 1.0 / _440;
    float _488 = -_452;
    float _490 = _488 + 1.0;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _494 = _468 * _490;
    float _496 = -_468;
    float _498 = _496 + 1.0;
    float _500 = 1.0 / _456;
    float _502 = _472 * _486;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _508 = _396 * _436;
    float _510 = _394 * _434;
    float _512 = fma(_502, _430, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _514 = _392 * _432;
    float _516 = _506 * _500;
    float _518 = _512 * _494;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _426 + _524;
    float _528 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[115].x, _518);
    float _530 = _452 * _522;
    float _532 = fma(_516, _526, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _536 = fma(_532, _530, _528);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _540 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[117].x, _536);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _546 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _548 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _550 = _544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _540;
    out.m_63.y = _550;
    out.m_63.z = _546;
    out.m_63.w = _548;
    bool _552 = !_492;
    float _570;
    if (!_552)
    {
        float _554 = in.m_59.x;
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _558 = _554 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[11].w, _152);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        float _574 = float(_118);
        float _576 = 1.0 / _574;
        float _578 = _152 * _576;
        _570 = _578;
    }
    _572 = false;
    float _580 = _570;
    float _582 = in.m_59.z;
    float _584 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _586 = log2(_584);
    float _588 = in.m_59.y;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _592 = _590 != 0;
    float _594 = in.m_59.x;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _606 = _604 != 0;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _610 = !_598;
    int _612 = _610 ? 0 : 1;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _616 = _586 * _152;
    bool _618 = !_606;
    int _620 = _618 ? 0 : 1;
    float _622 = _582 * 2.0;
    float _624 = exp2(_616);
    float _626 = _588 * 2.0;
    float _628 = _588 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _630 = _594 * 2.0;
    float _632 = floor(_622);
    float _634 = _594 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _636 = fma(_628, -2.0, _614);
    float _638 = _628;
    if (!_592)
    {
        _638 = _588;
    }
    float _640 = _638;
    float _642 = -_608;
    float _644 = fma(_634, 2.0, _642);
    float _646 = _594 + _588;
    float _648 = _640;
    float _650 = _646;
    if (_592)
    {
        _648 = _594;
    }
    float _652 = _648;
    float _654 = floor(_630);
    float _656 = -_152;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[76].x, _644);
    float _660 = -_624;
    float _662 = _660 + 1.0;
    float _664 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _636);
    float _666 = floor(_626);
    float _668 = _646 + (-1.0);
    bool _670 = _632 > 0.0;
    bool _672 = _632 >= 0.0;
    bool _674 = isnan(_632);
    bool _676 = _672 || _674;
    bool _678 = isnan(0.0);
    bool _680 = _676 || _678;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _684 = _632;
    if (!_592)
    {
        _684 = _582;
    }
    float _686 = _684;
    float _688 = _686;
    if (!_592)
    {
        _650 = _582;
    }
    float _690 = _650;
    float _692 = _690;
    if (_592)
    {
        _688 = _588;
    }
    float _694 = _688;
    if (_592)
    {
        _692 = _588;
    }
    float _696 = _692;
    int _698 = _680 ? 0 : 1;
    float _700 = _694 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _702 = _654 > 0.0;
    bool _704 = _654 >= 0.0;
    bool _706 = isnan(_654);
    bool _708 = _704 || _706;
    bool _710 = isnan(0.0);
    bool _712 = _708 || _710;
    bool _714 = _666 > 0.0;
    bool _716 = _666 >= 0.0;
    bool _718 = isnan(_666);
    bool _720 = _716 || _718;
    bool _722 = isnan(0.0);
    bool _724 = _720 || _722;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _730 = ~_698;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[83].z, _726);
    float _738 = _652 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _742 = abs(_612);
    float _744 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[83].w, _728);
    int _746 = _734;
    if (!_670)
    {
        int _748 = ~_698;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = -_740;
    float _756 = fma(_738, 2.0, _754);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _760 = float(_742);
    float _762 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _744);
    float _764 = float(_752);
    float _766 = fma(_700, -2.0, _758);
    int _768 = _712 ? 0 : 1;
    float _770 = -_152;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[81].x, _756);
    bool _774 = !_602;
    int _776 = _774 ? 0 : 1;
    float _778 = _760 * _764;
    int _780 = ~_768;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = in.m_65.x;
    float _788 = in.m_65.y;
    float _790 = in.m_65.z;
    int _792 = _784;
    if (!_702)
    {
        int _794 = ~_768;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _766);
    int _802 = abs(_776);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _806 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _808 = isnan(1.0);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _814 = _810 || _812;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _818 = 1.0 + _816;
    int _820 = _724 ? 0 : 1;
    float _822 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[78].w, _804);
    float _824 = 1.0 / _818;
    int _826 = ~_820;
    int _828 = _826 + 1;
    int _830 = _828 + 1;
    float _832 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _822);
    float _834 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _736);
    float _836 = _778 * (-2.0);
    float _838 = float(_802);
    int _840 = _830;
    float _842 = _832;
    if (!_714)
    {
        int _844 = ~_820;
        int _846 = _844 + 1;
        _840 = _846;
    }
    int _848 = _840;
    float _850 = _594 + (-0.5);
    float _852 = float(_798);
    float _854 = fma(_836, _786, _786);
    float _856 = fma(_682, _836, _682);
    int _858 = abs(_620);
    float _860 = _588 + _582;
    float _862 = _838 * _852;
    float _864 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].x, _854);
    float _866 = float(_858);
    float _868 = _860 + (-1.0);
    float _870 = float(_848);
    float _872 = _862 * (-2.0);
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _876 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _884 = _880 || _882;
    float _886 = _866 * _870;
    float _888 = _588 + (-0.5);
    float _890 = fma(_872, _788, _788);
    float _892 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[78].z, _874);
    float _894 = _884 ? _662 : 0.0;
    float _896 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _898 = _594 + _582;
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].y, _890);
    float _902 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _892);
    bool _904 = _884;
    if (_814)
    {
        float _906 = _894 * _824;
        _154 = _906;
    }
    float _908 = _154;
    float _910 = _898 + (-1.0);
    float _912 = _886 * (-2.0);
    float _914 = fma(_896, _872, _896);
    float _916 = fma(_856, _908, _864);
    float _918 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _920 = fma(_912, _790, _790);
    float _922 = _582 + (-0.5);
    float _924 = fma(_914, _908, _900);
    float _926 = fma(_918, _912, _918);
    float _928 = in.m_67.x;
    float _930 = in.m_67.y;
    float _932 = in.m_67.z;
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[196].z, _920);
    float _936 = _916 * 0.15915493667125701904296875;
    float _938 = _924 * 0.15915493667125701904296875;
    float _940 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _942 = fma(_926, _908, _934);
    float _944 = _936 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _950 = _942 * 0.15915493667125701904296875;
    float _952 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _954 = in.m_52.x;
    float _956 = in.m_52.y;
    float _958 = in.m_52.z;
    float _960 = _936 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _938 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _928);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _930);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _932);
    float _974 = _968 * _940;
    float _976 = _938 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _972 * _952;
    float _982 = _956 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _984 = _956 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = _956 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _988 = _950 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = _970 * _948;
    float _994 = _946 * _966;
    float _996 = _962 * _966;
    float _998 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[4].x, _982);
    float _1000 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _1002 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[5].x, _986);
    float _1004 = _950 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = _962 * _978;
    float _1010 = _946 * _978;
    float _1012 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1002);
    float _1014 = _962 * _990;
    float _1016 = _946 * _990;
    float _1018 = _978 * _990;
    float _1020 = _966 * _990;
    float _1022 = _1014 * _992;
    float _1024 = _1016 * _992;
    float _1026 = fma(_1006, _1008, _994);
    float _1028 = fma(_1006, _994, _1008);
    float _1030 = -_992;
    float _1032 = _1006 * _1030;
    float _1034 = -_996;
    float _1036 = fma(_1006, _1010, _1034);
    float _1038 = -_1010;
    float _1040 = fma(_1006, _996, _1038);
    float _1042 = fma(_1026, _974, _1022);
    float _1044 = fma(_1018, _974, _1032);
    float _1046 = fma(_1036, _974, _1024);
    float _1048 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1000);
    float _1050 = fma(_1040, _980, _1042);
    float _1052 = fma(_1020, _980, _1044);
    float _1054 = fma(_1028, _980, _1046);
    float _1056 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[4].z, _998);
    float _1058 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1060 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1062 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1058);
    float _1068 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1060);
    float _1070 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1066);
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1068);
    float _1074 = _1064 + _1070;
    float _1076 = _1062 + _1072;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1080 = _1074 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1084 = _1076 + _1082;
    float _1086 = _1080 * _1080;
    float _1088 = _1084 * _1084;
    float _1090 = _1086 + _1088;
    float _1092 = sqrt(_1090);
    bool _1094 = _1092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1092 + _1096;
    float _1100 = 0.0;
    float _1102 = _1092;
    float _1104 = _1050;
    float _1106 = _1074;
    float _1108 = _1076;
    float _1110 = _1088;
    float _1112 = _1086;
    float _1114 = _1014;
    if (_1094)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1116;
    }
    float _1118 = _1100;
    if (_1094)
    {
        float _1120 = _1098 * _1118;
        _1102 = _1120;
    }
    float _1122 = _1102;
    float _1124 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1126 = _1122;
    if (_1094)
    {
        float _1128 = rsqrt(_1090);
        _1104 = _1128;
    }
    float _1130 = _1104;
    float _1132 = _1130;
    if (_1094)
    {
        float _1134 = _1122 * 0.15915493667125701904296875;
        _1126 = _1134;
    }
    float _1136 = _1126;
    float _1138 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1124);
    float _1140 = _1012 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1142 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1138);
    float _1144 = _1136;
    if (_1094)
    {
        float _1146 = _1136 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        _1144 = _1148;
    }
    float _1150 = _1144;
    float _1152 = _1140 + _1142;
    float _1154 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1156 = _1152;
    if (_1094)
    {
        float _1158 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1158;
    }
    float _1160 = _1156;
    float _1162 = floor(_1154);
    float _1164 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1166 = floor(_1164);
    float _1168 = _1160;
    if (_1094)
    {
        float _1170 = fma(_1150, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1168 = _1170;
    }
    float _1172 = _1168;
    if (_1094)
    {
        float _1174 = _1130 * _1172;
        _1132 = _1174;
    }
    float _1176 = _1132;
    if (_1094)
    {
        float _1178 = fma(_1080, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1106 = _1178;
    }
    float _1180 = _1106;
    if (_1094)
    {
        float _1182 = fma(_1084, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1108 = _1182;
    }
    float _1184 = _1108;
    float _1186 = -_1162;
    float _1188 = _1154 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1192 = _1180 + _1190;
    float _1194 = fma(_1180, 6.2500002968590706586837768554688e-05, 0.5);
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1198 = _1184 + _1196;
    float _1200 = fma(_1184, 6.2500002968590706586837768554688e-05, 0.5);
    float _1202 = -_1166;
    float _1204 = _1164 + _1202;
    float _1206 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1208 = fma(_1198, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4584 = float2(_1194, _1200);
    float _1210 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_4584, float2(0.0), isnan(_4584)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_4584, float2(0.0), isnan(_4584)), level(0.0)).y;
    float2 _4594 = float2(_1206, _1208);
    float _1212 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4594, float2(0.0), isnan(_4594)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4594, float2(0.0), isnan(_4594)), level(0.0)).x;
    float2 _4602 = float2(_1188, _1204);
    float _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4602, float2(0.0), isnan(_4602)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4602, float2(0.0), isnan(_4602)), level(0.0)).x;
    float _1216 = in.m_69.x;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1222 = _1220 != 0;
    float _1224 = in.m_69.y;
    bool _1226 = _582 > 0.5;
    bool _1228 = _588 > 0.5;
    float _1230 = in.m_59.w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1240 = _1238 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[133].w);
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1246 = _1224;
    if (_1222)
    {
        bool _1248 = _594 > 0.5;
        _904 = _1248;
    }
    bool _1250 = _904;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1256 = 1.0 / _1234;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1260 = _1258 != 0;
    float _1262 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1268 = _1216;
    if (_1222)
    {
        float _1270 = -_1216;
        float _1272 = _1270 + 1.0;
        _1242 = as_type<int>(_1272);
    }
    int _1274 = _1242;
    if (!_1222)
    {
        _1244 = _1216;
    }
    float _1276 = _1244;
    float _1278 = 1.0 / _1240;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1280;
    float _1284 = _1276;
    if (_1222)
    {
        float _1286 = _1250 ? as_type<float>(_1274) : _1216;
        _1284 = _1286;
    }
    float _1288 = _1284;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1294 = _1230 > 0.5;
    float _1296 = 1.0 / _1266;
    float _1298 = _1292 * _1256;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1310 = _580 + _1308;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1318 = _1316 != 0;
    float _1320 = 1.0 / _1254;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1324 = _580 + _1322;
    float _1326 = _1302 * _1278;
    bool _1328 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1330 = isnan(_580);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = fma(_1298, _1324, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1344 = _580 + _1342;
    float _1346 = _1306 * _1296;
    float _1348 = -_1224;
    float _1350 = _1348 + 1.0;
    float _1352 = -_1338;
    float _1354 = _1352 + 1.0;
    float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1358 = fma(_1346, _1344, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    bool _1360 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1362 = isnan(_580);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    int _1372 = _1294 ? as_type<int>(_1350) : as_type<int>(_1224);
    float _1374 = _1282 * _1320;
    int _1376 = _1228 ? as_type<int>(_1350) : as_type<int>(_1224);
    float _1378 = _1370 * _1354;
    float _1380 = _1260 ? as_type<float>(_1372) : _1224;
    float _1382 = -_1370;
    float _1384 = _1382 + 1.0;
    bool _1386 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1388 = isnan(_580);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1394 = _1390 || _1392;
    float _1396 = float(_1394);
    float _1398 = fma(_1374, _1310, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1402 = _1400 != 0;
    float _1404 = fma(_1380, _1262, -0.5);
    bool _1406 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1408 = isnan(_580);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1396;
    float _1420 = _1418 + 1.0;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1424 = _580 + _1422;
    bool _1426 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1428 = isnan(_580);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1434 = _1430 || _1432;
    float _1436 = float(_1434);
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1440 = _1338 * _1420;
    float _1442 = _1314 ? as_type<float>(_1376) : _1224;
    float _1444 = _1416 * _1384;
    float _1446 = -_1416;
    float _1448 = _1446 + 1.0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1452 = _1450 != 0;
    float _1454 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = fma(_1326, _1424, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1458 = _1436 * _1448;
    int _1460 = as_type<int>(_1384);
    int _1462 = as_type<int>(_1398);
    float _1464 = _1442;
    if (_1402)
    {
        float _1466 = -_1216;
        float _1468 = _1466 + 1.0;
        _1460 = as_type<int>(_1468);
    }
    int _1470 = _1460;
    float _1472 = in.m_71.x;
    float _1474 = in.m_71.y;
    float _1476 = in.m_71.z;
    float _1478 = -_1436;
    float _1480 = _1478 + 1.0;
    float _1482 = _1398 * _1458;
    float _1484 = as_type<float>(_1470);
    if (_1318)
    {
        float _1486 = -_1216;
        float _1488 = _1486 + 1.0;
        _1462 = as_type<int>(_1488);
    }
    int _1490 = _1462;
    float _1492 = fma(_1454, _1442, -0.5);
    bool _1494 = _930 != 0.0;
    bool _1496 = isnan(_930);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(0.0);
    bool _1502 = _1498 || _1500;
    float _1504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1506 = _1492;
    if (!_1402)
    {
        _1464 = _1216;
    }
    float _1508 = _1464;
    float _1510 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1482);
    float _1512 = _1508;
    if (_1402)
    {
        float _1514 = _1226 ? as_type<float>(_1470) : _1216;
        _1512 = _1514;
    }
    float _1516 = _1512;
    float _1518 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1452)
    {
        float _1520 = _1226 ? _1350 : _1224;
        _1246 = _1520;
    }
    float _1522 = _1246;
    float _1524 = fma(_1340, _1444, _1510);
    if (_1318)
    {
        float _1526 = _1228 ? as_type<float>(_1490) : _1216;
        _1268 = _1526;
    }
    float _1528 = _1268;
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1532 = in.m_73.x;
    float _1534 = in.m_73.y;
    float _1536 = in.m_73.z;
    float _1538 = in.m_73.w;
    bool _1540 = _928 == 0.0;
    bool _1542 = !_1502;
    bool _1544 = _1540 && _1542;
    float _1546 = -_664;
    float _1548 = fma(_832, _1492, _1546);
    float _1550 = fma(_1518, _1516, -0.5);
    float _1552 = -_800;
    float _1554 = fma(_762, _1404, _1552);
    bool _1556 = _932 == 0.0;
    bool _1558 = _1556 && _1544;
    float _1560 = fma(_1456, _1378, _1524);
    float _1562 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1564 = fma(_1358, _1440, _1560);
    float _1566 = fma(_1562, _1288, -0.5);
    float _1568 = fma(_902, _1566, _658);
    if (_1558)
    {
        _842 = _1472;
    }
    float _1570 = _842;
    float _1572 = _1570;
    if (!_1558)
    {
        float _1574 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1472);
        _1572 = _1574;
    }
    float _1576 = _1572;
    float _1578 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1558)
    {
        _1506 = _1476;
    }
    float _1580 = _1506;
    float _1582 = _1580;
    if (!_1558)
    {
        float _1584 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1476);
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (_1558)
    {
        _1484 = _1474;
    }
    float _1588 = _1484;
    float _1590 = _1588;
    if (!_1558)
    {
        float _1592 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1474);
        _1590 = _1592;
    }
    float _1594 = _1590;
    float _1596 = fma(_834, _1550, _772);
    float _1598 = _1578 * _1438;
    float _1600 = _1536 * _1472;
    float _1602 = _1534 * _1476;
    float _1604 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1606 = _1532 * _1474;
    float _1608 = -_1600;
    float _1610 = fma(_1532, _1476, _1608);
    float _1612 = -_1602;
    float _1614 = fma(_1536, _1474, _1612);
    float _1616 = _1604 * _1530;
    float _1618 = -_1606;
    float _1620 = fma(_1534, _1472, _1618);
    float _1622 = _1610 * _1538;
    float _1624 = _1614 * _1538;
    out.m_75.x = _1616;
    out.m_75.y = _1598;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1628 = _1620 * _1538;
    float _1630 = _1554 + 0.5;
    float _1632 = -_1534;
    float _1634 = _1006 * _1632;
    float _1636 = -_1622;
    float _1638 = _1006 * _1636;
    float _1640 = _1596 + 0.5;
    float _1642 = fma(_1018, _1532, _1634);
    float _1644 = _1568 + 0.5;
    float _1646 = -_1594;
    float _1648 = _1006 * _1646;
    float _1650 = _1548 + 0.5;
    float _1652 = fma(_1018, _1624, _1638);
    float _1654 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1564);
    float _1656 = fma(_1018, _1576, _1648);
    float _1658 = _1014 * _1534;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_77.x = _1644;
    out.m_77.y = _1650;
    out.m_77.z = _1640;
    out.m_77.w = _1630;
    float _1664 = _1014 * _1594;
    float _1666 = _1016 * _1534;
    float _1668 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1672 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1674 = _1654 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1676 = fma(_1026, _1576, _1664);
    float _1678 = fma(_1036, _1532, _1666);
    float _1680 = fma(_1020, _1586, _1656);
    float _1682 = fma(_1020, _1628, _1652);
    out.m_79.x = _1668;
    out.m_79.y = _1670;
    out.m_79.z = _1672;
    out.m_79.w = _1674;
    float _1684 = fma(_1026, _1532, _1658);
    float _1686 = _1014 * _1622;
    float _1688 = fma(_1020, _1536, _1642);
    float _1690 = fma(_1040, _1586, _1676);
    float _1692 = fma(_1040, _1536, _1684);
    float _1694 = _1016 * _1594;
    float _1696 = fma(_1028, _1536, _1678);
    float _1698 = _1016 * _1622;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1704 = fma(_1036, _1576, _1694);
    float _1706 = fma(_1026, _1624, _1686);
    float _1708 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1710 = fma(_1688, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1700);
    float _1712 = fma(_1688, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1702);
    float _1714 = fma(_1040, _1628, _1706);
    float _1716 = fma(_1688, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1708);
    float _1718 = fma(_1696, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1710);
    float _1720 = fma(_1028, _1586, _1704);
    float _1722 = fma(_1036, _1624, _1698);
    float _1724 = fma(_1696, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1716);
    float _1726 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1728 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1730 = fma(_1696, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1712);
    float _1732 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1734 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1736 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1738 = fma(_1680, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1726);
    float _1740 = fma(_1028, _1628, _1722);
    float _1742 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1728);
    float _1744 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1732);
    float _1746 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1748 = _1672;
    float _1750 = _1746;
    if (_1094)
    {
        float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1754 = _1184 + _1752;
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1742);
    float _1760 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1744);
    float _1762 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1746);
    if (_1094)
    {
        float _1764 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1766 = _1180 + _1764;
        _1750 = _1766;
    }
    float _1768 = _1750;
    if (_1094)
    {
        float _1770 = _1756 * _1756;
        _1110 = _1770;
    }
    float _1772 = _1110;
    out.m_81.x = _1718;
    out.m_81.y = _1724;
    out.m_81.z = _1730;
    float _1774 = fma(_1680, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1734);
    if (_1094)
    {
        float _1776 = _1768 * _1768;
        _1112 = _1776;
    }
    float _1778 = _1112;
    float _1780 = fma(_1680, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1736);
    float _1782 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1762);
    out.m_83.x = _1758;
    out.m_83.y = _1760;
    out.m_83.z = _1782;
    float _1784 = fma(_1720, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1738);
    float _1786 = fma(_1720, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1774);
    float _1788 = fma(_1720, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1780);
    out.m_85.x = _1784;
    out.m_85.y = _1786;
    out.m_85.z = _1788;
    float _1790 = fma(_1210, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1792 = fma(_1212, 100.0, _1790);
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1796 = _1792 + _1794;
    float _1798 = fma(_1796, _1796, _1778);
    float _1800 = _1798 + _1772;
    float _1802 = sqrt(_1800);
    bool _1804 = _1802 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1806 = isnan(_1802);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1812 = _1808 || _1810;
    float _1814 = _1782;
    float _1816 = _1800;
    if (!_1812)
    {
        _1814 = 1.0;
    }
    float _1818 = _1814;
    bool _1820 = !_1812;
    float _1822 = _1818;
    if (!_1820)
    {
        bool _1824 = _1802 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1826 = isnan(_1802);
        bool _1828 = _1824 || _1826;
        bool _1830 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1832 = _1828 || _1830;
        if (!_1832)
        {
            float _1834 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1836 = _1802 + _1834;
            float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1840 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1838;
            float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1844 = _1842 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1846 = 1.0 / _1840;
            float _1848 = _1836 * _1846;
            float _1850 = fma(_1848, _1844, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1822 = _1850;
            _1852 = true;
        }
        else
        {
            bool _1854 = _1802 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1856 = isnan(_1802);
            bool _1858 = _1854 || _1856;
            bool _1860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1862 = _1858 || _1860;
            if (!_1862)
            {
                float _1864 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1866 = _1802 + _1864;
                float _1868 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1870 = _1868 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1874 = _1872 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1876 = 1.0 / _1870;
                float _1878 = _1866 * _1876;
                float _1880 = fma(_1878, _1874, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1822 = _1880;
                _1852 = true;
            }
            else
            {
                _1822 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1852 = false;
    float _1882 = _1822;
    float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1886 = _1792 + _1884;
    float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1890 = _1180 + _1888;
    float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1894 = _1184 + _1892;
    float _1896 = fma(_1886, _1882, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1898 = fma(_1890, _1882, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1900 = fma(_1894, _1882, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1904 = _1896 + _1902;
    float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1908 = _1898 + _1906;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1900 + _1910;
    float _1914 = _1904 * _1904;
    float _1916 = fma(_1908, _1908, _1914);
    float _1918 = fma(_1912, _1912, _1916);
    float _1920 = rsqrt(_1918);
    float _1922 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1924 = _1908 * _1922;
    float _1926 = _1912 * _1922;
    float _1928 = _1924 * _1924;
    float _1930 = _1926 * _1926;
    float _1932 = _1928 + _1930;
    float _1934 = sqrt(_1932);
    bool _1936 = _1934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1940 = _1934 + _1938;
    float _1942 = _1916;
    float _1944 = _1920;
    float _1946 = _1940;
    float _1948 = _1904;
    float _1950 = _1924;
    if (_1936)
    {
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _1952;
    }
    float _1954 = _1942;
    if (_1936)
    {
        float _1956 = rsqrt(_1932);
        _1944 = _1956;
    }
    float _1958 = _1944;
    float _1960 = _1958;
    if (_1936)
    {
        float _1962 = _1940 * _1954;
        _1946 = _1962;
    }
    float _1964 = _1946;
    float _1966 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1936)
    {
        float _1968 = _1964 * 0.15915493667125701904296875;
        _1816 = _1968;
    }
    float _1970 = _1816;
    float _1972 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1966);
    float _1974 = _1912;
    if (_1936)
    {
        float _1976 = _1970 * 6.283185482025146484375;
        float _1978 = sin(_1976);
        _1974 = _1978;
    }
    float _1980 = _1974;
    float _1982 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1984 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1972);
    float _1986 = precise::max(0.0, _1982);
    float _1988 = _1954;
    float _1990 = _1986;
    if (_1936)
    {
        float _1992 = _1970 * 6.283185482025146484375;
        float _1994 = cos(_1992);
        _1988 = _1994;
    }
    float _1996 = _1988;
    float _1998 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2000 = -_1922;
    float _2002 = -_1986;
    float _2004 = fma(_1904, _2000, _2002);
    if (_1936)
    {
        float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1948 = _2006;
    }
    float _2008 = _1948;
    float _2010 = _2008;
    float _2012 = _1980;
    if (_1936)
    {
        float _2014 = fma(_1980, _2008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _2016;
    if (!_1936)
    {
        _2012 = _1926;
    }
    float _2020 = _2012;
    float _2022 = _2020;
    float _2024 = _1996;
    if (_1936)
    {
        float _2026 = _1996 + (-1.0);
        _1990 = _2026;
    }
    float _2028 = _1990;
    float _2030 = _2028;
    if (_1936)
    {
        float _2032 = _1958 * _2016;
        _1114 = _2032;
    }
    float _2034 = _1114;
    if (!_1936)
    {
        _1960 = _2004;
    }
    float _2036 = _1960;
    float _2038 = _2036;
    if (_1936)
    {
        float _2040 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2030 = _2040;
    }
    float _2042 = _2030;
    if (_1936)
    {
        float _2044 = _1924 * _2034;
        _1950 = _2044;
    }
    float _2046 = _1950;
    if (!_1936)
    {
        _2018 = _1928;
    }
    float _2048 = _2018;
    float _2050 = _2048;
    if (_1936)
    {
        float _2052 = _1926 * _2034;
        _2022 = _2052;
    }
    float _2054 = _2022;
    if (_1936)
    {
        float _2056 = fma(_2004, _1996, _2042);
        _2038 = _2056;
    }
    float _2058 = _2038;
    if (_1936)
    {
        float _2060 = _2046 * _2046;
        _2050 = _2060;
    }
    float _2062 = _2050;
    float _2064 = sqrt(_1918);
    if (!_1936)
    {
        _2024 = _1930;
    }
    float _2066 = _2024;
    float _2068 = _2066;
    if (_1936)
    {
        float _2070 = _2054 * _2054;
        _2068 = _2070;
    }
    float _2072 = _2068;
    float _2074 = fma(_2058, _2058, _2062);
    float _2076 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2078 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2080 = _2074 + _2072;
    float _2082 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2084 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2076);
    float _2086 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2078);
    float _2088 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2082);
    float _2090 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2084);
    float _2092 = rsqrt(_2080);
    float _2094 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2086);
    float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2098 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2096);
    float _2100 = precise::clamp(_2098, 0.0, 1.0);
    float _2102 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2088);
    float _2104 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2106 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2108 = -_2100;
    float _2110 = _2108 + 1.0;
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2116 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2114);
    float _2122 = abs(_2110);
    float _2124 = log2(_2122);
    float _2126 = -_2118;
    float _2128 = fma(_2126, _2116, 1.0);
    float _2130 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2132 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2120);
    float _2134 = _2092 * _2046;
    float _2136 = _2092 * _2058;
    float _2138 = _2092 * _2054;
    float _2140 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2132);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = log2(_2128);
    float _2146 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2130);
    float _2148 = _2136 + 1.0;
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = -_2138;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2158 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2160 = 1.0 / _2140;
    float _2162 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2164 = fma(_2156, -0.5, 0.5);
    float _2166 = fma(_2156, 0.5, 0.5);
    float _2168 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2162);
    float _2170 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2146);
    float _2172 = fma(_2166, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2174 = exp2(_2158);
    float _2176 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2168);
    float _2178 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2170);
    float _2180 = fma(_2166, _2172, -0.212114393711090087890625);
    float _2182 = _2144 * 0.693147182464599609375;
    float _2184 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2176);
    float _2186 = fma(_2166, _2180, 1.570728778839111328125);
    float _2188 = sqrt(_2164);
    float _2190 = _2184 * _2160;
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2194 = -_2136;
    float _2196 = fma(_2174, _2148, _2194);
    float _2198 = _2178 * _2160;
    float _2200 = fma(_2190, 0.5, 0.5);
    float _2202 = fma(_2196, 0.5, 0.5);
    float _2204 = fma(_2198, -0.5, 0.5);
    float _2206 = _2188 * 0.636619746685028076171875;
    float _2208 = -_2186;
    float _2210 = fma(_2206, _2208, 1.0);
    float3 _6323 = float3(_2200, _2204, _2192);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6323, float3(0.0), isnan(_6323)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6323, float3(0.0), isnan(_6323)), level(0.0)).x;
    float3 _6334 = float3(_2200, _2204, _2192);
    float4 _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6334, float3(0.0), isnan(_6334)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6334, float3(0.0), isnan(_6334)), level(0.0)).xyzw;
    float _2217 = _2215.x;
    float _2219 = _2215.y;
    float _2221 = _2215.z;
    float _2223 = _2215.w;
    float2 _6350 = float2(_2210, _2202);
    float3 _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6350, float2(0.0), isnan(_6350)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6350, float2(0.0), isnan(_6350)), level(0.0)).xyz;
    float _2229 = _2227.x;
    float _2231 = _2227.y;
    float _2233 = _2227.z;
    float _2235 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2237 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2239 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2241 = -_1214;
    float _2243 = _2241 + 1.0;
    float _2245 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2235);
    float _2247 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2237);
    float _2249 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2239);
    float _2251 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2245);
    float _2253 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2247);
    float _2255 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2249);
    float _2257 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2259 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2261 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2255);
    float _2263 = 1.0 / _2257;
    float _2265 = _2259 + _2257;
    float _2267 = _2265 * _2263;
    float _2269 = _2267 * 0.5;
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2273 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2271);
    float _2275 = 1.0 / _2273;
    float _2277 = in.m_87.x;
    float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2281 = _2275 * _2279;
    float _2283 = abs(_2281);
    float _2285 = log2(_2283);
    float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2289 = exp2(_2287);
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2293 = precise::clamp(_2291, 0.0, 1.0);
    float _2295 = fma(_2293, -2.0, 3.0);
    float _2297 = _2293 * _2293;
    float _2299 = _2297 * _2295;
    bool _2301 = _2281 <= 8000.0;
    bool _2303 = isnan(_2281);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(8000.0);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = -_2299;
    float _2315 = _2313 + 1.0;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2299);
    float _2319 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2321 = _2261 + _2140;
    float _2323 = _2311 * _2317;
    float _2325 = _2321 * 0.5;
    float _2327 = exp2(_2319);
    float _2329 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2331 = _2243 * _2329;
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    bool _2335 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2337 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan(0.5);
    bool _2343 = _2339 || _2341;
    float _2345 = -_2333;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2349 = _2347 * _2277;
    float _2351 = -_2327;
    float _2353 = _2351 + 1.0;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2359 = _2212;
    float _2361 = _2140;
    float _2363 = _2261;
    float _2365 = _2178;
    float _2367 = _2184;
    if (_2343)
    {
        _2357 = 1.0;
    }
    float _2369 = _2357;
    float _2371 = _2369;
    if (!_2343)
    {
        float _2373 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2377 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2375;
        float _2379 = _2373 * 0.15915493667125701904296875;
        float _2381 = _2379 * 6.283185482025146484375;
        float _2383 = cos(_2381);
        float _2385 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2387 = _2385 * 0.15915493667125701904296875;
        float _2389 = _2379 * 6.283185482025146484375;
        float _2391 = sin(_2389);
        float _2393 = 1.0 / _2383;
        float _2395 = _2387 * 6.283185482025146484375;
        float _2397 = cos(_2395);
        float _2399 = _2391 * _2393;
        float _2401 = _2387 * 6.283185482025146484375;
        float _2403 = sin(_2401);
        float _2405 = _2397 * _2399;
        float _2407 = 1.0 / _2377;
        float _2409 = 1.0 / _2405;
        float _2411 = _2403 * _2409;
        float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2415 = fma(_2281, _2411, _2413);
        float _2417 = _2415 * _2407;
        float _2419 = precise::clamp(_2417, 0.0, 1.0);
        float _2421 = -_2419;
        float _2423 = _2421 + 1.0;
        _2371 = _2423;
    }
    float _2425 = _2371;
    float _2427 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_89.z = _2325;
    out.m_89.w = _2140;
    bool _2429 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2431 = isnan(_2064);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2437 = _2433 || _2435;
    float _2439 = _2427 * _2212;
    float _2441 = -_2427;
    float _2443 = _2441 + 1.0;
    out.m_91.x = _2355;
    float _2445 = _2223 * _2439;
    float _2447 = _2233 * _2439;
    float _2449 = _2223 * _2443;
    out.m_93.x = _1898;
    out.m_93.y = _1896;
    out.m_93.z = _1900;
    float _2451 = fma(_2229, _2445, _2217);
    float _2453 = fma(_2231, _2445, _2219);
    float _2455 = fma(_2223, _2447, _2221);
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2178;
    out.gl_Position.z = _2261;
    out.gl_Position.w = _2140;
    float _2457 = _2443;
    if (!_2437)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2459 = _2457;
    float _2461 = _2425 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2463 = _2459;
    float _2465 = _2459;
    if (!_2437)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2467 = _2359;
    out.m_95.x = _2451;
    out.m_95.y = _2453;
    out.m_95.z = _2455;
    out.m_95.w = _2449;
    float _2469 = _2467;
    float _2471 = _2467;
    if (!_2437)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2473 = _2361;
    float _2475 = _2473;
    float _2477 = _2473;
    if (!_2437)
    {
        _2363 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2479 = _2363;
    float _2481 = _2479;
    float _2483 = _2479;
    if (!_2437)
    {
        _2365 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2485 = _2365;
    float _2487 = _2485;
    float _2489 = _2485;
    if (!_2437)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2491 = _2367;
    bool _2493 = !_2437;
    float _2495 = _2491;
    float _2497 = _2491;
    if (!_2493)
    {
        bool _2499 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2501 = isnan(_2064);
        bool _2503 = _2499 || _2501;
        bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2507 = _2503 || _2505;
        if (!_2507)
        {
            float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2511 = _2064 + _2509;
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2515 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2513;
            float _2517 = 1.0 / _2515;
            float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2539 = _2511 * _2517;
            float _2541 = precise::clamp(_2539, 0.0, 1.0);
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2547 = fma(_2541, _2521, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2549 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2551 = fma(_2541, _2525, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2553 = fma(_2541, _2529, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2555 = fma(_2541, _2533, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2557 = fma(_2541, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2477 = _2549;
            _2497 = _2555;
            _2465 = _2547;
            _2489 = _2553;
            _2483 = _2551;
            _2471 = _2557;
            _2559 = true;
        }
        else
        {
            bool _2561 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2563 = isnan(_2064);
            bool _2565 = _2561 || _2563;
            bool _2567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2569 = _2565 || _2567;
            if (!_2569)
            {
                _2463 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2571 = _2463;
            _2465 = _2571;
            if (!_2569)
            {
                _2475 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2573 = _2475;
            _2477 = _2573;
            if (!_2569)
            {
                _2481 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2575 = _2481;
            _2483 = _2575;
            if (!_2569)
            {
                _2487 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2577 = _2487;
            _2489 = _2577;
            if (!_2569)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2579 = _2495;
            _2497 = _2579;
            if (!_2569)
            {
                _2469 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2581 = _2469;
            bool _2583 = !_2569;
            _2471 = _2581;
            if (!_2583)
            {
                bool _2585 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2587 = isnan(_2064);
                bool _2589 = _2585 || _2587;
                bool _2591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2593 = _2589 || _2591;
                if (!_2593)
                {
                    float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2597 = _2064 + _2595;
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2601 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2599;
                    float _2603 = 1.0 / _2601;
                    float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2625 = _2597 * _2603;
                    float _2627 = precise::clamp(_2625, 0.0, 1.0);
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2633 = fma(_2627, _2607, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2635 = fma(_2627, _2631, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2637 = fma(_2627, _2611, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2639 = fma(_2627, _2615, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2641 = fma(_2627, _2619, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2643 = fma(_2627, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2477 = _2635;
                    _2497 = _2641;
                    _2465 = _2633;
                    _2489 = _2639;
                    _2483 = _2637;
                    _2471 = _2643;
                    _2559 = true;
                }
                else
                {
                    _2477 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2465 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2489 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2483 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2471 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2559 = false;
    float _2645 = _2477;
    float _2647 = _2497;
    float _2649 = _2465;
    float _2651 = _2489;
    float _2653 = _2483;
    float _2655 = _2471;
    float _2657 = fma(_1786, -0.5, 0.5);
    float _2659 = precise::clamp(_2657, 0.0, 1.0);
    float _2661 = -_2645;
    float _2663 = _2661 + _2647;
    float _2665 = _2461 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2667 = -_2649;
    float _2669 = _2667 + _2651;
    out.m_97.x = 0.0;
    float _2671 = fma(_2659, _2663, _2645);
    float _2673 = fma(_2659, _2669, _2649);
    out.m_55.x = _2665;
    float _2675 = -_2653;
    float _2677 = _2675 + _2655;
    float _2679 = _2671 * 0.586610972881317138671875;
    bool _2681 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2683 = fma(_2659, _2677, _2653);
    float _2685 = fma(_2673, 0.298911988735198974609375, _2679);
    bool _2687 = _2425 > 0.0;
    bool _2689 = isnan(_2425);
    bool _2691 = _2687 || _2689;
    bool _2693 = isnan(0.0);
    bool _2695 = _2691 || _2693;
    float _2697 = fma(_2683, 0.114477999508380889892578125, _2685);
    float _2699 = -_2697;
    float _2701 = _2673 + _2699;
    float _2703 = -_2697;
    float _2705 = _2671 + _2703;
    float _2707 = -_2697;
    float _2709 = _2683 + _2707;
    float _2711 = fma(_2701, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2697);
    float _2713 = fma(_2705, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2697);
    float _2715 = fma(_2709, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2697);
    bool _2717 = !_2681;
    if (!_2717)
    {
        float _2719 = -_1896;
        float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2723 = -_1898;
        float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2727 = -_1900;
        float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2731 = _2721 * _2721;
        float _2733 = fma(_2725, _2725, _2731);
        float _2735 = fma(_2729, _2729, _2733);
        float _2737 = sqrt(_2735);
        float _2739 = rsqrt(_2735);
        float _2741 = -_2737;
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2745 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2747 = precise::clamp(_2745, 0.0, 1.0);
        float _2749 = _2725 * _2739;
        float _2751 = _2721 * _2739;
        float _2753 = abs(_2747);
        float _2755 = log2(_2753);
        float _2757 = _2729 * _2739;
        float _2759 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2761 = _1786 * _2751;
        float _2763 = -_2751;
        float _2765 = -_2759;
        float _2767 = fma(_2763, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2765);
        float _2769 = fma(_1784, _2749, _2761);
        float _2771 = -_2757;
        float _2773 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2767);
        float _2775 = fma(_1788, _2757, _2769);
        float _2777 = precise::clamp(_2775, 0.0, 1.0);
        float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2781 = _2773 + _2779;
        float _2783 = _2755 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2785 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = exp2(_2783);
        float _2791 = _2789 * _2787;
        float _2793 = _2777 * _2791;
        float _2795 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2797 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2799 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2795;
        out.m_97.y = _2797;
        out.m_97.z = _2799;
    }
    out.m_99.x = _2711;
    out.m_99.y = _2713;
    out.m_99.z = _2715;
    if (_2695)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _2801 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2801;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2559 = false;
    bool _1852 = false;
    bool _572 = false;
    bool _418 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_52.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_55.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2858 = as_type<float>(_134);
        out.gl_Position.z = _2858;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_57.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_55.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2928 = as_type<float>(_172);
        out.gl_Position.z = _2928;
    }
    if (_164)
    {
        return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_59.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _204 + _210;
    bool _214 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _216 = isnan(_204);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _204 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = 1.0 / _228;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _240;
    float _248 = 1.0 / _236;
    float _250 = _208 * _242;
    bool _252 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_204);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_224;
    float _266 = _264 + 1.0;
    float _268 = _262 * _266;
    float _270 = _212 * _246;
    bool _272 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _274 = isnan(_204);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    bool _288 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _290 = isnan(_204);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = -_262;
    float _306 = _304 + 1.0;
    float _308 = -_282;
    float _310 = _308 + 1.0;
    float _312 = _232 * _248;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _318;
    float _322 = _298 * _310;
    float _324 = fma(_286, _312, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _326 = fma(_316, _312, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _328 = fma(_320, _312, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _330 = _282 * _306;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _336 = _326 * _322;
    float _338 = _328 * _322;
    float _340 = _324 * _322;
    float _342 = -_298;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].x, _338);
    float _352 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].y, _336);
    float _354 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].z, _340);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = fma(_302, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_348, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_334, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_360, _330, _350);
    float _376 = fma(_358, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_368, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _380 = fma(_372, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _382 = fma(_362, _330, _352);
    float _384 = fma(_364, _330, _354);
    float _386 = fma(_376, _268, _374);
    float _388 = fma(_378, _268, _382);
    float _390 = fma(_380, _268, _384);
    float _392 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_244;
    float _416;
    if (!_398)
    {
        float _400 = in.m_59.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _152 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _430 = _426 + _428;
    float _432 = in.m_61.x;
    float _434 = in.m_61.y;
    float _436 = in.m_61.z;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _442 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = isnan(_426);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _458 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _460 = isnan(_426);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _470;
    bool _474 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _476 = isnan(_426);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = 1.0 / _440;
    float _488 = -_452;
    float _490 = _488 + 1.0;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _494 = _468 * _490;
    float _496 = -_468;
    float _498 = _496 + 1.0;
    float _500 = 1.0 / _456;
    float _502 = _472 * _486;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _508 = _396 * _436;
    float _510 = _394 * _434;
    float _512 = fma(_502, _430, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _514 = _392 * _432;
    float _516 = _506 * _500;
    float _518 = _512 * _494;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _426 + _524;
    float _528 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[115].x, _518);
    float _530 = _452 * _522;
    float _532 = fma(_516, _526, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _536 = fma(_532, _530, _528);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _540 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[117].x, _536);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _546 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _548 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _550 = _544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _540;
    out.m_63.y = _550;
    out.m_63.z = _546;
    out.m_63.w = _548;
    bool _552 = !_492;
    float _570;
    if (!_552)
    {
        float _554 = in.m_59.x;
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _558 = _554 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[11].w, _152);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        float _574 = float(_118);
        float _576 = 1.0 / _574;
        float _578 = _152 * _576;
        _570 = _578;
    }
    _572 = false;
    float _580 = _570;
    float _582 = in.m_59.z;
    float _584 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _586 = log2(_584);
    float _588 = in.m_59.y;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _592 = _590 != 0;
    float _594 = in.m_59.x;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _606 = _604 != 0;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _610 = !_598;
    int _612 = _610 ? 0 : 1;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _616 = _586 * _152;
    bool _618 = !_606;
    int _620 = _618 ? 0 : 1;
    float _622 = _582 * 2.0;
    float _624 = exp2(_616);
    float _626 = _588 * 2.0;
    float _628 = _588 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _630 = _594 * 2.0;
    float _632 = floor(_622);
    float _634 = _594 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _636 = fma(_628, -2.0, _614);
    float _638 = _628;
    if (!_592)
    {
        _638 = _588;
    }
    float _640 = _638;
    float _642 = -_608;
    float _644 = fma(_634, 2.0, _642);
    float _646 = _594 + _588;
    float _648 = _640;
    float _650 = _646;
    if (_592)
    {
        _648 = _594;
    }
    float _652 = _648;
    float _654 = floor(_630);
    float _656 = -_152;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[76].x, _644);
    float _660 = -_624;
    float _662 = _660 + 1.0;
    float _664 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _636);
    float _666 = floor(_626);
    float _668 = _646 + (-1.0);
    bool _670 = _632 > 0.0;
    bool _672 = _632 >= 0.0;
    bool _674 = isnan(_632);
    bool _676 = _672 || _674;
    bool _678 = isnan(0.0);
    bool _680 = _676 || _678;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _684 = _632;
    if (!_592)
    {
        _684 = _582;
    }
    float _686 = _684;
    float _688 = _686;
    if (!_592)
    {
        _650 = _582;
    }
    float _690 = _650;
    float _692 = _690;
    if (_592)
    {
        _688 = _588;
    }
    float _694 = _688;
    if (_592)
    {
        _692 = _588;
    }
    float _696 = _692;
    int _698 = _680 ? 0 : 1;
    float _700 = _694 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _702 = _654 > 0.0;
    bool _704 = _654 >= 0.0;
    bool _706 = isnan(_654);
    bool _708 = _704 || _706;
    bool _710 = isnan(0.0);
    bool _712 = _708 || _710;
    bool _714 = _666 > 0.0;
    bool _716 = _666 >= 0.0;
    bool _718 = isnan(_666);
    bool _720 = _716 || _718;
    bool _722 = isnan(0.0);
    bool _724 = _720 || _722;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _730 = ~_698;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[83].z, _726);
    float _738 = _652 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _742 = abs(_612);
    float _744 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[83].w, _728);
    int _746 = _734;
    if (!_670)
    {
        int _748 = ~_698;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = -_740;
    float _756 = fma(_738, 2.0, _754);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _760 = float(_742);
    float _762 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _744);
    float _764 = float(_752);
    float _766 = fma(_700, -2.0, _758);
    int _768 = _712 ? 0 : 1;
    float _770 = -_152;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[81].x, _756);
    bool _774 = !_602;
    int _776 = _774 ? 0 : 1;
    float _778 = _760 * _764;
    int _780 = ~_768;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = in.m_65.x;
    float _788 = in.m_65.y;
    float _790 = in.m_65.z;
    int _792 = _784;
    if (!_702)
    {
        int _794 = ~_768;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _766);
    int _802 = abs(_776);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _806 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _808 = isnan(1.0);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _814 = _810 || _812;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _818 = 1.0 + _816;
    int _820 = _724 ? 0 : 1;
    float _822 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[78].w, _804);
    float _824 = 1.0 / _818;
    int _826 = ~_820;
    int _828 = _826 + 1;
    int _830 = _828 + 1;
    float _832 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _822);
    float _834 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _736);
    float _836 = _778 * (-2.0);
    float _838 = float(_802);
    int _840 = _830;
    float _842 = _832;
    if (!_714)
    {
        int _844 = ~_820;
        int _846 = _844 + 1;
        _840 = _846;
    }
    int _848 = _840;
    float _850 = _594 + (-0.5);
    float _852 = float(_798);
    float _854 = fma(_836, _786, _786);
    float _856 = fma(_682, _836, _682);
    int _858 = abs(_620);
    float _860 = _588 + _582;
    float _862 = _838 * _852;
    float _864 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].x, _854);
    float _866 = float(_858);
    float _868 = _860 + (-1.0);
    float _870 = float(_848);
    float _872 = _862 * (-2.0);
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _876 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _884 = _880 || _882;
    float _886 = _866 * _870;
    float _888 = _588 + (-0.5);
    float _890 = fma(_872, _788, _788);
    float _892 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[78].z, _874);
    float _894 = _884 ? _662 : 0.0;
    float _896 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _898 = _594 + _582;
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].y, _890);
    float _902 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _892);
    bool _904 = _884;
    if (_814)
    {
        float _906 = _894 * _824;
        _154 = _906;
    }
    float _908 = _154;
    float _910 = _898 + (-1.0);
    float _912 = _886 * (-2.0);
    float _914 = fma(_896, _872, _896);
    float _916 = fma(_856, _908, _864);
    float _918 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _920 = fma(_912, _790, _790);
    float _922 = _582 + (-0.5);
    float _924 = fma(_914, _908, _900);
    float _926 = fma(_918, _912, _918);
    float _928 = in.m_67.x;
    float _930 = in.m_67.y;
    float _932 = in.m_67.z;
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[196].z, _920);
    float _936 = _916 * 0.15915493667125701904296875;
    float _938 = _924 * 0.15915493667125701904296875;
    float _940 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _942 = fma(_926, _908, _934);
    float _944 = _936 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _950 = _942 * 0.15915493667125701904296875;
    float _952 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _954 = in.m_52.x;
    float _956 = in.m_52.y;
    float _958 = in.m_52.z;
    float _960 = _936 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _938 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _928);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _930);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _932);
    float _974 = _968 * _940;
    float _976 = _938 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _972 * _952;
    float _982 = _956 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _984 = _956 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = _956 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _988 = _950 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = _970 * _948;
    float _994 = _946 * _966;
    float _996 = _962 * _966;
    float _998 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[4].x, _982);
    float _1000 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _1002 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[5].x, _986);
    float _1004 = _950 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = _962 * _978;
    float _1010 = _946 * _978;
    float _1012 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1002);
    float _1014 = _962 * _990;
    float _1016 = _946 * _990;
    float _1018 = _978 * _990;
    float _1020 = _966 * _990;
    float _1022 = _1014 * _992;
    float _1024 = _1016 * _992;
    float _1026 = fma(_1006, _1008, _994);
    float _1028 = fma(_1006, _994, _1008);
    float _1030 = -_992;
    float _1032 = _1006 * _1030;
    float _1034 = -_996;
    float _1036 = fma(_1006, _1010, _1034);
    float _1038 = -_1010;
    float _1040 = fma(_1006, _996, _1038);
    float _1042 = fma(_1026, _974, _1022);
    float _1044 = fma(_1018, _974, _1032);
    float _1046 = fma(_1036, _974, _1024);
    float _1048 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1000);
    float _1050 = fma(_1040, _980, _1042);
    float _1052 = fma(_1020, _980, _1044);
    float _1054 = fma(_1028, _980, _1046);
    float _1056 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[4].z, _998);
    float _1058 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1060 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1062 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1058);
    float _1068 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1060);
    float _1070 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1066);
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1068);
    float _1074 = _1064 + _1070;
    float _1076 = _1062 + _1072;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1080 = _1074 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1084 = _1076 + _1082;
    float _1086 = _1080 * _1080;
    float _1088 = _1084 * _1084;
    float _1090 = _1086 + _1088;
    float _1092 = sqrt(_1090);
    bool _1094 = _1092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1092 + _1096;
    float _1100 = 0.0;
    float _1102 = _1092;
    float _1104 = _1050;
    float _1106 = _1074;
    float _1108 = _1076;
    float _1110 = _1088;
    float _1112 = _1086;
    float _1114 = _1014;
    if (_1094)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1116;
    }
    float _1118 = _1100;
    if (_1094)
    {
        float _1120 = _1098 * _1118;
        _1102 = _1120;
    }
    float _1122 = _1102;
    float _1124 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1126 = _1122;
    if (_1094)
    {
        float _1128 = rsqrt(_1090);
        _1104 = _1128;
    }
    float _1130 = _1104;
    float _1132 = _1130;
    if (_1094)
    {
        float _1134 = _1122 * 0.15915493667125701904296875;
        _1126 = _1134;
    }
    float _1136 = _1126;
    float _1138 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1124);
    float _1140 = _1012 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1142 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1138);
    float _1144 = _1136;
    if (_1094)
    {
        float _1146 = _1136 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        _1144 = _1148;
    }
    float _1150 = _1144;
    float _1152 = _1140 + _1142;
    float _1154 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1156 = _1152;
    if (_1094)
    {
        float _1158 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1158;
    }
    float _1160 = _1156;
    float _1162 = floor(_1154);
    float _1164 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1166 = floor(_1164);
    float _1168 = _1160;
    if (_1094)
    {
        float _1170 = fma(_1150, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1168 = _1170;
    }
    float _1172 = _1168;
    if (_1094)
    {
        float _1174 = _1130 * _1172;
        _1132 = _1174;
    }
    float _1176 = _1132;
    if (_1094)
    {
        float _1178 = fma(_1080, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1106 = _1178;
    }
    float _1180 = _1106;
    if (_1094)
    {
        float _1182 = fma(_1084, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1108 = _1182;
    }
    float _1184 = _1108;
    float _1186 = -_1162;
    float _1188 = _1154 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1192 = _1180 + _1190;
    float _1194 = fma(_1180, 6.2500002968590706586837768554688e-05, 0.5);
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1198 = _1184 + _1196;
    float _1200 = fma(_1184, 6.2500002968590706586837768554688e-05, 0.5);
    float _1202 = -_1166;
    float _1204 = _1164 + _1202;
    float _1206 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1208 = fma(_1198, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4584 = float2(_1194, _1200);
    float _1210 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_4584, float2(0.0), isnan(_4584)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_4584, float2(0.0), isnan(_4584)), level(0.0)).y;
    float2 _4594 = float2(_1206, _1208);
    float _1212 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4594, float2(0.0), isnan(_4594)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4594, float2(0.0), isnan(_4594)), level(0.0)).x;
    float2 _4602 = float2(_1188, _1204);
    float _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4602, float2(0.0), isnan(_4602)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4602, float2(0.0), isnan(_4602)), level(0.0)).x;
    float _1216 = in.m_69.x;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1222 = _1220 != 0;
    float _1224 = in.m_69.y;
    bool _1226 = _582 > 0.5;
    bool _1228 = _588 > 0.5;
    float _1230 = in.m_59.w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1240 = _1238 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[133].w);
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1246 = _1224;
    if (_1222)
    {
        bool _1248 = _594 > 0.5;
        _904 = _1248;
    }
    bool _1250 = _904;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1256 = 1.0 / _1234;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1260 = _1258 != 0;
    float _1262 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1268 = _1216;
    if (_1222)
    {
        float _1270 = -_1216;
        float _1272 = _1270 + 1.0;
        _1242 = as_type<int>(_1272);
    }
    int _1274 = _1242;
    if (!_1222)
    {
        _1244 = _1216;
    }
    float _1276 = _1244;
    float _1278 = 1.0 / _1240;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1280;
    float _1284 = _1276;
    if (_1222)
    {
        float _1286 = _1250 ? as_type<float>(_1274) : _1216;
        _1284 = _1286;
    }
    float _1288 = _1284;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1294 = _1230 > 0.5;
    float _1296 = 1.0 / _1266;
    float _1298 = _1292 * _1256;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1310 = _580 + _1308;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1318 = _1316 != 0;
    float _1320 = 1.0 / _1254;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1324 = _580 + _1322;
    float _1326 = _1302 * _1278;
    bool _1328 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1330 = isnan(_580);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = fma(_1298, _1324, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1344 = _580 + _1342;
    float _1346 = _1306 * _1296;
    float _1348 = -_1224;
    float _1350 = _1348 + 1.0;
    float _1352 = -_1338;
    float _1354 = _1352 + 1.0;
    float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1358 = fma(_1346, _1344, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    bool _1360 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1362 = isnan(_580);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    int _1372 = _1294 ? as_type<int>(_1350) : as_type<int>(_1224);
    float _1374 = _1282 * _1320;
    int _1376 = _1228 ? as_type<int>(_1350) : as_type<int>(_1224);
    float _1378 = _1370 * _1354;
    float _1380 = _1260 ? as_type<float>(_1372) : _1224;
    float _1382 = -_1370;
    float _1384 = _1382 + 1.0;
    bool _1386 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1388 = isnan(_580);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1394 = _1390 || _1392;
    float _1396 = float(_1394);
    float _1398 = fma(_1374, _1310, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1402 = _1400 != 0;
    float _1404 = fma(_1380, _1262, -0.5);
    bool _1406 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1408 = isnan(_580);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1396;
    float _1420 = _1418 + 1.0;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1424 = _580 + _1422;
    bool _1426 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1428 = isnan(_580);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1434 = _1430 || _1432;
    float _1436 = float(_1434);
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1440 = _1338 * _1420;
    float _1442 = _1314 ? as_type<float>(_1376) : _1224;
    float _1444 = _1416 * _1384;
    float _1446 = -_1416;
    float _1448 = _1446 + 1.0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1452 = _1450 != 0;
    float _1454 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = fma(_1326, _1424, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1458 = _1436 * _1448;
    int _1460 = as_type<int>(_1384);
    int _1462 = as_type<int>(_1398);
    float _1464 = _1442;
    if (_1402)
    {
        float _1466 = -_1216;
        float _1468 = _1466 + 1.0;
        _1460 = as_type<int>(_1468);
    }
    int _1470 = _1460;
    float _1472 = in.m_71.x;
    float _1474 = in.m_71.y;
    float _1476 = in.m_71.z;
    float _1478 = -_1436;
    float _1480 = _1478 + 1.0;
    float _1482 = _1398 * _1458;
    float _1484 = as_type<float>(_1470);
    if (_1318)
    {
        float _1486 = -_1216;
        float _1488 = _1486 + 1.0;
        _1462 = as_type<int>(_1488);
    }
    int _1490 = _1462;
    float _1492 = fma(_1454, _1442, -0.5);
    bool _1494 = _930 != 0.0;
    bool _1496 = isnan(_930);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(0.0);
    bool _1502 = _1498 || _1500;
    float _1504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1506 = _1492;
    if (!_1402)
    {
        _1464 = _1216;
    }
    float _1508 = _1464;
    float _1510 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1482);
    float _1512 = _1508;
    if (_1402)
    {
        float _1514 = _1226 ? as_type<float>(_1470) : _1216;
        _1512 = _1514;
    }
    float _1516 = _1512;
    float _1518 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1452)
    {
        float _1520 = _1226 ? _1350 : _1224;
        _1246 = _1520;
    }
    float _1522 = _1246;
    float _1524 = fma(_1340, _1444, _1510);
    if (_1318)
    {
        float _1526 = _1228 ? as_type<float>(_1490) : _1216;
        _1268 = _1526;
    }
    float _1528 = _1268;
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1532 = in.m_73.x;
    float _1534 = in.m_73.y;
    float _1536 = in.m_73.z;
    float _1538 = in.m_73.w;
    bool _1540 = _928 == 0.0;
    bool _1542 = !_1502;
    bool _1544 = _1540 && _1542;
    float _1546 = -_664;
    float _1548 = fma(_832, _1492, _1546);
    float _1550 = fma(_1518, _1516, -0.5);
    float _1552 = -_800;
    float _1554 = fma(_762, _1404, _1552);
    bool _1556 = _932 == 0.0;
    bool _1558 = _1556 && _1544;
    float _1560 = fma(_1456, _1378, _1524);
    float _1562 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1564 = fma(_1358, _1440, _1560);
    float _1566 = fma(_1562, _1288, -0.5);
    float _1568 = fma(_902, _1566, _658);
    if (_1558)
    {
        _842 = _1472;
    }
    float _1570 = _842;
    float _1572 = _1570;
    if (!_1558)
    {
        float _1574 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1472);
        _1572 = _1574;
    }
    float _1576 = _1572;
    float _1578 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1558)
    {
        _1506 = _1476;
    }
    float _1580 = _1506;
    float _1582 = _1580;
    if (!_1558)
    {
        float _1584 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1476);
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (_1558)
    {
        _1484 = _1474;
    }
    float _1588 = _1484;
    float _1590 = _1588;
    if (!_1558)
    {
        float _1592 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1474);
        _1590 = _1592;
    }
    float _1594 = _1590;
    float _1596 = fma(_834, _1550, _772);
    float _1598 = _1578 * _1438;
    float _1600 = _1536 * _1472;
    float _1602 = _1534 * _1476;
    float _1604 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1606 = _1532 * _1474;
    float _1608 = -_1600;
    float _1610 = fma(_1532, _1476, _1608);
    float _1612 = -_1602;
    float _1614 = fma(_1536, _1474, _1612);
    float _1616 = _1604 * _1530;
    float _1618 = -_1606;
    float _1620 = fma(_1534, _1472, _1618);
    float _1622 = _1610 * _1538;
    float _1624 = _1614 * _1538;
    out.m_75.x = _1616;
    out.m_75.y = _1598;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1628 = _1620 * _1538;
    float _1630 = _1554 + 0.5;
    float _1632 = -_1534;
    float _1634 = _1006 * _1632;
    float _1636 = -_1622;
    float _1638 = _1006 * _1636;
    float _1640 = _1596 + 0.5;
    float _1642 = fma(_1018, _1532, _1634);
    float _1644 = _1568 + 0.5;
    float _1646 = -_1594;
    float _1648 = _1006 * _1646;
    float _1650 = _1548 + 0.5;
    float _1652 = fma(_1018, _1624, _1638);
    float _1654 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1564);
    float _1656 = fma(_1018, _1576, _1648);
    float _1658 = _1014 * _1534;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_77.x = _1644;
    out.m_77.y = _1650;
    out.m_77.z = _1640;
    out.m_77.w = _1630;
    float _1664 = _1014 * _1594;
    float _1666 = _1016 * _1534;
    float _1668 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1672 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1674 = _1654 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1676 = fma(_1026, _1576, _1664);
    float _1678 = fma(_1036, _1532, _1666);
    float _1680 = fma(_1020, _1586, _1656);
    float _1682 = fma(_1020, _1628, _1652);
    out.m_79.x = _1668;
    out.m_79.y = _1670;
    out.m_79.z = _1672;
    out.m_79.w = _1674;
    float _1684 = fma(_1026, _1532, _1658);
    float _1686 = _1014 * _1622;
    float _1688 = fma(_1020, _1536, _1642);
    float _1690 = fma(_1040, _1586, _1676);
    float _1692 = fma(_1040, _1536, _1684);
    float _1694 = _1016 * _1594;
    float _1696 = fma(_1028, _1536, _1678);
    float _1698 = _1016 * _1622;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1704 = fma(_1036, _1576, _1694);
    float _1706 = fma(_1026, _1624, _1686);
    float _1708 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1710 = fma(_1688, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1700);
    float _1712 = fma(_1688, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1702);
    float _1714 = fma(_1040, _1628, _1706);
    float _1716 = fma(_1688, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1708);
    float _1718 = fma(_1696, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1710);
    float _1720 = fma(_1028, _1586, _1704);
    float _1722 = fma(_1036, _1624, _1698);
    float _1724 = fma(_1696, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1716);
    float _1726 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1728 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1730 = fma(_1696, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1712);
    float _1732 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1734 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1736 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1738 = fma(_1680, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1726);
    float _1740 = fma(_1028, _1628, _1722);
    float _1742 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1728);
    float _1744 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1732);
    float _1746 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1748 = _1672;
    float _1750 = _1746;
    if (_1094)
    {
        float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1754 = _1184 + _1752;
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1742);
    float _1760 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1744);
    float _1762 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1746);
    if (_1094)
    {
        float _1764 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1766 = _1180 + _1764;
        _1750 = _1766;
    }
    float _1768 = _1750;
    if (_1094)
    {
        float _1770 = _1756 * _1756;
        _1110 = _1770;
    }
    float _1772 = _1110;
    out.m_81.x = _1718;
    out.m_81.y = _1724;
    out.m_81.z = _1730;
    float _1774 = fma(_1680, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1734);
    if (_1094)
    {
        float _1776 = _1768 * _1768;
        _1112 = _1776;
    }
    float _1778 = _1112;
    float _1780 = fma(_1680, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1736);
    float _1782 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1762);
    out.m_83.x = _1758;
    out.m_83.y = _1760;
    out.m_83.z = _1782;
    float _1784 = fma(_1720, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1738);
    float _1786 = fma(_1720, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1774);
    float _1788 = fma(_1720, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1780);
    out.m_85.x = _1784;
    out.m_85.y = _1786;
    out.m_85.z = _1788;
    float _1790 = fma(_1210, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1792 = fma(_1212, 100.0, _1790);
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1796 = _1792 + _1794;
    float _1798 = fma(_1796, _1796, _1778);
    float _1800 = _1798 + _1772;
    float _1802 = sqrt(_1800);
    bool _1804 = _1802 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1806 = isnan(_1802);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1812 = _1808 || _1810;
    float _1814 = _1782;
    float _1816 = _1800;
    if (!_1812)
    {
        _1814 = 1.0;
    }
    float _1818 = _1814;
    bool _1820 = !_1812;
    float _1822 = _1818;
    if (!_1820)
    {
        bool _1824 = _1802 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1826 = isnan(_1802);
        bool _1828 = _1824 || _1826;
        bool _1830 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1832 = _1828 || _1830;
        if (!_1832)
        {
            float _1834 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1836 = _1802 + _1834;
            float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1840 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1838;
            float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1844 = _1842 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1846 = 1.0 / _1840;
            float _1848 = _1836 * _1846;
            float _1850 = fma(_1848, _1844, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1822 = _1850;
            _1852 = true;
        }
        else
        {
            bool _1854 = _1802 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1856 = isnan(_1802);
            bool _1858 = _1854 || _1856;
            bool _1860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1862 = _1858 || _1860;
            if (!_1862)
            {
                float _1864 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1866 = _1802 + _1864;
                float _1868 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1870 = _1868 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1874 = _1872 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1876 = 1.0 / _1870;
                float _1878 = _1866 * _1876;
                float _1880 = fma(_1878, _1874, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1822 = _1880;
                _1852 = true;
            }
            else
            {
                _1822 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1852 = false;
    float _1882 = _1822;
    float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1886 = _1792 + _1884;
    float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1890 = _1180 + _1888;
    float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1894 = _1184 + _1892;
    float _1896 = fma(_1886, _1882, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1898 = fma(_1890, _1882, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1900 = fma(_1894, _1882, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1904 = _1896 + _1902;
    float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1908 = _1898 + _1906;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1900 + _1910;
    float _1914 = _1904 * _1904;
    float _1916 = fma(_1908, _1908, _1914);
    float _1918 = fma(_1912, _1912, _1916);
    float _1920 = rsqrt(_1918);
    float _1922 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1924 = _1908 * _1922;
    float _1926 = _1912 * _1922;
    float _1928 = _1924 * _1924;
    float _1930 = _1926 * _1926;
    float _1932 = _1928 + _1930;
    float _1934 = sqrt(_1932);
    bool _1936 = _1934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1940 = _1934 + _1938;
    float _1942 = _1916;
    float _1944 = _1920;
    float _1946 = _1940;
    float _1948 = _1904;
    float _1950 = _1924;
    if (_1936)
    {
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _1952;
    }
    float _1954 = _1942;
    if (_1936)
    {
        float _1956 = rsqrt(_1932);
        _1944 = _1956;
    }
    float _1958 = _1944;
    float _1960 = _1958;
    if (_1936)
    {
        float _1962 = _1940 * _1954;
        _1946 = _1962;
    }
    float _1964 = _1946;
    float _1966 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1936)
    {
        float _1968 = _1964 * 0.15915493667125701904296875;
        _1816 = _1968;
    }
    float _1970 = _1816;
    float _1972 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1966);
    float _1974 = _1912;
    if (_1936)
    {
        float _1976 = _1970 * 6.283185482025146484375;
        float _1978 = sin(_1976);
        _1974 = _1978;
    }
    float _1980 = _1974;
    float _1982 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1984 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1972);
    float _1986 = precise::max(0.0, _1982);
    float _1988 = _1954;
    float _1990 = _1986;
    if (_1936)
    {
        float _1992 = _1970 * 6.283185482025146484375;
        float _1994 = cos(_1992);
        _1988 = _1994;
    }
    float _1996 = _1988;
    float _1998 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2000 = -_1922;
    float _2002 = -_1986;
    float _2004 = fma(_1904, _2000, _2002);
    if (_1936)
    {
        float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1948 = _2006;
    }
    float _2008 = _1948;
    float _2010 = _2008;
    float _2012 = _1980;
    if (_1936)
    {
        float _2014 = fma(_1980, _2008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _2016;
    if (!_1936)
    {
        _2012 = _1926;
    }
    float _2020 = _2012;
    float _2022 = _2020;
    float _2024 = _1996;
    if (_1936)
    {
        float _2026 = _1996 + (-1.0);
        _1990 = _2026;
    }
    float _2028 = _1990;
    float _2030 = _2028;
    if (_1936)
    {
        float _2032 = _1958 * _2016;
        _1114 = _2032;
    }
    float _2034 = _1114;
    if (!_1936)
    {
        _1960 = _2004;
    }
    float _2036 = _1960;
    float _2038 = _2036;
    if (_1936)
    {
        float _2040 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2030 = _2040;
    }
    float _2042 = _2030;
    if (_1936)
    {
        float _2044 = _1924 * _2034;
        _1950 = _2044;
    }
    float _2046 = _1950;
    if (!_1936)
    {
        _2018 = _1928;
    }
    float _2048 = _2018;
    float _2050 = _2048;
    if (_1936)
    {
        float _2052 = _1926 * _2034;
        _2022 = _2052;
    }
    float _2054 = _2022;
    if (_1936)
    {
        float _2056 = fma(_2004, _1996, _2042);
        _2038 = _2056;
    }
    float _2058 = _2038;
    if (_1936)
    {
        float _2060 = _2046 * _2046;
        _2050 = _2060;
    }
    float _2062 = _2050;
    float _2064 = sqrt(_1918);
    if (!_1936)
    {
        _2024 = _1930;
    }
    float _2066 = _2024;
    float _2068 = _2066;
    if (_1936)
    {
        float _2070 = _2054 * _2054;
        _2068 = _2070;
    }
    float _2072 = _2068;
    float _2074 = fma(_2058, _2058, _2062);
    float _2076 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2078 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2080 = _2074 + _2072;
    float _2082 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2084 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2076);
    float _2086 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2078);
    float _2088 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2082);
    float _2090 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2084);
    float _2092 = rsqrt(_2080);
    float _2094 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2086);
    float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2098 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2096);
    float _2100 = precise::clamp(_2098, 0.0, 1.0);
    float _2102 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2088);
    float _2104 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2106 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2108 = -_2100;
    float _2110 = _2108 + 1.0;
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2116 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2114);
    float _2122 = abs(_2110);
    float _2124 = log2(_2122);
    float _2126 = -_2118;
    float _2128 = fma(_2126, _2116, 1.0);
    float _2130 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2132 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2120);
    float _2134 = _2092 * _2046;
    float _2136 = _2092 * _2058;
    float _2138 = _2092 * _2054;
    float _2140 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2132);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = log2(_2128);
    float _2146 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2130);
    float _2148 = _2136 + 1.0;
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = -_2138;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2158 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2160 = 1.0 / _2140;
    float _2162 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2164 = fma(_2156, -0.5, 0.5);
    float _2166 = fma(_2156, 0.5, 0.5);
    float _2168 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2162);
    float _2170 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2146);
    float _2172 = fma(_2166, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2174 = exp2(_2158);
    float _2176 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2168);
    float _2178 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2170);
    float _2180 = fma(_2166, _2172, -0.212114393711090087890625);
    float _2182 = _2144 * 0.693147182464599609375;
    float _2184 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2176);
    float _2186 = fma(_2166, _2180, 1.570728778839111328125);
    float _2188 = sqrt(_2164);
    float _2190 = _2184 * _2160;
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2194 = -_2136;
    float _2196 = fma(_2174, _2148, _2194);
    float _2198 = _2178 * _2160;
    float _2200 = fma(_2190, 0.5, 0.5);
    float _2202 = fma(_2196, 0.5, 0.5);
    float _2204 = fma(_2198, -0.5, 0.5);
    float _2206 = _2188 * 0.636619746685028076171875;
    float _2208 = -_2186;
    float _2210 = fma(_2206, _2208, 1.0);
    float3 _6323 = float3(_2200, _2204, _2192);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6323, float3(0.0), isnan(_6323)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6323, float3(0.0), isnan(_6323)), level(0.0)).x;
    float3 _6334 = float3(_2200, _2204, _2192);
    float4 _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6334, float3(0.0), isnan(_6334)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6334, float3(0.0), isnan(_6334)), level(0.0)).xyzw;
    float _2217 = _2215.x;
    float _2219 = _2215.y;
    float _2221 = _2215.z;
    float _2223 = _2215.w;
    float2 _6350 = float2(_2210, _2202);
    float3 _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6350, float2(0.0), isnan(_6350)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6350, float2(0.0), isnan(_6350)), level(0.0)).xyz;
    float _2229 = _2227.x;
    float _2231 = _2227.y;
    float _2233 = _2227.z;
    float _2235 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2237 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2239 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2241 = -_1214;
    float _2243 = _2241 + 1.0;
    float _2245 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2235);
    float _2247 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2237);
    float _2249 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2239);
    float _2251 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2245);
    float _2253 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2247);
    float _2255 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2249);
    float _2257 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2259 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2261 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2255);
    float _2263 = 1.0 / _2257;
    float _2265 = _2259 + _2257;
    float _2267 = _2265 * _2263;
    float _2269 = _2267 * 0.5;
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2273 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2271);
    float _2275 = 1.0 / _2273;
    float _2277 = in.m_87.x;
    float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2281 = _2275 * _2279;
    float _2283 = abs(_2281);
    float _2285 = log2(_2283);
    float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2289 = exp2(_2287);
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2293 = precise::clamp(_2291, 0.0, 1.0);
    float _2295 = fma(_2293, -2.0, 3.0);
    float _2297 = _2293 * _2293;
    float _2299 = _2297 * _2295;
    bool _2301 = _2281 <= 8000.0;
    bool _2303 = isnan(_2281);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(8000.0);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = -_2299;
    float _2315 = _2313 + 1.0;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2299);
    float _2319 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2321 = _2261 + _2140;
    float _2323 = _2311 * _2317;
    float _2325 = _2321 * 0.5;
    float _2327 = exp2(_2319);
    float _2329 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2331 = _2243 * _2329;
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    bool _2335 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2337 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan(0.5);
    bool _2343 = _2339 || _2341;
    float _2345 = -_2333;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2349 = _2347 * _2277;
    float _2351 = -_2327;
    float _2353 = _2351 + 1.0;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2359 = _2212;
    float _2361 = _2140;
    float _2363 = _2261;
    float _2365 = _2178;
    float _2367 = _2184;
    if (_2343)
    {
        _2357 = 1.0;
    }
    float _2369 = _2357;
    float _2371 = _2369;
    if (!_2343)
    {
        float _2373 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2377 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2375;
        float _2379 = _2373 * 0.15915493667125701904296875;
        float _2381 = _2379 * 6.283185482025146484375;
        float _2383 = cos(_2381);
        float _2385 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2387 = _2385 * 0.15915493667125701904296875;
        float _2389 = _2379 * 6.283185482025146484375;
        float _2391 = sin(_2389);
        float _2393 = 1.0 / _2383;
        float _2395 = _2387 * 6.283185482025146484375;
        float _2397 = cos(_2395);
        float _2399 = _2391 * _2393;
        float _2401 = _2387 * 6.283185482025146484375;
        float _2403 = sin(_2401);
        float _2405 = _2397 * _2399;
        float _2407 = 1.0 / _2377;
        float _2409 = 1.0 / _2405;
        float _2411 = _2403 * _2409;
        float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2415 = fma(_2281, _2411, _2413);
        float _2417 = _2415 * _2407;
        float _2419 = precise::clamp(_2417, 0.0, 1.0);
        float _2421 = -_2419;
        float _2423 = _2421 + 1.0;
        _2371 = _2423;
    }
    float _2425 = _2371;
    float _2427 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_89.z = _2325;
    out.m_89.w = _2140;
    bool _2429 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2431 = isnan(_2064);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2437 = _2433 || _2435;
    float _2439 = _2427 * _2212;
    float _2441 = -_2427;
    float _2443 = _2441 + 1.0;
    out.m_91.x = _2355;
    float _2445 = _2223 * _2439;
    float _2447 = _2233 * _2439;
    float _2449 = _2223 * _2443;
    out.m_93.x = _1898;
    out.m_93.y = _1896;
    out.m_93.z = _1900;
    float _2451 = fma(_2229, _2445, _2217);
    float _2453 = fma(_2231, _2445, _2219);
    float _2455 = fma(_2223, _2447, _2221);
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2178;
    out.gl_Position.z = _2261;
    out.gl_Position.w = _2140;
    float _2457 = _2443;
    if (!_2437)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2459 = _2457;
    float _2461 = _2425 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2463 = _2459;
    float _2465 = _2459;
    if (!_2437)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2467 = _2359;
    out.m_95.x = _2451;
    out.m_95.y = _2453;
    out.m_95.z = _2455;
    out.m_95.w = _2449;
    float _2469 = _2467;
    float _2471 = _2467;
    if (!_2437)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2473 = _2361;
    float _2475 = _2473;
    float _2477 = _2473;
    if (!_2437)
    {
        _2363 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2479 = _2363;
    float _2481 = _2479;
    float _2483 = _2479;
    if (!_2437)
    {
        _2365 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2485 = _2365;
    float _2487 = _2485;
    float _2489 = _2485;
    if (!_2437)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2491 = _2367;
    bool _2493 = !_2437;
    float _2495 = _2491;
    float _2497 = _2491;
    if (!_2493)
    {
        bool _2499 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2501 = isnan(_2064);
        bool _2503 = _2499 || _2501;
        bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2507 = _2503 || _2505;
        if (!_2507)
        {
            float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2511 = _2064 + _2509;
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2515 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2513;
            float _2517 = 1.0 / _2515;
            float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2539 = _2511 * _2517;
            float _2541 = precise::clamp(_2539, 0.0, 1.0);
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2547 = fma(_2541, _2521, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2549 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2551 = fma(_2541, _2525, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2553 = fma(_2541, _2529, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2555 = fma(_2541, _2533, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2557 = fma(_2541, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2477 = _2549;
            _2497 = _2555;
            _2465 = _2547;
            _2489 = _2553;
            _2483 = _2551;
            _2471 = _2557;
            _2559 = true;
        }
        else
        {
            bool _2561 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2563 = isnan(_2064);
            bool _2565 = _2561 || _2563;
            bool _2567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2569 = _2565 || _2567;
            if (!_2569)
            {
                _2463 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2571 = _2463;
            _2465 = _2571;
            if (!_2569)
            {
                _2475 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2573 = _2475;
            _2477 = _2573;
            if (!_2569)
            {
                _2481 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2575 = _2481;
            _2483 = _2575;
            if (!_2569)
            {
                _2487 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2577 = _2487;
            _2489 = _2577;
            if (!_2569)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2579 = _2495;
            _2497 = _2579;
            if (!_2569)
            {
                _2469 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2581 = _2469;
            bool _2583 = !_2569;
            _2471 = _2581;
            if (!_2583)
            {
                bool _2585 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2587 = isnan(_2064);
                bool _2589 = _2585 || _2587;
                bool _2591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2593 = _2589 || _2591;
                if (!_2593)
                {
                    float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2597 = _2064 + _2595;
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2601 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2599;
                    float _2603 = 1.0 / _2601;
                    float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2625 = _2597 * _2603;
                    float _2627 = precise::clamp(_2625, 0.0, 1.0);
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2633 = fma(_2627, _2607, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2635 = fma(_2627, _2631, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2637 = fma(_2627, _2611, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2639 = fma(_2627, _2615, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2641 = fma(_2627, _2619, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2643 = fma(_2627, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2477 = _2635;
                    _2497 = _2641;
                    _2465 = _2633;
                    _2489 = _2639;
                    _2483 = _2637;
                    _2471 = _2643;
                    _2559 = true;
                }
                else
                {
                    _2477 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2465 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2489 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2483 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2471 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2559 = false;
    float _2645 = _2477;
    float _2647 = _2497;
    float _2649 = _2465;
    float _2651 = _2489;
    float _2653 = _2483;
    float _2655 = _2471;
    float _2657 = fma(_1786, -0.5, 0.5);
    float _2659 = precise::clamp(_2657, 0.0, 1.0);
    float _2661 = -_2645;
    float _2663 = _2661 + _2647;
    float _2665 = _2461 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2667 = -_2649;
    float _2669 = _2667 + _2651;
    out.m_97.x = 0.0;
    float _2671 = fma(_2659, _2663, _2645);
    float _2673 = fma(_2659, _2669, _2649);
    out.m_55.x = _2665;
    float _2675 = -_2653;
    float _2677 = _2675 + _2655;
    float _2679 = _2671 * 0.586610972881317138671875;
    bool _2681 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2683 = fma(_2659, _2677, _2653);
    float _2685 = fma(_2673, 0.298911988735198974609375, _2679);
    bool _2687 = _2425 > 0.0;
    bool _2689 = isnan(_2425);
    bool _2691 = _2687 || _2689;
    bool _2693 = isnan(0.0);
    bool _2695 = _2691 || _2693;
    float _2697 = fma(_2683, 0.114477999508380889892578125, _2685);
    float _2699 = -_2697;
    float _2701 = _2673 + _2699;
    float _2703 = -_2697;
    float _2705 = _2671 + _2703;
    float _2707 = -_2697;
    float _2709 = _2683 + _2707;
    float _2711 = fma(_2701, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2697);
    float _2713 = fma(_2705, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2697);
    float _2715 = fma(_2709, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2697);
    bool _2717 = !_2681;
    if (!_2717)
    {
        float _2719 = -_1896;
        float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2723 = -_1898;
        float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2727 = -_1900;
        float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2731 = _2721 * _2721;
        float _2733 = fma(_2725, _2725, _2731);
        float _2735 = fma(_2729, _2729, _2733);
        float _2737 = sqrt(_2735);
        float _2739 = rsqrt(_2735);
        float _2741 = -_2737;
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2745 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2747 = precise::clamp(_2745, 0.0, 1.0);
        float _2749 = _2725 * _2739;
        float _2751 = _2721 * _2739;
        float _2753 = abs(_2747);
        float _2755 = log2(_2753);
        float _2757 = _2729 * _2739;
        float _2759 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2761 = _1786 * _2751;
        float _2763 = -_2751;
        float _2765 = -_2759;
        float _2767 = fma(_2763, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2765);
        float _2769 = fma(_1784, _2749, _2761);
        float _2771 = -_2757;
        float _2773 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2767);
        float _2775 = fma(_1788, _2757, _2769);
        float _2777 = precise::clamp(_2775, 0.0, 1.0);
        float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2781 = _2773 + _2779;
        float _2783 = _2755 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2785 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = exp2(_2783);
        float _2791 = _2789 * _2787;
        float _2793 = _2777 * _2791;
        float _2795 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2797 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2799 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2795;
        out.m_97.y = _2797;
        out.m_97.z = _2799;
    }
    out.m_99.x = _2711;
    out.m_99.y = _2713;
    out.m_99.z = _2715;
    if (_2695)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _2801 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2801;
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
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2559 = false;
    bool _1852 = false;
    bool _572 = false;
    bool _418 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_52.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_55.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2858 = as_type<float>(_134);
        out.gl_Position.z = _2858;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_57.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_55.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2928 = as_type<float>(_172);
        out.gl_Position.z = _2928;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_59.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _204 + _210;
    bool _214 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _216 = isnan(_204);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _204 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = 1.0 / _228;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _240;
    float _248 = 1.0 / _236;
    float _250 = _208 * _242;
    bool _252 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_204);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_224;
    float _266 = _264 + 1.0;
    float _268 = _262 * _266;
    float _270 = _212 * _246;
    bool _272 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _274 = isnan(_204);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    bool _288 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _290 = isnan(_204);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = -_262;
    float _306 = _304 + 1.0;
    float _308 = -_282;
    float _310 = _308 + 1.0;
    float _312 = _232 * _248;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _318;
    float _322 = _298 * _310;
    float _324 = fma(_286, _312, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _326 = fma(_316, _312, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _328 = fma(_320, _312, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _330 = _282 * _306;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _336 = _326 * _322;
    float _338 = _328 * _322;
    float _340 = _324 * _322;
    float _342 = -_298;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].x, _338);
    float _352 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].y, _336);
    float _354 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[143].z, _340);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = fma(_302, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_348, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_334, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_360, _330, _350);
    float _376 = fma(_358, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_368, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _380 = fma(_372, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _382 = fma(_362, _330, _352);
    float _384 = fma(_364, _330, _354);
    float _386 = fma(_376, _268, _374);
    float _388 = fma(_378, _268, _382);
    float _390 = fma(_380, _268, _384);
    float _392 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_244;
    float _416;
    if (!_398)
    {
        float _400 = in.m_59.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _152 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _430 = _426 + _428;
    float _432 = in.m_61.x;
    float _434 = in.m_61.y;
    float _436 = in.m_61.z;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _442 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = isnan(_426);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _458 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _460 = isnan(_426);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _470;
    bool _474 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _476 = isnan(_426);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = 1.0 / _440;
    float _488 = -_452;
    float _490 = _488 + 1.0;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _494 = _468 * _490;
    float _496 = -_468;
    float _498 = _496 + 1.0;
    float _500 = 1.0 / _456;
    float _502 = _472 * _486;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _508 = _396 * _436;
    float _510 = _394 * _434;
    float _512 = fma(_502, _430, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _514 = _392 * _432;
    float _516 = _506 * _500;
    float _518 = _512 * _494;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _426 + _524;
    float _528 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[115].x, _518);
    float _530 = _452 * _522;
    float _532 = fma(_516, _526, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _536 = fma(_532, _530, _528);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _540 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[117].x, _536);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _546 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _548 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _550 = _544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _540;
    out.m_63.y = _550;
    out.m_63.z = _546;
    out.m_63.w = _548;
    bool _552 = !_492;
    float _570;
    if (!_552)
    {
        float _554 = in.m_59.x;
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _558 = _554 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[11].w, _152);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        float _574 = float(_118);
        float _576 = 1.0 / _574;
        float _578 = _152 * _576;
        _570 = _578;
    }
    _572 = false;
    float _580 = _570;
    float _582 = in.m_59.z;
    float _584 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _586 = log2(_584);
    float _588 = in.m_59.y;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _592 = _590 != 0;
    float _594 = in.m_59.x;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _606 = _604 != 0;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _610 = !_598;
    int _612 = _610 ? 0 : 1;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _616 = _586 * _152;
    bool _618 = !_606;
    int _620 = _618 ? 0 : 1;
    float _622 = _582 * 2.0;
    float _624 = exp2(_616);
    float _626 = _588 * 2.0;
    float _628 = _588 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _630 = _594 * 2.0;
    float _632 = floor(_622);
    float _634 = _594 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _636 = fma(_628, -2.0, _614);
    float _638 = _628;
    if (!_592)
    {
        _638 = _588;
    }
    float _640 = _638;
    float _642 = -_608;
    float _644 = fma(_634, 2.0, _642);
    float _646 = _594 + _588;
    float _648 = _640;
    float _650 = _646;
    if (_592)
    {
        _648 = _594;
    }
    float _652 = _648;
    float _654 = floor(_630);
    float _656 = -_152;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[76].x, _644);
    float _660 = -_624;
    float _662 = _660 + 1.0;
    float _664 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _636);
    float _666 = floor(_626);
    float _668 = _646 + (-1.0);
    bool _670 = _632 > 0.0;
    bool _672 = _632 >= 0.0;
    bool _674 = isnan(_632);
    bool _676 = _672 || _674;
    bool _678 = isnan(0.0);
    bool _680 = _676 || _678;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _684 = _632;
    if (!_592)
    {
        _684 = _582;
    }
    float _686 = _684;
    float _688 = _686;
    if (!_592)
    {
        _650 = _582;
    }
    float _690 = _650;
    float _692 = _690;
    if (_592)
    {
        _688 = _588;
    }
    float _694 = _688;
    if (_592)
    {
        _692 = _588;
    }
    float _696 = _692;
    int _698 = _680 ? 0 : 1;
    float _700 = _694 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _702 = _654 > 0.0;
    bool _704 = _654 >= 0.0;
    bool _706 = isnan(_654);
    bool _708 = _704 || _706;
    bool _710 = isnan(0.0);
    bool _712 = _708 || _710;
    bool _714 = _666 > 0.0;
    bool _716 = _666 >= 0.0;
    bool _718 = isnan(_666);
    bool _720 = _716 || _718;
    bool _722 = isnan(0.0);
    bool _724 = _720 || _722;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _730 = ~_698;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[83].z, _726);
    float _738 = _652 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _742 = abs(_612);
    float _744 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[83].w, _728);
    int _746 = _734;
    if (!_670)
    {
        int _748 = ~_698;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = -_740;
    float _756 = fma(_738, 2.0, _754);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _760 = float(_742);
    float _762 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _744);
    float _764 = float(_752);
    float _766 = fma(_700, -2.0, _758);
    int _768 = _712 ? 0 : 1;
    float _770 = -_152;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[81].x, _756);
    bool _774 = !_602;
    int _776 = _774 ? 0 : 1;
    float _778 = _760 * _764;
    int _780 = ~_768;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = in.m_65.x;
    float _788 = in.m_65.y;
    float _790 = in.m_65.z;
    int _792 = _784;
    if (!_702)
    {
        int _794 = ~_768;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _766);
    int _802 = abs(_776);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _806 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _808 = isnan(1.0);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _814 = _810 || _812;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _818 = 1.0 + _816;
    int _820 = _724 ? 0 : 1;
    float _822 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[78].w, _804);
    float _824 = 1.0 / _818;
    int _826 = ~_820;
    int _828 = _826 + 1;
    int _830 = _828 + 1;
    float _832 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _822);
    float _834 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _736);
    float _836 = _778 * (-2.0);
    float _838 = float(_802);
    int _840 = _830;
    float _842 = _832;
    if (!_714)
    {
        int _844 = ~_820;
        int _846 = _844 + 1;
        _840 = _846;
    }
    int _848 = _840;
    float _850 = _594 + (-0.5);
    float _852 = float(_798);
    float _854 = fma(_836, _786, _786);
    float _856 = fma(_682, _836, _682);
    int _858 = abs(_620);
    float _860 = _588 + _582;
    float _862 = _838 * _852;
    float _864 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].x, _854);
    float _866 = float(_858);
    float _868 = _860 + (-1.0);
    float _870 = float(_848);
    float _872 = _862 * (-2.0);
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _876 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _884 = _880 || _882;
    float _886 = _866 * _870;
    float _888 = _588 + (-0.5);
    float _890 = fma(_872, _788, _788);
    float _892 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[78].z, _874);
    float _894 = _884 ? _662 : 0.0;
    float _896 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _898 = _594 + _582;
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].y, _890);
    float _902 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _892);
    bool _904 = _884;
    if (_814)
    {
        float _906 = _894 * _824;
        _154 = _906;
    }
    float _908 = _154;
    float _910 = _898 + (-1.0);
    float _912 = _886 * (-2.0);
    float _914 = fma(_896, _872, _896);
    float _916 = fma(_856, _908, _864);
    float _918 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _920 = fma(_912, _790, _790);
    float _922 = _582 + (-0.5);
    float _924 = fma(_914, _908, _900);
    float _926 = fma(_918, _912, _918);
    float _928 = in.m_67.x;
    float _930 = in.m_67.y;
    float _932 = in.m_67.z;
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[196].z, _920);
    float _936 = _916 * 0.15915493667125701904296875;
    float _938 = _924 * 0.15915493667125701904296875;
    float _940 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _942 = fma(_926, _908, _934);
    float _944 = _936 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _950 = _942 * 0.15915493667125701904296875;
    float _952 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _954 = in.m_52.x;
    float _956 = in.m_52.y;
    float _958 = in.m_52.z;
    float _960 = _936 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _938 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _928);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _930);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _932);
    float _974 = _968 * _940;
    float _976 = _938 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _972 * _952;
    float _982 = _956 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _984 = _956 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = _956 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _988 = _950 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = _970 * _948;
    float _994 = _946 * _966;
    float _996 = _962 * _966;
    float _998 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[4].x, _982);
    float _1000 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _1002 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[5].x, _986);
    float _1004 = _950 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = _962 * _978;
    float _1010 = _946 * _978;
    float _1012 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1002);
    float _1014 = _962 * _990;
    float _1016 = _946 * _990;
    float _1018 = _978 * _990;
    float _1020 = _966 * _990;
    float _1022 = _1014 * _992;
    float _1024 = _1016 * _992;
    float _1026 = fma(_1006, _1008, _994);
    float _1028 = fma(_1006, _994, _1008);
    float _1030 = -_992;
    float _1032 = _1006 * _1030;
    float _1034 = -_996;
    float _1036 = fma(_1006, _1010, _1034);
    float _1038 = -_1010;
    float _1040 = fma(_1006, _996, _1038);
    float _1042 = fma(_1026, _974, _1022);
    float _1044 = fma(_1018, _974, _1032);
    float _1046 = fma(_1036, _974, _1024);
    float _1048 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1000);
    float _1050 = fma(_1040, _980, _1042);
    float _1052 = fma(_1020, _980, _1044);
    float _1054 = fma(_1028, _980, _1046);
    float _1056 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[4].z, _998);
    float _1058 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1060 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1062 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1058);
    float _1068 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1060);
    float _1070 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1066);
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1068);
    float _1074 = _1064 + _1070;
    float _1076 = _1062 + _1072;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1080 = _1074 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1084 = _1076 + _1082;
    float _1086 = _1080 * _1080;
    float _1088 = _1084 * _1084;
    float _1090 = _1086 + _1088;
    float _1092 = sqrt(_1090);
    bool _1094 = _1092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1092 + _1096;
    float _1100 = 0.0;
    float _1102 = _1092;
    float _1104 = _1050;
    float _1106 = _1074;
    float _1108 = _1076;
    float _1110 = _1088;
    float _1112 = _1086;
    float _1114 = _1014;
    if (_1094)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1116;
    }
    float _1118 = _1100;
    if (_1094)
    {
        float _1120 = _1098 * _1118;
        _1102 = _1120;
    }
    float _1122 = _1102;
    float _1124 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1126 = _1122;
    if (_1094)
    {
        float _1128 = rsqrt(_1090);
        _1104 = _1128;
    }
    float _1130 = _1104;
    float _1132 = _1130;
    if (_1094)
    {
        float _1134 = _1122 * 0.15915493667125701904296875;
        _1126 = _1134;
    }
    float _1136 = _1126;
    float _1138 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1124);
    float _1140 = _1012 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1142 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1138);
    float _1144 = _1136;
    if (_1094)
    {
        float _1146 = _1136 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        _1144 = _1148;
    }
    float _1150 = _1144;
    float _1152 = _1140 + _1142;
    float _1154 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1156 = _1152;
    if (_1094)
    {
        float _1158 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1158;
    }
    float _1160 = _1156;
    float _1162 = floor(_1154);
    float _1164 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1166 = floor(_1164);
    float _1168 = _1160;
    if (_1094)
    {
        float _1170 = fma(_1150, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1168 = _1170;
    }
    float _1172 = _1168;
    if (_1094)
    {
        float _1174 = _1130 * _1172;
        _1132 = _1174;
    }
    float _1176 = _1132;
    if (_1094)
    {
        float _1178 = fma(_1080, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1106 = _1178;
    }
    float _1180 = _1106;
    if (_1094)
    {
        float _1182 = fma(_1084, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1108 = _1182;
    }
    float _1184 = _1108;
    float _1186 = -_1162;
    float _1188 = _1154 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1192 = _1180 + _1190;
    float _1194 = fma(_1180, 6.2500002968590706586837768554688e-05, 0.5);
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1198 = _1184 + _1196;
    float _1200 = fma(_1184, 6.2500002968590706586837768554688e-05, 0.5);
    float _1202 = -_1166;
    float _1204 = _1164 + _1202;
    float _1206 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1208 = fma(_1198, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4584 = float2(_1194, _1200);
    float _1210 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_4584, float2(0.0), isnan(_4584)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_4584, float2(0.0), isnan(_4584)), level(0.0)).y;
    float2 _4594 = float2(_1206, _1208);
    float _1212 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4594, float2(0.0), isnan(_4594)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4594, float2(0.0), isnan(_4594)), level(0.0)).x;
    float2 _4602 = float2(_1188, _1204);
    float _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4602, float2(0.0), isnan(_4602)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4602, float2(0.0), isnan(_4602)), level(0.0)).x;
    float _1216 = in.m_69.x;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1222 = _1220 != 0;
    float _1224 = in.m_69.y;
    bool _1226 = _582 > 0.5;
    bool _1228 = _588 > 0.5;
    float _1230 = in.m_59.w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1240 = _1238 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[133].w);
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1246 = _1224;
    if (_1222)
    {
        bool _1248 = _594 > 0.5;
        _904 = _1248;
    }
    bool _1250 = _904;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1256 = 1.0 / _1234;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1260 = _1258 != 0;
    float _1262 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1268 = _1216;
    if (_1222)
    {
        float _1270 = -_1216;
        float _1272 = _1270 + 1.0;
        _1242 = as_type<int>(_1272);
    }
    int _1274 = _1242;
    if (!_1222)
    {
        _1244 = _1216;
    }
    float _1276 = _1244;
    float _1278 = 1.0 / _1240;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1280;
    float _1284 = _1276;
    if (_1222)
    {
        float _1286 = _1250 ? as_type<float>(_1274) : _1216;
        _1284 = _1286;
    }
    float _1288 = _1284;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1294 = _1230 > 0.5;
    float _1296 = 1.0 / _1266;
    float _1298 = _1292 * _1256;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1310 = _580 + _1308;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1318 = _1316 != 0;
    float _1320 = 1.0 / _1254;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1324 = _580 + _1322;
    float _1326 = _1302 * _1278;
    bool _1328 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1330 = isnan(_580);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = fma(_1298, _1324, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1344 = _580 + _1342;
    float _1346 = _1306 * _1296;
    float _1348 = -_1224;
    float _1350 = _1348 + 1.0;
    float _1352 = -_1338;
    float _1354 = _1352 + 1.0;
    float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1358 = fma(_1346, _1344, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    bool _1360 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1362 = isnan(_580);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    int _1372 = _1294 ? as_type<int>(_1350) : as_type<int>(_1224);
    float _1374 = _1282 * _1320;
    int _1376 = _1228 ? as_type<int>(_1350) : as_type<int>(_1224);
    float _1378 = _1370 * _1354;
    float _1380 = _1260 ? as_type<float>(_1372) : _1224;
    float _1382 = -_1370;
    float _1384 = _1382 + 1.0;
    bool _1386 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1388 = isnan(_580);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1394 = _1390 || _1392;
    float _1396 = float(_1394);
    float _1398 = fma(_1374, _1310, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1402 = _1400 != 0;
    float _1404 = fma(_1380, _1262, -0.5);
    bool _1406 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1408 = isnan(_580);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1396;
    float _1420 = _1418 + 1.0;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1424 = _580 + _1422;
    bool _1426 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1428 = isnan(_580);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1434 = _1430 || _1432;
    float _1436 = float(_1434);
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1440 = _1338 * _1420;
    float _1442 = _1314 ? as_type<float>(_1376) : _1224;
    float _1444 = _1416 * _1384;
    float _1446 = -_1416;
    float _1448 = _1446 + 1.0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1452 = _1450 != 0;
    float _1454 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = fma(_1326, _1424, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1458 = _1436 * _1448;
    int _1460 = as_type<int>(_1384);
    int _1462 = as_type<int>(_1398);
    float _1464 = _1442;
    if (_1402)
    {
        float _1466 = -_1216;
        float _1468 = _1466 + 1.0;
        _1460 = as_type<int>(_1468);
    }
    int _1470 = _1460;
    float _1472 = in.m_71.x;
    float _1474 = in.m_71.y;
    float _1476 = in.m_71.z;
    float _1478 = -_1436;
    float _1480 = _1478 + 1.0;
    float _1482 = _1398 * _1458;
    float _1484 = as_type<float>(_1470);
    if (_1318)
    {
        float _1486 = -_1216;
        float _1488 = _1486 + 1.0;
        _1462 = as_type<int>(_1488);
    }
    int _1490 = _1462;
    float _1492 = fma(_1454, _1442, -0.5);
    bool _1494 = _930 != 0.0;
    bool _1496 = isnan(_930);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(0.0);
    bool _1502 = _1498 || _1500;
    float _1504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1506 = _1492;
    if (!_1402)
    {
        _1464 = _1216;
    }
    float _1508 = _1464;
    float _1510 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1482);
    float _1512 = _1508;
    if (_1402)
    {
        float _1514 = _1226 ? as_type<float>(_1470) : _1216;
        _1512 = _1514;
    }
    float _1516 = _1512;
    float _1518 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1452)
    {
        float _1520 = _1226 ? _1350 : _1224;
        _1246 = _1520;
    }
    float _1522 = _1246;
    float _1524 = fma(_1340, _1444, _1510);
    if (_1318)
    {
        float _1526 = _1228 ? as_type<float>(_1490) : _1216;
        _1268 = _1526;
    }
    float _1528 = _1268;
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1532 = in.m_73.x;
    float _1534 = in.m_73.y;
    float _1536 = in.m_73.z;
    float _1538 = in.m_73.w;
    bool _1540 = _928 == 0.0;
    bool _1542 = !_1502;
    bool _1544 = _1540 && _1542;
    float _1546 = -_664;
    float _1548 = fma(_832, _1492, _1546);
    float _1550 = fma(_1518, _1516, -0.5);
    float _1552 = -_800;
    float _1554 = fma(_762, _1404, _1552);
    bool _1556 = _932 == 0.0;
    bool _1558 = _1556 && _1544;
    float _1560 = fma(_1456, _1378, _1524);
    float _1562 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1564 = fma(_1358, _1440, _1560);
    float _1566 = fma(_1562, _1288, -0.5);
    float _1568 = fma(_902, _1566, _658);
    if (_1558)
    {
        _842 = _1472;
    }
    float _1570 = _842;
    float _1572 = _1570;
    if (!_1558)
    {
        float _1574 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1472);
        _1572 = _1574;
    }
    float _1576 = _1572;
    float _1578 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1558)
    {
        _1506 = _1476;
    }
    float _1580 = _1506;
    float _1582 = _1580;
    if (!_1558)
    {
        float _1584 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1476);
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (_1558)
    {
        _1484 = _1474;
    }
    float _1588 = _1484;
    float _1590 = _1588;
    if (!_1558)
    {
        float _1592 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1474);
        _1590 = _1592;
    }
    float _1594 = _1590;
    float _1596 = fma(_834, _1550, _772);
    float _1598 = _1578 * _1438;
    float _1600 = _1536 * _1472;
    float _1602 = _1534 * _1476;
    float _1604 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1606 = _1532 * _1474;
    float _1608 = -_1600;
    float _1610 = fma(_1532, _1476, _1608);
    float _1612 = -_1602;
    float _1614 = fma(_1536, _1474, _1612);
    float _1616 = _1604 * _1530;
    float _1618 = -_1606;
    float _1620 = fma(_1534, _1472, _1618);
    float _1622 = _1610 * _1538;
    float _1624 = _1614 * _1538;
    out.m_75.x = _1616;
    out.m_75.y = _1598;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1628 = _1620 * _1538;
    float _1630 = _1554 + 0.5;
    float _1632 = -_1534;
    float _1634 = _1006 * _1632;
    float _1636 = -_1622;
    float _1638 = _1006 * _1636;
    float _1640 = _1596 + 0.5;
    float _1642 = fma(_1018, _1532, _1634);
    float _1644 = _1568 + 0.5;
    float _1646 = -_1594;
    float _1648 = _1006 * _1646;
    float _1650 = _1548 + 0.5;
    float _1652 = fma(_1018, _1624, _1638);
    float _1654 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1564);
    float _1656 = fma(_1018, _1576, _1648);
    float _1658 = _1014 * _1534;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_77.x = _1644;
    out.m_77.y = _1650;
    out.m_77.z = _1640;
    out.m_77.w = _1630;
    float _1664 = _1014 * _1594;
    float _1666 = _1016 * _1534;
    float _1668 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1672 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1674 = _1654 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1676 = fma(_1026, _1576, _1664);
    float _1678 = fma(_1036, _1532, _1666);
    float _1680 = fma(_1020, _1586, _1656);
    float _1682 = fma(_1020, _1628, _1652);
    out.m_79.x = _1668;
    out.m_79.y = _1670;
    out.m_79.z = _1672;
    out.m_79.w = _1674;
    float _1684 = fma(_1026, _1532, _1658);
    float _1686 = _1014 * _1622;
    float _1688 = fma(_1020, _1536, _1642);
    float _1690 = fma(_1040, _1586, _1676);
    float _1692 = fma(_1040, _1536, _1684);
    float _1694 = _1016 * _1594;
    float _1696 = fma(_1028, _1536, _1678);
    float _1698 = _1016 * _1622;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1704 = fma(_1036, _1576, _1694);
    float _1706 = fma(_1026, _1624, _1686);
    float _1708 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1710 = fma(_1688, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1700);
    float _1712 = fma(_1688, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1702);
    float _1714 = fma(_1040, _1628, _1706);
    float _1716 = fma(_1688, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1708);
    float _1718 = fma(_1696, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1710);
    float _1720 = fma(_1028, _1586, _1704);
    float _1722 = fma(_1036, _1624, _1698);
    float _1724 = fma(_1696, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1716);
    float _1726 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1728 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1730 = fma(_1696, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1712);
    float _1732 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1734 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1736 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1738 = fma(_1680, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1726);
    float _1740 = fma(_1028, _1628, _1722);
    float _1742 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1728);
    float _1744 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1732);
    float _1746 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1748 = _1672;
    float _1750 = _1746;
    if (_1094)
    {
        float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1754 = _1184 + _1752;
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1742);
    float _1760 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1744);
    float _1762 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1746);
    if (_1094)
    {
        float _1764 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1766 = _1180 + _1764;
        _1750 = _1766;
    }
    float _1768 = _1750;
    if (_1094)
    {
        float _1770 = _1756 * _1756;
        _1110 = _1770;
    }
    float _1772 = _1110;
    out.m_81.x = _1718;
    out.m_81.y = _1724;
    out.m_81.z = _1730;
    float _1774 = fma(_1680, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1734);
    if (_1094)
    {
        float _1776 = _1768 * _1768;
        _1112 = _1776;
    }
    float _1778 = _1112;
    float _1780 = fma(_1680, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1736);
    float _1782 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1762);
    out.m_83.x = _1758;
    out.m_83.y = _1760;
    out.m_83.z = _1782;
    float _1784 = fma(_1720, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1738);
    float _1786 = fma(_1720, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1774);
    float _1788 = fma(_1720, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1780);
    out.m_85.x = _1784;
    out.m_85.y = _1786;
    out.m_85.z = _1788;
    float _1790 = fma(_1210, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1792 = fma(_1212, 100.0, _1790);
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1796 = _1792 + _1794;
    float _1798 = fma(_1796, _1796, _1778);
    float _1800 = _1798 + _1772;
    float _1802 = sqrt(_1800);
    bool _1804 = _1802 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1806 = isnan(_1802);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1812 = _1808 || _1810;
    float _1814 = _1782;
    float _1816 = _1800;
    if (!_1812)
    {
        _1814 = 1.0;
    }
    float _1818 = _1814;
    bool _1820 = !_1812;
    float _1822 = _1818;
    if (!_1820)
    {
        bool _1824 = _1802 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1826 = isnan(_1802);
        bool _1828 = _1824 || _1826;
        bool _1830 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1832 = _1828 || _1830;
        if (!_1832)
        {
            float _1834 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1836 = _1802 + _1834;
            float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1840 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1838;
            float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1844 = _1842 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1846 = 1.0 / _1840;
            float _1848 = _1836 * _1846;
            float _1850 = fma(_1848, _1844, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1822 = _1850;
            _1852 = true;
        }
        else
        {
            bool _1854 = _1802 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1856 = isnan(_1802);
            bool _1858 = _1854 || _1856;
            bool _1860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1862 = _1858 || _1860;
            if (!_1862)
            {
                float _1864 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1866 = _1802 + _1864;
                float _1868 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1870 = _1868 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1874 = _1872 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1876 = 1.0 / _1870;
                float _1878 = _1866 * _1876;
                float _1880 = fma(_1878, _1874, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1822 = _1880;
                _1852 = true;
            }
            else
            {
                _1822 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1852 = false;
    float _1882 = _1822;
    float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1886 = _1792 + _1884;
    float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1890 = _1180 + _1888;
    float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1894 = _1184 + _1892;
    float _1896 = fma(_1886, _1882, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1898 = fma(_1890, _1882, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1900 = fma(_1894, _1882, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1904 = _1896 + _1902;
    float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1908 = _1898 + _1906;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1900 + _1910;
    float _1914 = _1904 * _1904;
    float _1916 = fma(_1908, _1908, _1914);
    float _1918 = fma(_1912, _1912, _1916);
    float _1920 = rsqrt(_1918);
    float _1922 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1924 = _1908 * _1922;
    float _1926 = _1912 * _1922;
    float _1928 = _1924 * _1924;
    float _1930 = _1926 * _1926;
    float _1932 = _1928 + _1930;
    float _1934 = sqrt(_1932);
    bool _1936 = _1934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1940 = _1934 + _1938;
    float _1942 = _1916;
    float _1944 = _1920;
    float _1946 = _1940;
    float _1948 = _1904;
    float _1950 = _1924;
    if (_1936)
    {
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _1952;
    }
    float _1954 = _1942;
    if (_1936)
    {
        float _1956 = rsqrt(_1932);
        _1944 = _1956;
    }
    float _1958 = _1944;
    float _1960 = _1958;
    if (_1936)
    {
        float _1962 = _1940 * _1954;
        _1946 = _1962;
    }
    float _1964 = _1946;
    float _1966 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1936)
    {
        float _1968 = _1964 * 0.15915493667125701904296875;
        _1816 = _1968;
    }
    float _1970 = _1816;
    float _1972 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1966);
    float _1974 = _1912;
    if (_1936)
    {
        float _1976 = _1970 * 6.283185482025146484375;
        float _1978 = sin(_1976);
        _1974 = _1978;
    }
    float _1980 = _1974;
    float _1982 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1984 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1972);
    float _1986 = precise::max(0.0, _1982);
    float _1988 = _1954;
    float _1990 = _1986;
    if (_1936)
    {
        float _1992 = _1970 * 6.283185482025146484375;
        float _1994 = cos(_1992);
        _1988 = _1994;
    }
    float _1996 = _1988;
    float _1998 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2000 = -_1922;
    float _2002 = -_1986;
    float _2004 = fma(_1904, _2000, _2002);
    if (_1936)
    {
        float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1948 = _2006;
    }
    float _2008 = _1948;
    float _2010 = _2008;
    float _2012 = _1980;
    if (_1936)
    {
        float _2014 = fma(_1980, _2008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _2016;
    if (!_1936)
    {
        _2012 = _1926;
    }
    float _2020 = _2012;
    float _2022 = _2020;
    float _2024 = _1996;
    if (_1936)
    {
        float _2026 = _1996 + (-1.0);
        _1990 = _2026;
    }
    float _2028 = _1990;
    float _2030 = _2028;
    if (_1936)
    {
        float _2032 = _1958 * _2016;
        _1114 = _2032;
    }
    float _2034 = _1114;
    if (!_1936)
    {
        _1960 = _2004;
    }
    float _2036 = _1960;
    float _2038 = _2036;
    if (_1936)
    {
        float _2040 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2030 = _2040;
    }
    float _2042 = _2030;
    if (_1936)
    {
        float _2044 = _1924 * _2034;
        _1950 = _2044;
    }
    float _2046 = _1950;
    if (!_1936)
    {
        _2018 = _1928;
    }
    float _2048 = _2018;
    float _2050 = _2048;
    if (_1936)
    {
        float _2052 = _1926 * _2034;
        _2022 = _2052;
    }
    float _2054 = _2022;
    if (_1936)
    {
        float _2056 = fma(_2004, _1996, _2042);
        _2038 = _2056;
    }
    float _2058 = _2038;
    if (_1936)
    {
        float _2060 = _2046 * _2046;
        _2050 = _2060;
    }
    float _2062 = _2050;
    float _2064 = sqrt(_1918);
    if (!_1936)
    {
        _2024 = _1930;
    }
    float _2066 = _2024;
    float _2068 = _2066;
    if (_1936)
    {
        float _2070 = _2054 * _2054;
        _2068 = _2070;
    }
    float _2072 = _2068;
    float _2074 = fma(_2058, _2058, _2062);
    float _2076 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2078 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2080 = _2074 + _2072;
    float _2082 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2084 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2076);
    float _2086 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2078);
    float _2088 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2082);
    float _2090 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2084);
    float _2092 = rsqrt(_2080);
    float _2094 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2086);
    float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2098 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2096);
    float _2100 = precise::clamp(_2098, 0.0, 1.0);
    float _2102 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2088);
    float _2104 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2106 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2108 = -_2100;
    float _2110 = _2108 + 1.0;
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2116 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2114);
    float _2122 = abs(_2110);
    float _2124 = log2(_2122);
    float _2126 = -_2118;
    float _2128 = fma(_2126, _2116, 1.0);
    float _2130 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2132 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2120);
    float _2134 = _2092 * _2046;
    float _2136 = _2092 * _2058;
    float _2138 = _2092 * _2054;
    float _2140 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2132);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = log2(_2128);
    float _2146 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2130);
    float _2148 = _2136 + 1.0;
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = -_2138;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2158 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2160 = 1.0 / _2140;
    float _2162 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2164 = fma(_2156, -0.5, 0.5);
    float _2166 = fma(_2156, 0.5, 0.5);
    float _2168 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2162);
    float _2170 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2146);
    float _2172 = fma(_2166, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2174 = exp2(_2158);
    float _2176 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2168);
    float _2178 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2170);
    float _2180 = fma(_2166, _2172, -0.212114393711090087890625);
    float _2182 = _2144 * 0.693147182464599609375;
    float _2184 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2176);
    float _2186 = fma(_2166, _2180, 1.570728778839111328125);
    float _2188 = sqrt(_2164);
    float _2190 = _2184 * _2160;
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2194 = -_2136;
    float _2196 = fma(_2174, _2148, _2194);
    float _2198 = _2178 * _2160;
    float _2200 = fma(_2190, 0.5, 0.5);
    float _2202 = fma(_2196, 0.5, 0.5);
    float _2204 = fma(_2198, -0.5, 0.5);
    float _2206 = _2188 * 0.636619746685028076171875;
    float _2208 = -_2186;
    float _2210 = fma(_2206, _2208, 1.0);
    float3 _6323 = float3(_2200, _2204, _2192);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6323, float3(0.0), isnan(_6323)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6323, float3(0.0), isnan(_6323)), level(0.0)).x;
    float3 _6334 = float3(_2200, _2204, _2192);
    float4 _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6334, float3(0.0), isnan(_6334)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6334, float3(0.0), isnan(_6334)), level(0.0)).xyzw;
    float _2217 = _2215.x;
    float _2219 = _2215.y;
    float _2221 = _2215.z;
    float _2223 = _2215.w;
    float2 _6350 = float2(_2210, _2202);
    float3 _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6350, float2(0.0), isnan(_6350)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6350, float2(0.0), isnan(_6350)), level(0.0)).xyz;
    float _2229 = _2227.x;
    float _2231 = _2227.y;
    float _2233 = _2227.z;
    float _2235 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2237 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2239 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2241 = -_1214;
    float _2243 = _2241 + 1.0;
    float _2245 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2235);
    float _2247 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2237);
    float _2249 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2239);
    float _2251 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2245);
    float _2253 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2247);
    float _2255 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2249);
    float _2257 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2259 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2261 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2255);
    float _2263 = 1.0 / _2257;
    float _2265 = _2259 + _2257;
    float _2267 = _2265 * _2263;
    float _2269 = _2267 * 0.5;
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2273 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2271);
    float _2275 = 1.0 / _2273;
    float _2277 = in.m_87.x;
    float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2281 = _2275 * _2279;
    float _2283 = abs(_2281);
    float _2285 = log2(_2283);
    float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2289 = exp2(_2287);
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2293 = precise::clamp(_2291, 0.0, 1.0);
    float _2295 = fma(_2293, -2.0, 3.0);
    float _2297 = _2293 * _2293;
    float _2299 = _2297 * _2295;
    bool _2301 = _2281 <= 8000.0;
    bool _2303 = isnan(_2281);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(8000.0);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = -_2299;
    float _2315 = _2313 + 1.0;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2299);
    float _2319 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2321 = _2261 + _2140;
    float _2323 = _2311 * _2317;
    float _2325 = _2321 * 0.5;
    float _2327 = exp2(_2319);
    float _2329 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2331 = _2243 * _2329;
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    bool _2335 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2337 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan(0.5);
    bool _2343 = _2339 || _2341;
    float _2345 = -_2333;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2349 = _2347 * _2277;
    float _2351 = -_2327;
    float _2353 = _2351 + 1.0;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2359 = _2212;
    float _2361 = _2140;
    float _2363 = _2261;
    float _2365 = _2178;
    float _2367 = _2184;
    if (_2343)
    {
        _2357 = 1.0;
    }
    float _2369 = _2357;
    float _2371 = _2369;
    if (!_2343)
    {
        float _2373 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2377 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2375;
        float _2379 = _2373 * 0.15915493667125701904296875;
        float _2381 = _2379 * 6.283185482025146484375;
        float _2383 = cos(_2381);
        float _2385 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2387 = _2385 * 0.15915493667125701904296875;
        float _2389 = _2379 * 6.283185482025146484375;
        float _2391 = sin(_2389);
        float _2393 = 1.0 / _2383;
        float _2395 = _2387 * 6.283185482025146484375;
        float _2397 = cos(_2395);
        float _2399 = _2391 * _2393;
        float _2401 = _2387 * 6.283185482025146484375;
        float _2403 = sin(_2401);
        float _2405 = _2397 * _2399;
        float _2407 = 1.0 / _2377;
        float _2409 = 1.0 / _2405;
        float _2411 = _2403 * _2409;
        float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2415 = fma(_2281, _2411, _2413);
        float _2417 = _2415 * _2407;
        float _2419 = precise::clamp(_2417, 0.0, 1.0);
        float _2421 = -_2419;
        float _2423 = _2421 + 1.0;
        _2371 = _2423;
    }
    float _2425 = _2371;
    float _2427 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_89.z = _2325;
    out.m_89.w = _2140;
    bool _2429 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2431 = isnan(_2064);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2437 = _2433 || _2435;
    float _2439 = _2427 * _2212;
    float _2441 = -_2427;
    float _2443 = _2441 + 1.0;
    out.m_91.x = _2355;
    float _2445 = _2223 * _2439;
    float _2447 = _2233 * _2439;
    float _2449 = _2223 * _2443;
    out.m_93.x = _1898;
    out.m_93.y = _1896;
    out.m_93.z = _1900;
    float _2451 = fma(_2229, _2445, _2217);
    float _2453 = fma(_2231, _2445, _2219);
    float _2455 = fma(_2223, _2447, _2221);
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2178;
    out.gl_Position.z = _2261;
    out.gl_Position.w = _2140;
    float _2457 = _2443;
    if (!_2437)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2459 = _2457;
    float _2461 = _2425 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2463 = _2459;
    float _2465 = _2459;
    if (!_2437)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2467 = _2359;
    out.m_95.x = _2451;
    out.m_95.y = _2453;
    out.m_95.z = _2455;
    out.m_95.w = _2449;
    float _2469 = _2467;
    float _2471 = _2467;
    if (!_2437)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2473 = _2361;
    float _2475 = _2473;
    float _2477 = _2473;
    if (!_2437)
    {
        _2363 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2479 = _2363;
    float _2481 = _2479;
    float _2483 = _2479;
    if (!_2437)
    {
        _2365 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2485 = _2365;
    float _2487 = _2485;
    float _2489 = _2485;
    if (!_2437)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2491 = _2367;
    bool _2493 = !_2437;
    float _2495 = _2491;
    float _2497 = _2491;
    if (!_2493)
    {
        bool _2499 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2501 = isnan(_2064);
        bool _2503 = _2499 || _2501;
        bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2507 = _2503 || _2505;
        if (!_2507)
        {
            float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2511 = _2064 + _2509;
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2515 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2513;
            float _2517 = 1.0 / _2515;
            float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2539 = _2511 * _2517;
            float _2541 = precise::clamp(_2539, 0.0, 1.0);
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2547 = fma(_2541, _2521, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2549 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2551 = fma(_2541, _2525, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2553 = fma(_2541, _2529, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2555 = fma(_2541, _2533, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2557 = fma(_2541, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2477 = _2549;
            _2497 = _2555;
            _2465 = _2547;
            _2489 = _2553;
            _2483 = _2551;
            _2471 = _2557;
            _2559 = true;
        }
        else
        {
            bool _2561 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2563 = isnan(_2064);
            bool _2565 = _2561 || _2563;
            bool _2567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2569 = _2565 || _2567;
            if (!_2569)
            {
                _2463 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2571 = _2463;
            _2465 = _2571;
            if (!_2569)
            {
                _2475 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2573 = _2475;
            _2477 = _2573;
            if (!_2569)
            {
                _2481 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2575 = _2481;
            _2483 = _2575;
            if (!_2569)
            {
                _2487 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2577 = _2487;
            _2489 = _2577;
            if (!_2569)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2579 = _2495;
            _2497 = _2579;
            if (!_2569)
            {
                _2469 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2581 = _2469;
            bool _2583 = !_2569;
            _2471 = _2581;
            if (!_2583)
            {
                bool _2585 = _2064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2587 = isnan(_2064);
                bool _2589 = _2585 || _2587;
                bool _2591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2593 = _2589 || _2591;
                if (!_2593)
                {
                    float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2597 = _2064 + _2595;
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2601 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2599;
                    float _2603 = 1.0 / _2601;
                    float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2625 = _2597 * _2603;
                    float _2627 = precise::clamp(_2625, 0.0, 1.0);
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2633 = fma(_2627, _2607, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2635 = fma(_2627, _2631, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2637 = fma(_2627, _2611, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2639 = fma(_2627, _2615, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2641 = fma(_2627, _2619, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2643 = fma(_2627, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2477 = _2635;
                    _2497 = _2641;
                    _2465 = _2633;
                    _2489 = _2639;
                    _2483 = _2637;
                    _2471 = _2643;
                    _2559 = true;
                }
                else
                {
                    _2477 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2465 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2489 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2483 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2471 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2559 = false;
    float _2645 = _2477;
    float _2647 = _2497;
    float _2649 = _2465;
    float _2651 = _2489;
    float _2653 = _2483;
    float _2655 = _2471;
    float _2657 = fma(_1786, -0.5, 0.5);
    float _2659 = precise::clamp(_2657, 0.0, 1.0);
    float _2661 = -_2645;
    float _2663 = _2661 + _2647;
    float _2665 = _2461 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2667 = -_2649;
    float _2669 = _2667 + _2651;
    out.m_97.x = 0.0;
    float _2671 = fma(_2659, _2663, _2645);
    float _2673 = fma(_2659, _2669, _2649);
    out.m_55.x = _2665;
    float _2675 = -_2653;
    float _2677 = _2675 + _2655;
    float _2679 = _2671 * 0.586610972881317138671875;
    bool _2681 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2683 = fma(_2659, _2677, _2653);
    float _2685 = fma(_2673, 0.298911988735198974609375, _2679);
    bool _2687 = _2425 > 0.0;
    bool _2689 = isnan(_2425);
    bool _2691 = _2687 || _2689;
    bool _2693 = isnan(0.0);
    bool _2695 = _2691 || _2693;
    float _2697 = fma(_2683, 0.114477999508380889892578125, _2685);
    float _2699 = -_2697;
    float _2701 = _2673 + _2699;
    float _2703 = -_2697;
    float _2705 = _2671 + _2703;
    float _2707 = -_2697;
    float _2709 = _2683 + _2707;
    float _2711 = fma(_2701, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2697);
    float _2713 = fma(_2705, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2697);
    float _2715 = fma(_2709, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2697);
    bool _2717 = !_2681;
    if (!_2717)
    {
        float _2719 = -_1896;
        float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2723 = -_1898;
        float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2727 = -_1900;
        float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2731 = _2721 * _2721;
        float _2733 = fma(_2725, _2725, _2731);
        float _2735 = fma(_2729, _2729, _2733);
        float _2737 = sqrt(_2735);
        float _2739 = rsqrt(_2735);
        float _2741 = -_2737;
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2745 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2747 = precise::clamp(_2745, 0.0, 1.0);
        float _2749 = _2725 * _2739;
        float _2751 = _2721 * _2739;
        float _2753 = abs(_2747);
        float _2755 = log2(_2753);
        float _2757 = _2729 * _2739;
        float _2759 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2761 = _1786 * _2751;
        float _2763 = -_2751;
        float _2765 = -_2759;
        float _2767 = fma(_2763, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2765);
        float _2769 = fma(_1784, _2749, _2761);
        float _2771 = -_2757;
        float _2773 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2767);
        float _2775 = fma(_1788, _2757, _2769);
        float _2777 = precise::clamp(_2775, 0.0, 1.0);
        float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2781 = _2773 + _2779;
        float _2783 = _2755 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2785 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = exp2(_2783);
        float _2791 = _2789 * _2787;
        float _2793 = _2777 * _2791;
        float _2795 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2797 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2799 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2795;
        out.m_97.y = _2797;
        out.m_97.z = _2799;
    }
    out.m_99.x = _2711;
    out.m_99.y = _2713;
    out.m_99.z = _2715;
    if (_2695)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _2801 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2801;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

