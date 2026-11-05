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
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_91 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 m_87 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2073 = false;
    bool _604 = false;
    bool _456 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2373 = as_type<float>(_126);
        out.gl_Position.z = _2373;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_51.w;
    float _132 = float(_110);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    if (_152)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _118;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _128 = as_type<int>(_156);
    }
    int _158 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2436 = as_type<float>(_158);
        out.gl_Position.z = _2436;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = 1.0 / _132;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _136 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_53.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _188 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = _188 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = 1.0 / _212;
    bool _220 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _222 = isnan(_188);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = 1.0 / _208;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _188 + _234;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _216;
    float _242 = _192 * _218;
    float _244 = 1.0 / _204;
    float _246 = _236 * _232;
    bool _248 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _250 = isnan(_188);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    bool _260 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _262 = isnan(_188);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_258;
    float _274 = _272 + 1.0;
    float _276 = _196 * _240;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _282;
    float _286 = _270 * _274;
    float _288 = -_270;
    float _290 = _288 + 1.0;
    float _292 = fma(_280, _242, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_284, _242, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _296 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _298 = isnan(_188);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = _200 * _244;
    bool _310 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_188);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _330 = fma(_324, _242, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _332 = -_320;
    float _334 = _332 + 1.0;
    float _336 = _320 * _290;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = _230 * _334;
    float _348 = -_230;
    float _350 = _348 + 1.0;
    float _352 = fma(_328, _276, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _354 = fma(_340, _276, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_344, _276, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = _306 * _350;
    float _360 = -_306;
    float _362 = _360 + 1.0;
    float _364 = _292 * _358;
    float _366 = _294 * _358;
    float _368 = _330 * _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _370;
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _378 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_352, _346, _374);
    float _390 = fma(_354, _346, _376);
    float _392 = fma(_356, _346, _378);
    float _394 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _396 = fma(_382, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_386, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _412 = fma(_394, _336, _388);
    float _414 = fma(_402, _246, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _416 = fma(_406, _246, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _418 = fma(_410, _246, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _420 = fma(_396, _336, _390);
    float _422 = fma(_398, _336, _392);
    float _424 = fma(_414, _286, _412);
    float _426 = fma(_416, _286, _420);
    float _428 = fma(_418, _286, _422);
    float _430 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[147].x, _424);
    float _432 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[147].y, _426);
    float _434 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[147].z, _428);
    bool _436 = !_238;
    float _454;
    if (!_436)
    {
        float _438 = in.m_53.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        _454 = _164;
    }
    _456 = false;
    float _458 = _454;
    float _460 = in.m_55.x;
    float _462 = in.m_55.y;
    float _464 = in.m_55.z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _458 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_458);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_458);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_458);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _526 = 1.0 / _488;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _432 * _462;
    float _536 = -_516;
    float _538 = _536 + 1.0;
    float _540 = _504 * _518;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = _500 * _522;
    float _548 = -_500;
    float _550 = _548 + 1.0;
    float _552 = fma(_540, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _554 = _434 * _464;
    float _556 = _484 * _538;
    float _558 = _552 * _546;
    float _560 = _544 * _526;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _458 + _562;
    float _566 = _430 * _460;
    float _568 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[115].x, _558);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = fma(_560, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _574 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = fma(_572, _556, _568);
    float _580 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _578);
    float _582 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _584 = !_524;
    float _602;
    if (!_584)
    {
        float _586 = in.m_53.x;
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _590 = _586 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _594 = _592 * _588;
        float _596 = floor(_594);
        float _598 = -_596;
        float _600 = _594 + _598;
        _602 = _600;
        _604 = true;
    }
    else
    {
        _602 = _164;
    }
    _604 = false;
    float _606 = _602;
    float _608 = in.m_57.x;
    float _610 = in.m_57.y;
    float _612 = in.m_57.z;
    float _614 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _616 = in.m_46.x;
    float _618 = in.m_46.y;
    float _620 = in.m_46.z;
    float _622 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _624 = in.m_59.y;
    float _626 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _628 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _622);
    float _630 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _632 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _634 = isnan(0.5);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _640 = _636 || _638;
    float _642 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _628);
    bool _644 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _646 = isnan(0.5);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _652 = _648 || _650;
    float _654 = rsqrt(_642);
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _610);
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _608);
    float _660 = _656 * _614;
    float _662 = _658 * _626;
    float _664 = _618 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _666 = _618 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _668 = _618 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _672 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[4].x, _664);
    float _674 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[5].x, _666);
    float _676 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    float _678 = _670 * _630;
    float _680 = _660 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _682 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].z, _672);
    float _684 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].z, _674);
    float _686 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].z, _676);
    float _688 = _660 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _690 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _680);
    float _692 = _654 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _694 = -_624;
    float _696 = _694 + 1.0;
    float _698 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _688);
    float _700 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[26].z, _690);
    float _702 = _692 * _692;
    float _704 = _686 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _706 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[24].z, _698);
    float _708 = _700 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _710 = -_702;
    float _712 = fma(_710, _702, 1.0);
    float _714 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _716 = _684 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _718 = _706 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _720 = _704 + _708;
    float _722 = _696 * _712;
    float _724 = _716 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _726 = _714 + _718;
    float _728 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _730 = _720 + _728;
    float _732 = _722 * 0.800000011920928955078125;
    float _734 = _164 + 0.20000000298023223876953125;
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[11].x, _724);
    float _738 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _740 = _726 + _738;
    float _742 = _730 * _732;
    float _744 = _660 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _746 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[11].z, _736);
    float _748 = _740 * _732;
    float _750 = fma(_742, _734, _720);
    float _752 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _744);
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _756 = fma(_748, _734, _726);
    float _758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _760 = _750 + _758;
    float _762 = _716 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _764 = 1.0 / _754;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _768 = _756 + _766;
    float _770 = _760 * _760;
    float _772 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[10].x, _762);
    float _774 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[25].z, _752);
    float _776 = fma(_768, _768, _770);
    float _778 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[10].z, _772);
    float _780 = _774 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _782 = sqrt(_776);
    float _784 = _778 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _786 = _716 + _780;
    float _788 = _784 + _754;
    float _790 = _788 * _764;
    float _792 = _790 * 0.5;
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _796 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _794);
    bool _798 = _782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _800 = 1.0 / _796;
    float _802 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _804 = _774;
    float _806 = _780;
    float _808 = _786;
    float _810 = _624;
    if (!_798)
    {
        _802 = _756;
    }
    float _812 = _802;
    float _814 = _812;
    if (!_798)
    {
        _804 = _750;
    }
    float _816 = _804;
    float _818 = _816;
    if (!_798)
    {
        _806 = _786;
    }
    float _820 = _806;
    bool _822 = !_798;
    float _824 = _820;
    if (!_822)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _830 = _782 + _828;
        float _832 = _786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _834 = rsqrt(_776);
        float _836 = _830 * _826;
        float _838 = _836 * 0.15915493667125701904296875;
        float _840 = _838 * 6.283185482025146484375;
        float _842 = cos(_840);
        float _844 = _838 * 6.283185482025146484375;
        float _846 = sin(_844);
        float _848 = _842 + (-1.0);
        float _850 = _848 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = fma(_846, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _854 = fma(_786, _842, _850);
        float _856 = _834 * _852;
        float _858 = fma(_768, _856, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _860 = fma(_760, _856, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _824 = _854;
        _814 = _858;
        _818 = _860;
    }
    float _862 = _824;
    float _864 = _814;
    float _866 = _818;
    float _868 = 0.0;
    float _870 = _862;
    float _872 = _864;
    float _874 = _866;
    if (_652)
    {
        _868 = 1.0;
    }
    float _876 = _868;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _880 = _800 * _878;
    float _882 = _876;
    if (!_640)
    {
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _886 = _716 + _884;
        float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _890 = _714 + _888;
        float _892 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _894 = -_716;
        float _896 = _894 + _862;
        float _898 = _886 * _886;
        float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _902 = _704 + _900;
        float _904 = -_714;
        float _906 = _904 + _864;
        float _908 = fma(_890, _890, _898);
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _912 = fma(_902, _902, _908);
        float _914 = sqrt(_912);
        float _916 = _892 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _918 = precise::min(_914, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _920 = _918 * _910;
        float _922 = _916 * _920;
        float _924 = -_704;
        float _926 = _924 + _866;
        float _928 = fma(_896, _922, _716);
        float _930 = fma(_906, _922, _714);
        float _932 = fma(_926, _922, _704);
        _870 = _928;
        _872 = _930;
        _874 = _932;
        _808 = _892;
    }
    float _934 = _870;
    float _936 = _872;
    float _938 = _874;
    float _940 = _808;
    float _942 = _940;
    if (!_652)
    {
        float _944 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _946 = _944 * 0.15915493667125701904296875;
        float _948 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _950 = _946 * 6.283185482025146484375;
        float _952 = cos(_950);
        float _954 = _948 * 0.15915493667125701904296875;
        float _956 = _946 * 6.283185482025146484375;
        float _958 = sin(_956);
        float _960 = 1.0 / _952;
        float _962 = _954 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _958 * _960;
        float _968 = _954 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _964 * _966;
        float _974 = 1.0 / _972;
        float _976 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _978 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _976;
        float _980 = 1.0 / _978;
        float _982 = _970 * _974;
        float _984 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _986 = fma(_880, _982, _984);
        float _988 = _986 * _980;
        float _990 = precise::clamp(_988, 0.0, 1.0);
        _942 = _980;
        _882 = _990;
    }
    float _992 = _942;
    float _994 = _882;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _998 = _934 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1002 = _936 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1006 = _938 + _1004;
    float _1008 = _998 * _998;
    float _1010 = fma(_1002, _1002, _1008);
    float _1012 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1014 = fma(_1006, _1006, _1010);
    float _1016 = rsqrt(_1014);
    float _1018 = sqrt(_1014);
    float _1020 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1022 = _1002 * _1020;
    float _1024 = _1006 * _1020;
    float _1026 = _1022 * _1022;
    float _1028 = _1024 * _1024;
    float _1030 = _1026 + _1028;
    float _1032 = sqrt(_1030);
    bool _1034 = _1032 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1038 = _1032 + _1036;
    float _1040 = _1016;
    float _1042 = _1030;
    float _1044 = _1038;
    float _1046 = _992;
    float _1048 = _998;
    float _1050 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1052 = _1020;
    if (_1034)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1054;
    }
    float _1056 = _1040;
    if (_1034)
    {
        float _1058 = rsqrt(_1030);
        _1042 = _1058;
    }
    float _1060 = _1042;
    float _1062 = _1060;
    if (_1034)
    {
        float _1064 = _1038 * _1056;
        _1044 = _1064;
    }
    float _1066 = _1044;
    if (_1034)
    {
        float _1068 = _1066 * 0.15915493667125701904296875;
        _1046 = _1068;
    }
    float _1070 = _1046;
    float _1072 = _1056;
    float _1074 = _1070;
    if (_1034)
    {
        float _1076 = _1070 * 6.283185482025146484375;
        float _1078 = sin(_1076);
        _1072 = _1078;
    }
    float _1080 = _1072;
    float _1082 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1084 = precise::max(0.0, _1082);
    float _1086 = _1006;
    float _1088 = _1084;
    if (_1034)
    {
        float _1090 = _1070 * 6.283185482025146484375;
        float _1092 = cos(_1090);
        _1086 = _1092;
    }
    float _1094 = _1086;
    float _1096 = -_1020;
    float _1098 = -_1084;
    float _1100 = fma(_998, _1096, _1098);
    if (!_1034)
    {
        _1048 = _1024;
    }
    float _1102 = _1048;
    float _1104 = _1102;
    if (_1034)
    {
        float _1106 = _1100 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1106;
    }
    float _1108 = _1088;
    float _1110 = _1108;
    if (!_1034)
    {
        _1074 = _1022;
    }
    float _1112 = _1074;
    float _1114 = _1080;
    float _1116 = _1112;
    if (_1034)
    {
        float _1118 = fma(_1080, _1108, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1114 = _1118;
    }
    float _1120 = _1114;
    float _1122 = _1120;
    if (_1034)
    {
        float _1124 = _1094 + (-1.0);
        _1110 = _1124;
    }
    float _1126 = _1110;
    float _1128 = _1126;
    if (_1034)
    {
        float _1130 = _1060 * _1120;
        _1050 = _1130;
    }
    float _1132 = _1050;
    if (!_1034)
    {
        _1122 = _1100;
    }
    float _1134 = _1122;
    float _1136 = _1134;
    if (_1034)
    {
        float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1052 = _1138;
    }
    float _1140 = _1052;
    if (_1034)
    {
        float _1142 = _1022 * _1132;
        _1116 = _1142;
    }
    float _1144 = _1116;
    if (!_1034)
    {
        _1128 = _1026;
    }
    float _1146 = _1128;
    float _1148 = _1146;
    if (_1034)
    {
        float _1150 = _1024 * _1132;
        _1104 = _1150;
    }
    float _1152 = _1104;
    if (_1034)
    {
        float _1154 = fma(_1100, _1094, _1140);
        _1136 = _1154;
    }
    float _1156 = _1136;
    if (_1034)
    {
        float _1158 = _1144 * _1144;
        _1148 = _1158;
    }
    float _1160 = _1148;
    float _1162 = _934 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1034)
    {
        _1062 = _1028;
    }
    float _1164 = _1062;
    float _1166 = _1164;
    if (_1034)
    {
        float _1168 = _1152 * _1152;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = fma(_1156, _1156, _1160);
    float _1174 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1176 = floor(_1012);
    float _1178 = _1172 + _1170;
    float _1180 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1174);
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1184 = fma(_1018, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1182);
    float _1186 = precise::clamp(_1184, 0.0, 1.0);
    float _1188 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1190 = rsqrt(_1178);
    float _1192 = -_1186;
    float _1194 = _1192 + 1.0;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1200 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1202 = _934 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1204 = -_1198;
    float _1206 = fma(_1204, _1196, 1.0);
    float _1208 = abs(_1194);
    float _1210 = log2(_1208);
    float _1212 = _934 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1214 = _934 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1216 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1202);
    float _1218 = -_1176;
    float _1220 = _1012 + _1218;
    float _1222 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1212);
    float _1224 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1214);
    float _1226 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1216);
    float _1228 = _1190 * _1144;
    float _1230 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1222);
    float _1232 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1224);
    float _1234 = _1190 * _1156;
    float _1236 = _1190 * _1152;
    float _1238 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1240 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1242 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1244 = floor(_1200);
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1248 = -_1240;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1248);
    float _1252 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1254 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1256 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1246);
    float _1258 = -_1236;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1250);
    float _1262 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1264 = log2(_1206);
    float _1266 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1256);
    float _1268 = fma(_1260, -0.5, 0.5);
    float _1270 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1272 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1262);
    float _1274 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1266);
    float _1276 = fma(_1260, 0.5, 0.5);
    float _1278 = exp2(_1252);
    float _1280 = -_1244;
    float _1282 = _1200 + _1280;
    float _1284 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1270);
    float _1286 = _1234 + 1.0;
    float _1288 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1272);
    float _1290 = fma(_1276, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1292 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1284);
    float _1294 = 1.0 / _1274;
    float _1296 = fma(_1276, _1290, -0.212114393711090087890625);
    float _1298 = _1264 * 0.693147182464599609375;
    float _1300 = sqrt(_1268);
    float _1302 = -_1234;
    float _1304 = fma(_1278, _1286, _1302);
    float _1306 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1288);
    float _1308 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1292);
    float2 _4329 = float2(_1220, _1282);
    float _1310 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4329, float2(0.0), isnan(_4329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4329, float2(0.0), isnan(_4329)), level(0.0)).x;
    float _1312 = fma(_1276, _1296, 1.570728778839111328125);
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1316 = _1306 * _1294;
    float _1318 = _1308 * _1294;
    float _1320 = fma(_1316, 0.5, 0.5);
    float _1322 = fma(_1318, -0.5, 0.5);
    float _1324 = _1300 * 0.636619746685028076171875;
    float3 _4361 = float3(_1320, _1322, _1314);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4361, float3(0.0), isnan(_4361)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4361, float3(0.0), isnan(_4361)), level(0.0)).x;
    float _1328 = -_1312;
    float _1330 = fma(_1324, _1328, 1.0);
    float _1332 = fma(_1304, 0.5, 0.5);
    float3 _4379 = float3(_1320, _1322, _1314);
    float4 _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4379, float3(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4379, float3(0.0), isnan(_4379)), level(0.0)).xyzw;
    float _1337 = _1335.x;
    float _1339 = _1335.y;
    float _1341 = _1335.z;
    float _1343 = _1335.w;
    float2 _4395 = float2(_1330, _1332);
    float3 _1347 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4395, float2(0.0), isnan(_4395)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4395, float2(0.0), isnan(_4395)), level(0.0)).xyz;
    float _1349 = _1347.x;
    float _1351 = _1347.y;
    float _1353 = _1347.z;
    float _1355 = in.m_53.w;
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1359 = in.m_61.x;
    float _1361 = in.m_61.y;
    float _1363 = in.m_61.z;
    float _1365 = in.m_61.w;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1371 = in.m_53.y;
    float _1373 = in.m_53.z;
    float _1375 = 1.0 / _1369;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1377;
    out.m_63.x = _532;
    out.m_63.y = _576;
    out.m_63.z = _574;
    out.m_63.w = _582;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1383 = _1381 != 0;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1387 = _606 + _1385;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1391 = _1389 != 0;
    float _1393 = in.m_59.x;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1397 = _1395 != 0;
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1403 = _1401 != 0;
    float _1405 = in.m_53.x;
    bool _1407 = _1355 > 0.5;
    float _1409 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1413 = _1411 != 0;
    out.m_65.x = _936;
    out.m_65.y = _934;
    out.m_65.z = _938;
    float _1415 = _1379 * _1375;
    float _1417 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1419 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1421 = _1371 > 0.5;
    float _1423 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1425 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1417);
    float _1427 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1419);
    float _1429 = _1421 ? _696 : _624;
    float _1431 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1423);
    float _1433 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1425);
    int _1435 = _1407 ? as_type<int>(_696) : as_type<int>(_624);
    float _1437 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1427);
    float _1439 = _1391 ? _1429 : _624;
    float _1441 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1431);
    int _1443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1445 = _1443 != 0;
    float _1447 = fma(_1415, _1387, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1449 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1451 = isnan(_606);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1457 = _1453 || _1455;
    float _1459 = float(_1457);
    float _1461 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1463 = _1445 ? as_type<float>(_1435) : _624;
    out.m_67.x = _1437;
    out.m_67.y = _1441;
    out.m_67.z = _1433;
    bool _1465 = _1373 > 0.5;
    float _1467 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1471 = _1469 != 0;
    bool _1473 = _1397;
    float _1475 = _1429;
    int _1477 = as_type<int>(_1357);
    float _1479 = _1467;
    float _1481 = _1393;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1485 = _1415;
    float _1487 = _1373;
    float _1489 = _1274;
    if (_1397)
    {
        float _1491 = _1465 ? _696 : _624;
        _810 = _1491;
    }
    float _1493 = _810;
    int _1495 = as_type<int>(_1493);
    if (_1413)
    {
        bool _1497 = _1405 > 0.5;
        _1473 = _1497;
    }
    bool _1499 = _1473;
    if (!_1413)
    {
        _1475 = _1393;
    }
    float _1501 = _1475;
    float _1503 = -_1459;
    float _1505 = _1503 + 1.0;
    bool _1507 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1509 = isnan(_606);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1521 = as_type<int>(_1505);
    float _1523 = _1501;
    if (_1471)
    {
        float _1525 = -_1393;
        float _1527 = _1525 + 1.0;
        _1477 = as_type<int>(_1527);
    }
    int _1529 = _1477;
    float _1531 = _1517 * _1505;
    if (_1403)
    {
        float _1533 = -_1393;
        float _1535 = _1533 + 1.0;
        _1521 = as_type<int>(_1535);
    }
    int _1537 = _1521;
    float _1539 = -_1517;
    float _1541 = _1539 + 1.0;
    float _1543 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1519);
    float _1545 = _1447 * _1531;
    float _1547 = fma(_1461, _1493, -0.5);
    if (_1413)
    {
        float _1549 = -_1393;
        float _1551 = _1549 + 1.0;
        _1495 = as_type<int>(_1551);
    }
    int _1553 = _1495;
    float _1555 = fma(_1463, _1467, -0.5);
    float _1557 = as_type<float>(_1553);
    if (!_1403)
    {
        _1479 = _1393;
    }
    float _1559 = _1479;
    float _1561 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1545);
    float _1563 = _1559;
    if (_1403)
    {
        float _1565 = _1465 ? as_type<float>(_1537) : _1393;
        _1563 = _1565;
    }
    float _1567 = _1563;
    float _1569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1571 = in.m_69.x;
    float _1573 = in.m_69.y;
    float _1575 = in.m_69.z;
    if (_1413)
    {
        float _1577 = _1499 ? as_type<float>(_1553) : _1393;
        _1523 = _1577;
    }
    float _1579 = _1523;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1471)
    {
        float _1583 = _1421 ? as_type<float>(_1529) : _1393;
        _1481 = _1583;
    }
    float _1585 = _1481;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1589 = _610 != 0.0;
    bool _1591 = isnan(_610);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan(0.0);
    bool _1597 = _1593 || _1595;
    float _1599 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1561);
    if (!_1383)
    {
        _1483 = _1371;
    }
    float _1601 = _1483;
    float _1603 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1587);
    bool _1605 = _608 == 0.0;
    bool _1607 = !_1597;
    bool _1609 = _1605 && _1607;
    float _1611 = _1601;
    if (_1383)
    {
        _1611 = _1405;
    }
    float _1613 = _1611;
    float _1615 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1603);
    bool _1617 = _612 == 0.0;
    bool _1619 = _1617 && _1609;
    float _1621 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1581);
    float _1623 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1625 = _1613;
    if (_1383)
    {
        _1485 = _1405;
    }
    float _1627 = _1485;
    float _1629 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1631 = _1627;
    if (!_1383)
    {
        _1631 = _1373;
    }
    float _1633 = _1631;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1637 = 0.0;
    float _1639 = _1633;
    if (!_1383)
    {
        _1637 = _1373;
    }
    float _1641 = _1637;
    float _1643 = fma(_1629, _1567, -0.5);
    float _1645 = -_1635;
    float _1647 = fma(_1623, 2.0, _1645);
    float _1649 = _1641;
    if (_1383)
    {
        _1487 = _1371;
    }
    float _1651 = _1487;
    float _1653 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1621);
    if (_1383)
    {
        _1649 = _1371;
    }
    float _1655 = _1649;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_1383)
    {
        _1557 = _1371;
    }
    float _1659 = _1557;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1663 = _1659;
    if (!_1383)
    {
        _1663 = _1405;
    }
    float _1665 = _1663;
    float _1667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1669 = _1571;
    if (_1619)
    {
        _1625 = _1571;
    }
    float _1671 = _1625;
    float _1673 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1675 = 0.0;
    float _1677 = _1671;
    float _1679 = _1673;
    if (_1619)
    {
        _1675 = _1575;
    }
    float _1681 = _1675;
    float _1683 = -_136;
    float _1685 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1647);
    float _1687 = _1681;
    if (_1619)
    {
        _1639 = _1671;
    }
    float _1689 = _1639;
    float _1691 = -_1657;
    float _1693 = fma(_1673, 2.0, _1691);
    float _1695 = _1689;
    if (!_1619)
    {
        _1677 = _1571;
    }
    float _1697 = _1677;
    float _1699 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1661);
    if (_1619)
    {
        _1679 = _1573;
    }
    float _1701 = _1679;
    float _1703 = _1701;
    if (!_1619)
    {
        float _1705 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1703 = _1705;
    }
    float _1707 = _1703;
    if (_1619)
    {
        _1669 = _1681;
    }
    float _1709 = _1669;
    float _1711 = abs(_880);
    float _1713 = log2(_1711);
    float _1715 = _1709;
    if (!_1619)
    {
        _1687 = _1575;
    }
    float _1717 = _1687;
    float _1719 = fma(_1653, _1643, _1685);
    float _1721 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1723 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1725 = _1361 * _1717;
    float _1727 = _1363 * _1697;
    float _1729 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1619)
    {
        float _1731 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1717);
        _1715 = _1731;
    }
    float _1733 = _1715;
    float _1735 = _1359 * _1573;
    float _1737 = -_1725;
    float _1739 = fma(_1363, _1573, _1737);
    float _1741 = fma(_1721, -2.0, _1729);
    float _1743 = fma(_1723, _1585, -0.5);
    float _1745 = -_136;
    float _1747 = fma(_1745, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1693);
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (!_1619)
    {
        float _1751 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1697);
        _1695 = _1751;
    }
    float _1753 = _1695;
    float _1755 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1757 = fma(_1615, _1743, _1747);
    float _1759 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1761 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1765 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1767 = exp2(_1759);
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1771 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1773 = -_1727;
    float _1775 = fma(_1359, _1717, _1773);
    float _1777 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1779 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1699);
    float _1781 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1741);
    float _1783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    out.m_71.x = _1777;
    out.m_71.y = _1761;
    out.m_71.z = _1763;
    out.m_71.w = _1771;
    float _1787 = -_1735;
    float _1789 = fma(_1361, _1697, _1787);
    float _1791 = _1775 * _1365;
    float _1793 = fma(_1765, -2.0, _1785);
    float _1795 = -_1781;
    float _1797 = fma(_1779, _1555, _1795);
    float _1799 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1543);
    float _1801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1803 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1793);
    float _1805 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1807 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1409);
    float _1809 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1811 = _880 <= 8000.0;
    bool _1813 = isnan(_880);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(8000.0);
    bool _1819 = _1815 || _1817;
    float _1821 = float(_1819);
    float _1823 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1825 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1807);
    float _1827 = _1739 * _1365;
    float _1829 = _1789 * _1365;
    float _1831 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1833 = _1719 + 0.5;
    float _1835 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = _1831 * _1783;
    float _1841 = _1805 * _1801;
    float _1843 = _1797 + 0.5;
    float _1845 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1847 = fma(_1837, -2.0, 3.0);
    float _1849 = _1837 * _1837;
    float _1851 = -_1803;
    float _1853 = fma(_1799, _1547, _1851);
    out.m_73.x = _1839;
    out.m_73.y = _1841;
    out.m_73.z = _1833;
    out.m_73.w = _1843;
    float _1855 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1857 = _1849 * _1847;
    float _1859 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1861 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1863 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1809);
    float _1865 = -_1857;
    float _1867 = _1865 + 1.0;
    float _1869 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1859);
    float _1871 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1861);
    float _1873 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1823);
    float _1875 = fma(_1867, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1857);
    float _1877 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1845);
    float _1879 = _1757 + 0.5;
    float _1881 = _1853 + 0.5;
    float _1883 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1869);
    float _1885 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1863);
    float _1887 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1871);
    float _1889 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1891 = in.m_75.x;
    float _1893 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1825);
    float _1895 = _1821 * _1875;
    float _1897 = exp2(_1889);
    float _1899 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1855);
    float _1901 = _1893 + _1274;
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1306;
    out.gl_Position.y = _1308;
    out.gl_Position.z = _1893;
    out.gl_Position.w = _1274;
    float _1905 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1877);
    float _1907 = _1901 * 0.5;
    out.m_77.x = _1879;
    out.m_77.y = _1881;
    float _1909 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1873);
    float _1911 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1899);
    out.m_79.x = _1883;
    out.m_79.y = _1885;
    out.m_79.z = _1887;
    bool _1913 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1915 = isnan(_1018);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1921 = _1917 || _1919;
    float _1923 = -_1897;
    float _1925 = _1923 + 1.0;
    out.m_81.z = _1907;
    out.m_81.w = _1274;
    float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _1909;
    out.m_83.y = _1905;
    out.m_83.z = _1911;
    float _1929 = -_1927;
    float _1931 = _1929 + 1.0;
    float _1933 = _1885;
    float _1935 = _1883;
    float _1937 = _1893;
    float _1939 = _1931;
    if (!_1921)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1941 = _1933;
    float _1943 = _1941;
    float _1945 = _1941;
    if (!_1921)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1947 = _1935;
    float _1949 = _1947;
    float _1951 = _1947;
    if (!_1921)
    {
        _1489 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1953 = _1489;
    float _1955 = _1953;
    float _1957 = _1953;
    if (!_1921)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1959 = _1937;
    float _1961 = -_1310;
    float _1963 = _1961 + 1.0;
    float _1965 = _1963 * _1903;
    float _1967 = precise::clamp(_1965, 0.0, 1.0);
    float _1969 = -_1967;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1973 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1975 = _1971 * _1891;
    float _1977 = _1927 * _1326;
    float _1979 = _1975 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1981 = _1343 * _1977;
    float _1983 = _1343 * _1931;
    out.m_85.x = _1979;
    float _1985 = _1981;
    float _1987 = _1959;
    float _1989 = _1959;
    if (!_1921)
    {
        _1939 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1991 = _1939;
    float _1993 = _1353 * _1977;
    float _1995 = fma(_1349, _1981, _1337);
    float _1997 = fma(_1351, _1981, _1339);
    float _1999 = _1991;
    float _2001 = _1991;
    if (!_1921)
    {
        _1985 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2003 = _1985;
    float _2005 = fma(_1343, _1993, _1341);
    out.m_87.x = _1995;
    out.m_87.y = _1997;
    out.m_87.z = _2005;
    out.m_87.w = _1983;
    bool _2007 = !_1921;
    float _2009 = _2003;
    float _2011 = _2003;
    if (!_2007)
    {
        bool _2013 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2015 = isnan(_1018);
        bool _2017 = _2013 || _2015;
        bool _2019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2021 = _2017 || _2019;
        if (!_2021)
        {
            float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2025 = _1018 + _2023;
            float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2029 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2027;
            float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2035 = 1.0 / _2029;
            float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2053 = _2025 * _2035;
            float _2055 = precise::clamp(_2053, 0.0, 1.0);
            float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2061 = fma(_2055, _2033, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2063 = fma(_2055, _2059, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2065 = fma(_2055, _2039, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2067 = fma(_2055, _2043, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2069 = fma(_2055, _2047, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2071 = fma(_2055, _2051, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1951 = _2065;
            _2011 = _2069;
            _1945 = _2061;
            _1989 = _2067;
            _1957 = _2063;
            _2001 = _2071;
            _2073 = true;
        }
        else
        {
            bool _2075 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2077 = isnan(_1018);
            bool _2079 = _2075 || _2077;
            bool _2081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2083 = _2079 || _2081;
            if (!_2083)
            {
                _1943 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2085 = _1943;
            _1945 = _2085;
            if (!_2083)
            {
                _1949 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2087 = _1949;
            _1951 = _2087;
            if (!_2083)
            {
                _1955 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2089 = _1955;
            _1957 = _2089;
            if (!_2083)
            {
                _1987 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2091 = _1987;
            _1989 = _2091;
            if (!_2083)
            {
                _2009 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2093 = _2009;
            _2011 = _2093;
            if (!_2083)
            {
                _1999 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2095 = _1999;
            bool _2097 = !_2083;
            _2001 = _2095;
            if (!_2097)
            {
                bool _2099 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2101 = isnan(_1018);
                bool _2103 = _2099 || _2101;
                bool _2105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2107 = _2103 || _2105;
                if (!_2107)
                {
                    float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2111 = _1018 + _2109;
                    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2115 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2113;
                    float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2121 = 1.0 / _2115;
                    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2125 = _2123 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2137 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2139 = _2111 * _2121;
                    float _2141 = precise::clamp(_2139, 0.0, 1.0);
                    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2147 = fma(_2141, _2119, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2149 = fma(_2141, _2145, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2151 = fma(_2141, _2125, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2153 = fma(_2141, _2129, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2155 = fma(_2141, _2133, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2157 = fma(_2141, _2137, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1951 = _2151;
                    _2011 = _2155;
                    _1945 = _2147;
                    _1989 = _2153;
                    _1957 = _2149;
                    _2001 = _2157;
                    _2073 = true;
                }
                else
                {
                    _1951 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2011 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1945 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1989 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1957 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2001 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2073 = false;
    float _2159 = _1951;
    float _2161 = _2011;
    float _2163 = _1945;
    float _2165 = _1989;
    float _2167 = _1957;
    float _2169 = _2001;
    float _2171 = fma(_1905, -0.5, 0.5);
    float _2173 = precise::clamp(_2171, 0.0, 1.0);
    float _2175 = -_2159;
    float _2177 = _2175 + _2161;
    float _2179 = _1973 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2181 = -_2163;
    float _2183 = _2181 + _2165;
    float _2185 = fma(_2173, _2177, _2159);
    out.m_89.x = 0.0;
    float _2187 = -_2167;
    float _2189 = _2187 + _2169;
    float _2191 = fma(_2173, _2183, _2163);
    float _2193 = _2185 * 0.586610972881317138671875;
    out.m_49.x = _2179;
    bool _2195 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2197 = fma(_2173, _2189, _2167);
    float _2199 = fma(_2191, 0.298911988735198974609375, _2193);
    bool _2201 = _994 > 0.0;
    bool _2203 = isnan(_994);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(0.0);
    bool _2209 = _2205 || _2207;
    float _2211 = fma(_2197, 0.114477999508380889892578125, _2199);
    float _2213 = -_2211;
    float _2215 = _2191 + _2213;
    float _2217 = -_2211;
    float _2219 = _2185 + _2217;
    float _2221 = -_2211;
    float _2223 = _2197 + _2221;
    float _2225 = fma(_2215, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2211);
    float _2227 = fma(_2219, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2211);
    float _2229 = fma(_2223, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2211);
    bool _2231 = !_2195;
    if (!_2231)
    {
        float _2233 = -_934;
        float _2235 = _2233 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2237 = -_936;
        float _2239 = _2237 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2241 = -_938;
        float _2243 = _2241 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2245 = _2235 * _2235;
        float _2247 = fma(_2239, _2239, _2245);
        float _2249 = fma(_2243, _2243, _2247);
        float _2251 = sqrt(_2249);
        float _2253 = rsqrt(_2249);
        float _2255 = -_2251;
        float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2259 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2261 = precise::clamp(_2259, 0.0, 1.0);
        float _2263 = _2239 * _2253;
        float _2265 = _2235 * _2253;
        float _2267 = abs(_2261);
        float _2269 = log2(_2267);
        float _2271 = _2243 * _2253;
        float _2273 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2275 = _1905 * _2265;
        float _2277 = -_2265;
        float _2279 = -_2273;
        float _2281 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2279);
        float _2283 = fma(_1909, _2263, _2275);
        float _2285 = -_2271;
        float _2287 = fma(_2285, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2281);
        float _2289 = fma(_1911, _2271, _2283);
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2295 = _2287 + _2293;
        float _2297 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2299 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = exp2(_2297);
        float _2305 = _2303 * _2301;
        float _2307 = _2291 * _2305;
        float _2309 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2311 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2313 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2309;
        out.m_89.y = _2311;
        out.m_89.z = _2313;
    }
    out.m_91.x = _2225;
    out.m_91.y = _2227;
    out.m_91.z = _2229;
    if (_2209)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2315 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2315;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2073 = false;
    bool _604 = false;
    bool _456 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2373 = as_type<float>(_126);
        out.gl_Position.z = _2373;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_51.w;
    float _132 = float(_110);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    if (_152)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _118;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _128 = as_type<int>(_156);
    }
    int _158 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2436 = as_type<float>(_158);
        out.gl_Position.z = _2436;
    }
    if (_152)
    {
        return out;
    }
    float _160 = 1.0 / _132;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _136 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_53.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _188 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = _188 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = 1.0 / _212;
    bool _220 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _222 = isnan(_188);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = 1.0 / _208;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _188 + _234;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _216;
    float _242 = _192 * _218;
    float _244 = 1.0 / _204;
    float _246 = _236 * _232;
    bool _248 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _250 = isnan(_188);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    bool _260 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _262 = isnan(_188);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_258;
    float _274 = _272 + 1.0;
    float _276 = _196 * _240;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _282;
    float _286 = _270 * _274;
    float _288 = -_270;
    float _290 = _288 + 1.0;
    float _292 = fma(_280, _242, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_284, _242, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _296 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _298 = isnan(_188);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = _200 * _244;
    bool _310 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_188);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _330 = fma(_324, _242, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _332 = -_320;
    float _334 = _332 + 1.0;
    float _336 = _320 * _290;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = _230 * _334;
    float _348 = -_230;
    float _350 = _348 + 1.0;
    float _352 = fma(_328, _276, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _354 = fma(_340, _276, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_344, _276, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = _306 * _350;
    float _360 = -_306;
    float _362 = _360 + 1.0;
    float _364 = _292 * _358;
    float _366 = _294 * _358;
    float _368 = _330 * _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _370;
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _378 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_352, _346, _374);
    float _390 = fma(_354, _346, _376);
    float _392 = fma(_356, _346, _378);
    float _394 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _396 = fma(_382, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_386, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _412 = fma(_394, _336, _388);
    float _414 = fma(_402, _246, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _416 = fma(_406, _246, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _418 = fma(_410, _246, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _420 = fma(_396, _336, _390);
    float _422 = fma(_398, _336, _392);
    float _424 = fma(_414, _286, _412);
    float _426 = fma(_416, _286, _420);
    float _428 = fma(_418, _286, _422);
    float _430 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[147].x, _424);
    float _432 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[147].y, _426);
    float _434 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[147].z, _428);
    bool _436 = !_238;
    float _454;
    if (!_436)
    {
        float _438 = in.m_53.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        _454 = _164;
    }
    _456 = false;
    float _458 = _454;
    float _460 = in.m_55.x;
    float _462 = in.m_55.y;
    float _464 = in.m_55.z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _458 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_458);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_458);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_458);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _526 = 1.0 / _488;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _432 * _462;
    float _536 = -_516;
    float _538 = _536 + 1.0;
    float _540 = _504 * _518;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = _500 * _522;
    float _548 = -_500;
    float _550 = _548 + 1.0;
    float _552 = fma(_540, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _554 = _434 * _464;
    float _556 = _484 * _538;
    float _558 = _552 * _546;
    float _560 = _544 * _526;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _458 + _562;
    float _566 = _430 * _460;
    float _568 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[115].x, _558);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = fma(_560, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _574 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = fma(_572, _556, _568);
    float _580 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _578);
    float _582 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _584 = !_524;
    float _602;
    if (!_584)
    {
        float _586 = in.m_53.x;
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _590 = _586 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _594 = _592 * _588;
        float _596 = floor(_594);
        float _598 = -_596;
        float _600 = _594 + _598;
        _602 = _600;
        _604 = true;
    }
    else
    {
        _602 = _164;
    }
    _604 = false;
    float _606 = _602;
    float _608 = in.m_57.x;
    float _610 = in.m_57.y;
    float _612 = in.m_57.z;
    float _614 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _616 = in.m_46.x;
    float _618 = in.m_46.y;
    float _620 = in.m_46.z;
    float _622 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _624 = in.m_59.y;
    float _626 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _628 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _622);
    float _630 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _632 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _634 = isnan(0.5);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _640 = _636 || _638;
    float _642 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _628);
    bool _644 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _646 = isnan(0.5);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _652 = _648 || _650;
    float _654 = rsqrt(_642);
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _610);
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _608);
    float _660 = _656 * _614;
    float _662 = _658 * _626;
    float _664 = _618 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _666 = _618 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _668 = _618 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _672 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[4].x, _664);
    float _674 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[5].x, _666);
    float _676 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    float _678 = _670 * _630;
    float _680 = _660 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _682 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].z, _672);
    float _684 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].z, _674);
    float _686 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].z, _676);
    float _688 = _660 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _690 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _680);
    float _692 = _654 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _694 = -_624;
    float _696 = _694 + 1.0;
    float _698 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _688);
    float _700 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[26].z, _690);
    float _702 = _692 * _692;
    float _704 = _686 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _706 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[24].z, _698);
    float _708 = _700 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _710 = -_702;
    float _712 = fma(_710, _702, 1.0);
    float _714 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _716 = _684 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _718 = _706 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _720 = _704 + _708;
    float _722 = _696 * _712;
    float _724 = _716 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _726 = _714 + _718;
    float _728 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _730 = _720 + _728;
    float _732 = _722 * 0.800000011920928955078125;
    float _734 = _164 + 0.20000000298023223876953125;
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[11].x, _724);
    float _738 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _740 = _726 + _738;
    float _742 = _730 * _732;
    float _744 = _660 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _746 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[11].z, _736);
    float _748 = _740 * _732;
    float _750 = fma(_742, _734, _720);
    float _752 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _744);
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _756 = fma(_748, _734, _726);
    float _758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _760 = _750 + _758;
    float _762 = _716 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _764 = 1.0 / _754;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _768 = _756 + _766;
    float _770 = _760 * _760;
    float _772 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[10].x, _762);
    float _774 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[25].z, _752);
    float _776 = fma(_768, _768, _770);
    float _778 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[10].z, _772);
    float _780 = _774 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _782 = sqrt(_776);
    float _784 = _778 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _786 = _716 + _780;
    float _788 = _784 + _754;
    float _790 = _788 * _764;
    float _792 = _790 * 0.5;
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _796 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _794);
    bool _798 = _782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _800 = 1.0 / _796;
    float _802 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _804 = _774;
    float _806 = _780;
    float _808 = _786;
    float _810 = _624;
    if (!_798)
    {
        _802 = _756;
    }
    float _812 = _802;
    float _814 = _812;
    if (!_798)
    {
        _804 = _750;
    }
    float _816 = _804;
    float _818 = _816;
    if (!_798)
    {
        _806 = _786;
    }
    float _820 = _806;
    bool _822 = !_798;
    float _824 = _820;
    if (!_822)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _830 = _782 + _828;
        float _832 = _786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _834 = rsqrt(_776);
        float _836 = _830 * _826;
        float _838 = _836 * 0.15915493667125701904296875;
        float _840 = _838 * 6.283185482025146484375;
        float _842 = cos(_840);
        float _844 = _838 * 6.283185482025146484375;
        float _846 = sin(_844);
        float _848 = _842 + (-1.0);
        float _850 = _848 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = fma(_846, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _854 = fma(_786, _842, _850);
        float _856 = _834 * _852;
        float _858 = fma(_768, _856, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _860 = fma(_760, _856, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _824 = _854;
        _814 = _858;
        _818 = _860;
    }
    float _862 = _824;
    float _864 = _814;
    float _866 = _818;
    float _868 = 0.0;
    float _870 = _862;
    float _872 = _864;
    float _874 = _866;
    if (_652)
    {
        _868 = 1.0;
    }
    float _876 = _868;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _880 = _800 * _878;
    float _882 = _876;
    if (!_640)
    {
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _886 = _716 + _884;
        float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _890 = _714 + _888;
        float _892 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _894 = -_716;
        float _896 = _894 + _862;
        float _898 = _886 * _886;
        float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _902 = _704 + _900;
        float _904 = -_714;
        float _906 = _904 + _864;
        float _908 = fma(_890, _890, _898);
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _912 = fma(_902, _902, _908);
        float _914 = sqrt(_912);
        float _916 = _892 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _918 = precise::min(_914, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _920 = _918 * _910;
        float _922 = _916 * _920;
        float _924 = -_704;
        float _926 = _924 + _866;
        float _928 = fma(_896, _922, _716);
        float _930 = fma(_906, _922, _714);
        float _932 = fma(_926, _922, _704);
        _870 = _928;
        _872 = _930;
        _874 = _932;
        _808 = _892;
    }
    float _934 = _870;
    float _936 = _872;
    float _938 = _874;
    float _940 = _808;
    float _942 = _940;
    if (!_652)
    {
        float _944 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _946 = _944 * 0.15915493667125701904296875;
        float _948 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _950 = _946 * 6.283185482025146484375;
        float _952 = cos(_950);
        float _954 = _948 * 0.15915493667125701904296875;
        float _956 = _946 * 6.283185482025146484375;
        float _958 = sin(_956);
        float _960 = 1.0 / _952;
        float _962 = _954 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _958 * _960;
        float _968 = _954 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _964 * _966;
        float _974 = 1.0 / _972;
        float _976 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _978 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _976;
        float _980 = 1.0 / _978;
        float _982 = _970 * _974;
        float _984 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _986 = fma(_880, _982, _984);
        float _988 = _986 * _980;
        float _990 = precise::clamp(_988, 0.0, 1.0);
        _942 = _980;
        _882 = _990;
    }
    float _992 = _942;
    float _994 = _882;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _998 = _934 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1002 = _936 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1006 = _938 + _1004;
    float _1008 = _998 * _998;
    float _1010 = fma(_1002, _1002, _1008);
    float _1012 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1014 = fma(_1006, _1006, _1010);
    float _1016 = rsqrt(_1014);
    float _1018 = sqrt(_1014);
    float _1020 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1022 = _1002 * _1020;
    float _1024 = _1006 * _1020;
    float _1026 = _1022 * _1022;
    float _1028 = _1024 * _1024;
    float _1030 = _1026 + _1028;
    float _1032 = sqrt(_1030);
    bool _1034 = _1032 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1038 = _1032 + _1036;
    float _1040 = _1016;
    float _1042 = _1030;
    float _1044 = _1038;
    float _1046 = _992;
    float _1048 = _998;
    float _1050 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1052 = _1020;
    if (_1034)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1054;
    }
    float _1056 = _1040;
    if (_1034)
    {
        float _1058 = rsqrt(_1030);
        _1042 = _1058;
    }
    float _1060 = _1042;
    float _1062 = _1060;
    if (_1034)
    {
        float _1064 = _1038 * _1056;
        _1044 = _1064;
    }
    float _1066 = _1044;
    if (_1034)
    {
        float _1068 = _1066 * 0.15915493667125701904296875;
        _1046 = _1068;
    }
    float _1070 = _1046;
    float _1072 = _1056;
    float _1074 = _1070;
    if (_1034)
    {
        float _1076 = _1070 * 6.283185482025146484375;
        float _1078 = sin(_1076);
        _1072 = _1078;
    }
    float _1080 = _1072;
    float _1082 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1084 = precise::max(0.0, _1082);
    float _1086 = _1006;
    float _1088 = _1084;
    if (_1034)
    {
        float _1090 = _1070 * 6.283185482025146484375;
        float _1092 = cos(_1090);
        _1086 = _1092;
    }
    float _1094 = _1086;
    float _1096 = -_1020;
    float _1098 = -_1084;
    float _1100 = fma(_998, _1096, _1098);
    if (!_1034)
    {
        _1048 = _1024;
    }
    float _1102 = _1048;
    float _1104 = _1102;
    if (_1034)
    {
        float _1106 = _1100 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1106;
    }
    float _1108 = _1088;
    float _1110 = _1108;
    if (!_1034)
    {
        _1074 = _1022;
    }
    float _1112 = _1074;
    float _1114 = _1080;
    float _1116 = _1112;
    if (_1034)
    {
        float _1118 = fma(_1080, _1108, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1114 = _1118;
    }
    float _1120 = _1114;
    float _1122 = _1120;
    if (_1034)
    {
        float _1124 = _1094 + (-1.0);
        _1110 = _1124;
    }
    float _1126 = _1110;
    float _1128 = _1126;
    if (_1034)
    {
        float _1130 = _1060 * _1120;
        _1050 = _1130;
    }
    float _1132 = _1050;
    if (!_1034)
    {
        _1122 = _1100;
    }
    float _1134 = _1122;
    float _1136 = _1134;
    if (_1034)
    {
        float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1052 = _1138;
    }
    float _1140 = _1052;
    if (_1034)
    {
        float _1142 = _1022 * _1132;
        _1116 = _1142;
    }
    float _1144 = _1116;
    if (!_1034)
    {
        _1128 = _1026;
    }
    float _1146 = _1128;
    float _1148 = _1146;
    if (_1034)
    {
        float _1150 = _1024 * _1132;
        _1104 = _1150;
    }
    float _1152 = _1104;
    if (_1034)
    {
        float _1154 = fma(_1100, _1094, _1140);
        _1136 = _1154;
    }
    float _1156 = _1136;
    if (_1034)
    {
        float _1158 = _1144 * _1144;
        _1148 = _1158;
    }
    float _1160 = _1148;
    float _1162 = _934 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1034)
    {
        _1062 = _1028;
    }
    float _1164 = _1062;
    float _1166 = _1164;
    if (_1034)
    {
        float _1168 = _1152 * _1152;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = fma(_1156, _1156, _1160);
    float _1174 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1176 = floor(_1012);
    float _1178 = _1172 + _1170;
    float _1180 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1174);
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1184 = fma(_1018, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1182);
    float _1186 = precise::clamp(_1184, 0.0, 1.0);
    float _1188 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1190 = rsqrt(_1178);
    float _1192 = -_1186;
    float _1194 = _1192 + 1.0;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1200 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1202 = _934 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1204 = -_1198;
    float _1206 = fma(_1204, _1196, 1.0);
    float _1208 = abs(_1194);
    float _1210 = log2(_1208);
    float _1212 = _934 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1214 = _934 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1216 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1202);
    float _1218 = -_1176;
    float _1220 = _1012 + _1218;
    float _1222 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1212);
    float _1224 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1214);
    float _1226 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1216);
    float _1228 = _1190 * _1144;
    float _1230 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1222);
    float _1232 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1224);
    float _1234 = _1190 * _1156;
    float _1236 = _1190 * _1152;
    float _1238 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1240 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1242 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1244 = floor(_1200);
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1248 = -_1240;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1248);
    float _1252 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1254 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1256 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1246);
    float _1258 = -_1236;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1250);
    float _1262 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1264 = log2(_1206);
    float _1266 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1256);
    float _1268 = fma(_1260, -0.5, 0.5);
    float _1270 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1272 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1262);
    float _1274 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1266);
    float _1276 = fma(_1260, 0.5, 0.5);
    float _1278 = exp2(_1252);
    float _1280 = -_1244;
    float _1282 = _1200 + _1280;
    float _1284 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1270);
    float _1286 = _1234 + 1.0;
    float _1288 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1272);
    float _1290 = fma(_1276, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1292 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1284);
    float _1294 = 1.0 / _1274;
    float _1296 = fma(_1276, _1290, -0.212114393711090087890625);
    float _1298 = _1264 * 0.693147182464599609375;
    float _1300 = sqrt(_1268);
    float _1302 = -_1234;
    float _1304 = fma(_1278, _1286, _1302);
    float _1306 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1288);
    float _1308 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1292);
    float2 _4329 = float2(_1220, _1282);
    float _1310 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4329, float2(0.0), isnan(_4329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4329, float2(0.0), isnan(_4329)), level(0.0)).x;
    float _1312 = fma(_1276, _1296, 1.570728778839111328125);
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1316 = _1306 * _1294;
    float _1318 = _1308 * _1294;
    float _1320 = fma(_1316, 0.5, 0.5);
    float _1322 = fma(_1318, -0.5, 0.5);
    float _1324 = _1300 * 0.636619746685028076171875;
    float3 _4361 = float3(_1320, _1322, _1314);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4361, float3(0.0), isnan(_4361)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4361, float3(0.0), isnan(_4361)), level(0.0)).x;
    float _1328 = -_1312;
    float _1330 = fma(_1324, _1328, 1.0);
    float _1332 = fma(_1304, 0.5, 0.5);
    float3 _4379 = float3(_1320, _1322, _1314);
    float4 _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4379, float3(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4379, float3(0.0), isnan(_4379)), level(0.0)).xyzw;
    float _1337 = _1335.x;
    float _1339 = _1335.y;
    float _1341 = _1335.z;
    float _1343 = _1335.w;
    float2 _4395 = float2(_1330, _1332);
    float3 _1347 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4395, float2(0.0), isnan(_4395)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4395, float2(0.0), isnan(_4395)), level(0.0)).xyz;
    float _1349 = _1347.x;
    float _1351 = _1347.y;
    float _1353 = _1347.z;
    float _1355 = in.m_53.w;
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1359 = in.m_61.x;
    float _1361 = in.m_61.y;
    float _1363 = in.m_61.z;
    float _1365 = in.m_61.w;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1371 = in.m_53.y;
    float _1373 = in.m_53.z;
    float _1375 = 1.0 / _1369;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1377;
    out.m_63.x = _532;
    out.m_63.y = _576;
    out.m_63.z = _574;
    out.m_63.w = _582;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1383 = _1381 != 0;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1387 = _606 + _1385;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1391 = _1389 != 0;
    float _1393 = in.m_59.x;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1397 = _1395 != 0;
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1403 = _1401 != 0;
    float _1405 = in.m_53.x;
    bool _1407 = _1355 > 0.5;
    float _1409 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1413 = _1411 != 0;
    out.m_65.x = _936;
    out.m_65.y = _934;
    out.m_65.z = _938;
    float _1415 = _1379 * _1375;
    float _1417 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1419 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1421 = _1371 > 0.5;
    float _1423 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1425 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1417);
    float _1427 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1419);
    float _1429 = _1421 ? _696 : _624;
    float _1431 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1423);
    float _1433 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1425);
    int _1435 = _1407 ? as_type<int>(_696) : as_type<int>(_624);
    float _1437 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1427);
    float _1439 = _1391 ? _1429 : _624;
    float _1441 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1431);
    int _1443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1445 = _1443 != 0;
    float _1447 = fma(_1415, _1387, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1449 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1451 = isnan(_606);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1457 = _1453 || _1455;
    float _1459 = float(_1457);
    float _1461 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1463 = _1445 ? as_type<float>(_1435) : _624;
    out.m_67.x = _1437;
    out.m_67.y = _1441;
    out.m_67.z = _1433;
    bool _1465 = _1373 > 0.5;
    float _1467 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1471 = _1469 != 0;
    bool _1473 = _1397;
    float _1475 = _1429;
    int _1477 = as_type<int>(_1357);
    float _1479 = _1467;
    float _1481 = _1393;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1485 = _1415;
    float _1487 = _1373;
    float _1489 = _1274;
    if (_1397)
    {
        float _1491 = _1465 ? _696 : _624;
        _810 = _1491;
    }
    float _1493 = _810;
    int _1495 = as_type<int>(_1493);
    if (_1413)
    {
        bool _1497 = _1405 > 0.5;
        _1473 = _1497;
    }
    bool _1499 = _1473;
    if (!_1413)
    {
        _1475 = _1393;
    }
    float _1501 = _1475;
    float _1503 = -_1459;
    float _1505 = _1503 + 1.0;
    bool _1507 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1509 = isnan(_606);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1521 = as_type<int>(_1505);
    float _1523 = _1501;
    if (_1471)
    {
        float _1525 = -_1393;
        float _1527 = _1525 + 1.0;
        _1477 = as_type<int>(_1527);
    }
    int _1529 = _1477;
    float _1531 = _1517 * _1505;
    if (_1403)
    {
        float _1533 = -_1393;
        float _1535 = _1533 + 1.0;
        _1521 = as_type<int>(_1535);
    }
    int _1537 = _1521;
    float _1539 = -_1517;
    float _1541 = _1539 + 1.0;
    float _1543 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1519);
    float _1545 = _1447 * _1531;
    float _1547 = fma(_1461, _1493, -0.5);
    if (_1413)
    {
        float _1549 = -_1393;
        float _1551 = _1549 + 1.0;
        _1495 = as_type<int>(_1551);
    }
    int _1553 = _1495;
    float _1555 = fma(_1463, _1467, -0.5);
    float _1557 = as_type<float>(_1553);
    if (!_1403)
    {
        _1479 = _1393;
    }
    float _1559 = _1479;
    float _1561 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1545);
    float _1563 = _1559;
    if (_1403)
    {
        float _1565 = _1465 ? as_type<float>(_1537) : _1393;
        _1563 = _1565;
    }
    float _1567 = _1563;
    float _1569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1571 = in.m_69.x;
    float _1573 = in.m_69.y;
    float _1575 = in.m_69.z;
    if (_1413)
    {
        float _1577 = _1499 ? as_type<float>(_1553) : _1393;
        _1523 = _1577;
    }
    float _1579 = _1523;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1471)
    {
        float _1583 = _1421 ? as_type<float>(_1529) : _1393;
        _1481 = _1583;
    }
    float _1585 = _1481;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1589 = _610 != 0.0;
    bool _1591 = isnan(_610);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan(0.0);
    bool _1597 = _1593 || _1595;
    float _1599 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1561);
    if (!_1383)
    {
        _1483 = _1371;
    }
    float _1601 = _1483;
    float _1603 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1587);
    bool _1605 = _608 == 0.0;
    bool _1607 = !_1597;
    bool _1609 = _1605 && _1607;
    float _1611 = _1601;
    if (_1383)
    {
        _1611 = _1405;
    }
    float _1613 = _1611;
    float _1615 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1603);
    bool _1617 = _612 == 0.0;
    bool _1619 = _1617 && _1609;
    float _1621 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1581);
    float _1623 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1625 = _1613;
    if (_1383)
    {
        _1485 = _1405;
    }
    float _1627 = _1485;
    float _1629 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1631 = _1627;
    if (!_1383)
    {
        _1631 = _1373;
    }
    float _1633 = _1631;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1637 = 0.0;
    float _1639 = _1633;
    if (!_1383)
    {
        _1637 = _1373;
    }
    float _1641 = _1637;
    float _1643 = fma(_1629, _1567, -0.5);
    float _1645 = -_1635;
    float _1647 = fma(_1623, 2.0, _1645);
    float _1649 = _1641;
    if (_1383)
    {
        _1487 = _1371;
    }
    float _1651 = _1487;
    float _1653 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1621);
    if (_1383)
    {
        _1649 = _1371;
    }
    float _1655 = _1649;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_1383)
    {
        _1557 = _1371;
    }
    float _1659 = _1557;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1663 = _1659;
    if (!_1383)
    {
        _1663 = _1405;
    }
    float _1665 = _1663;
    float _1667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1669 = _1571;
    if (_1619)
    {
        _1625 = _1571;
    }
    float _1671 = _1625;
    float _1673 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1675 = 0.0;
    float _1677 = _1671;
    float _1679 = _1673;
    if (_1619)
    {
        _1675 = _1575;
    }
    float _1681 = _1675;
    float _1683 = -_136;
    float _1685 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1647);
    float _1687 = _1681;
    if (_1619)
    {
        _1639 = _1671;
    }
    float _1689 = _1639;
    float _1691 = -_1657;
    float _1693 = fma(_1673, 2.0, _1691);
    float _1695 = _1689;
    if (!_1619)
    {
        _1677 = _1571;
    }
    float _1697 = _1677;
    float _1699 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1661);
    if (_1619)
    {
        _1679 = _1573;
    }
    float _1701 = _1679;
    float _1703 = _1701;
    if (!_1619)
    {
        float _1705 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1703 = _1705;
    }
    float _1707 = _1703;
    if (_1619)
    {
        _1669 = _1681;
    }
    float _1709 = _1669;
    float _1711 = abs(_880);
    float _1713 = log2(_1711);
    float _1715 = _1709;
    if (!_1619)
    {
        _1687 = _1575;
    }
    float _1717 = _1687;
    float _1719 = fma(_1653, _1643, _1685);
    float _1721 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1723 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1725 = _1361 * _1717;
    float _1727 = _1363 * _1697;
    float _1729 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1619)
    {
        float _1731 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1717);
        _1715 = _1731;
    }
    float _1733 = _1715;
    float _1735 = _1359 * _1573;
    float _1737 = -_1725;
    float _1739 = fma(_1363, _1573, _1737);
    float _1741 = fma(_1721, -2.0, _1729);
    float _1743 = fma(_1723, _1585, -0.5);
    float _1745 = -_136;
    float _1747 = fma(_1745, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1693);
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (!_1619)
    {
        float _1751 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1697);
        _1695 = _1751;
    }
    float _1753 = _1695;
    float _1755 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1757 = fma(_1615, _1743, _1747);
    float _1759 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1761 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1765 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1767 = exp2(_1759);
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1771 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1773 = -_1727;
    float _1775 = fma(_1359, _1717, _1773);
    float _1777 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1779 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1699);
    float _1781 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1741);
    float _1783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    out.m_71.x = _1777;
    out.m_71.y = _1761;
    out.m_71.z = _1763;
    out.m_71.w = _1771;
    float _1787 = -_1735;
    float _1789 = fma(_1361, _1697, _1787);
    float _1791 = _1775 * _1365;
    float _1793 = fma(_1765, -2.0, _1785);
    float _1795 = -_1781;
    float _1797 = fma(_1779, _1555, _1795);
    float _1799 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1543);
    float _1801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1803 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1793);
    float _1805 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1807 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1409);
    float _1809 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1811 = _880 <= 8000.0;
    bool _1813 = isnan(_880);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(8000.0);
    bool _1819 = _1815 || _1817;
    float _1821 = float(_1819);
    float _1823 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1825 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1807);
    float _1827 = _1739 * _1365;
    float _1829 = _1789 * _1365;
    float _1831 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1833 = _1719 + 0.5;
    float _1835 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = _1831 * _1783;
    float _1841 = _1805 * _1801;
    float _1843 = _1797 + 0.5;
    float _1845 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1847 = fma(_1837, -2.0, 3.0);
    float _1849 = _1837 * _1837;
    float _1851 = -_1803;
    float _1853 = fma(_1799, _1547, _1851);
    out.m_73.x = _1839;
    out.m_73.y = _1841;
    out.m_73.z = _1833;
    out.m_73.w = _1843;
    float _1855 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1857 = _1849 * _1847;
    float _1859 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1861 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1863 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1809);
    float _1865 = -_1857;
    float _1867 = _1865 + 1.0;
    float _1869 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1859);
    float _1871 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1861);
    float _1873 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1823);
    float _1875 = fma(_1867, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1857);
    float _1877 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1845);
    float _1879 = _1757 + 0.5;
    float _1881 = _1853 + 0.5;
    float _1883 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1869);
    float _1885 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1863);
    float _1887 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1871);
    float _1889 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1891 = in.m_75.x;
    float _1893 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1825);
    float _1895 = _1821 * _1875;
    float _1897 = exp2(_1889);
    float _1899 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1855);
    float _1901 = _1893 + _1274;
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1306;
    out.gl_Position.y = _1308;
    out.gl_Position.z = _1893;
    out.gl_Position.w = _1274;
    float _1905 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1877);
    float _1907 = _1901 * 0.5;
    out.m_77.x = _1879;
    out.m_77.y = _1881;
    float _1909 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1873);
    float _1911 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1899);
    out.m_79.x = _1883;
    out.m_79.y = _1885;
    out.m_79.z = _1887;
    bool _1913 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1915 = isnan(_1018);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1921 = _1917 || _1919;
    float _1923 = -_1897;
    float _1925 = _1923 + 1.0;
    out.m_81.z = _1907;
    out.m_81.w = _1274;
    float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _1909;
    out.m_83.y = _1905;
    out.m_83.z = _1911;
    float _1929 = -_1927;
    float _1931 = _1929 + 1.0;
    float _1933 = _1885;
    float _1935 = _1883;
    float _1937 = _1893;
    float _1939 = _1931;
    if (!_1921)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1941 = _1933;
    float _1943 = _1941;
    float _1945 = _1941;
    if (!_1921)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1947 = _1935;
    float _1949 = _1947;
    float _1951 = _1947;
    if (!_1921)
    {
        _1489 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1953 = _1489;
    float _1955 = _1953;
    float _1957 = _1953;
    if (!_1921)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1959 = _1937;
    float _1961 = -_1310;
    float _1963 = _1961 + 1.0;
    float _1965 = _1963 * _1903;
    float _1967 = precise::clamp(_1965, 0.0, 1.0);
    float _1969 = -_1967;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1973 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1975 = _1971 * _1891;
    float _1977 = _1927 * _1326;
    float _1979 = _1975 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1981 = _1343 * _1977;
    float _1983 = _1343 * _1931;
    out.m_85.x = _1979;
    float _1985 = _1981;
    float _1987 = _1959;
    float _1989 = _1959;
    if (!_1921)
    {
        _1939 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1991 = _1939;
    float _1993 = _1353 * _1977;
    float _1995 = fma(_1349, _1981, _1337);
    float _1997 = fma(_1351, _1981, _1339);
    float _1999 = _1991;
    float _2001 = _1991;
    if (!_1921)
    {
        _1985 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2003 = _1985;
    float _2005 = fma(_1343, _1993, _1341);
    out.m_87.x = _1995;
    out.m_87.y = _1997;
    out.m_87.z = _2005;
    out.m_87.w = _1983;
    bool _2007 = !_1921;
    float _2009 = _2003;
    float _2011 = _2003;
    if (!_2007)
    {
        bool _2013 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2015 = isnan(_1018);
        bool _2017 = _2013 || _2015;
        bool _2019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2021 = _2017 || _2019;
        if (!_2021)
        {
            float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2025 = _1018 + _2023;
            float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2029 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2027;
            float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2035 = 1.0 / _2029;
            float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2053 = _2025 * _2035;
            float _2055 = precise::clamp(_2053, 0.0, 1.0);
            float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2061 = fma(_2055, _2033, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2063 = fma(_2055, _2059, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2065 = fma(_2055, _2039, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2067 = fma(_2055, _2043, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2069 = fma(_2055, _2047, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2071 = fma(_2055, _2051, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1951 = _2065;
            _2011 = _2069;
            _1945 = _2061;
            _1989 = _2067;
            _1957 = _2063;
            _2001 = _2071;
            _2073 = true;
        }
        else
        {
            bool _2075 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2077 = isnan(_1018);
            bool _2079 = _2075 || _2077;
            bool _2081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2083 = _2079 || _2081;
            if (!_2083)
            {
                _1943 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2085 = _1943;
            _1945 = _2085;
            if (!_2083)
            {
                _1949 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2087 = _1949;
            _1951 = _2087;
            if (!_2083)
            {
                _1955 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2089 = _1955;
            _1957 = _2089;
            if (!_2083)
            {
                _1987 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2091 = _1987;
            _1989 = _2091;
            if (!_2083)
            {
                _2009 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2093 = _2009;
            _2011 = _2093;
            if (!_2083)
            {
                _1999 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2095 = _1999;
            bool _2097 = !_2083;
            _2001 = _2095;
            if (!_2097)
            {
                bool _2099 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2101 = isnan(_1018);
                bool _2103 = _2099 || _2101;
                bool _2105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2107 = _2103 || _2105;
                if (!_2107)
                {
                    float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2111 = _1018 + _2109;
                    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2115 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2113;
                    float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2121 = 1.0 / _2115;
                    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2125 = _2123 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2137 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2139 = _2111 * _2121;
                    float _2141 = precise::clamp(_2139, 0.0, 1.0);
                    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2147 = fma(_2141, _2119, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2149 = fma(_2141, _2145, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2151 = fma(_2141, _2125, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2153 = fma(_2141, _2129, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2155 = fma(_2141, _2133, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2157 = fma(_2141, _2137, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1951 = _2151;
                    _2011 = _2155;
                    _1945 = _2147;
                    _1989 = _2153;
                    _1957 = _2149;
                    _2001 = _2157;
                    _2073 = true;
                }
                else
                {
                    _1951 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2011 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1945 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1989 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1957 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2001 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2073 = false;
    float _2159 = _1951;
    float _2161 = _2011;
    float _2163 = _1945;
    float _2165 = _1989;
    float _2167 = _1957;
    float _2169 = _2001;
    float _2171 = fma(_1905, -0.5, 0.5);
    float _2173 = precise::clamp(_2171, 0.0, 1.0);
    float _2175 = -_2159;
    float _2177 = _2175 + _2161;
    float _2179 = _1973 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2181 = -_2163;
    float _2183 = _2181 + _2165;
    float _2185 = fma(_2173, _2177, _2159);
    out.m_89.x = 0.0;
    float _2187 = -_2167;
    float _2189 = _2187 + _2169;
    float _2191 = fma(_2173, _2183, _2163);
    float _2193 = _2185 * 0.586610972881317138671875;
    out.m_49.x = _2179;
    bool _2195 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2197 = fma(_2173, _2189, _2167);
    float _2199 = fma(_2191, 0.298911988735198974609375, _2193);
    bool _2201 = _994 > 0.0;
    bool _2203 = isnan(_994);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(0.0);
    bool _2209 = _2205 || _2207;
    float _2211 = fma(_2197, 0.114477999508380889892578125, _2199);
    float _2213 = -_2211;
    float _2215 = _2191 + _2213;
    float _2217 = -_2211;
    float _2219 = _2185 + _2217;
    float _2221 = -_2211;
    float _2223 = _2197 + _2221;
    float _2225 = fma(_2215, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2211);
    float _2227 = fma(_2219, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2211);
    float _2229 = fma(_2223, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2211);
    bool _2231 = !_2195;
    if (!_2231)
    {
        float _2233 = -_934;
        float _2235 = _2233 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2237 = -_936;
        float _2239 = _2237 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2241 = -_938;
        float _2243 = _2241 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2245 = _2235 * _2235;
        float _2247 = fma(_2239, _2239, _2245);
        float _2249 = fma(_2243, _2243, _2247);
        float _2251 = sqrt(_2249);
        float _2253 = rsqrt(_2249);
        float _2255 = -_2251;
        float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2259 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2261 = precise::clamp(_2259, 0.0, 1.0);
        float _2263 = _2239 * _2253;
        float _2265 = _2235 * _2253;
        float _2267 = abs(_2261);
        float _2269 = log2(_2267);
        float _2271 = _2243 * _2253;
        float _2273 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2275 = _1905 * _2265;
        float _2277 = -_2265;
        float _2279 = -_2273;
        float _2281 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2279);
        float _2283 = fma(_1909, _2263, _2275);
        float _2285 = -_2271;
        float _2287 = fma(_2285, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2281);
        float _2289 = fma(_1911, _2271, _2283);
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2295 = _2287 + _2293;
        float _2297 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2299 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = exp2(_2297);
        float _2305 = _2303 * _2301;
        float _2307 = _2291 * _2305;
        float _2309 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2311 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2313 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2309;
        out.m_89.y = _2311;
        out.m_89.z = _2313;
    }
    out.m_91.x = _2225;
    out.m_91.y = _2227;
    out.m_91.z = _2229;
    if (_2209)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2315 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2315;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2073 = false;
    bool _604 = false;
    bool _456 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2373 = as_type<float>(_126);
        out.gl_Position.z = _2373;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_51.w;
    float _132 = float(_110);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    if (_152)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _118;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _128 = as_type<int>(_156);
    }
    int _158 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2436 = as_type<float>(_158);
        out.gl_Position.z = _2436;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = 1.0 / _132;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _136 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_53.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _188 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = _188 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = 1.0 / _212;
    bool _220 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _222 = isnan(_188);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = 1.0 / _208;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _188 + _234;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _216;
    float _242 = _192 * _218;
    float _244 = 1.0 / _204;
    float _246 = _236 * _232;
    bool _248 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _250 = isnan(_188);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    bool _260 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _262 = isnan(_188);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_258;
    float _274 = _272 + 1.0;
    float _276 = _196 * _240;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _282;
    float _286 = _270 * _274;
    float _288 = -_270;
    float _290 = _288 + 1.0;
    float _292 = fma(_280, _242, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_284, _242, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _296 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _298 = isnan(_188);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = _200 * _244;
    bool _310 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_188);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _330 = fma(_324, _242, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _332 = -_320;
    float _334 = _332 + 1.0;
    float _336 = _320 * _290;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = _230 * _334;
    float _348 = -_230;
    float _350 = _348 + 1.0;
    float _352 = fma(_328, _276, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _354 = fma(_340, _276, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_344, _276, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = _306 * _350;
    float _360 = -_306;
    float _362 = _360 + 1.0;
    float _364 = _292 * _358;
    float _366 = _294 * _358;
    float _368 = _330 * _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _370;
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _378 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_352, _346, _374);
    float _390 = fma(_354, _346, _376);
    float _392 = fma(_356, _346, _378);
    float _394 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _396 = fma(_382, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_386, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _412 = fma(_394, _336, _388);
    float _414 = fma(_402, _246, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _416 = fma(_406, _246, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _418 = fma(_410, _246, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _420 = fma(_396, _336, _390);
    float _422 = fma(_398, _336, _392);
    float _424 = fma(_414, _286, _412);
    float _426 = fma(_416, _286, _420);
    float _428 = fma(_418, _286, _422);
    float _430 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[147].x, _424);
    float _432 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[147].y, _426);
    float _434 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[147].z, _428);
    bool _436 = !_238;
    float _454;
    if (!_436)
    {
        float _438 = in.m_53.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        _454 = _164;
    }
    _456 = false;
    float _458 = _454;
    float _460 = in.m_55.x;
    float _462 = in.m_55.y;
    float _464 = in.m_55.z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _458 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_458);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_458);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_458);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _526 = 1.0 / _488;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _432 * _462;
    float _536 = -_516;
    float _538 = _536 + 1.0;
    float _540 = _504 * _518;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = _500 * _522;
    float _548 = -_500;
    float _550 = _548 + 1.0;
    float _552 = fma(_540, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _554 = _434 * _464;
    float _556 = _484 * _538;
    float _558 = _552 * _546;
    float _560 = _544 * _526;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _458 + _562;
    float _566 = _430 * _460;
    float _568 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[115].x, _558);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = fma(_560, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _574 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = fma(_572, _556, _568);
    float _580 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _578);
    float _582 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _584 = !_524;
    float _602;
    if (!_584)
    {
        float _586 = in.m_53.x;
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _590 = _586 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _594 = _592 * _588;
        float _596 = floor(_594);
        float _598 = -_596;
        float _600 = _594 + _598;
        _602 = _600;
        _604 = true;
    }
    else
    {
        _602 = _164;
    }
    _604 = false;
    float _606 = _602;
    float _608 = in.m_57.x;
    float _610 = in.m_57.y;
    float _612 = in.m_57.z;
    float _614 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _616 = in.m_46.x;
    float _618 = in.m_46.y;
    float _620 = in.m_46.z;
    float _622 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _624 = in.m_59.y;
    float _626 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _628 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _622);
    float _630 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _632 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _634 = isnan(0.5);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _640 = _636 || _638;
    float _642 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _628);
    bool _644 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _646 = isnan(0.5);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _652 = _648 || _650;
    float _654 = rsqrt(_642);
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _610);
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _608);
    float _660 = _656 * _614;
    float _662 = _658 * _626;
    float _664 = _618 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _666 = _618 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _668 = _618 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _672 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[4].x, _664);
    float _674 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[5].x, _666);
    float _676 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    float _678 = _670 * _630;
    float _680 = _660 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _682 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].z, _672);
    float _684 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].z, _674);
    float _686 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].z, _676);
    float _688 = _660 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _690 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _680);
    float _692 = _654 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _694 = -_624;
    float _696 = _694 + 1.0;
    float _698 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _688);
    float _700 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[26].z, _690);
    float _702 = _692 * _692;
    float _704 = _686 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _706 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[24].z, _698);
    float _708 = _700 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _710 = -_702;
    float _712 = fma(_710, _702, 1.0);
    float _714 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _716 = _684 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _718 = _706 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _720 = _704 + _708;
    float _722 = _696 * _712;
    float _724 = _716 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _726 = _714 + _718;
    float _728 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _730 = _720 + _728;
    float _732 = _722 * 0.800000011920928955078125;
    float _734 = _164 + 0.20000000298023223876953125;
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[11].x, _724);
    float _738 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _740 = _726 + _738;
    float _742 = _730 * _732;
    float _744 = _660 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _746 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[11].z, _736);
    float _748 = _740 * _732;
    float _750 = fma(_742, _734, _720);
    float _752 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _744);
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _756 = fma(_748, _734, _726);
    float _758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _760 = _750 + _758;
    float _762 = _716 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _764 = 1.0 / _754;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _768 = _756 + _766;
    float _770 = _760 * _760;
    float _772 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[10].x, _762);
    float _774 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[25].z, _752);
    float _776 = fma(_768, _768, _770);
    float _778 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[10].z, _772);
    float _780 = _774 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _782 = sqrt(_776);
    float _784 = _778 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _786 = _716 + _780;
    float _788 = _784 + _754;
    float _790 = _788 * _764;
    float _792 = _790 * 0.5;
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _796 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _794);
    bool _798 = _782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _800 = 1.0 / _796;
    float _802 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _804 = _774;
    float _806 = _780;
    float _808 = _786;
    float _810 = _624;
    if (!_798)
    {
        _802 = _756;
    }
    float _812 = _802;
    float _814 = _812;
    if (!_798)
    {
        _804 = _750;
    }
    float _816 = _804;
    float _818 = _816;
    if (!_798)
    {
        _806 = _786;
    }
    float _820 = _806;
    bool _822 = !_798;
    float _824 = _820;
    if (!_822)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _830 = _782 + _828;
        float _832 = _786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _834 = rsqrt(_776);
        float _836 = _830 * _826;
        float _838 = _836 * 0.15915493667125701904296875;
        float _840 = _838 * 6.283185482025146484375;
        float _842 = cos(_840);
        float _844 = _838 * 6.283185482025146484375;
        float _846 = sin(_844);
        float _848 = _842 + (-1.0);
        float _850 = _848 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = fma(_846, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _854 = fma(_786, _842, _850);
        float _856 = _834 * _852;
        float _858 = fma(_768, _856, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _860 = fma(_760, _856, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _824 = _854;
        _814 = _858;
        _818 = _860;
    }
    float _862 = _824;
    float _864 = _814;
    float _866 = _818;
    float _868 = 0.0;
    float _870 = _862;
    float _872 = _864;
    float _874 = _866;
    if (_652)
    {
        _868 = 1.0;
    }
    float _876 = _868;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _880 = _800 * _878;
    float _882 = _876;
    if (!_640)
    {
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _886 = _716 + _884;
        float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _890 = _714 + _888;
        float _892 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _894 = -_716;
        float _896 = _894 + _862;
        float _898 = _886 * _886;
        float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _902 = _704 + _900;
        float _904 = -_714;
        float _906 = _904 + _864;
        float _908 = fma(_890, _890, _898);
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _912 = fma(_902, _902, _908);
        float _914 = sqrt(_912);
        float _916 = _892 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _918 = precise::min(_914, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _920 = _918 * _910;
        float _922 = _916 * _920;
        float _924 = -_704;
        float _926 = _924 + _866;
        float _928 = fma(_896, _922, _716);
        float _930 = fma(_906, _922, _714);
        float _932 = fma(_926, _922, _704);
        _870 = _928;
        _872 = _930;
        _874 = _932;
        _808 = _892;
    }
    float _934 = _870;
    float _936 = _872;
    float _938 = _874;
    float _940 = _808;
    float _942 = _940;
    if (!_652)
    {
        float _944 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _946 = _944 * 0.15915493667125701904296875;
        float _948 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _950 = _946 * 6.283185482025146484375;
        float _952 = cos(_950);
        float _954 = _948 * 0.15915493667125701904296875;
        float _956 = _946 * 6.283185482025146484375;
        float _958 = sin(_956);
        float _960 = 1.0 / _952;
        float _962 = _954 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _958 * _960;
        float _968 = _954 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _964 * _966;
        float _974 = 1.0 / _972;
        float _976 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _978 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _976;
        float _980 = 1.0 / _978;
        float _982 = _970 * _974;
        float _984 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _986 = fma(_880, _982, _984);
        float _988 = _986 * _980;
        float _990 = precise::clamp(_988, 0.0, 1.0);
        _942 = _980;
        _882 = _990;
    }
    float _992 = _942;
    float _994 = _882;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _998 = _934 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1002 = _936 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1006 = _938 + _1004;
    float _1008 = _998 * _998;
    float _1010 = fma(_1002, _1002, _1008);
    float _1012 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1014 = fma(_1006, _1006, _1010);
    float _1016 = rsqrt(_1014);
    float _1018 = sqrt(_1014);
    float _1020 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1022 = _1002 * _1020;
    float _1024 = _1006 * _1020;
    float _1026 = _1022 * _1022;
    float _1028 = _1024 * _1024;
    float _1030 = _1026 + _1028;
    float _1032 = sqrt(_1030);
    bool _1034 = _1032 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1038 = _1032 + _1036;
    float _1040 = _1016;
    float _1042 = _1030;
    float _1044 = _1038;
    float _1046 = _992;
    float _1048 = _998;
    float _1050 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1052 = _1020;
    if (_1034)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1054;
    }
    float _1056 = _1040;
    if (_1034)
    {
        float _1058 = rsqrt(_1030);
        _1042 = _1058;
    }
    float _1060 = _1042;
    float _1062 = _1060;
    if (_1034)
    {
        float _1064 = _1038 * _1056;
        _1044 = _1064;
    }
    float _1066 = _1044;
    if (_1034)
    {
        float _1068 = _1066 * 0.15915493667125701904296875;
        _1046 = _1068;
    }
    float _1070 = _1046;
    float _1072 = _1056;
    float _1074 = _1070;
    if (_1034)
    {
        float _1076 = _1070 * 6.283185482025146484375;
        float _1078 = sin(_1076);
        _1072 = _1078;
    }
    float _1080 = _1072;
    float _1082 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1084 = precise::max(0.0, _1082);
    float _1086 = _1006;
    float _1088 = _1084;
    if (_1034)
    {
        float _1090 = _1070 * 6.283185482025146484375;
        float _1092 = cos(_1090);
        _1086 = _1092;
    }
    float _1094 = _1086;
    float _1096 = -_1020;
    float _1098 = -_1084;
    float _1100 = fma(_998, _1096, _1098);
    if (!_1034)
    {
        _1048 = _1024;
    }
    float _1102 = _1048;
    float _1104 = _1102;
    if (_1034)
    {
        float _1106 = _1100 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1106;
    }
    float _1108 = _1088;
    float _1110 = _1108;
    if (!_1034)
    {
        _1074 = _1022;
    }
    float _1112 = _1074;
    float _1114 = _1080;
    float _1116 = _1112;
    if (_1034)
    {
        float _1118 = fma(_1080, _1108, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1114 = _1118;
    }
    float _1120 = _1114;
    float _1122 = _1120;
    if (_1034)
    {
        float _1124 = _1094 + (-1.0);
        _1110 = _1124;
    }
    float _1126 = _1110;
    float _1128 = _1126;
    if (_1034)
    {
        float _1130 = _1060 * _1120;
        _1050 = _1130;
    }
    float _1132 = _1050;
    if (!_1034)
    {
        _1122 = _1100;
    }
    float _1134 = _1122;
    float _1136 = _1134;
    if (_1034)
    {
        float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1052 = _1138;
    }
    float _1140 = _1052;
    if (_1034)
    {
        float _1142 = _1022 * _1132;
        _1116 = _1142;
    }
    float _1144 = _1116;
    if (!_1034)
    {
        _1128 = _1026;
    }
    float _1146 = _1128;
    float _1148 = _1146;
    if (_1034)
    {
        float _1150 = _1024 * _1132;
        _1104 = _1150;
    }
    float _1152 = _1104;
    if (_1034)
    {
        float _1154 = fma(_1100, _1094, _1140);
        _1136 = _1154;
    }
    float _1156 = _1136;
    if (_1034)
    {
        float _1158 = _1144 * _1144;
        _1148 = _1158;
    }
    float _1160 = _1148;
    float _1162 = _934 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1034)
    {
        _1062 = _1028;
    }
    float _1164 = _1062;
    float _1166 = _1164;
    if (_1034)
    {
        float _1168 = _1152 * _1152;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = fma(_1156, _1156, _1160);
    float _1174 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1176 = floor(_1012);
    float _1178 = _1172 + _1170;
    float _1180 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1174);
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1184 = fma(_1018, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1182);
    float _1186 = precise::clamp(_1184, 0.0, 1.0);
    float _1188 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1190 = rsqrt(_1178);
    float _1192 = -_1186;
    float _1194 = _1192 + 1.0;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1200 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1202 = _934 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1204 = -_1198;
    float _1206 = fma(_1204, _1196, 1.0);
    float _1208 = abs(_1194);
    float _1210 = log2(_1208);
    float _1212 = _934 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1214 = _934 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1216 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1202);
    float _1218 = -_1176;
    float _1220 = _1012 + _1218;
    float _1222 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1212);
    float _1224 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1214);
    float _1226 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1216);
    float _1228 = _1190 * _1144;
    float _1230 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1222);
    float _1232 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1224);
    float _1234 = _1190 * _1156;
    float _1236 = _1190 * _1152;
    float _1238 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1240 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1242 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1244 = floor(_1200);
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1248 = -_1240;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1248);
    float _1252 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1254 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1256 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1246);
    float _1258 = -_1236;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1250);
    float _1262 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1264 = log2(_1206);
    float _1266 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1256);
    float _1268 = fma(_1260, -0.5, 0.5);
    float _1270 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1272 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1262);
    float _1274 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1266);
    float _1276 = fma(_1260, 0.5, 0.5);
    float _1278 = exp2(_1252);
    float _1280 = -_1244;
    float _1282 = _1200 + _1280;
    float _1284 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1270);
    float _1286 = _1234 + 1.0;
    float _1288 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1272);
    float _1290 = fma(_1276, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1292 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1284);
    float _1294 = 1.0 / _1274;
    float _1296 = fma(_1276, _1290, -0.212114393711090087890625);
    float _1298 = _1264 * 0.693147182464599609375;
    float _1300 = sqrt(_1268);
    float _1302 = -_1234;
    float _1304 = fma(_1278, _1286, _1302);
    float _1306 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1288);
    float _1308 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1292);
    float2 _4329 = float2(_1220, _1282);
    float _1310 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4329, float2(0.0), isnan(_4329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4329, float2(0.0), isnan(_4329)), level(0.0)).x;
    float _1312 = fma(_1276, _1296, 1.570728778839111328125);
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1316 = _1306 * _1294;
    float _1318 = _1308 * _1294;
    float _1320 = fma(_1316, 0.5, 0.5);
    float _1322 = fma(_1318, -0.5, 0.5);
    float _1324 = _1300 * 0.636619746685028076171875;
    float3 _4361 = float3(_1320, _1322, _1314);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4361, float3(0.0), isnan(_4361)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4361, float3(0.0), isnan(_4361)), level(0.0)).x;
    float _1328 = -_1312;
    float _1330 = fma(_1324, _1328, 1.0);
    float _1332 = fma(_1304, 0.5, 0.5);
    float3 _4379 = float3(_1320, _1322, _1314);
    float4 _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4379, float3(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4379, float3(0.0), isnan(_4379)), level(0.0)).xyzw;
    float _1337 = _1335.x;
    float _1339 = _1335.y;
    float _1341 = _1335.z;
    float _1343 = _1335.w;
    float2 _4395 = float2(_1330, _1332);
    float3 _1347 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4395, float2(0.0), isnan(_4395)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4395, float2(0.0), isnan(_4395)), level(0.0)).xyz;
    float _1349 = _1347.x;
    float _1351 = _1347.y;
    float _1353 = _1347.z;
    float _1355 = in.m_53.w;
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1359 = in.m_61.x;
    float _1361 = in.m_61.y;
    float _1363 = in.m_61.z;
    float _1365 = in.m_61.w;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1371 = in.m_53.y;
    float _1373 = in.m_53.z;
    float _1375 = 1.0 / _1369;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1377;
    out.m_63.x = _532;
    out.m_63.y = _576;
    out.m_63.z = _574;
    out.m_63.w = _582;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1383 = _1381 != 0;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1387 = _606 + _1385;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1391 = _1389 != 0;
    float _1393 = in.m_59.x;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1397 = _1395 != 0;
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1403 = _1401 != 0;
    float _1405 = in.m_53.x;
    bool _1407 = _1355 > 0.5;
    float _1409 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1413 = _1411 != 0;
    out.m_65.x = _936;
    out.m_65.y = _934;
    out.m_65.z = _938;
    float _1415 = _1379 * _1375;
    float _1417 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1419 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1421 = _1371 > 0.5;
    float _1423 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1425 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1417);
    float _1427 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1419);
    float _1429 = _1421 ? _696 : _624;
    float _1431 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1423);
    float _1433 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1425);
    int _1435 = _1407 ? as_type<int>(_696) : as_type<int>(_624);
    float _1437 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1427);
    float _1439 = _1391 ? _1429 : _624;
    float _1441 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1431);
    int _1443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1445 = _1443 != 0;
    float _1447 = fma(_1415, _1387, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1449 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1451 = isnan(_606);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1457 = _1453 || _1455;
    float _1459 = float(_1457);
    float _1461 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1463 = _1445 ? as_type<float>(_1435) : _624;
    out.m_67.x = _1437;
    out.m_67.y = _1441;
    out.m_67.z = _1433;
    bool _1465 = _1373 > 0.5;
    float _1467 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1471 = _1469 != 0;
    bool _1473 = _1397;
    float _1475 = _1429;
    int _1477 = as_type<int>(_1357);
    float _1479 = _1467;
    float _1481 = _1393;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1485 = _1415;
    float _1487 = _1373;
    float _1489 = _1274;
    if (_1397)
    {
        float _1491 = _1465 ? _696 : _624;
        _810 = _1491;
    }
    float _1493 = _810;
    int _1495 = as_type<int>(_1493);
    if (_1413)
    {
        bool _1497 = _1405 > 0.5;
        _1473 = _1497;
    }
    bool _1499 = _1473;
    if (!_1413)
    {
        _1475 = _1393;
    }
    float _1501 = _1475;
    float _1503 = -_1459;
    float _1505 = _1503 + 1.0;
    bool _1507 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1509 = isnan(_606);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1521 = as_type<int>(_1505);
    float _1523 = _1501;
    if (_1471)
    {
        float _1525 = -_1393;
        float _1527 = _1525 + 1.0;
        _1477 = as_type<int>(_1527);
    }
    int _1529 = _1477;
    float _1531 = _1517 * _1505;
    if (_1403)
    {
        float _1533 = -_1393;
        float _1535 = _1533 + 1.0;
        _1521 = as_type<int>(_1535);
    }
    int _1537 = _1521;
    float _1539 = -_1517;
    float _1541 = _1539 + 1.0;
    float _1543 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1519);
    float _1545 = _1447 * _1531;
    float _1547 = fma(_1461, _1493, -0.5);
    if (_1413)
    {
        float _1549 = -_1393;
        float _1551 = _1549 + 1.0;
        _1495 = as_type<int>(_1551);
    }
    int _1553 = _1495;
    float _1555 = fma(_1463, _1467, -0.5);
    float _1557 = as_type<float>(_1553);
    if (!_1403)
    {
        _1479 = _1393;
    }
    float _1559 = _1479;
    float _1561 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1545);
    float _1563 = _1559;
    if (_1403)
    {
        float _1565 = _1465 ? as_type<float>(_1537) : _1393;
        _1563 = _1565;
    }
    float _1567 = _1563;
    float _1569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1571 = in.m_69.x;
    float _1573 = in.m_69.y;
    float _1575 = in.m_69.z;
    if (_1413)
    {
        float _1577 = _1499 ? as_type<float>(_1553) : _1393;
        _1523 = _1577;
    }
    float _1579 = _1523;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1471)
    {
        float _1583 = _1421 ? as_type<float>(_1529) : _1393;
        _1481 = _1583;
    }
    float _1585 = _1481;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1589 = _610 != 0.0;
    bool _1591 = isnan(_610);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan(0.0);
    bool _1597 = _1593 || _1595;
    float _1599 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1561);
    if (!_1383)
    {
        _1483 = _1371;
    }
    float _1601 = _1483;
    float _1603 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1587);
    bool _1605 = _608 == 0.0;
    bool _1607 = !_1597;
    bool _1609 = _1605 && _1607;
    float _1611 = _1601;
    if (_1383)
    {
        _1611 = _1405;
    }
    float _1613 = _1611;
    float _1615 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1603);
    bool _1617 = _612 == 0.0;
    bool _1619 = _1617 && _1609;
    float _1621 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1581);
    float _1623 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1625 = _1613;
    if (_1383)
    {
        _1485 = _1405;
    }
    float _1627 = _1485;
    float _1629 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1631 = _1627;
    if (!_1383)
    {
        _1631 = _1373;
    }
    float _1633 = _1631;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1637 = 0.0;
    float _1639 = _1633;
    if (!_1383)
    {
        _1637 = _1373;
    }
    float _1641 = _1637;
    float _1643 = fma(_1629, _1567, -0.5);
    float _1645 = -_1635;
    float _1647 = fma(_1623, 2.0, _1645);
    float _1649 = _1641;
    if (_1383)
    {
        _1487 = _1371;
    }
    float _1651 = _1487;
    float _1653 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1621);
    if (_1383)
    {
        _1649 = _1371;
    }
    float _1655 = _1649;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_1383)
    {
        _1557 = _1371;
    }
    float _1659 = _1557;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1663 = _1659;
    if (!_1383)
    {
        _1663 = _1405;
    }
    float _1665 = _1663;
    float _1667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1669 = _1571;
    if (_1619)
    {
        _1625 = _1571;
    }
    float _1671 = _1625;
    float _1673 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1675 = 0.0;
    float _1677 = _1671;
    float _1679 = _1673;
    if (_1619)
    {
        _1675 = _1575;
    }
    float _1681 = _1675;
    float _1683 = -_136;
    float _1685 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1647);
    float _1687 = _1681;
    if (_1619)
    {
        _1639 = _1671;
    }
    float _1689 = _1639;
    float _1691 = -_1657;
    float _1693 = fma(_1673, 2.0, _1691);
    float _1695 = _1689;
    if (!_1619)
    {
        _1677 = _1571;
    }
    float _1697 = _1677;
    float _1699 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1661);
    if (_1619)
    {
        _1679 = _1573;
    }
    float _1701 = _1679;
    float _1703 = _1701;
    if (!_1619)
    {
        float _1705 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1703 = _1705;
    }
    float _1707 = _1703;
    if (_1619)
    {
        _1669 = _1681;
    }
    float _1709 = _1669;
    float _1711 = abs(_880);
    float _1713 = log2(_1711);
    float _1715 = _1709;
    if (!_1619)
    {
        _1687 = _1575;
    }
    float _1717 = _1687;
    float _1719 = fma(_1653, _1643, _1685);
    float _1721 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1723 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1725 = _1361 * _1717;
    float _1727 = _1363 * _1697;
    float _1729 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1619)
    {
        float _1731 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1717);
        _1715 = _1731;
    }
    float _1733 = _1715;
    float _1735 = _1359 * _1573;
    float _1737 = -_1725;
    float _1739 = fma(_1363, _1573, _1737);
    float _1741 = fma(_1721, -2.0, _1729);
    float _1743 = fma(_1723, _1585, -0.5);
    float _1745 = -_136;
    float _1747 = fma(_1745, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1693);
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (!_1619)
    {
        float _1751 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1697);
        _1695 = _1751;
    }
    float _1753 = _1695;
    float _1755 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1757 = fma(_1615, _1743, _1747);
    float _1759 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1761 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1765 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1767 = exp2(_1759);
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1771 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1773 = -_1727;
    float _1775 = fma(_1359, _1717, _1773);
    float _1777 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1779 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1699);
    float _1781 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1741);
    float _1783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    out.m_71.x = _1777;
    out.m_71.y = _1761;
    out.m_71.z = _1763;
    out.m_71.w = _1771;
    float _1787 = -_1735;
    float _1789 = fma(_1361, _1697, _1787);
    float _1791 = _1775 * _1365;
    float _1793 = fma(_1765, -2.0, _1785);
    float _1795 = -_1781;
    float _1797 = fma(_1779, _1555, _1795);
    float _1799 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1543);
    float _1801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1803 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1793);
    float _1805 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1807 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1409);
    float _1809 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1811 = _880 <= 8000.0;
    bool _1813 = isnan(_880);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(8000.0);
    bool _1819 = _1815 || _1817;
    float _1821 = float(_1819);
    float _1823 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1825 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1807);
    float _1827 = _1739 * _1365;
    float _1829 = _1789 * _1365;
    float _1831 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1833 = _1719 + 0.5;
    float _1835 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = _1831 * _1783;
    float _1841 = _1805 * _1801;
    float _1843 = _1797 + 0.5;
    float _1845 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1847 = fma(_1837, -2.0, 3.0);
    float _1849 = _1837 * _1837;
    float _1851 = -_1803;
    float _1853 = fma(_1799, _1547, _1851);
    out.m_73.x = _1839;
    out.m_73.y = _1841;
    out.m_73.z = _1833;
    out.m_73.w = _1843;
    float _1855 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1857 = _1849 * _1847;
    float _1859 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1861 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1863 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1809);
    float _1865 = -_1857;
    float _1867 = _1865 + 1.0;
    float _1869 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1859);
    float _1871 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1861);
    float _1873 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1823);
    float _1875 = fma(_1867, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1857);
    float _1877 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1845);
    float _1879 = _1757 + 0.5;
    float _1881 = _1853 + 0.5;
    float _1883 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1869);
    float _1885 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1863);
    float _1887 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1871);
    float _1889 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1891 = in.m_75.x;
    float _1893 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1825);
    float _1895 = _1821 * _1875;
    float _1897 = exp2(_1889);
    float _1899 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1855);
    float _1901 = _1893 + _1274;
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1306;
    out.gl_Position.y = _1308;
    out.gl_Position.z = _1893;
    out.gl_Position.w = _1274;
    float _1905 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1877);
    float _1907 = _1901 * 0.5;
    out.m_77.x = _1879;
    out.m_77.y = _1881;
    float _1909 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1873);
    float _1911 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1899);
    out.m_79.x = _1883;
    out.m_79.y = _1885;
    out.m_79.z = _1887;
    bool _1913 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1915 = isnan(_1018);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1921 = _1917 || _1919;
    float _1923 = -_1897;
    float _1925 = _1923 + 1.0;
    out.m_81.z = _1907;
    out.m_81.w = _1274;
    float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _1909;
    out.m_83.y = _1905;
    out.m_83.z = _1911;
    float _1929 = -_1927;
    float _1931 = _1929 + 1.0;
    float _1933 = _1885;
    float _1935 = _1883;
    float _1937 = _1893;
    float _1939 = _1931;
    if (!_1921)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1941 = _1933;
    float _1943 = _1941;
    float _1945 = _1941;
    if (!_1921)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1947 = _1935;
    float _1949 = _1947;
    float _1951 = _1947;
    if (!_1921)
    {
        _1489 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1953 = _1489;
    float _1955 = _1953;
    float _1957 = _1953;
    if (!_1921)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1959 = _1937;
    float _1961 = -_1310;
    float _1963 = _1961 + 1.0;
    float _1965 = _1963 * _1903;
    float _1967 = precise::clamp(_1965, 0.0, 1.0);
    float _1969 = -_1967;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1973 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1975 = _1971 * _1891;
    float _1977 = _1927 * _1326;
    float _1979 = _1975 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1981 = _1343 * _1977;
    float _1983 = _1343 * _1931;
    out.m_85.x = _1979;
    float _1985 = _1981;
    float _1987 = _1959;
    float _1989 = _1959;
    if (!_1921)
    {
        _1939 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1991 = _1939;
    float _1993 = _1353 * _1977;
    float _1995 = fma(_1349, _1981, _1337);
    float _1997 = fma(_1351, _1981, _1339);
    float _1999 = _1991;
    float _2001 = _1991;
    if (!_1921)
    {
        _1985 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2003 = _1985;
    float _2005 = fma(_1343, _1993, _1341);
    out.m_87.x = _1995;
    out.m_87.y = _1997;
    out.m_87.z = _2005;
    out.m_87.w = _1983;
    bool _2007 = !_1921;
    float _2009 = _2003;
    float _2011 = _2003;
    if (!_2007)
    {
        bool _2013 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2015 = isnan(_1018);
        bool _2017 = _2013 || _2015;
        bool _2019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2021 = _2017 || _2019;
        if (!_2021)
        {
            float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2025 = _1018 + _2023;
            float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2029 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2027;
            float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2035 = 1.0 / _2029;
            float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2053 = _2025 * _2035;
            float _2055 = precise::clamp(_2053, 0.0, 1.0);
            float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2061 = fma(_2055, _2033, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2063 = fma(_2055, _2059, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2065 = fma(_2055, _2039, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2067 = fma(_2055, _2043, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2069 = fma(_2055, _2047, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2071 = fma(_2055, _2051, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1951 = _2065;
            _2011 = _2069;
            _1945 = _2061;
            _1989 = _2067;
            _1957 = _2063;
            _2001 = _2071;
            _2073 = true;
        }
        else
        {
            bool _2075 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2077 = isnan(_1018);
            bool _2079 = _2075 || _2077;
            bool _2081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2083 = _2079 || _2081;
            if (!_2083)
            {
                _1943 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2085 = _1943;
            _1945 = _2085;
            if (!_2083)
            {
                _1949 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2087 = _1949;
            _1951 = _2087;
            if (!_2083)
            {
                _1955 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2089 = _1955;
            _1957 = _2089;
            if (!_2083)
            {
                _1987 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2091 = _1987;
            _1989 = _2091;
            if (!_2083)
            {
                _2009 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2093 = _2009;
            _2011 = _2093;
            if (!_2083)
            {
                _1999 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2095 = _1999;
            bool _2097 = !_2083;
            _2001 = _2095;
            if (!_2097)
            {
                bool _2099 = _1018 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2101 = isnan(_1018);
                bool _2103 = _2099 || _2101;
                bool _2105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2107 = _2103 || _2105;
                if (!_2107)
                {
                    float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2111 = _1018 + _2109;
                    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2115 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2113;
                    float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2121 = 1.0 / _2115;
                    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2125 = _2123 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2137 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2139 = _2111 * _2121;
                    float _2141 = precise::clamp(_2139, 0.0, 1.0);
                    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2147 = fma(_2141, _2119, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2149 = fma(_2141, _2145, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2151 = fma(_2141, _2125, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2153 = fma(_2141, _2129, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2155 = fma(_2141, _2133, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2157 = fma(_2141, _2137, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1951 = _2151;
                    _2011 = _2155;
                    _1945 = _2147;
                    _1989 = _2153;
                    _1957 = _2149;
                    _2001 = _2157;
                    _2073 = true;
                }
                else
                {
                    _1951 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2011 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1945 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1989 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1957 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2001 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2073 = false;
    float _2159 = _1951;
    float _2161 = _2011;
    float _2163 = _1945;
    float _2165 = _1989;
    float _2167 = _1957;
    float _2169 = _2001;
    float _2171 = fma(_1905, -0.5, 0.5);
    float _2173 = precise::clamp(_2171, 0.0, 1.0);
    float _2175 = -_2159;
    float _2177 = _2175 + _2161;
    float _2179 = _1973 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2181 = -_2163;
    float _2183 = _2181 + _2165;
    float _2185 = fma(_2173, _2177, _2159);
    out.m_89.x = 0.0;
    float _2187 = -_2167;
    float _2189 = _2187 + _2169;
    float _2191 = fma(_2173, _2183, _2163);
    float _2193 = _2185 * 0.586610972881317138671875;
    out.m_49.x = _2179;
    bool _2195 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2197 = fma(_2173, _2189, _2167);
    float _2199 = fma(_2191, 0.298911988735198974609375, _2193);
    bool _2201 = _994 > 0.0;
    bool _2203 = isnan(_994);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(0.0);
    bool _2209 = _2205 || _2207;
    float _2211 = fma(_2197, 0.114477999508380889892578125, _2199);
    float _2213 = -_2211;
    float _2215 = _2191 + _2213;
    float _2217 = -_2211;
    float _2219 = _2185 + _2217;
    float _2221 = -_2211;
    float _2223 = _2197 + _2221;
    float _2225 = fma(_2215, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2211);
    float _2227 = fma(_2219, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2211);
    float _2229 = fma(_2223, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2211);
    bool _2231 = !_2195;
    if (!_2231)
    {
        float _2233 = -_934;
        float _2235 = _2233 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2237 = -_936;
        float _2239 = _2237 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2241 = -_938;
        float _2243 = _2241 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2245 = _2235 * _2235;
        float _2247 = fma(_2239, _2239, _2245);
        float _2249 = fma(_2243, _2243, _2247);
        float _2251 = sqrt(_2249);
        float _2253 = rsqrt(_2249);
        float _2255 = -_2251;
        float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2259 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2261 = precise::clamp(_2259, 0.0, 1.0);
        float _2263 = _2239 * _2253;
        float _2265 = _2235 * _2253;
        float _2267 = abs(_2261);
        float _2269 = log2(_2267);
        float _2271 = _2243 * _2253;
        float _2273 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2275 = _1905 * _2265;
        float _2277 = -_2265;
        float _2279 = -_2273;
        float _2281 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2279);
        float _2283 = fma(_1909, _2263, _2275);
        float _2285 = -_2271;
        float _2287 = fma(_2285, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2281);
        float _2289 = fma(_1911, _2271, _2283);
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2295 = _2287 + _2293;
        float _2297 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2299 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = exp2(_2297);
        float _2305 = _2303 * _2301;
        float _2307 = _2291 * _2305;
        float _2309 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2311 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2313 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2309;
        out.m_89.y = _2311;
        out.m_89.z = _2313;
    }
    out.m_91.x = _2225;
    out.m_91.y = _2227;
    out.m_91.z = _2229;
    if (_2209)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2315 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2315;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

