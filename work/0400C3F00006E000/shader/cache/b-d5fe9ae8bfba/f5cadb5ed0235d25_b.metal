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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 m_97 [[user(locn15)]];
    float4 m_99 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(0)]];
    float4 m_73 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_81 [[attribute(5)]];
    float4 m_79 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_83 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5358 = false;
    bool _714 = false;
    bool _610 = false;
    bool _456 = false;
    bool _234 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _5665 = as_type<float>(_140);
        out.gl_Position.z = _5665;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_53.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_122);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_51.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5734 = as_type<float>(_178);
        out.gl_Position.z = _5734;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_55.x;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_55.y;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    out.m_59.x = _180;
    out.m_59.y = _184;
    float _192 = _188 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _194 = _188 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _196 = _188 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].x, _192);
    float _200 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].x, _194);
    float _202 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _204 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[4].z, _198);
    float _206 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[5].z, _200);
    float _208 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[6].z, _202);
    bool _210 = !_182;
    float _212 = _184;
    float _214 = _180;
    float _232;
    if (!_210)
    {
        float _216 = in.m_61.x;
        float _218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _220 = _216 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _224 = _222 * _218;
        float _226 = floor(_224);
        float _228 = -_226;
        float _230 = _224 + _228;
        _232 = _230;
        _234 = true;
    }
    else
    {
        float _236 = float(_122);
        float _238 = 1.0 / _236;
        float _240 = _158 * _238;
        _232 = _240;
    }
    _234 = false;
    float _242 = _232;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = _242 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _242 + _248;
    bool _252 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _254 = isnan(_242);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = _242 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = 1.0 / _266;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _284 = 1.0 / _278;
    float _286 = 1.0 / _274;
    float _288 = _246 * _280;
    bool _290 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_242);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -_262;
    float _304 = _302 + 1.0;
    float _306 = _300 * _304;
    float _308 = _250 * _284;
    bool _310 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _312 = isnan(_242);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    bool _326 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_242);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = -_300;
    float _344 = _342 + 1.0;
    float _346 = -_320;
    float _348 = _346 + 1.0;
    float _350 = _270 * _286;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _356;
    float _360 = _336 * _348;
    float _362 = fma(_324, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = fma(_354, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_358, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _368 = _320 * _344;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = _364 * _360;
    float _376 = _366 * _360;
    float _378 = _362 * _360;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _376);
    float _390 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _392 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _378);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _394;
    float _398 = fma(_340, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _400 = fma(_386, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _402 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _408;
    float _412 = fma(_398, _368, _388);
    float _414 = fma(_396, _288, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _416 = fma(_406, _288, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _418 = fma(_410, _288, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _420 = fma(_400, _368, _390);
    float _422 = fma(_402, _368, _392);
    float _424 = fma(_414, _306, _412);
    float _426 = fma(_416, _306, _420);
    float _428 = fma(_418, _306, _422);
    float _430 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].x, _424);
    float _432 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].y, _426);
    float _434 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].z, _428);
    bool _436 = !_282;
    float _454;
    if (!_436)
    {
        float _438 = in.m_61.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_122);
        float _460 = 1.0 / _458;
        float _462 = _158 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _464 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_464);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_464);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _526 = _500 * _522;
    float _528 = -_500;
    float _530 = _528 + 1.0;
    float _532 = 1.0 / _488;
    float _534 = _504 * _518;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _540 = fma(_534, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _542 = _538 * _532;
    float _544 = _540 * _526;
    float _546 = -_516;
    float _548 = _546 + 1.0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _552 = _464 + _550;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _556 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[115].x, _544);
    float _558 = _484 * _548;
    float _560 = fma(_542, _552, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = _554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = fma(_560, _558, _556);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _568 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _564);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _576 = in.m_63.x;
    float _578 = in.m_63.y;
    float _580 = in.m_63.z;
    float _582 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _572;
    out.m_65.y = _582;
    out.m_65.z = _562;
    out.m_65.w = _574;
    float _584 = _434 * _580;
    float _586 = _432 * _578;
    float _588 = _430 * _576;
    bool _590 = !_524;
    float _608;
    if (!_590)
    {
        float _592 = in.m_61.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_122);
        float _614 = 1.0 / _612;
        float _616 = _158 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    bool _620 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _622 = isnan(_618);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _636 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _654 = _618 + _652;
    float _656 = -_630;
    float _658 = _656 + 1.0;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _662 = 1.0 / _634;
    float _664 = _646 * _658;
    float _666 = -_646;
    float _668 = _666 + 1.0;
    float _670 = _650 * _662;
    float _672 = fma(_670, _654, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _674 = _672 * _664;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[131].x, _674);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[132].x, _680);
    float _688 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _686 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _684;
    out.m_67.y = _690;
    out.m_67.z = _688;
    out.m_67.w = _692;
    bool _694 = !_660;
    float _712;
    if (!_694)
    {
        float _696 = in.m_61.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_122);
        float _718 = 1.0 / _716;
        float _720 = _158 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _726 = int(_724);
    float _728 = in.m_61.x;
    float _730 = float(_122);
    float _732 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = in.m_61.y;
    float _736 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _738 = int(_736);
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _744 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _746 = isnan(_722);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _760 = float(_726);
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _764 = int(_762);
    bool _766 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _768 = isnan(_722);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = float(_738);
    float _780 = 1.0 / _760;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _782;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _788 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[88].z, _786);
    float _790 = float(uint(_764));
    float _792 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _794 = int(_792);
    int _796 = ~_764;
    int _798 = _796 + 1;
    bool _800 = _764 == 0;
    float _802 = _780 * _158;
    float _804 = 1.0 / _778;
    float _806 = 1.0 / _790;
    float _808 = float(uint(_794));
    int _810 = ~_794;
    int _812 = _810 + 1;
    int _814 = ~_794;
    int _816 = _814 + 1;
    float _818 = trunc(_802);
    int _820 = int(_818);
    float _822 = _804 * _158;
    int _824 = ~_764;
    int _826 = _824 + 1;
    int _828 = as_type<int>(_806) + (-2);
    float _830 = 1.0 / _808;
    float _832 = float(uint(_820));
    float _834 = trunc(_822);
    int _836 = int(_834);
    float _838 = as_type<float>(_828) * _832;
    int _840 = as_type<int>(_830) + (-2);
    float _842 = 1.0 / _730;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _846 = _844 != 0;
    float _848 = float(uint(_836));
    float _850 = trunc(_838);
    float _852 = precise::max(_850, 0.0);
    uint _855 = uint(_852);
    float _857 = as_type<float>(_840) * _848;
    float _859 = trunc(_857);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    float _865 = _728;
    if (_846)
    {
        _130 = 1.0;
    }
    float _867 = _130;
    float _869 = _867;
    if (!_846)
    {
        _869 = 7.345489978790283203125;
    }
    float _871 = _869;
    int _873 = _826 * int(_855);
    int _875 = _873 + _820;
    float _877 = float(_820);
    float _879 = 1.0 / _758;
    float _881 = float(uint(_875));
    float _883 = _871 * _728;
    float _885 = as_type<float>(_828) * _881;
    int _887 = ~_794;
    int _889 = _887 + 1;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _893 = _889 * int(_863);
    int _895 = _893 + _836;
    float _897 = trunc(_885);
    float _899 = precise::max(_897, 0.0);
    uint _901 = uint(_899);
    float _903 = float(uint(_895));
    float _905 = as_type<float>(_840) * _903;
    float _907 = _903;
    float _909 = as_type<float>(_855);
    if (_846)
    {
        _907 = 1.0;
    }
    float _911 = _907;
    float _913 = floor(_883);
    float _915 = _911;
    if (!_846)
    {
        _915 = 1.2345600128173828125;
    }
    float _917 = _915;
    int _919 = int(_855) + int(_901);
    float _921 = trunc(_905);
    float _923 = precise::max(_921, 0.0);
    uint _925 = uint(_923);
    float _927 = float(_764);
    if (_846)
    {
        _909 = _728;
    }
    float _929 = _909;
    int _931 = _798 * _919;
    int _933 = _931 + _820;
    bool _935 = _877 >= _927;
    bool _937 = isnan(_877);
    bool _939 = _935 || _937;
    bool _941 = isnan(_927);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = _929;
    if (!_846)
    {
        _947 = _734;
    }
    float _949 = _947;
    float _951 = -_913;
    float _953 = _883 + _951;
    bool _955 = uint(_933) >= uint(_764);
    float _957 = trunc(_945);
    int _959 = int(_957);
    float _961 = _949 * _917;
    bool _963 = !_955;
    int _965 = _963 ? 0 : (-1);
    int _967 = int(_863) + int(_925);
    float _969 = floor(_961);
    int _971 = ~_919;
    int _973 = _971 + _965;
    int _975 = _973 + 1;
    float _977 = _927 * _158;
    float _979 = float(_794);
    int _981 = _812 * _967;
    int _983 = _981 + _836;
    float _985 = _953 * _927;
    int _987 = _764 * _975;
    int _989 = _987 + _820;
    float _991 = _977 * _842;
    float _993 = _979 * _158;
    int _995 = ~_959;
    int _997 = _995 + 1;
    int _999 = _997 + 1;
    float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1003 = !_800;
    int _1005 = _1003 ? _989 : (-1);
    float _1007 = _993 * _842;
    bool _1009 = uint(_983) >= uint(_794);
    int _1011 = _1005 * _999;
    bool _1013 = !_1009;
    int _1015 = _1013 ? 0 : (-1);
    float _1017 = -_969;
    float _1019 = _961 + _1017;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1027 = _1025 != 0;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1031 = _1029 != 0;
    float _1033 = trunc(_985);
    int _1035 = int(_1033);
    int _1037 = _764 + (-1);
    float _1039 = _979 * _1019;
    int _1041 = ~_967;
    int _1043 = _1041 + _1015;
    int _1045 = _1043 + 1;
    int _1047 = _959 * _1037;
    int _1049 = _1047 + _1011;
    bool _1051 = !_1027;
    int _1053 = _1051 ? 0 : 1;
    float _1055 = trunc(_991);
    int _1057 = int(_1055);
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1061 = _1059 != 0;
    float _1063 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1065 = !_1023;
    int _1067 = _1065 ? 0 : 1;
    float _1069 = float(_836);
    int _1071 = abs(_1053);
    float _1073 = trunc(_1007);
    int _1075 = int(_1073);
    bool _1077 = !_1061;
    int _1079 = _1077 ? 0 : 1;
    bool _1081 = !_1031;
    int _1083 = _1081 ? 0 : 1;
    int _1085 = abs(_1067);
    bool _1087 = _1069 >= _979;
    bool _1089 = isnan(_1069);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan(_979);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = trunc(_1039);
    int _1101 = int(_1099);
    int _1103 = abs(_1079);
    int _1105 = abs(_1083);
    int _1107 = _1049 * _1071;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1111 = _1109 != 0;
    float _1113 = trunc(_1097);
    int _1115 = int(_1113);
    int _1117 = _1035 * _1103;
    int _1119 = _1117 + _820;
    bool _1121 = !_1111;
    int _1123 = _1121 ? 0 : 1;
    float _1125 = in.m_61.z;
    int _1127 = _1057 * _1085;
    int _1129 = _1127 + _1107;
    int _1131 = abs(_1123);
    int _1133 = _794 * _1045;
    int _1135 = _1133 + _836;
    bool _1137 = _794 == 0;
    int _1139 = _1119 * _1105;
    int _1141 = _1139 + _1129;
    int _1143 = ~_794;
    int _1145 = _1143 + 1;
    bool _1147 = !_1137;
    int _1149 = _1147 ? _1135 : (-1);
    int _1151 = _1035 * _1131;
    int _1153 = _1151 + _1141;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1161 = _1159 != 0;
    int _1163 = ~_1115;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = float(uint(_1153));
    bool _1171 = !_1161;
    int _1173 = _1171 ? 0 : 1;
    int _1175 = _1167 * _1149;
    int _1177 = _794 + (-1);
    float _1179 = as_type<float>(_828) * _1169;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1183 = _1181 != 0;
    int _1185 = abs(_1173);
    int _1187 = _1115 * _1177;
    int _1189 = _1187 + _1175;
    bool _1191 = !_1183;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = trunc(_1179);
    float _1197 = precise::max(_1195, 0.0);
    uint _1199 = uint(_1197);
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1203 = _1201 != 0;
    int _1205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1207 = _1205 != 0;
    int _1209 = _1189 * _1185;
    bool _1211 = !_1157;
    int _1213 = _1211 ? 0 : 1;
    int _1215 = abs(_1193);
    bool _1217 = !_1203;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = abs(_1213);
    bool _1223 = !_1207;
    int _1225 = _1223 ? 0 : 1;
    int _1227 = _1075 * _1221;
    int _1229 = _1227 + _1209;
    int _1231 = ~_764;
    int _1233 = _1231 + 1;
    int _1235 = _1101 * _1215;
    int _1237 = _1235 + _836;
    int _1239 = abs(_1219);
    int _1241 = abs(_1225);
    int _1243 = _1233 * int(_1199);
    int _1245 = _1243 + _1153;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1249 = _1247 != 0;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1253 = _1251 != 0;
    int _1255 = _1237 * _1239;
    int _1257 = _1255 + _1229;
    float _1259 = float(uint(_1245));
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1263 = _1261 != 0;
    int _1265 = _1101 * _1241;
    int _1267 = _1265 + _1257;
    bool _1269 = _764 == 0;
    float _1271 = as_type<float>(_828) * _1259;
    float _1273 = float(uint(_1119));
    float _1275 = in.m_61.w;
    float _1277 = float(uint(_1267));
    bool _1279 = _1157;
    int _1281 = _1071;
    if (_1249)
    {
        bool _1283 = _728 > 0.5;
        _1279 = _1283;
    }
    bool _1285 = _1279;
    float _1287 = trunc(_1271);
    float _1289 = precise::max(_1287, 0.0);
    uint _1291 = uint(_1289);
    float _1293 = 0.0;
    if (!_1249)
    {
        _1293 = _180;
    }
    float _1295 = _1293;
    float _1297 = as_type<float>(_840) * _1277;
    float _1299 = _1295;
    if (_1253)
    {
        float _1301 = -_180;
        float _1303 = _1301 + 1.0;
        _1281 = as_type<int>(_1303);
    }
    int _1305 = _1281;
    float _1307 = 0.0;
    if (!_1253)
    {
        _1307 = _180;
    }
    float _1309 = _1307;
    float _1311 = as_type<float>(_828) * _1273;
    float _1313 = trunc(_1297);
    float _1315 = precise::max(_1313, 0.0);
    uint _1317 = uint(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1323 = int(_1199) + int(_1291);
    int _1325 = int(_1291);
    float _1327 = _1309;
    if (_1249)
    {
        float _1329 = -_180;
        float _1331 = _1329 + 1.0;
        _1325 = as_type<int>(_1331);
    }
    int _1333 = _1325;
    float _1335 = trunc(_1311);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    int _1341 = _1233 * _1323;
    int _1343 = _1341 + _1153;
    if (_1249)
    {
        float _1345 = _1285 ? as_type<float>(_1333) : _180;
        _1299 = _1345;
    }
    float _1347 = _1299;
    float _1349 = -_184;
    float _1351 = _1349 + 1.0;
    int _1353 = _1145 * int(_1317);
    int _1355 = _1353 + _1267;
    bool _1357 = _734 > 0.5;
    float _1359 = 1.0 / _1321;
    bool _1361 = uint(_1343) >= uint(_764);
    float _1363 = float(uint(_1355));
    bool _1365 = !_1361;
    int _1367 = _1365 ? 0 : (-1);
    bool _1369 = _1125 > 0.5;
    float _1371 = as_type<float>(_840) * _1363;
    int _1373 = _1357 ? as_type<int>(_1351) : as_type<int>(_184);
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1377 = _1375 != 0;
    float _1379 = trunc(_1371);
    float _1381 = precise::max(_1379, 0.0);
    uint _1383 = uint(_1381);
    float _1385 = _1263 ? as_type<float>(_1373) : _184;
    bool _1387 = _1275 > 0.5;
    int _1389 = ~_1323;
    int _1391 = _1389 + _1367;
    int _1393 = _1391 + 1;
    if (_1253)
    {
        float _1395 = _1369 ? as_type<float>(_1305) : _180;
        _1327 = _1395;
    }
    float _1397 = _1327;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1401 = _1399 != 0;
    int _1403 = _764 * _1393;
    int _1405 = _1403 + _1153;
    int _1407 = _1387 ? as_type<int>(_1351) : as_type<int>(_184);
    int _1409 = ~_794;
    int _1411 = _1409 + 1;
    float _1413 = _1401 ? as_type<float>(_1407) : _184;
    if (_1377)
    {
        float _1415 = _1369 ? _1351 : _184;
        _212 = _1415;
    }
    float _1417 = _212;
    bool _1419 = !_1269;
    int _1421 = _1419 ? _1405 : (-1);
    int _1423 = int(_1317) + int(_1383);
    float _1425 = fma(_1063, _1417, -0.5);
    int _1427 = _1421 & 3;
    bool _1429 = _1427 != 0;
    int _1431 = _1421 & 3;
    bool _1433 = _1431 != 0;
    int _1435 = _1411 * _1423;
    int _1437 = _1435 + _1267;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1441 = _1439 != 0;
    bool _1443 = uint(_1427) >= 2u;
    int _1445 = _1433 ? 0 : 1;
    bool _1447 = _734 > 0.5;
    bool _1449 = _1447 && _1441;
    int _1451 = _1443 ? 0 : 1;
    bool _1453 = uint(_1437) >= uint(_794);
    bool _1455 = !_1453;
    int _1457 = _1455 ? 0 : (-1);
    bool _1459 = uint(_1427) > 1u;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1463 = _1461 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1465 = ~_1423;
    int _1467 = _1465 + _1457;
    int _1469 = _1467 + 1;
    float _1471 = 0.0;
    if (!_1441)
    {
        _1471 = _180;
    }
    float _1473 = _1471;
    float _1475 = _1473;
    if (_1449)
    {
        float _1477 = -_180;
        float _1479 = _1477 + 1.0;
        _214 = _1479;
    }
    float _1481 = _214;
    bool _1483 = _1427 != 3;
    int _1485 = _794 * _1469;
    int _1487 = _1485 + _1267;
    int _1489 = ~_1445;
    int _1491 = _1489 + 1;
    int _1493 = _1491 + 1;
    float _1495 = 1.0 / _1463;
    bool _1497 = !_1137;
    int _1499 = _1497 ? _1487 : (-1);
    int _1501 = _1493;
    if (!_1459)
    {
        int _1503 = ~_1445;
        int _1505 = _1503 + 1;
        _1501 = _1505;
    }
    int _1507 = _1501;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1513 = ~_1451;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    int _1519 = _1499 & 3;
    bool _1521 = _1519 != 0;
    float _1523 = 1.0 / _1511;
    int _1525 = _1517;
    if (_1483)
    {
        int _1527 = ~_1451;
        int _1529 = _1527 + 1;
        _1525 = _1529;
    }
    int _1531 = _1525;
    float _1533 = _1125 * 2.0;
    bool _1535 = _1519 != 3;
    if (_1441)
    {
        _1475 = _1481;
    }
    float _1537 = _1475;
    float _1539 = _728 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1541 = uint(_1519) >= 2u;
    float _1543 = floor(_1533);
    int _1545 = _1521 ? 0 : 1;
    float _1547 = -_740;
    float _1549 = fma(_1539, 2.0, _1547);
    int _1551 = _1541 ? 0 : 1;
    float _1553 = _734 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1555 = ~_1545;
    int _1557 = _1555 + 1;
    int _1559 = _1557 + 1;
    float _1561 = -_158;
    float _1563 = fma(_1561, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1549);
    int _1565 = ~_1551;
    int _1567 = _1565 + 1;
    int _1569 = _1567 + 1;
    float _1571 = fma(_1553, -2.0, _742);
    int _1573 = _1569;
    int _1575 = _1559;
    if (_1535)
    {
        int _1577 = ~_1551;
        int _1579 = _1577 + 1;
        _1573 = _1579;
    }
    int _1581 = _1573;
    bool _1583 = uint(_1519) > 1u;
    float _1585 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1571);
    float _1587 = float(uint(_1237));
    int _1589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1591 = _1589 != 0;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1595 = _1593 != 0;
    float _1597 = as_type<float>(_840) * _1587;
    int _1599 = ~_764;
    int _1601 = _1599 + 1;
    float _1603 = trunc(_1597);
    float _1605 = precise::max(_1603, 0.0);
    uint _1607 = uint(_1605);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1609;
    if (!_1583)
    {
        int _1613 = ~_1545;
        int _1615 = _1613 + 1;
        _1575 = _1615;
    }
    int _1617 = _1575;
    int _1619 = _1601 * int(_1339);
    int _1621 = _1619 + _1119;
    bool _1623 = _1543 >= 0.0;
    bool _1625 = isnan(_1543);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan(0.0);
    bool _1631 = _1627 || _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1635 = _1633 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1637 = _1611 * _1523;
    float _1639 = _1631 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1643 = _1641 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1645 = _1543 > 0.0;
    float _1647 = _734 * 2.0;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1653 = float(uint(_1621));
    float _1655 = 1.0 / _1635;
    int _1657 = _816 * int(_1607);
    int _1659 = _1657 + _1237;
    float _1661 = _1643 * _1495;
    float _1663 = as_type<float>(_828) * _1653;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1667 = _1665 != 0;
    float _1669 = floor(_1647);
    float _1671 = float(uint(_1659));
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1675 = _1673 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1677;
    int _1681 = ~as_type<int>(_1639);
    int _1683 = _1681 + 1;
    int _1685 = _1683 + 1;
    float _1687 = as_type<float>(_840) * _1671;
    int _1689 = _1685;
    float _1691 = _1639;
    float _1693 = _1663;
    if (!_1645)
    {
        int _1695 = ~as_type<int>(_1639);
        int _1697 = _1695 + 1;
        _1689 = _1697;
    }
    int _1699 = _1689;
    float _1701 = 1.0 / _1651;
    float _1703 = _1679 * _1359;
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1709 = !_1591;
    int _1711 = _1709 ? 0 : 1;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1717 = ~_794;
    int _1719 = _1717 + 1;
    int _1721 = 0;
    float _1723 = _1715;
    if (_1667)
    {
        _1721 = 0;
    }
    int _1725 = _1721;
    float _1727 = trunc(_1663);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    bool _1733 = _1669 > 0.0;
    float _1735 = _1715 * _879;
    bool _1737 = _1669 >= 0.0;
    bool _1739 = isnan(_1669);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(0.0);
    bool _1745 = _1741 || _1743;
    int _1747 = _1725;
    float _1749 = _1669;
    if (!_1667)
    {
        _1747 = 2;
    }
    int _1751 = _1747;
    int _1753 = abs(_1507);
    float _1755 = 1.0 / _1675;
    float _1757 = _1707 * _1701;
    int _1759 = _1745 ? 0 : 1;
    int _1761 = ~_1759;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    float _1767 = trunc(_1687);
    float _1769 = precise::max(_1767, 0.0);
    uint _1771 = uint(_1769);
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1773;
    int _1777 = int(_1339) + int(_1731);
    int _1779 = _1765;
    int _1781 = as_type<int>(_1775);
    if (!_1733)
    {
        int _1783 = ~_1759;
        int _1785 = _1783 + 1;
        _1779 = _1785;
    }
    int _1787 = _1779;
    float _1789 = _1775 * _1655;
    if (_1667)
    {
        _1781 = 0;
    }
    int _1791 = _1781;
    int _1793 = _1791;
    if (!_1667)
    {
        _1793 = 1;
    }
    int _1795 = _1793;
    float _1797 = _784 * _1755;
    bool _1799 = _1795 != 1;
    int _1801 = ~_764;
    int _1803 = _1801 + 1;
    int _1805 = int(_1607) + int(_1771);
    int _1807 = _1803 * _1777;
    int _1809 = _1807 + _1119;
    float _1811 = _728 * 2.0;
    bool _1813 = uint(_1809) >= uint(_764);
    float _1815 = floor(_1811);
    if (!_1799)
    {
        _1723 = _734;
    }
    float _1817 = _1723;
    float _1819 = _1817;
    if (!_1799)
    {
        _1691 = _1125;
    }
    float _1821 = _1691;
    int _1823 = _1719 * _1805;
    int _1825 = _1823 + _1237;
    float _1827 = _1821;
    if (!_1799)
    {
        _1749 = _1817;
    }
    float _1829 = _1749;
    float _1831 = _728 + _734;
    float _1833 = _1829;
    if (!_1799)
    {
        _1693 = _1125;
    }
    float _1835 = _1693;
    float _1837 = _1835;
    if (_1799)
    {
        _1833 = _728;
    }
    float _1839 = _1833;
    float _1841 = _1831 + (-1.0);
    if (_1799)
    {
        _1819 = _728;
    }
    float _1843 = _1819;
    if (_1799)
    {
        _1827 = _734;
    }
    float _1845 = _1827;
    float _1847 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_1799)
    {
        _1837 = _734;
    }
    float _1849 = _1837;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1853 = _722 + _1851;
    bool _1855 = uint(_1825) >= uint(_794);
    float _1857 = _734 + _1125;
    bool _1859 = !_1813;
    int _1861 = _1859 ? 0 : (-1);
    float _1863 = fma(_1637, _1853, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1865 = !_1855;
    int _1867 = _1865 ? 0 : (-1);
    float _1869 = _1857 + (-1.0);
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1873 = _1871 != 0;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1877 = _1875 != 0;
    int _1879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1881 = _1879 != 0;
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1885 = _722 + _1883;
    bool _1887 = _1815 > 0.0;
    float _1889 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1891 = _1815 >= 0.0;
    bool _1893 = isnan(_1815);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(0.0);
    bool _1899 = _1895 || _1897;
    float _1901 = -_754;
    float _1903 = _1901 + 1.0;
    bool _1905 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1907 = isnan(_722);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1919 = _722 + _1917;
    bool _1921 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1923 = isnan(_722);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    float _1933 = fma(_1661, _1885, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1935 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1937 = isnan(_722);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = -_1915;
    float _1949 = _1947 + 1.0;
    float _1951 = _1915 * _1903;
    float _1953 = fma(_1703, _1919, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1955 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1957 = isnan(_722);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1963 = _1959 || _1961;
    float _1965 = float(_1963);
    float _1967 = _1931 * _1949;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1971 = _722 + _1969;
    float _1973 = -_1931;
    float _1975 = _1973 + 1.0;
    float _1977 = -_1945;
    float _1979 = _1977 + 1.0;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1983 = _722 + _1981;
    float _1985 = fma(_1757, _1971, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1987 = _1965 * _1975;
    bool _1989 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1991 = isnan(_722);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    float _2001 = _776 * _1979;
    float _2003 = -_1965;
    float _2005 = _2003 + 1.0;
    float _2007 = -_776;
    float _2009 = _2007 + 1.0;
    float _2011 = fma(_1735, _1983, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2013 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2015 = isnan(_722);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = _1945 * _2005;
    float _2027 = _1999 * _2009;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2031 = _722 + _2029;
    float _2033 = -_1999;
    float _2035 = _2033 + 1.0;
    int _2037 = _1899 ? 0 : 1;
    float _2039 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2041 = _1751 != 2;
    float _2043 = fma(_1789, _2031, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2047 = _722 + _2045;
    float _2049 = _2023 * _2035;
    float _2051 = -_2023;
    float _2053 = _2051 + 1.0;
    float _2055 = in.m_48.x;
    float _2057 = in.m_48.y;
    float _2059 = in.m_48.z;
    bool _2061 = !_1877;
    int _2063 = _2061 ? 0 : 1;
    float _2065 = _1863 * _2049;
    float _2067 = fma(_1797, _2047, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2069 = _891 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2071 = !_1873;
    int _2073 = _2071 ? 0 : 1;
    float _2075 = fma(_2053, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2065);
    int _2077 = ~_2037;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = in.m_69.y;
    int _2085 = _2081;
    float _2087 = _1933;
    if (!_1887)
    {
        int _2089 = ~_2037;
        int _2091 = _2089 + 1;
        _2085 = _2091;
    }
    int _2093 = _2085;
    float _2095 = fma(_1933, _2027, _2075);
    int _2097 = abs(_2063);
    float _2099 = fma(_2069, _1537, -0.5);
    float _2101 = float(_1699);
    float _2103 = fma(_1953, _2001, _2095);
    int _2105 = abs(_2073);
    float _2107 = float(_2097);
    float _2109 = fma(_1985, _2025, _2103);
    float _2111 = float(_2093);
    if (_2041)
    {
        _2087 = _728;
    }
    float _2113 = _2087;
    float _2115 = fma(_2043, _1987, _2109);
    float _2117 = float(_2105);
    float _2119 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2121 = _2107 * _2111;
    float _2123 = _2113;
    if (!_2041)
    {
        _2123 = _1125;
    }
    float _2125 = _2123;
    float _2127 = fma(_2055, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2119);
    float _2129 = _2117 * _2101;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2133 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2135 = _2057 + _2083;
    float _2137 = fma(_2059, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2127);
    float _2139 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2141 = fma(_2055, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2133);
    float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2145 = _2135 + _2143;
    float _2147 = _2137 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2149 = -_2131;
    float _2151 = fma(_2139, 2.0, _2149);
    int _2153 = _1421 >> 31;
    float _2155 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2159 = _2147 + _2157;
    float _2161 = fma(_2059, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2141);
    int _2163 = _1499 >> 31;
    float _2165 = -_158;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2151);
    bool _2169 = !_1429;
    int _2171 = _2169 ? 0 : 1;
    float _2173 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2155);
    int _2175 = _1499 & 3;
    bool _2177 = _2175 != 0;
    float _2179 = _2161 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2181 = _2153 & 3;
    float _2183 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2185 = _2163 & 3;
    float _2187 = fma(_2011, _1967, _2115);
    bool _2189 = !_2177;
    int _2191 = _2189 ? 0 : 1;
    int _2193 = _1421 + _2181;
    float _2195 = fma(_2067, _1951, _2187);
    bool _2197 = _1427 != 3;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2201 = _2179 + _2199;
    int _2203 = _1499 + _2185;
    float _2205 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2195);
    int _2207 = _2193 >> 2;
    float _2209 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2173);
    bool _2211 = !_2197;
    int _2213 = _2211 ? 0 : (-1);
    float _2215 = _732 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2217 = _1519 != 3;
    out.m_71.x = _2205;
    int _2219 = _2203 >> 2;
    int _2221 = _2207 << 4;
    int _2223 = _2221 + 368;
    bool _2225 = !_2217;
    int _2227 = _2225 ? 0 : (-1);
    int _2229 = _2219 << 4;
    int _2231 = _2229 + 512;
    bool _2233 = _2209 >= 0.0;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _2237 = uint(int(uint(_2223) >> uint(2)));
    uint _2239 = uint(int(uint(int(_2237)) >> uint(2)));
    int _2241 = int(_2237) & 3;
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[int(_2239)][_2241];
    int _2245 = int(_2237) + 1;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    int _2249 = _2245 & 3;
    float _2251 = (*spvDescriptorSet0.vp_c9)._m0[int(_2247)][_2249];
    float _2253 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2235);
    float _2255 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _788);
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2259 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2261 = uint(int(uint(_2231) >> uint(2)));
    uint _2263 = uint(int(uint(int(_2261)) >> uint(2)));
    int _2265 = int(_2261) & 3;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[int(_2263)][_2265];
    int _2269 = int(_2261) + 1;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    int _2273 = _2269 & 3;
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[int(_2271)][_2273];
    float _2277 = fma(_2255, _2099, _2167);
    float _2279 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2257);
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2283 = in.m_73.x;
    float _2285 = in.m_73.y;
    float _2287 = in.m_73.z;
    float _2289 = _2129 * (-2.0);
    float _2291 = _2121 * (-2.0);
    float _2293 = -_2281;
    float _2295 = fma(_2183, 2.0, _2293);
    int _2297 = _2223 + 8;
    uint _2299 = uint(int(uint(_2297) >> uint(2)));
    uint _2301 = uint(int(uint(int(_2299)) >> uint(2)));
    int _2303 = int(_2299) & 3;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[int(_2301)][_2303];
    int _2307 = int(_2299) + 1;
    uint _2309 = uint(int(uint(_2307) >> uint(2)));
    int _2311 = _2307 & 3;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[int(_2309)][_2311];
    float _2315 = _2183;
    float _2317 = _2147;
    if (_2233)
    {
        _2315 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2319 = _2315;
    float _2321 = fma(_1889, _2291, _1889);
    int _2323 = abs(_2171);
    float _2325 = fma(_2039, -2.0, _2259);
    int _2327 = ~_1777;
    int _2329 = _2327 + _1861;
    int _2331 = _2329 + 1;
    int _2333 = as_type<int>(_2319);
    if (_2233)
    {
        float _2335 = _2319 * 5.0;
        _2333 = as_type<int>(_2335);
    }
    int _2337 = _2333;
    int _2339 = _2231 + 8;
    uint _2341 = uint(int(uint(_2339) >> uint(2)));
    uint _2343 = uint(int(uint(int(_2341)) >> uint(2)));
    int _2345 = int(_2341) & 3;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[int(_2343)][_2345];
    int _2349 = int(_2341) + 1;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    int _2353 = _2349 & 3;
    float _2355 = (*spvDescriptorSet0.vp_c9)._m0[int(_2351)][_2353];
    int _2357 = _764 * _2331;
    int _2359 = _2357 + _1119;
    int _2361 = abs(_2191);
    if (_2233)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9006 = as_type<float>(_2337);
        out.gl_Position.z = _9006;
    }
    int _2363 = abs(_2213);
    float _2365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2367 = log2(_2365);
    int _2369 = ~_1805;
    int _2371 = _2369 + _1867;
    int _2373 = _2371 + 1;
    float _2375 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2279);
    int _2377 = abs(_2227);
    float _2379 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2253);
    bool _2381 = _764 == 0;
    float _2383 = fma(_2291, _2285, _2285);
    int _2385 = abs(_1617);
    float _2387 = fma(_2289, _2283, _2283);
    float _2389 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2391 = int(_2389);
    int _2393 = _794 * _2373;
    int _2395 = _2393 + _1237;
    int _2397 = ~_1753;
    int _2399 = _2397 + 1;
    int _2401 = _2399 + 1;
    float _2403 = -_158;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2295);
    int _2407 = ~_2385;
    int _2409 = _2407 + 1;
    int _2411 = _2409 + 1;
    float _2413 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2325);
    int _2415 = ~_2323;
    int _2417 = _2415 + 1;
    int _2419 = _2417 + 1;
    int _2421 = _2401 * as_type<int>(_2251);
    float _2423 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2425 = int(_2423);
    bool _2427 = _794 == 0;
    float _2429 = fma(_1847, _2289, _1847);
    int _2431 = _2419 * as_type<int>(_2243);
    int _2433 = _2431 + _2421;
    int _2435 = abs(_1531);
    if (_2233)
    {
        out.m_51.x = 0.0;
    }
    int _2437 = abs(_1581);
    int _2439 = _2411 * as_type<int>(_2275);
    int _2441 = ~_2361;
    int _2443 = _2441 + 1;
    int _2445 = _2443 + 1;
    int _2447 = ~_2435;
    int _2449 = _2447 + 1;
    int _2451 = _2449 + 1;
    float _2453 = float(uint(_2391));
    int _2455 = _2445 * as_type<int>(_2267);
    int _2457 = _2455 + _2439;
    int _2459 = ~_2363;
    int _2461 = _2459 + 1;
    int _2463 = _2461 + 1;
    int _2465 = _2451 * as_type<int>(_2305);
    int _2467 = _2465 + _2433;
    int _2469 = ~_2437;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    float _2475 = 1.0 / _2453;
    int _2477 = _2463 * as_type<int>(_2313);
    int _2479 = _2477 + _2467;
    bool _2481 = !_1595;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _2473 * as_type<int>(_2347);
    int _2487 = _2485 + _2457;
    int _2489 = abs(_1711);
    float _2491 = _2367 * _158;
    int _2493 = abs(_2483);
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2497 = 1.0 + _2495;
    bool _2499 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2501 = isnan(1.0);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2507 = _2503 || _2505;
    float _2509 = exp2(_2491);
    float _2511 = float(uint(_2425));
    int _2513 = abs(_2391);
    int _2515 = ~_2489;
    int _2517 = _2515 + 1;
    int _2519 = _2517 + 1;
    int _2521 = ~_2377;
    int _2523 = _2521 + 1;
    int _2525 = _2523 + 1;
    float _2527 = 1.0 / _2511;
    float _2529 = float(uint(_2513));
    int _2531 = _2479 * _2519;
    int _2533 = ~_2493;
    int _2535 = _2533 + 1;
    int _2537 = _2535 + 1;
    int _2539 = _2525 * as_type<int>(_2355);
    int _2541 = _2539 + _2487;
    bool _2543 = !_2381;
    int _2545 = _2543 ? _2359 : (-1);
    bool _2547 = !_2427;
    int _2549 = _2547 ? _2395 : (-1);
    float _2551 = 1.0 / _2529;
    int _2553 = _2537 * _2541;
    int _2555 = abs(_2425);
    int _2557 = _2545 * _2489;
    int _2559 = _2557 + _2531;
    int _2561 = as_type<int>(_2475) + (-2);
    int _2563 = _2549 * _2493;
    int _2565 = _2563 + _2553;
    float _2567 = float(uint(_2555));
    float _2569 = -_2509;
    float _2571 = _2569 + 1.0;
    float _2573 = float(uint(_2559));
    float _2575 = 1.0 / _2497;
    float _2577 = as_type<float>(_2531);
    if (_2041)
    {
        _2577 = _734;
    }
    float _2579 = _2577;
    float _2581 = as_type<float>(_2561) * _2573;
    int _2583 = as_type<int>(_2527) + (-2);
    float _2585 = _2579;
    if (!_2041)
    {
        _2585 = _728;
    }
    float _2587 = _2585;
    float _2589 = 1.0 / _2567;
    float _2591 = float(uint(_2565));
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2595 = abs(_2559);
    float _2597 = _2587 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2599 = as_type<int>(_2551) + (-2);
    float _2601 = as_type<float>(_2583) * _2591;
    int _2603 = abs(_2565);
    float _2605 = trunc(_2581);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    float _2611 = float(uint(_2595));
    float _2613 = fma(_2597, -2.0, _2593);
    float _2615 = _728 + (-0.5);
    int _2617 = ~_2391;
    int _2619 = _2617 + 1;
    float _2621 = as_type<float>(_2599) * _2611;
    float _2623 = float(uint(_2603));
    float _2625 = trunc(_2601);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    int _2631 = as_type<int>(_2589) + (-2);
    float _2633 = fma(_2615, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2387);
    float _2635 = _2145 * _2145;
    float _2637 = as_type<float>(_2631) * _2623;
    int _2639 = ~_2425;
    int _2641 = _2639 + 1;
    int _2643 = _2619 * int(_2609);
    int _2645 = _2643 + _2559;
    float _2647 = trunc(_2621);
    float _2649 = precise::max(_2647, 0.0);
    uint _2651 = uint(_2649);
    int _2653 = ~_2555;
    int _2655 = _2653 + 1;
    float _2657 = float(uint(_2645));
    float _2659 = fma(_2159, _2159, _2635);
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2663 = trunc(_2637);
    float _2665 = precise::max(_2663, 0.0);
    uint _2667 = uint(_2665);
    float _2669 = as_type<float>(_2561) * _2657;
    int _2671 = ~_2513;
    int _2673 = _2671 + 1;
    float _2675 = fma(_2201, _2201, _2659);
    float _2677 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2661);
    int _2679 = _2641 * int(_2629);
    int _2681 = _2679 + _2565;
    bool _2683 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2685 = isnan(0.0);
    bool _2687 = _2683 || _2685;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2691 = _2687 || _2689;
    float _2693 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2677);
    float _2695 = rsqrt(_2675);
    float _2697 = float(uint(_2681));
    int _2699 = _2673 * int(_2651);
    int _2701 = _2699 + _2595;
    float _2703 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2613);
    float _2705 = _2691 ? _2571 : 0.0;
    int _2707 = _2655 * int(_2667);
    int _2709 = _2707 + _2603;
    float _2711 = float(uint(_2701));
    float _2713 = as_type<float>(_2583) * _2697;
    float _2715 = trunc(_2669);
    float _2717 = precise::max(_2715, 0.0);
    uint _2719 = uint(_2717);
    float _2721 = float(uint(_2709));
    float _2723 = as_type<float>(_2599) * _2711;
    float _2725 = -_2703;
    float _2727 = fma(_2693, _1425, _2725);
    float _2729 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2733 = as_type<float>(_2631) * _2721;
    float _2735 = _2215 * _2695;
    float _2737 = trunc(_2713);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    float _2743 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2729);
    float _2745 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2731);
    int _2747 = ~_2391;
    int _2749 = _2747 + 1;
    float _2751 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2743);
    float _2753 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2745);
    if (_2507)
    {
        float _2755 = _2705 * _2575;
        _162 = _2755;
    }
    float _2757 = _162;
    float _2759 = trunc(_2723);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    float _2765 = _2145 * _2735;
    int _2767 = int(_2609) + int(_2719);
    float _2769 = _2159 * _2735;
    int _2771 = ~_2425;
    int _2773 = _2771 + 1;
    float _2775 = fma(_2429, _2757, _2633);
    int _2777 = ~_2555;
    int _2779 = _2777 + 1;
    float _2781 = trunc(_2733);
    float _2783 = precise::max(_2781, 0.0);
    uint _2785 = uint(_2783);
    int _2787 = int(_2629) + int(_2741);
    bool _2789 = _2425 == 0;
    int _2791 = _2773 * _2787;
    int _2793 = _2791 + _2565;
    int _2795 = int(_2651) + int(_2763);
    float _2797 = -_2765;
    float _2799 = _2145 + _2797;
    float _2801 = -_2769;
    float _2803 = _2159 + _2801;
    int _2805 = _2749 * _2767;
    int _2807 = _2805 + _2559;
    bool _2809 = uint(_2793) >= uint(_2425);
    float _2811 = _2799 * _2799;
    int _2813 = int(_2667) + int(_2785);
    float _2815 = fma(_2803, _2803, _2811);
    int _2817 = ~_2513;
    int _2819 = _2817 + 1;
    bool _2821 = uint(_2807) >= uint(_2391);
    bool _2823 = !_2821;
    int _2825 = _2823 ? 0 : (-1);
    int _2827 = _2819 * _2795;
    int _2829 = _2827 + _2595;
    bool _2831 = !_2809;
    int _2833 = _2831 ? 0 : (-1);
    int _2835 = _2779 * _2813;
    int _2837 = _2835 + _2603;
    int _2839 = ~_2767;
    int _2841 = _2839 + _2825;
    int _2843 = _2841 + 1;
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2847 = uint(_2829) >= uint(_2513);
    bool _2849 = uint(_2837) >= uint(_2555);
    int _2851 = _2559 ^ _2391;
    bool _2853 = !_2847;
    int _2855 = _2853 ? 0 : (-1);
    float _2857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2859 = _2391 == 0;
    bool _2861 = _2391 == 0;
    int _2863 = _2391 * _2843;
    int _2865 = _2863 + _2559;
    uint _2867 = uint(int(uint(_2851) >> uint(31)));
    int _2869 = _2565 ^ _2425;
    float _2871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2873 = ~_2787;
    int _2875 = _2873 + _2833;
    int _2877 = _2875 + 1;
    int _2879 = ~_2855;
    int _2881 = _2795 + _2879;
    int _2883 = _2881 + 1;
    int _2885 = ~int(_2867);
    int _2887 = _2885 + 1;
    int _2889 = _2425 * _2877;
    int _2891 = _2889 + _2565;
    bool _2893 = !_2849;
    int _2895 = _2893 ? 0 : (-1);
    float _2897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2899 = uint(int(uint(_2869) >> uint(31)));
    int _2901 = _2883 ^ _2887;
    int _2903 = ~_2895;
    int _2905 = _2813 + _2903;
    int _2907 = _2905 + 1;
    int _2909 = ~int(_2899);
    int _2911 = _2909 + 1;
    bool _2913 = !_2859;
    int _2915 = _2913 ? _2865 : (-1);
    int _2917 = ~_2887;
    int _2919 = _2917 + _2901;
    int _2921 = _2919 + 1;
    int _2923 = _2907 ^ _2911;
    bool _2925 = _2425 == 0;
    float _2927 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2929 = !_2789;
    int _2931 = _2929 ? _2891 : (-1);
    float _2933 = _2857 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2935 = float(_2915);
    float _2937 = fma(_2927, _1347, -0.5);
    int _2939 = ~_2911;
    int _2941 = _2939 + _2923;
    int _2943 = _2941 + 1;
    float _2945 = fma(_2933, _1397, -0.5);
    float _2947 = float(_2931);
    float _2949 = fma(_2927, _2935, _1563);
    bool _2951 = !_2861;
    int _2953 = _2951 ? _2921 : (-1);
    float _2955 = _2871 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2957 = !_2925;
    int _2959 = _2957 ? _2943 : (-1);
    float _2961 = fma(_2933, _2947, _2405);
    float _2963 = float(_2953);
    float _2965 = _2897 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2967 = float(_2959);
    float _2969 = fma(_1385, _2955, -0.5);
    float _2971 = fma(_2751, _2937, _2949);
    float _2973 = -_1585;
    float _2975 = fma(_2955, _2963, _2973);
    float _2977 = fma(_1413, _2965, -0.5);
    float _2979 = -_2413;
    float _2981 = fma(_2965, _2967, _2979);
    float _2983 = fma(_2375, _2945, _2961);
    float _2985 = fma(_2753, _2969, _2975);
    float _2987 = _2201 * _2735;
    float _2989 = fma(_2379, _2977, _2981);
    float _2991 = _2277 + 0.5;
    float _2993 = _2727 + 0.5;
    float _2995 = _2971 + 0.5;
    float _2997 = _2983 + 0.5;
    float _2999 = _2985 + 0.5;
    float _3001 = _2989 + 0.5;
    float _3003 = -_2987;
    float _3005 = _2201 + _3003;
    bool _3007 = !_1881;
    int _3009 = _3007 ? 0 : 1;
    out.m_75.x = _2991;
    out.m_75.y = _2993;
    float _3011 = fma(_3005, _3005, _2815);
    int _3013 = abs(_3009);
    out.m_77.x = _2995;
    out.m_77.y = _2999;
    out.m_77.z = _2997;
    out.m_77.w = _3001;
    if (_2233)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3015 = -_2765;
    float _3017 = _2135 + _3015;
    float _3019 = _734 + (-0.5);
    float _3021 = -_2769;
    float _3023 = _2147 + _3021;
    float _3025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3027 = _3017 + _3025;
    float _3029 = float(_1787);
    float _3031 = -_2987;
    float _3033 = _2179 + _3031;
    float _3035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3037 = _3023 + _3035;
    float _3039 = _3027 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3041 = float(_3013);
    float _3043 = fma(_3019, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2383);
    float _3045 = _728 + _1125;
    float _3047 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3049 = _3033 + _3047;
    float _3051 = fma(_3037, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3039);
    float _3053 = _3041 * _3029;
    float _3055 = _3045 + (-1.0);
    float _3057 = fma(_3049, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3051);
    float _3059 = _3053 * (-2.0);
    float _3061 = _1125 + (-0.5);
    float _3063 = fma(_3055, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3065 = fma(_2321, _2757, _3043);
    float _3067 = fma(_3059, _2287, _2287);
    bool _3069 = _3057 >= 0.0;
    float _3071 = fma(_3063, _3059, _3063);
    float _3073 = _2775 * 0.15915493667125701904296875;
    float _3075 = fma(_3061, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3067);
    float _3077 = _3065 * 0.15915493667125701904296875;
    float _3079 = sqrt(_3011);
    float _3081 = fma(_3071, _2757, _3075);
    float _3083 = _3081 * 0.15915493667125701904296875;
    float _3085 = _3053;
    int _3087 = as_type<int>(_3075);
    float _3089 = _3037;
    if (_3069)
    {
        _3085 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3091 = _3085;
    float _3093 = _3073 * 6.283185482025146484375;
    float _3095 = sin(_3093);
    if (_3069)
    {
        out.m_51.x = 0.0;
    }
    if (_3069)
    {
        float _3097 = _3091 * 5.0;
        _3087 = as_type<int>(_3097);
    }
    int _3099 = _3087;
    float _3101 = _3073 * 6.283185482025146484375;
    float _3103 = cos(_3101);
    if (_3069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10091 = as_type<float>(_3099);
        out.gl_Position.z = _10091;
    }
    float _3105 = _3077 * 6.283185482025146484375;
    float _3107 = sin(_3105);
    float _3109 = _3077 * 6.283185482025146484375;
    float _3111 = cos(_3109);
    float _3113 = _3083 * 6.283185482025146484375;
    float _3115 = sin(_3113);
    if (_3069)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3117 = in.m_79.x;
    float _3119 = in.m_79.y;
    float _3121 = in.m_79.z;
    float _3123 = _3083 * 6.283185482025146484375;
    float _3125 = cos(_3123);
    bool _3127 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _3129 = _3095 * _3107;
    bool _3131 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _3133 = _3103 * _3111;
    float _3135 = _2695 * _3079;
    float _3137 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3139 = fma(_3115, _3133, _3129);
    float _3141 = fma(_3115, _3129, _3133);
    float _3143 = _3103 * _3107;
    float _3145 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3147 = _3145 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3149 = _3135 * _3137;
    float _3151 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3153 = _3151 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3155 = _3103 * _3125;
    float _3157 = _732 * _3135;
    float _3159 = _3095 * _3111;
    float _3161 = _1385;
    float _3163 = _3159;
    if (_3127)
    {
        float _3165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _3161 = _3165;
    }
    float _3167 = _3161;
    float _3169 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3117);
    float _3173 = -_3143;
    float _3175 = fma(_3115, _3159, _3173);
    float _3177 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3179 = _3177 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3181 = -_3159;
    float _3183 = fma(_3115, _3143, _3181);
    float _3185 = _3171 * _3157;
    float _3187 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3189 = _3187 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3191 = _3091;
    float _3193 = _3179;
    float _3195 = _3183;
    if (_3131)
    {
        float _3197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _3191 = _3197;
    }
    float _3199 = _3191;
    float _3201 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_3127)
    {
        float _3203 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _3163 = _3203;
    }
    float _3205 = _3163;
    float _3207 = _3111 * _3125;
    float _3209 = _3095 * _3125;
    float _3211 = _3107 * _3125;
    float _3213 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3119);
    float _3215 = 1.0 / _3147;
    float _3217 = _3135 * _3169;
    if (_3131)
    {
        float _3219 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _865 = _3219;
    }
    float _3221 = _865;
    float _3223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3121);
    float _3225 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3227 = _3225 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3229 = _3213 * _3149;
    float _3231 = 1.0 / _3153;
    float _3233 = _3223 * _3217;
    float _3235 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3237 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3235;
    float _3239 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3241 = _3239 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3243 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3245 = _3243 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3247 = 1.0 / _3179;
    float _3249 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3251 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3249;
    float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3259 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _3257;
    float _3261 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3263 = _3261 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3265 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3267 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _3265;
    float _3269 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3271 = _3269 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3273 = 1.0 / _3189;
    if (_3127)
    {
        float _3275 = fma(_3205, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _3193 = _3275;
    }
    float _3277 = _3193;
    if (_3131)
    {
        float _3279 = fma(_3221, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _3201 = _3279;
    }
    float _3281 = _3201;
    float _3283 = _3167;
    float _3285 = _3281;
    if (_3127)
    {
        float _3287 = _3277 * _3167;
        _3283 = _3287;
    }
    float _3289 = _3283;
    float _3291 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3293 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3291;
    float _3295 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3297 = _3295 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3299 = _3293;
    if (_3131)
    {
        float _3301 = _3281 * _3199;
        _3285 = _3301;
    }
    float _3303 = _3285;
    float _3305 = 1.0 / _3227;
    float _3307 = _3237 * _3215;
    float _3309 = _3297 * _3231;
    float _3311 = _3251 * _3247;
    float _3313 = -_3229;
    float _3315 = _3115 * _3313;
    float _3317 = _3255 * _3273;
    float _3319 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _3319;
    float _3323 = _3277;
    if (_3127)
    {
        float _3325 = floor(_3289);
        _3323 = _3325;
    }
    float _3327 = _3323;
    float _3329 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3331 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _3329;
    float _3333 = _3155 * _3229;
    float _3335 = _3209 * _3229;
    float _3337 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3339 = _3337 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3341 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3343 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3341;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3349 = fma(_3175, _3185, _3335);
    float _3351 = 1.0 / _3245;
    float _3353 = _3293 * _3305;
    float _3355 = _3347;
    if (!_3127)
    {
        _3299 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3357 = _3299;
    float _3359 = fma(_3207, _3185, _3315);
    float _3361 = fma(_3141, _3233, _3349);
    float _3363 = fma(_3211, _3233, _3359);
    float _3365 = 1.0 / _3241;
    float _3367 = _3357;
    if (_3127)
    {
        float _3369 = -_3327;
        float _3371 = _3289 + _3369;
        _3367 = _3371;
    }
    float _3373 = _3367;
    float _3375 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3377 = _3373 + _3375;
    bool _3379 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3381 = isnan(_3373);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3387 = _3383 || _3385;
    float _3389 = float(_3387);
    float _3391 = _3245;
    if (_3131)
    {
        float _3393 = floor(_3303);
        _3391 = _3393;
    }
    float _3395 = _3391;
    float _3397 = _3343 * _3351;
    float _3399 = fma(_3139, _3185, _3333);
    float _3401 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3403 = _3373 + _3401;
    float _3405 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3407 = _3373 + _3405;
    float _3409 = fma(_3183, _3233, _3399);
    float _3411 = 1.0 / _3263;
    float _3413 = _3347 * _3365;
    float _3415 = _3409;
    if (!_3131)
    {
        _3355 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3417 = _3355;
    float _3419 = 1.0 / _3271;
    float _3421 = _3417;
    if (_3131)
    {
        float _3423 = -_3395;
        float _3425 = _3303 + _3423;
        _3421 = _3425;
    }
    float _3427 = _3421;
    float _3429 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3431 = _3427 + _3429;
    bool _3433 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3435 = isnan(_3427);
    bool _3437 = _3433 || _3435;
    bool _3439 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3441 = _3437 || _3439;
    float _3443 = float(_3441);
    float _3445 = 1.0 / _3331;
    bool _3447 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3449 = isnan(_3427);
    bool _3451 = _3447 || _3449;
    bool _3453 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3455 = _3451 || _3453;
    float _3457 = float(_3455);
    float _3459 = fma(_3413, _3431, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _3461 = -_3443;
    float _3463 = _3461 + 1.0;
    bool _3465 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3467 = isnan(_3427);
    bool _3469 = _3465 || _3467;
    bool _3471 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3473 = _3469 || _3471;
    float _3475 = float(_3473);
    float _3477 = -_3457;
    float _3479 = _3477 + 1.0;
    float _3481 = 1.0 / _3267;
    float _3483 = _3403 * _3419;
    float _3485 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3487 = _3427 + _3485;
    float _3489 = _3443 * _3479;
    bool _3491 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3493 = isnan(_3427);
    bool _3495 = _3491 || _3493;
    bool _3497 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3499 = _3495 || _3497;
    float _3501 = float(_3499);
    float _3503 = 1.0 / _3321;
    float _3505 = 1.0 / _3339;
    float _3507 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3509 = _3373 + _3507;
    float _3511 = _3509 * _3411;
    float _3513 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3515 = _3373 + _3513;
    float _3517 = 1.0 / _3259;
    float _3519 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3521 = _3373 + _3519;
    float _3523 = _3515 * _3445;
    float _3525 = fma(_3307, _3487, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3529 = _3427 + _3527;
    float _3531 = _3521 * _3481;
    float _3533 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3535 = _3427 + _3533;
    bool _3537 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3539 = isnan(_3427);
    bool _3541 = _3537 || _3539;
    bool _3543 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3545 = _3541 || _3543;
    float _3547 = float(_3545);
    float _3549 = fma(_3309, _3529, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3551 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3553 = _3427 + _3551;
    float _3555 = fma(_3353, _3535, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3557 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3559 = _3427 + _3557;
    float _3561 = _3547 * _3463;
    float _3563 = fma(_3317, _3553, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    bool _3565 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3567 = isnan(_3427);
    bool _3569 = _3565 || _3567;
    bool _3571 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3573 = _3569 || _3571;
    float _3575 = float(_3573);
    float _3577 = fma(_3311, _3559, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3579 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3581 = _3427 + _3579;
    float _3583 = _3407 * _3505;
    float _3585 = -_3547;
    float _3587 = _3585 + 1.0;
    bool _3589 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3591 = isnan(_3427);
    bool _3593 = _3589 || _3591;
    bool _3595 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3597 = _3593 || _3595;
    float _3599 = float(_3597);
    float _3601 = fma(_3397, _3581, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3603 = -_3575;
    float _3605 = _3603 + 1.0;
    float _3607 = _3575 * _3587;
    bool _3609 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3611 = isnan(_3373);
    bool _3613 = _3609 || _3611;
    bool _3615 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3617 = _3613 || _3615;
    float _3619 = float(_3617);
    float _3621 = -_3599;
    float _3623 = _3621 + 1.0;
    float _3625 = _3501 * _3605;
    bool _3627 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3629 = isnan(_3373);
    bool _3631 = _3627 || _3629;
    bool _3633 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3635 = _3631 || _3633;
    float _3637 = float(_3635);
    float _3639 = _3377 * _3517;
    float _3641 = _3457 * _3623;
    float _3643 = -_3619;
    float _3645 = _3643 + 1.0;
    float _3647 = _3525 * _3625;
    float _3649 = -_3475;
    float _3651 = _3649 + 1.0;
    bool _3653 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3655 = isnan(_3373);
    bool _3657 = _3653 || _3655;
    bool _3659 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3661 = _3657 || _3659;
    float _3663 = float(_3661);
    float _3665 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3667 = _3373 + _3665;
    float _3669 = _3637 * _3645;
    float _3671 = _3599 * _3651;
    float _3673 = -_3637;
    float _3675 = _3673 + 1.0;
    float _3677 = -_3501;
    float _3679 = _3677 + 1.0;
    bool _3681 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3683 = isnan(_3373);
    bool _3685 = _3681 || _3683;
    bool _3687 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3689 = _3685 || _3687;
    float _3691 = float(_3689);
    float _3693 = -_3663;
    float _3695 = _3693 + 1.0;
    float _3697 = _3667 * _3503;
    float _3699 = _3663 * _3675;
    float _3701 = fma(_3679, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3647);
    bool _3703 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3705 = isnan(_3373);
    bool _3707 = _3703 || _3705;
    bool _3709 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3711 = _3707 || _3709;
    float _3713 = float(_3711);
    float _3715 = _3691 * _3695;
    float _3717 = -_3691;
    float _3719 = _3717 + 1.0;
    bool _3721 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3723 = isnan(_3427);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3729 = _3725 || _3727;
    float _3731 = float(_3729);
    float _3733 = fma(_3459, _3607, _3701);
    bool _3735 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3737 = isnan(_3373);
    bool _3739 = _3735 || _3737;
    bool _3741 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3743 = _3739 || _3741;
    float _3745 = float(_3743);
    float _3747 = _3713 * _3719;
    float _3749 = -_3713;
    float _3751 = _3749 + 1.0;
    bool _3753 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3755 = isnan(_3373);
    bool _3757 = _3753 || _3755;
    bool _3759 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3761 = _3757 || _3759;
    float _3763 = float(_3761);
    float _3765 = -_3731;
    float _3767 = _3765 + 1.0;
    float _3769 = -_3745;
    float _3771 = _3769 + 1.0;
    float _3773 = _3745 * _3751;
    float _3775 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3777 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3775;
    float _3779 = -_3763;
    float _3781 = _3779 + 1.0;
    float _3783 = _3475 * _3767;
    float _3785 = _3763 * _3771;
    float _3787 = fma(_3777, _3639, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3789 = _3389 * _3781;
    float _3791 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _3793 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _3791;
    float _3795 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3797 = _3795 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3799 = -_3389;
    float _3801 = _3799 + 1.0;
    float _3803 = _3787 * _3789;
    float _3805 = fma(_3793, _3639, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _3807 = fma(_3797, _3511, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3809 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3803);
    float _3811 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _3813 = _3811 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3815 = _3805 * _3789;
    float _3817 = fma(_3807, _3785, _3809);
    float _3819 = fma(_3813, _3511, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _3821 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[167].y, _3815);
    float _3823 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3825 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _3823;
    float _3827 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3829 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3827;
    float _3831 = fma(_3555, _3561, _3733);
    float _3833 = fma(_3819, _3785, _3821);
    float _3835 = fma(_3825, _3531, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _3837 = fma(_3829, _3531, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3839 = fma(_3549, _3489, _3831);
    float _3841 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _3843 = _3841 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3845 = fma(_3835, _3773, _3833);
    float _3847 = fma(_3837, _3773, _3817);
    float _3849 = fma(_3577, _3641, _3839);
    float _3851 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3853 = _3851 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3855 = fma(_3843, _3483, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _3857 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3859 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _3857;
    float _3861 = fma(_3563, _3671, _3849);
    float _3863 = fma(_3853, _3483, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3865 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3867 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3865;
    float _3869 = fma(_3855, _3747, _3845);
    float _3871 = fma(_3859, _3697, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _3873 = fma(_3863, _3747, _3847);
    float _3875 = fma(_3867, _3697, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3877 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3879 = _3877 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3881 = fma(_3871, _3715, _3869);
    float _3883 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3885 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3883;
    float _3887 = fma(_3601, _3783, _3861);
    float _3889 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _3891 = _3889 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3893 = fma(_3875, _3715, _3873);
    float _3895 = fma(_3879, _3583, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3897 = fma(_3885, _3523, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3899 = fma(_3891, _3583, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _3901 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _3901;
    float _3905 = fma(_3895, _3699, _3893);
    float _3907 = _3409 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3909 = fma(_3899, _3699, _3881);
    float _3911 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3887);
    float _3913 = fma(_3897, _3669, _3905);
    float _3915 = _3409 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3917 = fma(_3903, _3523, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _3919 = fma(_3363, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3907);
    float _3921 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3923 = _2179 + _3921;
    float _3925 = fma(_3619, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3913);
    float _3927 = _3911 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _3929 = fma(_3917, _3669, _3909);
    float _3931 = fma(_3363, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3915);
    float _3933 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3919);
    float _3935 = -_3927;
    float _3937 = fma(_3925, _3923, _3935);
    float _3939 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3941 = _2147 + _3939;
    float _3943 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3931);
    float _3945 = _3911 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _3947 = _3933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3949 = fma(_3619, (*spvDescriptorSet0.vp_c9)._m0[174].y, _3929);
    float _3951 = _3943 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3953 = -_3945;
    float _3955 = fma(_3925, _3941, _3953);
    float _3957 = fma(_3947, _3949, _3937);
    float _3959 = fma(_3951, _3949, _3955);
    float _3961 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3963 = _3957 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3965 = _3409 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3967 = _3959 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3969 = fma(_2055, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3961);
    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3973 = _3963 + _3971;
    float _3975 = fma(_3363, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3965);
    float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3979 = _3967 + _3977;
    float _3981 = fma(_2059, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3969);
    float _3983 = _3973 * _3973;
    float _3985 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3975);
    float _3987 = _3981 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3989 = fma(_3979, _3979, _3983);
    float _3991 = _3985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3993 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _3995 = _3987 + _3993;
    float _3997 = sqrt(_3989);
    bool _3999 = _3997 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4003 = _3997 + _4001;
    float _4005 = _2135 + _3991;
    float _4007 = _3911 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _4009 = -_3987;
    float _4011 = _4005 + _4009;
    float _4013 = -_4007;
    float _4015 = fma(_3925, _3995, _4013);
    float _4017 = fma(_3949, _4011, _4015);
    float _4019 = _3947;
    float _4021 = _3911;
    float _4023 = _3995;
    float _4025 = _3925;
    float _4027 = _4003;
    float _4029 = (*spvDescriptorSet0.vp_c9)._m0[172].y;
    if (_3999)
    {
        float _4031 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4019 = _4031;
    }
    float _4033 = _4019;
    if (!_3999)
    {
        _4021 = _3963;
    }
    float _4035 = _4021;
    float _4037 = _4017 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _4039 = _4035;
    if (_3999)
    {
        float _4041 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4023 = _4041;
    }
    float _4043 = _4023;
    float _4045 = _4043;
    if (_3999)
    {
        float _4047 = rsqrt(_3989);
        _4025 = _4047;
    }
    float _4049 = _4025;
    float _4051 = _4049;
    if (_3999)
    {
        float _4053 = _4003 * _4033;
        _4027 = _4053;
    }
    float _4055 = _4027;
    if (_3999)
    {
        float _4057 = _4055 * 0.15915493667125701904296875;
        _3415 = _4057;
    }
    float _4059 = _3415;
    float _4061 = _4055;
    if (_3999)
    {
        float _4063 = _4059 * 6.283185482025146484375;
        float _4065 = sin(_4063);
        _4061 = _4065;
    }
    float _4067 = _4061;
    float _4069 = _4067;
    if (_3999)
    {
        float _4071 = fma(_4067, _4043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4069 = _4071;
    }
    float _4073 = _4069;
    float _4075 = _4073;
    if (!_3999)
    {
        _4045 = _3967;
    }
    float _4077 = _4045;
    float _4079 = _4077;
    if (_3999)
    {
        float _4081 = _4049 * _4073;
        _4075 = _4081;
    }
    float _4083 = _4075;
    if (_3999)
    {
        float _4085 = fma(_3979, _4083, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _4079 = _4085;
    }
    float _4087 = _4079;
    if (_3999)
    {
        float _4089 = fma(_3973, _4083, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4039 = _4089;
    }
    float _4091 = _4039;
    float _4093 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _4095 = _4087 + _4093;
    float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _4099 = _4091 + _4097;
    float _4101 = fma(_4095, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _4103 = fma(_4099, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _11714 = float2(_4101, _4103);
    float _4105 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_11714, float2(0.0), isnan(_11714)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_11714, float2(0.0), isnan(_11714)), level(0.0)).x;
    float _4107 = _4099;
    float _4109 = _4095;
    float _4111 = _4091;
    if (_3999)
    {
        float _4113 = _4059 * 6.283185482025146484375;
        float _4115 = cos(_4113);
        _4107 = _4115;
    }
    float _4117 = _4107;
    if (!_3999)
    {
        _4109 = _4037;
    }
    float _4119 = _4109;
    float _4121 = -_2147;
    float _4123 = _4121 + _4087;
    float _4125 = -_2179;
    float _4127 = _4125 + _4091;
    float _4129 = _4119;
    if (_3999)
    {
        float _4131 = _4117 + (-1.0);
        _4051 = _4131;
    }
    float _4133 = _4051;
    float _4135 = _4133;
    if (_3999)
    {
        float _4137 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4135 = _4137;
    }
    float _4139 = _4135;
    if (_3999)
    {
        float _4141 = fma(_4037, _4117, _4139);
        _4129 = _4141;
    }
    float _4143 = _4129;
    float _4145 = -_2135;
    float _4147 = _4145 + _4143;
    bool _4149 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4151 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4153 = _4149 || _4151;
    bool _4155 = isnan(0.5);
    bool _4157 = _4153 || _4155;
    float _4159 = fma(_4105, 100.0, _2135);
    float _4161 = -_2765;
    float _4163 = _4161 + _4159;
    float _4165 = _4163 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4167 = _4163 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4169 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4165);
    float _4171 = _4147 * _4147;
    float _4173 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4167);
    float _4175 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4169);
    float _4177 = fma(_4123, _4123, _4171);
    float _4179 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4173);
    float _4181 = _4175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4183 = fma(_4127, _4127, _4177);
    float _4185 = _4179 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4187 = 1.0 / _4181;
    float _4189 = _4185 + _4181;
    float _4191 = sqrt(_4183);
    float _4193 = fma(_4105, 100.0, _4143);
    float _4195 = _4189 * _4187;
    float _4197 = _4195 * 0.5;
    float _4199 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4201 = fma(_4197, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4199);
    bool _4203 = _4191 > 0.0;
    float _4205 = 1.0 / _4201;
    bool _4207 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4209 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4211 = _4207 || _4209;
    bool _4213 = isnan(0.5);
    bool _4215 = _4211 || _4213;
    float _4217 = _4175;
    float _4219 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4221 = _4105;
    if (!_4203)
    {
        _4217 = _4087;
    }
    float _4223 = _4217;
    float _4225 = _4223;
    float _4227 = _4223;
    if (!_4203)
    {
        _4219 = _4193;
    }
    float _4229 = _4219;
    bool _4231 = !_4203;
    float _4233 = _4229;
    if (!_4231)
    {
        float _4235 = _206 * _206;
        float _4237 = rsqrt(_4183);
        float _4239 = fma(_204, _204, _4235);
        float _4241 = fma(_208, _208, _4239);
        float _4243 = sqrt(_4241);
        float _4245 = _4123 * _4237;
        float _4247 = _4147 * _4237;
        float _4249 = _4127 * _4237;
        bool _4251 = _4243 > 0.0;
        float _4253 = _4239;
        _4221 = _4243;
        if (!_4251)
        {
            _4225 = _4087;
        }
        float _4255 = _4225;
        _4227 = _4255;
        if (!_4251)
        {
            _4253 = _4193;
        }
        float _4257 = _4253;
        bool _4259 = !_4251;
        _4233 = _4257;
        if (!_4259)
        {
            float _4261 = rsqrt(_4241);
            float _4263 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4265 = _206 * _4261;
            float _4267 = _204 * _4261;
            float _4269 = _208 * _4261;
            float _4271 = _4247 * _4265;
            float _4273 = fma(_4245, _4267, _4271);
            float _4275 = _4263 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4277 = fma(_4249, _4269, _4273);
            float _4279 = _4277 * _4275;
            float _4281 = fma(_204, _4279, _4087);
            float _4283 = fma(_206, _4279, _4193);
            float _4285 = fma(_208, _4279, _4091);
            _4227 = _4281;
            _4111 = _4285;
            _4233 = _4283;
            _4221 = _4265;
        }
    }
    float _4287 = _4227;
    float _4289 = _4111;
    float _4291 = _4233;
    float _4293 = _4221;
    float _4295 = -_2769;
    float _4297 = _4295 + _4287;
    float _4299 = -_2987;
    float _4301 = _4299 + _4289;
    float _4303 = -_2765;
    float _4305 = _4303 + _4291;
    float _4307 = _4293;
    float _4309 = _4305;
    float _4311 = _4297;
    float _4313 = _4301;
    if (_4157)
    {
        _4307 = 1.0;
    }
    float _4315 = _4307;
    float _4317 = _4315;
    if (!_4215)
    {
        float _4319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4321 = _4163 + _4319;
        float _4323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4325 = -_2179;
        float _4327 = _4325 + _4289;
        float _4329 = -_4159;
        float _4331 = _4329 + _4291;
        float _4333 = _4321 * _4321;
        float _4335 = fma(_3037, _3037, _4333);
        float _4337 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4339 = fma(_3049, _3049, _4335);
        float _4341 = 1.0 / _3135;
        float _4343 = sqrt(_4339);
        float _4345 = _4337 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4347 = precise::min(_4343, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4349 = _4347 * _4323;
        float _4351 = _4349 * _4341;
        float _4353 = -_2147;
        float _4355 = _4353 + _4287;
        float _4357 = _4345 * _4351;
        float _4359 = _4327 * _4351;
        float _4361 = fma(_4331, _4357, _4163);
        float _4363 = fma(_4355, _4357, _3023);
        float _4365 = fma(_4345, _4359, _3033);
        _3089 = _4343;
        _4309 = _4361;
        _4311 = _4363;
        _4313 = _4365;
    }
    float _4367 = _3089;
    float _4369 = _4309;
    float _4371 = _4311;
    float _4373 = _4313;
    float _4375 = _4367;
    if (_4157)
    {
        _2317 = 1.0;
    }
    float _4377 = _2317;
    float _4379 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4381 = _4205 * _4379;
    float _4383 = _4377;
    if (!_4157)
    {
        float _4385 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4387 = _4385 * 0.15915493667125701904296875;
        float _4389 = _4387 * 6.283185482025146484375;
        float _4391 = cos(_4389);
        float _4393 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4395 = _4393 * 0.15915493667125701904296875;
        float _4397 = _4387 * 6.283185482025146484375;
        float _4399 = sin(_4397);
        float _4401 = 1.0 / _4391;
        float _4403 = _4395 * 6.283185482025146484375;
        float _4405 = cos(_4403);
        float _4407 = _4399 * _4401;
        float _4409 = _4395 * 6.283185482025146484375;
        float _4411 = sin(_4409);
        float _4413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4415 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4413;
        float _4417 = _4405 * _4407;
        float _4419 = 1.0 / _4415;
        float _4421 = 1.0 / _4417;
        float _4423 = _4411 * _4421;
        float _4425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4427 = fma(_4381, _4423, _4425);
        float _4429 = _4427 * _4419;
        float _4431 = precise::clamp(_4429, 0.0, 1.0);
        _4375 = _4407;
        _4317 = _4431;
    }
    float _4433 = _4375;
    float _4435 = _4317;
    float _4437 = _4433;
    if (!_4157)
    {
        float _4439 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4441 = _4439 * 0.15915493667125701904296875;
        float _4443 = _4441 * 6.283185482025146484375;
        float _4445 = cos(_4443);
        float _4447 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4449 = _4447 * 0.15915493667125701904296875;
        float _4451 = _4441 * 6.283185482025146484375;
        float _4453 = sin(_4451);
        float _4455 = 1.0 / _4445;
        float _4457 = _4449 * 6.283185482025146484375;
        float _4459 = cos(_4457);
        float _4461 = _4453 * _4455;
        float _4463 = _4449 * 6.283185482025146484375;
        float _4465 = sin(_4463);
        float _4467 = _4459 * _4461;
        float _4469 = 1.0 / _4467;
        float _4471 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4473 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4471;
        float _4475 = 1.0 / _4473;
        float _4477 = _4465 * _4469;
        float _4479 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4481 = fma(_4381, _4477, _4479);
        float _4483 = _4481 * _4475;
        float _4485 = precise::clamp(_4483, 0.0, 1.0);
        float _4487 = -_4485;
        float _4489 = _4487 + 1.0;
        _4437 = _4445;
        _4383 = _4489;
    }
    float _4491 = _4437;
    float _4493 = _4383;
    float _4495 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4497 = _4369 + _4495;
    float _4499 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4501 = _4371 + _4499;
    float _4503 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4505 = _4373 + _4503;
    float _4507 = _4497 * _4497;
    float _4509 = fma(_4501, _4501, _4507);
    float _4511 = fma(_3023, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4513 = fma(_4505, _4505, _4509);
    float _4515 = rsqrt(_4513);
    float _4517 = sqrt(_4513);
    float _4519 = _4515 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4521 = _4501 * _4519;
    float _4523 = _4505 * _4519;
    float _4525 = _4521 * _4521;
    float _4527 = _4523 * _4523;
    float _4529 = _4525 + _4527;
    float _4531 = sqrt(_4529);
    bool _4533 = _4531 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4535 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4537 = _4531 + _4535;
    float _4539 = _4505;
    float _4541 = _4515;
    float _4543 = _4537;
    float _4545 = _4491;
    float _4547 = _4497;
    float _4549 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4533)
    {
        float _4551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4539 = _4551;
    }
    float _4553 = _4539;
    if (_4533)
    {
        float _4555 = rsqrt(_4529);
        _4541 = _4555;
    }
    float _4557 = _4541;
    float _4559 = _4557;
    if (_4533)
    {
        float _4561 = _4537 * _4553;
        _4543 = _4561;
    }
    float _4563 = _4543;
    if (_4533)
    {
        float _4565 = _4563 * 0.15915493667125701904296875;
        _4545 = _4565;
    }
    float _4567 = _4545;
    float _4569 = _4553;
    float _4571 = _4567;
    if (_4533)
    {
        float _4573 = _4567 * 6.283185482025146484375;
        float _4575 = sin(_4573);
        _4569 = _4575;
    }
    float _4577 = _4569;
    float _4579 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4581 = precise::max(0.0, _4579);
    float _4583 = _4507;
    float _4585 = _4581;
    if (_4533)
    {
        float _4587 = _4567 * 6.283185482025146484375;
        float _4589 = cos(_4587);
        _4583 = _4589;
    }
    float _4591 = _4583;
    float _4593 = -_4519;
    float _4595 = -_4581;
    float _4597 = fma(_4497, _4593, _4595);
    if (!_4533)
    {
        _4547 = _4523;
    }
    float _4599 = _4547;
    float _4601 = _4599;
    if (_4533)
    {
        float _4603 = _4597 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4585 = _4603;
    }
    float _4605 = _4585;
    float _4607 = _4605;
    if (!_4533)
    {
        _4571 = _4525;
    }
    float _4609 = _4571;
    float _4611 = _4577;
    float _4613 = _4609;
    if (_4533)
    {
        float _4615 = fma(_4577, _4605, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4611 = _4615;
    }
    float _4617 = _4611;
    float _4619 = _4617;
    float _4621 = _4591;
    if (_4533)
    {
        float _4623 = _4591 + (-1.0);
        _4607 = _4623;
    }
    float _4625 = _4607;
    float _4627 = _4625;
    if (_4533)
    {
        float _4629 = _4557 * _4617;
        _4549 = _4629;
    }
    float _4631 = _4549;
    if (!_4533)
    {
        _4559 = _4521;
    }
    float _4633 = _4559;
    float _4635 = _4633;
    if (_4533)
    {
        float _4637 = _4625 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4627 = _4637;
    }
    float _4639 = _4627;
    if (_4533)
    {
        float _4641 = _4521 * _4631;
        _4635 = _4641;
    }
    float _4643 = _4635;
    if (!_4533)
    {
        _4619 = _4597;
    }
    float _4645 = _4619;
    float _4647 = _4645;
    if (_4533)
    {
        float _4649 = _4523 * _4631;
        _4601 = _4649;
    }
    float _4651 = _4601;
    if (_4533)
    {
        float _4653 = fma(_4597, _4591, _4639);
        _4647 = _4653;
    }
    float _4655 = _4647;
    if (_4533)
    {
        float _4657 = _4643 * _4643;
        _4613 = _4657;
    }
    float _4659 = _4613;
    if (!_4533)
    {
        _4621 = _4527;
    }
    float _4661 = _4621;
    float _4663 = _4661;
    if (_4533)
    {
        float _4665 = _4651 * _4651;
        _4663 = _4665;
    }
    float _4667 = _4663;
    float _4669 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4671 = fma(_4655, _4655, _4659);
    float _4673 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4675 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4669);
    float _4677 = _4671 + _4667;
    float _4679 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4681 = fma(_4517, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4679);
    float _4683 = precise::clamp(_4681, 0.0, 1.0);
    float _4685 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4675);
    float _4687 = floor(_4511);
    float _4689 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4673);
    float _4691 = -_4683;
    float _4693 = _4691 + 1.0;
    float _4695 = _4685 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4697 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4699 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4689);
    float _4701 = _4695 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4703 = rsqrt(_4677);
    float _4705 = fma(_3033, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4707 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4709 = -_4701;
    float _4711 = fma(_4709, _4697, 1.0);
    float _4713 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4715 = _4699 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4717 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4707);
    float _4719 = abs(_4693);
    float _4721 = log2(_4719);
    float _4723 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4713);
    float _4725 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4717);
    float _4727 = -_4687;
    float _4729 = _4511 + _4727;
    float _4731 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4723);
    float _4733 = _4725 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4735 = _4703 * _4643;
    float _4737 = _4703 * _4655;
    float _4739 = _4703 * _4651;
    float _4741 = _4731 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4743 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4745 = floor(_4705);
    float _4747 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4749 = _4737 + 1.0;
    float _4751 = -_4743;
    float _4753 = fma(_4737, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4751);
    float _4755 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4757 = _4721 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4759 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4747);
    float _4761 = -_4739;
    float _4763 = fma(_4761, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4753);
    float _4765 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4755);
    float _4767 = exp2(_4757);
    float _4769 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4759);
    float _4771 = fma(_4763, -0.5, 0.5);
    float _4773 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4765);
    float _4775 = fma(_4763, 0.5, 0.5);
    float _4777 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4773);
    float _4779 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4781 = log2(_4711);
    float _4783 = fma(_4775, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4785 = -_4745;
    float _4787 = _4705 + _4785;
    float _4789 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4779);
    float _4791 = fma(_4775, _4783, -0.212114393711090087890625);
    float _4793 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4789);
    float _4795 = 1.0 / _4777;
    float _4797 = -_4737;
    float _4799 = fma(_4767, _4749, _4797);
    float _4801 = sqrt(_4771);
    float _4803 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4793);
    float _4805 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4769);
    float _4807 = _4781 * 0.693147182464599609375;
    float2 _12809 = float2(_4729, _4787);
    float _4809 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12809, float2(0.0), isnan(_12809)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12809, float2(0.0), isnan(_12809)), level(0.0)).x;
    float _4811 = fma(_4775, _4791, 1.570728778839111328125);
    float _4813 = _4807 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4815 = _4803 * _4795;
    float _4817 = _4805 * _4795;
    float _4819 = fma(_4815, 0.5, 0.5);
    float _4821 = fma(_4817, -0.5, 0.5);
    float _4823 = _4801 * 0.636619746685028076171875;
    float3 _12839 = float3(_4819, _4821, _4813);
    float _4825 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12839, float3(0.0), isnan(_12839)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12839, float3(0.0), isnan(_12839)), level(0.0)).x;
    float _4827 = -_4811;
    float _4829 = fma(_4823, _4827, 1.0);
    float _4831 = fma(_4799, 0.5, 0.5);
    float3 _12857 = float3(_4819, _4821, _4813);
    float4 _4834 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12857, float3(0.0), isnan(_12857)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12857, float3(0.0), isnan(_12857)), level(0.0)).xyzw;
    float _4836 = _4834.x;
    float _4838 = _4834.y;
    float _4840 = _4834.z;
    float _4842 = _4834.w;
    float2 _12873 = float2(_4829, _4831);
    float3 _4846 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12873, float2(0.0), isnan(_12873)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12873, float2(0.0), isnan(_12873)), level(0.0)).xyz;
    float _4848 = _4846.x;
    float _4850 = _4846.y;
    float _4852 = _4846.z;
    float _4854 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4856 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4858 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _4860 = _3119 != 0.0;
    bool _4862 = isnan(_3119);
    bool _4864 = _4860 || _4862;
    bool _4866 = isnan(0.0);
    bool _4868 = _4864 || _4866;
    float _4870 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4854);
    float _4872 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4856);
    float _4874 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4858);
    out.m_65.x = _572;
    out.m_65.y = _582;
    out.m_65.z = _562;
    out.m_65.w = _574;
    bool _4876 = _3117 == 0.0;
    bool _4878 = !_4868;
    bool _4880 = _4876 && _4878;
    float _4882 = _4721 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4884 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4886 = in.m_81.x;
    float _4888 = in.m_81.y;
    float _4890 = in.m_81.z;
    bool _4892 = _3121 == 0.0;
    bool _4894 = _4892 && _4880;
    float _4896 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4870);
    float _4898 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4872);
    float _4900 = in.m_83.x;
    float _4902 = in.m_83.y;
    float _4904 = in.m_83.z;
    float _4906 = in.m_83.w;
    float _4908 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4874);
    float _4910 = _3155 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4912 = _3183 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_67.x = _684;
    out.m_67.y = _690;
    out.m_67.z = _688;
    out.m_67.w = _692;
    float _4914 = -_3115;
    float _4916 = fma(_4914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4910);
    float _4918 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4912);
    float _4920 = exp2(_4882);
    float _4922 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4884);
    out.m_85.x = _4371;
    out.m_85.y = _4369;
    out.m_85.z = _4373;
    float _4924 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4922);
    float _4926 = _3155 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4928 = _3155 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4930 = _3183 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4932 = _3183 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4934 = -_3115;
    float _4936 = fma(_4934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4926);
    float _4938 = -_3115;
    float _4940 = fma(_4938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4928);
    float _4942 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4930);
    float _4944 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4932);
    float _4946 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4936);
    float _4948 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4940);
    float _4950 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4916);
    float _4952 = _4916;
    float _4954 = _4918;
    float _4956 = _4886;
    if (_4894)
    {
        _4952 = _4886;
    }
    float _4958 = _4952;
    float _4960 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4942);
    float _4962 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4944);
    float _4964 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4918);
    float _4966 = _4958;
    if (_4894)
    {
        _4029 = _4890;
    }
    float _4968 = _4029;
    float _4970 = _4948 * _4902;
    float _4972 = _4968;
    if (_4894)
    {
        _4954 = _4958;
    }
    float _4974 = _4954;
    float _4976 = _4946 * _4902;
    float _4978 = _4974;
    if (!_4894)
    {
        _4966 = _4886;
    }
    float _4980 = _4966;
    float _4982 = fma(_4898, _4900, _4970);
    if (_4894)
    {
        _4956 = _4968;
    }
    float _4984 = _4956;
    float _4986 = fma(_4896, _4900, _4976);
    float _4988 = _4984;
    if (!_4894)
    {
        _4972 = _4890;
    }
    float _4990 = _4972;
    float _4992 = _4950 * _4902;
    if (!_4894)
    {
        float _4994 = fma(_3117, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4980);
        _4978 = _4994;
    }
    float _4996 = _4978;
    float _4998 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _5000 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _4998;
    if (_4894)
    {
        _3195 = _4888;
    }
    float _5002 = _3195;
    float _5004 = fma(_4908, _4900, _4992);
    float _5006 = fma(_4962, _4904, _4982);
    float _5008 = fma(_5000, _3639, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _5010 = _5002;
    if (!_4894)
    {
        float _5012 = fma(_3119, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4888);
        _5010 = _5012;
    }
    float _5014 = _5010;
    float _5016 = fma(_4960, _4904, _4986);
    float _5018 = fma(_4964, _4904, _5004);
    float _5020 = _4904 * _4980;
    if (!_4894)
    {
        float _5022 = fma(_3121, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4990);
        _4988 = _5022;
    }
    float _5024 = _4988;
    float _5026 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _5028 = _5026 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _5030 = _5008 * _3789;
    float _5032 = -_5020;
    float _5034 = fma(_4900, _4990, _5032);
    out.m_87.x = _5016;
    out.m_87.y = _5006;
    out.m_87.z = _5018;
    float _5036 = _4900 * _4888;
    float _5038 = fma(_5028, _3511, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _5040 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[167].z, _5030);
    float _5042 = _4902 * _4990;
    float _5044 = -_5036;
    float _5046 = fma(_4902, _4980, _5044);
    float _5048 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _5050 = _5048 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _5052 = fma(_5038, _3785, _5040);
    float _5054 = -_5042;
    float _5056 = fma(_4904, _4888, _5054);
    float _5058 = fma(_5050, _3483, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _5060 = _4950 * _5014;
    float _5062 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _5064 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _5062;
    float _5066 = _5056 * _4906;
    float _5068 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _5070 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _5068;
    float _5072 = fma(_5064, _3531, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _5074 = -_4920;
    float _5076 = _5074 + 1.0;
    bool _5078 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5080 = isnan(_4517);
    bool _5082 = _5078 || _5080;
    bool _5084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5086 = _5082 || _5084;
    float _5088 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _5090 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _5088;
    float _5092 = fma(_5072, _3773, _5052);
    float _5094 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _5096 = _5094 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _5098 = fma(_5070, _3523, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _5100 = fma(_5090, _3697, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _5102 = fma(_5058, _3747, _5092);
    float _5104 = _5034 * _4906;
    float _5106 = _5046 * _4906;
    float _5108 = fma(_5096, _3583, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _5110 = fma(_5100, _3715, _5102);
    float _5112 = _5104 * _4946;
    float _5114 = _4948 * _5014;
    float _5116 = _5104 * _4948;
    float _5118 = fma(_5108, _3699, _5110);
    float _5120 = fma(_5066, _4896, _5112);
    float _5122 = _5104 * _4950;
    float _5124 = fma(_4898, _4996, _5114);
    float _5126 = fma(_5098, _3669, _5118);
    float _5128 = fma(_5106, _4960, _5120);
    float _5130 = fma(_5066, _4898, _5116);
    float _5132 = abs(_4381);
    float _5134 = log2(_5132);
    float _5136 = fma(_5066, _4908, _5122);
    float _5138 = _4946 * _5014;
    float _5140 = fma(_3619, (*spvDescriptorSet0.vp_c9)._m0[174].z, _5126);
    float _5142 = fma(_4962, _5024, _5124);
    float _5144 = fma(_5106, _4962, _5130);
    float _5146 = fma(_5106, _4964, _5136);
    float _5148 = fma(_4896, _4996, _5138);
    float _5150 = fma(_4908, _4996, _5060);
    out.m_89.x = _5140;
    bool _5152 = _4381 <= 8000.0;
    bool _5154 = isnan(_4381);
    bool _5156 = _5152 || _5154;
    bool _5158 = isnan(8000.0);
    bool _5160 = _5156 || _5158;
    float _5162 = float(_5160);
    float _5164 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.x = _5128;
    out.m_91.y = _5144;
    out.m_91.z = _5146;
    float _5166 = _5134 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5168 = fma(_4960, _5024, _5148);
    float _5170 = fma(_4964, _5024, _5150);
    float _5172 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4924);
    float _5174 = exp2(_5166);
    out.m_93.x = _5168;
    out.m_93.y = _5142;
    out.m_93.z = _5170;
    float _5176 = _5172 + _4777;
    out.gl_Position.x = _4803;
    out.gl_Position.y = _4805;
    out.gl_Position.z = _5172;
    out.gl_Position.w = _4777;
    float _5178 = _5176 * 0.5;
    float _5180 = fma(_5174, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5182 = precise::clamp(_5180, 0.0, 1.0);
    float _5184 = _4777 * 0.5;
    float _5186 = fma(_5182, -2.0, 3.0);
    float _5188 = _5182 * _5182;
    float _5190 = _5188 * _5186;
    float _5192 = in.m_69.x;
    float _5194 = -_5190;
    float _5196 = _5194 + 1.0;
    float _5198 = fma(_5196, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5190);
    float _5200 = _4803 + _4777;
    float _5202 = fma(_4805, -0.5, _5184);
    float _5204 = _5162 * _5198;
    float _5206 = _5200 * 0.5;
    float _5208 = _5204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_95.x = _5206;
    out.m_95.y = _5202;
    out.m_95.z = _5178;
    out.m_95.w = _4777;
    float _5210 = -_5164;
    float _5212 = _5210 + 1.0;
    float _5214 = _4777;
    float _5216 = _5178;
    float _5218 = _5202;
    if (!_5086)
    {
        _5214 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5220 = _5214;
    float _5222 = _5220;
    float _5224 = _5220;
    if (!_5086)
    {
        _5216 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5226 = _5216;
    float _5228 = _5226;
    float _5230 = _5226;
    if (!_5086)
    {
        _5218 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5232 = _5218;
    float _5234 = -_4809;
    float _5236 = _5234 + 1.0;
    float _5238 = _5236 * _5208;
    float _5240 = precise::clamp(_5238, 0.0, 1.0);
    float _5242 = -_5240;
    float _5244 = fma(_5242, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5246 = _5244 * _5192;
    float _5248 = _5164 * _4825;
    float _5250 = _5192;
    float _5252 = _5232;
    float _5254 = _5232;
    if (!_5086)
    {
        _5250 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5256 = _5250;
    float _5258 = _5246 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5260 = _4842 * _5248;
    float _5262 = _4842 * _5212;
    out.m_97.x = _5258;
    float _5264 = _4435 * _4493;
    float _5266 = _4852 * _5248;
    float _5268 = fma(_4848, _5260, _4836);
    float _5270 = fma(_4850, _5260, _4838);
    float _5272 = _5264 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5274 = fma(_4842, _5266, _4840);
    float _5276 = _5260;
    float _5278 = _5264;
    float _5280 = _5256;
    float _5282 = _5256;
    if (!_5086)
    {
        _5276 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5284 = _5276;
    float _5286 = _5284;
    float _5288 = _5284;
    if (!_5086)
    {
        _5278 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5290 = _5278;
    out.m_99.x = _5268;
    out.m_99.y = _5270;
    out.m_99.z = _5274;
    out.m_99.w = _5262;
    bool _5292 = !_5086;
    float _5294 = _5290;
    float _5296 = _5290;
    if (!_5292)
    {
        bool _5298 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5300 = isnan(_4517);
        bool _5302 = _5298 || _5300;
        bool _5304 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5306 = _5302 || _5304;
        if (!_5306)
        {
            float _5308 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5310 = _4517 + _5308;
            float _5312 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5314 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5312;
            float _5316 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5318 = _5316 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5320 = 1.0 / _5314;
            float _5322 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5324 = _5322 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5326 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5328 = _5326 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5330 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5332 = _5330 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5334 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5336 = _5334 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5338 = _5310 * _5320;
            float _5340 = precise::clamp(_5338, 0.0, 1.0);
            float _5342 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5344 = _5342 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5346 = fma(_5340, _5318, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5348 = fma(_5340, _5344, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5350 = fma(_5340, _5324, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5352 = fma(_5340, _5328, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5354 = fma(_5340, _5332, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5356 = fma(_5340, _5336, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5288 = _5350;
            _5254 = _5354;
            _5282 = _5346;
            _5230 = _5352;
            _5224 = _5348;
            _5296 = _5356;
            _5358 = true;
        }
        else
        {
            bool _5360 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5362 = isnan(_4517);
            bool _5364 = _5360 || _5362;
            bool _5366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5368 = _5364 || _5366;
            if (!_5368)
            {
                _5280 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5370 = _5280;
            _5282 = _5370;
            if (!_5368)
            {
                _5286 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5372 = _5286;
            _5288 = _5372;
            if (!_5368)
            {
                _5222 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5374 = _5222;
            _5224 = _5374;
            if (!_5368)
            {
                _5228 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5376 = _5228;
            _5230 = _5376;
            if (!_5368)
            {
                _5252 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5378 = _5252;
            _5254 = _5378;
            if (!_5368)
            {
                _5294 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5380 = _5294;
            bool _5382 = !_5368;
            _5296 = _5380;
            if (!_5382)
            {
                bool _5384 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5386 = isnan(_4517);
                bool _5388 = _5384 || _5386;
                bool _5390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5392 = _5388 || _5390;
                if (!_5392)
                {
                    float _5394 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5396 = _4517 + _5394;
                    float _5398 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5400 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5398;
                    float _5402 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5404 = _5402 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5406 = 1.0 / _5400;
                    float _5408 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5410 = _5408 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5412 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5414 = _5412 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5416 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5418 = _5416 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5420 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5422 = _5420 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5424 = _5396 * _5406;
                    float _5426 = precise::clamp(_5424, 0.0, 1.0);
                    float _5428 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5430 = _5428 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5432 = fma(_5426, _5404, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5434 = fma(_5426, _5430, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5436 = fma(_5426, _5410, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5438 = fma(_5426, _5414, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5440 = fma(_5426, _5418, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5442 = fma(_5426, _5422, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5288 = _5436;
                    _5254 = _5440;
                    _5282 = _5432;
                    _5230 = _5438;
                    _5224 = _5434;
                    _5296 = _5442;
                    _5358 = true;
                }
                else
                {
                    _5288 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5254 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5282 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5230 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5224 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5296 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5358 = false;
    float _5444 = _5288;
    float _5446 = _5254;
    float _5448 = _5282;
    float _5450 = _5230;
    float _5452 = _5224;
    float _5454 = _5296;
    float _5456 = fma(_5142, -0.5, 0.5);
    float _5458 = precise::clamp(_5456, 0.0, 1.0);
    float _5460 = -_5444;
    float _5462 = _5460 + _5446;
    float _5464 = _5272 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5466 = -_5448;
    float _5468 = _5466 + _5450;
    float _5470 = fma(_5458, _5462, _5444);
    out.m_101.x = 0.0;
    float _5472 = -_5452;
    float _5474 = _5472 + _5454;
    float _5476 = fma(_5458, _5468, _5448);
    float _5478 = _5470 * 0.586610972881317138671875;
    out.m_51.x = _5464;
    bool _5480 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5482 = fma(_5458, _5474, _5452);
    float _5484 = fma(_5476, 0.298911988735198974609375, _5478);
    bool _5486 = _4435 > 0.0;
    bool _5488 = isnan(_4435);
    bool _5490 = _5486 || _5488;
    bool _5492 = isnan(0.0);
    bool _5494 = _5490 || _5492;
    float _5496 = fma(_5482, 0.114477999508380889892578125, _5484);
    bool _5498 = _4493 <= 0.0;
    bool _5500 = !_5494;
    bool _5502 = _5498 || _5500;
    float _5504 = -_5496;
    float _5506 = _5476 + _5504;
    float _5508 = -_5496;
    float _5510 = _5470 + _5508;
    float _5512 = -_5496;
    float _5514 = _5482 + _5512;
    float _5516 = fma(_5506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5496);
    float _5518 = fma(_5510, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5496);
    float _5520 = fma(_5514, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5496);
    bool _5522 = !_5480;
    if (!_5522)
    {
        float _5524 = -_4369;
        float _5526 = _5524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5528 = -_4371;
        float _5530 = _5528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5532 = -_4373;
        float _5534 = _5532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5536 = _5526 * _5526;
        float _5538 = fma(_5530, _5530, _5536);
        float _5540 = fma(_5534, _5534, _5538);
        float _5542 = sqrt(_5540);
        float _5544 = rsqrt(_5540);
        float _5546 = -_5542;
        float _5548 = _5546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5550 = _5548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5552 = precise::clamp(_5550, 0.0, 1.0);
        float _5554 = _5530 * _5544;
        float _5556 = _5526 * _5544;
        float _5558 = abs(_5552);
        float _5560 = log2(_5558);
        float _5562 = _5534 * _5544;
        float _5564 = _5554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5566 = _5142 * _5556;
        float _5568 = -_5556;
        float _5570 = -_5564;
        float _5572 = fma(_5568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5570);
        float _5574 = fma(_5168, _5554, _5566);
        float _5576 = -_5562;
        float _5578 = fma(_5576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5572);
        float _5580 = fma(_5170, _5562, _5574);
        float _5582 = precise::clamp(_5580, 0.0, 1.0);
        float _5584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5586 = _5578 + _5584;
        float _5588 = _5560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5590 = _5586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5592 = precise::clamp(_5590, 0.0, 1.0);
        float _5594 = exp2(_5588);
        float _5596 = _5594 * _5592;
        float _5598 = _5582 * _5596;
        float _5600 = _5598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5602 = _5598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5604 = _5598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _5600;
        out.m_101.y = _5602;
        out.m_101.z = _5604;
    }
    out.m_103.x = _5516;
    out.m_103.y = _5518;
    out.m_103.z = _5520;
    if (!_5502)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _5606 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5606;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5358 = false;
    bool _714 = false;
    bool _610 = false;
    bool _456 = false;
    bool _234 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _5665 = as_type<float>(_140);
        out.gl_Position.z = _5665;
    }
    if (!_126)
    {
        return out;
    }
    float _144 = in.m_53.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_122);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_51.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5734 = as_type<float>(_178);
        out.gl_Position.z = _5734;
    }
    if (_172)
    {
        return out;
    }
    float _180 = in.m_55.x;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_55.y;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    out.m_59.x = _180;
    out.m_59.y = _184;
    float _192 = _188 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _194 = _188 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _196 = _188 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].x, _192);
    float _200 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].x, _194);
    float _202 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _204 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[4].z, _198);
    float _206 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[5].z, _200);
    float _208 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[6].z, _202);
    bool _210 = !_182;
    float _212 = _184;
    float _214 = _180;
    float _232;
    if (!_210)
    {
        float _216 = in.m_61.x;
        float _218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _220 = _216 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _224 = _222 * _218;
        float _226 = floor(_224);
        float _228 = -_226;
        float _230 = _224 + _228;
        _232 = _230;
        _234 = true;
    }
    else
    {
        float _236 = float(_122);
        float _238 = 1.0 / _236;
        float _240 = _158 * _238;
        _232 = _240;
    }
    _234 = false;
    float _242 = _232;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = _242 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _242 + _248;
    bool _252 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _254 = isnan(_242);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = _242 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = 1.0 / _266;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _284 = 1.0 / _278;
    float _286 = 1.0 / _274;
    float _288 = _246 * _280;
    bool _290 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_242);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -_262;
    float _304 = _302 + 1.0;
    float _306 = _300 * _304;
    float _308 = _250 * _284;
    bool _310 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _312 = isnan(_242);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    bool _326 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_242);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = -_300;
    float _344 = _342 + 1.0;
    float _346 = -_320;
    float _348 = _346 + 1.0;
    float _350 = _270 * _286;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _356;
    float _360 = _336 * _348;
    float _362 = fma(_324, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = fma(_354, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_358, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _368 = _320 * _344;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = _364 * _360;
    float _376 = _366 * _360;
    float _378 = _362 * _360;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _376);
    float _390 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _392 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _378);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _394;
    float _398 = fma(_340, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _400 = fma(_386, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _402 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _408;
    float _412 = fma(_398, _368, _388);
    float _414 = fma(_396, _288, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _416 = fma(_406, _288, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _418 = fma(_410, _288, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _420 = fma(_400, _368, _390);
    float _422 = fma(_402, _368, _392);
    float _424 = fma(_414, _306, _412);
    float _426 = fma(_416, _306, _420);
    float _428 = fma(_418, _306, _422);
    float _430 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].x, _424);
    float _432 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].y, _426);
    float _434 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].z, _428);
    bool _436 = !_282;
    float _454;
    if (!_436)
    {
        float _438 = in.m_61.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_122);
        float _460 = 1.0 / _458;
        float _462 = _158 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _464 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_464);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_464);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _526 = _500 * _522;
    float _528 = -_500;
    float _530 = _528 + 1.0;
    float _532 = 1.0 / _488;
    float _534 = _504 * _518;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _540 = fma(_534, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _542 = _538 * _532;
    float _544 = _540 * _526;
    float _546 = -_516;
    float _548 = _546 + 1.0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _552 = _464 + _550;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _556 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[115].x, _544);
    float _558 = _484 * _548;
    float _560 = fma(_542, _552, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = _554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = fma(_560, _558, _556);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _568 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _564);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _576 = in.m_63.x;
    float _578 = in.m_63.y;
    float _580 = in.m_63.z;
    float _582 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _572;
    out.m_65.y = _582;
    out.m_65.z = _562;
    out.m_65.w = _574;
    float _584 = _434 * _580;
    float _586 = _432 * _578;
    float _588 = _430 * _576;
    bool _590 = !_524;
    float _608;
    if (!_590)
    {
        float _592 = in.m_61.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_122);
        float _614 = 1.0 / _612;
        float _616 = _158 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    bool _620 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _622 = isnan(_618);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _636 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _654 = _618 + _652;
    float _656 = -_630;
    float _658 = _656 + 1.0;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _662 = 1.0 / _634;
    float _664 = _646 * _658;
    float _666 = -_646;
    float _668 = _666 + 1.0;
    float _670 = _650 * _662;
    float _672 = fma(_670, _654, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _674 = _672 * _664;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[131].x, _674);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[132].x, _680);
    float _688 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _686 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _684;
    out.m_67.y = _690;
    out.m_67.z = _688;
    out.m_67.w = _692;
    bool _694 = !_660;
    float _712;
    if (!_694)
    {
        float _696 = in.m_61.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_122);
        float _718 = 1.0 / _716;
        float _720 = _158 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _726 = int(_724);
    float _728 = in.m_61.x;
    float _730 = float(_122);
    float _732 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = in.m_61.y;
    float _736 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _738 = int(_736);
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _744 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _746 = isnan(_722);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _760 = float(_726);
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _764 = int(_762);
    bool _766 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _768 = isnan(_722);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = float(_738);
    float _780 = 1.0 / _760;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _782;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _788 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[88].z, _786);
    float _790 = float(uint(_764));
    float _792 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _794 = int(_792);
    int _796 = ~_764;
    int _798 = _796 + 1;
    bool _800 = _764 == 0;
    float _802 = _780 * _158;
    float _804 = 1.0 / _778;
    float _806 = 1.0 / _790;
    float _808 = float(uint(_794));
    int _810 = ~_794;
    int _812 = _810 + 1;
    int _814 = ~_794;
    int _816 = _814 + 1;
    float _818 = trunc(_802);
    int _820 = int(_818);
    float _822 = _804 * _158;
    int _824 = ~_764;
    int _826 = _824 + 1;
    int _828 = as_type<int>(_806) + (-2);
    float _830 = 1.0 / _808;
    float _832 = float(uint(_820));
    float _834 = trunc(_822);
    int _836 = int(_834);
    float _838 = as_type<float>(_828) * _832;
    int _840 = as_type<int>(_830) + (-2);
    float _842 = 1.0 / _730;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _846 = _844 != 0;
    float _848 = float(uint(_836));
    float _850 = trunc(_838);
    float _852 = precise::max(_850, 0.0);
    uint _855 = uint(_852);
    float _857 = as_type<float>(_840) * _848;
    float _859 = trunc(_857);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    float _865 = _728;
    if (_846)
    {
        _130 = 1.0;
    }
    float _867 = _130;
    float _869 = _867;
    if (!_846)
    {
        _869 = 7.345489978790283203125;
    }
    float _871 = _869;
    int _873 = _826 * int(_855);
    int _875 = _873 + _820;
    float _877 = float(_820);
    float _879 = 1.0 / _758;
    float _881 = float(uint(_875));
    float _883 = _871 * _728;
    float _885 = as_type<float>(_828) * _881;
    int _887 = ~_794;
    int _889 = _887 + 1;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _893 = _889 * int(_863);
    int _895 = _893 + _836;
    float _897 = trunc(_885);
    float _899 = precise::max(_897, 0.0);
    uint _901 = uint(_899);
    float _903 = float(uint(_895));
    float _905 = as_type<float>(_840) * _903;
    float _907 = _903;
    float _909 = as_type<float>(_855);
    if (_846)
    {
        _907 = 1.0;
    }
    float _911 = _907;
    float _913 = floor(_883);
    float _915 = _911;
    if (!_846)
    {
        _915 = 1.2345600128173828125;
    }
    float _917 = _915;
    int _919 = int(_855) + int(_901);
    float _921 = trunc(_905);
    float _923 = precise::max(_921, 0.0);
    uint _925 = uint(_923);
    float _927 = float(_764);
    if (_846)
    {
        _909 = _728;
    }
    float _929 = _909;
    int _931 = _798 * _919;
    int _933 = _931 + _820;
    bool _935 = _877 >= _927;
    bool _937 = isnan(_877);
    bool _939 = _935 || _937;
    bool _941 = isnan(_927);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = _929;
    if (!_846)
    {
        _947 = _734;
    }
    float _949 = _947;
    float _951 = -_913;
    float _953 = _883 + _951;
    bool _955 = uint(_933) >= uint(_764);
    float _957 = trunc(_945);
    int _959 = int(_957);
    float _961 = _949 * _917;
    bool _963 = !_955;
    int _965 = _963 ? 0 : (-1);
    int _967 = int(_863) + int(_925);
    float _969 = floor(_961);
    int _971 = ~_919;
    int _973 = _971 + _965;
    int _975 = _973 + 1;
    float _977 = _927 * _158;
    float _979 = float(_794);
    int _981 = _812 * _967;
    int _983 = _981 + _836;
    float _985 = _953 * _927;
    int _987 = _764 * _975;
    int _989 = _987 + _820;
    float _991 = _977 * _842;
    float _993 = _979 * _158;
    int _995 = ~_959;
    int _997 = _995 + 1;
    int _999 = _997 + 1;
    float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1003 = !_800;
    int _1005 = _1003 ? _989 : (-1);
    float _1007 = _993 * _842;
    bool _1009 = uint(_983) >= uint(_794);
    int _1011 = _1005 * _999;
    bool _1013 = !_1009;
    int _1015 = _1013 ? 0 : (-1);
    float _1017 = -_969;
    float _1019 = _961 + _1017;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1027 = _1025 != 0;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1031 = _1029 != 0;
    float _1033 = trunc(_985);
    int _1035 = int(_1033);
    int _1037 = _764 + (-1);
    float _1039 = _979 * _1019;
    int _1041 = ~_967;
    int _1043 = _1041 + _1015;
    int _1045 = _1043 + 1;
    int _1047 = _959 * _1037;
    int _1049 = _1047 + _1011;
    bool _1051 = !_1027;
    int _1053 = _1051 ? 0 : 1;
    float _1055 = trunc(_991);
    int _1057 = int(_1055);
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1061 = _1059 != 0;
    float _1063 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1065 = !_1023;
    int _1067 = _1065 ? 0 : 1;
    float _1069 = float(_836);
    int _1071 = abs(_1053);
    float _1073 = trunc(_1007);
    int _1075 = int(_1073);
    bool _1077 = !_1061;
    int _1079 = _1077 ? 0 : 1;
    bool _1081 = !_1031;
    int _1083 = _1081 ? 0 : 1;
    int _1085 = abs(_1067);
    bool _1087 = _1069 >= _979;
    bool _1089 = isnan(_1069);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan(_979);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = trunc(_1039);
    int _1101 = int(_1099);
    int _1103 = abs(_1079);
    int _1105 = abs(_1083);
    int _1107 = _1049 * _1071;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1111 = _1109 != 0;
    float _1113 = trunc(_1097);
    int _1115 = int(_1113);
    int _1117 = _1035 * _1103;
    int _1119 = _1117 + _820;
    bool _1121 = !_1111;
    int _1123 = _1121 ? 0 : 1;
    float _1125 = in.m_61.z;
    int _1127 = _1057 * _1085;
    int _1129 = _1127 + _1107;
    int _1131 = abs(_1123);
    int _1133 = _794 * _1045;
    int _1135 = _1133 + _836;
    bool _1137 = _794 == 0;
    int _1139 = _1119 * _1105;
    int _1141 = _1139 + _1129;
    int _1143 = ~_794;
    int _1145 = _1143 + 1;
    bool _1147 = !_1137;
    int _1149 = _1147 ? _1135 : (-1);
    int _1151 = _1035 * _1131;
    int _1153 = _1151 + _1141;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1161 = _1159 != 0;
    int _1163 = ~_1115;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = float(uint(_1153));
    bool _1171 = !_1161;
    int _1173 = _1171 ? 0 : 1;
    int _1175 = _1167 * _1149;
    int _1177 = _794 + (-1);
    float _1179 = as_type<float>(_828) * _1169;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1183 = _1181 != 0;
    int _1185 = abs(_1173);
    int _1187 = _1115 * _1177;
    int _1189 = _1187 + _1175;
    bool _1191 = !_1183;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = trunc(_1179);
    float _1197 = precise::max(_1195, 0.0);
    uint _1199 = uint(_1197);
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1203 = _1201 != 0;
    int _1205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1207 = _1205 != 0;
    int _1209 = _1189 * _1185;
    bool _1211 = !_1157;
    int _1213 = _1211 ? 0 : 1;
    int _1215 = abs(_1193);
    bool _1217 = !_1203;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = abs(_1213);
    bool _1223 = !_1207;
    int _1225 = _1223 ? 0 : 1;
    int _1227 = _1075 * _1221;
    int _1229 = _1227 + _1209;
    int _1231 = ~_764;
    int _1233 = _1231 + 1;
    int _1235 = _1101 * _1215;
    int _1237 = _1235 + _836;
    int _1239 = abs(_1219);
    int _1241 = abs(_1225);
    int _1243 = _1233 * int(_1199);
    int _1245 = _1243 + _1153;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1249 = _1247 != 0;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1253 = _1251 != 0;
    int _1255 = _1237 * _1239;
    int _1257 = _1255 + _1229;
    float _1259 = float(uint(_1245));
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1263 = _1261 != 0;
    int _1265 = _1101 * _1241;
    int _1267 = _1265 + _1257;
    bool _1269 = _764 == 0;
    float _1271 = as_type<float>(_828) * _1259;
    float _1273 = float(uint(_1119));
    float _1275 = in.m_61.w;
    float _1277 = float(uint(_1267));
    bool _1279 = _1157;
    int _1281 = _1071;
    if (_1249)
    {
        bool _1283 = _728 > 0.5;
        _1279 = _1283;
    }
    bool _1285 = _1279;
    float _1287 = trunc(_1271);
    float _1289 = precise::max(_1287, 0.0);
    uint _1291 = uint(_1289);
    float _1293 = 0.0;
    if (!_1249)
    {
        _1293 = _180;
    }
    float _1295 = _1293;
    float _1297 = as_type<float>(_840) * _1277;
    float _1299 = _1295;
    if (_1253)
    {
        float _1301 = -_180;
        float _1303 = _1301 + 1.0;
        _1281 = as_type<int>(_1303);
    }
    int _1305 = _1281;
    float _1307 = 0.0;
    if (!_1253)
    {
        _1307 = _180;
    }
    float _1309 = _1307;
    float _1311 = as_type<float>(_828) * _1273;
    float _1313 = trunc(_1297);
    float _1315 = precise::max(_1313, 0.0);
    uint _1317 = uint(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1323 = int(_1199) + int(_1291);
    int _1325 = int(_1291);
    float _1327 = _1309;
    if (_1249)
    {
        float _1329 = -_180;
        float _1331 = _1329 + 1.0;
        _1325 = as_type<int>(_1331);
    }
    int _1333 = _1325;
    float _1335 = trunc(_1311);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    int _1341 = _1233 * _1323;
    int _1343 = _1341 + _1153;
    if (_1249)
    {
        float _1345 = _1285 ? as_type<float>(_1333) : _180;
        _1299 = _1345;
    }
    float _1347 = _1299;
    float _1349 = -_184;
    float _1351 = _1349 + 1.0;
    int _1353 = _1145 * int(_1317);
    int _1355 = _1353 + _1267;
    bool _1357 = _734 > 0.5;
    float _1359 = 1.0 / _1321;
    bool _1361 = uint(_1343) >= uint(_764);
    float _1363 = float(uint(_1355));
    bool _1365 = !_1361;
    int _1367 = _1365 ? 0 : (-1);
    bool _1369 = _1125 > 0.5;
    float _1371 = as_type<float>(_840) * _1363;
    int _1373 = _1357 ? as_type<int>(_1351) : as_type<int>(_184);
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1377 = _1375 != 0;
    float _1379 = trunc(_1371);
    float _1381 = precise::max(_1379, 0.0);
    uint _1383 = uint(_1381);
    float _1385 = _1263 ? as_type<float>(_1373) : _184;
    bool _1387 = _1275 > 0.5;
    int _1389 = ~_1323;
    int _1391 = _1389 + _1367;
    int _1393 = _1391 + 1;
    if (_1253)
    {
        float _1395 = _1369 ? as_type<float>(_1305) : _180;
        _1327 = _1395;
    }
    float _1397 = _1327;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1401 = _1399 != 0;
    int _1403 = _764 * _1393;
    int _1405 = _1403 + _1153;
    int _1407 = _1387 ? as_type<int>(_1351) : as_type<int>(_184);
    int _1409 = ~_794;
    int _1411 = _1409 + 1;
    float _1413 = _1401 ? as_type<float>(_1407) : _184;
    if (_1377)
    {
        float _1415 = _1369 ? _1351 : _184;
        _212 = _1415;
    }
    float _1417 = _212;
    bool _1419 = !_1269;
    int _1421 = _1419 ? _1405 : (-1);
    int _1423 = int(_1317) + int(_1383);
    float _1425 = fma(_1063, _1417, -0.5);
    int _1427 = _1421 & 3;
    bool _1429 = _1427 != 0;
    int _1431 = _1421 & 3;
    bool _1433 = _1431 != 0;
    int _1435 = _1411 * _1423;
    int _1437 = _1435 + _1267;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1441 = _1439 != 0;
    bool _1443 = uint(_1427) >= 2u;
    int _1445 = _1433 ? 0 : 1;
    bool _1447 = _734 > 0.5;
    bool _1449 = _1447 && _1441;
    int _1451 = _1443 ? 0 : 1;
    bool _1453 = uint(_1437) >= uint(_794);
    bool _1455 = !_1453;
    int _1457 = _1455 ? 0 : (-1);
    bool _1459 = uint(_1427) > 1u;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1463 = _1461 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1465 = ~_1423;
    int _1467 = _1465 + _1457;
    int _1469 = _1467 + 1;
    float _1471 = 0.0;
    if (!_1441)
    {
        _1471 = _180;
    }
    float _1473 = _1471;
    float _1475 = _1473;
    if (_1449)
    {
        float _1477 = -_180;
        float _1479 = _1477 + 1.0;
        _214 = _1479;
    }
    float _1481 = _214;
    bool _1483 = _1427 != 3;
    int _1485 = _794 * _1469;
    int _1487 = _1485 + _1267;
    int _1489 = ~_1445;
    int _1491 = _1489 + 1;
    int _1493 = _1491 + 1;
    float _1495 = 1.0 / _1463;
    bool _1497 = !_1137;
    int _1499 = _1497 ? _1487 : (-1);
    int _1501 = _1493;
    if (!_1459)
    {
        int _1503 = ~_1445;
        int _1505 = _1503 + 1;
        _1501 = _1505;
    }
    int _1507 = _1501;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1513 = ~_1451;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    int _1519 = _1499 & 3;
    bool _1521 = _1519 != 0;
    float _1523 = 1.0 / _1511;
    int _1525 = _1517;
    if (_1483)
    {
        int _1527 = ~_1451;
        int _1529 = _1527 + 1;
        _1525 = _1529;
    }
    int _1531 = _1525;
    float _1533 = _1125 * 2.0;
    bool _1535 = _1519 != 3;
    if (_1441)
    {
        _1475 = _1481;
    }
    float _1537 = _1475;
    float _1539 = _728 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1541 = uint(_1519) >= 2u;
    float _1543 = floor(_1533);
    int _1545 = _1521 ? 0 : 1;
    float _1547 = -_740;
    float _1549 = fma(_1539, 2.0, _1547);
    int _1551 = _1541 ? 0 : 1;
    float _1553 = _734 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1555 = ~_1545;
    int _1557 = _1555 + 1;
    int _1559 = _1557 + 1;
    float _1561 = -_158;
    float _1563 = fma(_1561, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1549);
    int _1565 = ~_1551;
    int _1567 = _1565 + 1;
    int _1569 = _1567 + 1;
    float _1571 = fma(_1553, -2.0, _742);
    int _1573 = _1569;
    int _1575 = _1559;
    if (_1535)
    {
        int _1577 = ~_1551;
        int _1579 = _1577 + 1;
        _1573 = _1579;
    }
    int _1581 = _1573;
    bool _1583 = uint(_1519) > 1u;
    float _1585 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1571);
    float _1587 = float(uint(_1237));
    int _1589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1591 = _1589 != 0;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1595 = _1593 != 0;
    float _1597 = as_type<float>(_840) * _1587;
    int _1599 = ~_764;
    int _1601 = _1599 + 1;
    float _1603 = trunc(_1597);
    float _1605 = precise::max(_1603, 0.0);
    uint _1607 = uint(_1605);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1609;
    if (!_1583)
    {
        int _1613 = ~_1545;
        int _1615 = _1613 + 1;
        _1575 = _1615;
    }
    int _1617 = _1575;
    int _1619 = _1601 * int(_1339);
    int _1621 = _1619 + _1119;
    bool _1623 = _1543 >= 0.0;
    bool _1625 = isnan(_1543);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan(0.0);
    bool _1631 = _1627 || _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1635 = _1633 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1637 = _1611 * _1523;
    float _1639 = _1631 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1643 = _1641 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1645 = _1543 > 0.0;
    float _1647 = _734 * 2.0;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1653 = float(uint(_1621));
    float _1655 = 1.0 / _1635;
    int _1657 = _816 * int(_1607);
    int _1659 = _1657 + _1237;
    float _1661 = _1643 * _1495;
    float _1663 = as_type<float>(_828) * _1653;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1667 = _1665 != 0;
    float _1669 = floor(_1647);
    float _1671 = float(uint(_1659));
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1675 = _1673 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1677;
    int _1681 = ~as_type<int>(_1639);
    int _1683 = _1681 + 1;
    int _1685 = _1683 + 1;
    float _1687 = as_type<float>(_840) * _1671;
    int _1689 = _1685;
    float _1691 = _1639;
    float _1693 = _1663;
    if (!_1645)
    {
        int _1695 = ~as_type<int>(_1639);
        int _1697 = _1695 + 1;
        _1689 = _1697;
    }
    int _1699 = _1689;
    float _1701 = 1.0 / _1651;
    float _1703 = _1679 * _1359;
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1709 = !_1591;
    int _1711 = _1709 ? 0 : 1;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1717 = ~_794;
    int _1719 = _1717 + 1;
    int _1721 = 0;
    float _1723 = _1715;
    if (_1667)
    {
        _1721 = 0;
    }
    int _1725 = _1721;
    float _1727 = trunc(_1663);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    bool _1733 = _1669 > 0.0;
    float _1735 = _1715 * _879;
    bool _1737 = _1669 >= 0.0;
    bool _1739 = isnan(_1669);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(0.0);
    bool _1745 = _1741 || _1743;
    int _1747 = _1725;
    float _1749 = _1669;
    if (!_1667)
    {
        _1747 = 2;
    }
    int _1751 = _1747;
    int _1753 = abs(_1507);
    float _1755 = 1.0 / _1675;
    float _1757 = _1707 * _1701;
    int _1759 = _1745 ? 0 : 1;
    int _1761 = ~_1759;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    float _1767 = trunc(_1687);
    float _1769 = precise::max(_1767, 0.0);
    uint _1771 = uint(_1769);
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1773;
    int _1777 = int(_1339) + int(_1731);
    int _1779 = _1765;
    int _1781 = as_type<int>(_1775);
    if (!_1733)
    {
        int _1783 = ~_1759;
        int _1785 = _1783 + 1;
        _1779 = _1785;
    }
    int _1787 = _1779;
    float _1789 = _1775 * _1655;
    if (_1667)
    {
        _1781 = 0;
    }
    int _1791 = _1781;
    int _1793 = _1791;
    if (!_1667)
    {
        _1793 = 1;
    }
    int _1795 = _1793;
    float _1797 = _784 * _1755;
    bool _1799 = _1795 != 1;
    int _1801 = ~_764;
    int _1803 = _1801 + 1;
    int _1805 = int(_1607) + int(_1771);
    int _1807 = _1803 * _1777;
    int _1809 = _1807 + _1119;
    float _1811 = _728 * 2.0;
    bool _1813 = uint(_1809) >= uint(_764);
    float _1815 = floor(_1811);
    if (!_1799)
    {
        _1723 = _734;
    }
    float _1817 = _1723;
    float _1819 = _1817;
    if (!_1799)
    {
        _1691 = _1125;
    }
    float _1821 = _1691;
    int _1823 = _1719 * _1805;
    int _1825 = _1823 + _1237;
    float _1827 = _1821;
    if (!_1799)
    {
        _1749 = _1817;
    }
    float _1829 = _1749;
    float _1831 = _728 + _734;
    float _1833 = _1829;
    if (!_1799)
    {
        _1693 = _1125;
    }
    float _1835 = _1693;
    float _1837 = _1835;
    if (_1799)
    {
        _1833 = _728;
    }
    float _1839 = _1833;
    float _1841 = _1831 + (-1.0);
    if (_1799)
    {
        _1819 = _728;
    }
    float _1843 = _1819;
    if (_1799)
    {
        _1827 = _734;
    }
    float _1845 = _1827;
    float _1847 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_1799)
    {
        _1837 = _734;
    }
    float _1849 = _1837;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1853 = _722 + _1851;
    bool _1855 = uint(_1825) >= uint(_794);
    float _1857 = _734 + _1125;
    bool _1859 = !_1813;
    int _1861 = _1859 ? 0 : (-1);
    float _1863 = fma(_1637, _1853, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1865 = !_1855;
    int _1867 = _1865 ? 0 : (-1);
    float _1869 = _1857 + (-1.0);
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1873 = _1871 != 0;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1877 = _1875 != 0;
    int _1879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1881 = _1879 != 0;
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1885 = _722 + _1883;
    bool _1887 = _1815 > 0.0;
    float _1889 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1891 = _1815 >= 0.0;
    bool _1893 = isnan(_1815);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(0.0);
    bool _1899 = _1895 || _1897;
    float _1901 = -_754;
    float _1903 = _1901 + 1.0;
    bool _1905 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1907 = isnan(_722);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1919 = _722 + _1917;
    bool _1921 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1923 = isnan(_722);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    float _1933 = fma(_1661, _1885, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1935 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1937 = isnan(_722);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = -_1915;
    float _1949 = _1947 + 1.0;
    float _1951 = _1915 * _1903;
    float _1953 = fma(_1703, _1919, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1955 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1957 = isnan(_722);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1963 = _1959 || _1961;
    float _1965 = float(_1963);
    float _1967 = _1931 * _1949;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1971 = _722 + _1969;
    float _1973 = -_1931;
    float _1975 = _1973 + 1.0;
    float _1977 = -_1945;
    float _1979 = _1977 + 1.0;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1983 = _722 + _1981;
    float _1985 = fma(_1757, _1971, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1987 = _1965 * _1975;
    bool _1989 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1991 = isnan(_722);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    float _2001 = _776 * _1979;
    float _2003 = -_1965;
    float _2005 = _2003 + 1.0;
    float _2007 = -_776;
    float _2009 = _2007 + 1.0;
    float _2011 = fma(_1735, _1983, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2013 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2015 = isnan(_722);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = _1945 * _2005;
    float _2027 = _1999 * _2009;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2031 = _722 + _2029;
    float _2033 = -_1999;
    float _2035 = _2033 + 1.0;
    int _2037 = _1899 ? 0 : 1;
    float _2039 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2041 = _1751 != 2;
    float _2043 = fma(_1789, _2031, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2047 = _722 + _2045;
    float _2049 = _2023 * _2035;
    float _2051 = -_2023;
    float _2053 = _2051 + 1.0;
    float _2055 = in.m_48.x;
    float _2057 = in.m_48.y;
    float _2059 = in.m_48.z;
    bool _2061 = !_1877;
    int _2063 = _2061 ? 0 : 1;
    float _2065 = _1863 * _2049;
    float _2067 = fma(_1797, _2047, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2069 = _891 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2071 = !_1873;
    int _2073 = _2071 ? 0 : 1;
    float _2075 = fma(_2053, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2065);
    int _2077 = ~_2037;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = in.m_69.y;
    int _2085 = _2081;
    float _2087 = _1933;
    if (!_1887)
    {
        int _2089 = ~_2037;
        int _2091 = _2089 + 1;
        _2085 = _2091;
    }
    int _2093 = _2085;
    float _2095 = fma(_1933, _2027, _2075);
    int _2097 = abs(_2063);
    float _2099 = fma(_2069, _1537, -0.5);
    float _2101 = float(_1699);
    float _2103 = fma(_1953, _2001, _2095);
    int _2105 = abs(_2073);
    float _2107 = float(_2097);
    float _2109 = fma(_1985, _2025, _2103);
    float _2111 = float(_2093);
    if (_2041)
    {
        _2087 = _728;
    }
    float _2113 = _2087;
    float _2115 = fma(_2043, _1987, _2109);
    float _2117 = float(_2105);
    float _2119 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2121 = _2107 * _2111;
    float _2123 = _2113;
    if (!_2041)
    {
        _2123 = _1125;
    }
    float _2125 = _2123;
    float _2127 = fma(_2055, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2119);
    float _2129 = _2117 * _2101;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2133 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2135 = _2057 + _2083;
    float _2137 = fma(_2059, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2127);
    float _2139 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2141 = fma(_2055, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2133);
    float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2145 = _2135 + _2143;
    float _2147 = _2137 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2149 = -_2131;
    float _2151 = fma(_2139, 2.0, _2149);
    int _2153 = _1421 >> 31;
    float _2155 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2159 = _2147 + _2157;
    float _2161 = fma(_2059, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2141);
    int _2163 = _1499 >> 31;
    float _2165 = -_158;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2151);
    bool _2169 = !_1429;
    int _2171 = _2169 ? 0 : 1;
    float _2173 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2155);
    int _2175 = _1499 & 3;
    bool _2177 = _2175 != 0;
    float _2179 = _2161 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2181 = _2153 & 3;
    float _2183 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2185 = _2163 & 3;
    float _2187 = fma(_2011, _1967, _2115);
    bool _2189 = !_2177;
    int _2191 = _2189 ? 0 : 1;
    int _2193 = _1421 + _2181;
    float _2195 = fma(_2067, _1951, _2187);
    bool _2197 = _1427 != 3;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2201 = _2179 + _2199;
    int _2203 = _1499 + _2185;
    float _2205 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2195);
    int _2207 = _2193 >> 2;
    float _2209 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2173);
    bool _2211 = !_2197;
    int _2213 = _2211 ? 0 : (-1);
    float _2215 = _732 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2217 = _1519 != 3;
    out.m_71.x = _2205;
    int _2219 = _2203 >> 2;
    int _2221 = _2207 << 4;
    int _2223 = _2221 + 368;
    bool _2225 = !_2217;
    int _2227 = _2225 ? 0 : (-1);
    int _2229 = _2219 << 4;
    int _2231 = _2229 + 512;
    bool _2233 = _2209 >= 0.0;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _2237 = uint(int(uint(_2223) >> uint(2)));
    uint _2239 = uint(int(uint(int(_2237)) >> uint(2)));
    int _2241 = int(_2237) & 3;
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[int(_2239)][_2241];
    int _2245 = int(_2237) + 1;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    int _2249 = _2245 & 3;
    float _2251 = (*spvDescriptorSet0.vp_c9)._m0[int(_2247)][_2249];
    float _2253 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2235);
    float _2255 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _788);
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2259 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2261 = uint(int(uint(_2231) >> uint(2)));
    uint _2263 = uint(int(uint(int(_2261)) >> uint(2)));
    int _2265 = int(_2261) & 3;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[int(_2263)][_2265];
    int _2269 = int(_2261) + 1;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    int _2273 = _2269 & 3;
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[int(_2271)][_2273];
    float _2277 = fma(_2255, _2099, _2167);
    float _2279 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2257);
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2283 = in.m_73.x;
    float _2285 = in.m_73.y;
    float _2287 = in.m_73.z;
    float _2289 = _2129 * (-2.0);
    float _2291 = _2121 * (-2.0);
    float _2293 = -_2281;
    float _2295 = fma(_2183, 2.0, _2293);
    int _2297 = _2223 + 8;
    uint _2299 = uint(int(uint(_2297) >> uint(2)));
    uint _2301 = uint(int(uint(int(_2299)) >> uint(2)));
    int _2303 = int(_2299) & 3;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[int(_2301)][_2303];
    int _2307 = int(_2299) + 1;
    uint _2309 = uint(int(uint(_2307) >> uint(2)));
    int _2311 = _2307 & 3;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[int(_2309)][_2311];
    float _2315 = _2183;
    float _2317 = _2147;
    if (_2233)
    {
        _2315 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2319 = _2315;
    float _2321 = fma(_1889, _2291, _1889);
    int _2323 = abs(_2171);
    float _2325 = fma(_2039, -2.0, _2259);
    int _2327 = ~_1777;
    int _2329 = _2327 + _1861;
    int _2331 = _2329 + 1;
    int _2333 = as_type<int>(_2319);
    if (_2233)
    {
        float _2335 = _2319 * 5.0;
        _2333 = as_type<int>(_2335);
    }
    int _2337 = _2333;
    int _2339 = _2231 + 8;
    uint _2341 = uint(int(uint(_2339) >> uint(2)));
    uint _2343 = uint(int(uint(int(_2341)) >> uint(2)));
    int _2345 = int(_2341) & 3;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[int(_2343)][_2345];
    int _2349 = int(_2341) + 1;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    int _2353 = _2349 & 3;
    float _2355 = (*spvDescriptorSet0.vp_c9)._m0[int(_2351)][_2353];
    int _2357 = _764 * _2331;
    int _2359 = _2357 + _1119;
    int _2361 = abs(_2191);
    if (_2233)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9006 = as_type<float>(_2337);
        out.gl_Position.z = _9006;
    }
    int _2363 = abs(_2213);
    float _2365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2367 = log2(_2365);
    int _2369 = ~_1805;
    int _2371 = _2369 + _1867;
    int _2373 = _2371 + 1;
    float _2375 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2279);
    int _2377 = abs(_2227);
    float _2379 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2253);
    bool _2381 = _764 == 0;
    float _2383 = fma(_2291, _2285, _2285);
    int _2385 = abs(_1617);
    float _2387 = fma(_2289, _2283, _2283);
    float _2389 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2391 = int(_2389);
    int _2393 = _794 * _2373;
    int _2395 = _2393 + _1237;
    int _2397 = ~_1753;
    int _2399 = _2397 + 1;
    int _2401 = _2399 + 1;
    float _2403 = -_158;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2295);
    int _2407 = ~_2385;
    int _2409 = _2407 + 1;
    int _2411 = _2409 + 1;
    float _2413 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2325);
    int _2415 = ~_2323;
    int _2417 = _2415 + 1;
    int _2419 = _2417 + 1;
    int _2421 = _2401 * as_type<int>(_2251);
    float _2423 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2425 = int(_2423);
    bool _2427 = _794 == 0;
    float _2429 = fma(_1847, _2289, _1847);
    int _2431 = _2419 * as_type<int>(_2243);
    int _2433 = _2431 + _2421;
    int _2435 = abs(_1531);
    if (_2233)
    {
        out.m_51.x = 0.0;
    }
    int _2437 = abs(_1581);
    int _2439 = _2411 * as_type<int>(_2275);
    int _2441 = ~_2361;
    int _2443 = _2441 + 1;
    int _2445 = _2443 + 1;
    int _2447 = ~_2435;
    int _2449 = _2447 + 1;
    int _2451 = _2449 + 1;
    float _2453 = float(uint(_2391));
    int _2455 = _2445 * as_type<int>(_2267);
    int _2457 = _2455 + _2439;
    int _2459 = ~_2363;
    int _2461 = _2459 + 1;
    int _2463 = _2461 + 1;
    int _2465 = _2451 * as_type<int>(_2305);
    int _2467 = _2465 + _2433;
    int _2469 = ~_2437;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    float _2475 = 1.0 / _2453;
    int _2477 = _2463 * as_type<int>(_2313);
    int _2479 = _2477 + _2467;
    bool _2481 = !_1595;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _2473 * as_type<int>(_2347);
    int _2487 = _2485 + _2457;
    int _2489 = abs(_1711);
    float _2491 = _2367 * _158;
    int _2493 = abs(_2483);
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2497 = 1.0 + _2495;
    bool _2499 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2501 = isnan(1.0);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2507 = _2503 || _2505;
    float _2509 = exp2(_2491);
    float _2511 = float(uint(_2425));
    int _2513 = abs(_2391);
    int _2515 = ~_2489;
    int _2517 = _2515 + 1;
    int _2519 = _2517 + 1;
    int _2521 = ~_2377;
    int _2523 = _2521 + 1;
    int _2525 = _2523 + 1;
    float _2527 = 1.0 / _2511;
    float _2529 = float(uint(_2513));
    int _2531 = _2479 * _2519;
    int _2533 = ~_2493;
    int _2535 = _2533 + 1;
    int _2537 = _2535 + 1;
    int _2539 = _2525 * as_type<int>(_2355);
    int _2541 = _2539 + _2487;
    bool _2543 = !_2381;
    int _2545 = _2543 ? _2359 : (-1);
    bool _2547 = !_2427;
    int _2549 = _2547 ? _2395 : (-1);
    float _2551 = 1.0 / _2529;
    int _2553 = _2537 * _2541;
    int _2555 = abs(_2425);
    int _2557 = _2545 * _2489;
    int _2559 = _2557 + _2531;
    int _2561 = as_type<int>(_2475) + (-2);
    int _2563 = _2549 * _2493;
    int _2565 = _2563 + _2553;
    float _2567 = float(uint(_2555));
    float _2569 = -_2509;
    float _2571 = _2569 + 1.0;
    float _2573 = float(uint(_2559));
    float _2575 = 1.0 / _2497;
    float _2577 = as_type<float>(_2531);
    if (_2041)
    {
        _2577 = _734;
    }
    float _2579 = _2577;
    float _2581 = as_type<float>(_2561) * _2573;
    int _2583 = as_type<int>(_2527) + (-2);
    float _2585 = _2579;
    if (!_2041)
    {
        _2585 = _728;
    }
    float _2587 = _2585;
    float _2589 = 1.0 / _2567;
    float _2591 = float(uint(_2565));
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2595 = abs(_2559);
    float _2597 = _2587 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2599 = as_type<int>(_2551) + (-2);
    float _2601 = as_type<float>(_2583) * _2591;
    int _2603 = abs(_2565);
    float _2605 = trunc(_2581);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    float _2611 = float(uint(_2595));
    float _2613 = fma(_2597, -2.0, _2593);
    float _2615 = _728 + (-0.5);
    int _2617 = ~_2391;
    int _2619 = _2617 + 1;
    float _2621 = as_type<float>(_2599) * _2611;
    float _2623 = float(uint(_2603));
    float _2625 = trunc(_2601);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    int _2631 = as_type<int>(_2589) + (-2);
    float _2633 = fma(_2615, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2387);
    float _2635 = _2145 * _2145;
    float _2637 = as_type<float>(_2631) * _2623;
    int _2639 = ~_2425;
    int _2641 = _2639 + 1;
    int _2643 = _2619 * int(_2609);
    int _2645 = _2643 + _2559;
    float _2647 = trunc(_2621);
    float _2649 = precise::max(_2647, 0.0);
    uint _2651 = uint(_2649);
    int _2653 = ~_2555;
    int _2655 = _2653 + 1;
    float _2657 = float(uint(_2645));
    float _2659 = fma(_2159, _2159, _2635);
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2663 = trunc(_2637);
    float _2665 = precise::max(_2663, 0.0);
    uint _2667 = uint(_2665);
    float _2669 = as_type<float>(_2561) * _2657;
    int _2671 = ~_2513;
    int _2673 = _2671 + 1;
    float _2675 = fma(_2201, _2201, _2659);
    float _2677 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2661);
    int _2679 = _2641 * int(_2629);
    int _2681 = _2679 + _2565;
    bool _2683 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2685 = isnan(0.0);
    bool _2687 = _2683 || _2685;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2691 = _2687 || _2689;
    float _2693 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2677);
    float _2695 = rsqrt(_2675);
    float _2697 = float(uint(_2681));
    int _2699 = _2673 * int(_2651);
    int _2701 = _2699 + _2595;
    float _2703 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2613);
    float _2705 = _2691 ? _2571 : 0.0;
    int _2707 = _2655 * int(_2667);
    int _2709 = _2707 + _2603;
    float _2711 = float(uint(_2701));
    float _2713 = as_type<float>(_2583) * _2697;
    float _2715 = trunc(_2669);
    float _2717 = precise::max(_2715, 0.0);
    uint _2719 = uint(_2717);
    float _2721 = float(uint(_2709));
    float _2723 = as_type<float>(_2599) * _2711;
    float _2725 = -_2703;
    float _2727 = fma(_2693, _1425, _2725);
    float _2729 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2733 = as_type<float>(_2631) * _2721;
    float _2735 = _2215 * _2695;
    float _2737 = trunc(_2713);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    float _2743 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2729);
    float _2745 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2731);
    int _2747 = ~_2391;
    int _2749 = _2747 + 1;
    float _2751 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2743);
    float _2753 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2745);
    if (_2507)
    {
        float _2755 = _2705 * _2575;
        _162 = _2755;
    }
    float _2757 = _162;
    float _2759 = trunc(_2723);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    float _2765 = _2145 * _2735;
    int _2767 = int(_2609) + int(_2719);
    float _2769 = _2159 * _2735;
    int _2771 = ~_2425;
    int _2773 = _2771 + 1;
    float _2775 = fma(_2429, _2757, _2633);
    int _2777 = ~_2555;
    int _2779 = _2777 + 1;
    float _2781 = trunc(_2733);
    float _2783 = precise::max(_2781, 0.0);
    uint _2785 = uint(_2783);
    int _2787 = int(_2629) + int(_2741);
    bool _2789 = _2425 == 0;
    int _2791 = _2773 * _2787;
    int _2793 = _2791 + _2565;
    int _2795 = int(_2651) + int(_2763);
    float _2797 = -_2765;
    float _2799 = _2145 + _2797;
    float _2801 = -_2769;
    float _2803 = _2159 + _2801;
    int _2805 = _2749 * _2767;
    int _2807 = _2805 + _2559;
    bool _2809 = uint(_2793) >= uint(_2425);
    float _2811 = _2799 * _2799;
    int _2813 = int(_2667) + int(_2785);
    float _2815 = fma(_2803, _2803, _2811);
    int _2817 = ~_2513;
    int _2819 = _2817 + 1;
    bool _2821 = uint(_2807) >= uint(_2391);
    bool _2823 = !_2821;
    int _2825 = _2823 ? 0 : (-1);
    int _2827 = _2819 * _2795;
    int _2829 = _2827 + _2595;
    bool _2831 = !_2809;
    int _2833 = _2831 ? 0 : (-1);
    int _2835 = _2779 * _2813;
    int _2837 = _2835 + _2603;
    int _2839 = ~_2767;
    int _2841 = _2839 + _2825;
    int _2843 = _2841 + 1;
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2847 = uint(_2829) >= uint(_2513);
    bool _2849 = uint(_2837) >= uint(_2555);
    int _2851 = _2559 ^ _2391;
    bool _2853 = !_2847;
    int _2855 = _2853 ? 0 : (-1);
    float _2857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2859 = _2391 == 0;
    bool _2861 = _2391 == 0;
    int _2863 = _2391 * _2843;
    int _2865 = _2863 + _2559;
    uint _2867 = uint(int(uint(_2851) >> uint(31)));
    int _2869 = _2565 ^ _2425;
    float _2871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2873 = ~_2787;
    int _2875 = _2873 + _2833;
    int _2877 = _2875 + 1;
    int _2879 = ~_2855;
    int _2881 = _2795 + _2879;
    int _2883 = _2881 + 1;
    int _2885 = ~int(_2867);
    int _2887 = _2885 + 1;
    int _2889 = _2425 * _2877;
    int _2891 = _2889 + _2565;
    bool _2893 = !_2849;
    int _2895 = _2893 ? 0 : (-1);
    float _2897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2899 = uint(int(uint(_2869) >> uint(31)));
    int _2901 = _2883 ^ _2887;
    int _2903 = ~_2895;
    int _2905 = _2813 + _2903;
    int _2907 = _2905 + 1;
    int _2909 = ~int(_2899);
    int _2911 = _2909 + 1;
    bool _2913 = !_2859;
    int _2915 = _2913 ? _2865 : (-1);
    int _2917 = ~_2887;
    int _2919 = _2917 + _2901;
    int _2921 = _2919 + 1;
    int _2923 = _2907 ^ _2911;
    bool _2925 = _2425 == 0;
    float _2927 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2929 = !_2789;
    int _2931 = _2929 ? _2891 : (-1);
    float _2933 = _2857 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2935 = float(_2915);
    float _2937 = fma(_2927, _1347, -0.5);
    int _2939 = ~_2911;
    int _2941 = _2939 + _2923;
    int _2943 = _2941 + 1;
    float _2945 = fma(_2933, _1397, -0.5);
    float _2947 = float(_2931);
    float _2949 = fma(_2927, _2935, _1563);
    bool _2951 = !_2861;
    int _2953 = _2951 ? _2921 : (-1);
    float _2955 = _2871 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2957 = !_2925;
    int _2959 = _2957 ? _2943 : (-1);
    float _2961 = fma(_2933, _2947, _2405);
    float _2963 = float(_2953);
    float _2965 = _2897 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2967 = float(_2959);
    float _2969 = fma(_1385, _2955, -0.5);
    float _2971 = fma(_2751, _2937, _2949);
    float _2973 = -_1585;
    float _2975 = fma(_2955, _2963, _2973);
    float _2977 = fma(_1413, _2965, -0.5);
    float _2979 = -_2413;
    float _2981 = fma(_2965, _2967, _2979);
    float _2983 = fma(_2375, _2945, _2961);
    float _2985 = fma(_2753, _2969, _2975);
    float _2987 = _2201 * _2735;
    float _2989 = fma(_2379, _2977, _2981);
    float _2991 = _2277 + 0.5;
    float _2993 = _2727 + 0.5;
    float _2995 = _2971 + 0.5;
    float _2997 = _2983 + 0.5;
    float _2999 = _2985 + 0.5;
    float _3001 = _2989 + 0.5;
    float _3003 = -_2987;
    float _3005 = _2201 + _3003;
    bool _3007 = !_1881;
    int _3009 = _3007 ? 0 : 1;
    out.m_75.x = _2991;
    out.m_75.y = _2993;
    float _3011 = fma(_3005, _3005, _2815);
    int _3013 = abs(_3009);
    out.m_77.x = _2995;
    out.m_77.y = _2999;
    out.m_77.z = _2997;
    out.m_77.w = _3001;
    if (_2233)
    {
        return out;
    }
    float _3015 = -_2765;
    float _3017 = _2135 + _3015;
    float _3019 = _734 + (-0.5);
    float _3021 = -_2769;
    float _3023 = _2147 + _3021;
    float _3025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3027 = _3017 + _3025;
    float _3029 = float(_1787);
    float _3031 = -_2987;
    float _3033 = _2179 + _3031;
    float _3035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3037 = _3023 + _3035;
    float _3039 = _3027 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3041 = float(_3013);
    float _3043 = fma(_3019, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2383);
    float _3045 = _728 + _1125;
    float _3047 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3049 = _3033 + _3047;
    float _3051 = fma(_3037, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3039);
    float _3053 = _3041 * _3029;
    float _3055 = _3045 + (-1.0);
    float _3057 = fma(_3049, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3051);
    float _3059 = _3053 * (-2.0);
    float _3061 = _1125 + (-0.5);
    float _3063 = fma(_3055, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3065 = fma(_2321, _2757, _3043);
    float _3067 = fma(_3059, _2287, _2287);
    bool _3069 = _3057 >= 0.0;
    float _3071 = fma(_3063, _3059, _3063);
    float _3073 = _2775 * 0.15915493667125701904296875;
    float _3075 = fma(_3061, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3067);
    float _3077 = _3065 * 0.15915493667125701904296875;
    float _3079 = sqrt(_3011);
    float _3081 = fma(_3071, _2757, _3075);
    float _3083 = _3081 * 0.15915493667125701904296875;
    float _3085 = _3053;
    int _3087 = as_type<int>(_3075);
    float _3089 = _3037;
    if (_3069)
    {
        _3085 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3091 = _3085;
    float _3093 = _3073 * 6.283185482025146484375;
    float _3095 = sin(_3093);
    if (_3069)
    {
        out.m_51.x = 0.0;
    }
    if (_3069)
    {
        float _3097 = _3091 * 5.0;
        _3087 = as_type<int>(_3097);
    }
    int _3099 = _3087;
    float _3101 = _3073 * 6.283185482025146484375;
    float _3103 = cos(_3101);
    if (_3069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10091 = as_type<float>(_3099);
        out.gl_Position.z = _10091;
    }
    float _3105 = _3077 * 6.283185482025146484375;
    float _3107 = sin(_3105);
    float _3109 = _3077 * 6.283185482025146484375;
    float _3111 = cos(_3109);
    float _3113 = _3083 * 6.283185482025146484375;
    float _3115 = sin(_3113);
    if (_3069)
    {
        return out;
    }
    float _3117 = in.m_79.x;
    float _3119 = in.m_79.y;
    float _3121 = in.m_79.z;
    float _3123 = _3083 * 6.283185482025146484375;
    float _3125 = cos(_3123);
    bool _3127 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _3129 = _3095 * _3107;
    bool _3131 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _3133 = _3103 * _3111;
    float _3135 = _2695 * _3079;
    float _3137 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3139 = fma(_3115, _3133, _3129);
    float _3141 = fma(_3115, _3129, _3133);
    float _3143 = _3103 * _3107;
    float _3145 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3147 = _3145 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3149 = _3135 * _3137;
    float _3151 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3153 = _3151 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3155 = _3103 * _3125;
    float _3157 = _732 * _3135;
    float _3159 = _3095 * _3111;
    float _3161 = _1385;
    float _3163 = _3159;
    if (_3127)
    {
        float _3165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _3161 = _3165;
    }
    float _3167 = _3161;
    float _3169 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3117);
    float _3173 = -_3143;
    float _3175 = fma(_3115, _3159, _3173);
    float _3177 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3179 = _3177 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3181 = -_3159;
    float _3183 = fma(_3115, _3143, _3181);
    float _3185 = _3171 * _3157;
    float _3187 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3189 = _3187 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3191 = _3091;
    float _3193 = _3179;
    float _3195 = _3183;
    if (_3131)
    {
        float _3197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _3191 = _3197;
    }
    float _3199 = _3191;
    float _3201 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_3127)
    {
        float _3203 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _3163 = _3203;
    }
    float _3205 = _3163;
    float _3207 = _3111 * _3125;
    float _3209 = _3095 * _3125;
    float _3211 = _3107 * _3125;
    float _3213 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3119);
    float _3215 = 1.0 / _3147;
    float _3217 = _3135 * _3169;
    if (_3131)
    {
        float _3219 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _865 = _3219;
    }
    float _3221 = _865;
    float _3223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3121);
    float _3225 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3227 = _3225 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3229 = _3213 * _3149;
    float _3231 = 1.0 / _3153;
    float _3233 = _3223 * _3217;
    float _3235 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3237 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3235;
    float _3239 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3241 = _3239 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3243 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3245 = _3243 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3247 = 1.0 / _3179;
    float _3249 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3251 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3249;
    float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3259 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _3257;
    float _3261 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3263 = _3261 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3265 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3267 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _3265;
    float _3269 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3271 = _3269 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3273 = 1.0 / _3189;
    if (_3127)
    {
        float _3275 = fma(_3205, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _3193 = _3275;
    }
    float _3277 = _3193;
    if (_3131)
    {
        float _3279 = fma(_3221, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _3201 = _3279;
    }
    float _3281 = _3201;
    float _3283 = _3167;
    float _3285 = _3281;
    if (_3127)
    {
        float _3287 = _3277 * _3167;
        _3283 = _3287;
    }
    float _3289 = _3283;
    float _3291 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3293 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3291;
    float _3295 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3297 = _3295 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3299 = _3293;
    if (_3131)
    {
        float _3301 = _3281 * _3199;
        _3285 = _3301;
    }
    float _3303 = _3285;
    float _3305 = 1.0 / _3227;
    float _3307 = _3237 * _3215;
    float _3309 = _3297 * _3231;
    float _3311 = _3251 * _3247;
    float _3313 = -_3229;
    float _3315 = _3115 * _3313;
    float _3317 = _3255 * _3273;
    float _3319 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _3319;
    float _3323 = _3277;
    if (_3127)
    {
        float _3325 = floor(_3289);
        _3323 = _3325;
    }
    float _3327 = _3323;
    float _3329 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3331 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _3329;
    float _3333 = _3155 * _3229;
    float _3335 = _3209 * _3229;
    float _3337 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3339 = _3337 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3341 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3343 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3341;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3349 = fma(_3175, _3185, _3335);
    float _3351 = 1.0 / _3245;
    float _3353 = _3293 * _3305;
    float _3355 = _3347;
    if (!_3127)
    {
        _3299 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3357 = _3299;
    float _3359 = fma(_3207, _3185, _3315);
    float _3361 = fma(_3141, _3233, _3349);
    float _3363 = fma(_3211, _3233, _3359);
    float _3365 = 1.0 / _3241;
    float _3367 = _3357;
    if (_3127)
    {
        float _3369 = -_3327;
        float _3371 = _3289 + _3369;
        _3367 = _3371;
    }
    float _3373 = _3367;
    float _3375 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3377 = _3373 + _3375;
    bool _3379 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3381 = isnan(_3373);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3387 = _3383 || _3385;
    float _3389 = float(_3387);
    float _3391 = _3245;
    if (_3131)
    {
        float _3393 = floor(_3303);
        _3391 = _3393;
    }
    float _3395 = _3391;
    float _3397 = _3343 * _3351;
    float _3399 = fma(_3139, _3185, _3333);
    float _3401 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3403 = _3373 + _3401;
    float _3405 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3407 = _3373 + _3405;
    float _3409 = fma(_3183, _3233, _3399);
    float _3411 = 1.0 / _3263;
    float _3413 = _3347 * _3365;
    float _3415 = _3409;
    if (!_3131)
    {
        _3355 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3417 = _3355;
    float _3419 = 1.0 / _3271;
    float _3421 = _3417;
    if (_3131)
    {
        float _3423 = -_3395;
        float _3425 = _3303 + _3423;
        _3421 = _3425;
    }
    float _3427 = _3421;
    float _3429 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3431 = _3427 + _3429;
    bool _3433 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3435 = isnan(_3427);
    bool _3437 = _3433 || _3435;
    bool _3439 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3441 = _3437 || _3439;
    float _3443 = float(_3441);
    float _3445 = 1.0 / _3331;
    bool _3447 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3449 = isnan(_3427);
    bool _3451 = _3447 || _3449;
    bool _3453 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3455 = _3451 || _3453;
    float _3457 = float(_3455);
    float _3459 = fma(_3413, _3431, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _3461 = -_3443;
    float _3463 = _3461 + 1.0;
    bool _3465 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3467 = isnan(_3427);
    bool _3469 = _3465 || _3467;
    bool _3471 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3473 = _3469 || _3471;
    float _3475 = float(_3473);
    float _3477 = -_3457;
    float _3479 = _3477 + 1.0;
    float _3481 = 1.0 / _3267;
    float _3483 = _3403 * _3419;
    float _3485 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3487 = _3427 + _3485;
    float _3489 = _3443 * _3479;
    bool _3491 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3493 = isnan(_3427);
    bool _3495 = _3491 || _3493;
    bool _3497 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3499 = _3495 || _3497;
    float _3501 = float(_3499);
    float _3503 = 1.0 / _3321;
    float _3505 = 1.0 / _3339;
    float _3507 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3509 = _3373 + _3507;
    float _3511 = _3509 * _3411;
    float _3513 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3515 = _3373 + _3513;
    float _3517 = 1.0 / _3259;
    float _3519 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3521 = _3373 + _3519;
    float _3523 = _3515 * _3445;
    float _3525 = fma(_3307, _3487, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3529 = _3427 + _3527;
    float _3531 = _3521 * _3481;
    float _3533 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3535 = _3427 + _3533;
    bool _3537 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3539 = isnan(_3427);
    bool _3541 = _3537 || _3539;
    bool _3543 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3545 = _3541 || _3543;
    float _3547 = float(_3545);
    float _3549 = fma(_3309, _3529, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3551 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3553 = _3427 + _3551;
    float _3555 = fma(_3353, _3535, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3557 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3559 = _3427 + _3557;
    float _3561 = _3547 * _3463;
    float _3563 = fma(_3317, _3553, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    bool _3565 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3567 = isnan(_3427);
    bool _3569 = _3565 || _3567;
    bool _3571 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3573 = _3569 || _3571;
    float _3575 = float(_3573);
    float _3577 = fma(_3311, _3559, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3579 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3581 = _3427 + _3579;
    float _3583 = _3407 * _3505;
    float _3585 = -_3547;
    float _3587 = _3585 + 1.0;
    bool _3589 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3591 = isnan(_3427);
    bool _3593 = _3589 || _3591;
    bool _3595 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3597 = _3593 || _3595;
    float _3599 = float(_3597);
    float _3601 = fma(_3397, _3581, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3603 = -_3575;
    float _3605 = _3603 + 1.0;
    float _3607 = _3575 * _3587;
    bool _3609 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3611 = isnan(_3373);
    bool _3613 = _3609 || _3611;
    bool _3615 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3617 = _3613 || _3615;
    float _3619 = float(_3617);
    float _3621 = -_3599;
    float _3623 = _3621 + 1.0;
    float _3625 = _3501 * _3605;
    bool _3627 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3629 = isnan(_3373);
    bool _3631 = _3627 || _3629;
    bool _3633 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3635 = _3631 || _3633;
    float _3637 = float(_3635);
    float _3639 = _3377 * _3517;
    float _3641 = _3457 * _3623;
    float _3643 = -_3619;
    float _3645 = _3643 + 1.0;
    float _3647 = _3525 * _3625;
    float _3649 = -_3475;
    float _3651 = _3649 + 1.0;
    bool _3653 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3655 = isnan(_3373);
    bool _3657 = _3653 || _3655;
    bool _3659 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3661 = _3657 || _3659;
    float _3663 = float(_3661);
    float _3665 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3667 = _3373 + _3665;
    float _3669 = _3637 * _3645;
    float _3671 = _3599 * _3651;
    float _3673 = -_3637;
    float _3675 = _3673 + 1.0;
    float _3677 = -_3501;
    float _3679 = _3677 + 1.0;
    bool _3681 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3683 = isnan(_3373);
    bool _3685 = _3681 || _3683;
    bool _3687 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3689 = _3685 || _3687;
    float _3691 = float(_3689);
    float _3693 = -_3663;
    float _3695 = _3693 + 1.0;
    float _3697 = _3667 * _3503;
    float _3699 = _3663 * _3675;
    float _3701 = fma(_3679, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3647);
    bool _3703 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3705 = isnan(_3373);
    bool _3707 = _3703 || _3705;
    bool _3709 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3711 = _3707 || _3709;
    float _3713 = float(_3711);
    float _3715 = _3691 * _3695;
    float _3717 = -_3691;
    float _3719 = _3717 + 1.0;
    bool _3721 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3723 = isnan(_3427);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3729 = _3725 || _3727;
    float _3731 = float(_3729);
    float _3733 = fma(_3459, _3607, _3701);
    bool _3735 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3737 = isnan(_3373);
    bool _3739 = _3735 || _3737;
    bool _3741 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3743 = _3739 || _3741;
    float _3745 = float(_3743);
    float _3747 = _3713 * _3719;
    float _3749 = -_3713;
    float _3751 = _3749 + 1.0;
    bool _3753 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3755 = isnan(_3373);
    bool _3757 = _3753 || _3755;
    bool _3759 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3761 = _3757 || _3759;
    float _3763 = float(_3761);
    float _3765 = -_3731;
    float _3767 = _3765 + 1.0;
    float _3769 = -_3745;
    float _3771 = _3769 + 1.0;
    float _3773 = _3745 * _3751;
    float _3775 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3777 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3775;
    float _3779 = -_3763;
    float _3781 = _3779 + 1.0;
    float _3783 = _3475 * _3767;
    float _3785 = _3763 * _3771;
    float _3787 = fma(_3777, _3639, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3789 = _3389 * _3781;
    float _3791 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _3793 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _3791;
    float _3795 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3797 = _3795 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3799 = -_3389;
    float _3801 = _3799 + 1.0;
    float _3803 = _3787 * _3789;
    float _3805 = fma(_3793, _3639, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _3807 = fma(_3797, _3511, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3809 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3803);
    float _3811 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _3813 = _3811 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3815 = _3805 * _3789;
    float _3817 = fma(_3807, _3785, _3809);
    float _3819 = fma(_3813, _3511, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _3821 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[167].y, _3815);
    float _3823 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3825 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _3823;
    float _3827 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3829 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3827;
    float _3831 = fma(_3555, _3561, _3733);
    float _3833 = fma(_3819, _3785, _3821);
    float _3835 = fma(_3825, _3531, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _3837 = fma(_3829, _3531, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3839 = fma(_3549, _3489, _3831);
    float _3841 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _3843 = _3841 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3845 = fma(_3835, _3773, _3833);
    float _3847 = fma(_3837, _3773, _3817);
    float _3849 = fma(_3577, _3641, _3839);
    float _3851 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3853 = _3851 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3855 = fma(_3843, _3483, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _3857 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3859 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _3857;
    float _3861 = fma(_3563, _3671, _3849);
    float _3863 = fma(_3853, _3483, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3865 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3867 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3865;
    float _3869 = fma(_3855, _3747, _3845);
    float _3871 = fma(_3859, _3697, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _3873 = fma(_3863, _3747, _3847);
    float _3875 = fma(_3867, _3697, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3877 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3879 = _3877 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3881 = fma(_3871, _3715, _3869);
    float _3883 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3885 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3883;
    float _3887 = fma(_3601, _3783, _3861);
    float _3889 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _3891 = _3889 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3893 = fma(_3875, _3715, _3873);
    float _3895 = fma(_3879, _3583, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3897 = fma(_3885, _3523, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3899 = fma(_3891, _3583, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _3901 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _3901;
    float _3905 = fma(_3895, _3699, _3893);
    float _3907 = _3409 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3909 = fma(_3899, _3699, _3881);
    float _3911 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3887);
    float _3913 = fma(_3897, _3669, _3905);
    float _3915 = _3409 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3917 = fma(_3903, _3523, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _3919 = fma(_3363, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3907);
    float _3921 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3923 = _2179 + _3921;
    float _3925 = fma(_3619, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3913);
    float _3927 = _3911 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _3929 = fma(_3917, _3669, _3909);
    float _3931 = fma(_3363, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3915);
    float _3933 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3919);
    float _3935 = -_3927;
    float _3937 = fma(_3925, _3923, _3935);
    float _3939 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3941 = _2147 + _3939;
    float _3943 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3931);
    float _3945 = _3911 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _3947 = _3933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3949 = fma(_3619, (*spvDescriptorSet0.vp_c9)._m0[174].y, _3929);
    float _3951 = _3943 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3953 = -_3945;
    float _3955 = fma(_3925, _3941, _3953);
    float _3957 = fma(_3947, _3949, _3937);
    float _3959 = fma(_3951, _3949, _3955);
    float _3961 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3963 = _3957 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3965 = _3409 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3967 = _3959 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3969 = fma(_2055, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3961);
    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3973 = _3963 + _3971;
    float _3975 = fma(_3363, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3965);
    float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3979 = _3967 + _3977;
    float _3981 = fma(_2059, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3969);
    float _3983 = _3973 * _3973;
    float _3985 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3975);
    float _3987 = _3981 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3989 = fma(_3979, _3979, _3983);
    float _3991 = _3985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3993 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _3995 = _3987 + _3993;
    float _3997 = sqrt(_3989);
    bool _3999 = _3997 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4003 = _3997 + _4001;
    float _4005 = _2135 + _3991;
    float _4007 = _3911 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _4009 = -_3987;
    float _4011 = _4005 + _4009;
    float _4013 = -_4007;
    float _4015 = fma(_3925, _3995, _4013);
    float _4017 = fma(_3949, _4011, _4015);
    float _4019 = _3947;
    float _4021 = _3911;
    float _4023 = _3995;
    float _4025 = _3925;
    float _4027 = _4003;
    float _4029 = (*spvDescriptorSet0.vp_c9)._m0[172].y;
    if (_3999)
    {
        float _4031 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4019 = _4031;
    }
    float _4033 = _4019;
    if (!_3999)
    {
        _4021 = _3963;
    }
    float _4035 = _4021;
    float _4037 = _4017 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _4039 = _4035;
    if (_3999)
    {
        float _4041 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4023 = _4041;
    }
    float _4043 = _4023;
    float _4045 = _4043;
    if (_3999)
    {
        float _4047 = rsqrt(_3989);
        _4025 = _4047;
    }
    float _4049 = _4025;
    float _4051 = _4049;
    if (_3999)
    {
        float _4053 = _4003 * _4033;
        _4027 = _4053;
    }
    float _4055 = _4027;
    if (_3999)
    {
        float _4057 = _4055 * 0.15915493667125701904296875;
        _3415 = _4057;
    }
    float _4059 = _3415;
    float _4061 = _4055;
    if (_3999)
    {
        float _4063 = _4059 * 6.283185482025146484375;
        float _4065 = sin(_4063);
        _4061 = _4065;
    }
    float _4067 = _4061;
    float _4069 = _4067;
    if (_3999)
    {
        float _4071 = fma(_4067, _4043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4069 = _4071;
    }
    float _4073 = _4069;
    float _4075 = _4073;
    if (!_3999)
    {
        _4045 = _3967;
    }
    float _4077 = _4045;
    float _4079 = _4077;
    if (_3999)
    {
        float _4081 = _4049 * _4073;
        _4075 = _4081;
    }
    float _4083 = _4075;
    if (_3999)
    {
        float _4085 = fma(_3979, _4083, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _4079 = _4085;
    }
    float _4087 = _4079;
    if (_3999)
    {
        float _4089 = fma(_3973, _4083, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4039 = _4089;
    }
    float _4091 = _4039;
    float _4093 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _4095 = _4087 + _4093;
    float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _4099 = _4091 + _4097;
    float _4101 = fma(_4095, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _4103 = fma(_4099, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _11714 = float2(_4101, _4103);
    float _4105 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_11714, float2(0.0), isnan(_11714)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_11714, float2(0.0), isnan(_11714)), level(0.0)).x;
    float _4107 = _4099;
    float _4109 = _4095;
    float _4111 = _4091;
    if (_3999)
    {
        float _4113 = _4059 * 6.283185482025146484375;
        float _4115 = cos(_4113);
        _4107 = _4115;
    }
    float _4117 = _4107;
    if (!_3999)
    {
        _4109 = _4037;
    }
    float _4119 = _4109;
    float _4121 = -_2147;
    float _4123 = _4121 + _4087;
    float _4125 = -_2179;
    float _4127 = _4125 + _4091;
    float _4129 = _4119;
    if (_3999)
    {
        float _4131 = _4117 + (-1.0);
        _4051 = _4131;
    }
    float _4133 = _4051;
    float _4135 = _4133;
    if (_3999)
    {
        float _4137 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4135 = _4137;
    }
    float _4139 = _4135;
    if (_3999)
    {
        float _4141 = fma(_4037, _4117, _4139);
        _4129 = _4141;
    }
    float _4143 = _4129;
    float _4145 = -_2135;
    float _4147 = _4145 + _4143;
    bool _4149 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4151 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4153 = _4149 || _4151;
    bool _4155 = isnan(0.5);
    bool _4157 = _4153 || _4155;
    float _4159 = fma(_4105, 100.0, _2135);
    float _4161 = -_2765;
    float _4163 = _4161 + _4159;
    float _4165 = _4163 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4167 = _4163 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4169 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4165);
    float _4171 = _4147 * _4147;
    float _4173 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4167);
    float _4175 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4169);
    float _4177 = fma(_4123, _4123, _4171);
    float _4179 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4173);
    float _4181 = _4175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4183 = fma(_4127, _4127, _4177);
    float _4185 = _4179 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4187 = 1.0 / _4181;
    float _4189 = _4185 + _4181;
    float _4191 = sqrt(_4183);
    float _4193 = fma(_4105, 100.0, _4143);
    float _4195 = _4189 * _4187;
    float _4197 = _4195 * 0.5;
    float _4199 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4201 = fma(_4197, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4199);
    bool _4203 = _4191 > 0.0;
    float _4205 = 1.0 / _4201;
    bool _4207 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4209 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4211 = _4207 || _4209;
    bool _4213 = isnan(0.5);
    bool _4215 = _4211 || _4213;
    float _4217 = _4175;
    float _4219 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4221 = _4105;
    if (!_4203)
    {
        _4217 = _4087;
    }
    float _4223 = _4217;
    float _4225 = _4223;
    float _4227 = _4223;
    if (!_4203)
    {
        _4219 = _4193;
    }
    float _4229 = _4219;
    bool _4231 = !_4203;
    float _4233 = _4229;
    if (!_4231)
    {
        float _4235 = _206 * _206;
        float _4237 = rsqrt(_4183);
        float _4239 = fma(_204, _204, _4235);
        float _4241 = fma(_208, _208, _4239);
        float _4243 = sqrt(_4241);
        float _4245 = _4123 * _4237;
        float _4247 = _4147 * _4237;
        float _4249 = _4127 * _4237;
        bool _4251 = _4243 > 0.0;
        float _4253 = _4239;
        _4221 = _4243;
        if (!_4251)
        {
            _4225 = _4087;
        }
        float _4255 = _4225;
        _4227 = _4255;
        if (!_4251)
        {
            _4253 = _4193;
        }
        float _4257 = _4253;
        bool _4259 = !_4251;
        _4233 = _4257;
        if (!_4259)
        {
            float _4261 = rsqrt(_4241);
            float _4263 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4265 = _206 * _4261;
            float _4267 = _204 * _4261;
            float _4269 = _208 * _4261;
            float _4271 = _4247 * _4265;
            float _4273 = fma(_4245, _4267, _4271);
            float _4275 = _4263 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4277 = fma(_4249, _4269, _4273);
            float _4279 = _4277 * _4275;
            float _4281 = fma(_204, _4279, _4087);
            float _4283 = fma(_206, _4279, _4193);
            float _4285 = fma(_208, _4279, _4091);
            _4227 = _4281;
            _4111 = _4285;
            _4233 = _4283;
            _4221 = _4265;
        }
    }
    float _4287 = _4227;
    float _4289 = _4111;
    float _4291 = _4233;
    float _4293 = _4221;
    float _4295 = -_2769;
    float _4297 = _4295 + _4287;
    float _4299 = -_2987;
    float _4301 = _4299 + _4289;
    float _4303 = -_2765;
    float _4305 = _4303 + _4291;
    float _4307 = _4293;
    float _4309 = _4305;
    float _4311 = _4297;
    float _4313 = _4301;
    if (_4157)
    {
        _4307 = 1.0;
    }
    float _4315 = _4307;
    float _4317 = _4315;
    if (!_4215)
    {
        float _4319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4321 = _4163 + _4319;
        float _4323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4325 = -_2179;
        float _4327 = _4325 + _4289;
        float _4329 = -_4159;
        float _4331 = _4329 + _4291;
        float _4333 = _4321 * _4321;
        float _4335 = fma(_3037, _3037, _4333);
        float _4337 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4339 = fma(_3049, _3049, _4335);
        float _4341 = 1.0 / _3135;
        float _4343 = sqrt(_4339);
        float _4345 = _4337 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4347 = precise::min(_4343, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4349 = _4347 * _4323;
        float _4351 = _4349 * _4341;
        float _4353 = -_2147;
        float _4355 = _4353 + _4287;
        float _4357 = _4345 * _4351;
        float _4359 = _4327 * _4351;
        float _4361 = fma(_4331, _4357, _4163);
        float _4363 = fma(_4355, _4357, _3023);
        float _4365 = fma(_4345, _4359, _3033);
        _3089 = _4343;
        _4309 = _4361;
        _4311 = _4363;
        _4313 = _4365;
    }
    float _4367 = _3089;
    float _4369 = _4309;
    float _4371 = _4311;
    float _4373 = _4313;
    float _4375 = _4367;
    if (_4157)
    {
        _2317 = 1.0;
    }
    float _4377 = _2317;
    float _4379 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4381 = _4205 * _4379;
    float _4383 = _4377;
    if (!_4157)
    {
        float _4385 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4387 = _4385 * 0.15915493667125701904296875;
        float _4389 = _4387 * 6.283185482025146484375;
        float _4391 = cos(_4389);
        float _4393 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4395 = _4393 * 0.15915493667125701904296875;
        float _4397 = _4387 * 6.283185482025146484375;
        float _4399 = sin(_4397);
        float _4401 = 1.0 / _4391;
        float _4403 = _4395 * 6.283185482025146484375;
        float _4405 = cos(_4403);
        float _4407 = _4399 * _4401;
        float _4409 = _4395 * 6.283185482025146484375;
        float _4411 = sin(_4409);
        float _4413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4415 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4413;
        float _4417 = _4405 * _4407;
        float _4419 = 1.0 / _4415;
        float _4421 = 1.0 / _4417;
        float _4423 = _4411 * _4421;
        float _4425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4427 = fma(_4381, _4423, _4425);
        float _4429 = _4427 * _4419;
        float _4431 = precise::clamp(_4429, 0.0, 1.0);
        _4375 = _4407;
        _4317 = _4431;
    }
    float _4433 = _4375;
    float _4435 = _4317;
    float _4437 = _4433;
    if (!_4157)
    {
        float _4439 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4441 = _4439 * 0.15915493667125701904296875;
        float _4443 = _4441 * 6.283185482025146484375;
        float _4445 = cos(_4443);
        float _4447 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4449 = _4447 * 0.15915493667125701904296875;
        float _4451 = _4441 * 6.283185482025146484375;
        float _4453 = sin(_4451);
        float _4455 = 1.0 / _4445;
        float _4457 = _4449 * 6.283185482025146484375;
        float _4459 = cos(_4457);
        float _4461 = _4453 * _4455;
        float _4463 = _4449 * 6.283185482025146484375;
        float _4465 = sin(_4463);
        float _4467 = _4459 * _4461;
        float _4469 = 1.0 / _4467;
        float _4471 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4473 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4471;
        float _4475 = 1.0 / _4473;
        float _4477 = _4465 * _4469;
        float _4479 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4481 = fma(_4381, _4477, _4479);
        float _4483 = _4481 * _4475;
        float _4485 = precise::clamp(_4483, 0.0, 1.0);
        float _4487 = -_4485;
        float _4489 = _4487 + 1.0;
        _4437 = _4445;
        _4383 = _4489;
    }
    float _4491 = _4437;
    float _4493 = _4383;
    float _4495 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4497 = _4369 + _4495;
    float _4499 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4501 = _4371 + _4499;
    float _4503 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4505 = _4373 + _4503;
    float _4507 = _4497 * _4497;
    float _4509 = fma(_4501, _4501, _4507);
    float _4511 = fma(_3023, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4513 = fma(_4505, _4505, _4509);
    float _4515 = rsqrt(_4513);
    float _4517 = sqrt(_4513);
    float _4519 = _4515 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4521 = _4501 * _4519;
    float _4523 = _4505 * _4519;
    float _4525 = _4521 * _4521;
    float _4527 = _4523 * _4523;
    float _4529 = _4525 + _4527;
    float _4531 = sqrt(_4529);
    bool _4533 = _4531 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4535 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4537 = _4531 + _4535;
    float _4539 = _4505;
    float _4541 = _4515;
    float _4543 = _4537;
    float _4545 = _4491;
    float _4547 = _4497;
    float _4549 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4533)
    {
        float _4551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4539 = _4551;
    }
    float _4553 = _4539;
    if (_4533)
    {
        float _4555 = rsqrt(_4529);
        _4541 = _4555;
    }
    float _4557 = _4541;
    float _4559 = _4557;
    if (_4533)
    {
        float _4561 = _4537 * _4553;
        _4543 = _4561;
    }
    float _4563 = _4543;
    if (_4533)
    {
        float _4565 = _4563 * 0.15915493667125701904296875;
        _4545 = _4565;
    }
    float _4567 = _4545;
    float _4569 = _4553;
    float _4571 = _4567;
    if (_4533)
    {
        float _4573 = _4567 * 6.283185482025146484375;
        float _4575 = sin(_4573);
        _4569 = _4575;
    }
    float _4577 = _4569;
    float _4579 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4581 = precise::max(0.0, _4579);
    float _4583 = _4507;
    float _4585 = _4581;
    if (_4533)
    {
        float _4587 = _4567 * 6.283185482025146484375;
        float _4589 = cos(_4587);
        _4583 = _4589;
    }
    float _4591 = _4583;
    float _4593 = -_4519;
    float _4595 = -_4581;
    float _4597 = fma(_4497, _4593, _4595);
    if (!_4533)
    {
        _4547 = _4523;
    }
    float _4599 = _4547;
    float _4601 = _4599;
    if (_4533)
    {
        float _4603 = _4597 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4585 = _4603;
    }
    float _4605 = _4585;
    float _4607 = _4605;
    if (!_4533)
    {
        _4571 = _4525;
    }
    float _4609 = _4571;
    float _4611 = _4577;
    float _4613 = _4609;
    if (_4533)
    {
        float _4615 = fma(_4577, _4605, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4611 = _4615;
    }
    float _4617 = _4611;
    float _4619 = _4617;
    float _4621 = _4591;
    if (_4533)
    {
        float _4623 = _4591 + (-1.0);
        _4607 = _4623;
    }
    float _4625 = _4607;
    float _4627 = _4625;
    if (_4533)
    {
        float _4629 = _4557 * _4617;
        _4549 = _4629;
    }
    float _4631 = _4549;
    if (!_4533)
    {
        _4559 = _4521;
    }
    float _4633 = _4559;
    float _4635 = _4633;
    if (_4533)
    {
        float _4637 = _4625 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4627 = _4637;
    }
    float _4639 = _4627;
    if (_4533)
    {
        float _4641 = _4521 * _4631;
        _4635 = _4641;
    }
    float _4643 = _4635;
    if (!_4533)
    {
        _4619 = _4597;
    }
    float _4645 = _4619;
    float _4647 = _4645;
    if (_4533)
    {
        float _4649 = _4523 * _4631;
        _4601 = _4649;
    }
    float _4651 = _4601;
    if (_4533)
    {
        float _4653 = fma(_4597, _4591, _4639);
        _4647 = _4653;
    }
    float _4655 = _4647;
    if (_4533)
    {
        float _4657 = _4643 * _4643;
        _4613 = _4657;
    }
    float _4659 = _4613;
    if (!_4533)
    {
        _4621 = _4527;
    }
    float _4661 = _4621;
    float _4663 = _4661;
    if (_4533)
    {
        float _4665 = _4651 * _4651;
        _4663 = _4665;
    }
    float _4667 = _4663;
    float _4669 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4671 = fma(_4655, _4655, _4659);
    float _4673 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4675 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4669);
    float _4677 = _4671 + _4667;
    float _4679 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4681 = fma(_4517, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4679);
    float _4683 = precise::clamp(_4681, 0.0, 1.0);
    float _4685 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4675);
    float _4687 = floor(_4511);
    float _4689 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4673);
    float _4691 = -_4683;
    float _4693 = _4691 + 1.0;
    float _4695 = _4685 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4697 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4699 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4689);
    float _4701 = _4695 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4703 = rsqrt(_4677);
    float _4705 = fma(_3033, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4707 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4709 = -_4701;
    float _4711 = fma(_4709, _4697, 1.0);
    float _4713 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4715 = _4699 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4717 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4707);
    float _4719 = abs(_4693);
    float _4721 = log2(_4719);
    float _4723 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4713);
    float _4725 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4717);
    float _4727 = -_4687;
    float _4729 = _4511 + _4727;
    float _4731 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4723);
    float _4733 = _4725 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4735 = _4703 * _4643;
    float _4737 = _4703 * _4655;
    float _4739 = _4703 * _4651;
    float _4741 = _4731 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4743 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4745 = floor(_4705);
    float _4747 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4749 = _4737 + 1.0;
    float _4751 = -_4743;
    float _4753 = fma(_4737, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4751);
    float _4755 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4757 = _4721 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4759 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4747);
    float _4761 = -_4739;
    float _4763 = fma(_4761, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4753);
    float _4765 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4755);
    float _4767 = exp2(_4757);
    float _4769 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4759);
    float _4771 = fma(_4763, -0.5, 0.5);
    float _4773 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4765);
    float _4775 = fma(_4763, 0.5, 0.5);
    float _4777 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4773);
    float _4779 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4781 = log2(_4711);
    float _4783 = fma(_4775, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4785 = -_4745;
    float _4787 = _4705 + _4785;
    float _4789 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4779);
    float _4791 = fma(_4775, _4783, -0.212114393711090087890625);
    float _4793 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4789);
    float _4795 = 1.0 / _4777;
    float _4797 = -_4737;
    float _4799 = fma(_4767, _4749, _4797);
    float _4801 = sqrt(_4771);
    float _4803 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4793);
    float _4805 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4769);
    float _4807 = _4781 * 0.693147182464599609375;
    float2 _12809 = float2(_4729, _4787);
    float _4809 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12809, float2(0.0), isnan(_12809)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12809, float2(0.0), isnan(_12809)), level(0.0)).x;
    float _4811 = fma(_4775, _4791, 1.570728778839111328125);
    float _4813 = _4807 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4815 = _4803 * _4795;
    float _4817 = _4805 * _4795;
    float _4819 = fma(_4815, 0.5, 0.5);
    float _4821 = fma(_4817, -0.5, 0.5);
    float _4823 = _4801 * 0.636619746685028076171875;
    float3 _12839 = float3(_4819, _4821, _4813);
    float _4825 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12839, float3(0.0), isnan(_12839)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12839, float3(0.0), isnan(_12839)), level(0.0)).x;
    float _4827 = -_4811;
    float _4829 = fma(_4823, _4827, 1.0);
    float _4831 = fma(_4799, 0.5, 0.5);
    float3 _12857 = float3(_4819, _4821, _4813);
    float4 _4834 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12857, float3(0.0), isnan(_12857)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12857, float3(0.0), isnan(_12857)), level(0.0)).xyzw;
    float _4836 = _4834.x;
    float _4838 = _4834.y;
    float _4840 = _4834.z;
    float _4842 = _4834.w;
    float2 _12873 = float2(_4829, _4831);
    float3 _4846 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12873, float2(0.0), isnan(_12873)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12873, float2(0.0), isnan(_12873)), level(0.0)).xyz;
    float _4848 = _4846.x;
    float _4850 = _4846.y;
    float _4852 = _4846.z;
    float _4854 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4856 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4858 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _4860 = _3119 != 0.0;
    bool _4862 = isnan(_3119);
    bool _4864 = _4860 || _4862;
    bool _4866 = isnan(0.0);
    bool _4868 = _4864 || _4866;
    float _4870 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4854);
    float _4872 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4856);
    float _4874 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4858);
    out.m_65.x = _572;
    out.m_65.y = _582;
    out.m_65.z = _562;
    out.m_65.w = _574;
    bool _4876 = _3117 == 0.0;
    bool _4878 = !_4868;
    bool _4880 = _4876 && _4878;
    float _4882 = _4721 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4884 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4886 = in.m_81.x;
    float _4888 = in.m_81.y;
    float _4890 = in.m_81.z;
    bool _4892 = _3121 == 0.0;
    bool _4894 = _4892 && _4880;
    float _4896 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4870);
    float _4898 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4872);
    float _4900 = in.m_83.x;
    float _4902 = in.m_83.y;
    float _4904 = in.m_83.z;
    float _4906 = in.m_83.w;
    float _4908 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4874);
    float _4910 = _3155 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4912 = _3183 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_67.x = _684;
    out.m_67.y = _690;
    out.m_67.z = _688;
    out.m_67.w = _692;
    float _4914 = -_3115;
    float _4916 = fma(_4914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4910);
    float _4918 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4912);
    float _4920 = exp2(_4882);
    float _4922 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4884);
    out.m_85.x = _4371;
    out.m_85.y = _4369;
    out.m_85.z = _4373;
    float _4924 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4922);
    float _4926 = _3155 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4928 = _3155 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4930 = _3183 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4932 = _3183 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4934 = -_3115;
    float _4936 = fma(_4934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4926);
    float _4938 = -_3115;
    float _4940 = fma(_4938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4928);
    float _4942 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4930);
    float _4944 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4932);
    float _4946 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4936);
    float _4948 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4940);
    float _4950 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4916);
    float _4952 = _4916;
    float _4954 = _4918;
    float _4956 = _4886;
    if (_4894)
    {
        _4952 = _4886;
    }
    float _4958 = _4952;
    float _4960 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4942);
    float _4962 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4944);
    float _4964 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4918);
    float _4966 = _4958;
    if (_4894)
    {
        _4029 = _4890;
    }
    float _4968 = _4029;
    float _4970 = _4948 * _4902;
    float _4972 = _4968;
    if (_4894)
    {
        _4954 = _4958;
    }
    float _4974 = _4954;
    float _4976 = _4946 * _4902;
    float _4978 = _4974;
    if (!_4894)
    {
        _4966 = _4886;
    }
    float _4980 = _4966;
    float _4982 = fma(_4898, _4900, _4970);
    if (_4894)
    {
        _4956 = _4968;
    }
    float _4984 = _4956;
    float _4986 = fma(_4896, _4900, _4976);
    float _4988 = _4984;
    if (!_4894)
    {
        _4972 = _4890;
    }
    float _4990 = _4972;
    float _4992 = _4950 * _4902;
    if (!_4894)
    {
        float _4994 = fma(_3117, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4980);
        _4978 = _4994;
    }
    float _4996 = _4978;
    float _4998 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _5000 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _4998;
    if (_4894)
    {
        _3195 = _4888;
    }
    float _5002 = _3195;
    float _5004 = fma(_4908, _4900, _4992);
    float _5006 = fma(_4962, _4904, _4982);
    float _5008 = fma(_5000, _3639, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _5010 = _5002;
    if (!_4894)
    {
        float _5012 = fma(_3119, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4888);
        _5010 = _5012;
    }
    float _5014 = _5010;
    float _5016 = fma(_4960, _4904, _4986);
    float _5018 = fma(_4964, _4904, _5004);
    float _5020 = _4904 * _4980;
    if (!_4894)
    {
        float _5022 = fma(_3121, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4990);
        _4988 = _5022;
    }
    float _5024 = _4988;
    float _5026 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _5028 = _5026 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _5030 = _5008 * _3789;
    float _5032 = -_5020;
    float _5034 = fma(_4900, _4990, _5032);
    out.m_87.x = _5016;
    out.m_87.y = _5006;
    out.m_87.z = _5018;
    float _5036 = _4900 * _4888;
    float _5038 = fma(_5028, _3511, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _5040 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[167].z, _5030);
    float _5042 = _4902 * _4990;
    float _5044 = -_5036;
    float _5046 = fma(_4902, _4980, _5044);
    float _5048 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _5050 = _5048 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _5052 = fma(_5038, _3785, _5040);
    float _5054 = -_5042;
    float _5056 = fma(_4904, _4888, _5054);
    float _5058 = fma(_5050, _3483, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _5060 = _4950 * _5014;
    float _5062 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _5064 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _5062;
    float _5066 = _5056 * _4906;
    float _5068 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _5070 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _5068;
    float _5072 = fma(_5064, _3531, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _5074 = -_4920;
    float _5076 = _5074 + 1.0;
    bool _5078 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5080 = isnan(_4517);
    bool _5082 = _5078 || _5080;
    bool _5084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5086 = _5082 || _5084;
    float _5088 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _5090 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _5088;
    float _5092 = fma(_5072, _3773, _5052);
    float _5094 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _5096 = _5094 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _5098 = fma(_5070, _3523, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _5100 = fma(_5090, _3697, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _5102 = fma(_5058, _3747, _5092);
    float _5104 = _5034 * _4906;
    float _5106 = _5046 * _4906;
    float _5108 = fma(_5096, _3583, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _5110 = fma(_5100, _3715, _5102);
    float _5112 = _5104 * _4946;
    float _5114 = _4948 * _5014;
    float _5116 = _5104 * _4948;
    float _5118 = fma(_5108, _3699, _5110);
    float _5120 = fma(_5066, _4896, _5112);
    float _5122 = _5104 * _4950;
    float _5124 = fma(_4898, _4996, _5114);
    float _5126 = fma(_5098, _3669, _5118);
    float _5128 = fma(_5106, _4960, _5120);
    float _5130 = fma(_5066, _4898, _5116);
    float _5132 = abs(_4381);
    float _5134 = log2(_5132);
    float _5136 = fma(_5066, _4908, _5122);
    float _5138 = _4946 * _5014;
    float _5140 = fma(_3619, (*spvDescriptorSet0.vp_c9)._m0[174].z, _5126);
    float _5142 = fma(_4962, _5024, _5124);
    float _5144 = fma(_5106, _4962, _5130);
    float _5146 = fma(_5106, _4964, _5136);
    float _5148 = fma(_4896, _4996, _5138);
    float _5150 = fma(_4908, _4996, _5060);
    out.m_89.x = _5140;
    bool _5152 = _4381 <= 8000.0;
    bool _5154 = isnan(_4381);
    bool _5156 = _5152 || _5154;
    bool _5158 = isnan(8000.0);
    bool _5160 = _5156 || _5158;
    float _5162 = float(_5160);
    float _5164 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.x = _5128;
    out.m_91.y = _5144;
    out.m_91.z = _5146;
    float _5166 = _5134 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5168 = fma(_4960, _5024, _5148);
    float _5170 = fma(_4964, _5024, _5150);
    float _5172 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4924);
    float _5174 = exp2(_5166);
    out.m_93.x = _5168;
    out.m_93.y = _5142;
    out.m_93.z = _5170;
    float _5176 = _5172 + _4777;
    out.gl_Position.x = _4803;
    out.gl_Position.y = _4805;
    out.gl_Position.z = _5172;
    out.gl_Position.w = _4777;
    float _5178 = _5176 * 0.5;
    float _5180 = fma(_5174, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5182 = precise::clamp(_5180, 0.0, 1.0);
    float _5184 = _4777 * 0.5;
    float _5186 = fma(_5182, -2.0, 3.0);
    float _5188 = _5182 * _5182;
    float _5190 = _5188 * _5186;
    float _5192 = in.m_69.x;
    float _5194 = -_5190;
    float _5196 = _5194 + 1.0;
    float _5198 = fma(_5196, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5190);
    float _5200 = _4803 + _4777;
    float _5202 = fma(_4805, -0.5, _5184);
    float _5204 = _5162 * _5198;
    float _5206 = _5200 * 0.5;
    float _5208 = _5204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_95.x = _5206;
    out.m_95.y = _5202;
    out.m_95.z = _5178;
    out.m_95.w = _4777;
    float _5210 = -_5164;
    float _5212 = _5210 + 1.0;
    float _5214 = _4777;
    float _5216 = _5178;
    float _5218 = _5202;
    if (!_5086)
    {
        _5214 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5220 = _5214;
    float _5222 = _5220;
    float _5224 = _5220;
    if (!_5086)
    {
        _5216 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5226 = _5216;
    float _5228 = _5226;
    float _5230 = _5226;
    if (!_5086)
    {
        _5218 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5232 = _5218;
    float _5234 = -_4809;
    float _5236 = _5234 + 1.0;
    float _5238 = _5236 * _5208;
    float _5240 = precise::clamp(_5238, 0.0, 1.0);
    float _5242 = -_5240;
    float _5244 = fma(_5242, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5246 = _5244 * _5192;
    float _5248 = _5164 * _4825;
    float _5250 = _5192;
    float _5252 = _5232;
    float _5254 = _5232;
    if (!_5086)
    {
        _5250 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5256 = _5250;
    float _5258 = _5246 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5260 = _4842 * _5248;
    float _5262 = _4842 * _5212;
    out.m_97.x = _5258;
    float _5264 = _4435 * _4493;
    float _5266 = _4852 * _5248;
    float _5268 = fma(_4848, _5260, _4836);
    float _5270 = fma(_4850, _5260, _4838);
    float _5272 = _5264 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5274 = fma(_4842, _5266, _4840);
    float _5276 = _5260;
    float _5278 = _5264;
    float _5280 = _5256;
    float _5282 = _5256;
    if (!_5086)
    {
        _5276 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5284 = _5276;
    float _5286 = _5284;
    float _5288 = _5284;
    if (!_5086)
    {
        _5278 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5290 = _5278;
    out.m_99.x = _5268;
    out.m_99.y = _5270;
    out.m_99.z = _5274;
    out.m_99.w = _5262;
    bool _5292 = !_5086;
    float _5294 = _5290;
    float _5296 = _5290;
    if (!_5292)
    {
        bool _5298 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5300 = isnan(_4517);
        bool _5302 = _5298 || _5300;
        bool _5304 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5306 = _5302 || _5304;
        if (!_5306)
        {
            float _5308 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5310 = _4517 + _5308;
            float _5312 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5314 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5312;
            float _5316 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5318 = _5316 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5320 = 1.0 / _5314;
            float _5322 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5324 = _5322 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5326 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5328 = _5326 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5330 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5332 = _5330 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5334 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5336 = _5334 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5338 = _5310 * _5320;
            float _5340 = precise::clamp(_5338, 0.0, 1.0);
            float _5342 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5344 = _5342 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5346 = fma(_5340, _5318, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5348 = fma(_5340, _5344, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5350 = fma(_5340, _5324, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5352 = fma(_5340, _5328, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5354 = fma(_5340, _5332, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5356 = fma(_5340, _5336, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5288 = _5350;
            _5254 = _5354;
            _5282 = _5346;
            _5230 = _5352;
            _5224 = _5348;
            _5296 = _5356;
            _5358 = true;
        }
        else
        {
            bool _5360 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5362 = isnan(_4517);
            bool _5364 = _5360 || _5362;
            bool _5366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5368 = _5364 || _5366;
            if (!_5368)
            {
                _5280 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5370 = _5280;
            _5282 = _5370;
            if (!_5368)
            {
                _5286 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5372 = _5286;
            _5288 = _5372;
            if (!_5368)
            {
                _5222 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5374 = _5222;
            _5224 = _5374;
            if (!_5368)
            {
                _5228 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5376 = _5228;
            _5230 = _5376;
            if (!_5368)
            {
                _5252 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5378 = _5252;
            _5254 = _5378;
            if (!_5368)
            {
                _5294 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5380 = _5294;
            bool _5382 = !_5368;
            _5296 = _5380;
            if (!_5382)
            {
                bool _5384 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5386 = isnan(_4517);
                bool _5388 = _5384 || _5386;
                bool _5390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5392 = _5388 || _5390;
                if (!_5392)
                {
                    float _5394 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5396 = _4517 + _5394;
                    float _5398 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5400 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5398;
                    float _5402 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5404 = _5402 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5406 = 1.0 / _5400;
                    float _5408 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5410 = _5408 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5412 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5414 = _5412 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5416 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5418 = _5416 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5420 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5422 = _5420 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5424 = _5396 * _5406;
                    float _5426 = precise::clamp(_5424, 0.0, 1.0);
                    float _5428 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5430 = _5428 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5432 = fma(_5426, _5404, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5434 = fma(_5426, _5430, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5436 = fma(_5426, _5410, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5438 = fma(_5426, _5414, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5440 = fma(_5426, _5418, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5442 = fma(_5426, _5422, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5288 = _5436;
                    _5254 = _5440;
                    _5282 = _5432;
                    _5230 = _5438;
                    _5224 = _5434;
                    _5296 = _5442;
                    _5358 = true;
                }
                else
                {
                    _5288 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5254 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5282 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5230 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5224 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5296 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5358 = false;
    float _5444 = _5288;
    float _5446 = _5254;
    float _5448 = _5282;
    float _5450 = _5230;
    float _5452 = _5224;
    float _5454 = _5296;
    float _5456 = fma(_5142, -0.5, 0.5);
    float _5458 = precise::clamp(_5456, 0.0, 1.0);
    float _5460 = -_5444;
    float _5462 = _5460 + _5446;
    float _5464 = _5272 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5466 = -_5448;
    float _5468 = _5466 + _5450;
    float _5470 = fma(_5458, _5462, _5444);
    out.m_101.x = 0.0;
    float _5472 = -_5452;
    float _5474 = _5472 + _5454;
    float _5476 = fma(_5458, _5468, _5448);
    float _5478 = _5470 * 0.586610972881317138671875;
    out.m_51.x = _5464;
    bool _5480 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5482 = fma(_5458, _5474, _5452);
    float _5484 = fma(_5476, 0.298911988735198974609375, _5478);
    bool _5486 = _4435 > 0.0;
    bool _5488 = isnan(_4435);
    bool _5490 = _5486 || _5488;
    bool _5492 = isnan(0.0);
    bool _5494 = _5490 || _5492;
    float _5496 = fma(_5482, 0.114477999508380889892578125, _5484);
    bool _5498 = _4493 <= 0.0;
    bool _5500 = !_5494;
    bool _5502 = _5498 || _5500;
    float _5504 = -_5496;
    float _5506 = _5476 + _5504;
    float _5508 = -_5496;
    float _5510 = _5470 + _5508;
    float _5512 = -_5496;
    float _5514 = _5482 + _5512;
    float _5516 = fma(_5506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5496);
    float _5518 = fma(_5510, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5496);
    float _5520 = fma(_5514, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5496);
    bool _5522 = !_5480;
    if (!_5522)
    {
        float _5524 = -_4369;
        float _5526 = _5524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5528 = -_4371;
        float _5530 = _5528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5532 = -_4373;
        float _5534 = _5532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5536 = _5526 * _5526;
        float _5538 = fma(_5530, _5530, _5536);
        float _5540 = fma(_5534, _5534, _5538);
        float _5542 = sqrt(_5540);
        float _5544 = rsqrt(_5540);
        float _5546 = -_5542;
        float _5548 = _5546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5550 = _5548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5552 = precise::clamp(_5550, 0.0, 1.0);
        float _5554 = _5530 * _5544;
        float _5556 = _5526 * _5544;
        float _5558 = abs(_5552);
        float _5560 = log2(_5558);
        float _5562 = _5534 * _5544;
        float _5564 = _5554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5566 = _5142 * _5556;
        float _5568 = -_5556;
        float _5570 = -_5564;
        float _5572 = fma(_5568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5570);
        float _5574 = fma(_5168, _5554, _5566);
        float _5576 = -_5562;
        float _5578 = fma(_5576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5572);
        float _5580 = fma(_5170, _5562, _5574);
        float _5582 = precise::clamp(_5580, 0.0, 1.0);
        float _5584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5586 = _5578 + _5584;
        float _5588 = _5560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5590 = _5586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5592 = precise::clamp(_5590, 0.0, 1.0);
        float _5594 = exp2(_5588);
        float _5596 = _5594 * _5592;
        float _5598 = _5582 * _5596;
        float _5600 = _5598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5602 = _5598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5604 = _5598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _5600;
        out.m_101.y = _5602;
        out.m_101.z = _5604;
    }
    out.m_103.x = _5516;
    out.m_103.y = _5518;
    out.m_103.z = _5520;
    if (!_5502)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _5606 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5606;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5358 = false;
    bool _714 = false;
    bool _610 = false;
    bool _456 = false;
    bool _234 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _5665 = as_type<float>(_140);
        out.gl_Position.z = _5665;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_53.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_122);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_51.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5734 = as_type<float>(_178);
        out.gl_Position.z = _5734;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_55.x;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_55.y;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    out.m_59.x = _180;
    out.m_59.y = _184;
    float _192 = _188 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _194 = _188 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _196 = _188 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].x, _192);
    float _200 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].x, _194);
    float _202 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _204 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[4].z, _198);
    float _206 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[5].z, _200);
    float _208 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[6].z, _202);
    bool _210 = !_182;
    float _212 = _184;
    float _214 = _180;
    float _232;
    if (!_210)
    {
        float _216 = in.m_61.x;
        float _218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _220 = _216 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _224 = _222 * _218;
        float _226 = floor(_224);
        float _228 = -_226;
        float _230 = _224 + _228;
        _232 = _230;
        _234 = true;
    }
    else
    {
        float _236 = float(_122);
        float _238 = 1.0 / _236;
        float _240 = _158 * _238;
        _232 = _240;
    }
    _234 = false;
    float _242 = _232;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = _242 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _242 + _248;
    bool _252 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _254 = isnan(_242);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = _242 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = 1.0 / _266;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _284 = 1.0 / _278;
    float _286 = 1.0 / _274;
    float _288 = _246 * _280;
    bool _290 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_242);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -_262;
    float _304 = _302 + 1.0;
    float _306 = _300 * _304;
    float _308 = _250 * _284;
    bool _310 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _312 = isnan(_242);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    bool _326 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_242);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = -_300;
    float _344 = _342 + 1.0;
    float _346 = -_320;
    float _348 = _346 + 1.0;
    float _350 = _270 * _286;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _356;
    float _360 = _336 * _348;
    float _362 = fma(_324, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = fma(_354, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_358, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _368 = _320 * _344;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = _364 * _360;
    float _376 = _366 * _360;
    float _378 = _362 * _360;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _376);
    float _390 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _392 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _378);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _394;
    float _398 = fma(_340, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _400 = fma(_386, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _402 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _408;
    float _412 = fma(_398, _368, _388);
    float _414 = fma(_396, _288, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _416 = fma(_406, _288, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _418 = fma(_410, _288, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _420 = fma(_400, _368, _390);
    float _422 = fma(_402, _368, _392);
    float _424 = fma(_414, _306, _412);
    float _426 = fma(_416, _306, _420);
    float _428 = fma(_418, _306, _422);
    float _430 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].x, _424);
    float _432 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].y, _426);
    float _434 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].z, _428);
    bool _436 = !_282;
    float _454;
    if (!_436)
    {
        float _438 = in.m_61.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_122);
        float _460 = 1.0 / _458;
        float _462 = _158 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _464 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_464);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_464);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _526 = _500 * _522;
    float _528 = -_500;
    float _530 = _528 + 1.0;
    float _532 = 1.0 / _488;
    float _534 = _504 * _518;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _540 = fma(_534, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _542 = _538 * _532;
    float _544 = _540 * _526;
    float _546 = -_516;
    float _548 = _546 + 1.0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _552 = _464 + _550;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _556 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[115].x, _544);
    float _558 = _484 * _548;
    float _560 = fma(_542, _552, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = _554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = fma(_560, _558, _556);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _568 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _564);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _576 = in.m_63.x;
    float _578 = in.m_63.y;
    float _580 = in.m_63.z;
    float _582 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _572;
    out.m_65.y = _582;
    out.m_65.z = _562;
    out.m_65.w = _574;
    float _584 = _434 * _580;
    float _586 = _432 * _578;
    float _588 = _430 * _576;
    bool _590 = !_524;
    float _608;
    if (!_590)
    {
        float _592 = in.m_61.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_122);
        float _614 = 1.0 / _612;
        float _616 = _158 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    bool _620 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _622 = isnan(_618);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _636 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _654 = _618 + _652;
    float _656 = -_630;
    float _658 = _656 + 1.0;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _662 = 1.0 / _634;
    float _664 = _646 * _658;
    float _666 = -_646;
    float _668 = _666 + 1.0;
    float _670 = _650 * _662;
    float _672 = fma(_670, _654, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _674 = _672 * _664;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[131].x, _674);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[132].x, _680);
    float _688 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _686 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _684;
    out.m_67.y = _690;
    out.m_67.z = _688;
    out.m_67.w = _692;
    bool _694 = !_660;
    float _712;
    if (!_694)
    {
        float _696 = in.m_61.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_122);
        float _718 = 1.0 / _716;
        float _720 = _158 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _726 = int(_724);
    float _728 = in.m_61.x;
    float _730 = float(_122);
    float _732 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = in.m_61.y;
    float _736 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _738 = int(_736);
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _744 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _746 = isnan(_722);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _760 = float(_726);
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _764 = int(_762);
    bool _766 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _768 = isnan(_722);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = float(_738);
    float _780 = 1.0 / _760;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _782;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _788 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[88].z, _786);
    float _790 = float(uint(_764));
    float _792 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _794 = int(_792);
    int _796 = ~_764;
    int _798 = _796 + 1;
    bool _800 = _764 == 0;
    float _802 = _780 * _158;
    float _804 = 1.0 / _778;
    float _806 = 1.0 / _790;
    float _808 = float(uint(_794));
    int _810 = ~_794;
    int _812 = _810 + 1;
    int _814 = ~_794;
    int _816 = _814 + 1;
    float _818 = trunc(_802);
    int _820 = int(_818);
    float _822 = _804 * _158;
    int _824 = ~_764;
    int _826 = _824 + 1;
    int _828 = as_type<int>(_806) + (-2);
    float _830 = 1.0 / _808;
    float _832 = float(uint(_820));
    float _834 = trunc(_822);
    int _836 = int(_834);
    float _838 = as_type<float>(_828) * _832;
    int _840 = as_type<int>(_830) + (-2);
    float _842 = 1.0 / _730;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _846 = _844 != 0;
    float _848 = float(uint(_836));
    float _850 = trunc(_838);
    float _852 = precise::max(_850, 0.0);
    uint _855 = uint(_852);
    float _857 = as_type<float>(_840) * _848;
    float _859 = trunc(_857);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    float _865 = _728;
    if (_846)
    {
        _130 = 1.0;
    }
    float _867 = _130;
    float _869 = _867;
    if (!_846)
    {
        _869 = 7.345489978790283203125;
    }
    float _871 = _869;
    int _873 = _826 * int(_855);
    int _875 = _873 + _820;
    float _877 = float(_820);
    float _879 = 1.0 / _758;
    float _881 = float(uint(_875));
    float _883 = _871 * _728;
    float _885 = as_type<float>(_828) * _881;
    int _887 = ~_794;
    int _889 = _887 + 1;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _893 = _889 * int(_863);
    int _895 = _893 + _836;
    float _897 = trunc(_885);
    float _899 = precise::max(_897, 0.0);
    uint _901 = uint(_899);
    float _903 = float(uint(_895));
    float _905 = as_type<float>(_840) * _903;
    float _907 = _903;
    float _909 = as_type<float>(_855);
    if (_846)
    {
        _907 = 1.0;
    }
    float _911 = _907;
    float _913 = floor(_883);
    float _915 = _911;
    if (!_846)
    {
        _915 = 1.2345600128173828125;
    }
    float _917 = _915;
    int _919 = int(_855) + int(_901);
    float _921 = trunc(_905);
    float _923 = precise::max(_921, 0.0);
    uint _925 = uint(_923);
    float _927 = float(_764);
    if (_846)
    {
        _909 = _728;
    }
    float _929 = _909;
    int _931 = _798 * _919;
    int _933 = _931 + _820;
    bool _935 = _877 >= _927;
    bool _937 = isnan(_877);
    bool _939 = _935 || _937;
    bool _941 = isnan(_927);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = _929;
    if (!_846)
    {
        _947 = _734;
    }
    float _949 = _947;
    float _951 = -_913;
    float _953 = _883 + _951;
    bool _955 = uint(_933) >= uint(_764);
    float _957 = trunc(_945);
    int _959 = int(_957);
    float _961 = _949 * _917;
    bool _963 = !_955;
    int _965 = _963 ? 0 : (-1);
    int _967 = int(_863) + int(_925);
    float _969 = floor(_961);
    int _971 = ~_919;
    int _973 = _971 + _965;
    int _975 = _973 + 1;
    float _977 = _927 * _158;
    float _979 = float(_794);
    int _981 = _812 * _967;
    int _983 = _981 + _836;
    float _985 = _953 * _927;
    int _987 = _764 * _975;
    int _989 = _987 + _820;
    float _991 = _977 * _842;
    float _993 = _979 * _158;
    int _995 = ~_959;
    int _997 = _995 + 1;
    int _999 = _997 + 1;
    float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1003 = !_800;
    int _1005 = _1003 ? _989 : (-1);
    float _1007 = _993 * _842;
    bool _1009 = uint(_983) >= uint(_794);
    int _1011 = _1005 * _999;
    bool _1013 = !_1009;
    int _1015 = _1013 ? 0 : (-1);
    float _1017 = -_969;
    float _1019 = _961 + _1017;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1027 = _1025 != 0;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1031 = _1029 != 0;
    float _1033 = trunc(_985);
    int _1035 = int(_1033);
    int _1037 = _764 + (-1);
    float _1039 = _979 * _1019;
    int _1041 = ~_967;
    int _1043 = _1041 + _1015;
    int _1045 = _1043 + 1;
    int _1047 = _959 * _1037;
    int _1049 = _1047 + _1011;
    bool _1051 = !_1027;
    int _1053 = _1051 ? 0 : 1;
    float _1055 = trunc(_991);
    int _1057 = int(_1055);
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1061 = _1059 != 0;
    float _1063 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1065 = !_1023;
    int _1067 = _1065 ? 0 : 1;
    float _1069 = float(_836);
    int _1071 = abs(_1053);
    float _1073 = trunc(_1007);
    int _1075 = int(_1073);
    bool _1077 = !_1061;
    int _1079 = _1077 ? 0 : 1;
    bool _1081 = !_1031;
    int _1083 = _1081 ? 0 : 1;
    int _1085 = abs(_1067);
    bool _1087 = _1069 >= _979;
    bool _1089 = isnan(_1069);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan(_979);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = trunc(_1039);
    int _1101 = int(_1099);
    int _1103 = abs(_1079);
    int _1105 = abs(_1083);
    int _1107 = _1049 * _1071;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1111 = _1109 != 0;
    float _1113 = trunc(_1097);
    int _1115 = int(_1113);
    int _1117 = _1035 * _1103;
    int _1119 = _1117 + _820;
    bool _1121 = !_1111;
    int _1123 = _1121 ? 0 : 1;
    float _1125 = in.m_61.z;
    int _1127 = _1057 * _1085;
    int _1129 = _1127 + _1107;
    int _1131 = abs(_1123);
    int _1133 = _794 * _1045;
    int _1135 = _1133 + _836;
    bool _1137 = _794 == 0;
    int _1139 = _1119 * _1105;
    int _1141 = _1139 + _1129;
    int _1143 = ~_794;
    int _1145 = _1143 + 1;
    bool _1147 = !_1137;
    int _1149 = _1147 ? _1135 : (-1);
    int _1151 = _1035 * _1131;
    int _1153 = _1151 + _1141;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1161 = _1159 != 0;
    int _1163 = ~_1115;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = float(uint(_1153));
    bool _1171 = !_1161;
    int _1173 = _1171 ? 0 : 1;
    int _1175 = _1167 * _1149;
    int _1177 = _794 + (-1);
    float _1179 = as_type<float>(_828) * _1169;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1183 = _1181 != 0;
    int _1185 = abs(_1173);
    int _1187 = _1115 * _1177;
    int _1189 = _1187 + _1175;
    bool _1191 = !_1183;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = trunc(_1179);
    float _1197 = precise::max(_1195, 0.0);
    uint _1199 = uint(_1197);
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1203 = _1201 != 0;
    int _1205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1207 = _1205 != 0;
    int _1209 = _1189 * _1185;
    bool _1211 = !_1157;
    int _1213 = _1211 ? 0 : 1;
    int _1215 = abs(_1193);
    bool _1217 = !_1203;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = abs(_1213);
    bool _1223 = !_1207;
    int _1225 = _1223 ? 0 : 1;
    int _1227 = _1075 * _1221;
    int _1229 = _1227 + _1209;
    int _1231 = ~_764;
    int _1233 = _1231 + 1;
    int _1235 = _1101 * _1215;
    int _1237 = _1235 + _836;
    int _1239 = abs(_1219);
    int _1241 = abs(_1225);
    int _1243 = _1233 * int(_1199);
    int _1245 = _1243 + _1153;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1249 = _1247 != 0;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1253 = _1251 != 0;
    int _1255 = _1237 * _1239;
    int _1257 = _1255 + _1229;
    float _1259 = float(uint(_1245));
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1263 = _1261 != 0;
    int _1265 = _1101 * _1241;
    int _1267 = _1265 + _1257;
    bool _1269 = _764 == 0;
    float _1271 = as_type<float>(_828) * _1259;
    float _1273 = float(uint(_1119));
    float _1275 = in.m_61.w;
    float _1277 = float(uint(_1267));
    bool _1279 = _1157;
    int _1281 = _1071;
    if (_1249)
    {
        bool _1283 = _728 > 0.5;
        _1279 = _1283;
    }
    bool _1285 = _1279;
    float _1287 = trunc(_1271);
    float _1289 = precise::max(_1287, 0.0);
    uint _1291 = uint(_1289);
    float _1293 = 0.0;
    if (!_1249)
    {
        _1293 = _180;
    }
    float _1295 = _1293;
    float _1297 = as_type<float>(_840) * _1277;
    float _1299 = _1295;
    if (_1253)
    {
        float _1301 = -_180;
        float _1303 = _1301 + 1.0;
        _1281 = as_type<int>(_1303);
    }
    int _1305 = _1281;
    float _1307 = 0.0;
    if (!_1253)
    {
        _1307 = _180;
    }
    float _1309 = _1307;
    float _1311 = as_type<float>(_828) * _1273;
    float _1313 = trunc(_1297);
    float _1315 = precise::max(_1313, 0.0);
    uint _1317 = uint(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1323 = int(_1199) + int(_1291);
    int _1325 = int(_1291);
    float _1327 = _1309;
    if (_1249)
    {
        float _1329 = -_180;
        float _1331 = _1329 + 1.0;
        _1325 = as_type<int>(_1331);
    }
    int _1333 = _1325;
    float _1335 = trunc(_1311);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    int _1341 = _1233 * _1323;
    int _1343 = _1341 + _1153;
    if (_1249)
    {
        float _1345 = _1285 ? as_type<float>(_1333) : _180;
        _1299 = _1345;
    }
    float _1347 = _1299;
    float _1349 = -_184;
    float _1351 = _1349 + 1.0;
    int _1353 = _1145 * int(_1317);
    int _1355 = _1353 + _1267;
    bool _1357 = _734 > 0.5;
    float _1359 = 1.0 / _1321;
    bool _1361 = uint(_1343) >= uint(_764);
    float _1363 = float(uint(_1355));
    bool _1365 = !_1361;
    int _1367 = _1365 ? 0 : (-1);
    bool _1369 = _1125 > 0.5;
    float _1371 = as_type<float>(_840) * _1363;
    int _1373 = _1357 ? as_type<int>(_1351) : as_type<int>(_184);
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1377 = _1375 != 0;
    float _1379 = trunc(_1371);
    float _1381 = precise::max(_1379, 0.0);
    uint _1383 = uint(_1381);
    float _1385 = _1263 ? as_type<float>(_1373) : _184;
    bool _1387 = _1275 > 0.5;
    int _1389 = ~_1323;
    int _1391 = _1389 + _1367;
    int _1393 = _1391 + 1;
    if (_1253)
    {
        float _1395 = _1369 ? as_type<float>(_1305) : _180;
        _1327 = _1395;
    }
    float _1397 = _1327;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1401 = _1399 != 0;
    int _1403 = _764 * _1393;
    int _1405 = _1403 + _1153;
    int _1407 = _1387 ? as_type<int>(_1351) : as_type<int>(_184);
    int _1409 = ~_794;
    int _1411 = _1409 + 1;
    float _1413 = _1401 ? as_type<float>(_1407) : _184;
    if (_1377)
    {
        float _1415 = _1369 ? _1351 : _184;
        _212 = _1415;
    }
    float _1417 = _212;
    bool _1419 = !_1269;
    int _1421 = _1419 ? _1405 : (-1);
    int _1423 = int(_1317) + int(_1383);
    float _1425 = fma(_1063, _1417, -0.5);
    int _1427 = _1421 & 3;
    bool _1429 = _1427 != 0;
    int _1431 = _1421 & 3;
    bool _1433 = _1431 != 0;
    int _1435 = _1411 * _1423;
    int _1437 = _1435 + _1267;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1441 = _1439 != 0;
    bool _1443 = uint(_1427) >= 2u;
    int _1445 = _1433 ? 0 : 1;
    bool _1447 = _734 > 0.5;
    bool _1449 = _1447 && _1441;
    int _1451 = _1443 ? 0 : 1;
    bool _1453 = uint(_1437) >= uint(_794);
    bool _1455 = !_1453;
    int _1457 = _1455 ? 0 : (-1);
    bool _1459 = uint(_1427) > 1u;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1463 = _1461 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1465 = ~_1423;
    int _1467 = _1465 + _1457;
    int _1469 = _1467 + 1;
    float _1471 = 0.0;
    if (!_1441)
    {
        _1471 = _180;
    }
    float _1473 = _1471;
    float _1475 = _1473;
    if (_1449)
    {
        float _1477 = -_180;
        float _1479 = _1477 + 1.0;
        _214 = _1479;
    }
    float _1481 = _214;
    bool _1483 = _1427 != 3;
    int _1485 = _794 * _1469;
    int _1487 = _1485 + _1267;
    int _1489 = ~_1445;
    int _1491 = _1489 + 1;
    int _1493 = _1491 + 1;
    float _1495 = 1.0 / _1463;
    bool _1497 = !_1137;
    int _1499 = _1497 ? _1487 : (-1);
    int _1501 = _1493;
    if (!_1459)
    {
        int _1503 = ~_1445;
        int _1505 = _1503 + 1;
        _1501 = _1505;
    }
    int _1507 = _1501;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1513 = ~_1451;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    int _1519 = _1499 & 3;
    bool _1521 = _1519 != 0;
    float _1523 = 1.0 / _1511;
    int _1525 = _1517;
    if (_1483)
    {
        int _1527 = ~_1451;
        int _1529 = _1527 + 1;
        _1525 = _1529;
    }
    int _1531 = _1525;
    float _1533 = _1125 * 2.0;
    bool _1535 = _1519 != 3;
    if (_1441)
    {
        _1475 = _1481;
    }
    float _1537 = _1475;
    float _1539 = _728 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1541 = uint(_1519) >= 2u;
    float _1543 = floor(_1533);
    int _1545 = _1521 ? 0 : 1;
    float _1547 = -_740;
    float _1549 = fma(_1539, 2.0, _1547);
    int _1551 = _1541 ? 0 : 1;
    float _1553 = _734 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1555 = ~_1545;
    int _1557 = _1555 + 1;
    int _1559 = _1557 + 1;
    float _1561 = -_158;
    float _1563 = fma(_1561, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1549);
    int _1565 = ~_1551;
    int _1567 = _1565 + 1;
    int _1569 = _1567 + 1;
    float _1571 = fma(_1553, -2.0, _742);
    int _1573 = _1569;
    int _1575 = _1559;
    if (_1535)
    {
        int _1577 = ~_1551;
        int _1579 = _1577 + 1;
        _1573 = _1579;
    }
    int _1581 = _1573;
    bool _1583 = uint(_1519) > 1u;
    float _1585 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1571);
    float _1587 = float(uint(_1237));
    int _1589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1591 = _1589 != 0;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1595 = _1593 != 0;
    float _1597 = as_type<float>(_840) * _1587;
    int _1599 = ~_764;
    int _1601 = _1599 + 1;
    float _1603 = trunc(_1597);
    float _1605 = precise::max(_1603, 0.0);
    uint _1607 = uint(_1605);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1609;
    if (!_1583)
    {
        int _1613 = ~_1545;
        int _1615 = _1613 + 1;
        _1575 = _1615;
    }
    int _1617 = _1575;
    int _1619 = _1601 * int(_1339);
    int _1621 = _1619 + _1119;
    bool _1623 = _1543 >= 0.0;
    bool _1625 = isnan(_1543);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan(0.0);
    bool _1631 = _1627 || _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1635 = _1633 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1637 = _1611 * _1523;
    float _1639 = _1631 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1643 = _1641 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1645 = _1543 > 0.0;
    float _1647 = _734 * 2.0;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1653 = float(uint(_1621));
    float _1655 = 1.0 / _1635;
    int _1657 = _816 * int(_1607);
    int _1659 = _1657 + _1237;
    float _1661 = _1643 * _1495;
    float _1663 = as_type<float>(_828) * _1653;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1667 = _1665 != 0;
    float _1669 = floor(_1647);
    float _1671 = float(uint(_1659));
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1675 = _1673 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1677;
    int _1681 = ~as_type<int>(_1639);
    int _1683 = _1681 + 1;
    int _1685 = _1683 + 1;
    float _1687 = as_type<float>(_840) * _1671;
    int _1689 = _1685;
    float _1691 = _1639;
    float _1693 = _1663;
    if (!_1645)
    {
        int _1695 = ~as_type<int>(_1639);
        int _1697 = _1695 + 1;
        _1689 = _1697;
    }
    int _1699 = _1689;
    float _1701 = 1.0 / _1651;
    float _1703 = _1679 * _1359;
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1709 = !_1591;
    int _1711 = _1709 ? 0 : 1;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1717 = ~_794;
    int _1719 = _1717 + 1;
    int _1721 = 0;
    float _1723 = _1715;
    if (_1667)
    {
        _1721 = 0;
    }
    int _1725 = _1721;
    float _1727 = trunc(_1663);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    bool _1733 = _1669 > 0.0;
    float _1735 = _1715 * _879;
    bool _1737 = _1669 >= 0.0;
    bool _1739 = isnan(_1669);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(0.0);
    bool _1745 = _1741 || _1743;
    int _1747 = _1725;
    float _1749 = _1669;
    if (!_1667)
    {
        _1747 = 2;
    }
    int _1751 = _1747;
    int _1753 = abs(_1507);
    float _1755 = 1.0 / _1675;
    float _1757 = _1707 * _1701;
    int _1759 = _1745 ? 0 : 1;
    int _1761 = ~_1759;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    float _1767 = trunc(_1687);
    float _1769 = precise::max(_1767, 0.0);
    uint _1771 = uint(_1769);
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1773;
    int _1777 = int(_1339) + int(_1731);
    int _1779 = _1765;
    int _1781 = as_type<int>(_1775);
    if (!_1733)
    {
        int _1783 = ~_1759;
        int _1785 = _1783 + 1;
        _1779 = _1785;
    }
    int _1787 = _1779;
    float _1789 = _1775 * _1655;
    if (_1667)
    {
        _1781 = 0;
    }
    int _1791 = _1781;
    int _1793 = _1791;
    if (!_1667)
    {
        _1793 = 1;
    }
    int _1795 = _1793;
    float _1797 = _784 * _1755;
    bool _1799 = _1795 != 1;
    int _1801 = ~_764;
    int _1803 = _1801 + 1;
    int _1805 = int(_1607) + int(_1771);
    int _1807 = _1803 * _1777;
    int _1809 = _1807 + _1119;
    float _1811 = _728 * 2.0;
    bool _1813 = uint(_1809) >= uint(_764);
    float _1815 = floor(_1811);
    if (!_1799)
    {
        _1723 = _734;
    }
    float _1817 = _1723;
    float _1819 = _1817;
    if (!_1799)
    {
        _1691 = _1125;
    }
    float _1821 = _1691;
    int _1823 = _1719 * _1805;
    int _1825 = _1823 + _1237;
    float _1827 = _1821;
    if (!_1799)
    {
        _1749 = _1817;
    }
    float _1829 = _1749;
    float _1831 = _728 + _734;
    float _1833 = _1829;
    if (!_1799)
    {
        _1693 = _1125;
    }
    float _1835 = _1693;
    float _1837 = _1835;
    if (_1799)
    {
        _1833 = _728;
    }
    float _1839 = _1833;
    float _1841 = _1831 + (-1.0);
    if (_1799)
    {
        _1819 = _728;
    }
    float _1843 = _1819;
    if (_1799)
    {
        _1827 = _734;
    }
    float _1845 = _1827;
    float _1847 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_1799)
    {
        _1837 = _734;
    }
    float _1849 = _1837;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1853 = _722 + _1851;
    bool _1855 = uint(_1825) >= uint(_794);
    float _1857 = _734 + _1125;
    bool _1859 = !_1813;
    int _1861 = _1859 ? 0 : (-1);
    float _1863 = fma(_1637, _1853, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1865 = !_1855;
    int _1867 = _1865 ? 0 : (-1);
    float _1869 = _1857 + (-1.0);
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1873 = _1871 != 0;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1877 = _1875 != 0;
    int _1879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1881 = _1879 != 0;
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1885 = _722 + _1883;
    bool _1887 = _1815 > 0.0;
    float _1889 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1891 = _1815 >= 0.0;
    bool _1893 = isnan(_1815);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(0.0);
    bool _1899 = _1895 || _1897;
    float _1901 = -_754;
    float _1903 = _1901 + 1.0;
    bool _1905 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1907 = isnan(_722);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1919 = _722 + _1917;
    bool _1921 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1923 = isnan(_722);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    float _1933 = fma(_1661, _1885, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1935 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1937 = isnan(_722);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = -_1915;
    float _1949 = _1947 + 1.0;
    float _1951 = _1915 * _1903;
    float _1953 = fma(_1703, _1919, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1955 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1957 = isnan(_722);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1963 = _1959 || _1961;
    float _1965 = float(_1963);
    float _1967 = _1931 * _1949;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1971 = _722 + _1969;
    float _1973 = -_1931;
    float _1975 = _1973 + 1.0;
    float _1977 = -_1945;
    float _1979 = _1977 + 1.0;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1983 = _722 + _1981;
    float _1985 = fma(_1757, _1971, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1987 = _1965 * _1975;
    bool _1989 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1991 = isnan(_722);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    float _2001 = _776 * _1979;
    float _2003 = -_1965;
    float _2005 = _2003 + 1.0;
    float _2007 = -_776;
    float _2009 = _2007 + 1.0;
    float _2011 = fma(_1735, _1983, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2013 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2015 = isnan(_722);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = _1945 * _2005;
    float _2027 = _1999 * _2009;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2031 = _722 + _2029;
    float _2033 = -_1999;
    float _2035 = _2033 + 1.0;
    int _2037 = _1899 ? 0 : 1;
    float _2039 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2041 = _1751 != 2;
    float _2043 = fma(_1789, _2031, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2047 = _722 + _2045;
    float _2049 = _2023 * _2035;
    float _2051 = -_2023;
    float _2053 = _2051 + 1.0;
    float _2055 = in.m_48.x;
    float _2057 = in.m_48.y;
    float _2059 = in.m_48.z;
    bool _2061 = !_1877;
    int _2063 = _2061 ? 0 : 1;
    float _2065 = _1863 * _2049;
    float _2067 = fma(_1797, _2047, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2069 = _891 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2071 = !_1873;
    int _2073 = _2071 ? 0 : 1;
    float _2075 = fma(_2053, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2065);
    int _2077 = ~_2037;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = in.m_69.y;
    int _2085 = _2081;
    float _2087 = _1933;
    if (!_1887)
    {
        int _2089 = ~_2037;
        int _2091 = _2089 + 1;
        _2085 = _2091;
    }
    int _2093 = _2085;
    float _2095 = fma(_1933, _2027, _2075);
    int _2097 = abs(_2063);
    float _2099 = fma(_2069, _1537, -0.5);
    float _2101 = float(_1699);
    float _2103 = fma(_1953, _2001, _2095);
    int _2105 = abs(_2073);
    float _2107 = float(_2097);
    float _2109 = fma(_1985, _2025, _2103);
    float _2111 = float(_2093);
    if (_2041)
    {
        _2087 = _728;
    }
    float _2113 = _2087;
    float _2115 = fma(_2043, _1987, _2109);
    float _2117 = float(_2105);
    float _2119 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2121 = _2107 * _2111;
    float _2123 = _2113;
    if (!_2041)
    {
        _2123 = _1125;
    }
    float _2125 = _2123;
    float _2127 = fma(_2055, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2119);
    float _2129 = _2117 * _2101;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2133 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2135 = _2057 + _2083;
    float _2137 = fma(_2059, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2127);
    float _2139 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2141 = fma(_2055, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2133);
    float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2145 = _2135 + _2143;
    float _2147 = _2137 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2149 = -_2131;
    float _2151 = fma(_2139, 2.0, _2149);
    int _2153 = _1421 >> 31;
    float _2155 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2159 = _2147 + _2157;
    float _2161 = fma(_2059, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2141);
    int _2163 = _1499 >> 31;
    float _2165 = -_158;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2151);
    bool _2169 = !_1429;
    int _2171 = _2169 ? 0 : 1;
    float _2173 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2155);
    int _2175 = _1499 & 3;
    bool _2177 = _2175 != 0;
    float _2179 = _2161 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2181 = _2153 & 3;
    float _2183 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2185 = _2163 & 3;
    float _2187 = fma(_2011, _1967, _2115);
    bool _2189 = !_2177;
    int _2191 = _2189 ? 0 : 1;
    int _2193 = _1421 + _2181;
    float _2195 = fma(_2067, _1951, _2187);
    bool _2197 = _1427 != 3;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2201 = _2179 + _2199;
    int _2203 = _1499 + _2185;
    float _2205 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2195);
    int _2207 = _2193 >> 2;
    float _2209 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2173);
    bool _2211 = !_2197;
    int _2213 = _2211 ? 0 : (-1);
    float _2215 = _732 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2217 = _1519 != 3;
    out.m_71.x = _2205;
    int _2219 = _2203 >> 2;
    int _2221 = _2207 << 4;
    int _2223 = _2221 + 368;
    bool _2225 = !_2217;
    int _2227 = _2225 ? 0 : (-1);
    int _2229 = _2219 << 4;
    int _2231 = _2229 + 512;
    bool _2233 = _2209 >= 0.0;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _2237 = uint(int(uint(_2223) >> uint(2)));
    uint _2239 = uint(int(uint(int(_2237)) >> uint(2)));
    int _2241 = int(_2237) & 3;
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[int(_2239)][_2241];
    int _2245 = int(_2237) + 1;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    int _2249 = _2245 & 3;
    float _2251 = (*spvDescriptorSet0.vp_c9)._m0[int(_2247)][_2249];
    float _2253 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2235);
    float _2255 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _788);
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2259 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2261 = uint(int(uint(_2231) >> uint(2)));
    uint _2263 = uint(int(uint(int(_2261)) >> uint(2)));
    int _2265 = int(_2261) & 3;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[int(_2263)][_2265];
    int _2269 = int(_2261) + 1;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    int _2273 = _2269 & 3;
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[int(_2271)][_2273];
    float _2277 = fma(_2255, _2099, _2167);
    float _2279 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2257);
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2283 = in.m_73.x;
    float _2285 = in.m_73.y;
    float _2287 = in.m_73.z;
    float _2289 = _2129 * (-2.0);
    float _2291 = _2121 * (-2.0);
    float _2293 = -_2281;
    float _2295 = fma(_2183, 2.0, _2293);
    int _2297 = _2223 + 8;
    uint _2299 = uint(int(uint(_2297) >> uint(2)));
    uint _2301 = uint(int(uint(int(_2299)) >> uint(2)));
    int _2303 = int(_2299) & 3;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[int(_2301)][_2303];
    int _2307 = int(_2299) + 1;
    uint _2309 = uint(int(uint(_2307) >> uint(2)));
    int _2311 = _2307 & 3;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[int(_2309)][_2311];
    float _2315 = _2183;
    float _2317 = _2147;
    if (_2233)
    {
        _2315 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2319 = _2315;
    float _2321 = fma(_1889, _2291, _1889);
    int _2323 = abs(_2171);
    float _2325 = fma(_2039, -2.0, _2259);
    int _2327 = ~_1777;
    int _2329 = _2327 + _1861;
    int _2331 = _2329 + 1;
    int _2333 = as_type<int>(_2319);
    if (_2233)
    {
        float _2335 = _2319 * 5.0;
        _2333 = as_type<int>(_2335);
    }
    int _2337 = _2333;
    int _2339 = _2231 + 8;
    uint _2341 = uint(int(uint(_2339) >> uint(2)));
    uint _2343 = uint(int(uint(int(_2341)) >> uint(2)));
    int _2345 = int(_2341) & 3;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[int(_2343)][_2345];
    int _2349 = int(_2341) + 1;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    int _2353 = _2349 & 3;
    float _2355 = (*spvDescriptorSet0.vp_c9)._m0[int(_2351)][_2353];
    int _2357 = _764 * _2331;
    int _2359 = _2357 + _1119;
    int _2361 = abs(_2191);
    if (_2233)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9006 = as_type<float>(_2337);
        out.gl_Position.z = _9006;
    }
    int _2363 = abs(_2213);
    float _2365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2367 = log2(_2365);
    int _2369 = ~_1805;
    int _2371 = _2369 + _1867;
    int _2373 = _2371 + 1;
    float _2375 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2279);
    int _2377 = abs(_2227);
    float _2379 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2253);
    bool _2381 = _764 == 0;
    float _2383 = fma(_2291, _2285, _2285);
    int _2385 = abs(_1617);
    float _2387 = fma(_2289, _2283, _2283);
    float _2389 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2391 = int(_2389);
    int _2393 = _794 * _2373;
    int _2395 = _2393 + _1237;
    int _2397 = ~_1753;
    int _2399 = _2397 + 1;
    int _2401 = _2399 + 1;
    float _2403 = -_158;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2295);
    int _2407 = ~_2385;
    int _2409 = _2407 + 1;
    int _2411 = _2409 + 1;
    float _2413 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2325);
    int _2415 = ~_2323;
    int _2417 = _2415 + 1;
    int _2419 = _2417 + 1;
    int _2421 = _2401 * as_type<int>(_2251);
    float _2423 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2425 = int(_2423);
    bool _2427 = _794 == 0;
    float _2429 = fma(_1847, _2289, _1847);
    int _2431 = _2419 * as_type<int>(_2243);
    int _2433 = _2431 + _2421;
    int _2435 = abs(_1531);
    if (_2233)
    {
        out.m_51.x = 0.0;
    }
    int _2437 = abs(_1581);
    int _2439 = _2411 * as_type<int>(_2275);
    int _2441 = ~_2361;
    int _2443 = _2441 + 1;
    int _2445 = _2443 + 1;
    int _2447 = ~_2435;
    int _2449 = _2447 + 1;
    int _2451 = _2449 + 1;
    float _2453 = float(uint(_2391));
    int _2455 = _2445 * as_type<int>(_2267);
    int _2457 = _2455 + _2439;
    int _2459 = ~_2363;
    int _2461 = _2459 + 1;
    int _2463 = _2461 + 1;
    int _2465 = _2451 * as_type<int>(_2305);
    int _2467 = _2465 + _2433;
    int _2469 = ~_2437;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    float _2475 = 1.0 / _2453;
    int _2477 = _2463 * as_type<int>(_2313);
    int _2479 = _2477 + _2467;
    bool _2481 = !_1595;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _2473 * as_type<int>(_2347);
    int _2487 = _2485 + _2457;
    int _2489 = abs(_1711);
    float _2491 = _2367 * _158;
    int _2493 = abs(_2483);
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2497 = 1.0 + _2495;
    bool _2499 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2501 = isnan(1.0);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2507 = _2503 || _2505;
    float _2509 = exp2(_2491);
    float _2511 = float(uint(_2425));
    int _2513 = abs(_2391);
    int _2515 = ~_2489;
    int _2517 = _2515 + 1;
    int _2519 = _2517 + 1;
    int _2521 = ~_2377;
    int _2523 = _2521 + 1;
    int _2525 = _2523 + 1;
    float _2527 = 1.0 / _2511;
    float _2529 = float(uint(_2513));
    int _2531 = _2479 * _2519;
    int _2533 = ~_2493;
    int _2535 = _2533 + 1;
    int _2537 = _2535 + 1;
    int _2539 = _2525 * as_type<int>(_2355);
    int _2541 = _2539 + _2487;
    bool _2543 = !_2381;
    int _2545 = _2543 ? _2359 : (-1);
    bool _2547 = !_2427;
    int _2549 = _2547 ? _2395 : (-1);
    float _2551 = 1.0 / _2529;
    int _2553 = _2537 * _2541;
    int _2555 = abs(_2425);
    int _2557 = _2545 * _2489;
    int _2559 = _2557 + _2531;
    int _2561 = as_type<int>(_2475) + (-2);
    int _2563 = _2549 * _2493;
    int _2565 = _2563 + _2553;
    float _2567 = float(uint(_2555));
    float _2569 = -_2509;
    float _2571 = _2569 + 1.0;
    float _2573 = float(uint(_2559));
    float _2575 = 1.0 / _2497;
    float _2577 = as_type<float>(_2531);
    if (_2041)
    {
        _2577 = _734;
    }
    float _2579 = _2577;
    float _2581 = as_type<float>(_2561) * _2573;
    int _2583 = as_type<int>(_2527) + (-2);
    float _2585 = _2579;
    if (!_2041)
    {
        _2585 = _728;
    }
    float _2587 = _2585;
    float _2589 = 1.0 / _2567;
    float _2591 = float(uint(_2565));
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2595 = abs(_2559);
    float _2597 = _2587 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2599 = as_type<int>(_2551) + (-2);
    float _2601 = as_type<float>(_2583) * _2591;
    int _2603 = abs(_2565);
    float _2605 = trunc(_2581);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    float _2611 = float(uint(_2595));
    float _2613 = fma(_2597, -2.0, _2593);
    float _2615 = _728 + (-0.5);
    int _2617 = ~_2391;
    int _2619 = _2617 + 1;
    float _2621 = as_type<float>(_2599) * _2611;
    float _2623 = float(uint(_2603));
    float _2625 = trunc(_2601);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    int _2631 = as_type<int>(_2589) + (-2);
    float _2633 = fma(_2615, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2387);
    float _2635 = _2145 * _2145;
    float _2637 = as_type<float>(_2631) * _2623;
    int _2639 = ~_2425;
    int _2641 = _2639 + 1;
    int _2643 = _2619 * int(_2609);
    int _2645 = _2643 + _2559;
    float _2647 = trunc(_2621);
    float _2649 = precise::max(_2647, 0.0);
    uint _2651 = uint(_2649);
    int _2653 = ~_2555;
    int _2655 = _2653 + 1;
    float _2657 = float(uint(_2645));
    float _2659 = fma(_2159, _2159, _2635);
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2663 = trunc(_2637);
    float _2665 = precise::max(_2663, 0.0);
    uint _2667 = uint(_2665);
    float _2669 = as_type<float>(_2561) * _2657;
    int _2671 = ~_2513;
    int _2673 = _2671 + 1;
    float _2675 = fma(_2201, _2201, _2659);
    float _2677 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2661);
    int _2679 = _2641 * int(_2629);
    int _2681 = _2679 + _2565;
    bool _2683 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2685 = isnan(0.0);
    bool _2687 = _2683 || _2685;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2691 = _2687 || _2689;
    float _2693 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2677);
    float _2695 = rsqrt(_2675);
    float _2697 = float(uint(_2681));
    int _2699 = _2673 * int(_2651);
    int _2701 = _2699 + _2595;
    float _2703 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2613);
    float _2705 = _2691 ? _2571 : 0.0;
    int _2707 = _2655 * int(_2667);
    int _2709 = _2707 + _2603;
    float _2711 = float(uint(_2701));
    float _2713 = as_type<float>(_2583) * _2697;
    float _2715 = trunc(_2669);
    float _2717 = precise::max(_2715, 0.0);
    uint _2719 = uint(_2717);
    float _2721 = float(uint(_2709));
    float _2723 = as_type<float>(_2599) * _2711;
    float _2725 = -_2703;
    float _2727 = fma(_2693, _1425, _2725);
    float _2729 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2733 = as_type<float>(_2631) * _2721;
    float _2735 = _2215 * _2695;
    float _2737 = trunc(_2713);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    float _2743 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2729);
    float _2745 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2731);
    int _2747 = ~_2391;
    int _2749 = _2747 + 1;
    float _2751 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2743);
    float _2753 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2745);
    if (_2507)
    {
        float _2755 = _2705 * _2575;
        _162 = _2755;
    }
    float _2757 = _162;
    float _2759 = trunc(_2723);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    float _2765 = _2145 * _2735;
    int _2767 = int(_2609) + int(_2719);
    float _2769 = _2159 * _2735;
    int _2771 = ~_2425;
    int _2773 = _2771 + 1;
    float _2775 = fma(_2429, _2757, _2633);
    int _2777 = ~_2555;
    int _2779 = _2777 + 1;
    float _2781 = trunc(_2733);
    float _2783 = precise::max(_2781, 0.0);
    uint _2785 = uint(_2783);
    int _2787 = int(_2629) + int(_2741);
    bool _2789 = _2425 == 0;
    int _2791 = _2773 * _2787;
    int _2793 = _2791 + _2565;
    int _2795 = int(_2651) + int(_2763);
    float _2797 = -_2765;
    float _2799 = _2145 + _2797;
    float _2801 = -_2769;
    float _2803 = _2159 + _2801;
    int _2805 = _2749 * _2767;
    int _2807 = _2805 + _2559;
    bool _2809 = uint(_2793) >= uint(_2425);
    float _2811 = _2799 * _2799;
    int _2813 = int(_2667) + int(_2785);
    float _2815 = fma(_2803, _2803, _2811);
    int _2817 = ~_2513;
    int _2819 = _2817 + 1;
    bool _2821 = uint(_2807) >= uint(_2391);
    bool _2823 = !_2821;
    int _2825 = _2823 ? 0 : (-1);
    int _2827 = _2819 * _2795;
    int _2829 = _2827 + _2595;
    bool _2831 = !_2809;
    int _2833 = _2831 ? 0 : (-1);
    int _2835 = _2779 * _2813;
    int _2837 = _2835 + _2603;
    int _2839 = ~_2767;
    int _2841 = _2839 + _2825;
    int _2843 = _2841 + 1;
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2847 = uint(_2829) >= uint(_2513);
    bool _2849 = uint(_2837) >= uint(_2555);
    int _2851 = _2559 ^ _2391;
    bool _2853 = !_2847;
    int _2855 = _2853 ? 0 : (-1);
    float _2857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2859 = _2391 == 0;
    bool _2861 = _2391 == 0;
    int _2863 = _2391 * _2843;
    int _2865 = _2863 + _2559;
    uint _2867 = uint(int(uint(_2851) >> uint(31)));
    int _2869 = _2565 ^ _2425;
    float _2871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2873 = ~_2787;
    int _2875 = _2873 + _2833;
    int _2877 = _2875 + 1;
    int _2879 = ~_2855;
    int _2881 = _2795 + _2879;
    int _2883 = _2881 + 1;
    int _2885 = ~int(_2867);
    int _2887 = _2885 + 1;
    int _2889 = _2425 * _2877;
    int _2891 = _2889 + _2565;
    bool _2893 = !_2849;
    int _2895 = _2893 ? 0 : (-1);
    float _2897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2899 = uint(int(uint(_2869) >> uint(31)));
    int _2901 = _2883 ^ _2887;
    int _2903 = ~_2895;
    int _2905 = _2813 + _2903;
    int _2907 = _2905 + 1;
    int _2909 = ~int(_2899);
    int _2911 = _2909 + 1;
    bool _2913 = !_2859;
    int _2915 = _2913 ? _2865 : (-1);
    int _2917 = ~_2887;
    int _2919 = _2917 + _2901;
    int _2921 = _2919 + 1;
    int _2923 = _2907 ^ _2911;
    bool _2925 = _2425 == 0;
    float _2927 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2929 = !_2789;
    int _2931 = _2929 ? _2891 : (-1);
    float _2933 = _2857 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2935 = float(_2915);
    float _2937 = fma(_2927, _1347, -0.5);
    int _2939 = ~_2911;
    int _2941 = _2939 + _2923;
    int _2943 = _2941 + 1;
    float _2945 = fma(_2933, _1397, -0.5);
    float _2947 = float(_2931);
    float _2949 = fma(_2927, _2935, _1563);
    bool _2951 = !_2861;
    int _2953 = _2951 ? _2921 : (-1);
    float _2955 = _2871 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2957 = !_2925;
    int _2959 = _2957 ? _2943 : (-1);
    float _2961 = fma(_2933, _2947, _2405);
    float _2963 = float(_2953);
    float _2965 = _2897 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2967 = float(_2959);
    float _2969 = fma(_1385, _2955, -0.5);
    float _2971 = fma(_2751, _2937, _2949);
    float _2973 = -_1585;
    float _2975 = fma(_2955, _2963, _2973);
    float _2977 = fma(_1413, _2965, -0.5);
    float _2979 = -_2413;
    float _2981 = fma(_2965, _2967, _2979);
    float _2983 = fma(_2375, _2945, _2961);
    float _2985 = fma(_2753, _2969, _2975);
    float _2987 = _2201 * _2735;
    float _2989 = fma(_2379, _2977, _2981);
    float _2991 = _2277 + 0.5;
    float _2993 = _2727 + 0.5;
    float _2995 = _2971 + 0.5;
    float _2997 = _2983 + 0.5;
    float _2999 = _2985 + 0.5;
    float _3001 = _2989 + 0.5;
    float _3003 = -_2987;
    float _3005 = _2201 + _3003;
    bool _3007 = !_1881;
    int _3009 = _3007 ? 0 : 1;
    out.m_75.x = _2991;
    out.m_75.y = _2993;
    float _3011 = fma(_3005, _3005, _2815);
    int _3013 = abs(_3009);
    out.m_77.x = _2995;
    out.m_77.y = _2999;
    out.m_77.z = _2997;
    out.m_77.w = _3001;
    if (_2233)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3015 = -_2765;
    float _3017 = _2135 + _3015;
    float _3019 = _734 + (-0.5);
    float _3021 = -_2769;
    float _3023 = _2147 + _3021;
    float _3025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3027 = _3017 + _3025;
    float _3029 = float(_1787);
    float _3031 = -_2987;
    float _3033 = _2179 + _3031;
    float _3035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3037 = _3023 + _3035;
    float _3039 = _3027 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3041 = float(_3013);
    float _3043 = fma(_3019, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2383);
    float _3045 = _728 + _1125;
    float _3047 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3049 = _3033 + _3047;
    float _3051 = fma(_3037, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3039);
    float _3053 = _3041 * _3029;
    float _3055 = _3045 + (-1.0);
    float _3057 = fma(_3049, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3051);
    float _3059 = _3053 * (-2.0);
    float _3061 = _1125 + (-0.5);
    float _3063 = fma(_3055, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3065 = fma(_2321, _2757, _3043);
    float _3067 = fma(_3059, _2287, _2287);
    bool _3069 = _3057 >= 0.0;
    float _3071 = fma(_3063, _3059, _3063);
    float _3073 = _2775 * 0.15915493667125701904296875;
    float _3075 = fma(_3061, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3067);
    float _3077 = _3065 * 0.15915493667125701904296875;
    float _3079 = sqrt(_3011);
    float _3081 = fma(_3071, _2757, _3075);
    float _3083 = _3081 * 0.15915493667125701904296875;
    float _3085 = _3053;
    int _3087 = as_type<int>(_3075);
    float _3089 = _3037;
    if (_3069)
    {
        _3085 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3091 = _3085;
    float _3093 = _3073 * 6.283185482025146484375;
    float _3095 = sin(_3093);
    if (_3069)
    {
        out.m_51.x = 0.0;
    }
    if (_3069)
    {
        float _3097 = _3091 * 5.0;
        _3087 = as_type<int>(_3097);
    }
    int _3099 = _3087;
    float _3101 = _3073 * 6.283185482025146484375;
    float _3103 = cos(_3101);
    if (_3069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10091 = as_type<float>(_3099);
        out.gl_Position.z = _10091;
    }
    float _3105 = _3077 * 6.283185482025146484375;
    float _3107 = sin(_3105);
    float _3109 = _3077 * 6.283185482025146484375;
    float _3111 = cos(_3109);
    float _3113 = _3083 * 6.283185482025146484375;
    float _3115 = sin(_3113);
    if (_3069)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3117 = in.m_79.x;
    float _3119 = in.m_79.y;
    float _3121 = in.m_79.z;
    float _3123 = _3083 * 6.283185482025146484375;
    float _3125 = cos(_3123);
    bool _3127 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _3129 = _3095 * _3107;
    bool _3131 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _3133 = _3103 * _3111;
    float _3135 = _2695 * _3079;
    float _3137 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3139 = fma(_3115, _3133, _3129);
    float _3141 = fma(_3115, _3129, _3133);
    float _3143 = _3103 * _3107;
    float _3145 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3147 = _3145 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3149 = _3135 * _3137;
    float _3151 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3153 = _3151 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3155 = _3103 * _3125;
    float _3157 = _732 * _3135;
    float _3159 = _3095 * _3111;
    float _3161 = _1385;
    float _3163 = _3159;
    if (_3127)
    {
        float _3165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _3161 = _3165;
    }
    float _3167 = _3161;
    float _3169 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3117);
    float _3173 = -_3143;
    float _3175 = fma(_3115, _3159, _3173);
    float _3177 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3179 = _3177 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3181 = -_3159;
    float _3183 = fma(_3115, _3143, _3181);
    float _3185 = _3171 * _3157;
    float _3187 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3189 = _3187 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3191 = _3091;
    float _3193 = _3179;
    float _3195 = _3183;
    if (_3131)
    {
        float _3197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _3191 = _3197;
    }
    float _3199 = _3191;
    float _3201 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_3127)
    {
        float _3203 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _3163 = _3203;
    }
    float _3205 = _3163;
    float _3207 = _3111 * _3125;
    float _3209 = _3095 * _3125;
    float _3211 = _3107 * _3125;
    float _3213 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3119);
    float _3215 = 1.0 / _3147;
    float _3217 = _3135 * _3169;
    if (_3131)
    {
        float _3219 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _865 = _3219;
    }
    float _3221 = _865;
    float _3223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3121);
    float _3225 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3227 = _3225 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3229 = _3213 * _3149;
    float _3231 = 1.0 / _3153;
    float _3233 = _3223 * _3217;
    float _3235 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3237 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3235;
    float _3239 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3241 = _3239 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3243 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3245 = _3243 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3247 = 1.0 / _3179;
    float _3249 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3251 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3249;
    float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3259 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _3257;
    float _3261 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3263 = _3261 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3265 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3267 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _3265;
    float _3269 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3271 = _3269 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3273 = 1.0 / _3189;
    if (_3127)
    {
        float _3275 = fma(_3205, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _3193 = _3275;
    }
    float _3277 = _3193;
    if (_3131)
    {
        float _3279 = fma(_3221, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _3201 = _3279;
    }
    float _3281 = _3201;
    float _3283 = _3167;
    float _3285 = _3281;
    if (_3127)
    {
        float _3287 = _3277 * _3167;
        _3283 = _3287;
    }
    float _3289 = _3283;
    float _3291 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3293 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3291;
    float _3295 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3297 = _3295 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3299 = _3293;
    if (_3131)
    {
        float _3301 = _3281 * _3199;
        _3285 = _3301;
    }
    float _3303 = _3285;
    float _3305 = 1.0 / _3227;
    float _3307 = _3237 * _3215;
    float _3309 = _3297 * _3231;
    float _3311 = _3251 * _3247;
    float _3313 = -_3229;
    float _3315 = _3115 * _3313;
    float _3317 = _3255 * _3273;
    float _3319 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _3319;
    float _3323 = _3277;
    if (_3127)
    {
        float _3325 = floor(_3289);
        _3323 = _3325;
    }
    float _3327 = _3323;
    float _3329 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3331 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _3329;
    float _3333 = _3155 * _3229;
    float _3335 = _3209 * _3229;
    float _3337 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3339 = _3337 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3341 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3343 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3341;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3349 = fma(_3175, _3185, _3335);
    float _3351 = 1.0 / _3245;
    float _3353 = _3293 * _3305;
    float _3355 = _3347;
    if (!_3127)
    {
        _3299 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3357 = _3299;
    float _3359 = fma(_3207, _3185, _3315);
    float _3361 = fma(_3141, _3233, _3349);
    float _3363 = fma(_3211, _3233, _3359);
    float _3365 = 1.0 / _3241;
    float _3367 = _3357;
    if (_3127)
    {
        float _3369 = -_3327;
        float _3371 = _3289 + _3369;
        _3367 = _3371;
    }
    float _3373 = _3367;
    float _3375 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3377 = _3373 + _3375;
    bool _3379 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3381 = isnan(_3373);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3387 = _3383 || _3385;
    float _3389 = float(_3387);
    float _3391 = _3245;
    if (_3131)
    {
        float _3393 = floor(_3303);
        _3391 = _3393;
    }
    float _3395 = _3391;
    float _3397 = _3343 * _3351;
    float _3399 = fma(_3139, _3185, _3333);
    float _3401 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3403 = _3373 + _3401;
    float _3405 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3407 = _3373 + _3405;
    float _3409 = fma(_3183, _3233, _3399);
    float _3411 = 1.0 / _3263;
    float _3413 = _3347 * _3365;
    float _3415 = _3409;
    if (!_3131)
    {
        _3355 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3417 = _3355;
    float _3419 = 1.0 / _3271;
    float _3421 = _3417;
    if (_3131)
    {
        float _3423 = -_3395;
        float _3425 = _3303 + _3423;
        _3421 = _3425;
    }
    float _3427 = _3421;
    float _3429 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3431 = _3427 + _3429;
    bool _3433 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3435 = isnan(_3427);
    bool _3437 = _3433 || _3435;
    bool _3439 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3441 = _3437 || _3439;
    float _3443 = float(_3441);
    float _3445 = 1.0 / _3331;
    bool _3447 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3449 = isnan(_3427);
    bool _3451 = _3447 || _3449;
    bool _3453 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3455 = _3451 || _3453;
    float _3457 = float(_3455);
    float _3459 = fma(_3413, _3431, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _3461 = -_3443;
    float _3463 = _3461 + 1.0;
    bool _3465 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3467 = isnan(_3427);
    bool _3469 = _3465 || _3467;
    bool _3471 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3473 = _3469 || _3471;
    float _3475 = float(_3473);
    float _3477 = -_3457;
    float _3479 = _3477 + 1.0;
    float _3481 = 1.0 / _3267;
    float _3483 = _3403 * _3419;
    float _3485 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3487 = _3427 + _3485;
    float _3489 = _3443 * _3479;
    bool _3491 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3493 = isnan(_3427);
    bool _3495 = _3491 || _3493;
    bool _3497 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3499 = _3495 || _3497;
    float _3501 = float(_3499);
    float _3503 = 1.0 / _3321;
    float _3505 = 1.0 / _3339;
    float _3507 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3509 = _3373 + _3507;
    float _3511 = _3509 * _3411;
    float _3513 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3515 = _3373 + _3513;
    float _3517 = 1.0 / _3259;
    float _3519 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3521 = _3373 + _3519;
    float _3523 = _3515 * _3445;
    float _3525 = fma(_3307, _3487, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3529 = _3427 + _3527;
    float _3531 = _3521 * _3481;
    float _3533 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3535 = _3427 + _3533;
    bool _3537 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3539 = isnan(_3427);
    bool _3541 = _3537 || _3539;
    bool _3543 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3545 = _3541 || _3543;
    float _3547 = float(_3545);
    float _3549 = fma(_3309, _3529, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3551 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3553 = _3427 + _3551;
    float _3555 = fma(_3353, _3535, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3557 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3559 = _3427 + _3557;
    float _3561 = _3547 * _3463;
    float _3563 = fma(_3317, _3553, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    bool _3565 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3567 = isnan(_3427);
    bool _3569 = _3565 || _3567;
    bool _3571 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3573 = _3569 || _3571;
    float _3575 = float(_3573);
    float _3577 = fma(_3311, _3559, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3579 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3581 = _3427 + _3579;
    float _3583 = _3407 * _3505;
    float _3585 = -_3547;
    float _3587 = _3585 + 1.0;
    bool _3589 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3591 = isnan(_3427);
    bool _3593 = _3589 || _3591;
    bool _3595 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3597 = _3593 || _3595;
    float _3599 = float(_3597);
    float _3601 = fma(_3397, _3581, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3603 = -_3575;
    float _3605 = _3603 + 1.0;
    float _3607 = _3575 * _3587;
    bool _3609 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3611 = isnan(_3373);
    bool _3613 = _3609 || _3611;
    bool _3615 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3617 = _3613 || _3615;
    float _3619 = float(_3617);
    float _3621 = -_3599;
    float _3623 = _3621 + 1.0;
    float _3625 = _3501 * _3605;
    bool _3627 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3629 = isnan(_3373);
    bool _3631 = _3627 || _3629;
    bool _3633 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3635 = _3631 || _3633;
    float _3637 = float(_3635);
    float _3639 = _3377 * _3517;
    float _3641 = _3457 * _3623;
    float _3643 = -_3619;
    float _3645 = _3643 + 1.0;
    float _3647 = _3525 * _3625;
    float _3649 = -_3475;
    float _3651 = _3649 + 1.0;
    bool _3653 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3655 = isnan(_3373);
    bool _3657 = _3653 || _3655;
    bool _3659 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3661 = _3657 || _3659;
    float _3663 = float(_3661);
    float _3665 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3667 = _3373 + _3665;
    float _3669 = _3637 * _3645;
    float _3671 = _3599 * _3651;
    float _3673 = -_3637;
    float _3675 = _3673 + 1.0;
    float _3677 = -_3501;
    float _3679 = _3677 + 1.0;
    bool _3681 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3683 = isnan(_3373);
    bool _3685 = _3681 || _3683;
    bool _3687 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3689 = _3685 || _3687;
    float _3691 = float(_3689);
    float _3693 = -_3663;
    float _3695 = _3693 + 1.0;
    float _3697 = _3667 * _3503;
    float _3699 = _3663 * _3675;
    float _3701 = fma(_3679, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3647);
    bool _3703 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3705 = isnan(_3373);
    bool _3707 = _3703 || _3705;
    bool _3709 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3711 = _3707 || _3709;
    float _3713 = float(_3711);
    float _3715 = _3691 * _3695;
    float _3717 = -_3691;
    float _3719 = _3717 + 1.0;
    bool _3721 = _3427 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3723 = isnan(_3427);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3729 = _3725 || _3727;
    float _3731 = float(_3729);
    float _3733 = fma(_3459, _3607, _3701);
    bool _3735 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3737 = isnan(_3373);
    bool _3739 = _3735 || _3737;
    bool _3741 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3743 = _3739 || _3741;
    float _3745 = float(_3743);
    float _3747 = _3713 * _3719;
    float _3749 = -_3713;
    float _3751 = _3749 + 1.0;
    bool _3753 = _3373 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3755 = isnan(_3373);
    bool _3757 = _3753 || _3755;
    bool _3759 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3761 = _3757 || _3759;
    float _3763 = float(_3761);
    float _3765 = -_3731;
    float _3767 = _3765 + 1.0;
    float _3769 = -_3745;
    float _3771 = _3769 + 1.0;
    float _3773 = _3745 * _3751;
    float _3775 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3777 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3775;
    float _3779 = -_3763;
    float _3781 = _3779 + 1.0;
    float _3783 = _3475 * _3767;
    float _3785 = _3763 * _3771;
    float _3787 = fma(_3777, _3639, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3789 = _3389 * _3781;
    float _3791 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _3793 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _3791;
    float _3795 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3797 = _3795 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3799 = -_3389;
    float _3801 = _3799 + 1.0;
    float _3803 = _3787 * _3789;
    float _3805 = fma(_3793, _3639, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _3807 = fma(_3797, _3511, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3809 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3803);
    float _3811 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _3813 = _3811 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3815 = _3805 * _3789;
    float _3817 = fma(_3807, _3785, _3809);
    float _3819 = fma(_3813, _3511, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _3821 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[167].y, _3815);
    float _3823 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3825 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _3823;
    float _3827 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3829 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3827;
    float _3831 = fma(_3555, _3561, _3733);
    float _3833 = fma(_3819, _3785, _3821);
    float _3835 = fma(_3825, _3531, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _3837 = fma(_3829, _3531, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3839 = fma(_3549, _3489, _3831);
    float _3841 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _3843 = _3841 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3845 = fma(_3835, _3773, _3833);
    float _3847 = fma(_3837, _3773, _3817);
    float _3849 = fma(_3577, _3641, _3839);
    float _3851 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3853 = _3851 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3855 = fma(_3843, _3483, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _3857 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3859 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _3857;
    float _3861 = fma(_3563, _3671, _3849);
    float _3863 = fma(_3853, _3483, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3865 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3867 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3865;
    float _3869 = fma(_3855, _3747, _3845);
    float _3871 = fma(_3859, _3697, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _3873 = fma(_3863, _3747, _3847);
    float _3875 = fma(_3867, _3697, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3877 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3879 = _3877 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3881 = fma(_3871, _3715, _3869);
    float _3883 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3885 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3883;
    float _3887 = fma(_3601, _3783, _3861);
    float _3889 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _3891 = _3889 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3893 = fma(_3875, _3715, _3873);
    float _3895 = fma(_3879, _3583, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3897 = fma(_3885, _3523, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3899 = fma(_3891, _3583, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _3901 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _3901;
    float _3905 = fma(_3895, _3699, _3893);
    float _3907 = _3409 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3909 = fma(_3899, _3699, _3881);
    float _3911 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3887);
    float _3913 = fma(_3897, _3669, _3905);
    float _3915 = _3409 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3917 = fma(_3903, _3523, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _3919 = fma(_3363, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3907);
    float _3921 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3923 = _2179 + _3921;
    float _3925 = fma(_3619, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3913);
    float _3927 = _3911 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _3929 = fma(_3917, _3669, _3909);
    float _3931 = fma(_3363, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3915);
    float _3933 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3919);
    float _3935 = -_3927;
    float _3937 = fma(_3925, _3923, _3935);
    float _3939 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3941 = _2147 + _3939;
    float _3943 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3931);
    float _3945 = _3911 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _3947 = _3933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3949 = fma(_3619, (*spvDescriptorSet0.vp_c9)._m0[174].y, _3929);
    float _3951 = _3943 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3953 = -_3945;
    float _3955 = fma(_3925, _3941, _3953);
    float _3957 = fma(_3947, _3949, _3937);
    float _3959 = fma(_3951, _3949, _3955);
    float _3961 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3963 = _3957 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3965 = _3409 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3967 = _3959 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3969 = fma(_2055, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3961);
    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3973 = _3963 + _3971;
    float _3975 = fma(_3363, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3965);
    float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3979 = _3967 + _3977;
    float _3981 = fma(_2059, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3969);
    float _3983 = _3973 * _3973;
    float _3985 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3975);
    float _3987 = _3981 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3989 = fma(_3979, _3979, _3983);
    float _3991 = _3985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3993 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _3995 = _3987 + _3993;
    float _3997 = sqrt(_3989);
    bool _3999 = _3997 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4003 = _3997 + _4001;
    float _4005 = _2135 + _3991;
    float _4007 = _3911 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _4009 = -_3987;
    float _4011 = _4005 + _4009;
    float _4013 = -_4007;
    float _4015 = fma(_3925, _3995, _4013);
    float _4017 = fma(_3949, _4011, _4015);
    float _4019 = _3947;
    float _4021 = _3911;
    float _4023 = _3995;
    float _4025 = _3925;
    float _4027 = _4003;
    float _4029 = (*spvDescriptorSet0.vp_c9)._m0[172].y;
    if (_3999)
    {
        float _4031 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4019 = _4031;
    }
    float _4033 = _4019;
    if (!_3999)
    {
        _4021 = _3963;
    }
    float _4035 = _4021;
    float _4037 = _4017 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _4039 = _4035;
    if (_3999)
    {
        float _4041 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4023 = _4041;
    }
    float _4043 = _4023;
    float _4045 = _4043;
    if (_3999)
    {
        float _4047 = rsqrt(_3989);
        _4025 = _4047;
    }
    float _4049 = _4025;
    float _4051 = _4049;
    if (_3999)
    {
        float _4053 = _4003 * _4033;
        _4027 = _4053;
    }
    float _4055 = _4027;
    if (_3999)
    {
        float _4057 = _4055 * 0.15915493667125701904296875;
        _3415 = _4057;
    }
    float _4059 = _3415;
    float _4061 = _4055;
    if (_3999)
    {
        float _4063 = _4059 * 6.283185482025146484375;
        float _4065 = sin(_4063);
        _4061 = _4065;
    }
    float _4067 = _4061;
    float _4069 = _4067;
    if (_3999)
    {
        float _4071 = fma(_4067, _4043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4069 = _4071;
    }
    float _4073 = _4069;
    float _4075 = _4073;
    if (!_3999)
    {
        _4045 = _3967;
    }
    float _4077 = _4045;
    float _4079 = _4077;
    if (_3999)
    {
        float _4081 = _4049 * _4073;
        _4075 = _4081;
    }
    float _4083 = _4075;
    if (_3999)
    {
        float _4085 = fma(_3979, _4083, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _4079 = _4085;
    }
    float _4087 = _4079;
    if (_3999)
    {
        float _4089 = fma(_3973, _4083, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4039 = _4089;
    }
    float _4091 = _4039;
    float _4093 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _4095 = _4087 + _4093;
    float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _4099 = _4091 + _4097;
    float _4101 = fma(_4095, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _4103 = fma(_4099, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _11714 = float2(_4101, _4103);
    float _4105 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_11714, float2(0.0), isnan(_11714)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_11714, float2(0.0), isnan(_11714)), level(0.0)).x;
    float _4107 = _4099;
    float _4109 = _4095;
    float _4111 = _4091;
    if (_3999)
    {
        float _4113 = _4059 * 6.283185482025146484375;
        float _4115 = cos(_4113);
        _4107 = _4115;
    }
    float _4117 = _4107;
    if (!_3999)
    {
        _4109 = _4037;
    }
    float _4119 = _4109;
    float _4121 = -_2147;
    float _4123 = _4121 + _4087;
    float _4125 = -_2179;
    float _4127 = _4125 + _4091;
    float _4129 = _4119;
    if (_3999)
    {
        float _4131 = _4117 + (-1.0);
        _4051 = _4131;
    }
    float _4133 = _4051;
    float _4135 = _4133;
    if (_3999)
    {
        float _4137 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4135 = _4137;
    }
    float _4139 = _4135;
    if (_3999)
    {
        float _4141 = fma(_4037, _4117, _4139);
        _4129 = _4141;
    }
    float _4143 = _4129;
    float _4145 = -_2135;
    float _4147 = _4145 + _4143;
    bool _4149 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4151 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4153 = _4149 || _4151;
    bool _4155 = isnan(0.5);
    bool _4157 = _4153 || _4155;
    float _4159 = fma(_4105, 100.0, _2135);
    float _4161 = -_2765;
    float _4163 = _4161 + _4159;
    float _4165 = _4163 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4167 = _4163 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4169 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4165);
    float _4171 = _4147 * _4147;
    float _4173 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4167);
    float _4175 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4169);
    float _4177 = fma(_4123, _4123, _4171);
    float _4179 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4173);
    float _4181 = _4175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4183 = fma(_4127, _4127, _4177);
    float _4185 = _4179 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4187 = 1.0 / _4181;
    float _4189 = _4185 + _4181;
    float _4191 = sqrt(_4183);
    float _4193 = fma(_4105, 100.0, _4143);
    float _4195 = _4189 * _4187;
    float _4197 = _4195 * 0.5;
    float _4199 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4201 = fma(_4197, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4199);
    bool _4203 = _4191 > 0.0;
    float _4205 = 1.0 / _4201;
    bool _4207 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4209 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4211 = _4207 || _4209;
    bool _4213 = isnan(0.5);
    bool _4215 = _4211 || _4213;
    float _4217 = _4175;
    float _4219 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4221 = _4105;
    if (!_4203)
    {
        _4217 = _4087;
    }
    float _4223 = _4217;
    float _4225 = _4223;
    float _4227 = _4223;
    if (!_4203)
    {
        _4219 = _4193;
    }
    float _4229 = _4219;
    bool _4231 = !_4203;
    float _4233 = _4229;
    if (!_4231)
    {
        float _4235 = _206 * _206;
        float _4237 = rsqrt(_4183);
        float _4239 = fma(_204, _204, _4235);
        float _4241 = fma(_208, _208, _4239);
        float _4243 = sqrt(_4241);
        float _4245 = _4123 * _4237;
        float _4247 = _4147 * _4237;
        float _4249 = _4127 * _4237;
        bool _4251 = _4243 > 0.0;
        float _4253 = _4239;
        _4221 = _4243;
        if (!_4251)
        {
            _4225 = _4087;
        }
        float _4255 = _4225;
        _4227 = _4255;
        if (!_4251)
        {
            _4253 = _4193;
        }
        float _4257 = _4253;
        bool _4259 = !_4251;
        _4233 = _4257;
        if (!_4259)
        {
            float _4261 = rsqrt(_4241);
            float _4263 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4265 = _206 * _4261;
            float _4267 = _204 * _4261;
            float _4269 = _208 * _4261;
            float _4271 = _4247 * _4265;
            float _4273 = fma(_4245, _4267, _4271);
            float _4275 = _4263 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4277 = fma(_4249, _4269, _4273);
            float _4279 = _4277 * _4275;
            float _4281 = fma(_204, _4279, _4087);
            float _4283 = fma(_206, _4279, _4193);
            float _4285 = fma(_208, _4279, _4091);
            _4227 = _4281;
            _4111 = _4285;
            _4233 = _4283;
            _4221 = _4265;
        }
    }
    float _4287 = _4227;
    float _4289 = _4111;
    float _4291 = _4233;
    float _4293 = _4221;
    float _4295 = -_2769;
    float _4297 = _4295 + _4287;
    float _4299 = -_2987;
    float _4301 = _4299 + _4289;
    float _4303 = -_2765;
    float _4305 = _4303 + _4291;
    float _4307 = _4293;
    float _4309 = _4305;
    float _4311 = _4297;
    float _4313 = _4301;
    if (_4157)
    {
        _4307 = 1.0;
    }
    float _4315 = _4307;
    float _4317 = _4315;
    if (!_4215)
    {
        float _4319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4321 = _4163 + _4319;
        float _4323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4325 = -_2179;
        float _4327 = _4325 + _4289;
        float _4329 = -_4159;
        float _4331 = _4329 + _4291;
        float _4333 = _4321 * _4321;
        float _4335 = fma(_3037, _3037, _4333);
        float _4337 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4339 = fma(_3049, _3049, _4335);
        float _4341 = 1.0 / _3135;
        float _4343 = sqrt(_4339);
        float _4345 = _4337 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4347 = precise::min(_4343, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4349 = _4347 * _4323;
        float _4351 = _4349 * _4341;
        float _4353 = -_2147;
        float _4355 = _4353 + _4287;
        float _4357 = _4345 * _4351;
        float _4359 = _4327 * _4351;
        float _4361 = fma(_4331, _4357, _4163);
        float _4363 = fma(_4355, _4357, _3023);
        float _4365 = fma(_4345, _4359, _3033);
        _3089 = _4343;
        _4309 = _4361;
        _4311 = _4363;
        _4313 = _4365;
    }
    float _4367 = _3089;
    float _4369 = _4309;
    float _4371 = _4311;
    float _4373 = _4313;
    float _4375 = _4367;
    if (_4157)
    {
        _2317 = 1.0;
    }
    float _4377 = _2317;
    float _4379 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4381 = _4205 * _4379;
    float _4383 = _4377;
    if (!_4157)
    {
        float _4385 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4387 = _4385 * 0.15915493667125701904296875;
        float _4389 = _4387 * 6.283185482025146484375;
        float _4391 = cos(_4389);
        float _4393 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4395 = _4393 * 0.15915493667125701904296875;
        float _4397 = _4387 * 6.283185482025146484375;
        float _4399 = sin(_4397);
        float _4401 = 1.0 / _4391;
        float _4403 = _4395 * 6.283185482025146484375;
        float _4405 = cos(_4403);
        float _4407 = _4399 * _4401;
        float _4409 = _4395 * 6.283185482025146484375;
        float _4411 = sin(_4409);
        float _4413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4415 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4413;
        float _4417 = _4405 * _4407;
        float _4419 = 1.0 / _4415;
        float _4421 = 1.0 / _4417;
        float _4423 = _4411 * _4421;
        float _4425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4427 = fma(_4381, _4423, _4425);
        float _4429 = _4427 * _4419;
        float _4431 = precise::clamp(_4429, 0.0, 1.0);
        _4375 = _4407;
        _4317 = _4431;
    }
    float _4433 = _4375;
    float _4435 = _4317;
    float _4437 = _4433;
    if (!_4157)
    {
        float _4439 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4441 = _4439 * 0.15915493667125701904296875;
        float _4443 = _4441 * 6.283185482025146484375;
        float _4445 = cos(_4443);
        float _4447 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4449 = _4447 * 0.15915493667125701904296875;
        float _4451 = _4441 * 6.283185482025146484375;
        float _4453 = sin(_4451);
        float _4455 = 1.0 / _4445;
        float _4457 = _4449 * 6.283185482025146484375;
        float _4459 = cos(_4457);
        float _4461 = _4453 * _4455;
        float _4463 = _4449 * 6.283185482025146484375;
        float _4465 = sin(_4463);
        float _4467 = _4459 * _4461;
        float _4469 = 1.0 / _4467;
        float _4471 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4473 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4471;
        float _4475 = 1.0 / _4473;
        float _4477 = _4465 * _4469;
        float _4479 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4481 = fma(_4381, _4477, _4479);
        float _4483 = _4481 * _4475;
        float _4485 = precise::clamp(_4483, 0.0, 1.0);
        float _4487 = -_4485;
        float _4489 = _4487 + 1.0;
        _4437 = _4445;
        _4383 = _4489;
    }
    float _4491 = _4437;
    float _4493 = _4383;
    float _4495 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4497 = _4369 + _4495;
    float _4499 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4501 = _4371 + _4499;
    float _4503 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4505 = _4373 + _4503;
    float _4507 = _4497 * _4497;
    float _4509 = fma(_4501, _4501, _4507);
    float _4511 = fma(_3023, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4513 = fma(_4505, _4505, _4509);
    float _4515 = rsqrt(_4513);
    float _4517 = sqrt(_4513);
    float _4519 = _4515 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4521 = _4501 * _4519;
    float _4523 = _4505 * _4519;
    float _4525 = _4521 * _4521;
    float _4527 = _4523 * _4523;
    float _4529 = _4525 + _4527;
    float _4531 = sqrt(_4529);
    bool _4533 = _4531 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4535 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4537 = _4531 + _4535;
    float _4539 = _4505;
    float _4541 = _4515;
    float _4543 = _4537;
    float _4545 = _4491;
    float _4547 = _4497;
    float _4549 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4533)
    {
        float _4551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4539 = _4551;
    }
    float _4553 = _4539;
    if (_4533)
    {
        float _4555 = rsqrt(_4529);
        _4541 = _4555;
    }
    float _4557 = _4541;
    float _4559 = _4557;
    if (_4533)
    {
        float _4561 = _4537 * _4553;
        _4543 = _4561;
    }
    float _4563 = _4543;
    if (_4533)
    {
        float _4565 = _4563 * 0.15915493667125701904296875;
        _4545 = _4565;
    }
    float _4567 = _4545;
    float _4569 = _4553;
    float _4571 = _4567;
    if (_4533)
    {
        float _4573 = _4567 * 6.283185482025146484375;
        float _4575 = sin(_4573);
        _4569 = _4575;
    }
    float _4577 = _4569;
    float _4579 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4581 = precise::max(0.0, _4579);
    float _4583 = _4507;
    float _4585 = _4581;
    if (_4533)
    {
        float _4587 = _4567 * 6.283185482025146484375;
        float _4589 = cos(_4587);
        _4583 = _4589;
    }
    float _4591 = _4583;
    float _4593 = -_4519;
    float _4595 = -_4581;
    float _4597 = fma(_4497, _4593, _4595);
    if (!_4533)
    {
        _4547 = _4523;
    }
    float _4599 = _4547;
    float _4601 = _4599;
    if (_4533)
    {
        float _4603 = _4597 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4585 = _4603;
    }
    float _4605 = _4585;
    float _4607 = _4605;
    if (!_4533)
    {
        _4571 = _4525;
    }
    float _4609 = _4571;
    float _4611 = _4577;
    float _4613 = _4609;
    if (_4533)
    {
        float _4615 = fma(_4577, _4605, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4611 = _4615;
    }
    float _4617 = _4611;
    float _4619 = _4617;
    float _4621 = _4591;
    if (_4533)
    {
        float _4623 = _4591 + (-1.0);
        _4607 = _4623;
    }
    float _4625 = _4607;
    float _4627 = _4625;
    if (_4533)
    {
        float _4629 = _4557 * _4617;
        _4549 = _4629;
    }
    float _4631 = _4549;
    if (!_4533)
    {
        _4559 = _4521;
    }
    float _4633 = _4559;
    float _4635 = _4633;
    if (_4533)
    {
        float _4637 = _4625 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4627 = _4637;
    }
    float _4639 = _4627;
    if (_4533)
    {
        float _4641 = _4521 * _4631;
        _4635 = _4641;
    }
    float _4643 = _4635;
    if (!_4533)
    {
        _4619 = _4597;
    }
    float _4645 = _4619;
    float _4647 = _4645;
    if (_4533)
    {
        float _4649 = _4523 * _4631;
        _4601 = _4649;
    }
    float _4651 = _4601;
    if (_4533)
    {
        float _4653 = fma(_4597, _4591, _4639);
        _4647 = _4653;
    }
    float _4655 = _4647;
    if (_4533)
    {
        float _4657 = _4643 * _4643;
        _4613 = _4657;
    }
    float _4659 = _4613;
    if (!_4533)
    {
        _4621 = _4527;
    }
    float _4661 = _4621;
    float _4663 = _4661;
    if (_4533)
    {
        float _4665 = _4651 * _4651;
        _4663 = _4665;
    }
    float _4667 = _4663;
    float _4669 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4671 = fma(_4655, _4655, _4659);
    float _4673 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4675 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4669);
    float _4677 = _4671 + _4667;
    float _4679 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4681 = fma(_4517, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4679);
    float _4683 = precise::clamp(_4681, 0.0, 1.0);
    float _4685 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4675);
    float _4687 = floor(_4511);
    float _4689 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4673);
    float _4691 = -_4683;
    float _4693 = _4691 + 1.0;
    float _4695 = _4685 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4697 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4699 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4689);
    float _4701 = _4695 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4703 = rsqrt(_4677);
    float _4705 = fma(_3033, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4707 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4709 = -_4701;
    float _4711 = fma(_4709, _4697, 1.0);
    float _4713 = _4369 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4715 = _4699 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4717 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4707);
    float _4719 = abs(_4693);
    float _4721 = log2(_4719);
    float _4723 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4713);
    float _4725 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4717);
    float _4727 = -_4687;
    float _4729 = _4511 + _4727;
    float _4731 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4723);
    float _4733 = _4725 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4735 = _4703 * _4643;
    float _4737 = _4703 * _4655;
    float _4739 = _4703 * _4651;
    float _4741 = _4731 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4743 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4745 = floor(_4705);
    float _4747 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4749 = _4737 + 1.0;
    float _4751 = -_4743;
    float _4753 = fma(_4737, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4751);
    float _4755 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4757 = _4721 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4759 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4747);
    float _4761 = -_4739;
    float _4763 = fma(_4761, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4753);
    float _4765 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4755);
    float _4767 = exp2(_4757);
    float _4769 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4759);
    float _4771 = fma(_4763, -0.5, 0.5);
    float _4773 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4765);
    float _4775 = fma(_4763, 0.5, 0.5);
    float _4777 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4773);
    float _4779 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4781 = log2(_4711);
    float _4783 = fma(_4775, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4785 = -_4745;
    float _4787 = _4705 + _4785;
    float _4789 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4779);
    float _4791 = fma(_4775, _4783, -0.212114393711090087890625);
    float _4793 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4789);
    float _4795 = 1.0 / _4777;
    float _4797 = -_4737;
    float _4799 = fma(_4767, _4749, _4797);
    float _4801 = sqrt(_4771);
    float _4803 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4793);
    float _4805 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4769);
    float _4807 = _4781 * 0.693147182464599609375;
    float2 _12809 = float2(_4729, _4787);
    float _4809 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12809, float2(0.0), isnan(_12809)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12809, float2(0.0), isnan(_12809)), level(0.0)).x;
    float _4811 = fma(_4775, _4791, 1.570728778839111328125);
    float _4813 = _4807 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4815 = _4803 * _4795;
    float _4817 = _4805 * _4795;
    float _4819 = fma(_4815, 0.5, 0.5);
    float _4821 = fma(_4817, -0.5, 0.5);
    float _4823 = _4801 * 0.636619746685028076171875;
    float3 _12839 = float3(_4819, _4821, _4813);
    float _4825 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12839, float3(0.0), isnan(_12839)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12839, float3(0.0), isnan(_12839)), level(0.0)).x;
    float _4827 = -_4811;
    float _4829 = fma(_4823, _4827, 1.0);
    float _4831 = fma(_4799, 0.5, 0.5);
    float3 _12857 = float3(_4819, _4821, _4813);
    float4 _4834 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12857, float3(0.0), isnan(_12857)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12857, float3(0.0), isnan(_12857)), level(0.0)).xyzw;
    float _4836 = _4834.x;
    float _4838 = _4834.y;
    float _4840 = _4834.z;
    float _4842 = _4834.w;
    float2 _12873 = float2(_4829, _4831);
    float3 _4846 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12873, float2(0.0), isnan(_12873)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12873, float2(0.0), isnan(_12873)), level(0.0)).xyz;
    float _4848 = _4846.x;
    float _4850 = _4846.y;
    float _4852 = _4846.z;
    float _4854 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4856 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4858 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _4860 = _3119 != 0.0;
    bool _4862 = isnan(_3119);
    bool _4864 = _4860 || _4862;
    bool _4866 = isnan(0.0);
    bool _4868 = _4864 || _4866;
    float _4870 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4854);
    float _4872 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4856);
    float _4874 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4858);
    out.m_65.x = _572;
    out.m_65.y = _582;
    out.m_65.z = _562;
    out.m_65.w = _574;
    bool _4876 = _3117 == 0.0;
    bool _4878 = !_4868;
    bool _4880 = _4876 && _4878;
    float _4882 = _4721 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4884 = _4733 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4886 = in.m_81.x;
    float _4888 = in.m_81.y;
    float _4890 = in.m_81.z;
    bool _4892 = _3121 == 0.0;
    bool _4894 = _4892 && _4880;
    float _4896 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4870);
    float _4898 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4872);
    float _4900 = in.m_83.x;
    float _4902 = in.m_83.y;
    float _4904 = in.m_83.z;
    float _4906 = in.m_83.w;
    float _4908 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4874);
    float _4910 = _3155 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4912 = _3183 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_67.x = _684;
    out.m_67.y = _690;
    out.m_67.z = _688;
    out.m_67.w = _692;
    float _4914 = -_3115;
    float _4916 = fma(_4914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4910);
    float _4918 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4912);
    float _4920 = exp2(_4882);
    float _4922 = fma(_4741, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4884);
    out.m_85.x = _4371;
    out.m_85.y = _4369;
    out.m_85.z = _4373;
    float _4924 = fma(_4695, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4922);
    float _4926 = _3155 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4928 = _3155 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4930 = _3183 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4932 = _3183 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4934 = -_3115;
    float _4936 = fma(_4934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4926);
    float _4938 = -_3115;
    float _4940 = fma(_4938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4928);
    float _4942 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4930);
    float _4944 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4932);
    float _4946 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4936);
    float _4948 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4940);
    float _4950 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4916);
    float _4952 = _4916;
    float _4954 = _4918;
    float _4956 = _4886;
    if (_4894)
    {
        _4952 = _4886;
    }
    float _4958 = _4952;
    float _4960 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4942);
    float _4962 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4944);
    float _4964 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4918);
    float _4966 = _4958;
    if (_4894)
    {
        _4029 = _4890;
    }
    float _4968 = _4029;
    float _4970 = _4948 * _4902;
    float _4972 = _4968;
    if (_4894)
    {
        _4954 = _4958;
    }
    float _4974 = _4954;
    float _4976 = _4946 * _4902;
    float _4978 = _4974;
    if (!_4894)
    {
        _4966 = _4886;
    }
    float _4980 = _4966;
    float _4982 = fma(_4898, _4900, _4970);
    if (_4894)
    {
        _4956 = _4968;
    }
    float _4984 = _4956;
    float _4986 = fma(_4896, _4900, _4976);
    float _4988 = _4984;
    if (!_4894)
    {
        _4972 = _4890;
    }
    float _4990 = _4972;
    float _4992 = _4950 * _4902;
    if (!_4894)
    {
        float _4994 = fma(_3117, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4980);
        _4978 = _4994;
    }
    float _4996 = _4978;
    float _4998 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _5000 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _4998;
    if (_4894)
    {
        _3195 = _4888;
    }
    float _5002 = _3195;
    float _5004 = fma(_4908, _4900, _4992);
    float _5006 = fma(_4962, _4904, _4982);
    float _5008 = fma(_5000, _3639, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _5010 = _5002;
    if (!_4894)
    {
        float _5012 = fma(_3119, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4888);
        _5010 = _5012;
    }
    float _5014 = _5010;
    float _5016 = fma(_4960, _4904, _4986);
    float _5018 = fma(_4964, _4904, _5004);
    float _5020 = _4904 * _4980;
    if (!_4894)
    {
        float _5022 = fma(_3121, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4990);
        _4988 = _5022;
    }
    float _5024 = _4988;
    float _5026 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _5028 = _5026 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _5030 = _5008 * _3789;
    float _5032 = -_5020;
    float _5034 = fma(_4900, _4990, _5032);
    out.m_87.x = _5016;
    out.m_87.y = _5006;
    out.m_87.z = _5018;
    float _5036 = _4900 * _4888;
    float _5038 = fma(_5028, _3511, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _5040 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[167].z, _5030);
    float _5042 = _4902 * _4990;
    float _5044 = -_5036;
    float _5046 = fma(_4902, _4980, _5044);
    float _5048 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _5050 = _5048 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _5052 = fma(_5038, _3785, _5040);
    float _5054 = -_5042;
    float _5056 = fma(_4904, _4888, _5054);
    float _5058 = fma(_5050, _3483, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _5060 = _4950 * _5014;
    float _5062 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _5064 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _5062;
    float _5066 = _5056 * _4906;
    float _5068 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _5070 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _5068;
    float _5072 = fma(_5064, _3531, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _5074 = -_4920;
    float _5076 = _5074 + 1.0;
    bool _5078 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5080 = isnan(_4517);
    bool _5082 = _5078 || _5080;
    bool _5084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5086 = _5082 || _5084;
    float _5088 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _5090 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _5088;
    float _5092 = fma(_5072, _3773, _5052);
    float _5094 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _5096 = _5094 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _5098 = fma(_5070, _3523, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _5100 = fma(_5090, _3697, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _5102 = fma(_5058, _3747, _5092);
    float _5104 = _5034 * _4906;
    float _5106 = _5046 * _4906;
    float _5108 = fma(_5096, _3583, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _5110 = fma(_5100, _3715, _5102);
    float _5112 = _5104 * _4946;
    float _5114 = _4948 * _5014;
    float _5116 = _5104 * _4948;
    float _5118 = fma(_5108, _3699, _5110);
    float _5120 = fma(_5066, _4896, _5112);
    float _5122 = _5104 * _4950;
    float _5124 = fma(_4898, _4996, _5114);
    float _5126 = fma(_5098, _3669, _5118);
    float _5128 = fma(_5106, _4960, _5120);
    float _5130 = fma(_5066, _4898, _5116);
    float _5132 = abs(_4381);
    float _5134 = log2(_5132);
    float _5136 = fma(_5066, _4908, _5122);
    float _5138 = _4946 * _5014;
    float _5140 = fma(_3619, (*spvDescriptorSet0.vp_c9)._m0[174].z, _5126);
    float _5142 = fma(_4962, _5024, _5124);
    float _5144 = fma(_5106, _4962, _5130);
    float _5146 = fma(_5106, _4964, _5136);
    float _5148 = fma(_4896, _4996, _5138);
    float _5150 = fma(_4908, _4996, _5060);
    out.m_89.x = _5140;
    bool _5152 = _4381 <= 8000.0;
    bool _5154 = isnan(_4381);
    bool _5156 = _5152 || _5154;
    bool _5158 = isnan(8000.0);
    bool _5160 = _5156 || _5158;
    float _5162 = float(_5160);
    float _5164 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.x = _5128;
    out.m_91.y = _5144;
    out.m_91.z = _5146;
    float _5166 = _5134 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5168 = fma(_4960, _5024, _5148);
    float _5170 = fma(_4964, _5024, _5150);
    float _5172 = fma(_4715, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4924);
    float _5174 = exp2(_5166);
    out.m_93.x = _5168;
    out.m_93.y = _5142;
    out.m_93.z = _5170;
    float _5176 = _5172 + _4777;
    out.gl_Position.x = _4803;
    out.gl_Position.y = _4805;
    out.gl_Position.z = _5172;
    out.gl_Position.w = _4777;
    float _5178 = _5176 * 0.5;
    float _5180 = fma(_5174, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5182 = precise::clamp(_5180, 0.0, 1.0);
    float _5184 = _4777 * 0.5;
    float _5186 = fma(_5182, -2.0, 3.0);
    float _5188 = _5182 * _5182;
    float _5190 = _5188 * _5186;
    float _5192 = in.m_69.x;
    float _5194 = -_5190;
    float _5196 = _5194 + 1.0;
    float _5198 = fma(_5196, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5190);
    float _5200 = _4803 + _4777;
    float _5202 = fma(_4805, -0.5, _5184);
    float _5204 = _5162 * _5198;
    float _5206 = _5200 * 0.5;
    float _5208 = _5204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_95.x = _5206;
    out.m_95.y = _5202;
    out.m_95.z = _5178;
    out.m_95.w = _4777;
    float _5210 = -_5164;
    float _5212 = _5210 + 1.0;
    float _5214 = _4777;
    float _5216 = _5178;
    float _5218 = _5202;
    if (!_5086)
    {
        _5214 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5220 = _5214;
    float _5222 = _5220;
    float _5224 = _5220;
    if (!_5086)
    {
        _5216 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5226 = _5216;
    float _5228 = _5226;
    float _5230 = _5226;
    if (!_5086)
    {
        _5218 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5232 = _5218;
    float _5234 = -_4809;
    float _5236 = _5234 + 1.0;
    float _5238 = _5236 * _5208;
    float _5240 = precise::clamp(_5238, 0.0, 1.0);
    float _5242 = -_5240;
    float _5244 = fma(_5242, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5246 = _5244 * _5192;
    float _5248 = _5164 * _4825;
    float _5250 = _5192;
    float _5252 = _5232;
    float _5254 = _5232;
    if (!_5086)
    {
        _5250 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5256 = _5250;
    float _5258 = _5246 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5260 = _4842 * _5248;
    float _5262 = _4842 * _5212;
    out.m_97.x = _5258;
    float _5264 = _4435 * _4493;
    float _5266 = _4852 * _5248;
    float _5268 = fma(_4848, _5260, _4836);
    float _5270 = fma(_4850, _5260, _4838);
    float _5272 = _5264 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5274 = fma(_4842, _5266, _4840);
    float _5276 = _5260;
    float _5278 = _5264;
    float _5280 = _5256;
    float _5282 = _5256;
    if (!_5086)
    {
        _5276 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5284 = _5276;
    float _5286 = _5284;
    float _5288 = _5284;
    if (!_5086)
    {
        _5278 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5290 = _5278;
    out.m_99.x = _5268;
    out.m_99.y = _5270;
    out.m_99.z = _5274;
    out.m_99.w = _5262;
    bool _5292 = !_5086;
    float _5294 = _5290;
    float _5296 = _5290;
    if (!_5292)
    {
        bool _5298 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5300 = isnan(_4517);
        bool _5302 = _5298 || _5300;
        bool _5304 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5306 = _5302 || _5304;
        if (!_5306)
        {
            float _5308 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5310 = _4517 + _5308;
            float _5312 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5314 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5312;
            float _5316 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5318 = _5316 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5320 = 1.0 / _5314;
            float _5322 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5324 = _5322 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5326 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5328 = _5326 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5330 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5332 = _5330 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5334 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5336 = _5334 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5338 = _5310 * _5320;
            float _5340 = precise::clamp(_5338, 0.0, 1.0);
            float _5342 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5344 = _5342 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5346 = fma(_5340, _5318, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5348 = fma(_5340, _5344, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5350 = fma(_5340, _5324, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5352 = fma(_5340, _5328, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5354 = fma(_5340, _5332, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5356 = fma(_5340, _5336, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5288 = _5350;
            _5254 = _5354;
            _5282 = _5346;
            _5230 = _5352;
            _5224 = _5348;
            _5296 = _5356;
            _5358 = true;
        }
        else
        {
            bool _5360 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5362 = isnan(_4517);
            bool _5364 = _5360 || _5362;
            bool _5366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5368 = _5364 || _5366;
            if (!_5368)
            {
                _5280 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5370 = _5280;
            _5282 = _5370;
            if (!_5368)
            {
                _5286 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5372 = _5286;
            _5288 = _5372;
            if (!_5368)
            {
                _5222 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5374 = _5222;
            _5224 = _5374;
            if (!_5368)
            {
                _5228 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5376 = _5228;
            _5230 = _5376;
            if (!_5368)
            {
                _5252 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5378 = _5252;
            _5254 = _5378;
            if (!_5368)
            {
                _5294 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5380 = _5294;
            bool _5382 = !_5368;
            _5296 = _5380;
            if (!_5382)
            {
                bool _5384 = _4517 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5386 = isnan(_4517);
                bool _5388 = _5384 || _5386;
                bool _5390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5392 = _5388 || _5390;
                if (!_5392)
                {
                    float _5394 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5396 = _4517 + _5394;
                    float _5398 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5400 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5398;
                    float _5402 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5404 = _5402 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5406 = 1.0 / _5400;
                    float _5408 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5410 = _5408 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5412 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5414 = _5412 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5416 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5418 = _5416 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5420 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5422 = _5420 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5424 = _5396 * _5406;
                    float _5426 = precise::clamp(_5424, 0.0, 1.0);
                    float _5428 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5430 = _5428 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5432 = fma(_5426, _5404, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5434 = fma(_5426, _5430, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5436 = fma(_5426, _5410, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5438 = fma(_5426, _5414, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5440 = fma(_5426, _5418, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5442 = fma(_5426, _5422, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5288 = _5436;
                    _5254 = _5440;
                    _5282 = _5432;
                    _5230 = _5438;
                    _5224 = _5434;
                    _5296 = _5442;
                    _5358 = true;
                }
                else
                {
                    _5288 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5254 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5282 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5230 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5224 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5296 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5358 = false;
    float _5444 = _5288;
    float _5446 = _5254;
    float _5448 = _5282;
    float _5450 = _5230;
    float _5452 = _5224;
    float _5454 = _5296;
    float _5456 = fma(_5142, -0.5, 0.5);
    float _5458 = precise::clamp(_5456, 0.0, 1.0);
    float _5460 = -_5444;
    float _5462 = _5460 + _5446;
    float _5464 = _5272 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5466 = -_5448;
    float _5468 = _5466 + _5450;
    float _5470 = fma(_5458, _5462, _5444);
    out.m_101.x = 0.0;
    float _5472 = -_5452;
    float _5474 = _5472 + _5454;
    float _5476 = fma(_5458, _5468, _5448);
    float _5478 = _5470 * 0.586610972881317138671875;
    out.m_51.x = _5464;
    bool _5480 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5482 = fma(_5458, _5474, _5452);
    float _5484 = fma(_5476, 0.298911988735198974609375, _5478);
    bool _5486 = _4435 > 0.0;
    bool _5488 = isnan(_4435);
    bool _5490 = _5486 || _5488;
    bool _5492 = isnan(0.0);
    bool _5494 = _5490 || _5492;
    float _5496 = fma(_5482, 0.114477999508380889892578125, _5484);
    bool _5498 = _4493 <= 0.0;
    bool _5500 = !_5494;
    bool _5502 = _5498 || _5500;
    float _5504 = -_5496;
    float _5506 = _5476 + _5504;
    float _5508 = -_5496;
    float _5510 = _5470 + _5508;
    float _5512 = -_5496;
    float _5514 = _5482 + _5512;
    float _5516 = fma(_5506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5496);
    float _5518 = fma(_5510, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5496);
    float _5520 = fma(_5514, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5496);
    bool _5522 = !_5480;
    if (!_5522)
    {
        float _5524 = -_4369;
        float _5526 = _5524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5528 = -_4371;
        float _5530 = _5528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5532 = -_4373;
        float _5534 = _5532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5536 = _5526 * _5526;
        float _5538 = fma(_5530, _5530, _5536);
        float _5540 = fma(_5534, _5534, _5538);
        float _5542 = sqrt(_5540);
        float _5544 = rsqrt(_5540);
        float _5546 = -_5542;
        float _5548 = _5546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5550 = _5548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5552 = precise::clamp(_5550, 0.0, 1.0);
        float _5554 = _5530 * _5544;
        float _5556 = _5526 * _5544;
        float _5558 = abs(_5552);
        float _5560 = log2(_5558);
        float _5562 = _5534 * _5544;
        float _5564 = _5554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5566 = _5142 * _5556;
        float _5568 = -_5556;
        float _5570 = -_5564;
        float _5572 = fma(_5568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5570);
        float _5574 = fma(_5168, _5554, _5566);
        float _5576 = -_5562;
        float _5578 = fma(_5576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5572);
        float _5580 = fma(_5170, _5562, _5574);
        float _5582 = precise::clamp(_5580, 0.0, 1.0);
        float _5584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5586 = _5578 + _5584;
        float _5588 = _5560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5590 = _5586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5592 = precise::clamp(_5590, 0.0, 1.0);
        float _5594 = exp2(_5588);
        float _5596 = _5594 * _5592;
        float _5598 = _5582 * _5596;
        float _5600 = _5598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5602 = _5598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5604 = _5598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _5600;
        out.m_101.y = _5602;
        out.m_101.z = _5604;
    }
    out.m_103.x = _5516;
    out.m_103.y = _5518;
    out.m_103.z = _5520;
    if (!_5502)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _5606 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5606;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

