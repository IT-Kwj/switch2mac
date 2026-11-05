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
    float4 m_61 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_63 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2650 = false;
    bool _376 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2961 = as_type<float>(_134);
        out.gl_Position.z = _2961;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3016 = as_type<float>(_160);
        out.gl_Position.z = _3016;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
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
    float _274 = 1.0 / _252;
    float _276 = _268 * _272;
    float _278 = -_268;
    float _280 = _278 + 1.0;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _282;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _256;
    float _290 = _248 * _280;
    float _292 = -_248;
    float _294 = _292 + 1.0;
    float _296 = _220 * _274;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = fma(_284, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_304, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = _236 * _288;
    float _314 = _306 * _290;
    float _316 = _308 * _290;
    float _318 = _310 * _290;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].x, _314);
    float _334 = fma(_322, _312, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_326, _312, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = fma(_330, _312, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _342 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].z, _318);
    float _344 = fma(_334, _276, _332);
    float _346 = fma(_336, _276, _340);
    float _348 = fma(_338, _276, _342);
    float _350 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].x, _344);
    float _352 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].y, _346);
    float _354 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].z, _348);
    bool _356 = !_286;
    float _374;
    if (!_356)
    {
        float _358 = in.m_57.x;
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _358 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        _374 = _172;
    }
    _376 = false;
    float _378 = _374;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _382 = _378 + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _390 = isnan(_378);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _404 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _406 = isnan(_378);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _416;
    bool _420 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _422 = isnan(_378);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = 1.0 / _386;
    float _434 = -_398;
    float _436 = _434 + 1.0;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _440 = 1.0 / _402;
    float _442 = _418 * _432;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _448 = fma(_442, _382, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _450 = _414 * _436;
    float _452 = -_430;
    float _454 = _452 + 1.0;
    float _456 = -_414;
    float _458 = _456 + 1.0;
    float _460 = _446 * _440;
    float _462 = _448 * _450;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _466 = _378 + _464;
    float _468 = _398 * _454;
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[115].x, _462);
    float _472 = fma(_460, _466, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _474 = fma(_472, _468, _470);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _480 = in.m_59.x;
    float _482 = in.m_59.y;
    float _484 = in.m_59.z;
    float _486 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[117].x, _474);
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _490 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _496 = _488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _490;
    out.m_61.y = _492;
    out.m_61.z = _496;
    out.m_61.w = _494;
    float _498 = _354 * _484;
    float _500 = _352 * _482;
    float _502 = _350 * _480;
    bool _504 = !_438;
    if (!_504)
    {
        float _506 = in.m_57.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _194 = _520;
    }
    float _522 = _194;
    float _524 = in.m_57.z;
    float _526 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _528 = log2(_526);
    float _530 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _532 = in.m_57.x;
    float _534 = in.m_57.y;
    float _536 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _538 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _540 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _542 = int(_540);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _548 = _528 * _116;
    float _550 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _552 = int(_550);
    float _554 = _524 * 2.0;
    float _556 = exp2(_548);
    float _558 = _532 * 2.0;
    float _560 = _534 * 2.0;
    float _562 = _532 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _564 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _566 = floor(_554);
    float _568 = -_544;
    float _570 = fma(_562, 2.0, _568);
    float _572 = _534 + _532;
    float _574 = fma(_564, -2.0, _546);
    float _576 = -_116;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[76].x, _570);
    float _580 = _572 + (-1.0);
    float _582 = float(_542);
    float _584 = floor(_558);
    float _586 = float(_552);
    float _588 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _590 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _574);
    float _592 = _586 * _116;
    bool _594 = _566 >= 0.0;
    bool _596 = isnan(_566);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = floor(_560);
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _608 = _606 != 0;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _616 = _614 != 0;
    int _618 = _602 ? 0 : 1;
    bool _620 = _584 > 0.0;
    float _622 = 1.0 / _582;
    bool _624 = !_612;
    int _626 = _624 ? 0 : 1;
    bool _628 = _566 > 0.0;
    float _630 = -_556;
    float _632 = _630 + 1.0;
    bool _634 = !_608;
    int _636 = _634 ? 0 : 1;
    bool _638 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    bool _648 = _584 >= 0.0;
    bool _650 = isnan(_584);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    bool _658 = _604 > 0.0;
    bool _660 = _604 >= 0.0;
    bool _662 = isnan(_604);
    bool _664 = _660 || _662;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    int _670 = ~_618;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = _622 * _116;
    int _678 = _674;
    float _680 = _590;
    if (!_628)
    {
        int _682 = ~_618;
        int _684 = _682 + 1;
        _678 = _684;
    }
    int _686 = _678;
    bool _688 = !_616;
    int _690 = _688 ? 0 : 1;
    float _692 = in.m_63.x;
    float _694 = in.m_63.y;
    float _696 = in.m_63.z;
    float _698 = _646 ? _632 : 0.0;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _712 = _710 != 0;
    float _714 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].w, _700);
    bool _716 = !_704;
    int _718 = _716 ? 0 : 1;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _722 = 1.0 + _720;
    float _724 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _714);
    float _726 = float(_686);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _730 = abs(_718);
    float _732 = 1.0 / _722;
    int _734 = _656 ? 0 : 1;
    float _736 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[78].z, _728);
    float _738 = float(_730);
    bool _740 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(1.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _736);
    bool _752 = !_708;
    int _754 = _752 ? 0 : 1;
    float _756 = _738 * _726;
    int _758 = ~_734;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    float _764 = _532 + (-0.5);
    int _766 = _762;
    if (!_620)
    {
        int _768 = ~_734;
        int _770 = _768 + 1;
        _766 = _770;
    }
    int _772 = _766;
    float _774 = _756 * (-2.0);
    int _776 = abs(_754);
    int _778 = _668 ? 0 : 1;
    float _780 = fma(_774, _692, _692);
    bool _782 = !_712;
    int _784 = _782 ? 0 : 1;
    if (_748)
    {
        float _786 = _698 * _732;
        _126 = _786;
    }
    float _788 = _126;
    float _790 = float(_772);
    float _792 = fma(_588, _774, _588);
    float _794 = float(_776);
    float _796 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[196].x, _780);
    int _798 = ~_778;
    int _800 = _798 + 1;
    int _802 = _800 + 1;
    int _804 = _802;
    if (!_658)
    {
        int _806 = ~_778;
        int _808 = _806 + 1;
        _804 = _808;
    }
    int _810 = _804;
    float _812 = _794 * _790;
    int _814 = abs(_784);
    float _816 = _534 + _524;
    float _818 = fma(_792, _788, _796);
    float _820 = float(_810);
    float _822 = _812 * (-2.0);
    float _824 = float(_814);
    float _826 = _816 + (-1.0);
    float _828 = fma(_822, _694, _694);
    float _830 = _818 * 0.15915493667125701904296875;
    float _832 = _824 * _820;
    float _834 = _534 + (-0.5);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _838 = _524 + _532;
    float _840 = _832 * (-2.0);
    float _842 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _844 = _838 + (-1.0);
    float _846 = fma(_836, _822, _836);
    float _848 = _524 + (-0.5);
    float _850 = _830 * 6.283185482025146484375;
    float _852 = sin(_850);
    float _854 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _856 = fma(_840, _696, _696);
    float _858 = fma(_846, _788, _842);
    float _860 = in.m_65.x;
    float _862 = in.m_65.y;
    float _864 = in.m_65.z;
    float _866 = fma(_854, _840, _854);
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].z, _856);
    float _870 = _830 * 6.283185482025146484375;
    float _872 = cos(_870);
    float _874 = _858 * 0.15915493667125701904296875;
    float _876 = in.m_46.x;
    float _878 = in.m_46.y;
    float _880 = in.m_46.z;
    float _882 = fma(_866, _788, _868);
    float _884 = _874 * 6.283185482025146484375;
    float _886 = sin(_884);
    float _888 = _882 * 0.15915493667125701904296875;
    float _890 = _874 * 6.283185482025146484375;
    float _892 = cos(_890);
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _862);
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _860);
    float _898 = _888 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _864);
    float _904 = _872 * _886;
    float _906 = _536 * _894;
    float _908 = _852 * _886;
    float _910 = _530 * _902;
    float _912 = _538 * _896;
    float _914 = _888 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = _872 * _892;
    float _920 = _852 * _892;
    float _922 = _872 * _900;
    float _924 = _852 * _900;
    float _926 = _892 * _900;
    float _928 = _886 * _900;
    float _930 = _922 * _906;
    float _932 = fma(_916, _918, _908);
    float _934 = -_904;
    float _936 = fma(_916, _920, _934);
    float _938 = -_920;
    float _940 = fma(_916, _904, _938);
    float _942 = -_906;
    float _944 = _916 * _942;
    float _946 = fma(_932, _912, _930);
    float _948 = _924 * _906;
    float _950 = fma(_916, _908, _918);
    float _952 = fma(_926, _912, _944);
    float _954 = fma(_940, _910, _946);
    float _956 = fma(_936, _912, _948);
    float _958 = _878 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = fma(_928, _910, _952);
    float _962 = _954 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _964 = fma(_950, _910, _956);
    float _966 = fma(_876, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _968 = _878 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _970 = _954 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _972 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].x, _962);
    float _974 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[6].z, _966);
    float _976 = fma(_876, (*spvDescriptorSet0.vp_c10)._m0[4].x, _968);
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].x, _970);
    float _980 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _984 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[4].z, _976);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _990 = _878 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _994 = _986 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _982 + _988;
    float _998 = fma(_876, (*spvDescriptorSet0.vp_c10)._m0[5].x, _990);
    float _1000 = _954 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = _992 + _994;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1006 = _996 + _1004;
    float _1008 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[5].z, _998);
    float _1010 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1002 + _1012;
    float _1016 = _1006 * _1006;
    float _1018 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1022 = fma(_1014, _1014, _1016);
    float _1024 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1026 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1030 = sqrt(_1022);
    float _1032 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1024);
    float _1034 = _1018 + _1026;
    float _1036 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1032);
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1040 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1016;
    float _1044 = _1002;
    float _1046 = _996;
    float _1048 = _1006;
    if (!_1040)
    {
        _1042 = _1002;
    }
    float _1050 = _1042;
    float _1052 = _1050;
    if (!_1040)
    {
        _1044 = _1034;
    }
    float _1054 = _1044;
    bool _1056 = !_1040;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _1030 + _1062;
        float _1066 = rsqrt(_1022);
        float _1068 = _1064 * _1060;
        float _1070 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1072 = _1068 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1034, _1076, _1084);
        float _1090 = _1066 * _1086;
        float _1092 = fma(_1014, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_1006, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1058 = _1088;
        _1052 = _1092;
        _1046 = _1094;
    }
    float _1096 = _1058;
    float _1098 = _1052;
    float _1100 = _1046;
    float _1102 = -_1018;
    float _1104 = _1102 + _1096;
    float _1106 = -_992;
    float _1108 = _1106 + _1098;
    float _1110 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1028);
    float _1112 = 1.0 / _1038;
    float _1114 = _1104 * _1104;
    float _1116 = -_982;
    float _1118 = _1116 + _1100;
    float _1120 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1110);
    bool _1122 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1124 = isnan(0.5);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1130 = _1126 || _1128;
    float _1132 = fma(_1108, _1108, _1114);
    float _1134 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1136 = fma(_1118, _1118, _1132);
    float _1138 = _1134 + _1038;
    float _1140 = sqrt(_1136);
    float _1142 = _1138 * _1112;
    float _1144 = _1142 * 0.5;
    float _1146 = _1096;
    float _1148 = _1098;
    float _1150 = _1100;
    float _1152 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1154 = _1136;
    if (_1130)
    {
        _1048 = 1.0;
    }
    float _1156 = _1048;
    float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1160 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1158);
    float _1162 = 1.0 / _1160;
    bool _1164 = _1140 > 0.0;
    float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1168 = _1162 * _1166;
    bool _1170 = !_1164;
    float _1172 = _1140;
    float _1174 = _1162;
    float _1176 = _1156;
    if (!_1170)
    {
        float _1178 = _188 * _188;
        float _1180 = rsqrt(_1136);
        float _1182 = fma(_186, _186, _1178);
        float _1184 = fma(_190, _190, _1182);
        float _1186 = sqrt(_1184);
        float _1188 = _1108 * _1180;
        float _1190 = _1104 * _1180;
        float _1192 = _1118 * _1180;
        bool _1194 = _1186 > 0.0;
        bool _1196 = !_1194;
        _1172 = _1186;
        _1174 = _1184;
        _1152 = _1192;
        if (!_1196)
        {
            float _1198 = rsqrt(_1184);
            float _1200 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1202 = _188 * _1198;
            float _1204 = _186 * _1198;
            float _1206 = _1190 * _1202;
            float _1208 = _190 * _1198;
            float _1210 = fma(_1188, _1204, _1206);
            float _1212 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1214 = fma(_1192, _1208, _1210);
            float _1216 = _1214 * _1212;
            float _1218 = fma(_186, _1216, _1098);
            float _1220 = fma(_188, _1216, _1096);
            float _1222 = fma(_190, _1216, _1100);
            _1146 = _1220;
            _1148 = _1218;
            _1150 = _1222;
            _1172 = _1212;
            _1174 = _1198;
        }
    }
    float _1224 = _1146;
    float _1226 = _1148;
    float _1228 = _1150;
    float _1230 = _1172;
    float _1232 = _1174;
    float _1234 = _1152;
    float _1236 = _1234;
    if (!_1130)
    {
        float _1238 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1240 = _1238 * 0.15915493667125701904296875;
        float _1242 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        float _1248 = _1242 * 0.15915493667125701904296875;
        float _1250 = _1240 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = 1.0 / _1246;
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1252 * _1254;
        float _1262 = _1248 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = 1.0 / _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1270;
        float _1274 = 1.0 / _1272;
        float _1276 = _1264 * _1268;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1280 = fma(_1168, _1276, _1278);
        float _1282 = _1280 * _1274;
        float _1284 = precise::clamp(_1282, 0.0, 1.0);
        _1176 = _1284;
    }
    float _1286 = _1176;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1290 = _1224 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1294 = _1226 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1298 = _1228 + _1296;
    float _1300 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1302 = _1290 * _1290;
    float _1304 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1300);
    float _1306 = fma(_1294, _1294, _1302);
    float _1308 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1304);
    float _1310 = fma(_1298, _1298, _1306);
    float _1312 = rsqrt(_1310);
    float _1314 = sqrt(_1310);
    float _1316 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1318 = _1294 * _1316;
    float _1320 = _1298 * _1316;
    float _1322 = _1318 * _1318;
    float _1324 = _1320 * _1320;
    float _1326 = _1322 + _1324;
    float _1328 = sqrt(_1326);
    bool _1330 = _1328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1328 + _1332;
    float _1336 = _1230;
    float _1338 = _1334;
    float _1340 = _1318;
    float _1342 = _1320;
    float _1344 = _1322;
    float _1346 = _1324;
    if (_1330)
    {
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1336 = _1348;
    }
    float _1350 = _1336;
    if (_1330)
    {
        float _1352 = _1334 * _1350;
        _1338 = _1352;
    }
    float _1354 = _1338;
    if (_1330)
    {
        float _1356 = _1354 * 0.15915493667125701904296875;
        _1154 = _1356;
    }
    float _1358 = _1154;
    float _1360 = _1232;
    if (_1330)
    {
        float _1362 = _1358 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        _1360 = _1364;
    }
    float _1366 = _1360;
    float _1368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1370 = precise::max(0.0, _1368);
    float _1372 = _1118;
    float _1374 = _1370;
    if (_1330)
    {
        float _1376 = _1358 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        _1372 = _1378;
    }
    float _1380 = _1372;
    float _1382 = -_1316;
    float _1384 = -_1370;
    float _1386 = fma(_1290, _1382, _1384);
    float _1388 = _1368;
    if (_1330)
    {
        float _1390 = rsqrt(_1326);
        _1388 = _1390;
    }
    float _1392 = _1388;
    if (_1330)
    {
        float _1394 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1394;
    }
    float _1396 = _1374;
    float _1398 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1400 = _1396;
    float _1402 = _1366;
    if (_1330)
    {
        float _1404 = fma(_1366, _1396, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1236 = _1404;
    }
    float _1406 = _1236;
    if (_1330)
    {
        float _1408 = _1380 + (-1.0);
        _1400 = _1408;
    }
    float _1410 = _1400;
    float _1412 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = floor(_1398);
    float _1416 = _1410;
    if (_1330)
    {
        float _1418 = _1410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1424 = _1392;
    if (_1330)
    {
        float _1426 = _1392 * _1406;
        _1402 = _1426;
    }
    float _1428 = _1402;
    if (!_1330)
    {
        _1424 = _1386;
    }
    float _1430 = _1424;
    float _1432 = _1430;
    if (_1330)
    {
        float _1434 = fma(_1386, _1380, _1420);
        _1432 = _1434;
    }
    float _1436 = _1432;
    if (_1330)
    {
        float _1438 = _1318 * _1428;
        _1340 = _1438;
    }
    float _1440 = _1340;
    if (_1330)
    {
        float _1442 = _1320 * _1428;
        _1342 = _1442;
    }
    float _1444 = _1342;
    float _1446 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1330)
    {
        float _1448 = _1440 * _1440;
        _1344 = _1448;
    }
    float _1450 = _1344;
    if (_1330)
    {
        float _1452 = _1444 * _1444;
        _1346 = _1452;
    }
    float _1454 = _1346;
    float _1456 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1458 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1460 = fma(_1436, _1436, _1450);
    float _1462 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1446);
    float _1464 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1466 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1458);
    float _1468 = _1460 + _1454;
    float _1470 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1462);
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1476 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1474);
    float _1478 = precise::clamp(_1476, 0.0, 1.0);
    float _1480 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1466);
    float _1482 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1484 = rsqrt(_1468);
    float _1486 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1488 = -_1478;
    float _1490 = _1488 + 1.0;
    float _1492 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1494 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1496 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1498 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1500 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1494);
    float _1502 = abs(_1490);
    float _1504 = log2(_1502);
    float _1506 = -_1496;
    float _1508 = fma(_1506, _1472, 1.0);
    float _1510 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1512 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1500);
    float _1514 = _1484 * _1440;
    float _1516 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1512);
    float _1518 = _1484 * _1436;
    float _1520 = _1484 * _1444;
    float _1522 = _1514 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1524 = floor(_1456);
    float _1526 = -_1522;
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1526);
    float _1530 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1532 = -_1520;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1528);
    float _1536 = -_1414;
    float _1538 = _1398 + _1536;
    float _1540 = log2(_1508);
    float _1542 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1544 = fma(_1534, -0.5, 0.5);
    float _1546 = fma(_1534, 0.5, 0.5);
    float _1548 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1542);
    float _1550 = -_1524;
    float _1552 = _1456 + _1550;
    float _1554 = exp2(_1530);
    float _1556 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1498);
    float _1558 = fma(_1546, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1560 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1548);
    float _1562 = _1518 + 1.0;
    float _1564 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1556);
    float _1566 = fma(_1546, _1558, -0.212114393711090087890625);
    float _1568 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1560);
    float _1570 = 1.0 / _1516;
    float _1572 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1564);
    float _1574 = _1540 * 0.693147182464599609375;
    float _1576 = fma(_1546, _1566, 1.570728778839111328125);
    float _1578 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1580 = sqrt(_1544);
    float _1582 = -_1518;
    float _1584 = fma(_1554, _1562, _1582);
    float2 _5277 = float2(_1538, _1552);
    float _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5277, float2(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5277, float2(0.0), isnan(_5277)), level(0.0)).x;
    float _1588 = fma(_1584, 0.5, 0.5);
    float _1590 = _1568 * _1570;
    float _1592 = _1572 * _1570;
    float _1594 = fma(_1590, 0.5, 0.5);
    float _1596 = fma(_1592, -0.5, 0.5);
    float _1598 = _1580 * 0.636619746685028076171875;
    float _1600 = -_1576;
    float _1602 = fma(_1598, _1600, 1.0);
    float3 _5308 = float3(_1594, _1596, _1578);
    float _1604 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5308, float3(0.0), isnan(_5308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5308, float3(0.0), isnan(_5308)), level(0.0)).x;
    float3 _5319 = float3(_1594, _1596, _1578);
    float4 _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5319, float3(0.0), isnan(_5319)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5319, float3(0.0), isnan(_5319)), level(0.0)).xyzw;
    float _1609 = _1607.x;
    float _1611 = _1607.y;
    float _1613 = _1607.z;
    float _1615 = _1607.w;
    float2 _5335 = float2(_1602, _1588);
    float3 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5335, float2(0.0), isnan(_5335)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5335, float2(0.0), isnan(_5335)), level(0.0)).xyz;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = float(uint(_552));
    float _1629 = trunc(_676);
    int _1631 = int(_1629);
    bool _1633 = _552 == 0;
    float _1635 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1637 = 1.0 / _1627;
    int _1639 = ~_552;
    int _1641 = _1639 + 1;
    float _1643 = float(uint(_1631));
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1647 = _522 + _1645;
    float _1649 = exp2(_1635);
    int _1651 = as_type<int>(_1637) + (-2);
    float _1653 = as_type<float>(_1651) * _1643;
    float _1655 = -_1649;
    float _1657 = _1655 + 1.0;
    float _1659 = trunc(_1653);
    float _1661 = precise::max(_1659, 0.0);
    uint _1664 = uint(_1661);
    float _1666 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1668 = _1641 * int(_1664);
    int _1670 = _1668 + _1631;
    float _1672 = float(uint(_1670));
    float _1674 = as_type<float>(_1651) * _1672;
    int _1676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1678 = _1676 != 0;
    float _1680 = trunc(_1674);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    bool _1686 = !_1678;
    float _1688 = _1686 ? 7.345489978790283203125 : 1.0;
    float _1690 = _1688 * _532;
    int _1692 = ~_552;
    int _1694 = _1692 + 1;
    float _1696 = floor(_1690);
    int _1698 = int(_1664) + int(_1684);
    float _1700 = float(_1631);
    int _1702 = ~_552;
    int _1704 = _1702 + 1;
    int _1706 = _1694 * _1698;
    int _1708 = _1706 + _1631;
    bool _1710 = _1700 >= _586;
    bool _1712 = isnan(_1700);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan(_586);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = -_1696;
    float _1724 = _1690 + _1722;
    bool _1726 = uint(_1708) >= uint(_552);
    float _1728 = trunc(_1720);
    int _1730 = int(_1728);
    float _1732 = _1724 * _586;
    bool _1734 = !_1726;
    int _1736 = _1734 ? 0 : (-1);
    int _1738 = ~_1698;
    int _1740 = _1738 + _1736;
    int _1742 = _1740 + 1;
    float _1744 = _592 * _168;
    float _1746 = trunc(_1732);
    int _1748 = int(_1746);
    int _1750 = _552 + (-1);
    int _1752 = _552 * _1742;
    int _1754 = _1752 + _1631;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1758 = _1756 != 0;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1762 = _1760 != 0;
    int _1764 = ~_1730;
    int _1766 = _1764 + 1;
    int _1768 = _1766 + 1;
    float _1770 = trunc(_1744);
    int _1772 = int(_1770);
    bool _1774 = !_1633;
    int _1776 = _1774 ? _1754 : (-1);
    int _1778 = abs(_626);
    bool _1780 = !_1758;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = _1776 * _1768;
    int _1786 = abs(_636);
    int _1788 = _1730 * _1750;
    int _1790 = _1788 + _1784;
    int _1792 = abs(_1782);
    int _1794 = _1790 * _1778;
    int _1796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1798 = _1796 != 0;
    int _1800 = abs(_690);
    int _1802 = _1772 * _1786;
    int _1804 = _1802 + _1794;
    bool _1806 = !_1798;
    int _1808 = _1806 ? 0 : 1;
    int _1810 = _1748 * _1792;
    int _1812 = _1810 + _1631;
    float _1814 = in.m_67.y;
    int _1816 = abs(_1808);
    int _1818 = _1812 * _1800;
    int _1820 = _1818 + _1804;
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1824 = _1822 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1826 = _1748 * _1816;
    int _1828 = _1826 + _1820;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1832 = _1516;
    float _1834 = _1572;
    if (_1762)
    {
        float _1836 = in.m_57.x;
        _1830 = _1836;
    }
    float _1838 = _1830;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1844 = 1.0 / _1824;
    float _1846 = float(uint(_1828));
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1852 = as_type<float>(_1651) * _1846;
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1856 = _1854 != 0;
    float _1858 = 1.0 / _1842;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1862 = _1860 != 0;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1864;
    bool _1868 = _534 > 0.5;
    float _1870 = -_1814;
    float _1872 = _1870 + 1.0;
    float _1874 = 1.0 / _1850;
    float _1876 = _1814;
    if (_1856)
    {
        float _1878 = _1868 ? _1872 : _1814;
        _1876 = _1878;
    }
    float _1880 = _1876;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1884 = _1882 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1886 = _1866 * _1844;
    float _1888 = trunc(_1852);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1894;
    float _1898 = _1884 * _1858;
    bool _1900 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1902 = isnan(_522);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1908 = _1904 || _1906;
    float _1910 = float(_1908);
    float _1912 = in.m_67.x;
    bool _1914 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1916 = isnan(_522);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1922 = _1918 || _1920;
    float _1924 = float(_1922);
    float _1926 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1928 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1930 = isnan(_522);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = _1896 * _1874;
    float _1942 = -_1910;
    float _1944 = _1942 + 1.0;
    float _1946 = -_1924;
    float _1948 = _1946 + 1.0;
    bool _1950 = _1838 > 0.5;
    bool _1952 = _1950 && _1762;
    float _1954 = -_590;
    float _1956 = fma(_724, _1926, _1954);
    float _1958 = _1924 * _1944;
    bool _1960 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1962 = isnan(_522);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1968 = _1964 || _1966;
    float _1970 = float(_1968);
    float _1972 = _1938 * _1948;
    int _1974 = _1704 * int(_1892);
    int _1976 = _1974 + _1828;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1980 = _522 + _1978;
    float _1982 = -_1938;
    float _1984 = _1982 + 1.0;
    bool _1986 = _862 != 0.0;
    bool _1988 = isnan(_862);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan(0.0);
    bool _1994 = _1990 || _1992;
    float _1996 = fma(_1940, _1647, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1998 = float(uint(_1976));
    float _2000 = fma(_1886, _1980, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2002 = _1970 * _1984;
    bool _2004 = _860 == 0.0;
    bool _2006 = !_1994;
    bool _2008 = _2004 && _2006;
    float _2010 = in.m_71.x;
    float _2012 = in.m_71.y;
    float _2014 = in.m_71.z;
    float _2016 = as_type<float>(_1651) * _1998;
    float _2018 = _2000 * _2002;
    float _2020 = float(uint(_1812));
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2024 = _522 + _2022;
    float _2026 = -_1970;
    float _2028 = _2026 + 1.0;
    float _2030 = _1912;
    if (_1762)
    {
        _680 = _1912;
    }
    float _2032 = _680;
    float _2034 = trunc(_2016);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    float _2040 = as_type<float>(_1651) * _2020;
    bool _2042 = _864 == 0.0;
    bool _2044 = _2042 && _2008;
    float _2046 = fma(_1898, _2024, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2048 = _2032;
    if (_1952)
    {
        float _2050 = -_2032;
        float _2052 = _2050 + 1.0;
        _2048 = _2052;
    }
    float _2054 = _2048;
    float _2056 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2018);
    int _2058 = ~_552;
    int _2060 = _2058 + 1;
    float _2062 = trunc(_2040);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    if (_1762)
    {
        _2030 = _2054;
    }
    float _2068 = _2030;
    float _2070 = fma(_2046, _1972, _2056);
    int _2072 = ~_552;
    int _2074 = _2072 + 1;
    float _2076 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2078 = fma(_1996, _1958, _2070);
    int _2080 = int(_1892) + int(_2038);
    float _2082 = _2012;
    float _2084 = _2010;
    float _2086 = _2014;
    if (!_2044)
    {
        float _2088 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2012);
        _2082 = _2088;
    }
    float _2090 = _2082;
    if (!_2044)
    {
        float _2092 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2010);
        _2084 = _2092;
    }
    float _2094 = _2084;
    float _2096 = fma(_750, _2076, _578);
    if (!_2044)
    {
        float _2098 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2014);
        _2086 = _2098;
    }
    float _2100 = _2086;
    float _2102 = abs(_1168);
    float _2104 = log2(_2102);
    int _2106 = _2074 * int(_2066);
    int _2108 = _2106 + _1812;
    float _2110 = _2096 + 0.5;
    int _2112 = _2060 * _2080;
    int _2114 = _2112 + _1828;
    float _2116 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2078);
    float _2118 = _922 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2120 = float(uint(_2108));
    float _2122 = _922 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2124 = uint(_2114) >= uint(_552);
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2128 = as_type<float>(_1651) * _2120;
    bool _2130 = !_2124;
    int _2132 = _2130 ? 0 : (-1);
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2136 = ~_2080;
    int _2138 = _2136 + _2132;
    int _2140 = _2138 + 1;
    float _2142 = trunc(_2128);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2150 = _1956 + 0.5;
    float _2152 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2154 = _552 * _2140;
    int _2156 = _2154 + _1828;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2160 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2110;
    out.m_73.y = _2150;
    float _2162 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2164 = exp2(_2152);
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2168 = ~_552;
    int _2170 = _2168 + 1;
    out.m_75.x = _2160;
    out.m_75.y = _2166;
    out.m_75.z = _2162;
    out.m_75.w = _2126;
    int _2172 = int(_2066) + int(_2146);
    float _2174 = _922 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2176 = !_1633;
    int _2178 = _2176 ? _2156 : (-1);
    float _2180 = -_916;
    float _2182 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2122);
    bool _2184 = _1168 <= 8000.0;
    bool _2186 = isnan(_1168);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(8000.0);
    bool _2192 = _2188 || _2190;
    float _2194 = float(_2192);
    int _2196 = _2170 * _2172;
    int _2198 = _2196 + _1812;
    int _2200 = _2178 >> 31;
    int _2202 = _2178 & 3;
    bool _2204 = _2202 != 0;
    int _2206 = _2200 & 3;
    float _2208 = fma(_2164, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2210 = precise::clamp(_2208, 0.0, 1.0);
    float _2212 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2182);
    float _2214 = -_916;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2118);
    int _2218 = _2178 + _2206;
    float _2220 = -_916;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2174);
    bool _2224 = uint(_2198) >= uint(_552);
    float _2226 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    int _2228 = _2218 >> 2;
    float _2230 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2222);
    float _2232 = _932 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2234 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2236 = _2228 << 4;
    int _2238 = _2236 + 368;
    float _2240 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2242 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2232);
    float _2244 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2234);
    uint _2246 = uint(int(uint(_2238) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    int _2254 = int(_2246) + 1;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    int _2258 = _2254 & 3;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[int(_2256)][_2258];
    float _2262 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2240);
    float _2266 = _932 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2268 = _932 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2270 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    int _2272 = _2178 & 3;
    bool _2274 = _2272 != 0;
    float _2276 = _2226 * _2090;
    int _2278 = _2238 + 8;
    uint _2280 = uint(int(uint(_2278) >> uint(2)));
    uint _2282 = uint(int(uint(int(_2280)) >> uint(2)));
    int _2284 = int(_2280) & 3;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[int(_2282)][_2284];
    int _2288 = int(_2280) + 1;
    uint _2290 = uint(int(uint(_2288) >> uint(2)));
    int _2292 = _2288 & 3;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[int(_2290)][_2292];
    int _2296 = _2204 ? 0 : 1;
    float _2298 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    bool _2300 = uint(_2272) > 1u;
    float _2302 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2268);
    bool _2304 = _2272 != 3;
    float _2306 = _2212 * _2090;
    bool _2308 = !_2224;
    int _2310 = _2308 ? 0 : (-1);
    float _2312 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2298);
    bool _2314 = uint(_2272) >= 2u;
    float _2316 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2242);
    int _2318 = ~_2296;
    int _2320 = _2318 + 1;
    int _2322 = _2320 + 1;
    float _2324 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2302);
    int _2326 = ~_2172;
    int _2328 = _2326 + _2310;
    int _2330 = _2328 + 1;
    float _2332 = _2230 * _2090;
    int _2334 = _2314 ? 0 : 1;
    float _2336 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    int _2338 = _2322;
    if (!_2300)
    {
        int _2340 = ~_2296;
        int _2342 = _2340 + 1;
        _2338 = _2342;
    }
    int _2344 = _2338;
    float _2346 = fma(_2316, _2094, _2306);
    bool _2348 = !_2274;
    int _2350 = _2348 ? 0 : 1;
    float _2352 = fma(_2312, _2094, _2276);
    int _2354 = abs(_2344);
    float _2356 = fma(_2324, _2094, _2332);
    int _2358 = ~_2334;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = fma(_2336, _2100, _2352);
    bool _2366 = _2272 != 3;
    float _2368 = in.m_77.x;
    int _2370 = _2362;
    if (_2304)
    {
        int _2372 = ~_2334;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    int _2378 = _552 * _2330;
    int _2380 = _2378 + _1812;
    float _2382 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    int _2384 = abs(_2350);
    float _2386 = -_1586;
    float _2388 = _2386 + 1.0;
    bool _2390 = !_2366;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = fma(_2382, _2100, _2346);
    int _2396 = abs(_2376);
    float _2398 = _1666 * _1604;
    int _2400 = ~_2354;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    float _2406 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    int _2408 = abs(_2392);
    float _2410 = -_1666;
    float _2412 = _2410 + 1.0;
    bool _2414 = !_1862;
    int _2416 = _2414 ? 0 : 1;
    int _2418 = _2404 * as_type<int>(_2260);
    int _2420 = ~_2384;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    float _2426 = _1516 * 0.5;
    int _2428 = _2424 * as_type<int>(_2252);
    int _2430 = _2428 + _2418;
    float _2432 = fma(_2210, -2.0, 3.0);
    int _2434 = abs(_2416);
    float _2436 = _2210 * _2210;
    float _2438 = _1625 * _2398;
    int _2440 = ~_2396;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    float _2446 = _2436 * _2432;
    int _2448 = ~_2408;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    float _2454 = fma(_2406, _2100, _2356);
    int _2456 = _2444 * as_type<int>(_2286);
    int _2458 = _2456 + _2430;
    float _2460 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2462 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2464 = isnan(_1314);
    bool _2466 = _2462 || _2464;
    bool _2468 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2470 = _2466 || _2468;
    out.m_79.x = _2394;
    out.m_79.y = _2364;
    out.m_79.z = _2454;
    int _2472 = _2452 * as_type<int>(_2294);
    int _2474 = _2472 + _2458;
    float _2476 = -_2446;
    float _2478 = _2476 + 1.0;
    int _2480 = ~_2434;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2460);
    bool _2488 = !_1633;
    int _2490 = _2488 ? _2380 : (-1);
    float _2492 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2446);
    int _2494 = _2474 * _2484;
    float _2496 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2486);
    float _2498 = _2194 * _2492;
    int _2500 = _2490 * _2434;
    int _2502 = _2500 + _2494;
    float _2504 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2496);
    float _2506 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2508 = _1568 + _1516;
    float _2510 = fma(_1572, -0.5, _2426);
    float _2512 = float(_2502);
    float _2514 = _2388 * _2506;
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    out.gl_Position.x = _1568;
    out.gl_Position.y = _1572;
    out.gl_Position.z = _2504;
    out.gl_Position.w = _1516;
    float _2518 = _2504 + _1516;
    float _2520 = _2508 * 0.5;
    float _2522 = -_2516;
    float _2524 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2512;
    float _2526 = _1615 * _2412;
    float _2528 = _2518 * 0.5;
    float _2530 = _2524 * _2368;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2534 = fma(_1615, _2438, _1613);
    out.m_83.x = _2520;
    out.m_83.y = _2510;
    out.m_83.z = _2528;
    out.m_83.w = _1516;
    float _2536 = _1615 * _2398;
    float _2538 = _2504;
    float _2540 = _2536;
    float _2542 = _2510;
    float _2544 = _2520;
    if (!_2470)
    {
        _1832 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2546 = _1832;
    out.m_85.x = _2532;
    float _2548 = fma(_1621, _2536, _1609);
    float _2550 = fma(_1623, _2536, _1611);
    float _2552 = _2546;
    float _2554 = _2546;
    if (!_2470)
    {
        _2538 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2556 = _2538;
    float _2558 = _2556;
    float _2560 = _2556;
    if (!_2470)
    {
        _1834 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2562 = _1834;
    out.m_87.x = _2548;
    out.m_87.y = _2550;
    out.m_87.z = _2534;
    out.m_87.w = _2526;
    float _2564 = _2562;
    float _2566 = _2562;
    if (!_2470)
    {
        _2540 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2568 = _2540;
    float _2570 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2572 = _2568;
    float _2574 = _2568;
    if (!_2470)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2576 = _2542;
    float _2578 = _2576;
    float _2580 = _2576;
    if (!_2470)
    {
        _2544 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2582 = _2544;
    bool _2584 = !_2470;
    float _2586 = _2582;
    float _2588 = _2582;
    if (!_2584)
    {
        bool _2590 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2592 = isnan(_1314);
        bool _2594 = _2590 || _2592;
        bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2598 = _2594 || _2596;
        if (!_2598)
        {
            float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2602 = _1314 + _2600;
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2606 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2604;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2612 = 1.0 / _2606;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2630 = _2602 * _2612;
            float _2632 = precise::clamp(_2630, 0.0, 1.0);
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2638 = fma(_2632, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2640 = fma(_2632, _2636, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2642 = fma(_2632, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2644 = fma(_2632, _2620, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2646 = fma(_2632, _2624, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2648 = fma(_2632, _2628, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2588 = _2642;
            _2566 = _2646;
            _2580 = _2638;
            _2560 = _2644;
            _2554 = _2640;
            _2574 = _2648;
            _2650 = true;
        }
        else
        {
            bool _2652 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2654 = isnan(_1314);
            bool _2656 = _2652 || _2654;
            bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2660 = _2656 || _2658;
            if (!_2660)
            {
                _2578 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2662 = _2578;
            _2580 = _2662;
            if (!_2660)
            {
                _2586 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2664 = _2586;
            _2588 = _2664;
            if (!_2660)
            {
                _2552 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2666 = _2552;
            _2554 = _2666;
            if (!_2660)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2668 = _2558;
            _2560 = _2668;
            if (!_2660)
            {
                _2564 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2670 = _2564;
            _2566 = _2670;
            if (!_2660)
            {
                _2572 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2672 = _2572;
            bool _2674 = !_2660;
            _2574 = _2672;
            if (!_2674)
            {
                bool _2676 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2678 = isnan(_1314);
                bool _2680 = _2676 || _2678;
                bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2684 = _2680 || _2682;
                if (!_2684)
                {
                    float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2688 = _1314 + _2686;
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2692 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2690;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2698 = 1.0 / _2692;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2716 = _2688 * _2698;
                    float _2718 = precise::clamp(_2716, 0.0, 1.0);
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2724 = fma(_2718, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2726 = fma(_2718, _2722, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2728 = fma(_2718, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2730 = fma(_2718, _2706, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2732 = fma(_2718, _2710, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2734 = fma(_2718, _2714, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2588 = _2728;
                    _2566 = _2732;
                    _2580 = _2724;
                    _2560 = _2730;
                    _2554 = _2726;
                    _2574 = _2734;
                    _2650 = true;
                }
                else
                {
                    _2588 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2566 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2580 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2554 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2574 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2650 = false;
    float _2736 = _2588;
    float _2738 = _2566;
    float _2740 = _2580;
    float _2742 = _2560;
    float _2744 = _2554;
    float _2746 = _2574;
    float _2748 = fma(_2364, -0.5, 0.5);
    float _2750 = precise::clamp(_2748, 0.0, 1.0);
    float _2752 = -_2736;
    float _2754 = _2752 + _2738;
    float _2756 = _2570 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2758 = -_2740;
    float _2760 = _2758 + _2742;
    float _2762 = fma(_2750, _2754, _2736);
    out.m_89.x = 0.0;
    float _2764 = -_2744;
    float _2766 = _2764 + _2746;
    float _2768 = fma(_2750, _2760, _2740);
    float _2770 = _2762 * 0.586610972881317138671875;
    out.m_53.x = _2756;
    bool _2772 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2774 = fma(_2750, _2766, _2744);
    float _2776 = fma(_2768, 0.298911988735198974609375, _2770);
    bool _2778 = _1286 > 0.0;
    bool _2780 = isnan(_1286);
    bool _2782 = _2778 || _2780;
    bool _2784 = isnan(0.0);
    bool _2786 = _2782 || _2784;
    float _2788 = fma(_2774, 0.114477999508380889892578125, _2776);
    float _2790 = -_2788;
    float _2792 = _2768 + _2790;
    float _2794 = -_2788;
    float _2796 = _2762 + _2794;
    float _2798 = -_2788;
    float _2800 = _2774 + _2798;
    float _2802 = fma(_2792, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2804 = fma(_2796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2806 = fma(_2800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    bool _2808 = !_2772;
    if (!_2808)
    {
        float _2810 = -_1224;
        float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2814 = -_1226;
        float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2818 = -_1228;
        float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2822 = _2812 * _2812;
        float _2824 = fma(_2816, _2816, _2822);
        float _2826 = fma(_2820, _2820, _2824);
        float _2828 = sqrt(_2826);
        float _2830 = rsqrt(_2826);
        float _2832 = -_2828;
        float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2836 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2838 = precise::clamp(_2836, 0.0, 1.0);
        float _2840 = _2816 * _2830;
        float _2842 = _2812 * _2830;
        float _2844 = abs(_2838);
        float _2846 = log2(_2844);
        float _2848 = _2820 * _2830;
        float _2850 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2852 = _2364 * _2842;
        float _2854 = -_2842;
        float _2856 = -_2850;
        float _2858 = fma(_2854, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2856);
        float _2860 = fma(_2394, _2840, _2852);
        float _2862 = -_2848;
        float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2858);
        float _2866 = fma(_2454, _2848, _2860);
        float _2868 = precise::clamp(_2866, 0.0, 1.0);
        float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2872 = _2864 + _2870;
        float _2874 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2876 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2878 = precise::clamp(_2876, 0.0, 1.0);
        float _2880 = exp2(_2874);
        float _2882 = _2880 * _2878;
        float _2884 = _2868 * _2882;
        float _2886 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2890 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2886;
        out.m_89.y = _2888;
        out.m_89.z = _2890;
    }
    out.m_91.x = _2802;
    out.m_91.y = _2804;
    out.m_91.z = _2806;
    if (_2786)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2892 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2892;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2650 = false;
    bool _376 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2961 = as_type<float>(_134);
        out.gl_Position.z = _2961;
    }
    if (!_120)
    {
        return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3016 = as_type<float>(_160);
        out.gl_Position.z = _3016;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
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
    float _274 = 1.0 / _252;
    float _276 = _268 * _272;
    float _278 = -_268;
    float _280 = _278 + 1.0;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _282;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _256;
    float _290 = _248 * _280;
    float _292 = -_248;
    float _294 = _292 + 1.0;
    float _296 = _220 * _274;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = fma(_284, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_304, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = _236 * _288;
    float _314 = _306 * _290;
    float _316 = _308 * _290;
    float _318 = _310 * _290;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].x, _314);
    float _334 = fma(_322, _312, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_326, _312, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = fma(_330, _312, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _342 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].z, _318);
    float _344 = fma(_334, _276, _332);
    float _346 = fma(_336, _276, _340);
    float _348 = fma(_338, _276, _342);
    float _350 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].x, _344);
    float _352 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].y, _346);
    float _354 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].z, _348);
    bool _356 = !_286;
    float _374;
    if (!_356)
    {
        float _358 = in.m_57.x;
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _358 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        _374 = _172;
    }
    _376 = false;
    float _378 = _374;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _382 = _378 + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _390 = isnan(_378);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _404 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _406 = isnan(_378);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _416;
    bool _420 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _422 = isnan(_378);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = 1.0 / _386;
    float _434 = -_398;
    float _436 = _434 + 1.0;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _440 = 1.0 / _402;
    float _442 = _418 * _432;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _448 = fma(_442, _382, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _450 = _414 * _436;
    float _452 = -_430;
    float _454 = _452 + 1.0;
    float _456 = -_414;
    float _458 = _456 + 1.0;
    float _460 = _446 * _440;
    float _462 = _448 * _450;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _466 = _378 + _464;
    float _468 = _398 * _454;
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[115].x, _462);
    float _472 = fma(_460, _466, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _474 = fma(_472, _468, _470);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _480 = in.m_59.x;
    float _482 = in.m_59.y;
    float _484 = in.m_59.z;
    float _486 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[117].x, _474);
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _490 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _496 = _488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _490;
    out.m_61.y = _492;
    out.m_61.z = _496;
    out.m_61.w = _494;
    float _498 = _354 * _484;
    float _500 = _352 * _482;
    float _502 = _350 * _480;
    bool _504 = !_438;
    if (!_504)
    {
        float _506 = in.m_57.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _194 = _520;
    }
    float _522 = _194;
    float _524 = in.m_57.z;
    float _526 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _528 = log2(_526);
    float _530 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _532 = in.m_57.x;
    float _534 = in.m_57.y;
    float _536 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _538 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _540 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _542 = int(_540);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _548 = _528 * _116;
    float _550 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _552 = int(_550);
    float _554 = _524 * 2.0;
    float _556 = exp2(_548);
    float _558 = _532 * 2.0;
    float _560 = _534 * 2.0;
    float _562 = _532 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _564 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _566 = floor(_554);
    float _568 = -_544;
    float _570 = fma(_562, 2.0, _568);
    float _572 = _534 + _532;
    float _574 = fma(_564, -2.0, _546);
    float _576 = -_116;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[76].x, _570);
    float _580 = _572 + (-1.0);
    float _582 = float(_542);
    float _584 = floor(_558);
    float _586 = float(_552);
    float _588 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _590 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _574);
    float _592 = _586 * _116;
    bool _594 = _566 >= 0.0;
    bool _596 = isnan(_566);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = floor(_560);
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _608 = _606 != 0;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _616 = _614 != 0;
    int _618 = _602 ? 0 : 1;
    bool _620 = _584 > 0.0;
    float _622 = 1.0 / _582;
    bool _624 = !_612;
    int _626 = _624 ? 0 : 1;
    bool _628 = _566 > 0.0;
    float _630 = -_556;
    float _632 = _630 + 1.0;
    bool _634 = !_608;
    int _636 = _634 ? 0 : 1;
    bool _638 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    bool _648 = _584 >= 0.0;
    bool _650 = isnan(_584);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    bool _658 = _604 > 0.0;
    bool _660 = _604 >= 0.0;
    bool _662 = isnan(_604);
    bool _664 = _660 || _662;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    int _670 = ~_618;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = _622 * _116;
    int _678 = _674;
    float _680 = _590;
    if (!_628)
    {
        int _682 = ~_618;
        int _684 = _682 + 1;
        _678 = _684;
    }
    int _686 = _678;
    bool _688 = !_616;
    int _690 = _688 ? 0 : 1;
    float _692 = in.m_63.x;
    float _694 = in.m_63.y;
    float _696 = in.m_63.z;
    float _698 = _646 ? _632 : 0.0;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _712 = _710 != 0;
    float _714 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].w, _700);
    bool _716 = !_704;
    int _718 = _716 ? 0 : 1;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _722 = 1.0 + _720;
    float _724 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _714);
    float _726 = float(_686);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _730 = abs(_718);
    float _732 = 1.0 / _722;
    int _734 = _656 ? 0 : 1;
    float _736 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[78].z, _728);
    float _738 = float(_730);
    bool _740 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(1.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _736);
    bool _752 = !_708;
    int _754 = _752 ? 0 : 1;
    float _756 = _738 * _726;
    int _758 = ~_734;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    float _764 = _532 + (-0.5);
    int _766 = _762;
    if (!_620)
    {
        int _768 = ~_734;
        int _770 = _768 + 1;
        _766 = _770;
    }
    int _772 = _766;
    float _774 = _756 * (-2.0);
    int _776 = abs(_754);
    int _778 = _668 ? 0 : 1;
    float _780 = fma(_774, _692, _692);
    bool _782 = !_712;
    int _784 = _782 ? 0 : 1;
    if (_748)
    {
        float _786 = _698 * _732;
        _126 = _786;
    }
    float _788 = _126;
    float _790 = float(_772);
    float _792 = fma(_588, _774, _588);
    float _794 = float(_776);
    float _796 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[196].x, _780);
    int _798 = ~_778;
    int _800 = _798 + 1;
    int _802 = _800 + 1;
    int _804 = _802;
    if (!_658)
    {
        int _806 = ~_778;
        int _808 = _806 + 1;
        _804 = _808;
    }
    int _810 = _804;
    float _812 = _794 * _790;
    int _814 = abs(_784);
    float _816 = _534 + _524;
    float _818 = fma(_792, _788, _796);
    float _820 = float(_810);
    float _822 = _812 * (-2.0);
    float _824 = float(_814);
    float _826 = _816 + (-1.0);
    float _828 = fma(_822, _694, _694);
    float _830 = _818 * 0.15915493667125701904296875;
    float _832 = _824 * _820;
    float _834 = _534 + (-0.5);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _838 = _524 + _532;
    float _840 = _832 * (-2.0);
    float _842 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _844 = _838 + (-1.0);
    float _846 = fma(_836, _822, _836);
    float _848 = _524 + (-0.5);
    float _850 = _830 * 6.283185482025146484375;
    float _852 = sin(_850);
    float _854 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _856 = fma(_840, _696, _696);
    float _858 = fma(_846, _788, _842);
    float _860 = in.m_65.x;
    float _862 = in.m_65.y;
    float _864 = in.m_65.z;
    float _866 = fma(_854, _840, _854);
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].z, _856);
    float _870 = _830 * 6.283185482025146484375;
    float _872 = cos(_870);
    float _874 = _858 * 0.15915493667125701904296875;
    float _876 = in.m_46.x;
    float _878 = in.m_46.y;
    float _880 = in.m_46.z;
    float _882 = fma(_866, _788, _868);
    float _884 = _874 * 6.283185482025146484375;
    float _886 = sin(_884);
    float _888 = _882 * 0.15915493667125701904296875;
    float _890 = _874 * 6.283185482025146484375;
    float _892 = cos(_890);
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _862);
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _860);
    float _898 = _888 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _864);
    float _904 = _872 * _886;
    float _906 = _536 * _894;
    float _908 = _852 * _886;
    float _910 = _530 * _902;
    float _912 = _538 * _896;
    float _914 = _888 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = _872 * _892;
    float _920 = _852 * _892;
    float _922 = _872 * _900;
    float _924 = _852 * _900;
    float _926 = _892 * _900;
    float _928 = _886 * _900;
    float _930 = _922 * _906;
    float _932 = fma(_916, _918, _908);
    float _934 = -_904;
    float _936 = fma(_916, _920, _934);
    float _938 = -_920;
    float _940 = fma(_916, _904, _938);
    float _942 = -_906;
    float _944 = _916 * _942;
    float _946 = fma(_932, _912, _930);
    float _948 = _924 * _906;
    float _950 = fma(_916, _908, _918);
    float _952 = fma(_926, _912, _944);
    float _954 = fma(_940, _910, _946);
    float _956 = fma(_936, _912, _948);
    float _958 = _878 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = fma(_928, _910, _952);
    float _962 = _954 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _964 = fma(_950, _910, _956);
    float _966 = fma(_876, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _968 = _878 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _970 = _954 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _972 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].x, _962);
    float _974 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[6].z, _966);
    float _976 = fma(_876, (*spvDescriptorSet0.vp_c10)._m0[4].x, _968);
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].x, _970);
    float _980 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _984 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[4].z, _976);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _990 = _878 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _994 = _986 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _982 + _988;
    float _998 = fma(_876, (*spvDescriptorSet0.vp_c10)._m0[5].x, _990);
    float _1000 = _954 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = _992 + _994;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1006 = _996 + _1004;
    float _1008 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[5].z, _998);
    float _1010 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1002 + _1012;
    float _1016 = _1006 * _1006;
    float _1018 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1022 = fma(_1014, _1014, _1016);
    float _1024 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1026 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1030 = sqrt(_1022);
    float _1032 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1024);
    float _1034 = _1018 + _1026;
    float _1036 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1032);
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1040 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1016;
    float _1044 = _1002;
    float _1046 = _996;
    float _1048 = _1006;
    if (!_1040)
    {
        _1042 = _1002;
    }
    float _1050 = _1042;
    float _1052 = _1050;
    if (!_1040)
    {
        _1044 = _1034;
    }
    float _1054 = _1044;
    bool _1056 = !_1040;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _1030 + _1062;
        float _1066 = rsqrt(_1022);
        float _1068 = _1064 * _1060;
        float _1070 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1072 = _1068 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1034, _1076, _1084);
        float _1090 = _1066 * _1086;
        float _1092 = fma(_1014, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_1006, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1058 = _1088;
        _1052 = _1092;
        _1046 = _1094;
    }
    float _1096 = _1058;
    float _1098 = _1052;
    float _1100 = _1046;
    float _1102 = -_1018;
    float _1104 = _1102 + _1096;
    float _1106 = -_992;
    float _1108 = _1106 + _1098;
    float _1110 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1028);
    float _1112 = 1.0 / _1038;
    float _1114 = _1104 * _1104;
    float _1116 = -_982;
    float _1118 = _1116 + _1100;
    float _1120 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1110);
    bool _1122 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1124 = isnan(0.5);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1130 = _1126 || _1128;
    float _1132 = fma(_1108, _1108, _1114);
    float _1134 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1136 = fma(_1118, _1118, _1132);
    float _1138 = _1134 + _1038;
    float _1140 = sqrt(_1136);
    float _1142 = _1138 * _1112;
    float _1144 = _1142 * 0.5;
    float _1146 = _1096;
    float _1148 = _1098;
    float _1150 = _1100;
    float _1152 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1154 = _1136;
    if (_1130)
    {
        _1048 = 1.0;
    }
    float _1156 = _1048;
    float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1160 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1158);
    float _1162 = 1.0 / _1160;
    bool _1164 = _1140 > 0.0;
    float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1168 = _1162 * _1166;
    bool _1170 = !_1164;
    float _1172 = _1140;
    float _1174 = _1162;
    float _1176 = _1156;
    if (!_1170)
    {
        float _1178 = _188 * _188;
        float _1180 = rsqrt(_1136);
        float _1182 = fma(_186, _186, _1178);
        float _1184 = fma(_190, _190, _1182);
        float _1186 = sqrt(_1184);
        float _1188 = _1108 * _1180;
        float _1190 = _1104 * _1180;
        float _1192 = _1118 * _1180;
        bool _1194 = _1186 > 0.0;
        bool _1196 = !_1194;
        _1172 = _1186;
        _1174 = _1184;
        _1152 = _1192;
        if (!_1196)
        {
            float _1198 = rsqrt(_1184);
            float _1200 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1202 = _188 * _1198;
            float _1204 = _186 * _1198;
            float _1206 = _1190 * _1202;
            float _1208 = _190 * _1198;
            float _1210 = fma(_1188, _1204, _1206);
            float _1212 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1214 = fma(_1192, _1208, _1210);
            float _1216 = _1214 * _1212;
            float _1218 = fma(_186, _1216, _1098);
            float _1220 = fma(_188, _1216, _1096);
            float _1222 = fma(_190, _1216, _1100);
            _1146 = _1220;
            _1148 = _1218;
            _1150 = _1222;
            _1172 = _1212;
            _1174 = _1198;
        }
    }
    float _1224 = _1146;
    float _1226 = _1148;
    float _1228 = _1150;
    float _1230 = _1172;
    float _1232 = _1174;
    float _1234 = _1152;
    float _1236 = _1234;
    if (!_1130)
    {
        float _1238 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1240 = _1238 * 0.15915493667125701904296875;
        float _1242 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        float _1248 = _1242 * 0.15915493667125701904296875;
        float _1250 = _1240 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = 1.0 / _1246;
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1252 * _1254;
        float _1262 = _1248 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = 1.0 / _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1270;
        float _1274 = 1.0 / _1272;
        float _1276 = _1264 * _1268;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1280 = fma(_1168, _1276, _1278);
        float _1282 = _1280 * _1274;
        float _1284 = precise::clamp(_1282, 0.0, 1.0);
        _1176 = _1284;
    }
    float _1286 = _1176;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1290 = _1224 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1294 = _1226 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1298 = _1228 + _1296;
    float _1300 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1302 = _1290 * _1290;
    float _1304 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1300);
    float _1306 = fma(_1294, _1294, _1302);
    float _1308 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1304);
    float _1310 = fma(_1298, _1298, _1306);
    float _1312 = rsqrt(_1310);
    float _1314 = sqrt(_1310);
    float _1316 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1318 = _1294 * _1316;
    float _1320 = _1298 * _1316;
    float _1322 = _1318 * _1318;
    float _1324 = _1320 * _1320;
    float _1326 = _1322 + _1324;
    float _1328 = sqrt(_1326);
    bool _1330 = _1328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1328 + _1332;
    float _1336 = _1230;
    float _1338 = _1334;
    float _1340 = _1318;
    float _1342 = _1320;
    float _1344 = _1322;
    float _1346 = _1324;
    if (_1330)
    {
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1336 = _1348;
    }
    float _1350 = _1336;
    if (_1330)
    {
        float _1352 = _1334 * _1350;
        _1338 = _1352;
    }
    float _1354 = _1338;
    if (_1330)
    {
        float _1356 = _1354 * 0.15915493667125701904296875;
        _1154 = _1356;
    }
    float _1358 = _1154;
    float _1360 = _1232;
    if (_1330)
    {
        float _1362 = _1358 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        _1360 = _1364;
    }
    float _1366 = _1360;
    float _1368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1370 = precise::max(0.0, _1368);
    float _1372 = _1118;
    float _1374 = _1370;
    if (_1330)
    {
        float _1376 = _1358 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        _1372 = _1378;
    }
    float _1380 = _1372;
    float _1382 = -_1316;
    float _1384 = -_1370;
    float _1386 = fma(_1290, _1382, _1384);
    float _1388 = _1368;
    if (_1330)
    {
        float _1390 = rsqrt(_1326);
        _1388 = _1390;
    }
    float _1392 = _1388;
    if (_1330)
    {
        float _1394 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1394;
    }
    float _1396 = _1374;
    float _1398 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1400 = _1396;
    float _1402 = _1366;
    if (_1330)
    {
        float _1404 = fma(_1366, _1396, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1236 = _1404;
    }
    float _1406 = _1236;
    if (_1330)
    {
        float _1408 = _1380 + (-1.0);
        _1400 = _1408;
    }
    float _1410 = _1400;
    float _1412 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = floor(_1398);
    float _1416 = _1410;
    if (_1330)
    {
        float _1418 = _1410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1424 = _1392;
    if (_1330)
    {
        float _1426 = _1392 * _1406;
        _1402 = _1426;
    }
    float _1428 = _1402;
    if (!_1330)
    {
        _1424 = _1386;
    }
    float _1430 = _1424;
    float _1432 = _1430;
    if (_1330)
    {
        float _1434 = fma(_1386, _1380, _1420);
        _1432 = _1434;
    }
    float _1436 = _1432;
    if (_1330)
    {
        float _1438 = _1318 * _1428;
        _1340 = _1438;
    }
    float _1440 = _1340;
    if (_1330)
    {
        float _1442 = _1320 * _1428;
        _1342 = _1442;
    }
    float _1444 = _1342;
    float _1446 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1330)
    {
        float _1448 = _1440 * _1440;
        _1344 = _1448;
    }
    float _1450 = _1344;
    if (_1330)
    {
        float _1452 = _1444 * _1444;
        _1346 = _1452;
    }
    float _1454 = _1346;
    float _1456 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1458 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1460 = fma(_1436, _1436, _1450);
    float _1462 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1446);
    float _1464 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1466 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1458);
    float _1468 = _1460 + _1454;
    float _1470 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1462);
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1476 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1474);
    float _1478 = precise::clamp(_1476, 0.0, 1.0);
    float _1480 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1466);
    float _1482 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1484 = rsqrt(_1468);
    float _1486 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1488 = -_1478;
    float _1490 = _1488 + 1.0;
    float _1492 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1494 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1496 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1498 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1500 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1494);
    float _1502 = abs(_1490);
    float _1504 = log2(_1502);
    float _1506 = -_1496;
    float _1508 = fma(_1506, _1472, 1.0);
    float _1510 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1512 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1500);
    float _1514 = _1484 * _1440;
    float _1516 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1512);
    float _1518 = _1484 * _1436;
    float _1520 = _1484 * _1444;
    float _1522 = _1514 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1524 = floor(_1456);
    float _1526 = -_1522;
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1526);
    float _1530 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1532 = -_1520;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1528);
    float _1536 = -_1414;
    float _1538 = _1398 + _1536;
    float _1540 = log2(_1508);
    float _1542 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1544 = fma(_1534, -0.5, 0.5);
    float _1546 = fma(_1534, 0.5, 0.5);
    float _1548 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1542);
    float _1550 = -_1524;
    float _1552 = _1456 + _1550;
    float _1554 = exp2(_1530);
    float _1556 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1498);
    float _1558 = fma(_1546, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1560 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1548);
    float _1562 = _1518 + 1.0;
    float _1564 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1556);
    float _1566 = fma(_1546, _1558, -0.212114393711090087890625);
    float _1568 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1560);
    float _1570 = 1.0 / _1516;
    float _1572 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1564);
    float _1574 = _1540 * 0.693147182464599609375;
    float _1576 = fma(_1546, _1566, 1.570728778839111328125);
    float _1578 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1580 = sqrt(_1544);
    float _1582 = -_1518;
    float _1584 = fma(_1554, _1562, _1582);
    float2 _5277 = float2(_1538, _1552);
    float _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5277, float2(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5277, float2(0.0), isnan(_5277)), level(0.0)).x;
    float _1588 = fma(_1584, 0.5, 0.5);
    float _1590 = _1568 * _1570;
    float _1592 = _1572 * _1570;
    float _1594 = fma(_1590, 0.5, 0.5);
    float _1596 = fma(_1592, -0.5, 0.5);
    float _1598 = _1580 * 0.636619746685028076171875;
    float _1600 = -_1576;
    float _1602 = fma(_1598, _1600, 1.0);
    float3 _5308 = float3(_1594, _1596, _1578);
    float _1604 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5308, float3(0.0), isnan(_5308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5308, float3(0.0), isnan(_5308)), level(0.0)).x;
    float3 _5319 = float3(_1594, _1596, _1578);
    float4 _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5319, float3(0.0), isnan(_5319)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5319, float3(0.0), isnan(_5319)), level(0.0)).xyzw;
    float _1609 = _1607.x;
    float _1611 = _1607.y;
    float _1613 = _1607.z;
    float _1615 = _1607.w;
    float2 _5335 = float2(_1602, _1588);
    float3 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5335, float2(0.0), isnan(_5335)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5335, float2(0.0), isnan(_5335)), level(0.0)).xyz;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = float(uint(_552));
    float _1629 = trunc(_676);
    int _1631 = int(_1629);
    bool _1633 = _552 == 0;
    float _1635 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1637 = 1.0 / _1627;
    int _1639 = ~_552;
    int _1641 = _1639 + 1;
    float _1643 = float(uint(_1631));
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1647 = _522 + _1645;
    float _1649 = exp2(_1635);
    int _1651 = as_type<int>(_1637) + (-2);
    float _1653 = as_type<float>(_1651) * _1643;
    float _1655 = -_1649;
    float _1657 = _1655 + 1.0;
    float _1659 = trunc(_1653);
    float _1661 = precise::max(_1659, 0.0);
    uint _1664 = uint(_1661);
    float _1666 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1668 = _1641 * int(_1664);
    int _1670 = _1668 + _1631;
    float _1672 = float(uint(_1670));
    float _1674 = as_type<float>(_1651) * _1672;
    int _1676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1678 = _1676 != 0;
    float _1680 = trunc(_1674);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    bool _1686 = !_1678;
    float _1688 = _1686 ? 7.345489978790283203125 : 1.0;
    float _1690 = _1688 * _532;
    int _1692 = ~_552;
    int _1694 = _1692 + 1;
    float _1696 = floor(_1690);
    int _1698 = int(_1664) + int(_1684);
    float _1700 = float(_1631);
    int _1702 = ~_552;
    int _1704 = _1702 + 1;
    int _1706 = _1694 * _1698;
    int _1708 = _1706 + _1631;
    bool _1710 = _1700 >= _586;
    bool _1712 = isnan(_1700);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan(_586);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = -_1696;
    float _1724 = _1690 + _1722;
    bool _1726 = uint(_1708) >= uint(_552);
    float _1728 = trunc(_1720);
    int _1730 = int(_1728);
    float _1732 = _1724 * _586;
    bool _1734 = !_1726;
    int _1736 = _1734 ? 0 : (-1);
    int _1738 = ~_1698;
    int _1740 = _1738 + _1736;
    int _1742 = _1740 + 1;
    float _1744 = _592 * _168;
    float _1746 = trunc(_1732);
    int _1748 = int(_1746);
    int _1750 = _552 + (-1);
    int _1752 = _552 * _1742;
    int _1754 = _1752 + _1631;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1758 = _1756 != 0;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1762 = _1760 != 0;
    int _1764 = ~_1730;
    int _1766 = _1764 + 1;
    int _1768 = _1766 + 1;
    float _1770 = trunc(_1744);
    int _1772 = int(_1770);
    bool _1774 = !_1633;
    int _1776 = _1774 ? _1754 : (-1);
    int _1778 = abs(_626);
    bool _1780 = !_1758;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = _1776 * _1768;
    int _1786 = abs(_636);
    int _1788 = _1730 * _1750;
    int _1790 = _1788 + _1784;
    int _1792 = abs(_1782);
    int _1794 = _1790 * _1778;
    int _1796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1798 = _1796 != 0;
    int _1800 = abs(_690);
    int _1802 = _1772 * _1786;
    int _1804 = _1802 + _1794;
    bool _1806 = !_1798;
    int _1808 = _1806 ? 0 : 1;
    int _1810 = _1748 * _1792;
    int _1812 = _1810 + _1631;
    float _1814 = in.m_67.y;
    int _1816 = abs(_1808);
    int _1818 = _1812 * _1800;
    int _1820 = _1818 + _1804;
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1824 = _1822 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1826 = _1748 * _1816;
    int _1828 = _1826 + _1820;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1832 = _1516;
    float _1834 = _1572;
    if (_1762)
    {
        float _1836 = in.m_57.x;
        _1830 = _1836;
    }
    float _1838 = _1830;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1844 = 1.0 / _1824;
    float _1846 = float(uint(_1828));
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1852 = as_type<float>(_1651) * _1846;
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1856 = _1854 != 0;
    float _1858 = 1.0 / _1842;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1862 = _1860 != 0;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1864;
    bool _1868 = _534 > 0.5;
    float _1870 = -_1814;
    float _1872 = _1870 + 1.0;
    float _1874 = 1.0 / _1850;
    float _1876 = _1814;
    if (_1856)
    {
        float _1878 = _1868 ? _1872 : _1814;
        _1876 = _1878;
    }
    float _1880 = _1876;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1884 = _1882 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1886 = _1866 * _1844;
    float _1888 = trunc(_1852);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1894;
    float _1898 = _1884 * _1858;
    bool _1900 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1902 = isnan(_522);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1908 = _1904 || _1906;
    float _1910 = float(_1908);
    float _1912 = in.m_67.x;
    bool _1914 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1916 = isnan(_522);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1922 = _1918 || _1920;
    float _1924 = float(_1922);
    float _1926 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1928 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1930 = isnan(_522);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = _1896 * _1874;
    float _1942 = -_1910;
    float _1944 = _1942 + 1.0;
    float _1946 = -_1924;
    float _1948 = _1946 + 1.0;
    bool _1950 = _1838 > 0.5;
    bool _1952 = _1950 && _1762;
    float _1954 = -_590;
    float _1956 = fma(_724, _1926, _1954);
    float _1958 = _1924 * _1944;
    bool _1960 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1962 = isnan(_522);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1968 = _1964 || _1966;
    float _1970 = float(_1968);
    float _1972 = _1938 * _1948;
    int _1974 = _1704 * int(_1892);
    int _1976 = _1974 + _1828;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1980 = _522 + _1978;
    float _1982 = -_1938;
    float _1984 = _1982 + 1.0;
    bool _1986 = _862 != 0.0;
    bool _1988 = isnan(_862);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan(0.0);
    bool _1994 = _1990 || _1992;
    float _1996 = fma(_1940, _1647, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1998 = float(uint(_1976));
    float _2000 = fma(_1886, _1980, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2002 = _1970 * _1984;
    bool _2004 = _860 == 0.0;
    bool _2006 = !_1994;
    bool _2008 = _2004 && _2006;
    float _2010 = in.m_71.x;
    float _2012 = in.m_71.y;
    float _2014 = in.m_71.z;
    float _2016 = as_type<float>(_1651) * _1998;
    float _2018 = _2000 * _2002;
    float _2020 = float(uint(_1812));
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2024 = _522 + _2022;
    float _2026 = -_1970;
    float _2028 = _2026 + 1.0;
    float _2030 = _1912;
    if (_1762)
    {
        _680 = _1912;
    }
    float _2032 = _680;
    float _2034 = trunc(_2016);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    float _2040 = as_type<float>(_1651) * _2020;
    bool _2042 = _864 == 0.0;
    bool _2044 = _2042 && _2008;
    float _2046 = fma(_1898, _2024, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2048 = _2032;
    if (_1952)
    {
        float _2050 = -_2032;
        float _2052 = _2050 + 1.0;
        _2048 = _2052;
    }
    float _2054 = _2048;
    float _2056 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2018);
    int _2058 = ~_552;
    int _2060 = _2058 + 1;
    float _2062 = trunc(_2040);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    if (_1762)
    {
        _2030 = _2054;
    }
    float _2068 = _2030;
    float _2070 = fma(_2046, _1972, _2056);
    int _2072 = ~_552;
    int _2074 = _2072 + 1;
    float _2076 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2078 = fma(_1996, _1958, _2070);
    int _2080 = int(_1892) + int(_2038);
    float _2082 = _2012;
    float _2084 = _2010;
    float _2086 = _2014;
    if (!_2044)
    {
        float _2088 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2012);
        _2082 = _2088;
    }
    float _2090 = _2082;
    if (!_2044)
    {
        float _2092 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2010);
        _2084 = _2092;
    }
    float _2094 = _2084;
    float _2096 = fma(_750, _2076, _578);
    if (!_2044)
    {
        float _2098 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2014);
        _2086 = _2098;
    }
    float _2100 = _2086;
    float _2102 = abs(_1168);
    float _2104 = log2(_2102);
    int _2106 = _2074 * int(_2066);
    int _2108 = _2106 + _1812;
    float _2110 = _2096 + 0.5;
    int _2112 = _2060 * _2080;
    int _2114 = _2112 + _1828;
    float _2116 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2078);
    float _2118 = _922 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2120 = float(uint(_2108));
    float _2122 = _922 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2124 = uint(_2114) >= uint(_552);
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2128 = as_type<float>(_1651) * _2120;
    bool _2130 = !_2124;
    int _2132 = _2130 ? 0 : (-1);
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2136 = ~_2080;
    int _2138 = _2136 + _2132;
    int _2140 = _2138 + 1;
    float _2142 = trunc(_2128);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2150 = _1956 + 0.5;
    float _2152 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2154 = _552 * _2140;
    int _2156 = _2154 + _1828;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2160 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2110;
    out.m_73.y = _2150;
    float _2162 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2164 = exp2(_2152);
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2168 = ~_552;
    int _2170 = _2168 + 1;
    out.m_75.x = _2160;
    out.m_75.y = _2166;
    out.m_75.z = _2162;
    out.m_75.w = _2126;
    int _2172 = int(_2066) + int(_2146);
    float _2174 = _922 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2176 = !_1633;
    int _2178 = _2176 ? _2156 : (-1);
    float _2180 = -_916;
    float _2182 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2122);
    bool _2184 = _1168 <= 8000.0;
    bool _2186 = isnan(_1168);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(8000.0);
    bool _2192 = _2188 || _2190;
    float _2194 = float(_2192);
    int _2196 = _2170 * _2172;
    int _2198 = _2196 + _1812;
    int _2200 = _2178 >> 31;
    int _2202 = _2178 & 3;
    bool _2204 = _2202 != 0;
    int _2206 = _2200 & 3;
    float _2208 = fma(_2164, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2210 = precise::clamp(_2208, 0.0, 1.0);
    float _2212 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2182);
    float _2214 = -_916;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2118);
    int _2218 = _2178 + _2206;
    float _2220 = -_916;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2174);
    bool _2224 = uint(_2198) >= uint(_552);
    float _2226 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    int _2228 = _2218 >> 2;
    float _2230 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2222);
    float _2232 = _932 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2234 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2236 = _2228 << 4;
    int _2238 = _2236 + 368;
    float _2240 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2242 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2232);
    float _2244 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2234);
    uint _2246 = uint(int(uint(_2238) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    int _2254 = int(_2246) + 1;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    int _2258 = _2254 & 3;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[int(_2256)][_2258];
    float _2262 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2240);
    float _2266 = _932 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2268 = _932 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2270 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    int _2272 = _2178 & 3;
    bool _2274 = _2272 != 0;
    float _2276 = _2226 * _2090;
    int _2278 = _2238 + 8;
    uint _2280 = uint(int(uint(_2278) >> uint(2)));
    uint _2282 = uint(int(uint(int(_2280)) >> uint(2)));
    int _2284 = int(_2280) & 3;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[int(_2282)][_2284];
    int _2288 = int(_2280) + 1;
    uint _2290 = uint(int(uint(_2288) >> uint(2)));
    int _2292 = _2288 & 3;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[int(_2290)][_2292];
    int _2296 = _2204 ? 0 : 1;
    float _2298 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    bool _2300 = uint(_2272) > 1u;
    float _2302 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2268);
    bool _2304 = _2272 != 3;
    float _2306 = _2212 * _2090;
    bool _2308 = !_2224;
    int _2310 = _2308 ? 0 : (-1);
    float _2312 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2298);
    bool _2314 = uint(_2272) >= 2u;
    float _2316 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2242);
    int _2318 = ~_2296;
    int _2320 = _2318 + 1;
    int _2322 = _2320 + 1;
    float _2324 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2302);
    int _2326 = ~_2172;
    int _2328 = _2326 + _2310;
    int _2330 = _2328 + 1;
    float _2332 = _2230 * _2090;
    int _2334 = _2314 ? 0 : 1;
    float _2336 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    int _2338 = _2322;
    if (!_2300)
    {
        int _2340 = ~_2296;
        int _2342 = _2340 + 1;
        _2338 = _2342;
    }
    int _2344 = _2338;
    float _2346 = fma(_2316, _2094, _2306);
    bool _2348 = !_2274;
    int _2350 = _2348 ? 0 : 1;
    float _2352 = fma(_2312, _2094, _2276);
    int _2354 = abs(_2344);
    float _2356 = fma(_2324, _2094, _2332);
    int _2358 = ~_2334;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = fma(_2336, _2100, _2352);
    bool _2366 = _2272 != 3;
    float _2368 = in.m_77.x;
    int _2370 = _2362;
    if (_2304)
    {
        int _2372 = ~_2334;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    int _2378 = _552 * _2330;
    int _2380 = _2378 + _1812;
    float _2382 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    int _2384 = abs(_2350);
    float _2386 = -_1586;
    float _2388 = _2386 + 1.0;
    bool _2390 = !_2366;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = fma(_2382, _2100, _2346);
    int _2396 = abs(_2376);
    float _2398 = _1666 * _1604;
    int _2400 = ~_2354;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    float _2406 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    int _2408 = abs(_2392);
    float _2410 = -_1666;
    float _2412 = _2410 + 1.0;
    bool _2414 = !_1862;
    int _2416 = _2414 ? 0 : 1;
    int _2418 = _2404 * as_type<int>(_2260);
    int _2420 = ~_2384;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    float _2426 = _1516 * 0.5;
    int _2428 = _2424 * as_type<int>(_2252);
    int _2430 = _2428 + _2418;
    float _2432 = fma(_2210, -2.0, 3.0);
    int _2434 = abs(_2416);
    float _2436 = _2210 * _2210;
    float _2438 = _1625 * _2398;
    int _2440 = ~_2396;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    float _2446 = _2436 * _2432;
    int _2448 = ~_2408;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    float _2454 = fma(_2406, _2100, _2356);
    int _2456 = _2444 * as_type<int>(_2286);
    int _2458 = _2456 + _2430;
    float _2460 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2462 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2464 = isnan(_1314);
    bool _2466 = _2462 || _2464;
    bool _2468 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2470 = _2466 || _2468;
    out.m_79.x = _2394;
    out.m_79.y = _2364;
    out.m_79.z = _2454;
    int _2472 = _2452 * as_type<int>(_2294);
    int _2474 = _2472 + _2458;
    float _2476 = -_2446;
    float _2478 = _2476 + 1.0;
    int _2480 = ~_2434;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2460);
    bool _2488 = !_1633;
    int _2490 = _2488 ? _2380 : (-1);
    float _2492 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2446);
    int _2494 = _2474 * _2484;
    float _2496 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2486);
    float _2498 = _2194 * _2492;
    int _2500 = _2490 * _2434;
    int _2502 = _2500 + _2494;
    float _2504 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2496);
    float _2506 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2508 = _1568 + _1516;
    float _2510 = fma(_1572, -0.5, _2426);
    float _2512 = float(_2502);
    float _2514 = _2388 * _2506;
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    out.gl_Position.x = _1568;
    out.gl_Position.y = _1572;
    out.gl_Position.z = _2504;
    out.gl_Position.w = _1516;
    float _2518 = _2504 + _1516;
    float _2520 = _2508 * 0.5;
    float _2522 = -_2516;
    float _2524 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2512;
    float _2526 = _1615 * _2412;
    float _2528 = _2518 * 0.5;
    float _2530 = _2524 * _2368;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2534 = fma(_1615, _2438, _1613);
    out.m_83.x = _2520;
    out.m_83.y = _2510;
    out.m_83.z = _2528;
    out.m_83.w = _1516;
    float _2536 = _1615 * _2398;
    float _2538 = _2504;
    float _2540 = _2536;
    float _2542 = _2510;
    float _2544 = _2520;
    if (!_2470)
    {
        _1832 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2546 = _1832;
    out.m_85.x = _2532;
    float _2548 = fma(_1621, _2536, _1609);
    float _2550 = fma(_1623, _2536, _1611);
    float _2552 = _2546;
    float _2554 = _2546;
    if (!_2470)
    {
        _2538 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2556 = _2538;
    float _2558 = _2556;
    float _2560 = _2556;
    if (!_2470)
    {
        _1834 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2562 = _1834;
    out.m_87.x = _2548;
    out.m_87.y = _2550;
    out.m_87.z = _2534;
    out.m_87.w = _2526;
    float _2564 = _2562;
    float _2566 = _2562;
    if (!_2470)
    {
        _2540 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2568 = _2540;
    float _2570 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2572 = _2568;
    float _2574 = _2568;
    if (!_2470)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2576 = _2542;
    float _2578 = _2576;
    float _2580 = _2576;
    if (!_2470)
    {
        _2544 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2582 = _2544;
    bool _2584 = !_2470;
    float _2586 = _2582;
    float _2588 = _2582;
    if (!_2584)
    {
        bool _2590 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2592 = isnan(_1314);
        bool _2594 = _2590 || _2592;
        bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2598 = _2594 || _2596;
        if (!_2598)
        {
            float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2602 = _1314 + _2600;
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2606 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2604;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2612 = 1.0 / _2606;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2630 = _2602 * _2612;
            float _2632 = precise::clamp(_2630, 0.0, 1.0);
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2638 = fma(_2632, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2640 = fma(_2632, _2636, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2642 = fma(_2632, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2644 = fma(_2632, _2620, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2646 = fma(_2632, _2624, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2648 = fma(_2632, _2628, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2588 = _2642;
            _2566 = _2646;
            _2580 = _2638;
            _2560 = _2644;
            _2554 = _2640;
            _2574 = _2648;
            _2650 = true;
        }
        else
        {
            bool _2652 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2654 = isnan(_1314);
            bool _2656 = _2652 || _2654;
            bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2660 = _2656 || _2658;
            if (!_2660)
            {
                _2578 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2662 = _2578;
            _2580 = _2662;
            if (!_2660)
            {
                _2586 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2664 = _2586;
            _2588 = _2664;
            if (!_2660)
            {
                _2552 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2666 = _2552;
            _2554 = _2666;
            if (!_2660)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2668 = _2558;
            _2560 = _2668;
            if (!_2660)
            {
                _2564 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2670 = _2564;
            _2566 = _2670;
            if (!_2660)
            {
                _2572 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2672 = _2572;
            bool _2674 = !_2660;
            _2574 = _2672;
            if (!_2674)
            {
                bool _2676 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2678 = isnan(_1314);
                bool _2680 = _2676 || _2678;
                bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2684 = _2680 || _2682;
                if (!_2684)
                {
                    float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2688 = _1314 + _2686;
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2692 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2690;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2698 = 1.0 / _2692;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2716 = _2688 * _2698;
                    float _2718 = precise::clamp(_2716, 0.0, 1.0);
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2724 = fma(_2718, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2726 = fma(_2718, _2722, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2728 = fma(_2718, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2730 = fma(_2718, _2706, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2732 = fma(_2718, _2710, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2734 = fma(_2718, _2714, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2588 = _2728;
                    _2566 = _2732;
                    _2580 = _2724;
                    _2560 = _2730;
                    _2554 = _2726;
                    _2574 = _2734;
                    _2650 = true;
                }
                else
                {
                    _2588 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2566 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2580 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2554 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2574 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2650 = false;
    float _2736 = _2588;
    float _2738 = _2566;
    float _2740 = _2580;
    float _2742 = _2560;
    float _2744 = _2554;
    float _2746 = _2574;
    float _2748 = fma(_2364, -0.5, 0.5);
    float _2750 = precise::clamp(_2748, 0.0, 1.0);
    float _2752 = -_2736;
    float _2754 = _2752 + _2738;
    float _2756 = _2570 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2758 = -_2740;
    float _2760 = _2758 + _2742;
    float _2762 = fma(_2750, _2754, _2736);
    out.m_89.x = 0.0;
    float _2764 = -_2744;
    float _2766 = _2764 + _2746;
    float _2768 = fma(_2750, _2760, _2740);
    float _2770 = _2762 * 0.586610972881317138671875;
    out.m_53.x = _2756;
    bool _2772 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2774 = fma(_2750, _2766, _2744);
    float _2776 = fma(_2768, 0.298911988735198974609375, _2770);
    bool _2778 = _1286 > 0.0;
    bool _2780 = isnan(_1286);
    bool _2782 = _2778 || _2780;
    bool _2784 = isnan(0.0);
    bool _2786 = _2782 || _2784;
    float _2788 = fma(_2774, 0.114477999508380889892578125, _2776);
    float _2790 = -_2788;
    float _2792 = _2768 + _2790;
    float _2794 = -_2788;
    float _2796 = _2762 + _2794;
    float _2798 = -_2788;
    float _2800 = _2774 + _2798;
    float _2802 = fma(_2792, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2804 = fma(_2796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2806 = fma(_2800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    bool _2808 = !_2772;
    if (!_2808)
    {
        float _2810 = -_1224;
        float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2814 = -_1226;
        float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2818 = -_1228;
        float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2822 = _2812 * _2812;
        float _2824 = fma(_2816, _2816, _2822);
        float _2826 = fma(_2820, _2820, _2824);
        float _2828 = sqrt(_2826);
        float _2830 = rsqrt(_2826);
        float _2832 = -_2828;
        float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2836 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2838 = precise::clamp(_2836, 0.0, 1.0);
        float _2840 = _2816 * _2830;
        float _2842 = _2812 * _2830;
        float _2844 = abs(_2838);
        float _2846 = log2(_2844);
        float _2848 = _2820 * _2830;
        float _2850 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2852 = _2364 * _2842;
        float _2854 = -_2842;
        float _2856 = -_2850;
        float _2858 = fma(_2854, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2856);
        float _2860 = fma(_2394, _2840, _2852);
        float _2862 = -_2848;
        float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2858);
        float _2866 = fma(_2454, _2848, _2860);
        float _2868 = precise::clamp(_2866, 0.0, 1.0);
        float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2872 = _2864 + _2870;
        float _2874 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2876 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2878 = precise::clamp(_2876, 0.0, 1.0);
        float _2880 = exp2(_2874);
        float _2882 = _2880 * _2878;
        float _2884 = _2868 * _2882;
        float _2886 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2890 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2886;
        out.m_89.y = _2888;
        out.m_89.z = _2890;
    }
    out.m_91.x = _2802;
    out.m_91.y = _2804;
    out.m_91.z = _2806;
    if (_2786)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2892 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2892;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2650 = false;
    bool _376 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2961 = as_type<float>(_134);
        out.gl_Position.z = _2961;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3016 = as_type<float>(_160);
        out.gl_Position.z = _3016;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
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
    float _274 = 1.0 / _252;
    float _276 = _268 * _272;
    float _278 = -_268;
    float _280 = _278 + 1.0;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _282;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _256;
    float _290 = _248 * _280;
    float _292 = -_248;
    float _294 = _292 + 1.0;
    float _296 = _220 * _274;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = fma(_284, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_304, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = _236 * _288;
    float _314 = _306 * _290;
    float _316 = _308 * _290;
    float _318 = _310 * _290;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].x, _314);
    float _334 = fma(_322, _312, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_326, _312, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = fma(_330, _312, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _342 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].z, _318);
    float _344 = fma(_334, _276, _332);
    float _346 = fma(_336, _276, _340);
    float _348 = fma(_338, _276, _342);
    float _350 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].x, _344);
    float _352 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].y, _346);
    float _354 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[145].z, _348);
    bool _356 = !_286;
    float _374;
    if (!_356)
    {
        float _358 = in.m_57.x;
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _358 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        _374 = _172;
    }
    _376 = false;
    float _378 = _374;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _382 = _378 + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _390 = isnan(_378);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _404 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _406 = isnan(_378);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _416;
    bool _420 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _422 = isnan(_378);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = 1.0 / _386;
    float _434 = -_398;
    float _436 = _434 + 1.0;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _440 = 1.0 / _402;
    float _442 = _418 * _432;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _448 = fma(_442, _382, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _450 = _414 * _436;
    float _452 = -_430;
    float _454 = _452 + 1.0;
    float _456 = -_414;
    float _458 = _456 + 1.0;
    float _460 = _446 * _440;
    float _462 = _448 * _450;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _466 = _378 + _464;
    float _468 = _398 * _454;
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[115].x, _462);
    float _472 = fma(_460, _466, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _474 = fma(_472, _468, _470);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _480 = in.m_59.x;
    float _482 = in.m_59.y;
    float _484 = in.m_59.z;
    float _486 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[117].x, _474);
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _490 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _496 = _488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _490;
    out.m_61.y = _492;
    out.m_61.z = _496;
    out.m_61.w = _494;
    float _498 = _354 * _484;
    float _500 = _352 * _482;
    float _502 = _350 * _480;
    bool _504 = !_438;
    if (!_504)
    {
        float _506 = in.m_57.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _194 = _520;
    }
    float _522 = _194;
    float _524 = in.m_57.z;
    float _526 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _528 = log2(_526);
    float _530 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _532 = in.m_57.x;
    float _534 = in.m_57.y;
    float _536 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _538 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _540 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _542 = int(_540);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _548 = _528 * _116;
    float _550 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _552 = int(_550);
    float _554 = _524 * 2.0;
    float _556 = exp2(_548);
    float _558 = _532 * 2.0;
    float _560 = _534 * 2.0;
    float _562 = _532 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _564 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _566 = floor(_554);
    float _568 = -_544;
    float _570 = fma(_562, 2.0, _568);
    float _572 = _534 + _532;
    float _574 = fma(_564, -2.0, _546);
    float _576 = -_116;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[76].x, _570);
    float _580 = _572 + (-1.0);
    float _582 = float(_542);
    float _584 = floor(_558);
    float _586 = float(_552);
    float _588 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _590 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _574);
    float _592 = _586 * _116;
    bool _594 = _566 >= 0.0;
    bool _596 = isnan(_566);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = floor(_560);
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _608 = _606 != 0;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _616 = _614 != 0;
    int _618 = _602 ? 0 : 1;
    bool _620 = _584 > 0.0;
    float _622 = 1.0 / _582;
    bool _624 = !_612;
    int _626 = _624 ? 0 : 1;
    bool _628 = _566 > 0.0;
    float _630 = -_556;
    float _632 = _630 + 1.0;
    bool _634 = !_608;
    int _636 = _634 ? 0 : 1;
    bool _638 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    bool _648 = _584 >= 0.0;
    bool _650 = isnan(_584);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    bool _658 = _604 > 0.0;
    bool _660 = _604 >= 0.0;
    bool _662 = isnan(_604);
    bool _664 = _660 || _662;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    int _670 = ~_618;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = _622 * _116;
    int _678 = _674;
    float _680 = _590;
    if (!_628)
    {
        int _682 = ~_618;
        int _684 = _682 + 1;
        _678 = _684;
    }
    int _686 = _678;
    bool _688 = !_616;
    int _690 = _688 ? 0 : 1;
    float _692 = in.m_63.x;
    float _694 = in.m_63.y;
    float _696 = in.m_63.z;
    float _698 = _646 ? _632 : 0.0;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _712 = _710 != 0;
    float _714 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].w, _700);
    bool _716 = !_704;
    int _718 = _716 ? 0 : 1;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _722 = 1.0 + _720;
    float _724 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _714);
    float _726 = float(_686);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _730 = abs(_718);
    float _732 = 1.0 / _722;
    int _734 = _656 ? 0 : 1;
    float _736 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[78].z, _728);
    float _738 = float(_730);
    bool _740 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(1.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _736);
    bool _752 = !_708;
    int _754 = _752 ? 0 : 1;
    float _756 = _738 * _726;
    int _758 = ~_734;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    float _764 = _532 + (-0.5);
    int _766 = _762;
    if (!_620)
    {
        int _768 = ~_734;
        int _770 = _768 + 1;
        _766 = _770;
    }
    int _772 = _766;
    float _774 = _756 * (-2.0);
    int _776 = abs(_754);
    int _778 = _668 ? 0 : 1;
    float _780 = fma(_774, _692, _692);
    bool _782 = !_712;
    int _784 = _782 ? 0 : 1;
    if (_748)
    {
        float _786 = _698 * _732;
        _126 = _786;
    }
    float _788 = _126;
    float _790 = float(_772);
    float _792 = fma(_588, _774, _588);
    float _794 = float(_776);
    float _796 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[196].x, _780);
    int _798 = ~_778;
    int _800 = _798 + 1;
    int _802 = _800 + 1;
    int _804 = _802;
    if (!_658)
    {
        int _806 = ~_778;
        int _808 = _806 + 1;
        _804 = _808;
    }
    int _810 = _804;
    float _812 = _794 * _790;
    int _814 = abs(_784);
    float _816 = _534 + _524;
    float _818 = fma(_792, _788, _796);
    float _820 = float(_810);
    float _822 = _812 * (-2.0);
    float _824 = float(_814);
    float _826 = _816 + (-1.0);
    float _828 = fma(_822, _694, _694);
    float _830 = _818 * 0.15915493667125701904296875;
    float _832 = _824 * _820;
    float _834 = _534 + (-0.5);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _838 = _524 + _532;
    float _840 = _832 * (-2.0);
    float _842 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _844 = _838 + (-1.0);
    float _846 = fma(_836, _822, _836);
    float _848 = _524 + (-0.5);
    float _850 = _830 * 6.283185482025146484375;
    float _852 = sin(_850);
    float _854 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _856 = fma(_840, _696, _696);
    float _858 = fma(_846, _788, _842);
    float _860 = in.m_65.x;
    float _862 = in.m_65.y;
    float _864 = in.m_65.z;
    float _866 = fma(_854, _840, _854);
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].z, _856);
    float _870 = _830 * 6.283185482025146484375;
    float _872 = cos(_870);
    float _874 = _858 * 0.15915493667125701904296875;
    float _876 = in.m_46.x;
    float _878 = in.m_46.y;
    float _880 = in.m_46.z;
    float _882 = fma(_866, _788, _868);
    float _884 = _874 * 6.283185482025146484375;
    float _886 = sin(_884);
    float _888 = _882 * 0.15915493667125701904296875;
    float _890 = _874 * 6.283185482025146484375;
    float _892 = cos(_890);
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _862);
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _860);
    float _898 = _888 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _864);
    float _904 = _872 * _886;
    float _906 = _536 * _894;
    float _908 = _852 * _886;
    float _910 = _530 * _902;
    float _912 = _538 * _896;
    float _914 = _888 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = _872 * _892;
    float _920 = _852 * _892;
    float _922 = _872 * _900;
    float _924 = _852 * _900;
    float _926 = _892 * _900;
    float _928 = _886 * _900;
    float _930 = _922 * _906;
    float _932 = fma(_916, _918, _908);
    float _934 = -_904;
    float _936 = fma(_916, _920, _934);
    float _938 = -_920;
    float _940 = fma(_916, _904, _938);
    float _942 = -_906;
    float _944 = _916 * _942;
    float _946 = fma(_932, _912, _930);
    float _948 = _924 * _906;
    float _950 = fma(_916, _908, _918);
    float _952 = fma(_926, _912, _944);
    float _954 = fma(_940, _910, _946);
    float _956 = fma(_936, _912, _948);
    float _958 = _878 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = fma(_928, _910, _952);
    float _962 = _954 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _964 = fma(_950, _910, _956);
    float _966 = fma(_876, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _968 = _878 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _970 = _954 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _972 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].x, _962);
    float _974 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[6].z, _966);
    float _976 = fma(_876, (*spvDescriptorSet0.vp_c10)._m0[4].x, _968);
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].x, _970);
    float _980 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _984 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[4].z, _976);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _990 = _878 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _994 = _986 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _982 + _988;
    float _998 = fma(_876, (*spvDescriptorSet0.vp_c10)._m0[5].x, _990);
    float _1000 = _954 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = _992 + _994;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1006 = _996 + _1004;
    float _1008 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[5].z, _998);
    float _1010 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1002 + _1012;
    float _1016 = _1006 * _1006;
    float _1018 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1022 = fma(_1014, _1014, _1016);
    float _1024 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1026 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1030 = sqrt(_1022);
    float _1032 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1024);
    float _1034 = _1018 + _1026;
    float _1036 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1032);
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1040 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1016;
    float _1044 = _1002;
    float _1046 = _996;
    float _1048 = _1006;
    if (!_1040)
    {
        _1042 = _1002;
    }
    float _1050 = _1042;
    float _1052 = _1050;
    if (!_1040)
    {
        _1044 = _1034;
    }
    float _1054 = _1044;
    bool _1056 = !_1040;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _1030 + _1062;
        float _1066 = rsqrt(_1022);
        float _1068 = _1064 * _1060;
        float _1070 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1072 = _1068 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1034, _1076, _1084);
        float _1090 = _1066 * _1086;
        float _1092 = fma(_1014, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_1006, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1058 = _1088;
        _1052 = _1092;
        _1046 = _1094;
    }
    float _1096 = _1058;
    float _1098 = _1052;
    float _1100 = _1046;
    float _1102 = -_1018;
    float _1104 = _1102 + _1096;
    float _1106 = -_992;
    float _1108 = _1106 + _1098;
    float _1110 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1028);
    float _1112 = 1.0 / _1038;
    float _1114 = _1104 * _1104;
    float _1116 = -_982;
    float _1118 = _1116 + _1100;
    float _1120 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1110);
    bool _1122 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1124 = isnan(0.5);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1130 = _1126 || _1128;
    float _1132 = fma(_1108, _1108, _1114);
    float _1134 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1136 = fma(_1118, _1118, _1132);
    float _1138 = _1134 + _1038;
    float _1140 = sqrt(_1136);
    float _1142 = _1138 * _1112;
    float _1144 = _1142 * 0.5;
    float _1146 = _1096;
    float _1148 = _1098;
    float _1150 = _1100;
    float _1152 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1154 = _1136;
    if (_1130)
    {
        _1048 = 1.0;
    }
    float _1156 = _1048;
    float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1160 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1158);
    float _1162 = 1.0 / _1160;
    bool _1164 = _1140 > 0.0;
    float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1168 = _1162 * _1166;
    bool _1170 = !_1164;
    float _1172 = _1140;
    float _1174 = _1162;
    float _1176 = _1156;
    if (!_1170)
    {
        float _1178 = _188 * _188;
        float _1180 = rsqrt(_1136);
        float _1182 = fma(_186, _186, _1178);
        float _1184 = fma(_190, _190, _1182);
        float _1186 = sqrt(_1184);
        float _1188 = _1108 * _1180;
        float _1190 = _1104 * _1180;
        float _1192 = _1118 * _1180;
        bool _1194 = _1186 > 0.0;
        bool _1196 = !_1194;
        _1172 = _1186;
        _1174 = _1184;
        _1152 = _1192;
        if (!_1196)
        {
            float _1198 = rsqrt(_1184);
            float _1200 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1202 = _188 * _1198;
            float _1204 = _186 * _1198;
            float _1206 = _1190 * _1202;
            float _1208 = _190 * _1198;
            float _1210 = fma(_1188, _1204, _1206);
            float _1212 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1214 = fma(_1192, _1208, _1210);
            float _1216 = _1214 * _1212;
            float _1218 = fma(_186, _1216, _1098);
            float _1220 = fma(_188, _1216, _1096);
            float _1222 = fma(_190, _1216, _1100);
            _1146 = _1220;
            _1148 = _1218;
            _1150 = _1222;
            _1172 = _1212;
            _1174 = _1198;
        }
    }
    float _1224 = _1146;
    float _1226 = _1148;
    float _1228 = _1150;
    float _1230 = _1172;
    float _1232 = _1174;
    float _1234 = _1152;
    float _1236 = _1234;
    if (!_1130)
    {
        float _1238 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1240 = _1238 * 0.15915493667125701904296875;
        float _1242 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        float _1248 = _1242 * 0.15915493667125701904296875;
        float _1250 = _1240 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = 1.0 / _1246;
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1252 * _1254;
        float _1262 = _1248 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = 1.0 / _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1270;
        float _1274 = 1.0 / _1272;
        float _1276 = _1264 * _1268;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1280 = fma(_1168, _1276, _1278);
        float _1282 = _1280 * _1274;
        float _1284 = precise::clamp(_1282, 0.0, 1.0);
        _1176 = _1284;
    }
    float _1286 = _1176;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1290 = _1224 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1294 = _1226 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1298 = _1228 + _1296;
    float _1300 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1302 = _1290 * _1290;
    float _1304 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1300);
    float _1306 = fma(_1294, _1294, _1302);
    float _1308 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1304);
    float _1310 = fma(_1298, _1298, _1306);
    float _1312 = rsqrt(_1310);
    float _1314 = sqrt(_1310);
    float _1316 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1318 = _1294 * _1316;
    float _1320 = _1298 * _1316;
    float _1322 = _1318 * _1318;
    float _1324 = _1320 * _1320;
    float _1326 = _1322 + _1324;
    float _1328 = sqrt(_1326);
    bool _1330 = _1328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1328 + _1332;
    float _1336 = _1230;
    float _1338 = _1334;
    float _1340 = _1318;
    float _1342 = _1320;
    float _1344 = _1322;
    float _1346 = _1324;
    if (_1330)
    {
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1336 = _1348;
    }
    float _1350 = _1336;
    if (_1330)
    {
        float _1352 = _1334 * _1350;
        _1338 = _1352;
    }
    float _1354 = _1338;
    if (_1330)
    {
        float _1356 = _1354 * 0.15915493667125701904296875;
        _1154 = _1356;
    }
    float _1358 = _1154;
    float _1360 = _1232;
    if (_1330)
    {
        float _1362 = _1358 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        _1360 = _1364;
    }
    float _1366 = _1360;
    float _1368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1370 = precise::max(0.0, _1368);
    float _1372 = _1118;
    float _1374 = _1370;
    if (_1330)
    {
        float _1376 = _1358 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        _1372 = _1378;
    }
    float _1380 = _1372;
    float _1382 = -_1316;
    float _1384 = -_1370;
    float _1386 = fma(_1290, _1382, _1384);
    float _1388 = _1368;
    if (_1330)
    {
        float _1390 = rsqrt(_1326);
        _1388 = _1390;
    }
    float _1392 = _1388;
    if (_1330)
    {
        float _1394 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1394;
    }
    float _1396 = _1374;
    float _1398 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1400 = _1396;
    float _1402 = _1366;
    if (_1330)
    {
        float _1404 = fma(_1366, _1396, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1236 = _1404;
    }
    float _1406 = _1236;
    if (_1330)
    {
        float _1408 = _1380 + (-1.0);
        _1400 = _1408;
    }
    float _1410 = _1400;
    float _1412 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = floor(_1398);
    float _1416 = _1410;
    if (_1330)
    {
        float _1418 = _1410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1424 = _1392;
    if (_1330)
    {
        float _1426 = _1392 * _1406;
        _1402 = _1426;
    }
    float _1428 = _1402;
    if (!_1330)
    {
        _1424 = _1386;
    }
    float _1430 = _1424;
    float _1432 = _1430;
    if (_1330)
    {
        float _1434 = fma(_1386, _1380, _1420);
        _1432 = _1434;
    }
    float _1436 = _1432;
    if (_1330)
    {
        float _1438 = _1318 * _1428;
        _1340 = _1438;
    }
    float _1440 = _1340;
    if (_1330)
    {
        float _1442 = _1320 * _1428;
        _1342 = _1442;
    }
    float _1444 = _1342;
    float _1446 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1330)
    {
        float _1448 = _1440 * _1440;
        _1344 = _1448;
    }
    float _1450 = _1344;
    if (_1330)
    {
        float _1452 = _1444 * _1444;
        _1346 = _1452;
    }
    float _1454 = _1346;
    float _1456 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1458 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1460 = fma(_1436, _1436, _1450);
    float _1462 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1446);
    float _1464 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1466 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1458);
    float _1468 = _1460 + _1454;
    float _1470 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1462);
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1476 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1474);
    float _1478 = precise::clamp(_1476, 0.0, 1.0);
    float _1480 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1466);
    float _1482 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1484 = rsqrt(_1468);
    float _1486 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1488 = -_1478;
    float _1490 = _1488 + 1.0;
    float _1492 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1494 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1496 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1498 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1500 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1494);
    float _1502 = abs(_1490);
    float _1504 = log2(_1502);
    float _1506 = -_1496;
    float _1508 = fma(_1506, _1472, 1.0);
    float _1510 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1512 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1500);
    float _1514 = _1484 * _1440;
    float _1516 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1512);
    float _1518 = _1484 * _1436;
    float _1520 = _1484 * _1444;
    float _1522 = _1514 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1524 = floor(_1456);
    float _1526 = -_1522;
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1526);
    float _1530 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1532 = -_1520;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1528);
    float _1536 = -_1414;
    float _1538 = _1398 + _1536;
    float _1540 = log2(_1508);
    float _1542 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1544 = fma(_1534, -0.5, 0.5);
    float _1546 = fma(_1534, 0.5, 0.5);
    float _1548 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1542);
    float _1550 = -_1524;
    float _1552 = _1456 + _1550;
    float _1554 = exp2(_1530);
    float _1556 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1498);
    float _1558 = fma(_1546, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1560 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1548);
    float _1562 = _1518 + 1.0;
    float _1564 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1556);
    float _1566 = fma(_1546, _1558, -0.212114393711090087890625);
    float _1568 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1560);
    float _1570 = 1.0 / _1516;
    float _1572 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1564);
    float _1574 = _1540 * 0.693147182464599609375;
    float _1576 = fma(_1546, _1566, 1.570728778839111328125);
    float _1578 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1580 = sqrt(_1544);
    float _1582 = -_1518;
    float _1584 = fma(_1554, _1562, _1582);
    float2 _5277 = float2(_1538, _1552);
    float _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5277, float2(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5277, float2(0.0), isnan(_5277)), level(0.0)).x;
    float _1588 = fma(_1584, 0.5, 0.5);
    float _1590 = _1568 * _1570;
    float _1592 = _1572 * _1570;
    float _1594 = fma(_1590, 0.5, 0.5);
    float _1596 = fma(_1592, -0.5, 0.5);
    float _1598 = _1580 * 0.636619746685028076171875;
    float _1600 = -_1576;
    float _1602 = fma(_1598, _1600, 1.0);
    float3 _5308 = float3(_1594, _1596, _1578);
    float _1604 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5308, float3(0.0), isnan(_5308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5308, float3(0.0), isnan(_5308)), level(0.0)).x;
    float3 _5319 = float3(_1594, _1596, _1578);
    float4 _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5319, float3(0.0), isnan(_5319)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5319, float3(0.0), isnan(_5319)), level(0.0)).xyzw;
    float _1609 = _1607.x;
    float _1611 = _1607.y;
    float _1613 = _1607.z;
    float _1615 = _1607.w;
    float2 _5335 = float2(_1602, _1588);
    float3 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5335, float2(0.0), isnan(_5335)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5335, float2(0.0), isnan(_5335)), level(0.0)).xyz;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = float(uint(_552));
    float _1629 = trunc(_676);
    int _1631 = int(_1629);
    bool _1633 = _552 == 0;
    float _1635 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1637 = 1.0 / _1627;
    int _1639 = ~_552;
    int _1641 = _1639 + 1;
    float _1643 = float(uint(_1631));
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1647 = _522 + _1645;
    float _1649 = exp2(_1635);
    int _1651 = as_type<int>(_1637) + (-2);
    float _1653 = as_type<float>(_1651) * _1643;
    float _1655 = -_1649;
    float _1657 = _1655 + 1.0;
    float _1659 = trunc(_1653);
    float _1661 = precise::max(_1659, 0.0);
    uint _1664 = uint(_1661);
    float _1666 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1668 = _1641 * int(_1664);
    int _1670 = _1668 + _1631;
    float _1672 = float(uint(_1670));
    float _1674 = as_type<float>(_1651) * _1672;
    int _1676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1678 = _1676 != 0;
    float _1680 = trunc(_1674);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    bool _1686 = !_1678;
    float _1688 = _1686 ? 7.345489978790283203125 : 1.0;
    float _1690 = _1688 * _532;
    int _1692 = ~_552;
    int _1694 = _1692 + 1;
    float _1696 = floor(_1690);
    int _1698 = int(_1664) + int(_1684);
    float _1700 = float(_1631);
    int _1702 = ~_552;
    int _1704 = _1702 + 1;
    int _1706 = _1694 * _1698;
    int _1708 = _1706 + _1631;
    bool _1710 = _1700 >= _586;
    bool _1712 = isnan(_1700);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan(_586);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = -_1696;
    float _1724 = _1690 + _1722;
    bool _1726 = uint(_1708) >= uint(_552);
    float _1728 = trunc(_1720);
    int _1730 = int(_1728);
    float _1732 = _1724 * _586;
    bool _1734 = !_1726;
    int _1736 = _1734 ? 0 : (-1);
    int _1738 = ~_1698;
    int _1740 = _1738 + _1736;
    int _1742 = _1740 + 1;
    float _1744 = _592 * _168;
    float _1746 = trunc(_1732);
    int _1748 = int(_1746);
    int _1750 = _552 + (-1);
    int _1752 = _552 * _1742;
    int _1754 = _1752 + _1631;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1758 = _1756 != 0;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1762 = _1760 != 0;
    int _1764 = ~_1730;
    int _1766 = _1764 + 1;
    int _1768 = _1766 + 1;
    float _1770 = trunc(_1744);
    int _1772 = int(_1770);
    bool _1774 = !_1633;
    int _1776 = _1774 ? _1754 : (-1);
    int _1778 = abs(_626);
    bool _1780 = !_1758;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = _1776 * _1768;
    int _1786 = abs(_636);
    int _1788 = _1730 * _1750;
    int _1790 = _1788 + _1784;
    int _1792 = abs(_1782);
    int _1794 = _1790 * _1778;
    int _1796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1798 = _1796 != 0;
    int _1800 = abs(_690);
    int _1802 = _1772 * _1786;
    int _1804 = _1802 + _1794;
    bool _1806 = !_1798;
    int _1808 = _1806 ? 0 : 1;
    int _1810 = _1748 * _1792;
    int _1812 = _1810 + _1631;
    float _1814 = in.m_67.y;
    int _1816 = abs(_1808);
    int _1818 = _1812 * _1800;
    int _1820 = _1818 + _1804;
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1824 = _1822 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1826 = _1748 * _1816;
    int _1828 = _1826 + _1820;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1832 = _1516;
    float _1834 = _1572;
    if (_1762)
    {
        float _1836 = in.m_57.x;
        _1830 = _1836;
    }
    float _1838 = _1830;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1844 = 1.0 / _1824;
    float _1846 = float(uint(_1828));
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1852 = as_type<float>(_1651) * _1846;
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1856 = _1854 != 0;
    float _1858 = 1.0 / _1842;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1862 = _1860 != 0;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1864;
    bool _1868 = _534 > 0.5;
    float _1870 = -_1814;
    float _1872 = _1870 + 1.0;
    float _1874 = 1.0 / _1850;
    float _1876 = _1814;
    if (_1856)
    {
        float _1878 = _1868 ? _1872 : _1814;
        _1876 = _1878;
    }
    float _1880 = _1876;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1884 = _1882 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1886 = _1866 * _1844;
    float _1888 = trunc(_1852);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1894;
    float _1898 = _1884 * _1858;
    bool _1900 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1902 = isnan(_522);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1908 = _1904 || _1906;
    float _1910 = float(_1908);
    float _1912 = in.m_67.x;
    bool _1914 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1916 = isnan(_522);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1922 = _1918 || _1920;
    float _1924 = float(_1922);
    float _1926 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1928 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1930 = isnan(_522);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = _1896 * _1874;
    float _1942 = -_1910;
    float _1944 = _1942 + 1.0;
    float _1946 = -_1924;
    float _1948 = _1946 + 1.0;
    bool _1950 = _1838 > 0.5;
    bool _1952 = _1950 && _1762;
    float _1954 = -_590;
    float _1956 = fma(_724, _1926, _1954);
    float _1958 = _1924 * _1944;
    bool _1960 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1962 = isnan(_522);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1968 = _1964 || _1966;
    float _1970 = float(_1968);
    float _1972 = _1938 * _1948;
    int _1974 = _1704 * int(_1892);
    int _1976 = _1974 + _1828;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1980 = _522 + _1978;
    float _1982 = -_1938;
    float _1984 = _1982 + 1.0;
    bool _1986 = _862 != 0.0;
    bool _1988 = isnan(_862);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan(0.0);
    bool _1994 = _1990 || _1992;
    float _1996 = fma(_1940, _1647, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1998 = float(uint(_1976));
    float _2000 = fma(_1886, _1980, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2002 = _1970 * _1984;
    bool _2004 = _860 == 0.0;
    bool _2006 = !_1994;
    bool _2008 = _2004 && _2006;
    float _2010 = in.m_71.x;
    float _2012 = in.m_71.y;
    float _2014 = in.m_71.z;
    float _2016 = as_type<float>(_1651) * _1998;
    float _2018 = _2000 * _2002;
    float _2020 = float(uint(_1812));
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2024 = _522 + _2022;
    float _2026 = -_1970;
    float _2028 = _2026 + 1.0;
    float _2030 = _1912;
    if (_1762)
    {
        _680 = _1912;
    }
    float _2032 = _680;
    float _2034 = trunc(_2016);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    float _2040 = as_type<float>(_1651) * _2020;
    bool _2042 = _864 == 0.0;
    bool _2044 = _2042 && _2008;
    float _2046 = fma(_1898, _2024, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2048 = _2032;
    if (_1952)
    {
        float _2050 = -_2032;
        float _2052 = _2050 + 1.0;
        _2048 = _2052;
    }
    float _2054 = _2048;
    float _2056 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2018);
    int _2058 = ~_552;
    int _2060 = _2058 + 1;
    float _2062 = trunc(_2040);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    if (_1762)
    {
        _2030 = _2054;
    }
    float _2068 = _2030;
    float _2070 = fma(_2046, _1972, _2056);
    int _2072 = ~_552;
    int _2074 = _2072 + 1;
    float _2076 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2078 = fma(_1996, _1958, _2070);
    int _2080 = int(_1892) + int(_2038);
    float _2082 = _2012;
    float _2084 = _2010;
    float _2086 = _2014;
    if (!_2044)
    {
        float _2088 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2012);
        _2082 = _2088;
    }
    float _2090 = _2082;
    if (!_2044)
    {
        float _2092 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2010);
        _2084 = _2092;
    }
    float _2094 = _2084;
    float _2096 = fma(_750, _2076, _578);
    if (!_2044)
    {
        float _2098 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2014);
        _2086 = _2098;
    }
    float _2100 = _2086;
    float _2102 = abs(_1168);
    float _2104 = log2(_2102);
    int _2106 = _2074 * int(_2066);
    int _2108 = _2106 + _1812;
    float _2110 = _2096 + 0.5;
    int _2112 = _2060 * _2080;
    int _2114 = _2112 + _1828;
    float _2116 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2078);
    float _2118 = _922 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2120 = float(uint(_2108));
    float _2122 = _922 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2124 = uint(_2114) >= uint(_552);
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2128 = as_type<float>(_1651) * _2120;
    bool _2130 = !_2124;
    int _2132 = _2130 ? 0 : (-1);
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2136 = ~_2080;
    int _2138 = _2136 + _2132;
    int _2140 = _2138 + 1;
    float _2142 = trunc(_2128);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2150 = _1956 + 0.5;
    float _2152 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2154 = _552 * _2140;
    int _2156 = _2154 + _1828;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2160 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2110;
    out.m_73.y = _2150;
    float _2162 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2164 = exp2(_2152);
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2168 = ~_552;
    int _2170 = _2168 + 1;
    out.m_75.x = _2160;
    out.m_75.y = _2166;
    out.m_75.z = _2162;
    out.m_75.w = _2126;
    int _2172 = int(_2066) + int(_2146);
    float _2174 = _922 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2176 = !_1633;
    int _2178 = _2176 ? _2156 : (-1);
    float _2180 = -_916;
    float _2182 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2122);
    bool _2184 = _1168 <= 8000.0;
    bool _2186 = isnan(_1168);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(8000.0);
    bool _2192 = _2188 || _2190;
    float _2194 = float(_2192);
    int _2196 = _2170 * _2172;
    int _2198 = _2196 + _1812;
    int _2200 = _2178 >> 31;
    int _2202 = _2178 & 3;
    bool _2204 = _2202 != 0;
    int _2206 = _2200 & 3;
    float _2208 = fma(_2164, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2210 = precise::clamp(_2208, 0.0, 1.0);
    float _2212 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2182);
    float _2214 = -_916;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2118);
    int _2218 = _2178 + _2206;
    float _2220 = -_916;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2174);
    bool _2224 = uint(_2198) >= uint(_552);
    float _2226 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    int _2228 = _2218 >> 2;
    float _2230 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2222);
    float _2232 = _932 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2234 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2236 = _2228 << 4;
    int _2238 = _2236 + 368;
    float _2240 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2242 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2232);
    float _2244 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2234);
    uint _2246 = uint(int(uint(_2238) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    int _2254 = int(_2246) + 1;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    int _2258 = _2254 & 3;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[int(_2256)][_2258];
    float _2262 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2240);
    float _2266 = _932 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2268 = _932 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2270 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    int _2272 = _2178 & 3;
    bool _2274 = _2272 != 0;
    float _2276 = _2226 * _2090;
    int _2278 = _2238 + 8;
    uint _2280 = uint(int(uint(_2278) >> uint(2)));
    uint _2282 = uint(int(uint(int(_2280)) >> uint(2)));
    int _2284 = int(_2280) & 3;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[int(_2282)][_2284];
    int _2288 = int(_2280) + 1;
    uint _2290 = uint(int(uint(_2288) >> uint(2)));
    int _2292 = _2288 & 3;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[int(_2290)][_2292];
    int _2296 = _2204 ? 0 : 1;
    float _2298 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    bool _2300 = uint(_2272) > 1u;
    float _2302 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2268);
    bool _2304 = _2272 != 3;
    float _2306 = _2212 * _2090;
    bool _2308 = !_2224;
    int _2310 = _2308 ? 0 : (-1);
    float _2312 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2298);
    bool _2314 = uint(_2272) >= 2u;
    float _2316 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2242);
    int _2318 = ~_2296;
    int _2320 = _2318 + 1;
    int _2322 = _2320 + 1;
    float _2324 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2302);
    int _2326 = ~_2172;
    int _2328 = _2326 + _2310;
    int _2330 = _2328 + 1;
    float _2332 = _2230 * _2090;
    int _2334 = _2314 ? 0 : 1;
    float _2336 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    int _2338 = _2322;
    if (!_2300)
    {
        int _2340 = ~_2296;
        int _2342 = _2340 + 1;
        _2338 = _2342;
    }
    int _2344 = _2338;
    float _2346 = fma(_2316, _2094, _2306);
    bool _2348 = !_2274;
    int _2350 = _2348 ? 0 : 1;
    float _2352 = fma(_2312, _2094, _2276);
    int _2354 = abs(_2344);
    float _2356 = fma(_2324, _2094, _2332);
    int _2358 = ~_2334;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = fma(_2336, _2100, _2352);
    bool _2366 = _2272 != 3;
    float _2368 = in.m_77.x;
    int _2370 = _2362;
    if (_2304)
    {
        int _2372 = ~_2334;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    int _2378 = _552 * _2330;
    int _2380 = _2378 + _1812;
    float _2382 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    int _2384 = abs(_2350);
    float _2386 = -_1586;
    float _2388 = _2386 + 1.0;
    bool _2390 = !_2366;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = fma(_2382, _2100, _2346);
    int _2396 = abs(_2376);
    float _2398 = _1666 * _1604;
    int _2400 = ~_2354;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    float _2406 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    int _2408 = abs(_2392);
    float _2410 = -_1666;
    float _2412 = _2410 + 1.0;
    bool _2414 = !_1862;
    int _2416 = _2414 ? 0 : 1;
    int _2418 = _2404 * as_type<int>(_2260);
    int _2420 = ~_2384;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    float _2426 = _1516 * 0.5;
    int _2428 = _2424 * as_type<int>(_2252);
    int _2430 = _2428 + _2418;
    float _2432 = fma(_2210, -2.0, 3.0);
    int _2434 = abs(_2416);
    float _2436 = _2210 * _2210;
    float _2438 = _1625 * _2398;
    int _2440 = ~_2396;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    float _2446 = _2436 * _2432;
    int _2448 = ~_2408;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    float _2454 = fma(_2406, _2100, _2356);
    int _2456 = _2444 * as_type<int>(_2286);
    int _2458 = _2456 + _2430;
    float _2460 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2462 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2464 = isnan(_1314);
    bool _2466 = _2462 || _2464;
    bool _2468 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2470 = _2466 || _2468;
    out.m_79.x = _2394;
    out.m_79.y = _2364;
    out.m_79.z = _2454;
    int _2472 = _2452 * as_type<int>(_2294);
    int _2474 = _2472 + _2458;
    float _2476 = -_2446;
    float _2478 = _2476 + 1.0;
    int _2480 = ~_2434;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2460);
    bool _2488 = !_1633;
    int _2490 = _2488 ? _2380 : (-1);
    float _2492 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2446);
    int _2494 = _2474 * _2484;
    float _2496 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2486);
    float _2498 = _2194 * _2492;
    int _2500 = _2490 * _2434;
    int _2502 = _2500 + _2494;
    float _2504 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2496);
    float _2506 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2508 = _1568 + _1516;
    float _2510 = fma(_1572, -0.5, _2426);
    float _2512 = float(_2502);
    float _2514 = _2388 * _2506;
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    out.gl_Position.x = _1568;
    out.gl_Position.y = _1572;
    out.gl_Position.z = _2504;
    out.gl_Position.w = _1516;
    float _2518 = _2504 + _1516;
    float _2520 = _2508 * 0.5;
    float _2522 = -_2516;
    float _2524 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2512;
    float _2526 = _1615 * _2412;
    float _2528 = _2518 * 0.5;
    float _2530 = _2524 * _2368;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2534 = fma(_1615, _2438, _1613);
    out.m_83.x = _2520;
    out.m_83.y = _2510;
    out.m_83.z = _2528;
    out.m_83.w = _1516;
    float _2536 = _1615 * _2398;
    float _2538 = _2504;
    float _2540 = _2536;
    float _2542 = _2510;
    float _2544 = _2520;
    if (!_2470)
    {
        _1832 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2546 = _1832;
    out.m_85.x = _2532;
    float _2548 = fma(_1621, _2536, _1609);
    float _2550 = fma(_1623, _2536, _1611);
    float _2552 = _2546;
    float _2554 = _2546;
    if (!_2470)
    {
        _2538 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2556 = _2538;
    float _2558 = _2556;
    float _2560 = _2556;
    if (!_2470)
    {
        _1834 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2562 = _1834;
    out.m_87.x = _2548;
    out.m_87.y = _2550;
    out.m_87.z = _2534;
    out.m_87.w = _2526;
    float _2564 = _2562;
    float _2566 = _2562;
    if (!_2470)
    {
        _2540 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2568 = _2540;
    float _2570 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2572 = _2568;
    float _2574 = _2568;
    if (!_2470)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2576 = _2542;
    float _2578 = _2576;
    float _2580 = _2576;
    if (!_2470)
    {
        _2544 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2582 = _2544;
    bool _2584 = !_2470;
    float _2586 = _2582;
    float _2588 = _2582;
    if (!_2584)
    {
        bool _2590 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2592 = isnan(_1314);
        bool _2594 = _2590 || _2592;
        bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2598 = _2594 || _2596;
        if (!_2598)
        {
            float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2602 = _1314 + _2600;
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2606 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2604;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2612 = 1.0 / _2606;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2630 = _2602 * _2612;
            float _2632 = precise::clamp(_2630, 0.0, 1.0);
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2638 = fma(_2632, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2640 = fma(_2632, _2636, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2642 = fma(_2632, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2644 = fma(_2632, _2620, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2646 = fma(_2632, _2624, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2648 = fma(_2632, _2628, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2588 = _2642;
            _2566 = _2646;
            _2580 = _2638;
            _2560 = _2644;
            _2554 = _2640;
            _2574 = _2648;
            _2650 = true;
        }
        else
        {
            bool _2652 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2654 = isnan(_1314);
            bool _2656 = _2652 || _2654;
            bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2660 = _2656 || _2658;
            if (!_2660)
            {
                _2578 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2662 = _2578;
            _2580 = _2662;
            if (!_2660)
            {
                _2586 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2664 = _2586;
            _2588 = _2664;
            if (!_2660)
            {
                _2552 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2666 = _2552;
            _2554 = _2666;
            if (!_2660)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2668 = _2558;
            _2560 = _2668;
            if (!_2660)
            {
                _2564 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2670 = _2564;
            _2566 = _2670;
            if (!_2660)
            {
                _2572 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2672 = _2572;
            bool _2674 = !_2660;
            _2574 = _2672;
            if (!_2674)
            {
                bool _2676 = _1314 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2678 = isnan(_1314);
                bool _2680 = _2676 || _2678;
                bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2684 = _2680 || _2682;
                if (!_2684)
                {
                    float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2688 = _1314 + _2686;
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2692 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2690;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2698 = 1.0 / _2692;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2716 = _2688 * _2698;
                    float _2718 = precise::clamp(_2716, 0.0, 1.0);
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2724 = fma(_2718, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2726 = fma(_2718, _2722, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2728 = fma(_2718, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2730 = fma(_2718, _2706, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2732 = fma(_2718, _2710, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2734 = fma(_2718, _2714, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2588 = _2728;
                    _2566 = _2732;
                    _2580 = _2724;
                    _2560 = _2730;
                    _2554 = _2726;
                    _2574 = _2734;
                    _2650 = true;
                }
                else
                {
                    _2588 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2566 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2580 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2554 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2574 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2650 = false;
    float _2736 = _2588;
    float _2738 = _2566;
    float _2740 = _2580;
    float _2742 = _2560;
    float _2744 = _2554;
    float _2746 = _2574;
    float _2748 = fma(_2364, -0.5, 0.5);
    float _2750 = precise::clamp(_2748, 0.0, 1.0);
    float _2752 = -_2736;
    float _2754 = _2752 + _2738;
    float _2756 = _2570 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2758 = -_2740;
    float _2760 = _2758 + _2742;
    float _2762 = fma(_2750, _2754, _2736);
    out.m_89.x = 0.0;
    float _2764 = -_2744;
    float _2766 = _2764 + _2746;
    float _2768 = fma(_2750, _2760, _2740);
    float _2770 = _2762 * 0.586610972881317138671875;
    out.m_53.x = _2756;
    bool _2772 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2774 = fma(_2750, _2766, _2744);
    float _2776 = fma(_2768, 0.298911988735198974609375, _2770);
    bool _2778 = _1286 > 0.0;
    bool _2780 = isnan(_1286);
    bool _2782 = _2778 || _2780;
    bool _2784 = isnan(0.0);
    bool _2786 = _2782 || _2784;
    float _2788 = fma(_2774, 0.114477999508380889892578125, _2776);
    float _2790 = -_2788;
    float _2792 = _2768 + _2790;
    float _2794 = -_2788;
    float _2796 = _2762 + _2794;
    float _2798 = -_2788;
    float _2800 = _2774 + _2798;
    float _2802 = fma(_2792, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2804 = fma(_2796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2806 = fma(_2800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    bool _2808 = !_2772;
    if (!_2808)
    {
        float _2810 = -_1224;
        float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2814 = -_1226;
        float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2818 = -_1228;
        float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2822 = _2812 * _2812;
        float _2824 = fma(_2816, _2816, _2822);
        float _2826 = fma(_2820, _2820, _2824);
        float _2828 = sqrt(_2826);
        float _2830 = rsqrt(_2826);
        float _2832 = -_2828;
        float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2836 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2838 = precise::clamp(_2836, 0.0, 1.0);
        float _2840 = _2816 * _2830;
        float _2842 = _2812 * _2830;
        float _2844 = abs(_2838);
        float _2846 = log2(_2844);
        float _2848 = _2820 * _2830;
        float _2850 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2852 = _2364 * _2842;
        float _2854 = -_2842;
        float _2856 = -_2850;
        float _2858 = fma(_2854, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2856);
        float _2860 = fma(_2394, _2840, _2852);
        float _2862 = -_2848;
        float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2858);
        float _2866 = fma(_2454, _2848, _2860);
        float _2868 = precise::clamp(_2866, 0.0, 1.0);
        float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2872 = _2864 + _2870;
        float _2874 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2876 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2878 = precise::clamp(_2876, 0.0, 1.0);
        float _2880 = exp2(_2874);
        float _2882 = _2880 * _2878;
        float _2884 = _2868 * _2882;
        float _2886 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2890 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2886;
        out.m_89.y = _2888;
        out.m_89.z = _2890;
    }
    out.m_91.x = _2802;
    out.m_91.y = _2804;
    out.m_91.z = _2806;
    if (_2786)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2892 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2892;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

