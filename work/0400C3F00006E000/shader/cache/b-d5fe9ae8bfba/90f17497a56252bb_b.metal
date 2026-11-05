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
    float4 m_63 [[user(locn1)]];
    float4 m_103 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_73 [[user(locn13)]];
    float4 m_85 [[user(locn14)]];
    float4 m_101 [[user(locn15)]];
    float4 m_99 [[user(locn16)]];
    float4 m_95 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_87 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3774 = false;
    bool _790 = false;
    bool _604 = false;
    bool _226 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = in.m_48.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    float _138 = _128;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _134;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _142 = 0;
    if (!_132)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4084 = as_type<float>(_146);
        out.gl_Position.z = _4084;
    }
    if (!_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _148 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_119);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = float(_124);
    bool _160 = _128 >= _158;
    bool _162 = !_156;
    bool _164 = _160 || _162;
    float _166 = 1.0 / _158;
    if (_164)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _136;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    float _170 = _128 * _166;
    int _172 = 0;
    float _174 = _170;
    if (_164)
    {
        float _176 = _168 * 5.0;
        _172 = as_type<int>(_176);
    }
    int _178 = _172;
    out.m_51.x = _170;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4147 = as_type<float>(_178);
        out.gl_Position.z = _4147;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _192 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _194 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _196);
    float _204 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _198);
    bool _206 = !_186;
    float _224;
    if (!_206)
    {
        float _208 = in.m_57.x;
        float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _216 = _214 * _210;
        float _218 = floor(_216);
        float _220 = -_218;
        float _222 = _216 + _220;
        _224 = _222;
        _226 = true;
    }
    else
    {
        _224 = _170;
    }
    _226 = false;
    float _228 = _224;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _246;
    float _250 = 1.0 / _236;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _256 = 1.0 / _244;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _228 + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = 1.0 / _248;
    float _266 = _260 * _250;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _270 = _228 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _274 = _228 + _272;
    bool _276 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_228);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = 1.0 / _232;
    float _290 = _270 * _256;
    bool _292 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _294 = isnan(_228);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _304;
    float _308 = 1.0 / _254;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _228 + _310;
    float _314 = 1.0 / _240;
    float _316 = _312 * _288;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = _228 + _318;
    float _322 = -_302;
    float _324 = _322 + 1.0;
    float _326 = fma(_306, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _328 = _274 * _308;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _332 = _228 + _330;
    bool _334 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_228);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = _332 * _264;
    bool _348 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _350 = isnan(_228);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = _320 * _314;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = -_344;
    float _372 = _370 + 1.0;
    float _374 = _358 * _324;
    float _376 = -_358;
    float _378 = _376 + 1.0;
    float _380 = fma(_368, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_362, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _384 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_228);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _344 * _378;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _286 * _372;
    float _412 = -_286;
    float _414 = _412 + 1.0;
    bool _416 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_228);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = fma(_400, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _430 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _432 = isnan(_228);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_404, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _444 = fma(_408, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _446 = _394 * _414;
    float _448 = -_394;
    float _450 = _448 + 1.0;
    float _452 = -_440;
    float _454 = _452 + 1.0;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = _440 * _450;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = _426 * _454;
    float _472 = fma(_458, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _474 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _476 = fma(_468, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = _380 * _470;
    float _480 = _326 * _470;
    float _482 = -_426;
    float _484 = _482 + 1.0;
    float _486 = _382 * _470;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _496 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].y, _480);
    float _500 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].z, _486);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _506 = fma(_428, _460, _496);
    float _508 = fma(_442, _460, _498);
    float _510 = fma(_444, _460, _500);
    float _512 = fma(_490, _290, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _514 = fma(_494, _290, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _516 = fma(_504, _290, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _518 = fma(_474, _446, _506);
    float _520 = fma(_472, _446, _508);
    float _522 = fma(_476, _446, _510);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _532;
    float _536 = fma(_512, _410, _518);
    float _538 = fma(_514, _410, _520);
    float _540 = fma(_516, _410, _522);
    float _542 = fma(_526, _346, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _544 = fma(_530, _346, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _546 = fma(_534, _346, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _560 = fma(_542, _396, _536);
    float _562 = fma(_550, _328, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _564 = fma(_554, _328, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _566 = fma(_558, _328, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _568 = fma(_544, _396, _538);
    float _570 = fma(_546, _396, _540);
    float _572 = fma(_562, _374, _560);
    float _574 = fma(_564, _374, _568);
    float _576 = fma(_566, _374, _570);
    float _578 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[149].x, _572);
    float _580 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[149].y, _574);
    float _582 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[149].z, _576);
    bool _584 = !_262;
    float _602;
    if (!_584)
    {
        float _586 = in.m_57.x;
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _590 = _586 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _594 = _592 * _588;
        float _596 = floor(_594);
        float _598 = -_596;
        float _600 = _594 + _598;
        _602 = _600;
        _604 = true;
    }
    else
    {
        _602 = _170;
    }
    _604 = false;
    float _606 = _602;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _606 + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _616 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _618 = isnan(_606);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _636 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _638 = isnan(_606);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / _614;
    float _650 = -_626;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _654;
    bool _658 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _660 = isnan(_606);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _646 * _652;
    float _672 = -_646;
    float _674 = _672 + 1.0;
    bool _676 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _678 = 1.0 / _630;
    float _680 = _668 * _674;
    float _682 = -_668;
    float _684 = _682 + 1.0;
    float _686 = 1.0 / _634;
    float _688 = _656 * _648;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _694 = fma(_688, _610, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _696 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _698 = isnan(_606);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _692 * _678;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _716 = _606 + _714;
    float _718 = _694 * _680;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _722 = _606 + _720;
    float _724 = fma(_708, _716, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _726 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _728 = _712 * _686;
    float _730 = -_706;
    float _732 = _730 + 1.0;
    float _734 = fma(_724, _670, _726);
    float _736 = fma(_728, _722, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _738 = _626 * _732;
    float _740 = fma(_736, _738, _734);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _748 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[118].x, _740);
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _758 = in.m_59.x;
    float _760 = in.m_59.y;
    float _762 = in.m_59.z;
    out.m_61.x = _750;
    out.m_61.y = _752;
    out.m_61.z = _754;
    out.m_61.w = _756;
    float _764 = _582 * _762;
    float _766 = _580 * _760;
    float _768 = _578 * _758;
    bool _770 = !_676;
    float _788;
    if (!_770)
    {
        float _772 = in.m_57.x;
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _776 = _772 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _780 = _778 * _774;
        float _782 = floor(_780);
        float _784 = -_782;
        float _786 = _780 + _784;
        _788 = _786;
        _790 = true;
    }
    else
    {
        _788 = _170;
    }
    _790 = false;
    float _792 = _788;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _796 = _792 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _802 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _804 = isnan(_792);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _818 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _820 = isnan(_792);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _830;
    bool _834 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _836 = isnan(_792);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / _800;
    float _848 = -_812;
    float _850 = _848 + 1.0;
    bool _852 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _854 = _828 * _850;
    float _856 = -_828;
    float _858 = _856 + 1.0;
    float _860 = 1.0 / _816;
    float _862 = _832 * _846;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _868 = fma(_862, _796, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _870 = _866 * _860;
    float _872 = _868 * _854;
    float _874 = -_844;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _880 = _792 + _878;
    float _882 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[131].x, _872);
    float _884 = _812 * _876;
    float _886 = fma(_870, _880, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _890 = fma(_886, _884, _882);
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _894 = _888 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _898 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _890);
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = _896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _898 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _894;
    out.m_63.y = _900;
    out.m_63.z = _902;
    out.m_63.w = _904;
    bool _906 = !_852;
    if (!_906)
    {
        float _908 = in.m_57.x;
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _912 = _908 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _916 = _914 * _910;
        float _918 = floor(_916);
        float _920 = -_918;
        float _922 = _916 + _920;
        _174 = _922;
    }
    float _924 = _174;
    float _926 = in.m_57.x;
    float _928 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _930 = in.m_57.y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = in.m_57.z;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _938 = _936 != 0;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _942 = in.m_46.x;
    float _944 = in.m_46.y;
    float _946 = in.m_46.z;
    float _948 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _950 = _926 * 2.0;
    float _952 = _926 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _954 = _930 * 2.0;
    float _956 = _930 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _958 = floor(_950);
    float _960 = -_932;
    float _962 = fma(_952, 2.0, _960);
    float _964 = _934 * 2.0;
    float _966 = fma(_956, -2.0, _940);
    float _968 = _926 + _930;
    float _970 = _930 + _934;
    float _972 = _944 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _974 = _944 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _976 = floor(_954);
    float _978 = _944 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _980 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[4].x, _972);
    float _982 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[5].x, _974);
    float _984 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[6].x, _978);
    float _986 = _968 + (-1.0);
    float _988 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[4].z, _980);
    float _990 = floor(_964);
    float _992 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[5].z, _982);
    float _994 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[6].z, _984);
    float _996 = _942;
    float _998 = _946;
    float _1000 = _984;
    if (_938)
    {
        _996 = _926;
    }
    float _1002 = _996;
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1006 = _1002;
    if (!_938)
    {
        _998 = _930;
    }
    float _1008 = _998;
    float _1010 = _970 + (-1.0);
    float _1012 = _1008;
    if (!_938)
    {
        _1006 = _934;
    }
    float _1014 = _1006;
    float _1016 = -_128;
    float _1018 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[76].x, _962);
    float _1020 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1022 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1024 = log2(_1022);
    if (_938)
    {
        _1012 = _926;
    }
    float _1026 = _1012;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1030 = _958 > 0.0;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1034 = _958 >= 0.0;
    bool _1036 = isnan(_958);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    float _1044 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_938)
    {
        _1000 = _934;
    }
    float _1046 = _1000;
    float _1048 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1050 = _1046;
    if (_938)
    {
        _1050 = _930;
    }
    float _1052 = _1050;
    float _1054 = _988 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1056 = _976 >= 0.0;
    bool _1058 = isnan(_976);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    float _1066 = -_1028;
    float _1068 = fma(_1048, 2.0, _1066);
    bool _1070 = _990 >= 0.0;
    bool _1072 = isnan(_990);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan(0.0);
    bool _1078 = _1074 || _1076;
    float _1080 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1032);
    float _1082 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _966);
    bool _1084 = _976 > 0.0;
    float _1086 = -_128;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1068);
    bool _1090 = _990 > 0.0;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1094 = _1042 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1096 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1080);
    int _1098 = _1064 ? 0 : 1;
    float _1100 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1092);
    float _1102 = _1078 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1104 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1106 = int(_1104);
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1110 = _1108 != 0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1100);
    int _1122 = ~as_type<int>(_1094);
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    bool _1128 = !_1114;
    int _1130 = _1128 ? 0 : 1;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1134 = !_1110;
    int _1136 = _1134 ? 0 : 1;
    bool _1138 = !_1118;
    int _1140 = _1138 ? 0 : 1;
    float _1142 = -_1132;
    float _1144 = fma(_1044, 2.0, _1142);
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1156 = _1154 != 0;
    int _1158 = ~as_type<int>(_1102);
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    float _1164 = -_128;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1144);
    int _1168 = _1126;
    int _1170 = _1162;
    float _1172 = _1094;
    float _1174 = _1102;
    if (!_1030)
    {
        int _1176 = ~as_type<int>(_1094);
        int _1178 = _1176 + 1;
        _1168 = _1178;
    }
    int _1180 = _1168;
    float _1182 = -_1054;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1186 = !_1152;
    int _1188 = _1186 ? 0 : 1;
    bool _1190 = !_1148;
    int _1192 = _1190 ? 0 : 1;
    int _1194 = abs(_1188);
    int _1196 = abs(_1192);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (!_1090)
    {
        int _1200 = ~as_type<int>(_1102);
        int _1202 = _1200 + 1;
        _1170 = _1202;
    }
    int _1204 = _1170;
    if (!_938)
    {
        _1172 = _934;
    }
    float _1206 = _1172;
    float _1208 = _1206;
    if (_938)
    {
        _1174 = _930;
    }
    float _1210 = _1174;
    float _1212 = _1210;
    if (_938)
    {
        _1208 = _930;
    }
    float _1214 = _1208;
    if (!_938)
    {
        _1212 = _926;
    }
    float _1216 = _1212;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1220 = float(_1180);
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1224 = float(_1194);
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1228 = float(_1204);
    float _1230 = fma(_1222, -2.0, _1218);
    float _1232 = float(_1106);
    float _1234 = _1224 * _1220;
    float _1236 = _1024 * _128;
    float _1238 = fma(_1226, -2.0, _1198);
    float _1240 = in.m_65.x;
    float _1242 = in.m_65.y;
    float _1244 = in.m_65.z;
    float _1246 = 1.0 / _1232;
    int _1248 = ~_1098;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1230);
    int _1256 = _1252;
    if (!_1084)
    {
        int _1258 = ~_1098;
        int _1260 = _1258 + 1;
        _1256 = _1260;
    }
    int _1262 = _1256;
    float _1264 = _1234 * (-2.0);
    float _1266 = float(_1196);
    float _1268 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1238);
    float _1270 = exp2(_1236);
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1276 = 1.0 + _1274;
    float _1278 = _1266 * _1228;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1282 = _1278 * (-2.0);
    float _1284 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1286 = int(_1284);
    bool _1288 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1290 = isnan(1.0);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1296 = _1292 || _1294;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1310 = _1306 || _1308;
    float _1312 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1280);
    float _1314 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1298);
    float _1316 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1300);
    float _1318 = 1.0 / _1276;
    float _1320 = -_1270;
    float _1322 = _1320 + 1.0;
    float _1324 = _992 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1326 = fma(_1282, _1240, _1240);
    float _1328 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1272);
    bool _1330 = !_1156;
    int _1332 = _1330 ? 0 : 1;
    float _1334 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1316);
    float _1336 = _1310 ? _1322 : 0.0;
    float _1338 = _926 + (-0.5);
    float _1340 = float(_1286);
    float _1342 = -_1324;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1246 * _128;
    float _1348 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1312);
    float _1350 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1314);
    float _1352 = _1340 * _128;
    float _1354 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1328);
    int _1356 = abs(_1332);
    float _1358 = _1324;
    if (_1296)
    {
        float _1360 = _1336 * _1318;
        _138 = _1360;
    }
    float _1362 = _138;
    float _1364 = _994 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1366 = fma(_1004, _1282, _1004);
    float _1368 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1326);
    float _1370 = _1344 * _1344;
    float _1372 = fma(_1264, _1242, _1242);
    float _1374 = fma(_1366, _1362, _1368);
    float _1376 = -_1364;
    float _1378 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1380 = fma(_1184, _1184, _1370);
    float _1382 = _930 + (-0.5);
    float _1384 = fma(_1020, _1264, _1020);
    float _1386 = float(_1262);
    float _1388 = _1374 * 0.15915493667125701904296875;
    float _1390 = float(_1356);
    float _1392 = fma(_1378, _1378, _1380);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1372);
    float _1396 = _926 + _934;
    float _1398 = _1390 * _1386;
    float _1400 = rsqrt(_1392);
    float _1402 = _1396 + (-1.0);
    float _1404 = fma(_1384, _1362, _1394);
    float _1406 = _1398 * (-2.0);
    float _1408 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1410 = _934 + (-0.5);
    float _1412 = fma(_1406, _1244, _1244);
    float _1414 = _1388 * 6.283185482025146484375;
    float _1416 = sin(_1414);
    float _1418 = _1404 * 0.15915493667125701904296875;
    float _1420 = fma(_1408, _1406, _1408);
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1412);
    float _1424 = in.m_67.x;
    float _1426 = in.m_67.y;
    float _1428 = in.m_67.z;
    float _1430 = fma(_1420, _1362, _1422);
    float _1432 = _1184 * _1400;
    float _1434 = _1388 * 6.283185482025146484375;
    float _1436 = cos(_1434);
    float _1438 = _1344 * _1400;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1442 = _1438 * _1440;
    float _1444 = _1418 * 6.283185482025146484375;
    float _1446 = sin(_1444);
    float _1448 = _1378 * _1400;
    float _1450 = _1430 * 0.15915493667125701904296875;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1454 = _1432 * _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1458 = -_1442;
    float _1460 = fma(_1432, _1456, _1458);
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1464 = _1448 * _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1468 = -_1454;
    float _1470 = fma(_1448, _1466, _1468);
    float _1472 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1476 = -_1464;
    float _1478 = fma(_1438, _1474, _1476);
    float _1480 = _1470 * _1470;
    float _1482 = _1418 * 6.283185482025146484375;
    float _1484 = cos(_1482);
    float _1486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1424);
    float _1488 = _1436 * _1446;
    float _1490 = _928 * _1486;
    float _1492 = _1450 * 6.283185482025146484375;
    float _1494 = cos(_1492);
    float _1496 = fma(_1478, _1478, _1480);
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1426);
    float _1500 = _1416 * _1446;
    float _1502 = fma(_1460, _1460, _1496);
    float _1504 = _1472 * _1498;
    float _1506 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1428);
    float _1508 = _1450 * 6.283185482025146484375;
    float _1510 = sin(_1508);
    float _1512 = _1436 * _1484;
    float _1514 = _1416 * _1484;
    float _1516 = _948 * _1506;
    float _1518 = rsqrt(_1502);
    float _1520 = _1436 * _1494;
    float _1522 = _1416 * _1494;
    float _1524 = _1484 * _1494;
    float _1526 = _1446 * _1494;
    float _1528 = _1520 * _1504;
    float _1530 = fma(_1510, _1512, _1500);
    float _1532 = -_1488;
    float _1534 = fma(_1510, _1514, _1532);
    float _1536 = -_1514;
    float _1538 = fma(_1510, _1488, _1536);
    float _1540 = -_1504;
    float _1542 = _1510 * _1540;
    float _1544 = fma(_1530, _1490, _1528);
    float _1546 = _1522 * _1504;
    float _1548 = fma(_1510, _1500, _1512);
    float _1550 = fma(_1524, _1490, _1542);
    float _1552 = _1478 * _1518;
    float _1554 = _1470 * _1518;
    float _1556 = _1460 * _1518;
    float _1558 = fma(_1538, _1516, _1544);
    float _1560 = _1438 * _1552;
    float _1562 = _1448 * _1554;
    float _1564 = fma(_1534, _1490, _1546);
    float _1566 = fma(_1526, _1516, _1550);
    float _1568 = -_1560;
    float _1570 = fma(_1432, _1554, _1568);
    float _1572 = -_1562;
    float _1574 = fma(_1438, _1556, _1572);
    float _1576 = fma(_1548, _1516, _1564);
    float _1578 = _1570 * _1558;
    float _1580 = _1574 * _1558;
    float _1582 = fma(_1556, _1566, _1578);
    float _1584 = fma(_1552, _1566, _1580);
    float _1586 = fma(_1448, _1576, _1582);
    float _1588 = fma(_1432, _1576, _1584);
    float _1590 = _1364 + _1586;
    float _1592 = _1054 + _1588;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1596 = _1590 + _1594;
    float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1600 = _1592 + _1598;
    float _1602 = _1596 * _1596;
    float _1604 = fma(_1600, _1600, _1602);
    float _1606 = _1432 * _1556;
    float _1608 = sqrt(_1604);
    float _1610 = -_1606;
    float _1612 = fma(_1448, _1552, _1610);
    float _1614 = _1612 * _1558;
    float _1616 = fma(_1554, _1566, _1614);
    float _1618 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1620 = fma(_1438, _1576, _1616);
    float _1622 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1618);
    bool _1624 = _1608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1626 = _1324 + _1620;
    float _1628 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1622);
    float _1630 = _1622;
    float _1632 = _1576;
    float _1634 = _1620;
    float _1636 = _1596;
    if (!_1624)
    {
        _1630 = _1592;
    }
    float _1638 = _1630;
    float _1640 = _1638;
    if (!_1624)
    {
        _1632 = _1590;
    }
    float _1642 = _1632;
    float _1644 = _1642;
    if (!_1624)
    {
        _1634 = _1626;
    }
    float _1646 = _1634;
    bool _1648 = !_1624;
    float _1650 = _1646;
    if (!_1648)
    {
        float _1652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1656 = _1608 + _1654;
        float _1658 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1660 = rsqrt(_1604);
        float _1662 = _1656 * _1652;
        float _1664 = _1662 * 0.15915493667125701904296875;
        float _1666 = _1664 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        float _1670 = _1664 * 6.283185482025146484375;
        float _1672 = sin(_1670);
        float _1674 = _1668 + (-1.0);
        float _1676 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1678 = fma(_1672, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1680 = fma(_1626, _1668, _1676);
        float _1682 = _1660 * _1678;
        float _1684 = fma(_1600, _1682, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1686 = fma(_1596, _1682, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1650 = _1680;
        _1640 = _1684;
        _1644 = _1686;
    }
    float _1688 = _1650;
    float _1690 = _1640;
    float _1692 = _1644;
    float _1694 = -_1324;
    float _1696 = _1694 + _1688;
    float _1698 = -_1054;
    float _1700 = _1698 + _1690;
    float _1702 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1704 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1706 = _1696 * _1696;
    float _1708 = -_1364;
    float _1710 = _1708 + _1692;
    float _1712 = 1.0 / _1702;
    float _1714 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1704);
    float _1716 = fma(_1700, _1700, _1706);
    float _1718 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1714);
    float _1720 = fma(_1710, _1710, _1716);
    bool _1722 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1724 = isnan(0.5);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1730 = _1726 || _1728;
    float _1732 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1734 = sqrt(_1720);
    bool _1736 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1738 = isnan(0.5);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1744 = _1740 || _1742;
    float _1746 = _1732 + _1702;
    float _1748 = _1746 * _1712;
    float _1750 = _1748 * 0.5;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1754 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1752);
    float _1756 = 1.0 / _1754;
    bool _1758 = _1734 > 0.0;
    bool _1760 = !_1758;
    float _1762 = _1688;
    float _1764 = _1692;
    float _1766 = _1690;
    float _1768 = _1754;
    if (!_1760)
    {
        float _1770 = _202 * _202;
        float _1772 = fma(_200, _200, _1770);
        float _1774 = fma(_204, _204, _1772);
        float _1776 = rsqrt(_1720);
        float _1778 = sqrt(_1774);
        float _1780 = _1700 * _1776;
        float _1782 = _1696 * _1776;
        float _1784 = _1710 * _1776;
        bool _1786 = _1778 > 0.0;
        bool _1788 = !_1786;
        if (!_1788)
        {
            float _1790 = rsqrt(_1774);
            float _1792 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1794 = _202 * _1790;
            float _1796 = _200 * _1790;
            float _1798 = _204 * _1790;
            float _1800 = _1782 * _1794;
            float _1802 = fma(_1780, _1796, _1800);
            float _1804 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1806 = fma(_1784, _1798, _1802);
            float _1808 = _1806 * _1804;
            float _1810 = fma(_200, _1808, _1690);
            float _1812 = fma(_202, _1808, _1688);
            float _1814 = fma(_204, _1808, _1692);
            _1762 = _1812;
            _1764 = _1814;
            _1766 = _1810;
            _1768 = _1800;
        }
    }
    float _1816 = _1762;
    float _1818 = _1764;
    float _1820 = _1766;
    float _1822 = _1768;
    float _1824 = _1822;
    float _1826 = _1816;
    float _1828 = _1820;
    float _1830 = _1818;
    if (_1744)
    {
        _1824 = 1.0;
    }
    float _1832 = _1824;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1836 = _1756 * _1834;
    float _1838 = _1832;
    if (!_1730)
    {
        float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1842 = _1324 + _1840;
        float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1846 = _1054 + _1844;
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1850 = -_1324;
        float _1852 = _1850 + _1816;
        float _1854 = _1842 * _1842;
        float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1858 = _1364 + _1856;
        float _1860 = -_1364;
        float _1862 = _1860 + _1818;
        float _1864 = fma(_1846, _1846, _1854);
        float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1868 = fma(_1858, _1858, _1864);
        float _1870 = sqrt(_1868);
        float _1872 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1874 = precise::min(_1870, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1876 = _1874 * _1866;
        float _1878 = _1872 * _1876;
        float _1880 = -_1054;
        float _1882 = _1880 + _1820;
        float _1884 = fma(_1852, _1878, _1324);
        float _1886 = fma(_1882, _1878, _1054);
        float _1888 = fma(_1862, _1878, _1364);
        _1826 = _1884;
        _1828 = _1886;
        _1830 = _1888;
    }
    float _1890 = _1826;
    float _1892 = _1828;
    float _1894 = _1830;
    if (!_1744)
    {
        float _1896 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1898 = _1896 * 0.15915493667125701904296875;
        float _1900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1902 = _1898 * 6.283185482025146484375;
        float _1904 = cos(_1902);
        float _1906 = _1900 * 0.15915493667125701904296875;
        float _1908 = _1898 * 6.283185482025146484375;
        float _1910 = sin(_1908);
        float _1912 = 1.0 / _1904;
        float _1914 = _1906 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        float _1918 = _1910 * _1912;
        float _1920 = _1906 * 6.283185482025146484375;
        float _1922 = sin(_1920);
        float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1926 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1924;
        float _1928 = _1916 * _1918;
        float _1930 = 1.0 / _1926;
        float _1932 = 1.0 / _1928;
        float _1934 = _1922 * _1932;
        float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1938 = fma(_1836, _1934, _1936);
        float _1940 = _1938 * _1930;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        _1358 = _1918;
        _1838 = _1942;
    }
    float _1944 = _1358;
    float _1946 = _1838;
    float _1948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1950 = _1890 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1954 = _1892 + _1952;
    float _1956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1958 = _1894 + _1956;
    float _1960 = _1950 * _1950;
    float _1962 = fma(_1954, _1954, _1960);
    float _1964 = fma(_1958, _1958, _1962);
    float _1966 = rsqrt(_1964);
    float _1968 = sqrt(_1964);
    float _1970 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1972 = _1954 * _1970;
    float _1974 = _1958 * _1970;
    float _1976 = _1972 * _1972;
    float _1978 = _1974 * _1974;
    float _1980 = _1976 + _1978;
    float _1982 = sqrt(_1980);
    bool _1984 = _1982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1988 = _1982 + _1986;
    float _1990 = _1958;
    float _1992 = _1980;
    float _1994 = _1988;
    float _1996 = _1944;
    if (_1984)
    {
        float _1998 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1990 = _1998;
    }
    float _2000 = _1990;
    if (_1984)
    {
        float _2002 = rsqrt(_1980);
        _1992 = _2002;
    }
    float _2004 = _1992;
    float _2006 = _2004;
    if (_1984)
    {
        float _2008 = _1988 * _2000;
        _1994 = _2008;
    }
    float _2010 = _1994;
    if (_1984)
    {
        float _2012 = _2010 * 0.15915493667125701904296875;
        _1996 = _2012;
    }
    float _2014 = _1996;
    float _2016 = _2000;
    float _2018 = _2014;
    if (_1984)
    {
        float _2020 = _2014 * 6.283185482025146484375;
        float _2022 = sin(_2020);
        _2016 = _2022;
    }
    float _2024 = _2016;
    float _2026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2028 = precise::max(0.0, _2026);
    float _2030 = _1960;
    float _2032 = _2028;
    if (_1984)
    {
        float _2034 = _2014 * 6.283185482025146484375;
        float _2036 = cos(_2034);
        _2030 = _2036;
    }
    float _2038 = _2030;
    float _2040 = -_1970;
    float _2042 = -_2028;
    float _2044 = fma(_1950, _2040, _2042);
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1984)
    {
        float _2048 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2048;
    }
    float _2050 = _2032;
    float _2052 = fma(_1054, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2054 = _2050;
    if (!_1984)
    {
        _2046 = _2044;
    }
    float _2056 = _2046;
    float _2058 = _2024;
    float _2060 = _2056;
    if (_1984)
    {
        float _2062 = fma(_2024, _2050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = floor(_2052);
    float _2068 = _2064;
    float _2070 = _2038;
    if (_1984)
    {
        float _2072 = _2038 + (-1.0);
        _2054 = _2072;
    }
    float _2074 = _2054;
    float _2076 = _2074;
    if (_1984)
    {
        float _2078 = _2004 * _2064;
        _1636 = _2078;
    }
    float _2080 = _1636;
    if (!_1984)
    {
        _2068 = _1972;
    }
    float _2082 = _2068;
    float _2084 = _2082;
    if (_1984)
    {
        float _2086 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2018 = _2086;
    }
    float _2088 = _2018;
    if (_1984)
    {
        float _2090 = _1972 * _2080;
        _2084 = _2090;
    }
    float _2092 = _2084;
    if (!_1984)
    {
        _2076 = _1974;
    }
    float _2094 = _2076;
    float _2096 = _2094;
    if (_1984)
    {
        float _2098 = _1974 * _2080;
        _2096 = _2098;
    }
    float _2100 = _2096;
    if (!_1984)
    {
        _2006 = _1976;
    }
    float _2102 = _2006;
    float _2104 = _2102;
    if (_1984)
    {
        float _2106 = fma(_2044, _2038, _2088);
        _2060 = _2106;
    }
    float _2108 = _2060;
    if (_1984)
    {
        float _2110 = _2092 * _2092;
        _2104 = _2110;
    }
    float _2112 = _2104;
    float _2114 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1984)
    {
        _2070 = _1978;
    }
    float _2116 = _2070;
    float _2118 = _2116;
    if (_1984)
    {
        float _2120 = _2100 * _2100;
        _2118 = _2120;
    }
    float _2122 = _2118;
    float _2124 = fma(_2108, _2108, _2112);
    float _2126 = fma(_1364, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2128 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2130 = _2124 + _2122;
    float _2132 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2134 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2128);
    float _2136 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2114);
    float _2138 = rsqrt(_2130);
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2142 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2140);
    float _2144 = precise::clamp(_2142, 0.0, 1.0);
    float _2146 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2132);
    float _2148 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2134);
    float _2150 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2136);
    float _2152 = -_2144;
    float _2154 = _2152 + 1.0;
    float _2156 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2146);
    float _2158 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2160 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2164 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2166 = abs(_2154);
    float _2168 = log2(_2166);
    float _2170 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2172 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2174 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2164);
    float _2176 = _2138 * _2092;
    float _2178 = _2138 * _2108;
    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2182 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2184 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2186 = _2138 * _2100;
    float _2188 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2172);
    float _2190 = -_2182;
    float _2192 = fma(_2190, _2180, 1.0);
    float _2194 = -_2184;
    float _2196 = fma(_2178, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2194);
    float _2198 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2174);
    float _2200 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2202 = -_2066;
    float _2204 = _2052 + _2202;
    float _2206 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2208 = -_2186;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2196);
    float _2212 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2198);
    float _2214 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2216 = log2(_2192);
    float _2218 = fma(_2210, -0.5, 0.5);
    float _2220 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2222 = fma(_2210, 0.5, 0.5);
    float _2224 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2214);
    float _2226 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2220);
    float _2228 = _2178 + 1.0;
    float _2230 = exp2(_2206);
    float _2232 = fma(_2222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2224);
    float _2236 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2226);
    float _2238 = fma(_2222, _2232, -0.212114393711090087890625);
    float _2240 = sqrt(_2218);
    float _2242 = fma(_2222, _2238, 1.570728778839111328125);
    float _2244 = _2216 * 0.693147182464599609375;
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2248 = 1.0 / _2212;
    float _2250 = -_2178;
    float _2252 = fma(_2230, _2228, _2250);
    float _2254 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2234);
    float _2256 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2236);
    float _2258 = floor(_2126);
    float _2260 = _2240 * 0.636619746685028076171875;
    float _2262 = -_2242;
    float _2264 = fma(_2260, _2262, 1.0);
    float _2266 = fma(_2252, 0.5, 0.5);
    float _2268 = _2254 * _2248;
    float _2270 = _2256 * _2248;
    float _2272 = fma(_2268, 0.5, 0.5);
    float _2274 = fma(_2270, -0.5, 0.5);
    float _2276 = -_2258;
    float _2278 = _2126 + _2276;
    float2 _7537 = float2(_2204, _2278);
    float _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7537, float2(0.0), isnan(_7537)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7537, float2(0.0), isnan(_7537)), level(0.0)).x;
    float3 _7548 = float3(_2272, _2274, _2246);
    float _2282 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7548, float3(0.0), isnan(_7548)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7548, float3(0.0), isnan(_7548)), level(0.0)).x;
    float3 _7559 = float3(_2272, _2274, _2246);
    float4 _2285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7559, float3(0.0), isnan(_7559)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7559, float3(0.0), isnan(_7559)), level(0.0)).xyzw;
    float _2287 = _2285.x;
    float _2289 = _2285.y;
    float _2291 = _2285.z;
    float _2293 = _2285.w;
    float2 _7575 = float2(_2264, _2266);
    float3 _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7575, float2(0.0), isnan(_7575)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7575, float2(0.0), isnan(_7575)), level(0.0)).xyz;
    float _2299 = _2297.x;
    float _2301 = _2297.y;
    float _2303 = _2297.z;
    float _2305 = float(uint(_1286));
    float _2307 = trunc(_1346);
    int _2309 = int(_2307);
    float _2311 = in.m_69.y;
    float _2313 = _1352 * _166;
    bool _2315 = _930 > 0.5;
    float _2317 = in.m_69.x;
    int _2319 = ~_1286;
    int _2321 = _2319 + 1;
    float _2323 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2325 = 1.0 / _2305;
    int _2327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2329 = _2327 != 0;
    float _2331 = in.m_71.w;
    int _2333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2335 = _2333 != 0;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2339 = _2337 != 0;
    out.m_73.x = _1892;
    out.m_73.y = _1890;
    out.m_73.z = _1894;
    bool _2341 = _934 > 0.5;
    float _2343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2345 = float(uint(_2309));
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2349 = _2347 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2351 = as_type<int>(_2325) + (-2);
    float _2353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2355 = abs(_1130);
    float _2357 = as_type<float>(_2351) * _2345;
    int _2359 = abs(_1140);
    float _2361 = in.m_57.w;
    float _2363 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2365 = trunc(_2357);
    float _2367 = precise::max(_2365, 0.0);
    uint _2370 = uint(_2367);
    out.m_75.w = _2331;
    float _2372 = 1.0 / _2349;
    float _2374 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2374;
    int _2378 = _2321 * int(_2370);
    int _2380 = _2378 + _2309;
    float _2382 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2384 = _2382 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2388 = float(uint(_2380));
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _2390;
    bool _2394 = _2361 > 0.5;
    float _2396 = as_type<float>(_2351) * _2388;
    float _2398 = 1.0 / _2392;
    float _2400 = _2361;
    float _2402 = _2311;
    bool _2404 = _2329;
    int _2406 = as_type<int>(_2353);
    float _2408 = _2317;
    float _2410 = _2212;
    float _2412 = _2256;
    float _2414 = _2254;
    if (!_2335)
    {
        _2400 = _2317;
    }
    float _2416 = _2400;
    float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2420 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _2418;
    float _2422 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2424 = _2422 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2426 = trunc(_2396);
    float _2428 = precise::max(_2426, 0.0);
    uint _2430 = uint(_2428);
    int _2432 = ~_1286;
    int _2434 = _2432 + 1;
    bool _2436 = !_938;
    float _2438 = _2436 ? 7.345489978790283203125 : 1.0;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2442 = _2440 != 0;
    float _2444 = 1.0 / _2420;
    float _2446 = -_2311;
    float _2448 = _2446 + 1.0;
    int _2450 = _2315 ? as_type<int>(_2448) : as_type<int>(_2311);
    int _2452 = _2341 ? as_type<int>(_2448) : as_type<int>(_2311);
    float _2454 = 1.0 / _2424;
    float _2456 = _2339 ? as_type<float>(_2450) : _2311;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2460 = _2458 != 0;
    int _2462 = int(_2370) + int(_2430);
    float _2464 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2466 = _2460 ? as_type<float>(_2452) : _2311;
    float _2468 = exp2(_2323);
    int _2470 = as_type<int>(_2448);
    float _2472 = _2416;
    if (_2329)
    {
        float _2474 = _2394 ? _2448 : _2311;
        _2402 = _2474;
    }
    float _2476 = _2402;
    if (_2335)
    {
        float _2478 = -_2317;
        float _2480 = _2478 + 1.0;
        _2470 = as_type<int>(_2480);
    }
    int _2482 = _2470;
    int _2484 = _2434 * _2462;
    int _2486 = _2484 + _2309;
    if (_2335)
    {
        bool _2488 = _926 > 0.5;
        _2404 = _2488;
    }
    bool _2490 = _2404;
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2494 = _924 + _2492;
    int _2496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2498 = _2496 != 0;
    float _2500 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2502 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _2500;
    if (_2335)
    {
        float _2504 = _2490 ? as_type<float>(_2482) : _2317;
        _2472 = _2504;
    }
    float _2506 = _2472;
    float _2508 = _2494 * _2398;
    bool _2510 = uint(_2486) >= uint(_1286);
    float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2514 = _2512 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2516 = 1.0 / _2502;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2520 = _924 + _2518;
    bool _2522 = !_2510;
    int _2524 = _2522 ? 0 : (-1);
    float _2526 = _2438 * _926;
    int _2528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2530 = _2528 != 0;
    float _2532 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2534 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2532;
    float _2536 = _2520 * _2444;
    float _2538 = 1.0 / _2514;
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2542 = _924 + _2540;
    int _2544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2546 = _2544 != 0;
    float _2548 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2550 = _924 + _2548;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2554 = _2552 != 0;
    float _2556 = _2542 * _2372;
    float _2558 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2560 = _924 + _2558;
    float _2562 = 1.0 / _2534;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2566 = _924 + _2564;
    float _2568 = _2560 * _2516;
    float _2570 = _2550 * _2454;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _2572;
    float _2576 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2576;
    float _2580 = fma(_2376, _2508, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2582 = _2566 * _2538;
    float _2584 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _2584;
    float _2588 = fma(_2574, _2508, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2592 = _924 + _2590;
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2594;
    float _2598 = fma(_2578, _2536, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2600;
    float _2604 = fma(_2586, _2536, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _2606 = fma(_2596, _2508, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2608 = fma(_2602, _2536, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _2610 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2612 = _2610 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2620 = _2618 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2626 = _2592 * _2562;
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2632 = fma(_2612, _2556, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2634 = fma(_2384, _2556, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2636 = fma(_2616, _2556, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2642;
    float _2646 = floor(_2526);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _2648;
    float _2652 = fma(_2620, _2570, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2654 = fma(_2624, _2570, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2656 = fma(_2630, _2570, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _2658 = fma(_2640, _2568, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2660 = fma(_2644, _2568, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2664 = _2662 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2666 = fma(_2650, _2568, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2672 = float(_2309);
    float _2674 = fma(_2664, _2582, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _2678 = _2676 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2680 = fma(_2670, _2582, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2682 = _2672 >= _1340;
    bool _2684 = isnan(_2672);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(_1340);
    bool _2690 = _2686 || _2688;
    float _2692 = float(_2690);
    float _2694 = -_1082;
    float _2696 = fma(_1350, _2464, _2694);
    float _2698 = -_2646;
    float _2700 = _2526 + _2698;
    float _2702 = fma(_2678, _2582, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _2704 = fma(_2466, _2363, -0.5);
    float _2706 = trunc(_2692);
    int _2708 = int(_2706);
    float _2710 = _2700 * _1340;
    float _2712 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2714 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2712;
    float _2716 = -_1268;
    float _2718 = fma(_1354, _2704, _2716);
    int _2720 = ~_2462;
    int _2722 = _2720 + _2524;
    int _2724 = _2722 + 1;
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2726;
    float _2730 = trunc(_2710);
    int _2732 = int(_2730);
    float _2734 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _2734;
    bool _2738 = !_2530;
    int _2740 = _2738 ? 0 : 1;
    int _2742 = _1286 * _2724;
    int _2744 = _2742 + _2309;
    bool _2746 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2748 = isnan(_924);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = fma(_2714, _2626, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _2760 = _1286 == 0;
    float _2762 = fma(_2728, _2626, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2764 = fma(_2736, _2626, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    bool _2766 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2768 = isnan(_924);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2774 = _2770 || _2772;
    float _2776 = float(_2774);
    float _2778 = -_2468;
    float _2780 = _2778 + 1.0;
    int _2782 = abs(_2740);
    float _2784 = -_2756;
    float _2786 = _2784 + 1.0;
    int _2788 = ~_2708;
    int _2790 = _2788 + 1;
    int _2792 = _2790 + 1;
    float _2794 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2796 = !_2760;
    int _2798 = _2796 ? _2744 : (-1);
    float _2800 = _2776 * _2786;
    bool _2802 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2804 = isnan(_924);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2810 = _2806 || _2808;
    float _2812 = float(_2810);
    float _2814 = -_2776;
    float _2816 = _2814 + 1.0;
    int _2818 = _2732 * _2782;
    int _2820 = _2818 + _2309;
    int _2822 = _1286 + (-1);
    int _2824 = _2798 * _2792;
    bool _2826 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2828 = isnan(_924);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    float _2838 = -_2812;
    float _2840 = _2838 + 1.0;
    float _2842 = _2812 * _2816;
    bool _2844 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2846 = isnan(_924);
    bool _2848 = _2844 || _2846;
    bool _2850 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2852 = _2848 || _2850;
    float _2854 = float(_2852);
    float _2856 = trunc(_2313);
    int _2858 = int(_2856);
    float _2860 = _2836 * _2840;
    float _2862 = -_2836;
    float _2864 = _2862 + 1.0;
    int _2866 = _2708 * _2822;
    int _2868 = _2866 + _2824;
    bool _2870 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2872 = isnan(_924);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2878 = _2874 || _2876;
    float _2880 = float(_2878);
    float _2882 = _2854 * _2864;
    float _2884 = -_2854;
    float _2886 = _2884 + 1.0;
    int _2888 = abs(_1136);
    int _2890 = _2868 * _2355;
    bool _2892 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2894 = isnan(_924);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2900 = _2896 || _2898;
    float _2902 = float(_2900);
    float _2904 = _2880 * _2886;
    bool _2906 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2908 = isnan(_924);
    bool _2910 = _2906 || _2908;
    bool _2912 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2914 = _2910 || _2912;
    float _2916 = float(_2914);
    float _2918 = -_2880;
    float _2920 = _2918 + 1.0;
    float _2922 = -_2902;
    float _2924 = _2922 + 1.0;
    int _2926 = _2858 * _2888;
    int _2928 = _2926 + _2890;
    float _2930 = _2902 * _2920;
    float _2932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2934 = _2916 * _2924;
    bool _2936 = !_2498;
    float _2938 = _2936 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2940 = in.m_77.x;
    float _2942 = in.m_77.y;
    float _2944 = in.m_77.z;
    bool _2946 = _1426 != 0.0;
    bool _2948 = isnan(_1426);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan(0.0);
    bool _2954 = _2950 || _2952;
    float _2956 = _2606 * _2934;
    float _2958 = _2580 * _2934;
    float _2960 = _2588 * _2934;
    int _2962 = abs(as_type<int>(_2938));
    float _2964 = _2353 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2966 = _2820 * _2359;
    int _2968 = _2966 + _2928;
    bool _2970 = _1424 == 0.0;
    bool _2972 = !_2954;
    bool _2974 = _2970 && _2972;
    int _2976 = _2928;
    float _2978 = _2588;
    float _2980 = _2938;
    int _2982 = as_type<int>(_2958);
    if (_2554)
    {
        float _2984 = -_2317;
        float _2986 = _2984 + 1.0;
        _2976 = as_type<int>(_2986);
    }
    int _2988 = _2976;
    float _2990 = fma(_2964, _2476, -0.5);
    int _2992 = _2732 * _2962;
    int _2994 = _2992 + _2968;
    bool _2996 = _1428 == 0.0;
    bool _2998 = _2996 && _2974;
    float _3000 = as_type<float>(_2988);
    if (_2442)
    {
        float _3002 = -_2317;
        float _3004 = _3002 + 1.0;
        _2406 = as_type<int>(_3004);
    }
    int _3006 = _2406;
    float _3008 = -_2916;
    float _3010 = _3008 + 1.0;
    float _3012 = _3010;
    if (!_2554)
    {
        _2978 = _2317;
    }
    float _3014 = _2978;
    float _3016 = -_1254;
    float _3018 = fma(_1096, _2990, _3016);
    float _3020 = float(uint(_2994));
    float _3022 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2956);
    float _3024 = _3014;
    float _3026 = _3020;
    if (!_2442)
    {
        _2980 = _2317;
    }
    float _3028 = _2980;
    float _3030 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[159].z, _2960);
    float _3032 = _3028;
    if (_2554)
    {
        float _3034 = _2341 ? as_type<float>(_2988) : _2317;
        _3024 = _3034;
    }
    float _3036 = _3024;
    float _3038 = as_type<float>(_2351) * _3020;
    if (_2442)
    {
        float _3040 = _2315 ? as_type<float>(_3006) : _2317;
        _3032 = _3040;
    }
    float _3042 = _3032;
    float _3044 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2958);
    float _3046 = _2942;
    float _3048 = _2940;
    if (_2998)
    {
        _2408 = _2942;
    }
    float _3050 = _2408;
    float _3052 = fma(_2636, _2930, _3030);
    float _3054 = _3050;
    if (_2998)
    {
        _3012 = _2944;
    }
    float _3056 = _3012;
    float _3058 = trunc(_3038);
    float _3060 = precise::max(_3058, 0.0);
    uint _3062 = uint(_3060);
    float _3064 = _3056;
    if (_2998)
    {
        _3026 = _3050;
    }
    float _3066 = _3026;
    float _3068 = _3066;
    if (_2998)
    {
        float _3070 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3050);
        _3000 = _3070;
    }
    float _3072 = _3000;
    float _3074 = _3072;
    if (!_2998)
    {
        _3054 = _2942;
    }
    float _3076 = _3054;
    if (_2998)
    {
        float _3078 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3056);
        _2982 = as_type<int>(_3078);
    }
    int _3080 = _2982;
    int _3082 = _3080;
    if (_2998)
    {
        _3046 = _3056;
    }
    float _3084 = _3046;
    float _3086 = fma(_2634, _2930, _3044);
    float _3088 = _3084;
    if (!_2998)
    {
        _3064 = _2944;
    }
    float _3090 = _3064;
    if (!_2998)
    {
        float _3092 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3076);
        _3074 = _3092;
    }
    float _3094 = _3074;
    float _3096 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3098 = ~_1286;
    int _3100 = _3098 + 1;
    if (!_2998)
    {
        float _3102 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2940);
        _3048 = _3102;
    }
    float _3104 = _3048;
    float _3106 = float(uint(_2820));
    float _3108 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3110 = fma(_3096, _3042, -0.5);
    int _3112 = _3100 * int(_3062);
    int _3114 = _3112 + _2994;
    float _3116 = fma(_2632, _2930, _3022);
    float _3118 = as_type<float>(_2351) * _3106;
    float _3120 = fma(_1348, _3108, _1018);
    int _3122 = ~_1286;
    int _3124 = _3122 + 1;
    float _3126 = fma(_1334, _3110, _1166);
    float _3128 = float(uint(_3114));
    float _3130 = _2932 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3132 = trunc(_3118);
    float _3134 = precise::max(_3132, 0.0);
    uint _3136 = uint(_3134);
    int _3138 = ~_1286;
    int _3140 = _3138 + 1;
    if (!_2998)
    {
        float _3142 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3090);
        _3082 = as_type<int>(_3142);
    }
    int _3144 = _3082;
    float _3146 = as_type<float>(_2351) * _3128;
    float _3148 = fma(_3130, _3036, -0.5);
    float _3150 = _3120 + 0.5;
    if (!_2998)
    {
        _3068 = _3094;
    }
    float _3152 = _3068;
    float _3154 = fma(_2598, _2904, _3116);
    float _3156 = trunc(_3146);
    float _3158 = precise::max(_3156, 0.0);
    uint _3160 = uint(_3158);
    float _3162 = fma(_1120, _3148, _1088);
    bool _3164 = !_2998;
    float _3166 = _3164 ? _3094 : _3076;
    float _3168 = fma(_2608, _2904, _3086);
    bool _3170 = !_2998;
    float _3172 = _3170 ? as_type<float>(_3144) : _3090;
    float _3174 = _3162 + 0.5;
    float _3176 = fma(_2604, _2904, _3052);
    float _3178 = _3166 * _3166;
    int _3180 = _3124 * int(_3136);
    int _3182 = _3180 + _2820;
    float _3184 = _2696 + 0.5;
    float _3186 = fma(_2652, _2882, _3154);
    float _3188 = fma(_3172, _3172, _3178);
    float _3190 = fma(_2654, _2882, _3168);
    float _3192 = float(uint(_3182));
    float _3194 = fma(_2656, _2882, _3176);
    float _3196 = fma(_2658, _2860, _3186);
    int _3198 = int(_3062) + int(_3160);
    float _3200 = rsqrt(_3188);
    float _3202 = as_type<float>(_2351) * _3192;
    float _3204 = _3018 + 0.5;
    float _3206 = fma(_2660, _2860, _3190);
    int _3208 = _3140 * _3198;
    int _3210 = _3208 + _2994;
    float _3212 = fma(_2666, _2860, _3194);
    float _3214 = fma(_2674, _2842, _3196);
    out.m_79.x = _3150;
    out.m_79.y = _3184;
    out.m_79.z = _3174;
    out.m_79.w = _3204;
    float _3216 = abs(_1836);
    float _3218 = log2(_3216);
    bool _3220 = uint(_3210) >= uint(_1286);
    float _3222 = fma(_2680, _2842, _3206);
    float _3224 = fma(_2702, _2842, _3212);
    float _3226 = _1520 * _1612;
    bool _3228 = !_3220;
    int _3230 = _3228 ? 0 : (-1);
    float _3232 = _1530 * _1570;
    float _3234 = _1538 * _1570;
    float _3236 = trunc(_3202);
    float _3238 = precise::max(_3236, 0.0);
    uint _3240 = uint(_3238);
    int _3242 = ~_3198;
    int _3244 = _3242 + _3230;
    int _3246 = _3244 + 1;
    float _3248 = _3172 * _3200;
    float _3250 = fma(_2758, _2800, _3214);
    float _3252 = fma(_2762, _2800, _3222);
    float _3254 = _3126 + 0.5;
    int _3256 = _1286 * _3246;
    int _3258 = _3256 + _2994;
    int _3260 = ~_1286;
    int _3262 = _3260 + 1;
    float _3264 = _3218 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3266 = _2718 + 0.5;
    if (!_2998)
    {
        _3088 = as_type<float>(_3144);
    }
    float _3268 = _3088;
    float _3270 = _1520 * _1574;
    bool _3272 = !_2760;
    int _3274 = _3272 ? _3258 : (-1);
    float _3276 = fma(_1524, _1556, _3232);
    float _3278 = exp2(_3264);
    float _3280 = fma(_2764, _2800, _3224);
    int _3282 = _3274 >> 31;
    out.m_81.x = _3254;
    out.m_81.y = _3266;
    int _3284 = int(_3136) + int(_3240);
    float _3286 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].z, _3280);
    int _3288 = _3282 & 3;
    float _3290 = _3166 * _3200;
    float _3292 = _1530 * _1612;
    int _3294 = _3262 * _3284;
    int _3296 = _3294 + _2820;
    int _3298 = _3274 + _3288;
    float _3300 = _1538 * _1612;
    int _3302 = _3274 & 3;
    bool _3304 = _3302 != 0;
    float _3306 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3250);
    bool _3308 = uint(_3296) >= uint(_1286);
    float _3310 = fma(_3278, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3312 = precise::clamp(_3310, 0.0, 1.0);
    float _3314 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].y, _3252);
    int _3316 = _3298 >> 2;
    float _3318 = -_1510;
    float _3320 = fma(_3318, _1552, _3270);
    bool _3322 = !_3308;
    int _3324 = _3322 ? 0 : (-1);
    float _3326 = fma(_3312, -2.0, 3.0);
    float _3328 = _3312 * _3312;
    int _3330 = _3316 << 4;
    int _3332 = _3330 + 368;
    out.m_83.x = _3306;
    out.m_83.y = _3314;
    out.m_83.z = _3286;
    int _3334 = ~_3284;
    int _3336 = _3334 + _3324;
    int _3338 = _3336 + 1;
    float _3340 = _3328 * _3326;
    float _3342 = _1530 * _1574;
    uint _3344 = uint(int(uint(_3332) >> uint(2)));
    uint _3346 = uint(int(uint(int(_3344)) >> uint(2)));
    int _3348 = int(_3344) & 3;
    float _3350 = (*spvDescriptorSet0.vp_c9)._m0[int(_3346)][_3348];
    int _3352 = int(_3344) + 1;
    uint _3354 = uint(int(uint(_3352) >> uint(2)));
    int _3356 = _3352 & 3;
    float _3358 = (*spvDescriptorSet0.vp_c9)._m0[int(_3354)][_3356];
    float _3360 = _1538 * _1574;
    int _3362 = _1286 * _3338;
    int _3364 = _3362 + _2820;
    int _3366 = _3274 & 3;
    bool _3368 = _3366 != 0;
    float _3370 = _1520 * _1570;
    float _3372 = fma(_1524, _1552, _3342);
    float _3374 = fma(_1524, _1554, _3292);
    bool _3376 = uint(_3366) > 1u;
    int _3378 = _3332 + 8;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    uint _3382 = uint(int(uint(int(_3380)) >> uint(2)));
    int _3384 = int(_3380) & 3;
    float _3386 = (*spvDescriptorSet0.vp_c9)._m0[int(_3382)][_3384];
    int _3388 = int(_3380) + 1;
    uint _3390 = uint(int(uint(_3388) >> uint(2)));
    int _3392 = _3388 & 3;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[int(_3390)][_3392];
    int _3396 = _3304 ? 0 : 1;
    float _3398 = -_3340;
    float _3400 = _3398 + 1.0;
    float _3402 = -_1510;
    float _3404 = fma(_3402, _1554, _3226);
    float _3406 = -_1510;
    float _3408 = fma(_3406, _1556, _3370);
    int _3410 = ~_3396;
    int _3412 = _3410 + 1;
    int _3414 = _3412 + 1;
    float _3416 = fma(_3400, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3340);
    float _3418 = fma(_1522, _1438, _3404);
    float _3420 = fma(_1522, _1432, _3320);
    float _3422 = fma(_1522, _1448, _3408);
    float _3424 = fma(_1526, _1554, _3300);
    float _3426 = fma(_1526, _1556, _3234);
    int _3428 = _3414;
    if (!_3376)
    {
        int _3430 = ~_3396;
        int _3432 = _3430 + 1;
        _3428 = _3432;
    }
    int _3434 = _3428;
    float _3436 = fma(_1526, _1552, _3360);
    bool _3438 = _3366 != 3;
    float _3440 = fma(_1548, _1438, _3424);
    bool _3442 = !_3368;
    int _3444 = _3442 ? 0 : 1;
    float _3446 = fma(_1548, _1448, _3426);
    int _3448 = abs(_3434);
    float _3450 = fma(_1548, _1432, _3436);
    bool _3452 = uint(_3366) >= 2u;
    float _3454 = _2794 * _2282;
    int _3456 = abs(_3444);
    float _3458 = -_2794;
    float _3460 = _3458 + 1.0;
    float _3462 = -_2280;
    float _3464 = _3462 + 1.0;
    int _3466 = _3452 ? 0 : 1;
    int _3468 = ~_3448;
    int _3470 = _3468 + 1;
    int _3472 = _3470 + 1;
    int _3474 = ~_3466;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    int _3480 = _3478;
    if (_3438)
    {
        int _3482 = ~_3466;
        int _3484 = _3482 + 1;
        _3480 = _3484;
    }
    int _3486 = _3480;
    float _3488 = fma(_1534, _1448, _3276);
    int _3490 = ~_3456;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    float _3496 = _3420 * _3152;
    bool _3498 = _3366 != 3;
    int _3500 = abs(_3486);
    int _3502 = _3472 * as_type<int>(_3358);
    bool _3504 = !_2546;
    int _3506 = _3504 ? 0 : 1;
    bool _3508 = _1836 <= 8000.0;
    bool _3510 = isnan(_1836);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan(8000.0);
    bool _3516 = _3512 || _3514;
    float _3518 = float(_3516);
    int _3520 = _3494 * as_type<int>(_3350);
    int _3522 = _3520 + _3502;
    float _3524 = fma(_1534, _1432, _3372);
    float _3526 = fma(_1534, _1438, _3374);
    bool _3528 = !_3498;
    int _3530 = _3528 ? 0 : (-1);
    float _3532 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3534 = _3418 * _3152;
    int _3536 = abs(_3506);
    out.m_85.x = _3524;
    out.m_85.y = _3526;
    out.m_85.z = _3488;
    int _3538 = abs(_3530);
    float _3540 = fma(_3524, _3104, _3496);
    int _3542 = ~_3500;
    int _3544 = _3542 + 1;
    int _3546 = _3544 + 1;
    float _3548 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3532);
    int _3550 = ~_3538;
    int _3552 = _3550 + 1;
    int _3554 = _3552 + 1;
    float _3556 = fma(_3526, _3104, _3534);
    float _3558 = _3422 * _3152;
    int _3560 = _3546 * as_type<int>(_3386);
    int _3562 = _3560 + _3522;
    int _3564 = ~_3536;
    int _3566 = _3564 + 1;
    int _3568 = _3566 + 1;
    float _3570 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3548);
    float _3572 = fma(_3488, _3104, _3558);
    int _3574 = _3554 * as_type<int>(_3394);
    int _3576 = _3574 + _3562;
    float _3578 = -_3450;
    float _3580 = _3290 * _3578;
    float _3582 = -_3440;
    float _3584 = _3290 * _3582;
    float _3586 = -_3446;
    float _3588 = _3290 * _3586;
    bool _3590 = !_2760;
    int _3592 = _3590 ? _3364 : (-1);
    int _3594 = _3576 * _3568;
    float _3596 = fma(_3248, _3420, _3580);
    float _3598 = fma(_3248, _3418, _3584);
    float _3600 = fma(_3248, _3422, _3588);
    int _3602 = _3592 * _3536;
    int _3604 = _3602 + _3594;
    float _3606 = in.m_87.x;
    float _3608 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3570);
    float _3610 = _2212 * 0.5;
    float _3612 = _2254 + _2212;
    out.m_89.x = _3596;
    out.m_89.y = _3598;
    out.m_89.z = _3600;
    float _3614 = _3608 + _2212;
    float _3616 = _2303 * _3454;
    float _3618 = _3518 * _3416;
    float _3620 = fma(_2256, -0.5, _3610);
    float _3622 = _3614 * 0.5;
    float _3624 = _3612 * 0.5;
    float _3626 = fma(_3450, _3268, _3540);
    float _3628 = fma(_3440, _3268, _3556);
    float _3630 = fma(_3446, _3268, _3572);
    float _3632 = _2293 * _3460;
    float _3634 = _2293 * _3454;
    float _3636 = fma(_2293, _3616, _2291);
    float _3638 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _3624;
    out.m_91.y = _3620;
    out.m_91.z = _3622;
    out.m_91.w = _2212;
    float _3640 = fma(_2299, _3634, _2287);
    float _3642 = fma(_2301, _3634, _2289);
    out.m_93.x = _3626;
    out.m_93.y = _3628;
    out.m_93.z = _3630;
    float _3644 = _3464 * _3638;
    float _3646 = precise::clamp(_3644, 0.0, 1.0);
    bool _3648 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3650 = isnan(_1968);
    bool _3652 = _3648 || _3650;
    bool _3654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3656 = _3652 || _3654;
    float _3658 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _3640;
    out.m_95.y = _3642;
    out.m_95.z = _3636;
    out.m_95.w = _3632;
    float _3660 = -_3646;
    float _3662 = fma(_3660, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3664 = float(_3604);
    out.gl_Position.x = _2254;
    out.gl_Position.y = _2256;
    out.gl_Position.z = _3608;
    out.gl_Position.w = _2212;
    float _3666 = _3662 * _3606;
    out.m_97.x = _3664;
    float _3668 = _3666 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3670 = _3666;
    float _3672 = _3608;
    float _3674 = _3668;
    if (!_3656)
    {
        _3670 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3676 = _3670;
    float _3678 = _3676;
    float _3680 = _3676;
    if (!_3656)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3682 = _2410;
    out.m_99.x = _3668;
    float _3684 = _3682;
    float _3686 = _3682;
    if (!_3656)
    {
        _3672 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3688 = _3672;
    float _3690 = _3688;
    float _3692 = _3688;
    if (!_3656)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3694 = _2412;
    float _3696 = _3694;
    float _3698 = _3694;
    if (!_3656)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3700 = _2414;
    float _3702 = _3700;
    float _3704 = _3700;
    if (!_3656)
    {
        _3674 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3706 = _3674;
    bool _3708 = !_3656;
    float _3710 = _3706;
    float _3712 = _3706;
    if (!_3708)
    {
        bool _3714 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3716 = isnan(_1968);
        bool _3718 = _3714 || _3716;
        bool _3720 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3722 = _3718 || _3720;
        if (!_3722)
        {
            float _3724 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3726 = _1968 + _3724;
            float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3730 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3728;
            float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3734 = _3732 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3736 = 1.0 / _3730;
            float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3740 = _3738 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3754 = _3726 * _3736;
            float _3756 = precise::clamp(_3754, 0.0, 1.0);
            float _3758 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3760 = _3758 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3762 = fma(_3756, _3734, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3764 = fma(_3756, _3760, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3766 = fma(_3756, _3740, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3768 = fma(_3756, _3744, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3770 = fma(_3756, _3748, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3772 = fma(_3756, _3752, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3686 = _3766;
            _3704 = _3770;
            _3680 = _3762;
            _3698 = _3768;
            _3692 = _3764;
            _3712 = _3772;
            _3774 = true;
        }
        else
        {
            bool _3776 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3778 = isnan(_1968);
            bool _3780 = _3776 || _3778;
            bool _3782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3784 = _3780 || _3782;
            if (!_3784)
            {
                _3678 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3786 = _3678;
            _3680 = _3786;
            if (!_3784)
            {
                _3684 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3788 = _3684;
            _3686 = _3788;
            if (!_3784)
            {
                _3690 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3790 = _3690;
            _3692 = _3790;
            if (!_3784)
            {
                _3696 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3792 = _3696;
            _3698 = _3792;
            if (!_3784)
            {
                _3702 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3794 = _3702;
            _3704 = _3794;
            if (!_3784)
            {
                _3710 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3796 = _3710;
            bool _3798 = !_3784;
            _3712 = _3796;
            if (!_3798)
            {
                bool _3800 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3802 = isnan(_1968);
                bool _3804 = _3800 || _3802;
                bool _3806 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3808 = _3804 || _3806;
                if (!_3808)
                {
                    float _3810 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3812 = _1968 + _3810;
                    float _3814 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3816 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3814;
                    float _3818 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3820 = _3818 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3822 = 1.0 / _3816;
                    float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3826 = _3824 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3830 = _3828 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3834 = _3832 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3840 = _3812 * _3822;
                    float _3842 = precise::clamp(_3840, 0.0, 1.0);
                    float _3844 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3846 = _3844 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3848 = fma(_3842, _3820, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3850 = fma(_3842, _3846, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3852 = fma(_3842, _3826, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3854 = fma(_3842, _3830, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3856 = fma(_3842, _3834, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3858 = fma(_3842, _3838, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3686 = _3852;
                    _3704 = _3856;
                    _3680 = _3848;
                    _3698 = _3854;
                    _3692 = _3850;
                    _3712 = _3858;
                    _3774 = true;
                }
                else
                {
                    _3686 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3704 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3680 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3698 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3692 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3712 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3774 = false;
    float _3860 = _3686;
    float _3862 = _3704;
    float _3864 = _3680;
    float _3866 = _3698;
    float _3868 = _3692;
    float _3870 = _3712;
    float _3872 = _3658 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3874 = fma(_3628, -0.5, 0.5);
    float _3876 = precise::clamp(_3874, 0.0, 1.0);
    float _3878 = -_3860;
    float _3880 = _3878 + _3862;
    float _3882 = -_3864;
    float _3884 = _3882 + _3866;
    out.m_53.x = _3872;
    float _3886 = fma(_3876, _3880, _3860);
    float _3888 = -_3868;
    float _3890 = _3888 + _3870;
    float _3892 = fma(_3876, _3884, _3864);
    float _3894 = _3886 * 0.586610972881317138671875;
    bool _3896 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3898 = fma(_3876, _3890, _3868);
    out.m_101.x = 0.0;
    float _3900 = fma(_3892, 0.298911988735198974609375, _3894);
    bool _3902 = _1946 > 0.0;
    bool _3904 = isnan(_1946);
    bool _3906 = _3902 || _3904;
    bool _3908 = isnan(0.0);
    bool _3910 = _3906 || _3908;
    float _3912 = fma(_3898, 0.114477999508380889892578125, _3900);
    float _3914 = -_3912;
    float _3916 = _3892 + _3914;
    float _3918 = -_3912;
    float _3920 = _3886 + _3918;
    float _3922 = -_3912;
    float _3924 = _3898 + _3922;
    float _3926 = fma(_3916, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3912);
    float _3928 = fma(_3920, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3912);
    float _3930 = fma(_3924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3912);
    bool _3932 = !_3896;
    if (!_3932)
    {
        float _3934 = -_1890;
        float _3936 = _3934 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3938 = -_1892;
        float _3940 = _3938 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3942 = -_1894;
        float _3944 = _3942 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3946 = _3936 * _3936;
        float _3948 = fma(_3940, _3940, _3946);
        float _3950 = fma(_3944, _3944, _3948);
        float _3952 = sqrt(_3950);
        float _3954 = rsqrt(_3950);
        float _3956 = -_3952;
        float _3958 = _3956 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3960 = _3958 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3962 = precise::clamp(_3960, 0.0, 1.0);
        float _3964 = _3940 * _3954;
        float _3966 = _3936 * _3954;
        float _3968 = abs(_3962);
        float _3970 = log2(_3968);
        float _3972 = _3944 * _3954;
        float _3974 = _3964 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3976 = _3628 * _3966;
        float _3978 = -_3966;
        float _3980 = -_3974;
        float _3982 = fma(_3978, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3980);
        float _3984 = fma(_3626, _3964, _3976);
        float _3986 = -_3972;
        float _3988 = fma(_3986, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3982);
        float _3990 = fma(_3630, _3972, _3984);
        float _3992 = precise::clamp(_3990, 0.0, 1.0);
        float _3994 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3996 = _3988 + _3994;
        float _3998 = _3970 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4000 = _3996 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4002 = precise::clamp(_4000, 0.0, 1.0);
        float _4004 = exp2(_3998);
        float _4006 = _4004 * _4002;
        float _4008 = _3992 * _4006;
        float _4010 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4012 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4014 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _4010;
        out.m_101.y = _4012;
        out.m_101.z = _4014;
    }
    out.m_103.x = _3926;
    out.m_103.y = _3928;
    out.m_103.z = _3930;
    if (_3910)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _4016 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4016;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3774 = false;
    bool _790 = false;
    bool _604 = false;
    bool _226 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = in.m_48.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    float _138 = _128;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _134;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _142 = 0;
    if (!_132)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4084 = as_type<float>(_146);
        out.gl_Position.z = _4084;
    }
    if (!_132)
    {
        return out;
    }
    bool _148 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_119);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = float(_124);
    bool _160 = _128 >= _158;
    bool _162 = !_156;
    bool _164 = _160 || _162;
    float _166 = 1.0 / _158;
    if (_164)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _136;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    float _170 = _128 * _166;
    int _172 = 0;
    float _174 = _170;
    if (_164)
    {
        float _176 = _168 * 5.0;
        _172 = as_type<int>(_176);
    }
    int _178 = _172;
    out.m_51.x = _170;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4147 = as_type<float>(_178);
        out.gl_Position.z = _4147;
    }
    if (_164)
    {
        return out;
    }
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _192 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _194 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _196);
    float _204 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _198);
    bool _206 = !_186;
    float _224;
    if (!_206)
    {
        float _208 = in.m_57.x;
        float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _216 = _214 * _210;
        float _218 = floor(_216);
        float _220 = -_218;
        float _222 = _216 + _220;
        _224 = _222;
        _226 = true;
    }
    else
    {
        _224 = _170;
    }
    _226 = false;
    float _228 = _224;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _246;
    float _250 = 1.0 / _236;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _256 = 1.0 / _244;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _228 + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = 1.0 / _248;
    float _266 = _260 * _250;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _270 = _228 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _274 = _228 + _272;
    bool _276 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_228);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = 1.0 / _232;
    float _290 = _270 * _256;
    bool _292 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _294 = isnan(_228);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _304;
    float _308 = 1.0 / _254;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _228 + _310;
    float _314 = 1.0 / _240;
    float _316 = _312 * _288;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = _228 + _318;
    float _322 = -_302;
    float _324 = _322 + 1.0;
    float _326 = fma(_306, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _328 = _274 * _308;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _332 = _228 + _330;
    bool _334 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_228);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = _332 * _264;
    bool _348 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _350 = isnan(_228);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = _320 * _314;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = -_344;
    float _372 = _370 + 1.0;
    float _374 = _358 * _324;
    float _376 = -_358;
    float _378 = _376 + 1.0;
    float _380 = fma(_368, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_362, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _384 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_228);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _344 * _378;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _286 * _372;
    float _412 = -_286;
    float _414 = _412 + 1.0;
    bool _416 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_228);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = fma(_400, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _430 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _432 = isnan(_228);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_404, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _444 = fma(_408, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _446 = _394 * _414;
    float _448 = -_394;
    float _450 = _448 + 1.0;
    float _452 = -_440;
    float _454 = _452 + 1.0;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = _440 * _450;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = _426 * _454;
    float _472 = fma(_458, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _474 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _476 = fma(_468, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = _380 * _470;
    float _480 = _326 * _470;
    float _482 = -_426;
    float _484 = _482 + 1.0;
    float _486 = _382 * _470;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _496 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].y, _480);
    float _500 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].z, _486);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _506 = fma(_428, _460, _496);
    float _508 = fma(_442, _460, _498);
    float _510 = fma(_444, _460, _500);
    float _512 = fma(_490, _290, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _514 = fma(_494, _290, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _516 = fma(_504, _290, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _518 = fma(_474, _446, _506);
    float _520 = fma(_472, _446, _508);
    float _522 = fma(_476, _446, _510);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _532;
    float _536 = fma(_512, _410, _518);
    float _538 = fma(_514, _410, _520);
    float _540 = fma(_516, _410, _522);
    float _542 = fma(_526, _346, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _544 = fma(_530, _346, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _546 = fma(_534, _346, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _560 = fma(_542, _396, _536);
    float _562 = fma(_550, _328, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _564 = fma(_554, _328, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _566 = fma(_558, _328, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _568 = fma(_544, _396, _538);
    float _570 = fma(_546, _396, _540);
    float _572 = fma(_562, _374, _560);
    float _574 = fma(_564, _374, _568);
    float _576 = fma(_566, _374, _570);
    float _578 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[149].x, _572);
    float _580 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[149].y, _574);
    float _582 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[149].z, _576);
    bool _584 = !_262;
    float _602;
    if (!_584)
    {
        float _586 = in.m_57.x;
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _590 = _586 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _594 = _592 * _588;
        float _596 = floor(_594);
        float _598 = -_596;
        float _600 = _594 + _598;
        _602 = _600;
        _604 = true;
    }
    else
    {
        _602 = _170;
    }
    _604 = false;
    float _606 = _602;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _606 + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _616 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _618 = isnan(_606);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _636 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _638 = isnan(_606);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / _614;
    float _650 = -_626;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _654;
    bool _658 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _660 = isnan(_606);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _646 * _652;
    float _672 = -_646;
    float _674 = _672 + 1.0;
    bool _676 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _678 = 1.0 / _630;
    float _680 = _668 * _674;
    float _682 = -_668;
    float _684 = _682 + 1.0;
    float _686 = 1.0 / _634;
    float _688 = _656 * _648;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _694 = fma(_688, _610, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _696 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _698 = isnan(_606);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _692 * _678;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _716 = _606 + _714;
    float _718 = _694 * _680;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _722 = _606 + _720;
    float _724 = fma(_708, _716, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _726 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _728 = _712 * _686;
    float _730 = -_706;
    float _732 = _730 + 1.0;
    float _734 = fma(_724, _670, _726);
    float _736 = fma(_728, _722, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _738 = _626 * _732;
    float _740 = fma(_736, _738, _734);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _748 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[118].x, _740);
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _758 = in.m_59.x;
    float _760 = in.m_59.y;
    float _762 = in.m_59.z;
    out.m_61.x = _750;
    out.m_61.y = _752;
    out.m_61.z = _754;
    out.m_61.w = _756;
    float _764 = _582 * _762;
    float _766 = _580 * _760;
    float _768 = _578 * _758;
    bool _770 = !_676;
    float _788;
    if (!_770)
    {
        float _772 = in.m_57.x;
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _776 = _772 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _780 = _778 * _774;
        float _782 = floor(_780);
        float _784 = -_782;
        float _786 = _780 + _784;
        _788 = _786;
        _790 = true;
    }
    else
    {
        _788 = _170;
    }
    _790 = false;
    float _792 = _788;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _796 = _792 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _802 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _804 = isnan(_792);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _818 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _820 = isnan(_792);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _830;
    bool _834 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _836 = isnan(_792);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / _800;
    float _848 = -_812;
    float _850 = _848 + 1.0;
    bool _852 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _854 = _828 * _850;
    float _856 = -_828;
    float _858 = _856 + 1.0;
    float _860 = 1.0 / _816;
    float _862 = _832 * _846;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _868 = fma(_862, _796, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _870 = _866 * _860;
    float _872 = _868 * _854;
    float _874 = -_844;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _880 = _792 + _878;
    float _882 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[131].x, _872);
    float _884 = _812 * _876;
    float _886 = fma(_870, _880, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _890 = fma(_886, _884, _882);
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _894 = _888 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _898 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _890);
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = _896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _898 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _894;
    out.m_63.y = _900;
    out.m_63.z = _902;
    out.m_63.w = _904;
    bool _906 = !_852;
    if (!_906)
    {
        float _908 = in.m_57.x;
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _912 = _908 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _916 = _914 * _910;
        float _918 = floor(_916);
        float _920 = -_918;
        float _922 = _916 + _920;
        _174 = _922;
    }
    float _924 = _174;
    float _926 = in.m_57.x;
    float _928 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _930 = in.m_57.y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = in.m_57.z;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _938 = _936 != 0;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _942 = in.m_46.x;
    float _944 = in.m_46.y;
    float _946 = in.m_46.z;
    float _948 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _950 = _926 * 2.0;
    float _952 = _926 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _954 = _930 * 2.0;
    float _956 = _930 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _958 = floor(_950);
    float _960 = -_932;
    float _962 = fma(_952, 2.0, _960);
    float _964 = _934 * 2.0;
    float _966 = fma(_956, -2.0, _940);
    float _968 = _926 + _930;
    float _970 = _930 + _934;
    float _972 = _944 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _974 = _944 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _976 = floor(_954);
    float _978 = _944 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _980 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[4].x, _972);
    float _982 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[5].x, _974);
    float _984 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[6].x, _978);
    float _986 = _968 + (-1.0);
    float _988 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[4].z, _980);
    float _990 = floor(_964);
    float _992 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[5].z, _982);
    float _994 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[6].z, _984);
    float _996 = _942;
    float _998 = _946;
    float _1000 = _984;
    if (_938)
    {
        _996 = _926;
    }
    float _1002 = _996;
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1006 = _1002;
    if (!_938)
    {
        _998 = _930;
    }
    float _1008 = _998;
    float _1010 = _970 + (-1.0);
    float _1012 = _1008;
    if (!_938)
    {
        _1006 = _934;
    }
    float _1014 = _1006;
    float _1016 = -_128;
    float _1018 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[76].x, _962);
    float _1020 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1022 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1024 = log2(_1022);
    if (_938)
    {
        _1012 = _926;
    }
    float _1026 = _1012;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1030 = _958 > 0.0;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1034 = _958 >= 0.0;
    bool _1036 = isnan(_958);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    float _1044 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_938)
    {
        _1000 = _934;
    }
    float _1046 = _1000;
    float _1048 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1050 = _1046;
    if (_938)
    {
        _1050 = _930;
    }
    float _1052 = _1050;
    float _1054 = _988 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1056 = _976 >= 0.0;
    bool _1058 = isnan(_976);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    float _1066 = -_1028;
    float _1068 = fma(_1048, 2.0, _1066);
    bool _1070 = _990 >= 0.0;
    bool _1072 = isnan(_990);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan(0.0);
    bool _1078 = _1074 || _1076;
    float _1080 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1032);
    float _1082 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _966);
    bool _1084 = _976 > 0.0;
    float _1086 = -_128;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1068);
    bool _1090 = _990 > 0.0;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1094 = _1042 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1096 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1080);
    int _1098 = _1064 ? 0 : 1;
    float _1100 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1092);
    float _1102 = _1078 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1104 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1106 = int(_1104);
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1110 = _1108 != 0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1100);
    int _1122 = ~as_type<int>(_1094);
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    bool _1128 = !_1114;
    int _1130 = _1128 ? 0 : 1;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1134 = !_1110;
    int _1136 = _1134 ? 0 : 1;
    bool _1138 = !_1118;
    int _1140 = _1138 ? 0 : 1;
    float _1142 = -_1132;
    float _1144 = fma(_1044, 2.0, _1142);
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1156 = _1154 != 0;
    int _1158 = ~as_type<int>(_1102);
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    float _1164 = -_128;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1144);
    int _1168 = _1126;
    int _1170 = _1162;
    float _1172 = _1094;
    float _1174 = _1102;
    if (!_1030)
    {
        int _1176 = ~as_type<int>(_1094);
        int _1178 = _1176 + 1;
        _1168 = _1178;
    }
    int _1180 = _1168;
    float _1182 = -_1054;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1186 = !_1152;
    int _1188 = _1186 ? 0 : 1;
    bool _1190 = !_1148;
    int _1192 = _1190 ? 0 : 1;
    int _1194 = abs(_1188);
    int _1196 = abs(_1192);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (!_1090)
    {
        int _1200 = ~as_type<int>(_1102);
        int _1202 = _1200 + 1;
        _1170 = _1202;
    }
    int _1204 = _1170;
    if (!_938)
    {
        _1172 = _934;
    }
    float _1206 = _1172;
    float _1208 = _1206;
    if (_938)
    {
        _1174 = _930;
    }
    float _1210 = _1174;
    float _1212 = _1210;
    if (_938)
    {
        _1208 = _930;
    }
    float _1214 = _1208;
    if (!_938)
    {
        _1212 = _926;
    }
    float _1216 = _1212;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1220 = float(_1180);
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1224 = float(_1194);
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1228 = float(_1204);
    float _1230 = fma(_1222, -2.0, _1218);
    float _1232 = float(_1106);
    float _1234 = _1224 * _1220;
    float _1236 = _1024 * _128;
    float _1238 = fma(_1226, -2.0, _1198);
    float _1240 = in.m_65.x;
    float _1242 = in.m_65.y;
    float _1244 = in.m_65.z;
    float _1246 = 1.0 / _1232;
    int _1248 = ~_1098;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1230);
    int _1256 = _1252;
    if (!_1084)
    {
        int _1258 = ~_1098;
        int _1260 = _1258 + 1;
        _1256 = _1260;
    }
    int _1262 = _1256;
    float _1264 = _1234 * (-2.0);
    float _1266 = float(_1196);
    float _1268 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1238);
    float _1270 = exp2(_1236);
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1276 = 1.0 + _1274;
    float _1278 = _1266 * _1228;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1282 = _1278 * (-2.0);
    float _1284 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1286 = int(_1284);
    bool _1288 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1290 = isnan(1.0);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1296 = _1292 || _1294;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1310 = _1306 || _1308;
    float _1312 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1280);
    float _1314 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1298);
    float _1316 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1300);
    float _1318 = 1.0 / _1276;
    float _1320 = -_1270;
    float _1322 = _1320 + 1.0;
    float _1324 = _992 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1326 = fma(_1282, _1240, _1240);
    float _1328 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1272);
    bool _1330 = !_1156;
    int _1332 = _1330 ? 0 : 1;
    float _1334 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1316);
    float _1336 = _1310 ? _1322 : 0.0;
    float _1338 = _926 + (-0.5);
    float _1340 = float(_1286);
    float _1342 = -_1324;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1246 * _128;
    float _1348 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1312);
    float _1350 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1314);
    float _1352 = _1340 * _128;
    float _1354 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1328);
    int _1356 = abs(_1332);
    float _1358 = _1324;
    if (_1296)
    {
        float _1360 = _1336 * _1318;
        _138 = _1360;
    }
    float _1362 = _138;
    float _1364 = _994 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1366 = fma(_1004, _1282, _1004);
    float _1368 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1326);
    float _1370 = _1344 * _1344;
    float _1372 = fma(_1264, _1242, _1242);
    float _1374 = fma(_1366, _1362, _1368);
    float _1376 = -_1364;
    float _1378 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1380 = fma(_1184, _1184, _1370);
    float _1382 = _930 + (-0.5);
    float _1384 = fma(_1020, _1264, _1020);
    float _1386 = float(_1262);
    float _1388 = _1374 * 0.15915493667125701904296875;
    float _1390 = float(_1356);
    float _1392 = fma(_1378, _1378, _1380);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1372);
    float _1396 = _926 + _934;
    float _1398 = _1390 * _1386;
    float _1400 = rsqrt(_1392);
    float _1402 = _1396 + (-1.0);
    float _1404 = fma(_1384, _1362, _1394);
    float _1406 = _1398 * (-2.0);
    float _1408 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1410 = _934 + (-0.5);
    float _1412 = fma(_1406, _1244, _1244);
    float _1414 = _1388 * 6.283185482025146484375;
    float _1416 = sin(_1414);
    float _1418 = _1404 * 0.15915493667125701904296875;
    float _1420 = fma(_1408, _1406, _1408);
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1412);
    float _1424 = in.m_67.x;
    float _1426 = in.m_67.y;
    float _1428 = in.m_67.z;
    float _1430 = fma(_1420, _1362, _1422);
    float _1432 = _1184 * _1400;
    float _1434 = _1388 * 6.283185482025146484375;
    float _1436 = cos(_1434);
    float _1438 = _1344 * _1400;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1442 = _1438 * _1440;
    float _1444 = _1418 * 6.283185482025146484375;
    float _1446 = sin(_1444);
    float _1448 = _1378 * _1400;
    float _1450 = _1430 * 0.15915493667125701904296875;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1454 = _1432 * _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1458 = -_1442;
    float _1460 = fma(_1432, _1456, _1458);
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1464 = _1448 * _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1468 = -_1454;
    float _1470 = fma(_1448, _1466, _1468);
    float _1472 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1476 = -_1464;
    float _1478 = fma(_1438, _1474, _1476);
    float _1480 = _1470 * _1470;
    float _1482 = _1418 * 6.283185482025146484375;
    float _1484 = cos(_1482);
    float _1486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1424);
    float _1488 = _1436 * _1446;
    float _1490 = _928 * _1486;
    float _1492 = _1450 * 6.283185482025146484375;
    float _1494 = cos(_1492);
    float _1496 = fma(_1478, _1478, _1480);
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1426);
    float _1500 = _1416 * _1446;
    float _1502 = fma(_1460, _1460, _1496);
    float _1504 = _1472 * _1498;
    float _1506 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1428);
    float _1508 = _1450 * 6.283185482025146484375;
    float _1510 = sin(_1508);
    float _1512 = _1436 * _1484;
    float _1514 = _1416 * _1484;
    float _1516 = _948 * _1506;
    float _1518 = rsqrt(_1502);
    float _1520 = _1436 * _1494;
    float _1522 = _1416 * _1494;
    float _1524 = _1484 * _1494;
    float _1526 = _1446 * _1494;
    float _1528 = _1520 * _1504;
    float _1530 = fma(_1510, _1512, _1500);
    float _1532 = -_1488;
    float _1534 = fma(_1510, _1514, _1532);
    float _1536 = -_1514;
    float _1538 = fma(_1510, _1488, _1536);
    float _1540 = -_1504;
    float _1542 = _1510 * _1540;
    float _1544 = fma(_1530, _1490, _1528);
    float _1546 = _1522 * _1504;
    float _1548 = fma(_1510, _1500, _1512);
    float _1550 = fma(_1524, _1490, _1542);
    float _1552 = _1478 * _1518;
    float _1554 = _1470 * _1518;
    float _1556 = _1460 * _1518;
    float _1558 = fma(_1538, _1516, _1544);
    float _1560 = _1438 * _1552;
    float _1562 = _1448 * _1554;
    float _1564 = fma(_1534, _1490, _1546);
    float _1566 = fma(_1526, _1516, _1550);
    float _1568 = -_1560;
    float _1570 = fma(_1432, _1554, _1568);
    float _1572 = -_1562;
    float _1574 = fma(_1438, _1556, _1572);
    float _1576 = fma(_1548, _1516, _1564);
    float _1578 = _1570 * _1558;
    float _1580 = _1574 * _1558;
    float _1582 = fma(_1556, _1566, _1578);
    float _1584 = fma(_1552, _1566, _1580);
    float _1586 = fma(_1448, _1576, _1582);
    float _1588 = fma(_1432, _1576, _1584);
    float _1590 = _1364 + _1586;
    float _1592 = _1054 + _1588;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1596 = _1590 + _1594;
    float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1600 = _1592 + _1598;
    float _1602 = _1596 * _1596;
    float _1604 = fma(_1600, _1600, _1602);
    float _1606 = _1432 * _1556;
    float _1608 = sqrt(_1604);
    float _1610 = -_1606;
    float _1612 = fma(_1448, _1552, _1610);
    float _1614 = _1612 * _1558;
    float _1616 = fma(_1554, _1566, _1614);
    float _1618 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1620 = fma(_1438, _1576, _1616);
    float _1622 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1618);
    bool _1624 = _1608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1626 = _1324 + _1620;
    float _1628 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1622);
    float _1630 = _1622;
    float _1632 = _1576;
    float _1634 = _1620;
    float _1636 = _1596;
    if (!_1624)
    {
        _1630 = _1592;
    }
    float _1638 = _1630;
    float _1640 = _1638;
    if (!_1624)
    {
        _1632 = _1590;
    }
    float _1642 = _1632;
    float _1644 = _1642;
    if (!_1624)
    {
        _1634 = _1626;
    }
    float _1646 = _1634;
    bool _1648 = !_1624;
    float _1650 = _1646;
    if (!_1648)
    {
        float _1652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1656 = _1608 + _1654;
        float _1658 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1660 = rsqrt(_1604);
        float _1662 = _1656 * _1652;
        float _1664 = _1662 * 0.15915493667125701904296875;
        float _1666 = _1664 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        float _1670 = _1664 * 6.283185482025146484375;
        float _1672 = sin(_1670);
        float _1674 = _1668 + (-1.0);
        float _1676 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1678 = fma(_1672, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1680 = fma(_1626, _1668, _1676);
        float _1682 = _1660 * _1678;
        float _1684 = fma(_1600, _1682, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1686 = fma(_1596, _1682, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1650 = _1680;
        _1640 = _1684;
        _1644 = _1686;
    }
    float _1688 = _1650;
    float _1690 = _1640;
    float _1692 = _1644;
    float _1694 = -_1324;
    float _1696 = _1694 + _1688;
    float _1698 = -_1054;
    float _1700 = _1698 + _1690;
    float _1702 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1704 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1706 = _1696 * _1696;
    float _1708 = -_1364;
    float _1710 = _1708 + _1692;
    float _1712 = 1.0 / _1702;
    float _1714 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1704);
    float _1716 = fma(_1700, _1700, _1706);
    float _1718 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1714);
    float _1720 = fma(_1710, _1710, _1716);
    bool _1722 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1724 = isnan(0.5);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1730 = _1726 || _1728;
    float _1732 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1734 = sqrt(_1720);
    bool _1736 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1738 = isnan(0.5);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1744 = _1740 || _1742;
    float _1746 = _1732 + _1702;
    float _1748 = _1746 * _1712;
    float _1750 = _1748 * 0.5;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1754 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1752);
    float _1756 = 1.0 / _1754;
    bool _1758 = _1734 > 0.0;
    bool _1760 = !_1758;
    float _1762 = _1688;
    float _1764 = _1692;
    float _1766 = _1690;
    float _1768 = _1754;
    if (!_1760)
    {
        float _1770 = _202 * _202;
        float _1772 = fma(_200, _200, _1770);
        float _1774 = fma(_204, _204, _1772);
        float _1776 = rsqrt(_1720);
        float _1778 = sqrt(_1774);
        float _1780 = _1700 * _1776;
        float _1782 = _1696 * _1776;
        float _1784 = _1710 * _1776;
        bool _1786 = _1778 > 0.0;
        bool _1788 = !_1786;
        if (!_1788)
        {
            float _1790 = rsqrt(_1774);
            float _1792 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1794 = _202 * _1790;
            float _1796 = _200 * _1790;
            float _1798 = _204 * _1790;
            float _1800 = _1782 * _1794;
            float _1802 = fma(_1780, _1796, _1800);
            float _1804 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1806 = fma(_1784, _1798, _1802);
            float _1808 = _1806 * _1804;
            float _1810 = fma(_200, _1808, _1690);
            float _1812 = fma(_202, _1808, _1688);
            float _1814 = fma(_204, _1808, _1692);
            _1762 = _1812;
            _1764 = _1814;
            _1766 = _1810;
            _1768 = _1800;
        }
    }
    float _1816 = _1762;
    float _1818 = _1764;
    float _1820 = _1766;
    float _1822 = _1768;
    float _1824 = _1822;
    float _1826 = _1816;
    float _1828 = _1820;
    float _1830 = _1818;
    if (_1744)
    {
        _1824 = 1.0;
    }
    float _1832 = _1824;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1836 = _1756 * _1834;
    float _1838 = _1832;
    if (!_1730)
    {
        float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1842 = _1324 + _1840;
        float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1846 = _1054 + _1844;
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1850 = -_1324;
        float _1852 = _1850 + _1816;
        float _1854 = _1842 * _1842;
        float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1858 = _1364 + _1856;
        float _1860 = -_1364;
        float _1862 = _1860 + _1818;
        float _1864 = fma(_1846, _1846, _1854);
        float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1868 = fma(_1858, _1858, _1864);
        float _1870 = sqrt(_1868);
        float _1872 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1874 = precise::min(_1870, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1876 = _1874 * _1866;
        float _1878 = _1872 * _1876;
        float _1880 = -_1054;
        float _1882 = _1880 + _1820;
        float _1884 = fma(_1852, _1878, _1324);
        float _1886 = fma(_1882, _1878, _1054);
        float _1888 = fma(_1862, _1878, _1364);
        _1826 = _1884;
        _1828 = _1886;
        _1830 = _1888;
    }
    float _1890 = _1826;
    float _1892 = _1828;
    float _1894 = _1830;
    if (!_1744)
    {
        float _1896 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1898 = _1896 * 0.15915493667125701904296875;
        float _1900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1902 = _1898 * 6.283185482025146484375;
        float _1904 = cos(_1902);
        float _1906 = _1900 * 0.15915493667125701904296875;
        float _1908 = _1898 * 6.283185482025146484375;
        float _1910 = sin(_1908);
        float _1912 = 1.0 / _1904;
        float _1914 = _1906 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        float _1918 = _1910 * _1912;
        float _1920 = _1906 * 6.283185482025146484375;
        float _1922 = sin(_1920);
        float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1926 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1924;
        float _1928 = _1916 * _1918;
        float _1930 = 1.0 / _1926;
        float _1932 = 1.0 / _1928;
        float _1934 = _1922 * _1932;
        float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1938 = fma(_1836, _1934, _1936);
        float _1940 = _1938 * _1930;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        _1358 = _1918;
        _1838 = _1942;
    }
    float _1944 = _1358;
    float _1946 = _1838;
    float _1948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1950 = _1890 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1954 = _1892 + _1952;
    float _1956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1958 = _1894 + _1956;
    float _1960 = _1950 * _1950;
    float _1962 = fma(_1954, _1954, _1960);
    float _1964 = fma(_1958, _1958, _1962);
    float _1966 = rsqrt(_1964);
    float _1968 = sqrt(_1964);
    float _1970 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1972 = _1954 * _1970;
    float _1974 = _1958 * _1970;
    float _1976 = _1972 * _1972;
    float _1978 = _1974 * _1974;
    float _1980 = _1976 + _1978;
    float _1982 = sqrt(_1980);
    bool _1984 = _1982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1988 = _1982 + _1986;
    float _1990 = _1958;
    float _1992 = _1980;
    float _1994 = _1988;
    float _1996 = _1944;
    if (_1984)
    {
        float _1998 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1990 = _1998;
    }
    float _2000 = _1990;
    if (_1984)
    {
        float _2002 = rsqrt(_1980);
        _1992 = _2002;
    }
    float _2004 = _1992;
    float _2006 = _2004;
    if (_1984)
    {
        float _2008 = _1988 * _2000;
        _1994 = _2008;
    }
    float _2010 = _1994;
    if (_1984)
    {
        float _2012 = _2010 * 0.15915493667125701904296875;
        _1996 = _2012;
    }
    float _2014 = _1996;
    float _2016 = _2000;
    float _2018 = _2014;
    if (_1984)
    {
        float _2020 = _2014 * 6.283185482025146484375;
        float _2022 = sin(_2020);
        _2016 = _2022;
    }
    float _2024 = _2016;
    float _2026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2028 = precise::max(0.0, _2026);
    float _2030 = _1960;
    float _2032 = _2028;
    if (_1984)
    {
        float _2034 = _2014 * 6.283185482025146484375;
        float _2036 = cos(_2034);
        _2030 = _2036;
    }
    float _2038 = _2030;
    float _2040 = -_1970;
    float _2042 = -_2028;
    float _2044 = fma(_1950, _2040, _2042);
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1984)
    {
        float _2048 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2048;
    }
    float _2050 = _2032;
    float _2052 = fma(_1054, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2054 = _2050;
    if (!_1984)
    {
        _2046 = _2044;
    }
    float _2056 = _2046;
    float _2058 = _2024;
    float _2060 = _2056;
    if (_1984)
    {
        float _2062 = fma(_2024, _2050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = floor(_2052);
    float _2068 = _2064;
    float _2070 = _2038;
    if (_1984)
    {
        float _2072 = _2038 + (-1.0);
        _2054 = _2072;
    }
    float _2074 = _2054;
    float _2076 = _2074;
    if (_1984)
    {
        float _2078 = _2004 * _2064;
        _1636 = _2078;
    }
    float _2080 = _1636;
    if (!_1984)
    {
        _2068 = _1972;
    }
    float _2082 = _2068;
    float _2084 = _2082;
    if (_1984)
    {
        float _2086 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2018 = _2086;
    }
    float _2088 = _2018;
    if (_1984)
    {
        float _2090 = _1972 * _2080;
        _2084 = _2090;
    }
    float _2092 = _2084;
    if (!_1984)
    {
        _2076 = _1974;
    }
    float _2094 = _2076;
    float _2096 = _2094;
    if (_1984)
    {
        float _2098 = _1974 * _2080;
        _2096 = _2098;
    }
    float _2100 = _2096;
    if (!_1984)
    {
        _2006 = _1976;
    }
    float _2102 = _2006;
    float _2104 = _2102;
    if (_1984)
    {
        float _2106 = fma(_2044, _2038, _2088);
        _2060 = _2106;
    }
    float _2108 = _2060;
    if (_1984)
    {
        float _2110 = _2092 * _2092;
        _2104 = _2110;
    }
    float _2112 = _2104;
    float _2114 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1984)
    {
        _2070 = _1978;
    }
    float _2116 = _2070;
    float _2118 = _2116;
    if (_1984)
    {
        float _2120 = _2100 * _2100;
        _2118 = _2120;
    }
    float _2122 = _2118;
    float _2124 = fma(_2108, _2108, _2112);
    float _2126 = fma(_1364, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2128 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2130 = _2124 + _2122;
    float _2132 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2134 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2128);
    float _2136 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2114);
    float _2138 = rsqrt(_2130);
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2142 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2140);
    float _2144 = precise::clamp(_2142, 0.0, 1.0);
    float _2146 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2132);
    float _2148 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2134);
    float _2150 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2136);
    float _2152 = -_2144;
    float _2154 = _2152 + 1.0;
    float _2156 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2146);
    float _2158 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2160 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2164 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2166 = abs(_2154);
    float _2168 = log2(_2166);
    float _2170 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2172 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2174 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2164);
    float _2176 = _2138 * _2092;
    float _2178 = _2138 * _2108;
    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2182 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2184 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2186 = _2138 * _2100;
    float _2188 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2172);
    float _2190 = -_2182;
    float _2192 = fma(_2190, _2180, 1.0);
    float _2194 = -_2184;
    float _2196 = fma(_2178, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2194);
    float _2198 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2174);
    float _2200 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2202 = -_2066;
    float _2204 = _2052 + _2202;
    float _2206 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2208 = -_2186;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2196);
    float _2212 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2198);
    float _2214 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2216 = log2(_2192);
    float _2218 = fma(_2210, -0.5, 0.5);
    float _2220 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2222 = fma(_2210, 0.5, 0.5);
    float _2224 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2214);
    float _2226 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2220);
    float _2228 = _2178 + 1.0;
    float _2230 = exp2(_2206);
    float _2232 = fma(_2222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2224);
    float _2236 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2226);
    float _2238 = fma(_2222, _2232, -0.212114393711090087890625);
    float _2240 = sqrt(_2218);
    float _2242 = fma(_2222, _2238, 1.570728778839111328125);
    float _2244 = _2216 * 0.693147182464599609375;
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2248 = 1.0 / _2212;
    float _2250 = -_2178;
    float _2252 = fma(_2230, _2228, _2250);
    float _2254 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2234);
    float _2256 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2236);
    float _2258 = floor(_2126);
    float _2260 = _2240 * 0.636619746685028076171875;
    float _2262 = -_2242;
    float _2264 = fma(_2260, _2262, 1.0);
    float _2266 = fma(_2252, 0.5, 0.5);
    float _2268 = _2254 * _2248;
    float _2270 = _2256 * _2248;
    float _2272 = fma(_2268, 0.5, 0.5);
    float _2274 = fma(_2270, -0.5, 0.5);
    float _2276 = -_2258;
    float _2278 = _2126 + _2276;
    float2 _7537 = float2(_2204, _2278);
    float _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7537, float2(0.0), isnan(_7537)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7537, float2(0.0), isnan(_7537)), level(0.0)).x;
    float3 _7548 = float3(_2272, _2274, _2246);
    float _2282 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7548, float3(0.0), isnan(_7548)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7548, float3(0.0), isnan(_7548)), level(0.0)).x;
    float3 _7559 = float3(_2272, _2274, _2246);
    float4 _2285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7559, float3(0.0), isnan(_7559)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7559, float3(0.0), isnan(_7559)), level(0.0)).xyzw;
    float _2287 = _2285.x;
    float _2289 = _2285.y;
    float _2291 = _2285.z;
    float _2293 = _2285.w;
    float2 _7575 = float2(_2264, _2266);
    float3 _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7575, float2(0.0), isnan(_7575)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7575, float2(0.0), isnan(_7575)), level(0.0)).xyz;
    float _2299 = _2297.x;
    float _2301 = _2297.y;
    float _2303 = _2297.z;
    float _2305 = float(uint(_1286));
    float _2307 = trunc(_1346);
    int _2309 = int(_2307);
    float _2311 = in.m_69.y;
    float _2313 = _1352 * _166;
    bool _2315 = _930 > 0.5;
    float _2317 = in.m_69.x;
    int _2319 = ~_1286;
    int _2321 = _2319 + 1;
    float _2323 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2325 = 1.0 / _2305;
    int _2327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2329 = _2327 != 0;
    float _2331 = in.m_71.w;
    int _2333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2335 = _2333 != 0;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2339 = _2337 != 0;
    out.m_73.x = _1892;
    out.m_73.y = _1890;
    out.m_73.z = _1894;
    bool _2341 = _934 > 0.5;
    float _2343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2345 = float(uint(_2309));
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2349 = _2347 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2351 = as_type<int>(_2325) + (-2);
    float _2353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2355 = abs(_1130);
    float _2357 = as_type<float>(_2351) * _2345;
    int _2359 = abs(_1140);
    float _2361 = in.m_57.w;
    float _2363 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2365 = trunc(_2357);
    float _2367 = precise::max(_2365, 0.0);
    uint _2370 = uint(_2367);
    out.m_75.w = _2331;
    float _2372 = 1.0 / _2349;
    float _2374 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2374;
    int _2378 = _2321 * int(_2370);
    int _2380 = _2378 + _2309;
    float _2382 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2384 = _2382 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2388 = float(uint(_2380));
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _2390;
    bool _2394 = _2361 > 0.5;
    float _2396 = as_type<float>(_2351) * _2388;
    float _2398 = 1.0 / _2392;
    float _2400 = _2361;
    float _2402 = _2311;
    bool _2404 = _2329;
    int _2406 = as_type<int>(_2353);
    float _2408 = _2317;
    float _2410 = _2212;
    float _2412 = _2256;
    float _2414 = _2254;
    if (!_2335)
    {
        _2400 = _2317;
    }
    float _2416 = _2400;
    float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2420 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _2418;
    float _2422 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2424 = _2422 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2426 = trunc(_2396);
    float _2428 = precise::max(_2426, 0.0);
    uint _2430 = uint(_2428);
    int _2432 = ~_1286;
    int _2434 = _2432 + 1;
    bool _2436 = !_938;
    float _2438 = _2436 ? 7.345489978790283203125 : 1.0;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2442 = _2440 != 0;
    float _2444 = 1.0 / _2420;
    float _2446 = -_2311;
    float _2448 = _2446 + 1.0;
    int _2450 = _2315 ? as_type<int>(_2448) : as_type<int>(_2311);
    int _2452 = _2341 ? as_type<int>(_2448) : as_type<int>(_2311);
    float _2454 = 1.0 / _2424;
    float _2456 = _2339 ? as_type<float>(_2450) : _2311;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2460 = _2458 != 0;
    int _2462 = int(_2370) + int(_2430);
    float _2464 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2466 = _2460 ? as_type<float>(_2452) : _2311;
    float _2468 = exp2(_2323);
    int _2470 = as_type<int>(_2448);
    float _2472 = _2416;
    if (_2329)
    {
        float _2474 = _2394 ? _2448 : _2311;
        _2402 = _2474;
    }
    float _2476 = _2402;
    if (_2335)
    {
        float _2478 = -_2317;
        float _2480 = _2478 + 1.0;
        _2470 = as_type<int>(_2480);
    }
    int _2482 = _2470;
    int _2484 = _2434 * _2462;
    int _2486 = _2484 + _2309;
    if (_2335)
    {
        bool _2488 = _926 > 0.5;
        _2404 = _2488;
    }
    bool _2490 = _2404;
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2494 = _924 + _2492;
    int _2496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2498 = _2496 != 0;
    float _2500 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2502 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _2500;
    if (_2335)
    {
        float _2504 = _2490 ? as_type<float>(_2482) : _2317;
        _2472 = _2504;
    }
    float _2506 = _2472;
    float _2508 = _2494 * _2398;
    bool _2510 = uint(_2486) >= uint(_1286);
    float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2514 = _2512 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2516 = 1.0 / _2502;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2520 = _924 + _2518;
    bool _2522 = !_2510;
    int _2524 = _2522 ? 0 : (-1);
    float _2526 = _2438 * _926;
    int _2528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2530 = _2528 != 0;
    float _2532 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2534 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2532;
    float _2536 = _2520 * _2444;
    float _2538 = 1.0 / _2514;
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2542 = _924 + _2540;
    int _2544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2546 = _2544 != 0;
    float _2548 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2550 = _924 + _2548;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2554 = _2552 != 0;
    float _2556 = _2542 * _2372;
    float _2558 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2560 = _924 + _2558;
    float _2562 = 1.0 / _2534;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2566 = _924 + _2564;
    float _2568 = _2560 * _2516;
    float _2570 = _2550 * _2454;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _2572;
    float _2576 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2576;
    float _2580 = fma(_2376, _2508, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2582 = _2566 * _2538;
    float _2584 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _2584;
    float _2588 = fma(_2574, _2508, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2592 = _924 + _2590;
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2594;
    float _2598 = fma(_2578, _2536, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2600;
    float _2604 = fma(_2586, _2536, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _2606 = fma(_2596, _2508, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2608 = fma(_2602, _2536, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _2610 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2612 = _2610 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2620 = _2618 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2626 = _2592 * _2562;
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2632 = fma(_2612, _2556, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2634 = fma(_2384, _2556, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2636 = fma(_2616, _2556, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2642;
    float _2646 = floor(_2526);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _2648;
    float _2652 = fma(_2620, _2570, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2654 = fma(_2624, _2570, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2656 = fma(_2630, _2570, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _2658 = fma(_2640, _2568, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2660 = fma(_2644, _2568, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2664 = _2662 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2666 = fma(_2650, _2568, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2672 = float(_2309);
    float _2674 = fma(_2664, _2582, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _2678 = _2676 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2680 = fma(_2670, _2582, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2682 = _2672 >= _1340;
    bool _2684 = isnan(_2672);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(_1340);
    bool _2690 = _2686 || _2688;
    float _2692 = float(_2690);
    float _2694 = -_1082;
    float _2696 = fma(_1350, _2464, _2694);
    float _2698 = -_2646;
    float _2700 = _2526 + _2698;
    float _2702 = fma(_2678, _2582, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _2704 = fma(_2466, _2363, -0.5);
    float _2706 = trunc(_2692);
    int _2708 = int(_2706);
    float _2710 = _2700 * _1340;
    float _2712 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2714 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2712;
    float _2716 = -_1268;
    float _2718 = fma(_1354, _2704, _2716);
    int _2720 = ~_2462;
    int _2722 = _2720 + _2524;
    int _2724 = _2722 + 1;
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2726;
    float _2730 = trunc(_2710);
    int _2732 = int(_2730);
    float _2734 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _2734;
    bool _2738 = !_2530;
    int _2740 = _2738 ? 0 : 1;
    int _2742 = _1286 * _2724;
    int _2744 = _2742 + _2309;
    bool _2746 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2748 = isnan(_924);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = fma(_2714, _2626, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _2760 = _1286 == 0;
    float _2762 = fma(_2728, _2626, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2764 = fma(_2736, _2626, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    bool _2766 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2768 = isnan(_924);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2774 = _2770 || _2772;
    float _2776 = float(_2774);
    float _2778 = -_2468;
    float _2780 = _2778 + 1.0;
    int _2782 = abs(_2740);
    float _2784 = -_2756;
    float _2786 = _2784 + 1.0;
    int _2788 = ~_2708;
    int _2790 = _2788 + 1;
    int _2792 = _2790 + 1;
    float _2794 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2796 = !_2760;
    int _2798 = _2796 ? _2744 : (-1);
    float _2800 = _2776 * _2786;
    bool _2802 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2804 = isnan(_924);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2810 = _2806 || _2808;
    float _2812 = float(_2810);
    float _2814 = -_2776;
    float _2816 = _2814 + 1.0;
    int _2818 = _2732 * _2782;
    int _2820 = _2818 + _2309;
    int _2822 = _1286 + (-1);
    int _2824 = _2798 * _2792;
    bool _2826 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2828 = isnan(_924);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    float _2838 = -_2812;
    float _2840 = _2838 + 1.0;
    float _2842 = _2812 * _2816;
    bool _2844 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2846 = isnan(_924);
    bool _2848 = _2844 || _2846;
    bool _2850 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2852 = _2848 || _2850;
    float _2854 = float(_2852);
    float _2856 = trunc(_2313);
    int _2858 = int(_2856);
    float _2860 = _2836 * _2840;
    float _2862 = -_2836;
    float _2864 = _2862 + 1.0;
    int _2866 = _2708 * _2822;
    int _2868 = _2866 + _2824;
    bool _2870 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2872 = isnan(_924);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2878 = _2874 || _2876;
    float _2880 = float(_2878);
    float _2882 = _2854 * _2864;
    float _2884 = -_2854;
    float _2886 = _2884 + 1.0;
    int _2888 = abs(_1136);
    int _2890 = _2868 * _2355;
    bool _2892 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2894 = isnan(_924);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2900 = _2896 || _2898;
    float _2902 = float(_2900);
    float _2904 = _2880 * _2886;
    bool _2906 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2908 = isnan(_924);
    bool _2910 = _2906 || _2908;
    bool _2912 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2914 = _2910 || _2912;
    float _2916 = float(_2914);
    float _2918 = -_2880;
    float _2920 = _2918 + 1.0;
    float _2922 = -_2902;
    float _2924 = _2922 + 1.0;
    int _2926 = _2858 * _2888;
    int _2928 = _2926 + _2890;
    float _2930 = _2902 * _2920;
    float _2932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2934 = _2916 * _2924;
    bool _2936 = !_2498;
    float _2938 = _2936 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2940 = in.m_77.x;
    float _2942 = in.m_77.y;
    float _2944 = in.m_77.z;
    bool _2946 = _1426 != 0.0;
    bool _2948 = isnan(_1426);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan(0.0);
    bool _2954 = _2950 || _2952;
    float _2956 = _2606 * _2934;
    float _2958 = _2580 * _2934;
    float _2960 = _2588 * _2934;
    int _2962 = abs(as_type<int>(_2938));
    float _2964 = _2353 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2966 = _2820 * _2359;
    int _2968 = _2966 + _2928;
    bool _2970 = _1424 == 0.0;
    bool _2972 = !_2954;
    bool _2974 = _2970 && _2972;
    int _2976 = _2928;
    float _2978 = _2588;
    float _2980 = _2938;
    int _2982 = as_type<int>(_2958);
    if (_2554)
    {
        float _2984 = -_2317;
        float _2986 = _2984 + 1.0;
        _2976 = as_type<int>(_2986);
    }
    int _2988 = _2976;
    float _2990 = fma(_2964, _2476, -0.5);
    int _2992 = _2732 * _2962;
    int _2994 = _2992 + _2968;
    bool _2996 = _1428 == 0.0;
    bool _2998 = _2996 && _2974;
    float _3000 = as_type<float>(_2988);
    if (_2442)
    {
        float _3002 = -_2317;
        float _3004 = _3002 + 1.0;
        _2406 = as_type<int>(_3004);
    }
    int _3006 = _2406;
    float _3008 = -_2916;
    float _3010 = _3008 + 1.0;
    float _3012 = _3010;
    if (!_2554)
    {
        _2978 = _2317;
    }
    float _3014 = _2978;
    float _3016 = -_1254;
    float _3018 = fma(_1096, _2990, _3016);
    float _3020 = float(uint(_2994));
    float _3022 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2956);
    float _3024 = _3014;
    float _3026 = _3020;
    if (!_2442)
    {
        _2980 = _2317;
    }
    float _3028 = _2980;
    float _3030 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[159].z, _2960);
    float _3032 = _3028;
    if (_2554)
    {
        float _3034 = _2341 ? as_type<float>(_2988) : _2317;
        _3024 = _3034;
    }
    float _3036 = _3024;
    float _3038 = as_type<float>(_2351) * _3020;
    if (_2442)
    {
        float _3040 = _2315 ? as_type<float>(_3006) : _2317;
        _3032 = _3040;
    }
    float _3042 = _3032;
    float _3044 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2958);
    float _3046 = _2942;
    float _3048 = _2940;
    if (_2998)
    {
        _2408 = _2942;
    }
    float _3050 = _2408;
    float _3052 = fma(_2636, _2930, _3030);
    float _3054 = _3050;
    if (_2998)
    {
        _3012 = _2944;
    }
    float _3056 = _3012;
    float _3058 = trunc(_3038);
    float _3060 = precise::max(_3058, 0.0);
    uint _3062 = uint(_3060);
    float _3064 = _3056;
    if (_2998)
    {
        _3026 = _3050;
    }
    float _3066 = _3026;
    float _3068 = _3066;
    if (_2998)
    {
        float _3070 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3050);
        _3000 = _3070;
    }
    float _3072 = _3000;
    float _3074 = _3072;
    if (!_2998)
    {
        _3054 = _2942;
    }
    float _3076 = _3054;
    if (_2998)
    {
        float _3078 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3056);
        _2982 = as_type<int>(_3078);
    }
    int _3080 = _2982;
    int _3082 = _3080;
    if (_2998)
    {
        _3046 = _3056;
    }
    float _3084 = _3046;
    float _3086 = fma(_2634, _2930, _3044);
    float _3088 = _3084;
    if (!_2998)
    {
        _3064 = _2944;
    }
    float _3090 = _3064;
    if (!_2998)
    {
        float _3092 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3076);
        _3074 = _3092;
    }
    float _3094 = _3074;
    float _3096 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3098 = ~_1286;
    int _3100 = _3098 + 1;
    if (!_2998)
    {
        float _3102 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2940);
        _3048 = _3102;
    }
    float _3104 = _3048;
    float _3106 = float(uint(_2820));
    float _3108 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3110 = fma(_3096, _3042, -0.5);
    int _3112 = _3100 * int(_3062);
    int _3114 = _3112 + _2994;
    float _3116 = fma(_2632, _2930, _3022);
    float _3118 = as_type<float>(_2351) * _3106;
    float _3120 = fma(_1348, _3108, _1018);
    int _3122 = ~_1286;
    int _3124 = _3122 + 1;
    float _3126 = fma(_1334, _3110, _1166);
    float _3128 = float(uint(_3114));
    float _3130 = _2932 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3132 = trunc(_3118);
    float _3134 = precise::max(_3132, 0.0);
    uint _3136 = uint(_3134);
    int _3138 = ~_1286;
    int _3140 = _3138 + 1;
    if (!_2998)
    {
        float _3142 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3090);
        _3082 = as_type<int>(_3142);
    }
    int _3144 = _3082;
    float _3146 = as_type<float>(_2351) * _3128;
    float _3148 = fma(_3130, _3036, -0.5);
    float _3150 = _3120 + 0.5;
    if (!_2998)
    {
        _3068 = _3094;
    }
    float _3152 = _3068;
    float _3154 = fma(_2598, _2904, _3116);
    float _3156 = trunc(_3146);
    float _3158 = precise::max(_3156, 0.0);
    uint _3160 = uint(_3158);
    float _3162 = fma(_1120, _3148, _1088);
    bool _3164 = !_2998;
    float _3166 = _3164 ? _3094 : _3076;
    float _3168 = fma(_2608, _2904, _3086);
    bool _3170 = !_2998;
    float _3172 = _3170 ? as_type<float>(_3144) : _3090;
    float _3174 = _3162 + 0.5;
    float _3176 = fma(_2604, _2904, _3052);
    float _3178 = _3166 * _3166;
    int _3180 = _3124 * int(_3136);
    int _3182 = _3180 + _2820;
    float _3184 = _2696 + 0.5;
    float _3186 = fma(_2652, _2882, _3154);
    float _3188 = fma(_3172, _3172, _3178);
    float _3190 = fma(_2654, _2882, _3168);
    float _3192 = float(uint(_3182));
    float _3194 = fma(_2656, _2882, _3176);
    float _3196 = fma(_2658, _2860, _3186);
    int _3198 = int(_3062) + int(_3160);
    float _3200 = rsqrt(_3188);
    float _3202 = as_type<float>(_2351) * _3192;
    float _3204 = _3018 + 0.5;
    float _3206 = fma(_2660, _2860, _3190);
    int _3208 = _3140 * _3198;
    int _3210 = _3208 + _2994;
    float _3212 = fma(_2666, _2860, _3194);
    float _3214 = fma(_2674, _2842, _3196);
    out.m_79.x = _3150;
    out.m_79.y = _3184;
    out.m_79.z = _3174;
    out.m_79.w = _3204;
    float _3216 = abs(_1836);
    float _3218 = log2(_3216);
    bool _3220 = uint(_3210) >= uint(_1286);
    float _3222 = fma(_2680, _2842, _3206);
    float _3224 = fma(_2702, _2842, _3212);
    float _3226 = _1520 * _1612;
    bool _3228 = !_3220;
    int _3230 = _3228 ? 0 : (-1);
    float _3232 = _1530 * _1570;
    float _3234 = _1538 * _1570;
    float _3236 = trunc(_3202);
    float _3238 = precise::max(_3236, 0.0);
    uint _3240 = uint(_3238);
    int _3242 = ~_3198;
    int _3244 = _3242 + _3230;
    int _3246 = _3244 + 1;
    float _3248 = _3172 * _3200;
    float _3250 = fma(_2758, _2800, _3214);
    float _3252 = fma(_2762, _2800, _3222);
    float _3254 = _3126 + 0.5;
    int _3256 = _1286 * _3246;
    int _3258 = _3256 + _2994;
    int _3260 = ~_1286;
    int _3262 = _3260 + 1;
    float _3264 = _3218 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3266 = _2718 + 0.5;
    if (!_2998)
    {
        _3088 = as_type<float>(_3144);
    }
    float _3268 = _3088;
    float _3270 = _1520 * _1574;
    bool _3272 = !_2760;
    int _3274 = _3272 ? _3258 : (-1);
    float _3276 = fma(_1524, _1556, _3232);
    float _3278 = exp2(_3264);
    float _3280 = fma(_2764, _2800, _3224);
    int _3282 = _3274 >> 31;
    out.m_81.x = _3254;
    out.m_81.y = _3266;
    int _3284 = int(_3136) + int(_3240);
    float _3286 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].z, _3280);
    int _3288 = _3282 & 3;
    float _3290 = _3166 * _3200;
    float _3292 = _1530 * _1612;
    int _3294 = _3262 * _3284;
    int _3296 = _3294 + _2820;
    int _3298 = _3274 + _3288;
    float _3300 = _1538 * _1612;
    int _3302 = _3274 & 3;
    bool _3304 = _3302 != 0;
    float _3306 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3250);
    bool _3308 = uint(_3296) >= uint(_1286);
    float _3310 = fma(_3278, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3312 = precise::clamp(_3310, 0.0, 1.0);
    float _3314 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].y, _3252);
    int _3316 = _3298 >> 2;
    float _3318 = -_1510;
    float _3320 = fma(_3318, _1552, _3270);
    bool _3322 = !_3308;
    int _3324 = _3322 ? 0 : (-1);
    float _3326 = fma(_3312, -2.0, 3.0);
    float _3328 = _3312 * _3312;
    int _3330 = _3316 << 4;
    int _3332 = _3330 + 368;
    out.m_83.x = _3306;
    out.m_83.y = _3314;
    out.m_83.z = _3286;
    int _3334 = ~_3284;
    int _3336 = _3334 + _3324;
    int _3338 = _3336 + 1;
    float _3340 = _3328 * _3326;
    float _3342 = _1530 * _1574;
    uint _3344 = uint(int(uint(_3332) >> uint(2)));
    uint _3346 = uint(int(uint(int(_3344)) >> uint(2)));
    int _3348 = int(_3344) & 3;
    float _3350 = (*spvDescriptorSet0.vp_c9)._m0[int(_3346)][_3348];
    int _3352 = int(_3344) + 1;
    uint _3354 = uint(int(uint(_3352) >> uint(2)));
    int _3356 = _3352 & 3;
    float _3358 = (*spvDescriptorSet0.vp_c9)._m0[int(_3354)][_3356];
    float _3360 = _1538 * _1574;
    int _3362 = _1286 * _3338;
    int _3364 = _3362 + _2820;
    int _3366 = _3274 & 3;
    bool _3368 = _3366 != 0;
    float _3370 = _1520 * _1570;
    float _3372 = fma(_1524, _1552, _3342);
    float _3374 = fma(_1524, _1554, _3292);
    bool _3376 = uint(_3366) > 1u;
    int _3378 = _3332 + 8;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    uint _3382 = uint(int(uint(int(_3380)) >> uint(2)));
    int _3384 = int(_3380) & 3;
    float _3386 = (*spvDescriptorSet0.vp_c9)._m0[int(_3382)][_3384];
    int _3388 = int(_3380) + 1;
    uint _3390 = uint(int(uint(_3388) >> uint(2)));
    int _3392 = _3388 & 3;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[int(_3390)][_3392];
    int _3396 = _3304 ? 0 : 1;
    float _3398 = -_3340;
    float _3400 = _3398 + 1.0;
    float _3402 = -_1510;
    float _3404 = fma(_3402, _1554, _3226);
    float _3406 = -_1510;
    float _3408 = fma(_3406, _1556, _3370);
    int _3410 = ~_3396;
    int _3412 = _3410 + 1;
    int _3414 = _3412 + 1;
    float _3416 = fma(_3400, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3340);
    float _3418 = fma(_1522, _1438, _3404);
    float _3420 = fma(_1522, _1432, _3320);
    float _3422 = fma(_1522, _1448, _3408);
    float _3424 = fma(_1526, _1554, _3300);
    float _3426 = fma(_1526, _1556, _3234);
    int _3428 = _3414;
    if (!_3376)
    {
        int _3430 = ~_3396;
        int _3432 = _3430 + 1;
        _3428 = _3432;
    }
    int _3434 = _3428;
    float _3436 = fma(_1526, _1552, _3360);
    bool _3438 = _3366 != 3;
    float _3440 = fma(_1548, _1438, _3424);
    bool _3442 = !_3368;
    int _3444 = _3442 ? 0 : 1;
    float _3446 = fma(_1548, _1448, _3426);
    int _3448 = abs(_3434);
    float _3450 = fma(_1548, _1432, _3436);
    bool _3452 = uint(_3366) >= 2u;
    float _3454 = _2794 * _2282;
    int _3456 = abs(_3444);
    float _3458 = -_2794;
    float _3460 = _3458 + 1.0;
    float _3462 = -_2280;
    float _3464 = _3462 + 1.0;
    int _3466 = _3452 ? 0 : 1;
    int _3468 = ~_3448;
    int _3470 = _3468 + 1;
    int _3472 = _3470 + 1;
    int _3474 = ~_3466;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    int _3480 = _3478;
    if (_3438)
    {
        int _3482 = ~_3466;
        int _3484 = _3482 + 1;
        _3480 = _3484;
    }
    int _3486 = _3480;
    float _3488 = fma(_1534, _1448, _3276);
    int _3490 = ~_3456;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    float _3496 = _3420 * _3152;
    bool _3498 = _3366 != 3;
    int _3500 = abs(_3486);
    int _3502 = _3472 * as_type<int>(_3358);
    bool _3504 = !_2546;
    int _3506 = _3504 ? 0 : 1;
    bool _3508 = _1836 <= 8000.0;
    bool _3510 = isnan(_1836);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan(8000.0);
    bool _3516 = _3512 || _3514;
    float _3518 = float(_3516);
    int _3520 = _3494 * as_type<int>(_3350);
    int _3522 = _3520 + _3502;
    float _3524 = fma(_1534, _1432, _3372);
    float _3526 = fma(_1534, _1438, _3374);
    bool _3528 = !_3498;
    int _3530 = _3528 ? 0 : (-1);
    float _3532 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3534 = _3418 * _3152;
    int _3536 = abs(_3506);
    out.m_85.x = _3524;
    out.m_85.y = _3526;
    out.m_85.z = _3488;
    int _3538 = abs(_3530);
    float _3540 = fma(_3524, _3104, _3496);
    int _3542 = ~_3500;
    int _3544 = _3542 + 1;
    int _3546 = _3544 + 1;
    float _3548 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3532);
    int _3550 = ~_3538;
    int _3552 = _3550 + 1;
    int _3554 = _3552 + 1;
    float _3556 = fma(_3526, _3104, _3534);
    float _3558 = _3422 * _3152;
    int _3560 = _3546 * as_type<int>(_3386);
    int _3562 = _3560 + _3522;
    int _3564 = ~_3536;
    int _3566 = _3564 + 1;
    int _3568 = _3566 + 1;
    float _3570 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3548);
    float _3572 = fma(_3488, _3104, _3558);
    int _3574 = _3554 * as_type<int>(_3394);
    int _3576 = _3574 + _3562;
    float _3578 = -_3450;
    float _3580 = _3290 * _3578;
    float _3582 = -_3440;
    float _3584 = _3290 * _3582;
    float _3586 = -_3446;
    float _3588 = _3290 * _3586;
    bool _3590 = !_2760;
    int _3592 = _3590 ? _3364 : (-1);
    int _3594 = _3576 * _3568;
    float _3596 = fma(_3248, _3420, _3580);
    float _3598 = fma(_3248, _3418, _3584);
    float _3600 = fma(_3248, _3422, _3588);
    int _3602 = _3592 * _3536;
    int _3604 = _3602 + _3594;
    float _3606 = in.m_87.x;
    float _3608 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3570);
    float _3610 = _2212 * 0.5;
    float _3612 = _2254 + _2212;
    out.m_89.x = _3596;
    out.m_89.y = _3598;
    out.m_89.z = _3600;
    float _3614 = _3608 + _2212;
    float _3616 = _2303 * _3454;
    float _3618 = _3518 * _3416;
    float _3620 = fma(_2256, -0.5, _3610);
    float _3622 = _3614 * 0.5;
    float _3624 = _3612 * 0.5;
    float _3626 = fma(_3450, _3268, _3540);
    float _3628 = fma(_3440, _3268, _3556);
    float _3630 = fma(_3446, _3268, _3572);
    float _3632 = _2293 * _3460;
    float _3634 = _2293 * _3454;
    float _3636 = fma(_2293, _3616, _2291);
    float _3638 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _3624;
    out.m_91.y = _3620;
    out.m_91.z = _3622;
    out.m_91.w = _2212;
    float _3640 = fma(_2299, _3634, _2287);
    float _3642 = fma(_2301, _3634, _2289);
    out.m_93.x = _3626;
    out.m_93.y = _3628;
    out.m_93.z = _3630;
    float _3644 = _3464 * _3638;
    float _3646 = precise::clamp(_3644, 0.0, 1.0);
    bool _3648 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3650 = isnan(_1968);
    bool _3652 = _3648 || _3650;
    bool _3654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3656 = _3652 || _3654;
    float _3658 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _3640;
    out.m_95.y = _3642;
    out.m_95.z = _3636;
    out.m_95.w = _3632;
    float _3660 = -_3646;
    float _3662 = fma(_3660, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3664 = float(_3604);
    out.gl_Position.x = _2254;
    out.gl_Position.y = _2256;
    out.gl_Position.z = _3608;
    out.gl_Position.w = _2212;
    float _3666 = _3662 * _3606;
    out.m_97.x = _3664;
    float _3668 = _3666 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3670 = _3666;
    float _3672 = _3608;
    float _3674 = _3668;
    if (!_3656)
    {
        _3670 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3676 = _3670;
    float _3678 = _3676;
    float _3680 = _3676;
    if (!_3656)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3682 = _2410;
    out.m_99.x = _3668;
    float _3684 = _3682;
    float _3686 = _3682;
    if (!_3656)
    {
        _3672 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3688 = _3672;
    float _3690 = _3688;
    float _3692 = _3688;
    if (!_3656)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3694 = _2412;
    float _3696 = _3694;
    float _3698 = _3694;
    if (!_3656)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3700 = _2414;
    float _3702 = _3700;
    float _3704 = _3700;
    if (!_3656)
    {
        _3674 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3706 = _3674;
    bool _3708 = !_3656;
    float _3710 = _3706;
    float _3712 = _3706;
    if (!_3708)
    {
        bool _3714 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3716 = isnan(_1968);
        bool _3718 = _3714 || _3716;
        bool _3720 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3722 = _3718 || _3720;
        if (!_3722)
        {
            float _3724 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3726 = _1968 + _3724;
            float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3730 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3728;
            float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3734 = _3732 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3736 = 1.0 / _3730;
            float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3740 = _3738 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3754 = _3726 * _3736;
            float _3756 = precise::clamp(_3754, 0.0, 1.0);
            float _3758 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3760 = _3758 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3762 = fma(_3756, _3734, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3764 = fma(_3756, _3760, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3766 = fma(_3756, _3740, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3768 = fma(_3756, _3744, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3770 = fma(_3756, _3748, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3772 = fma(_3756, _3752, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3686 = _3766;
            _3704 = _3770;
            _3680 = _3762;
            _3698 = _3768;
            _3692 = _3764;
            _3712 = _3772;
            _3774 = true;
        }
        else
        {
            bool _3776 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3778 = isnan(_1968);
            bool _3780 = _3776 || _3778;
            bool _3782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3784 = _3780 || _3782;
            if (!_3784)
            {
                _3678 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3786 = _3678;
            _3680 = _3786;
            if (!_3784)
            {
                _3684 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3788 = _3684;
            _3686 = _3788;
            if (!_3784)
            {
                _3690 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3790 = _3690;
            _3692 = _3790;
            if (!_3784)
            {
                _3696 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3792 = _3696;
            _3698 = _3792;
            if (!_3784)
            {
                _3702 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3794 = _3702;
            _3704 = _3794;
            if (!_3784)
            {
                _3710 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3796 = _3710;
            bool _3798 = !_3784;
            _3712 = _3796;
            if (!_3798)
            {
                bool _3800 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3802 = isnan(_1968);
                bool _3804 = _3800 || _3802;
                bool _3806 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3808 = _3804 || _3806;
                if (!_3808)
                {
                    float _3810 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3812 = _1968 + _3810;
                    float _3814 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3816 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3814;
                    float _3818 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3820 = _3818 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3822 = 1.0 / _3816;
                    float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3826 = _3824 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3830 = _3828 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3834 = _3832 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3840 = _3812 * _3822;
                    float _3842 = precise::clamp(_3840, 0.0, 1.0);
                    float _3844 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3846 = _3844 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3848 = fma(_3842, _3820, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3850 = fma(_3842, _3846, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3852 = fma(_3842, _3826, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3854 = fma(_3842, _3830, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3856 = fma(_3842, _3834, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3858 = fma(_3842, _3838, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3686 = _3852;
                    _3704 = _3856;
                    _3680 = _3848;
                    _3698 = _3854;
                    _3692 = _3850;
                    _3712 = _3858;
                    _3774 = true;
                }
                else
                {
                    _3686 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3704 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3680 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3698 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3692 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3712 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3774 = false;
    float _3860 = _3686;
    float _3862 = _3704;
    float _3864 = _3680;
    float _3866 = _3698;
    float _3868 = _3692;
    float _3870 = _3712;
    float _3872 = _3658 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3874 = fma(_3628, -0.5, 0.5);
    float _3876 = precise::clamp(_3874, 0.0, 1.0);
    float _3878 = -_3860;
    float _3880 = _3878 + _3862;
    float _3882 = -_3864;
    float _3884 = _3882 + _3866;
    out.m_53.x = _3872;
    float _3886 = fma(_3876, _3880, _3860);
    float _3888 = -_3868;
    float _3890 = _3888 + _3870;
    float _3892 = fma(_3876, _3884, _3864);
    float _3894 = _3886 * 0.586610972881317138671875;
    bool _3896 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3898 = fma(_3876, _3890, _3868);
    out.m_101.x = 0.0;
    float _3900 = fma(_3892, 0.298911988735198974609375, _3894);
    bool _3902 = _1946 > 0.0;
    bool _3904 = isnan(_1946);
    bool _3906 = _3902 || _3904;
    bool _3908 = isnan(0.0);
    bool _3910 = _3906 || _3908;
    float _3912 = fma(_3898, 0.114477999508380889892578125, _3900);
    float _3914 = -_3912;
    float _3916 = _3892 + _3914;
    float _3918 = -_3912;
    float _3920 = _3886 + _3918;
    float _3922 = -_3912;
    float _3924 = _3898 + _3922;
    float _3926 = fma(_3916, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3912);
    float _3928 = fma(_3920, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3912);
    float _3930 = fma(_3924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3912);
    bool _3932 = !_3896;
    if (!_3932)
    {
        float _3934 = -_1890;
        float _3936 = _3934 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3938 = -_1892;
        float _3940 = _3938 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3942 = -_1894;
        float _3944 = _3942 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3946 = _3936 * _3936;
        float _3948 = fma(_3940, _3940, _3946);
        float _3950 = fma(_3944, _3944, _3948);
        float _3952 = sqrt(_3950);
        float _3954 = rsqrt(_3950);
        float _3956 = -_3952;
        float _3958 = _3956 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3960 = _3958 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3962 = precise::clamp(_3960, 0.0, 1.0);
        float _3964 = _3940 * _3954;
        float _3966 = _3936 * _3954;
        float _3968 = abs(_3962);
        float _3970 = log2(_3968);
        float _3972 = _3944 * _3954;
        float _3974 = _3964 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3976 = _3628 * _3966;
        float _3978 = -_3966;
        float _3980 = -_3974;
        float _3982 = fma(_3978, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3980);
        float _3984 = fma(_3626, _3964, _3976);
        float _3986 = -_3972;
        float _3988 = fma(_3986, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3982);
        float _3990 = fma(_3630, _3972, _3984);
        float _3992 = precise::clamp(_3990, 0.0, 1.0);
        float _3994 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3996 = _3988 + _3994;
        float _3998 = _3970 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4000 = _3996 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4002 = precise::clamp(_4000, 0.0, 1.0);
        float _4004 = exp2(_3998);
        float _4006 = _4004 * _4002;
        float _4008 = _3992 * _4006;
        float _4010 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4012 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4014 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _4010;
        out.m_101.y = _4012;
        out.m_101.z = _4014;
    }
    out.m_103.x = _3926;
    out.m_103.y = _3928;
    out.m_103.z = _3930;
    if (_3910)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _4016 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4016;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3774 = false;
    bool _790 = false;
    bool _604 = false;
    bool _226 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = in.m_48.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    float _138 = _128;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _134;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _142 = 0;
    if (!_132)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4084 = as_type<float>(_146);
        out.gl_Position.z = _4084;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _148 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_119);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = float(_124);
    bool _160 = _128 >= _158;
    bool _162 = !_156;
    bool _164 = _160 || _162;
    float _166 = 1.0 / _158;
    if (_164)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _136;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    float _170 = _128 * _166;
    int _172 = 0;
    float _174 = _170;
    if (_164)
    {
        float _176 = _168 * 5.0;
        _172 = as_type<int>(_176);
    }
    int _178 = _172;
    out.m_51.x = _170;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4147 = as_type<float>(_178);
        out.gl_Position.z = _4147;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _192 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _194 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _196);
    float _204 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _198);
    bool _206 = !_186;
    float _224;
    if (!_206)
    {
        float _208 = in.m_57.x;
        float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _216 = _214 * _210;
        float _218 = floor(_216);
        float _220 = -_218;
        float _222 = _216 + _220;
        _224 = _222;
        _226 = true;
    }
    else
    {
        _224 = _170;
    }
    _226 = false;
    float _228 = _224;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _246;
    float _250 = 1.0 / _236;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _256 = 1.0 / _244;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _228 + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = 1.0 / _248;
    float _266 = _260 * _250;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _270 = _228 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _274 = _228 + _272;
    bool _276 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_228);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = 1.0 / _232;
    float _290 = _270 * _256;
    bool _292 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _294 = isnan(_228);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _304;
    float _308 = 1.0 / _254;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _228 + _310;
    float _314 = 1.0 / _240;
    float _316 = _312 * _288;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = _228 + _318;
    float _322 = -_302;
    float _324 = _322 + 1.0;
    float _326 = fma(_306, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _328 = _274 * _308;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _332 = _228 + _330;
    bool _334 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_228);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = _332 * _264;
    bool _348 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _350 = isnan(_228);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = _320 * _314;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = -_344;
    float _372 = _370 + 1.0;
    float _374 = _358 * _324;
    float _376 = -_358;
    float _378 = _376 + 1.0;
    float _380 = fma(_368, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_362, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _384 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_228);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _344 * _378;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _286 * _372;
    float _412 = -_286;
    float _414 = _412 + 1.0;
    bool _416 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_228);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = fma(_400, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _430 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _432 = isnan(_228);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_404, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _444 = fma(_408, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _446 = _394 * _414;
    float _448 = -_394;
    float _450 = _448 + 1.0;
    float _452 = -_440;
    float _454 = _452 + 1.0;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = _440 * _450;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = _426 * _454;
    float _472 = fma(_458, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _474 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _476 = fma(_468, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = _380 * _470;
    float _480 = _326 * _470;
    float _482 = -_426;
    float _484 = _482 + 1.0;
    float _486 = _382 * _470;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _496 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].y, _480);
    float _500 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].z, _486);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _506 = fma(_428, _460, _496);
    float _508 = fma(_442, _460, _498);
    float _510 = fma(_444, _460, _500);
    float _512 = fma(_490, _290, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _514 = fma(_494, _290, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _516 = fma(_504, _290, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _518 = fma(_474, _446, _506);
    float _520 = fma(_472, _446, _508);
    float _522 = fma(_476, _446, _510);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _532;
    float _536 = fma(_512, _410, _518);
    float _538 = fma(_514, _410, _520);
    float _540 = fma(_516, _410, _522);
    float _542 = fma(_526, _346, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _544 = fma(_530, _346, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _546 = fma(_534, _346, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _560 = fma(_542, _396, _536);
    float _562 = fma(_550, _328, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _564 = fma(_554, _328, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _566 = fma(_558, _328, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _568 = fma(_544, _396, _538);
    float _570 = fma(_546, _396, _540);
    float _572 = fma(_562, _374, _560);
    float _574 = fma(_564, _374, _568);
    float _576 = fma(_566, _374, _570);
    float _578 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[149].x, _572);
    float _580 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[149].y, _574);
    float _582 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[149].z, _576);
    bool _584 = !_262;
    float _602;
    if (!_584)
    {
        float _586 = in.m_57.x;
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _590 = _586 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _594 = _592 * _588;
        float _596 = floor(_594);
        float _598 = -_596;
        float _600 = _594 + _598;
        _602 = _600;
        _604 = true;
    }
    else
    {
        _602 = _170;
    }
    _604 = false;
    float _606 = _602;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _606 + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _616 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _618 = isnan(_606);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _636 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _638 = isnan(_606);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / _614;
    float _650 = -_626;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _654;
    bool _658 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _660 = isnan(_606);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _646 * _652;
    float _672 = -_646;
    float _674 = _672 + 1.0;
    bool _676 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _678 = 1.0 / _630;
    float _680 = _668 * _674;
    float _682 = -_668;
    float _684 = _682 + 1.0;
    float _686 = 1.0 / _634;
    float _688 = _656 * _648;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _694 = fma(_688, _610, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _696 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _698 = isnan(_606);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _692 * _678;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _716 = _606 + _714;
    float _718 = _694 * _680;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _722 = _606 + _720;
    float _724 = fma(_708, _716, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _726 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _728 = _712 * _686;
    float _730 = -_706;
    float _732 = _730 + 1.0;
    float _734 = fma(_724, _670, _726);
    float _736 = fma(_728, _722, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _738 = _626 * _732;
    float _740 = fma(_736, _738, _734);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _748 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[118].x, _740);
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _758 = in.m_59.x;
    float _760 = in.m_59.y;
    float _762 = in.m_59.z;
    out.m_61.x = _750;
    out.m_61.y = _752;
    out.m_61.z = _754;
    out.m_61.w = _756;
    float _764 = _582 * _762;
    float _766 = _580 * _760;
    float _768 = _578 * _758;
    bool _770 = !_676;
    float _788;
    if (!_770)
    {
        float _772 = in.m_57.x;
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _776 = _772 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _780 = _778 * _774;
        float _782 = floor(_780);
        float _784 = -_782;
        float _786 = _780 + _784;
        _788 = _786;
        _790 = true;
    }
    else
    {
        _788 = _170;
    }
    _790 = false;
    float _792 = _788;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _796 = _792 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _802 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _804 = isnan(_792);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _818 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _820 = isnan(_792);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _830;
    bool _834 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _836 = isnan(_792);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / _800;
    float _848 = -_812;
    float _850 = _848 + 1.0;
    bool _852 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _854 = _828 * _850;
    float _856 = -_828;
    float _858 = _856 + 1.0;
    float _860 = 1.0 / _816;
    float _862 = _832 * _846;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _868 = fma(_862, _796, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _870 = _866 * _860;
    float _872 = _868 * _854;
    float _874 = -_844;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _880 = _792 + _878;
    float _882 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[131].x, _872);
    float _884 = _812 * _876;
    float _886 = fma(_870, _880, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _890 = fma(_886, _884, _882);
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _894 = _888 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _898 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _890);
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = _896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _898 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _894;
    out.m_63.y = _900;
    out.m_63.z = _902;
    out.m_63.w = _904;
    bool _906 = !_852;
    if (!_906)
    {
        float _908 = in.m_57.x;
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _912 = _908 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _916 = _914 * _910;
        float _918 = floor(_916);
        float _920 = -_918;
        float _922 = _916 + _920;
        _174 = _922;
    }
    float _924 = _174;
    float _926 = in.m_57.x;
    float _928 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _930 = in.m_57.y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = in.m_57.z;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _938 = _936 != 0;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _942 = in.m_46.x;
    float _944 = in.m_46.y;
    float _946 = in.m_46.z;
    float _948 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _950 = _926 * 2.0;
    float _952 = _926 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _954 = _930 * 2.0;
    float _956 = _930 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _958 = floor(_950);
    float _960 = -_932;
    float _962 = fma(_952, 2.0, _960);
    float _964 = _934 * 2.0;
    float _966 = fma(_956, -2.0, _940);
    float _968 = _926 + _930;
    float _970 = _930 + _934;
    float _972 = _944 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _974 = _944 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _976 = floor(_954);
    float _978 = _944 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _980 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[4].x, _972);
    float _982 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[5].x, _974);
    float _984 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[6].x, _978);
    float _986 = _968 + (-1.0);
    float _988 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[4].z, _980);
    float _990 = floor(_964);
    float _992 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[5].z, _982);
    float _994 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[6].z, _984);
    float _996 = _942;
    float _998 = _946;
    float _1000 = _984;
    if (_938)
    {
        _996 = _926;
    }
    float _1002 = _996;
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1006 = _1002;
    if (!_938)
    {
        _998 = _930;
    }
    float _1008 = _998;
    float _1010 = _970 + (-1.0);
    float _1012 = _1008;
    if (!_938)
    {
        _1006 = _934;
    }
    float _1014 = _1006;
    float _1016 = -_128;
    float _1018 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[76].x, _962);
    float _1020 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1022 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1024 = log2(_1022);
    if (_938)
    {
        _1012 = _926;
    }
    float _1026 = _1012;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1030 = _958 > 0.0;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1034 = _958 >= 0.0;
    bool _1036 = isnan(_958);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    float _1044 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_938)
    {
        _1000 = _934;
    }
    float _1046 = _1000;
    float _1048 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1050 = _1046;
    if (_938)
    {
        _1050 = _930;
    }
    float _1052 = _1050;
    float _1054 = _988 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1056 = _976 >= 0.0;
    bool _1058 = isnan(_976);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    float _1066 = -_1028;
    float _1068 = fma(_1048, 2.0, _1066);
    bool _1070 = _990 >= 0.0;
    bool _1072 = isnan(_990);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan(0.0);
    bool _1078 = _1074 || _1076;
    float _1080 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1032);
    float _1082 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _966);
    bool _1084 = _976 > 0.0;
    float _1086 = -_128;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1068);
    bool _1090 = _990 > 0.0;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1094 = _1042 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1096 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1080);
    int _1098 = _1064 ? 0 : 1;
    float _1100 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1092);
    float _1102 = _1078 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1104 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1106 = int(_1104);
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1110 = _1108 != 0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1100);
    int _1122 = ~as_type<int>(_1094);
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    bool _1128 = !_1114;
    int _1130 = _1128 ? 0 : 1;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1134 = !_1110;
    int _1136 = _1134 ? 0 : 1;
    bool _1138 = !_1118;
    int _1140 = _1138 ? 0 : 1;
    float _1142 = -_1132;
    float _1144 = fma(_1044, 2.0, _1142);
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1156 = _1154 != 0;
    int _1158 = ~as_type<int>(_1102);
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    float _1164 = -_128;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1144);
    int _1168 = _1126;
    int _1170 = _1162;
    float _1172 = _1094;
    float _1174 = _1102;
    if (!_1030)
    {
        int _1176 = ~as_type<int>(_1094);
        int _1178 = _1176 + 1;
        _1168 = _1178;
    }
    int _1180 = _1168;
    float _1182 = -_1054;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1186 = !_1152;
    int _1188 = _1186 ? 0 : 1;
    bool _1190 = !_1148;
    int _1192 = _1190 ? 0 : 1;
    int _1194 = abs(_1188);
    int _1196 = abs(_1192);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (!_1090)
    {
        int _1200 = ~as_type<int>(_1102);
        int _1202 = _1200 + 1;
        _1170 = _1202;
    }
    int _1204 = _1170;
    if (!_938)
    {
        _1172 = _934;
    }
    float _1206 = _1172;
    float _1208 = _1206;
    if (_938)
    {
        _1174 = _930;
    }
    float _1210 = _1174;
    float _1212 = _1210;
    if (_938)
    {
        _1208 = _930;
    }
    float _1214 = _1208;
    if (!_938)
    {
        _1212 = _926;
    }
    float _1216 = _1212;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1220 = float(_1180);
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1224 = float(_1194);
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1228 = float(_1204);
    float _1230 = fma(_1222, -2.0, _1218);
    float _1232 = float(_1106);
    float _1234 = _1224 * _1220;
    float _1236 = _1024 * _128;
    float _1238 = fma(_1226, -2.0, _1198);
    float _1240 = in.m_65.x;
    float _1242 = in.m_65.y;
    float _1244 = in.m_65.z;
    float _1246 = 1.0 / _1232;
    int _1248 = ~_1098;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1230);
    int _1256 = _1252;
    if (!_1084)
    {
        int _1258 = ~_1098;
        int _1260 = _1258 + 1;
        _1256 = _1260;
    }
    int _1262 = _1256;
    float _1264 = _1234 * (-2.0);
    float _1266 = float(_1196);
    float _1268 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1238);
    float _1270 = exp2(_1236);
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1276 = 1.0 + _1274;
    float _1278 = _1266 * _1228;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1282 = _1278 * (-2.0);
    float _1284 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1286 = int(_1284);
    bool _1288 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1290 = isnan(1.0);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1296 = _1292 || _1294;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1310 = _1306 || _1308;
    float _1312 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1280);
    float _1314 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1298);
    float _1316 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1300);
    float _1318 = 1.0 / _1276;
    float _1320 = -_1270;
    float _1322 = _1320 + 1.0;
    float _1324 = _992 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1326 = fma(_1282, _1240, _1240);
    float _1328 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1272);
    bool _1330 = !_1156;
    int _1332 = _1330 ? 0 : 1;
    float _1334 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1316);
    float _1336 = _1310 ? _1322 : 0.0;
    float _1338 = _926 + (-0.5);
    float _1340 = float(_1286);
    float _1342 = -_1324;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1246 * _128;
    float _1348 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1312);
    float _1350 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1314);
    float _1352 = _1340 * _128;
    float _1354 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1328);
    int _1356 = abs(_1332);
    float _1358 = _1324;
    if (_1296)
    {
        float _1360 = _1336 * _1318;
        _138 = _1360;
    }
    float _1362 = _138;
    float _1364 = _994 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1366 = fma(_1004, _1282, _1004);
    float _1368 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1326);
    float _1370 = _1344 * _1344;
    float _1372 = fma(_1264, _1242, _1242);
    float _1374 = fma(_1366, _1362, _1368);
    float _1376 = -_1364;
    float _1378 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1380 = fma(_1184, _1184, _1370);
    float _1382 = _930 + (-0.5);
    float _1384 = fma(_1020, _1264, _1020);
    float _1386 = float(_1262);
    float _1388 = _1374 * 0.15915493667125701904296875;
    float _1390 = float(_1356);
    float _1392 = fma(_1378, _1378, _1380);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1372);
    float _1396 = _926 + _934;
    float _1398 = _1390 * _1386;
    float _1400 = rsqrt(_1392);
    float _1402 = _1396 + (-1.0);
    float _1404 = fma(_1384, _1362, _1394);
    float _1406 = _1398 * (-2.0);
    float _1408 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1410 = _934 + (-0.5);
    float _1412 = fma(_1406, _1244, _1244);
    float _1414 = _1388 * 6.283185482025146484375;
    float _1416 = sin(_1414);
    float _1418 = _1404 * 0.15915493667125701904296875;
    float _1420 = fma(_1408, _1406, _1408);
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1412);
    float _1424 = in.m_67.x;
    float _1426 = in.m_67.y;
    float _1428 = in.m_67.z;
    float _1430 = fma(_1420, _1362, _1422);
    float _1432 = _1184 * _1400;
    float _1434 = _1388 * 6.283185482025146484375;
    float _1436 = cos(_1434);
    float _1438 = _1344 * _1400;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1442 = _1438 * _1440;
    float _1444 = _1418 * 6.283185482025146484375;
    float _1446 = sin(_1444);
    float _1448 = _1378 * _1400;
    float _1450 = _1430 * 0.15915493667125701904296875;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1454 = _1432 * _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1458 = -_1442;
    float _1460 = fma(_1432, _1456, _1458);
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1464 = _1448 * _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1468 = -_1454;
    float _1470 = fma(_1448, _1466, _1468);
    float _1472 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1476 = -_1464;
    float _1478 = fma(_1438, _1474, _1476);
    float _1480 = _1470 * _1470;
    float _1482 = _1418 * 6.283185482025146484375;
    float _1484 = cos(_1482);
    float _1486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1424);
    float _1488 = _1436 * _1446;
    float _1490 = _928 * _1486;
    float _1492 = _1450 * 6.283185482025146484375;
    float _1494 = cos(_1492);
    float _1496 = fma(_1478, _1478, _1480);
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1426);
    float _1500 = _1416 * _1446;
    float _1502 = fma(_1460, _1460, _1496);
    float _1504 = _1472 * _1498;
    float _1506 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1428);
    float _1508 = _1450 * 6.283185482025146484375;
    float _1510 = sin(_1508);
    float _1512 = _1436 * _1484;
    float _1514 = _1416 * _1484;
    float _1516 = _948 * _1506;
    float _1518 = rsqrt(_1502);
    float _1520 = _1436 * _1494;
    float _1522 = _1416 * _1494;
    float _1524 = _1484 * _1494;
    float _1526 = _1446 * _1494;
    float _1528 = _1520 * _1504;
    float _1530 = fma(_1510, _1512, _1500);
    float _1532 = -_1488;
    float _1534 = fma(_1510, _1514, _1532);
    float _1536 = -_1514;
    float _1538 = fma(_1510, _1488, _1536);
    float _1540 = -_1504;
    float _1542 = _1510 * _1540;
    float _1544 = fma(_1530, _1490, _1528);
    float _1546 = _1522 * _1504;
    float _1548 = fma(_1510, _1500, _1512);
    float _1550 = fma(_1524, _1490, _1542);
    float _1552 = _1478 * _1518;
    float _1554 = _1470 * _1518;
    float _1556 = _1460 * _1518;
    float _1558 = fma(_1538, _1516, _1544);
    float _1560 = _1438 * _1552;
    float _1562 = _1448 * _1554;
    float _1564 = fma(_1534, _1490, _1546);
    float _1566 = fma(_1526, _1516, _1550);
    float _1568 = -_1560;
    float _1570 = fma(_1432, _1554, _1568);
    float _1572 = -_1562;
    float _1574 = fma(_1438, _1556, _1572);
    float _1576 = fma(_1548, _1516, _1564);
    float _1578 = _1570 * _1558;
    float _1580 = _1574 * _1558;
    float _1582 = fma(_1556, _1566, _1578);
    float _1584 = fma(_1552, _1566, _1580);
    float _1586 = fma(_1448, _1576, _1582);
    float _1588 = fma(_1432, _1576, _1584);
    float _1590 = _1364 + _1586;
    float _1592 = _1054 + _1588;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1596 = _1590 + _1594;
    float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1600 = _1592 + _1598;
    float _1602 = _1596 * _1596;
    float _1604 = fma(_1600, _1600, _1602);
    float _1606 = _1432 * _1556;
    float _1608 = sqrt(_1604);
    float _1610 = -_1606;
    float _1612 = fma(_1448, _1552, _1610);
    float _1614 = _1612 * _1558;
    float _1616 = fma(_1554, _1566, _1614);
    float _1618 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1620 = fma(_1438, _1576, _1616);
    float _1622 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1618);
    bool _1624 = _1608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1626 = _1324 + _1620;
    float _1628 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1622);
    float _1630 = _1622;
    float _1632 = _1576;
    float _1634 = _1620;
    float _1636 = _1596;
    if (!_1624)
    {
        _1630 = _1592;
    }
    float _1638 = _1630;
    float _1640 = _1638;
    if (!_1624)
    {
        _1632 = _1590;
    }
    float _1642 = _1632;
    float _1644 = _1642;
    if (!_1624)
    {
        _1634 = _1626;
    }
    float _1646 = _1634;
    bool _1648 = !_1624;
    float _1650 = _1646;
    if (!_1648)
    {
        float _1652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1656 = _1608 + _1654;
        float _1658 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1660 = rsqrt(_1604);
        float _1662 = _1656 * _1652;
        float _1664 = _1662 * 0.15915493667125701904296875;
        float _1666 = _1664 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        float _1670 = _1664 * 6.283185482025146484375;
        float _1672 = sin(_1670);
        float _1674 = _1668 + (-1.0);
        float _1676 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1678 = fma(_1672, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1680 = fma(_1626, _1668, _1676);
        float _1682 = _1660 * _1678;
        float _1684 = fma(_1600, _1682, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1686 = fma(_1596, _1682, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1650 = _1680;
        _1640 = _1684;
        _1644 = _1686;
    }
    float _1688 = _1650;
    float _1690 = _1640;
    float _1692 = _1644;
    float _1694 = -_1324;
    float _1696 = _1694 + _1688;
    float _1698 = -_1054;
    float _1700 = _1698 + _1690;
    float _1702 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1704 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1706 = _1696 * _1696;
    float _1708 = -_1364;
    float _1710 = _1708 + _1692;
    float _1712 = 1.0 / _1702;
    float _1714 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1704);
    float _1716 = fma(_1700, _1700, _1706);
    float _1718 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1714);
    float _1720 = fma(_1710, _1710, _1716);
    bool _1722 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1724 = isnan(0.5);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1730 = _1726 || _1728;
    float _1732 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1734 = sqrt(_1720);
    bool _1736 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1738 = isnan(0.5);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1744 = _1740 || _1742;
    float _1746 = _1732 + _1702;
    float _1748 = _1746 * _1712;
    float _1750 = _1748 * 0.5;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1754 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1752);
    float _1756 = 1.0 / _1754;
    bool _1758 = _1734 > 0.0;
    bool _1760 = !_1758;
    float _1762 = _1688;
    float _1764 = _1692;
    float _1766 = _1690;
    float _1768 = _1754;
    if (!_1760)
    {
        float _1770 = _202 * _202;
        float _1772 = fma(_200, _200, _1770);
        float _1774 = fma(_204, _204, _1772);
        float _1776 = rsqrt(_1720);
        float _1778 = sqrt(_1774);
        float _1780 = _1700 * _1776;
        float _1782 = _1696 * _1776;
        float _1784 = _1710 * _1776;
        bool _1786 = _1778 > 0.0;
        bool _1788 = !_1786;
        if (!_1788)
        {
            float _1790 = rsqrt(_1774);
            float _1792 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1794 = _202 * _1790;
            float _1796 = _200 * _1790;
            float _1798 = _204 * _1790;
            float _1800 = _1782 * _1794;
            float _1802 = fma(_1780, _1796, _1800);
            float _1804 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1806 = fma(_1784, _1798, _1802);
            float _1808 = _1806 * _1804;
            float _1810 = fma(_200, _1808, _1690);
            float _1812 = fma(_202, _1808, _1688);
            float _1814 = fma(_204, _1808, _1692);
            _1762 = _1812;
            _1764 = _1814;
            _1766 = _1810;
            _1768 = _1800;
        }
    }
    float _1816 = _1762;
    float _1818 = _1764;
    float _1820 = _1766;
    float _1822 = _1768;
    float _1824 = _1822;
    float _1826 = _1816;
    float _1828 = _1820;
    float _1830 = _1818;
    if (_1744)
    {
        _1824 = 1.0;
    }
    float _1832 = _1824;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1836 = _1756 * _1834;
    float _1838 = _1832;
    if (!_1730)
    {
        float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1842 = _1324 + _1840;
        float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1846 = _1054 + _1844;
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1850 = -_1324;
        float _1852 = _1850 + _1816;
        float _1854 = _1842 * _1842;
        float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1858 = _1364 + _1856;
        float _1860 = -_1364;
        float _1862 = _1860 + _1818;
        float _1864 = fma(_1846, _1846, _1854);
        float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1868 = fma(_1858, _1858, _1864);
        float _1870 = sqrt(_1868);
        float _1872 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1874 = precise::min(_1870, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1876 = _1874 * _1866;
        float _1878 = _1872 * _1876;
        float _1880 = -_1054;
        float _1882 = _1880 + _1820;
        float _1884 = fma(_1852, _1878, _1324);
        float _1886 = fma(_1882, _1878, _1054);
        float _1888 = fma(_1862, _1878, _1364);
        _1826 = _1884;
        _1828 = _1886;
        _1830 = _1888;
    }
    float _1890 = _1826;
    float _1892 = _1828;
    float _1894 = _1830;
    if (!_1744)
    {
        float _1896 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1898 = _1896 * 0.15915493667125701904296875;
        float _1900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1902 = _1898 * 6.283185482025146484375;
        float _1904 = cos(_1902);
        float _1906 = _1900 * 0.15915493667125701904296875;
        float _1908 = _1898 * 6.283185482025146484375;
        float _1910 = sin(_1908);
        float _1912 = 1.0 / _1904;
        float _1914 = _1906 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        float _1918 = _1910 * _1912;
        float _1920 = _1906 * 6.283185482025146484375;
        float _1922 = sin(_1920);
        float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1926 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1924;
        float _1928 = _1916 * _1918;
        float _1930 = 1.0 / _1926;
        float _1932 = 1.0 / _1928;
        float _1934 = _1922 * _1932;
        float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1938 = fma(_1836, _1934, _1936);
        float _1940 = _1938 * _1930;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        _1358 = _1918;
        _1838 = _1942;
    }
    float _1944 = _1358;
    float _1946 = _1838;
    float _1948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1950 = _1890 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1954 = _1892 + _1952;
    float _1956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1958 = _1894 + _1956;
    float _1960 = _1950 * _1950;
    float _1962 = fma(_1954, _1954, _1960);
    float _1964 = fma(_1958, _1958, _1962);
    float _1966 = rsqrt(_1964);
    float _1968 = sqrt(_1964);
    float _1970 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1972 = _1954 * _1970;
    float _1974 = _1958 * _1970;
    float _1976 = _1972 * _1972;
    float _1978 = _1974 * _1974;
    float _1980 = _1976 + _1978;
    float _1982 = sqrt(_1980);
    bool _1984 = _1982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1988 = _1982 + _1986;
    float _1990 = _1958;
    float _1992 = _1980;
    float _1994 = _1988;
    float _1996 = _1944;
    if (_1984)
    {
        float _1998 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1990 = _1998;
    }
    float _2000 = _1990;
    if (_1984)
    {
        float _2002 = rsqrt(_1980);
        _1992 = _2002;
    }
    float _2004 = _1992;
    float _2006 = _2004;
    if (_1984)
    {
        float _2008 = _1988 * _2000;
        _1994 = _2008;
    }
    float _2010 = _1994;
    if (_1984)
    {
        float _2012 = _2010 * 0.15915493667125701904296875;
        _1996 = _2012;
    }
    float _2014 = _1996;
    float _2016 = _2000;
    float _2018 = _2014;
    if (_1984)
    {
        float _2020 = _2014 * 6.283185482025146484375;
        float _2022 = sin(_2020);
        _2016 = _2022;
    }
    float _2024 = _2016;
    float _2026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2028 = precise::max(0.0, _2026);
    float _2030 = _1960;
    float _2032 = _2028;
    if (_1984)
    {
        float _2034 = _2014 * 6.283185482025146484375;
        float _2036 = cos(_2034);
        _2030 = _2036;
    }
    float _2038 = _2030;
    float _2040 = -_1970;
    float _2042 = -_2028;
    float _2044 = fma(_1950, _2040, _2042);
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1984)
    {
        float _2048 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2048;
    }
    float _2050 = _2032;
    float _2052 = fma(_1054, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2054 = _2050;
    if (!_1984)
    {
        _2046 = _2044;
    }
    float _2056 = _2046;
    float _2058 = _2024;
    float _2060 = _2056;
    if (_1984)
    {
        float _2062 = fma(_2024, _2050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = floor(_2052);
    float _2068 = _2064;
    float _2070 = _2038;
    if (_1984)
    {
        float _2072 = _2038 + (-1.0);
        _2054 = _2072;
    }
    float _2074 = _2054;
    float _2076 = _2074;
    if (_1984)
    {
        float _2078 = _2004 * _2064;
        _1636 = _2078;
    }
    float _2080 = _1636;
    if (!_1984)
    {
        _2068 = _1972;
    }
    float _2082 = _2068;
    float _2084 = _2082;
    if (_1984)
    {
        float _2086 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2018 = _2086;
    }
    float _2088 = _2018;
    if (_1984)
    {
        float _2090 = _1972 * _2080;
        _2084 = _2090;
    }
    float _2092 = _2084;
    if (!_1984)
    {
        _2076 = _1974;
    }
    float _2094 = _2076;
    float _2096 = _2094;
    if (_1984)
    {
        float _2098 = _1974 * _2080;
        _2096 = _2098;
    }
    float _2100 = _2096;
    if (!_1984)
    {
        _2006 = _1976;
    }
    float _2102 = _2006;
    float _2104 = _2102;
    if (_1984)
    {
        float _2106 = fma(_2044, _2038, _2088);
        _2060 = _2106;
    }
    float _2108 = _2060;
    if (_1984)
    {
        float _2110 = _2092 * _2092;
        _2104 = _2110;
    }
    float _2112 = _2104;
    float _2114 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1984)
    {
        _2070 = _1978;
    }
    float _2116 = _2070;
    float _2118 = _2116;
    if (_1984)
    {
        float _2120 = _2100 * _2100;
        _2118 = _2120;
    }
    float _2122 = _2118;
    float _2124 = fma(_2108, _2108, _2112);
    float _2126 = fma(_1364, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2128 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2130 = _2124 + _2122;
    float _2132 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2134 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2128);
    float _2136 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2114);
    float _2138 = rsqrt(_2130);
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2142 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2140);
    float _2144 = precise::clamp(_2142, 0.0, 1.0);
    float _2146 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2132);
    float _2148 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2134);
    float _2150 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2136);
    float _2152 = -_2144;
    float _2154 = _2152 + 1.0;
    float _2156 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2146);
    float _2158 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2160 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2164 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2166 = abs(_2154);
    float _2168 = log2(_2166);
    float _2170 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2172 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2174 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2164);
    float _2176 = _2138 * _2092;
    float _2178 = _2138 * _2108;
    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2182 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2184 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2186 = _2138 * _2100;
    float _2188 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2172);
    float _2190 = -_2182;
    float _2192 = fma(_2190, _2180, 1.0);
    float _2194 = -_2184;
    float _2196 = fma(_2178, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2194);
    float _2198 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2174);
    float _2200 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2202 = -_2066;
    float _2204 = _2052 + _2202;
    float _2206 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2208 = -_2186;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2196);
    float _2212 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2198);
    float _2214 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2216 = log2(_2192);
    float _2218 = fma(_2210, -0.5, 0.5);
    float _2220 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2222 = fma(_2210, 0.5, 0.5);
    float _2224 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2214);
    float _2226 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2220);
    float _2228 = _2178 + 1.0;
    float _2230 = exp2(_2206);
    float _2232 = fma(_2222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2224);
    float _2236 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2226);
    float _2238 = fma(_2222, _2232, -0.212114393711090087890625);
    float _2240 = sqrt(_2218);
    float _2242 = fma(_2222, _2238, 1.570728778839111328125);
    float _2244 = _2216 * 0.693147182464599609375;
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2248 = 1.0 / _2212;
    float _2250 = -_2178;
    float _2252 = fma(_2230, _2228, _2250);
    float _2254 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2234);
    float _2256 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2236);
    float _2258 = floor(_2126);
    float _2260 = _2240 * 0.636619746685028076171875;
    float _2262 = -_2242;
    float _2264 = fma(_2260, _2262, 1.0);
    float _2266 = fma(_2252, 0.5, 0.5);
    float _2268 = _2254 * _2248;
    float _2270 = _2256 * _2248;
    float _2272 = fma(_2268, 0.5, 0.5);
    float _2274 = fma(_2270, -0.5, 0.5);
    float _2276 = -_2258;
    float _2278 = _2126 + _2276;
    float2 _7537 = float2(_2204, _2278);
    float _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7537, float2(0.0), isnan(_7537)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7537, float2(0.0), isnan(_7537)), level(0.0)).x;
    float3 _7548 = float3(_2272, _2274, _2246);
    float _2282 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7548, float3(0.0), isnan(_7548)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7548, float3(0.0), isnan(_7548)), level(0.0)).x;
    float3 _7559 = float3(_2272, _2274, _2246);
    float4 _2285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7559, float3(0.0), isnan(_7559)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7559, float3(0.0), isnan(_7559)), level(0.0)).xyzw;
    float _2287 = _2285.x;
    float _2289 = _2285.y;
    float _2291 = _2285.z;
    float _2293 = _2285.w;
    float2 _7575 = float2(_2264, _2266);
    float3 _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7575, float2(0.0), isnan(_7575)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7575, float2(0.0), isnan(_7575)), level(0.0)).xyz;
    float _2299 = _2297.x;
    float _2301 = _2297.y;
    float _2303 = _2297.z;
    float _2305 = float(uint(_1286));
    float _2307 = trunc(_1346);
    int _2309 = int(_2307);
    float _2311 = in.m_69.y;
    float _2313 = _1352 * _166;
    bool _2315 = _930 > 0.5;
    float _2317 = in.m_69.x;
    int _2319 = ~_1286;
    int _2321 = _2319 + 1;
    float _2323 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2325 = 1.0 / _2305;
    int _2327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2329 = _2327 != 0;
    float _2331 = in.m_71.w;
    int _2333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2335 = _2333 != 0;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2339 = _2337 != 0;
    out.m_73.x = _1892;
    out.m_73.y = _1890;
    out.m_73.z = _1894;
    bool _2341 = _934 > 0.5;
    float _2343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2345 = float(uint(_2309));
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2349 = _2347 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2351 = as_type<int>(_2325) + (-2);
    float _2353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2355 = abs(_1130);
    float _2357 = as_type<float>(_2351) * _2345;
    int _2359 = abs(_1140);
    float _2361 = in.m_57.w;
    float _2363 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2365 = trunc(_2357);
    float _2367 = precise::max(_2365, 0.0);
    uint _2370 = uint(_2367);
    out.m_75.w = _2331;
    float _2372 = 1.0 / _2349;
    float _2374 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2374;
    int _2378 = _2321 * int(_2370);
    int _2380 = _2378 + _2309;
    float _2382 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2384 = _2382 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2388 = float(uint(_2380));
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _2390;
    bool _2394 = _2361 > 0.5;
    float _2396 = as_type<float>(_2351) * _2388;
    float _2398 = 1.0 / _2392;
    float _2400 = _2361;
    float _2402 = _2311;
    bool _2404 = _2329;
    int _2406 = as_type<int>(_2353);
    float _2408 = _2317;
    float _2410 = _2212;
    float _2412 = _2256;
    float _2414 = _2254;
    if (!_2335)
    {
        _2400 = _2317;
    }
    float _2416 = _2400;
    float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2420 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _2418;
    float _2422 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2424 = _2422 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2426 = trunc(_2396);
    float _2428 = precise::max(_2426, 0.0);
    uint _2430 = uint(_2428);
    int _2432 = ~_1286;
    int _2434 = _2432 + 1;
    bool _2436 = !_938;
    float _2438 = _2436 ? 7.345489978790283203125 : 1.0;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2442 = _2440 != 0;
    float _2444 = 1.0 / _2420;
    float _2446 = -_2311;
    float _2448 = _2446 + 1.0;
    int _2450 = _2315 ? as_type<int>(_2448) : as_type<int>(_2311);
    int _2452 = _2341 ? as_type<int>(_2448) : as_type<int>(_2311);
    float _2454 = 1.0 / _2424;
    float _2456 = _2339 ? as_type<float>(_2450) : _2311;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2460 = _2458 != 0;
    int _2462 = int(_2370) + int(_2430);
    float _2464 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2466 = _2460 ? as_type<float>(_2452) : _2311;
    float _2468 = exp2(_2323);
    int _2470 = as_type<int>(_2448);
    float _2472 = _2416;
    if (_2329)
    {
        float _2474 = _2394 ? _2448 : _2311;
        _2402 = _2474;
    }
    float _2476 = _2402;
    if (_2335)
    {
        float _2478 = -_2317;
        float _2480 = _2478 + 1.0;
        _2470 = as_type<int>(_2480);
    }
    int _2482 = _2470;
    int _2484 = _2434 * _2462;
    int _2486 = _2484 + _2309;
    if (_2335)
    {
        bool _2488 = _926 > 0.5;
        _2404 = _2488;
    }
    bool _2490 = _2404;
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2494 = _924 + _2492;
    int _2496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2498 = _2496 != 0;
    float _2500 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2502 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _2500;
    if (_2335)
    {
        float _2504 = _2490 ? as_type<float>(_2482) : _2317;
        _2472 = _2504;
    }
    float _2506 = _2472;
    float _2508 = _2494 * _2398;
    bool _2510 = uint(_2486) >= uint(_1286);
    float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2514 = _2512 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2516 = 1.0 / _2502;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2520 = _924 + _2518;
    bool _2522 = !_2510;
    int _2524 = _2522 ? 0 : (-1);
    float _2526 = _2438 * _926;
    int _2528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2530 = _2528 != 0;
    float _2532 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2534 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2532;
    float _2536 = _2520 * _2444;
    float _2538 = 1.0 / _2514;
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2542 = _924 + _2540;
    int _2544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2546 = _2544 != 0;
    float _2548 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2550 = _924 + _2548;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2554 = _2552 != 0;
    float _2556 = _2542 * _2372;
    float _2558 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2560 = _924 + _2558;
    float _2562 = 1.0 / _2534;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2566 = _924 + _2564;
    float _2568 = _2560 * _2516;
    float _2570 = _2550 * _2454;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _2572;
    float _2576 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2576;
    float _2580 = fma(_2376, _2508, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2582 = _2566 * _2538;
    float _2584 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _2584;
    float _2588 = fma(_2574, _2508, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2592 = _924 + _2590;
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2594;
    float _2598 = fma(_2578, _2536, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2600;
    float _2604 = fma(_2586, _2536, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _2606 = fma(_2596, _2508, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2608 = fma(_2602, _2536, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _2610 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2612 = _2610 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2620 = _2618 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2626 = _2592 * _2562;
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2632 = fma(_2612, _2556, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2634 = fma(_2384, _2556, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2636 = fma(_2616, _2556, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2642;
    float _2646 = floor(_2526);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _2648;
    float _2652 = fma(_2620, _2570, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2654 = fma(_2624, _2570, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2656 = fma(_2630, _2570, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _2658 = fma(_2640, _2568, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2660 = fma(_2644, _2568, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2664 = _2662 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2666 = fma(_2650, _2568, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2672 = float(_2309);
    float _2674 = fma(_2664, _2582, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _2678 = _2676 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2680 = fma(_2670, _2582, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2682 = _2672 >= _1340;
    bool _2684 = isnan(_2672);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(_1340);
    bool _2690 = _2686 || _2688;
    float _2692 = float(_2690);
    float _2694 = -_1082;
    float _2696 = fma(_1350, _2464, _2694);
    float _2698 = -_2646;
    float _2700 = _2526 + _2698;
    float _2702 = fma(_2678, _2582, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _2704 = fma(_2466, _2363, -0.5);
    float _2706 = trunc(_2692);
    int _2708 = int(_2706);
    float _2710 = _2700 * _1340;
    float _2712 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2714 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2712;
    float _2716 = -_1268;
    float _2718 = fma(_1354, _2704, _2716);
    int _2720 = ~_2462;
    int _2722 = _2720 + _2524;
    int _2724 = _2722 + 1;
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2726;
    float _2730 = trunc(_2710);
    int _2732 = int(_2730);
    float _2734 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _2734;
    bool _2738 = !_2530;
    int _2740 = _2738 ? 0 : 1;
    int _2742 = _1286 * _2724;
    int _2744 = _2742 + _2309;
    bool _2746 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2748 = isnan(_924);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = fma(_2714, _2626, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _2760 = _1286 == 0;
    float _2762 = fma(_2728, _2626, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2764 = fma(_2736, _2626, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    bool _2766 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2768 = isnan(_924);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2774 = _2770 || _2772;
    float _2776 = float(_2774);
    float _2778 = -_2468;
    float _2780 = _2778 + 1.0;
    int _2782 = abs(_2740);
    float _2784 = -_2756;
    float _2786 = _2784 + 1.0;
    int _2788 = ~_2708;
    int _2790 = _2788 + 1;
    int _2792 = _2790 + 1;
    float _2794 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2796 = !_2760;
    int _2798 = _2796 ? _2744 : (-1);
    float _2800 = _2776 * _2786;
    bool _2802 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2804 = isnan(_924);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2810 = _2806 || _2808;
    float _2812 = float(_2810);
    float _2814 = -_2776;
    float _2816 = _2814 + 1.0;
    int _2818 = _2732 * _2782;
    int _2820 = _2818 + _2309;
    int _2822 = _1286 + (-1);
    int _2824 = _2798 * _2792;
    bool _2826 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2828 = isnan(_924);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    float _2838 = -_2812;
    float _2840 = _2838 + 1.0;
    float _2842 = _2812 * _2816;
    bool _2844 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2846 = isnan(_924);
    bool _2848 = _2844 || _2846;
    bool _2850 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2852 = _2848 || _2850;
    float _2854 = float(_2852);
    float _2856 = trunc(_2313);
    int _2858 = int(_2856);
    float _2860 = _2836 * _2840;
    float _2862 = -_2836;
    float _2864 = _2862 + 1.0;
    int _2866 = _2708 * _2822;
    int _2868 = _2866 + _2824;
    bool _2870 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2872 = isnan(_924);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2878 = _2874 || _2876;
    float _2880 = float(_2878);
    float _2882 = _2854 * _2864;
    float _2884 = -_2854;
    float _2886 = _2884 + 1.0;
    int _2888 = abs(_1136);
    int _2890 = _2868 * _2355;
    bool _2892 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2894 = isnan(_924);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2900 = _2896 || _2898;
    float _2902 = float(_2900);
    float _2904 = _2880 * _2886;
    bool _2906 = _924 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2908 = isnan(_924);
    bool _2910 = _2906 || _2908;
    bool _2912 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2914 = _2910 || _2912;
    float _2916 = float(_2914);
    float _2918 = -_2880;
    float _2920 = _2918 + 1.0;
    float _2922 = -_2902;
    float _2924 = _2922 + 1.0;
    int _2926 = _2858 * _2888;
    int _2928 = _2926 + _2890;
    float _2930 = _2902 * _2920;
    float _2932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2934 = _2916 * _2924;
    bool _2936 = !_2498;
    float _2938 = _2936 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2940 = in.m_77.x;
    float _2942 = in.m_77.y;
    float _2944 = in.m_77.z;
    bool _2946 = _1426 != 0.0;
    bool _2948 = isnan(_1426);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan(0.0);
    bool _2954 = _2950 || _2952;
    float _2956 = _2606 * _2934;
    float _2958 = _2580 * _2934;
    float _2960 = _2588 * _2934;
    int _2962 = abs(as_type<int>(_2938));
    float _2964 = _2353 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2966 = _2820 * _2359;
    int _2968 = _2966 + _2928;
    bool _2970 = _1424 == 0.0;
    bool _2972 = !_2954;
    bool _2974 = _2970 && _2972;
    int _2976 = _2928;
    float _2978 = _2588;
    float _2980 = _2938;
    int _2982 = as_type<int>(_2958);
    if (_2554)
    {
        float _2984 = -_2317;
        float _2986 = _2984 + 1.0;
        _2976 = as_type<int>(_2986);
    }
    int _2988 = _2976;
    float _2990 = fma(_2964, _2476, -0.5);
    int _2992 = _2732 * _2962;
    int _2994 = _2992 + _2968;
    bool _2996 = _1428 == 0.0;
    bool _2998 = _2996 && _2974;
    float _3000 = as_type<float>(_2988);
    if (_2442)
    {
        float _3002 = -_2317;
        float _3004 = _3002 + 1.0;
        _2406 = as_type<int>(_3004);
    }
    int _3006 = _2406;
    float _3008 = -_2916;
    float _3010 = _3008 + 1.0;
    float _3012 = _3010;
    if (!_2554)
    {
        _2978 = _2317;
    }
    float _3014 = _2978;
    float _3016 = -_1254;
    float _3018 = fma(_1096, _2990, _3016);
    float _3020 = float(uint(_2994));
    float _3022 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2956);
    float _3024 = _3014;
    float _3026 = _3020;
    if (!_2442)
    {
        _2980 = _2317;
    }
    float _3028 = _2980;
    float _3030 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[159].z, _2960);
    float _3032 = _3028;
    if (_2554)
    {
        float _3034 = _2341 ? as_type<float>(_2988) : _2317;
        _3024 = _3034;
    }
    float _3036 = _3024;
    float _3038 = as_type<float>(_2351) * _3020;
    if (_2442)
    {
        float _3040 = _2315 ? as_type<float>(_3006) : _2317;
        _3032 = _3040;
    }
    float _3042 = _3032;
    float _3044 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2958);
    float _3046 = _2942;
    float _3048 = _2940;
    if (_2998)
    {
        _2408 = _2942;
    }
    float _3050 = _2408;
    float _3052 = fma(_2636, _2930, _3030);
    float _3054 = _3050;
    if (_2998)
    {
        _3012 = _2944;
    }
    float _3056 = _3012;
    float _3058 = trunc(_3038);
    float _3060 = precise::max(_3058, 0.0);
    uint _3062 = uint(_3060);
    float _3064 = _3056;
    if (_2998)
    {
        _3026 = _3050;
    }
    float _3066 = _3026;
    float _3068 = _3066;
    if (_2998)
    {
        float _3070 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3050);
        _3000 = _3070;
    }
    float _3072 = _3000;
    float _3074 = _3072;
    if (!_2998)
    {
        _3054 = _2942;
    }
    float _3076 = _3054;
    if (_2998)
    {
        float _3078 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3056);
        _2982 = as_type<int>(_3078);
    }
    int _3080 = _2982;
    int _3082 = _3080;
    if (_2998)
    {
        _3046 = _3056;
    }
    float _3084 = _3046;
    float _3086 = fma(_2634, _2930, _3044);
    float _3088 = _3084;
    if (!_2998)
    {
        _3064 = _2944;
    }
    float _3090 = _3064;
    if (!_2998)
    {
        float _3092 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3076);
        _3074 = _3092;
    }
    float _3094 = _3074;
    float _3096 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3098 = ~_1286;
    int _3100 = _3098 + 1;
    if (!_2998)
    {
        float _3102 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2940);
        _3048 = _3102;
    }
    float _3104 = _3048;
    float _3106 = float(uint(_2820));
    float _3108 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3110 = fma(_3096, _3042, -0.5);
    int _3112 = _3100 * int(_3062);
    int _3114 = _3112 + _2994;
    float _3116 = fma(_2632, _2930, _3022);
    float _3118 = as_type<float>(_2351) * _3106;
    float _3120 = fma(_1348, _3108, _1018);
    int _3122 = ~_1286;
    int _3124 = _3122 + 1;
    float _3126 = fma(_1334, _3110, _1166);
    float _3128 = float(uint(_3114));
    float _3130 = _2932 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3132 = trunc(_3118);
    float _3134 = precise::max(_3132, 0.0);
    uint _3136 = uint(_3134);
    int _3138 = ~_1286;
    int _3140 = _3138 + 1;
    if (!_2998)
    {
        float _3142 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3090);
        _3082 = as_type<int>(_3142);
    }
    int _3144 = _3082;
    float _3146 = as_type<float>(_2351) * _3128;
    float _3148 = fma(_3130, _3036, -0.5);
    float _3150 = _3120 + 0.5;
    if (!_2998)
    {
        _3068 = _3094;
    }
    float _3152 = _3068;
    float _3154 = fma(_2598, _2904, _3116);
    float _3156 = trunc(_3146);
    float _3158 = precise::max(_3156, 0.0);
    uint _3160 = uint(_3158);
    float _3162 = fma(_1120, _3148, _1088);
    bool _3164 = !_2998;
    float _3166 = _3164 ? _3094 : _3076;
    float _3168 = fma(_2608, _2904, _3086);
    bool _3170 = !_2998;
    float _3172 = _3170 ? as_type<float>(_3144) : _3090;
    float _3174 = _3162 + 0.5;
    float _3176 = fma(_2604, _2904, _3052);
    float _3178 = _3166 * _3166;
    int _3180 = _3124 * int(_3136);
    int _3182 = _3180 + _2820;
    float _3184 = _2696 + 0.5;
    float _3186 = fma(_2652, _2882, _3154);
    float _3188 = fma(_3172, _3172, _3178);
    float _3190 = fma(_2654, _2882, _3168);
    float _3192 = float(uint(_3182));
    float _3194 = fma(_2656, _2882, _3176);
    float _3196 = fma(_2658, _2860, _3186);
    int _3198 = int(_3062) + int(_3160);
    float _3200 = rsqrt(_3188);
    float _3202 = as_type<float>(_2351) * _3192;
    float _3204 = _3018 + 0.5;
    float _3206 = fma(_2660, _2860, _3190);
    int _3208 = _3140 * _3198;
    int _3210 = _3208 + _2994;
    float _3212 = fma(_2666, _2860, _3194);
    float _3214 = fma(_2674, _2842, _3196);
    out.m_79.x = _3150;
    out.m_79.y = _3184;
    out.m_79.z = _3174;
    out.m_79.w = _3204;
    float _3216 = abs(_1836);
    float _3218 = log2(_3216);
    bool _3220 = uint(_3210) >= uint(_1286);
    float _3222 = fma(_2680, _2842, _3206);
    float _3224 = fma(_2702, _2842, _3212);
    float _3226 = _1520 * _1612;
    bool _3228 = !_3220;
    int _3230 = _3228 ? 0 : (-1);
    float _3232 = _1530 * _1570;
    float _3234 = _1538 * _1570;
    float _3236 = trunc(_3202);
    float _3238 = precise::max(_3236, 0.0);
    uint _3240 = uint(_3238);
    int _3242 = ~_3198;
    int _3244 = _3242 + _3230;
    int _3246 = _3244 + 1;
    float _3248 = _3172 * _3200;
    float _3250 = fma(_2758, _2800, _3214);
    float _3252 = fma(_2762, _2800, _3222);
    float _3254 = _3126 + 0.5;
    int _3256 = _1286 * _3246;
    int _3258 = _3256 + _2994;
    int _3260 = ~_1286;
    int _3262 = _3260 + 1;
    float _3264 = _3218 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3266 = _2718 + 0.5;
    if (!_2998)
    {
        _3088 = as_type<float>(_3144);
    }
    float _3268 = _3088;
    float _3270 = _1520 * _1574;
    bool _3272 = !_2760;
    int _3274 = _3272 ? _3258 : (-1);
    float _3276 = fma(_1524, _1556, _3232);
    float _3278 = exp2(_3264);
    float _3280 = fma(_2764, _2800, _3224);
    int _3282 = _3274 >> 31;
    out.m_81.x = _3254;
    out.m_81.y = _3266;
    int _3284 = int(_3136) + int(_3240);
    float _3286 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].z, _3280);
    int _3288 = _3282 & 3;
    float _3290 = _3166 * _3200;
    float _3292 = _1530 * _1612;
    int _3294 = _3262 * _3284;
    int _3296 = _3294 + _2820;
    int _3298 = _3274 + _3288;
    float _3300 = _1538 * _1612;
    int _3302 = _3274 & 3;
    bool _3304 = _3302 != 0;
    float _3306 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3250);
    bool _3308 = uint(_3296) >= uint(_1286);
    float _3310 = fma(_3278, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3312 = precise::clamp(_3310, 0.0, 1.0);
    float _3314 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].y, _3252);
    int _3316 = _3298 >> 2;
    float _3318 = -_1510;
    float _3320 = fma(_3318, _1552, _3270);
    bool _3322 = !_3308;
    int _3324 = _3322 ? 0 : (-1);
    float _3326 = fma(_3312, -2.0, 3.0);
    float _3328 = _3312 * _3312;
    int _3330 = _3316 << 4;
    int _3332 = _3330 + 368;
    out.m_83.x = _3306;
    out.m_83.y = _3314;
    out.m_83.z = _3286;
    int _3334 = ~_3284;
    int _3336 = _3334 + _3324;
    int _3338 = _3336 + 1;
    float _3340 = _3328 * _3326;
    float _3342 = _1530 * _1574;
    uint _3344 = uint(int(uint(_3332) >> uint(2)));
    uint _3346 = uint(int(uint(int(_3344)) >> uint(2)));
    int _3348 = int(_3344) & 3;
    float _3350 = (*spvDescriptorSet0.vp_c9)._m0[int(_3346)][_3348];
    int _3352 = int(_3344) + 1;
    uint _3354 = uint(int(uint(_3352) >> uint(2)));
    int _3356 = _3352 & 3;
    float _3358 = (*spvDescriptorSet0.vp_c9)._m0[int(_3354)][_3356];
    float _3360 = _1538 * _1574;
    int _3362 = _1286 * _3338;
    int _3364 = _3362 + _2820;
    int _3366 = _3274 & 3;
    bool _3368 = _3366 != 0;
    float _3370 = _1520 * _1570;
    float _3372 = fma(_1524, _1552, _3342);
    float _3374 = fma(_1524, _1554, _3292);
    bool _3376 = uint(_3366) > 1u;
    int _3378 = _3332 + 8;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    uint _3382 = uint(int(uint(int(_3380)) >> uint(2)));
    int _3384 = int(_3380) & 3;
    float _3386 = (*spvDescriptorSet0.vp_c9)._m0[int(_3382)][_3384];
    int _3388 = int(_3380) + 1;
    uint _3390 = uint(int(uint(_3388) >> uint(2)));
    int _3392 = _3388 & 3;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[int(_3390)][_3392];
    int _3396 = _3304 ? 0 : 1;
    float _3398 = -_3340;
    float _3400 = _3398 + 1.0;
    float _3402 = -_1510;
    float _3404 = fma(_3402, _1554, _3226);
    float _3406 = -_1510;
    float _3408 = fma(_3406, _1556, _3370);
    int _3410 = ~_3396;
    int _3412 = _3410 + 1;
    int _3414 = _3412 + 1;
    float _3416 = fma(_3400, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3340);
    float _3418 = fma(_1522, _1438, _3404);
    float _3420 = fma(_1522, _1432, _3320);
    float _3422 = fma(_1522, _1448, _3408);
    float _3424 = fma(_1526, _1554, _3300);
    float _3426 = fma(_1526, _1556, _3234);
    int _3428 = _3414;
    if (!_3376)
    {
        int _3430 = ~_3396;
        int _3432 = _3430 + 1;
        _3428 = _3432;
    }
    int _3434 = _3428;
    float _3436 = fma(_1526, _1552, _3360);
    bool _3438 = _3366 != 3;
    float _3440 = fma(_1548, _1438, _3424);
    bool _3442 = !_3368;
    int _3444 = _3442 ? 0 : 1;
    float _3446 = fma(_1548, _1448, _3426);
    int _3448 = abs(_3434);
    float _3450 = fma(_1548, _1432, _3436);
    bool _3452 = uint(_3366) >= 2u;
    float _3454 = _2794 * _2282;
    int _3456 = abs(_3444);
    float _3458 = -_2794;
    float _3460 = _3458 + 1.0;
    float _3462 = -_2280;
    float _3464 = _3462 + 1.0;
    int _3466 = _3452 ? 0 : 1;
    int _3468 = ~_3448;
    int _3470 = _3468 + 1;
    int _3472 = _3470 + 1;
    int _3474 = ~_3466;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    int _3480 = _3478;
    if (_3438)
    {
        int _3482 = ~_3466;
        int _3484 = _3482 + 1;
        _3480 = _3484;
    }
    int _3486 = _3480;
    float _3488 = fma(_1534, _1448, _3276);
    int _3490 = ~_3456;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    float _3496 = _3420 * _3152;
    bool _3498 = _3366 != 3;
    int _3500 = abs(_3486);
    int _3502 = _3472 * as_type<int>(_3358);
    bool _3504 = !_2546;
    int _3506 = _3504 ? 0 : 1;
    bool _3508 = _1836 <= 8000.0;
    bool _3510 = isnan(_1836);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan(8000.0);
    bool _3516 = _3512 || _3514;
    float _3518 = float(_3516);
    int _3520 = _3494 * as_type<int>(_3350);
    int _3522 = _3520 + _3502;
    float _3524 = fma(_1534, _1432, _3372);
    float _3526 = fma(_1534, _1438, _3374);
    bool _3528 = !_3498;
    int _3530 = _3528 ? 0 : (-1);
    float _3532 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3534 = _3418 * _3152;
    int _3536 = abs(_3506);
    out.m_85.x = _3524;
    out.m_85.y = _3526;
    out.m_85.z = _3488;
    int _3538 = abs(_3530);
    float _3540 = fma(_3524, _3104, _3496);
    int _3542 = ~_3500;
    int _3544 = _3542 + 1;
    int _3546 = _3544 + 1;
    float _3548 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3532);
    int _3550 = ~_3538;
    int _3552 = _3550 + 1;
    int _3554 = _3552 + 1;
    float _3556 = fma(_3526, _3104, _3534);
    float _3558 = _3422 * _3152;
    int _3560 = _3546 * as_type<int>(_3386);
    int _3562 = _3560 + _3522;
    int _3564 = ~_3536;
    int _3566 = _3564 + 1;
    int _3568 = _3566 + 1;
    float _3570 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3548);
    float _3572 = fma(_3488, _3104, _3558);
    int _3574 = _3554 * as_type<int>(_3394);
    int _3576 = _3574 + _3562;
    float _3578 = -_3450;
    float _3580 = _3290 * _3578;
    float _3582 = -_3440;
    float _3584 = _3290 * _3582;
    float _3586 = -_3446;
    float _3588 = _3290 * _3586;
    bool _3590 = !_2760;
    int _3592 = _3590 ? _3364 : (-1);
    int _3594 = _3576 * _3568;
    float _3596 = fma(_3248, _3420, _3580);
    float _3598 = fma(_3248, _3418, _3584);
    float _3600 = fma(_3248, _3422, _3588);
    int _3602 = _3592 * _3536;
    int _3604 = _3602 + _3594;
    float _3606 = in.m_87.x;
    float _3608 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3570);
    float _3610 = _2212 * 0.5;
    float _3612 = _2254 + _2212;
    out.m_89.x = _3596;
    out.m_89.y = _3598;
    out.m_89.z = _3600;
    float _3614 = _3608 + _2212;
    float _3616 = _2303 * _3454;
    float _3618 = _3518 * _3416;
    float _3620 = fma(_2256, -0.5, _3610);
    float _3622 = _3614 * 0.5;
    float _3624 = _3612 * 0.5;
    float _3626 = fma(_3450, _3268, _3540);
    float _3628 = fma(_3440, _3268, _3556);
    float _3630 = fma(_3446, _3268, _3572);
    float _3632 = _2293 * _3460;
    float _3634 = _2293 * _3454;
    float _3636 = fma(_2293, _3616, _2291);
    float _3638 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _3624;
    out.m_91.y = _3620;
    out.m_91.z = _3622;
    out.m_91.w = _2212;
    float _3640 = fma(_2299, _3634, _2287);
    float _3642 = fma(_2301, _3634, _2289);
    out.m_93.x = _3626;
    out.m_93.y = _3628;
    out.m_93.z = _3630;
    float _3644 = _3464 * _3638;
    float _3646 = precise::clamp(_3644, 0.0, 1.0);
    bool _3648 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3650 = isnan(_1968);
    bool _3652 = _3648 || _3650;
    bool _3654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3656 = _3652 || _3654;
    float _3658 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _3640;
    out.m_95.y = _3642;
    out.m_95.z = _3636;
    out.m_95.w = _3632;
    float _3660 = -_3646;
    float _3662 = fma(_3660, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3664 = float(_3604);
    out.gl_Position.x = _2254;
    out.gl_Position.y = _2256;
    out.gl_Position.z = _3608;
    out.gl_Position.w = _2212;
    float _3666 = _3662 * _3606;
    out.m_97.x = _3664;
    float _3668 = _3666 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3670 = _3666;
    float _3672 = _3608;
    float _3674 = _3668;
    if (!_3656)
    {
        _3670 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3676 = _3670;
    float _3678 = _3676;
    float _3680 = _3676;
    if (!_3656)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3682 = _2410;
    out.m_99.x = _3668;
    float _3684 = _3682;
    float _3686 = _3682;
    if (!_3656)
    {
        _3672 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3688 = _3672;
    float _3690 = _3688;
    float _3692 = _3688;
    if (!_3656)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3694 = _2412;
    float _3696 = _3694;
    float _3698 = _3694;
    if (!_3656)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3700 = _2414;
    float _3702 = _3700;
    float _3704 = _3700;
    if (!_3656)
    {
        _3674 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3706 = _3674;
    bool _3708 = !_3656;
    float _3710 = _3706;
    float _3712 = _3706;
    if (!_3708)
    {
        bool _3714 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3716 = isnan(_1968);
        bool _3718 = _3714 || _3716;
        bool _3720 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3722 = _3718 || _3720;
        if (!_3722)
        {
            float _3724 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3726 = _1968 + _3724;
            float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3730 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3728;
            float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3734 = _3732 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3736 = 1.0 / _3730;
            float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3740 = _3738 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3754 = _3726 * _3736;
            float _3756 = precise::clamp(_3754, 0.0, 1.0);
            float _3758 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3760 = _3758 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3762 = fma(_3756, _3734, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3764 = fma(_3756, _3760, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3766 = fma(_3756, _3740, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3768 = fma(_3756, _3744, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3770 = fma(_3756, _3748, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3772 = fma(_3756, _3752, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3686 = _3766;
            _3704 = _3770;
            _3680 = _3762;
            _3698 = _3768;
            _3692 = _3764;
            _3712 = _3772;
            _3774 = true;
        }
        else
        {
            bool _3776 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3778 = isnan(_1968);
            bool _3780 = _3776 || _3778;
            bool _3782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3784 = _3780 || _3782;
            if (!_3784)
            {
                _3678 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3786 = _3678;
            _3680 = _3786;
            if (!_3784)
            {
                _3684 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3788 = _3684;
            _3686 = _3788;
            if (!_3784)
            {
                _3690 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3790 = _3690;
            _3692 = _3790;
            if (!_3784)
            {
                _3696 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3792 = _3696;
            _3698 = _3792;
            if (!_3784)
            {
                _3702 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3794 = _3702;
            _3704 = _3794;
            if (!_3784)
            {
                _3710 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3796 = _3710;
            bool _3798 = !_3784;
            _3712 = _3796;
            if (!_3798)
            {
                bool _3800 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3802 = isnan(_1968);
                bool _3804 = _3800 || _3802;
                bool _3806 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3808 = _3804 || _3806;
                if (!_3808)
                {
                    float _3810 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3812 = _1968 + _3810;
                    float _3814 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3816 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3814;
                    float _3818 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3820 = _3818 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3822 = 1.0 / _3816;
                    float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3826 = _3824 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3830 = _3828 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3834 = _3832 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3840 = _3812 * _3822;
                    float _3842 = precise::clamp(_3840, 0.0, 1.0);
                    float _3844 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3846 = _3844 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3848 = fma(_3842, _3820, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3850 = fma(_3842, _3846, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3852 = fma(_3842, _3826, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3854 = fma(_3842, _3830, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3856 = fma(_3842, _3834, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3858 = fma(_3842, _3838, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3686 = _3852;
                    _3704 = _3856;
                    _3680 = _3848;
                    _3698 = _3854;
                    _3692 = _3850;
                    _3712 = _3858;
                    _3774 = true;
                }
                else
                {
                    _3686 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3704 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3680 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3698 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3692 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3712 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3774 = false;
    float _3860 = _3686;
    float _3862 = _3704;
    float _3864 = _3680;
    float _3866 = _3698;
    float _3868 = _3692;
    float _3870 = _3712;
    float _3872 = _3658 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3874 = fma(_3628, -0.5, 0.5);
    float _3876 = precise::clamp(_3874, 0.0, 1.0);
    float _3878 = -_3860;
    float _3880 = _3878 + _3862;
    float _3882 = -_3864;
    float _3884 = _3882 + _3866;
    out.m_53.x = _3872;
    float _3886 = fma(_3876, _3880, _3860);
    float _3888 = -_3868;
    float _3890 = _3888 + _3870;
    float _3892 = fma(_3876, _3884, _3864);
    float _3894 = _3886 * 0.586610972881317138671875;
    bool _3896 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3898 = fma(_3876, _3890, _3868);
    out.m_101.x = 0.0;
    float _3900 = fma(_3892, 0.298911988735198974609375, _3894);
    bool _3902 = _1946 > 0.0;
    bool _3904 = isnan(_1946);
    bool _3906 = _3902 || _3904;
    bool _3908 = isnan(0.0);
    bool _3910 = _3906 || _3908;
    float _3912 = fma(_3898, 0.114477999508380889892578125, _3900);
    float _3914 = -_3912;
    float _3916 = _3892 + _3914;
    float _3918 = -_3912;
    float _3920 = _3886 + _3918;
    float _3922 = -_3912;
    float _3924 = _3898 + _3922;
    float _3926 = fma(_3916, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3912);
    float _3928 = fma(_3920, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3912);
    float _3930 = fma(_3924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3912);
    bool _3932 = !_3896;
    if (!_3932)
    {
        float _3934 = -_1890;
        float _3936 = _3934 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3938 = -_1892;
        float _3940 = _3938 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3942 = -_1894;
        float _3944 = _3942 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3946 = _3936 * _3936;
        float _3948 = fma(_3940, _3940, _3946);
        float _3950 = fma(_3944, _3944, _3948);
        float _3952 = sqrt(_3950);
        float _3954 = rsqrt(_3950);
        float _3956 = -_3952;
        float _3958 = _3956 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3960 = _3958 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3962 = precise::clamp(_3960, 0.0, 1.0);
        float _3964 = _3940 * _3954;
        float _3966 = _3936 * _3954;
        float _3968 = abs(_3962);
        float _3970 = log2(_3968);
        float _3972 = _3944 * _3954;
        float _3974 = _3964 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3976 = _3628 * _3966;
        float _3978 = -_3966;
        float _3980 = -_3974;
        float _3982 = fma(_3978, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3980);
        float _3984 = fma(_3626, _3964, _3976);
        float _3986 = -_3972;
        float _3988 = fma(_3986, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3982);
        float _3990 = fma(_3630, _3972, _3984);
        float _3992 = precise::clamp(_3990, 0.0, 1.0);
        float _3994 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3996 = _3988 + _3994;
        float _3998 = _3970 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4000 = _3996 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4002 = precise::clamp(_4000, 0.0, 1.0);
        float _4004 = exp2(_3998);
        float _4006 = _4004 * _4002;
        float _4008 = _3992 * _4006;
        float _4010 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4012 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4014 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _4010;
        out.m_101.y = _4012;
        out.m_101.z = _4014;
    }
    out.m_103.x = _3926;
    out.m_103.y = _3928;
    out.m_103.z = _3930;
    if (_3910)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _4016 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4016;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

