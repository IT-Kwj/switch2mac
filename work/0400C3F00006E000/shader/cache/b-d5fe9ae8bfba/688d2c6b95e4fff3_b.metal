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
    bool _3812 = false;
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
        float _4122 = as_type<float>(_146);
        out.gl_Position.z = _4122;
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
        float _4185 = as_type<float>(_178);
        out.gl_Position.z = _4185;
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
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _806 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _808 = isnan(_792);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _822 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _824 = isnan(_792);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = 1.0 / _800;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _836;
    float _840 = -_816;
    float _842 = _840 + 1.0;
    bool _844 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _846 = isnan(_792);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    bool _856 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _858 = 1.0 / _804;
    float _860 = 1.0 / _820;
    float _862 = _838 * _834;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _868 = _832 * _842;
    float _870 = -_832;
    float _872 = _870 + 1.0;
    float _874 = fma(_862, _796, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _876 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _878 = isnan(_792);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = _854 * _872;
    float _890 = _866 * _858;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _894 = _792 + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _896;
    float _900 = _874 * _888;
    float _902 = -_854;
    float _904 = _902 + 1.0;
    float _906 = fma(_890, _894, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _908 = -_886;
    float _910 = _908 + 1.0;
    float _912 = _898 * _860;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _916 = _792 + _914;
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[131].x, _900);
    float _920 = _816 * _910;
    float _922 = fma(_912, _916, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _924 = fma(_906, _868, _918);
    float _926 = fma(_922, _920, _924);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _934 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[134].x, _926);
    float _936 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _934 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _936;
    out.m_63.y = _940;
    out.m_63.z = _938;
    out.m_63.w = _942;
    bool _944 = !_856;
    if (!_944)
    {
        float _946 = in.m_57.x;
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _950 = _946 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _954 = _952 * _948;
        float _956 = floor(_954);
        float _958 = -_956;
        float _960 = _954 + _958;
        _174 = _960;
    }
    float _962 = _174;
    float _964 = in.m_57.x;
    float _966 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _968 = in.m_57.y;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _972 = in.m_57.z;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _976 = _974 != 0;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = in.m_46.x;
    float _982 = in.m_46.y;
    float _984 = in.m_46.z;
    float _986 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _988 = _964 * 2.0;
    float _990 = _964 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _992 = _968 * 2.0;
    float _994 = _968 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _996 = floor(_988);
    float _998 = -_970;
    float _1000 = fma(_990, 2.0, _998);
    float _1002 = _972 * 2.0;
    float _1004 = fma(_994, -2.0, _978);
    float _1006 = _964 + _968;
    float _1008 = _968 + _972;
    float _1010 = _982 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1012 = _982 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1014 = floor(_992);
    float _1016 = _982 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1018 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1010);
    float _1020 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1012);
    float _1022 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1016);
    float _1024 = _1006 + (-1.0);
    float _1026 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1028 = floor(_1002);
    float _1030 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1020);
    float _1032 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1022);
    float _1034 = _980;
    float _1036 = _984;
    float _1038 = _1022;
    if (_976)
    {
        _1034 = _964;
    }
    float _1040 = _1034;
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1044 = _1040;
    if (!_976)
    {
        _1036 = _968;
    }
    float _1046 = _1036;
    float _1048 = _1008 + (-1.0);
    float _1050 = _1046;
    if (!_976)
    {
        _1044 = _972;
    }
    float _1052 = _1044;
    float _1054 = -_128;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1000);
    float _1058 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1060 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1062 = log2(_1060);
    if (_976)
    {
        _1050 = _964;
    }
    float _1064 = _1050;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1068 = _996 > 0.0;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1072 = _996 >= 0.0;
    bool _1074 = isnan(_996);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    float _1082 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_976)
    {
        _1038 = _972;
    }
    float _1084 = _1038;
    float _1086 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1088 = _1084;
    if (_976)
    {
        _1088 = _968;
    }
    float _1090 = _1088;
    float _1092 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1094 = _1014 >= 0.0;
    bool _1096 = isnan(_1014);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    float _1104 = -_1066;
    float _1106 = fma(_1086, 2.0, _1104);
    bool _1108 = _1028 >= 0.0;
    bool _1110 = isnan(_1028);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan(0.0);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1070);
    float _1120 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1004);
    bool _1122 = _1014 > 0.0;
    float _1124 = -_128;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1106);
    bool _1128 = _1028 > 0.0;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1132 = _1080 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1134 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1118);
    int _1136 = _1102 ? 0 : 1;
    float _1138 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1130);
    float _1140 = _1116 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1142 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1144 = int(_1142);
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1156 = _1154 != 0;
    float _1158 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1138);
    int _1160 = ~as_type<int>(_1132);
    int _1162 = _1160 + 1;
    int _1164 = _1162 + 1;
    bool _1166 = !_1152;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1172 = !_1148;
    int _1174 = _1172 ? 0 : 1;
    bool _1176 = !_1156;
    int _1178 = _1176 ? 0 : 1;
    float _1180 = -_1170;
    float _1182 = fma(_1082, 2.0, _1180);
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1186 = _1184 != 0;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1194 = _1192 != 0;
    int _1196 = ~as_type<int>(_1140);
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    float _1202 = -_128;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    int _1206 = _1164;
    int _1208 = _1200;
    float _1210 = _1132;
    float _1212 = _1140;
    if (!_1068)
    {
        int _1214 = ~as_type<int>(_1132);
        int _1216 = _1214 + 1;
        _1206 = _1216;
    }
    int _1218 = _1206;
    float _1220 = -_1092;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1224 = !_1190;
    int _1226 = _1224 ? 0 : 1;
    bool _1228 = !_1186;
    int _1230 = _1228 ? 0 : 1;
    int _1232 = abs(_1226);
    int _1234 = abs(_1230);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (!_1128)
    {
        int _1238 = ~as_type<int>(_1140);
        int _1240 = _1238 + 1;
        _1208 = _1240;
    }
    int _1242 = _1208;
    if (!_976)
    {
        _1210 = _972;
    }
    float _1244 = _1210;
    float _1246 = _1244;
    if (_976)
    {
        _1212 = _968;
    }
    float _1248 = _1212;
    float _1250 = _1248;
    if (_976)
    {
        _1246 = _968;
    }
    float _1252 = _1246;
    if (!_976)
    {
        _1250 = _964;
    }
    float _1254 = _1250;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1258 = float(_1218);
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1262 = float(_1232);
    float _1264 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1266 = float(_1242);
    float _1268 = fma(_1260, -2.0, _1256);
    float _1270 = float(_1144);
    float _1272 = _1262 * _1258;
    float _1274 = _1062 * _128;
    float _1276 = fma(_1264, -2.0, _1236);
    float _1278 = in.m_65.x;
    float _1280 = in.m_65.y;
    float _1282 = in.m_65.z;
    float _1284 = 1.0 / _1270;
    int _1286 = ~_1136;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    float _1292 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1268);
    int _1294 = _1290;
    if (!_1122)
    {
        int _1296 = ~_1136;
        int _1298 = _1296 + 1;
        _1294 = _1298;
    }
    int _1300 = _1294;
    float _1302 = _1272 * (-2.0);
    float _1304 = float(_1234);
    float _1306 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1276);
    float _1308 = exp2(_1274);
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1314 = 1.0 + _1312;
    float _1316 = _1304 * _1266;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1320 = _1316 * (-2.0);
    float _1322 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1324 = int(_1322);
    bool _1326 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1328 = isnan(1.0);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1334 = _1330 || _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1318);
    float _1352 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1336);
    float _1354 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1338);
    float _1356 = 1.0 / _1314;
    float _1358 = -_1308;
    float _1360 = _1358 + 1.0;
    float _1362 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1364 = fma(_1320, _1278, _1278);
    float _1366 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1310);
    bool _1368 = !_1194;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1354);
    float _1374 = _1348 ? _1360 : 0.0;
    float _1376 = _964 + (-0.5);
    float _1378 = float(_1324);
    float _1380 = -_1362;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1384 = _1284 * _128;
    float _1386 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1350);
    float _1388 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1352);
    float _1390 = _1378 * _128;
    float _1392 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1366);
    int _1394 = abs(_1370);
    float _1396 = _1362;
    if (_1334)
    {
        float _1398 = _1374 * _1356;
        _138 = _1398;
    }
    float _1400 = _138;
    float _1402 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1404 = fma(_1042, _1320, _1042);
    float _1406 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1364);
    float _1408 = _1382 * _1382;
    float _1410 = fma(_1302, _1280, _1280);
    float _1412 = fma(_1404, _1400, _1406);
    float _1414 = -_1402;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1418 = fma(_1222, _1222, _1408);
    float _1420 = _968 + (-0.5);
    float _1422 = fma(_1058, _1302, _1058);
    float _1424 = float(_1300);
    float _1426 = _1412 * 0.15915493667125701904296875;
    float _1428 = float(_1394);
    float _1430 = fma(_1416, _1416, _1418);
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1410);
    float _1434 = _964 + _972;
    float _1436 = _1428 * _1424;
    float _1438 = rsqrt(_1430);
    float _1440 = _1434 + (-1.0);
    float _1442 = fma(_1422, _1400, _1432);
    float _1444 = _1436 * (-2.0);
    float _1446 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1448 = _972 + (-0.5);
    float _1450 = fma(_1444, _1282, _1282);
    float _1452 = _1426 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1442 * 0.15915493667125701904296875;
    float _1458 = fma(_1446, _1444, _1446);
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1450);
    float _1462 = in.m_67.x;
    float _1464 = in.m_67.y;
    float _1466 = in.m_67.z;
    float _1468 = fma(_1458, _1400, _1460);
    float _1470 = _1222 * _1438;
    float _1472 = _1426 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    float _1476 = _1382 * _1438;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1480 = _1476 * _1478;
    float _1482 = _1456 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = _1416 * _1438;
    float _1488 = _1468 * 0.15915493667125701904296875;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1492 = _1470 * _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1496 = -_1480;
    float _1498 = fma(_1470, _1494, _1496);
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1502 = _1486 * _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1506 = -_1492;
    float _1508 = fma(_1486, _1504, _1506);
    float _1510 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1514 = -_1502;
    float _1516 = fma(_1476, _1512, _1514);
    float _1518 = _1508 * _1508;
    float _1520 = _1456 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1462);
    float _1526 = _1474 * _1484;
    float _1528 = _966 * _1524;
    float _1530 = _1488 * 6.283185482025146484375;
    float _1532 = cos(_1530);
    float _1534 = fma(_1516, _1516, _1518);
    float _1536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1464);
    float _1538 = _1454 * _1484;
    float _1540 = fma(_1498, _1498, _1534);
    float _1542 = _1510 * _1536;
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1466);
    float _1546 = _1488 * 6.283185482025146484375;
    float _1548 = sin(_1546);
    float _1550 = _1474 * _1522;
    float _1552 = _1454 * _1522;
    float _1554 = _986 * _1544;
    float _1556 = rsqrt(_1540);
    float _1558 = _1474 * _1532;
    float _1560 = _1454 * _1532;
    float _1562 = _1522 * _1532;
    float _1564 = _1484 * _1532;
    float _1566 = _1558 * _1542;
    float _1568 = fma(_1548, _1550, _1538);
    float _1570 = -_1526;
    float _1572 = fma(_1548, _1552, _1570);
    float _1574 = -_1552;
    float _1576 = fma(_1548, _1526, _1574);
    float _1578 = -_1542;
    float _1580 = _1548 * _1578;
    float _1582 = fma(_1568, _1528, _1566);
    float _1584 = _1560 * _1542;
    float _1586 = fma(_1548, _1538, _1550);
    float _1588 = fma(_1562, _1528, _1580);
    float _1590 = _1516 * _1556;
    float _1592 = _1508 * _1556;
    float _1594 = _1498 * _1556;
    float _1596 = fma(_1576, _1554, _1582);
    float _1598 = _1476 * _1590;
    float _1600 = _1486 * _1592;
    float _1602 = fma(_1572, _1528, _1584);
    float _1604 = fma(_1564, _1554, _1588);
    float _1606 = -_1598;
    float _1608 = fma(_1470, _1592, _1606);
    float _1610 = -_1600;
    float _1612 = fma(_1476, _1594, _1610);
    float _1614 = fma(_1586, _1554, _1602);
    float _1616 = _1608 * _1596;
    float _1618 = _1612 * _1596;
    float _1620 = fma(_1594, _1604, _1616);
    float _1622 = fma(_1590, _1604, _1618);
    float _1624 = fma(_1486, _1614, _1620);
    float _1626 = fma(_1470, _1614, _1622);
    float _1628 = _1402 + _1624;
    float _1630 = _1092 + _1626;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1634 = _1628 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1630 + _1636;
    float _1640 = _1634 * _1634;
    float _1642 = fma(_1638, _1638, _1640);
    float _1644 = _1470 * _1594;
    float _1646 = sqrt(_1642);
    float _1648 = -_1644;
    float _1650 = fma(_1486, _1590, _1648);
    float _1652 = _1650 * _1596;
    float _1654 = fma(_1592, _1604, _1652);
    float _1656 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1658 = fma(_1476, _1614, _1654);
    float _1660 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1656);
    bool _1662 = _1646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1362 + _1658;
    float _1666 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1660);
    float _1668 = _1660;
    float _1670 = _1614;
    float _1672 = _1658;
    float _1674 = _1634;
    if (!_1662)
    {
        _1668 = _1630;
    }
    float _1676 = _1668;
    float _1678 = _1676;
    if (!_1662)
    {
        _1670 = _1628;
    }
    float _1680 = _1670;
    float _1682 = _1680;
    if (!_1662)
    {
        _1672 = _1664;
    }
    float _1684 = _1672;
    bool _1686 = !_1662;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1646 + _1692;
        float _1696 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = rsqrt(_1642);
        float _1700 = _1694 * _1690;
        float _1702 = _1700 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1706 + (-1.0);
        float _1714 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = fma(_1710, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1718 = fma(_1664, _1706, _1714);
        float _1720 = _1698 * _1716;
        float _1722 = fma(_1638, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1724 = fma(_1634, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1718;
        _1678 = _1722;
        _1682 = _1724;
    }
    float _1726 = _1688;
    float _1728 = _1678;
    float _1730 = _1682;
    float _1732 = -_1362;
    float _1734 = _1732 + _1726;
    float _1736 = -_1092;
    float _1738 = _1736 + _1728;
    float _1740 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1742 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1744 = _1734 * _1734;
    float _1746 = -_1402;
    float _1748 = _1746 + _1730;
    float _1750 = 1.0 / _1740;
    float _1752 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1742);
    float _1754 = fma(_1738, _1738, _1744);
    float _1756 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1752);
    float _1758 = fma(_1748, _1748, _1754);
    bool _1760 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1762 = isnan(0.5);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1768 = _1764 || _1766;
    float _1770 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1772 = sqrt(_1758);
    bool _1774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1776 = isnan(0.5);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1782 = _1778 || _1780;
    float _1784 = _1770 + _1740;
    float _1786 = _1784 * _1750;
    float _1788 = _1786 * 0.5;
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1792 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1790);
    float _1794 = 1.0 / _1792;
    bool _1796 = _1772 > 0.0;
    bool _1798 = !_1796;
    float _1800 = _1726;
    float _1802 = _1730;
    float _1804 = _1728;
    float _1806 = _1792;
    if (!_1798)
    {
        float _1808 = _202 * _202;
        float _1810 = fma(_200, _200, _1808);
        float _1812 = fma(_204, _204, _1810);
        float _1814 = rsqrt(_1758);
        float _1816 = sqrt(_1812);
        float _1818 = _1738 * _1814;
        float _1820 = _1734 * _1814;
        float _1822 = _1748 * _1814;
        bool _1824 = _1816 > 0.0;
        bool _1826 = !_1824;
        if (!_1826)
        {
            float _1828 = rsqrt(_1812);
            float _1830 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1832 = _202 * _1828;
            float _1834 = _200 * _1828;
            float _1836 = _204 * _1828;
            float _1838 = _1820 * _1832;
            float _1840 = fma(_1818, _1834, _1838);
            float _1842 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1844 = fma(_1822, _1836, _1840);
            float _1846 = _1844 * _1842;
            float _1848 = fma(_200, _1846, _1728);
            float _1850 = fma(_202, _1846, _1726);
            float _1852 = fma(_204, _1846, _1730);
            _1800 = _1850;
            _1802 = _1852;
            _1804 = _1848;
            _1806 = _1838;
        }
    }
    float _1854 = _1800;
    float _1856 = _1802;
    float _1858 = _1804;
    float _1860 = _1806;
    float _1862 = _1860;
    float _1864 = _1854;
    float _1866 = _1858;
    float _1868 = _1856;
    if (_1782)
    {
        _1862 = 1.0;
    }
    float _1870 = _1862;
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1874 = _1794 * _1872;
    float _1876 = _1870;
    if (!_1768)
    {
        float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1880 = _1362 + _1878;
        float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1884 = _1092 + _1882;
        float _1886 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1888 = -_1362;
        float _1890 = _1888 + _1854;
        float _1892 = _1880 * _1880;
        float _1894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1896 = _1402 + _1894;
        float _1898 = -_1402;
        float _1900 = _1898 + _1856;
        float _1902 = fma(_1884, _1884, _1892);
        float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1906 = fma(_1896, _1896, _1902);
        float _1908 = sqrt(_1906);
        float _1910 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1912 = precise::min(_1908, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1914 = _1912 * _1904;
        float _1916 = _1910 * _1914;
        float _1918 = -_1092;
        float _1920 = _1918 + _1858;
        float _1922 = fma(_1890, _1916, _1362);
        float _1924 = fma(_1920, _1916, _1092);
        float _1926 = fma(_1900, _1916, _1402);
        _1864 = _1922;
        _1866 = _1924;
        _1868 = _1926;
    }
    float _1928 = _1864;
    float _1930 = _1866;
    float _1932 = _1868;
    if (!_1782)
    {
        float _1934 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1936 = _1934 * 0.15915493667125701904296875;
        float _1938 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1940 = _1936 * 6.283185482025146484375;
        float _1942 = cos(_1940);
        float _1944 = _1938 * 0.15915493667125701904296875;
        float _1946 = _1936 * 6.283185482025146484375;
        float _1948 = sin(_1946);
        float _1950 = 1.0 / _1942;
        float _1952 = _1944 * 6.283185482025146484375;
        float _1954 = cos(_1952);
        float _1956 = _1948 * _1950;
        float _1958 = _1944 * 6.283185482025146484375;
        float _1960 = sin(_1958);
        float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1964 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1962;
        float _1966 = _1954 * _1956;
        float _1968 = 1.0 / _1964;
        float _1970 = 1.0 / _1966;
        float _1972 = _1960 * _1970;
        float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1976 = fma(_1874, _1972, _1974);
        float _1978 = _1976 * _1968;
        float _1980 = precise::clamp(_1978, 0.0, 1.0);
        _1396 = _1956;
        _1876 = _1980;
    }
    float _1982 = _1396;
    float _1984 = _1876;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1928 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1930 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1996 = _1932 + _1994;
    float _1998 = _1988 * _1988;
    float _2000 = fma(_1992, _1992, _1998);
    float _2002 = fma(_1996, _1996, _2000);
    float _2004 = rsqrt(_2002);
    float _2006 = sqrt(_2002);
    float _2008 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2010 = _1992 * _2008;
    float _2012 = _1996 * _2008;
    float _2014 = _2010 * _2010;
    float _2016 = _2012 * _2012;
    float _2018 = _2014 + _2016;
    float _2020 = sqrt(_2018);
    bool _2022 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2026 = _2020 + _2024;
    float _2028 = _1996;
    float _2030 = _2018;
    float _2032 = _2026;
    float _2034 = _1982;
    if (_2022)
    {
        float _2036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2028 = _2036;
    }
    float _2038 = _2028;
    if (_2022)
    {
        float _2040 = rsqrt(_2018);
        _2030 = _2040;
    }
    float _2042 = _2030;
    float _2044 = _2042;
    if (_2022)
    {
        float _2046 = _2026 * _2038;
        _2032 = _2046;
    }
    float _2048 = _2032;
    if (_2022)
    {
        float _2050 = _2048 * 0.15915493667125701904296875;
        _2034 = _2050;
    }
    float _2052 = _2034;
    float _2054 = _2038;
    float _2056 = _2052;
    if (_2022)
    {
        float _2058 = _2052 * 6.283185482025146484375;
        float _2060 = sin(_2058);
        _2054 = _2060;
    }
    float _2062 = _2054;
    float _2064 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2066 = precise::max(0.0, _2064);
    float _2068 = _1998;
    float _2070 = _2066;
    if (_2022)
    {
        float _2072 = _2052 * 6.283185482025146484375;
        float _2074 = cos(_2072);
        _2068 = _2074;
    }
    float _2076 = _2068;
    float _2078 = -_2008;
    float _2080 = -_2066;
    float _2082 = fma(_1988, _2078, _2080);
    float _2084 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2022)
    {
        float _2086 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2070 = _2086;
    }
    float _2088 = _2070;
    float _2090 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2092 = _2088;
    if (!_2022)
    {
        _2084 = _2082;
    }
    float _2094 = _2084;
    float _2096 = _2062;
    float _2098 = _2094;
    if (_2022)
    {
        float _2100 = fma(_2062, _2088, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2096 = _2100;
    }
    float _2102 = _2096;
    float _2104 = floor(_2090);
    float _2106 = _2102;
    float _2108 = _2076;
    if (_2022)
    {
        float _2110 = _2076 + (-1.0);
        _2092 = _2110;
    }
    float _2112 = _2092;
    float _2114 = _2112;
    if (_2022)
    {
        float _2116 = _2042 * _2102;
        _1674 = _2116;
    }
    float _2118 = _1674;
    if (!_2022)
    {
        _2106 = _2010;
    }
    float _2120 = _2106;
    float _2122 = _2120;
    if (_2022)
    {
        float _2124 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2056 = _2124;
    }
    float _2126 = _2056;
    if (_2022)
    {
        float _2128 = _2010 * _2118;
        _2122 = _2128;
    }
    float _2130 = _2122;
    if (!_2022)
    {
        _2114 = _2012;
    }
    float _2132 = _2114;
    float _2134 = _2132;
    if (_2022)
    {
        float _2136 = _2012 * _2118;
        _2134 = _2136;
    }
    float _2138 = _2134;
    if (!_2022)
    {
        _2044 = _2014;
    }
    float _2140 = _2044;
    float _2142 = _2140;
    if (_2022)
    {
        float _2144 = fma(_2082, _2076, _2126);
        _2098 = _2144;
    }
    float _2146 = _2098;
    if (_2022)
    {
        float _2148 = _2130 * _2130;
        _2142 = _2148;
    }
    float _2150 = _2142;
    float _2152 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2022)
    {
        _2108 = _2016;
    }
    float _2154 = _2108;
    float _2156 = _2154;
    if (_2022)
    {
        float _2158 = _2138 * _2138;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = fma(_2146, _2146, _2150);
    float _2164 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2166 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2168 = _2162 + _2160;
    float _2170 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2172 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2166);
    float _2174 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2152);
    float _2176 = rsqrt(_2168);
    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2180 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2178);
    float _2182 = precise::clamp(_2180, 0.0, 1.0);
    float _2184 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2170);
    float _2186 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2172);
    float _2188 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2174);
    float _2190 = -_2182;
    float _2192 = _2190 + 1.0;
    float _2194 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2184);
    float _2196 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2198 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2200 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2202 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2204 = abs(_2192);
    float _2206 = log2(_2204);
    float _2208 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2210 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2198);
    float _2212 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2202);
    float _2214 = _2176 * _2130;
    float _2216 = _2176 * _2146;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2220 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2222 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2224 = _2176 * _2138;
    float _2226 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2210);
    float _2228 = -_2220;
    float _2230 = fma(_2228, _2218, 1.0);
    float _2232 = -_2222;
    float _2234 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2232);
    float _2236 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2212);
    float _2238 = _2226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2240 = -_2104;
    float _2242 = _2090 + _2240;
    float _2244 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2246 = -_2224;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2234);
    float _2250 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2236);
    float _2252 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2254 = log2(_2230);
    float _2256 = fma(_2248, -0.5, 0.5);
    float _2258 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2260 = fma(_2248, 0.5, 0.5);
    float _2262 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2252);
    float _2264 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2258);
    float _2266 = _2216 + 1.0;
    float _2268 = exp2(_2244);
    float _2270 = fma(_2260, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2272 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2262);
    float _2274 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2264);
    float _2276 = fma(_2260, _2270, -0.212114393711090087890625);
    float _2278 = sqrt(_2256);
    float _2280 = fma(_2260, _2276, 1.570728778839111328125);
    float _2282 = _2254 * 0.693147182464599609375;
    float _2284 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2286 = 1.0 / _2250;
    float _2288 = -_2216;
    float _2290 = fma(_2268, _2266, _2288);
    float _2292 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2272);
    float _2294 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2274);
    float _2296 = floor(_2164);
    float _2298 = _2278 * 0.636619746685028076171875;
    float _2300 = -_2280;
    float _2302 = fma(_2298, _2300, 1.0);
    float _2304 = fma(_2290, 0.5, 0.5);
    float _2306 = _2292 * _2286;
    float _2308 = _2294 * _2286;
    float _2310 = fma(_2306, 0.5, 0.5);
    float _2312 = fma(_2308, -0.5, 0.5);
    float _2314 = -_2296;
    float _2316 = _2164 + _2314;
    float2 _7634 = float2(_2242, _2316);
    float _2318 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7634, float2(0.0), isnan(_7634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7634, float2(0.0), isnan(_7634)), level(0.0)).x;
    float3 _7645 = float3(_2310, _2312, _2284);
    float _2320 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7645, float3(0.0), isnan(_7645)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7645, float3(0.0), isnan(_7645)), level(0.0)).x;
    float3 _7656 = float3(_2310, _2312, _2284);
    float4 _2323 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7656, float3(0.0), isnan(_7656)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7656, float3(0.0), isnan(_7656)), level(0.0)).xyzw;
    float _2325 = _2323.x;
    float _2327 = _2323.y;
    float _2329 = _2323.z;
    float _2331 = _2323.w;
    float2 _7672 = float2(_2302, _2304);
    float3 _2335 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7672, float2(0.0), isnan(_7672)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7672, float2(0.0), isnan(_7672)), level(0.0)).xyz;
    float _2337 = _2335.x;
    float _2339 = _2335.y;
    float _2341 = _2335.z;
    float _2343 = float(uint(_1324));
    float _2345 = trunc(_1384);
    int _2347 = int(_2345);
    float _2349 = in.m_69.y;
    float _2351 = _1390 * _166;
    bool _2353 = _968 > 0.5;
    float _2355 = in.m_69.x;
    int _2357 = ~_1324;
    int _2359 = _2357 + 1;
    float _2361 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2363 = 1.0 / _2343;
    int _2365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2367 = _2365 != 0;
    float _2369 = in.m_71.w;
    int _2371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2373 = _2371 != 0;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2377 = _2375 != 0;
    out.m_73.x = _1930;
    out.m_73.y = _1928;
    out.m_73.z = _1932;
    bool _2379 = _972 > 0.5;
    float _2381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2383 = float(uint(_2347));
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2387 = _2385 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2389 = as_type<int>(_2363) + (-2);
    float _2391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2393 = abs(_1168);
    float _2395 = as_type<float>(_2389) * _2383;
    int _2397 = abs(_1178);
    float _2399 = in.m_57.w;
    float _2401 = _2381 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2403 = trunc(_2395);
    float _2405 = precise::max(_2403, 0.0);
    uint _2408 = uint(_2405);
    out.m_75.w = _2369;
    float _2410 = 1.0 / _2387;
    float _2412 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2412;
    int _2416 = _2359 * int(_2408);
    int _2418 = _2416 + _2347;
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2422 = _2420 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2426 = float(uint(_2418));
    float _2428 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _2428;
    bool _2432 = _2399 > 0.5;
    float _2434 = as_type<float>(_2389) * _2426;
    float _2436 = 1.0 / _2430;
    float _2438 = _2399;
    float _2440 = _2349;
    bool _2442 = _2367;
    int _2444 = as_type<int>(_2391);
    float _2446 = _2355;
    float _2448 = _2250;
    float _2450 = _2294;
    float _2452 = _2292;
    if (!_2373)
    {
        _2438 = _2355;
    }
    float _2454 = _2438;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _2456;
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2464 = trunc(_2434);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    int _2470 = ~_1324;
    int _2472 = _2470 + 1;
    bool _2474 = !_976;
    float _2476 = _2474 ? 7.345489978790283203125 : 1.0;
    int _2478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2480 = _2478 != 0;
    float _2482 = 1.0 / _2458;
    float _2484 = -_2349;
    float _2486 = _2484 + 1.0;
    int _2488 = _2353 ? as_type<int>(_2486) : as_type<int>(_2349);
    int _2490 = _2379 ? as_type<int>(_2486) : as_type<int>(_2349);
    float _2492 = 1.0 / _2462;
    float _2494 = _2377 ? as_type<float>(_2488) : _2349;
    int _2496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2498 = _2496 != 0;
    int _2500 = int(_2408) + int(_2468);
    float _2502 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2504 = _2498 ? as_type<float>(_2490) : _2349;
    float _2506 = exp2(_2361);
    int _2508 = as_type<int>(_2486);
    float _2510 = _2454;
    if (_2367)
    {
        float _2512 = _2432 ? _2486 : _2349;
        _2440 = _2512;
    }
    float _2514 = _2440;
    if (_2373)
    {
        float _2516 = -_2355;
        float _2518 = _2516 + 1.0;
        _2508 = as_type<int>(_2518);
    }
    int _2520 = _2508;
    int _2522 = _2472 * _2500;
    int _2524 = _2522 + _2347;
    if (_2373)
    {
        bool _2526 = _964 > 0.5;
        _2442 = _2526;
    }
    bool _2528 = _2442;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2532 = _962 + _2530;
    int _2534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2536 = _2534 != 0;
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _2538;
    if (_2373)
    {
        float _2542 = _2528 ? as_type<float>(_2520) : _2355;
        _2510 = _2542;
    }
    float _2544 = _2510;
    float _2546 = _2532 * _2436;
    bool _2548 = uint(_2524) >= uint(_1324);
    float _2550 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2554 = 1.0 / _2540;
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2558 = _962 + _2556;
    bool _2560 = !_2548;
    int _2562 = _2560 ? 0 : (-1);
    float _2564 = _2476 * _964;
    int _2566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2568 = _2566 != 0;
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2570;
    float _2574 = _2558 * _2482;
    float _2576 = 1.0 / _2552;
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2580 = _962 + _2578;
    int _2582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2584 = _2582 != 0;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2588 = _962 + _2586;
    int _2590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2592 = _2590 != 0;
    float _2594 = _2580 * _2410;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2598 = _962 + _2596;
    float _2600 = 1.0 / _2572;
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2604 = _962 + _2602;
    float _2606 = _2598 * _2554;
    float _2608 = _2588 * _2492;
    float _2610 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _2610;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2616 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2614;
    float _2618 = fma(_2414, _2546, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2620 = _2604 * _2576;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _2622;
    float _2626 = fma(_2612, _2546, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2630 = _962 + _2628;
    float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2634 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2632;
    float _2636 = fma(_2616, _2574, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2638;
    float _2642 = fma(_2624, _2574, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _2644 = fma(_2634, _2546, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2646 = fma(_2640, _2574, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2650 = _2648 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2656 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2658 = _2656 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2662 = _2660 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2664 = _2630 * _2600;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _2668 = _2666 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2670 = fma(_2650, _2594, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2672 = fma(_2422, _2594, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2674 = fma(_2654, _2594, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2676;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2680;
    float _2684 = floor(_2564);
    float _2686 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2688 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _2686;
    float _2690 = fma(_2658, _2608, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2692 = fma(_2662, _2608, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2694 = fma(_2668, _2608, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _2696 = fma(_2678, _2606, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2698 = fma(_2682, _2606, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2702 = _2700 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2704 = fma(_2688, _2606, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2708 = _2706 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2710 = float(_2347);
    float _2712 = fma(_2702, _2620, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2718 = fma(_2708, _2620, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2720 = _2710 >= _1378;
    bool _2722 = isnan(_2710);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan(_1378);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = -_1120;
    float _2734 = fma(_1388, _2502, _2732);
    float _2736 = -_2684;
    float _2738 = _2564 + _2736;
    float _2740 = fma(_2716, _2620, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _2742 = fma(_2504, _2401, -0.5);
    float _2744 = trunc(_2730);
    int _2746 = int(_2744);
    float _2748 = _2738 * _1378;
    float _2750 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2752 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2750;
    float _2754 = -_1306;
    float _2756 = fma(_1392, _2742, _2754);
    int _2758 = ~_2500;
    int _2760 = _2758 + _2562;
    int _2762 = _2760 + 1;
    float _2764 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2766 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2764;
    float _2768 = trunc(_2748);
    int _2770 = int(_2768);
    float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2774 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _2772;
    bool _2776 = !_2568;
    int _2778 = _2776 ? 0 : 1;
    int _2780 = _1324 * _2762;
    int _2782 = _2780 + _2347;
    bool _2784 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2786 = isnan(_962);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = fma(_2752, _2664, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _2798 = _1324 == 0;
    float _2800 = fma(_2766, _2664, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2802 = fma(_2774, _2664, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    bool _2804 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2806 = isnan(_962);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2812 = _2808 || _2810;
    float _2814 = float(_2812);
    float _2816 = -_2506;
    float _2818 = _2816 + 1.0;
    int _2820 = abs(_2778);
    float _2822 = -_2794;
    float _2824 = _2822 + 1.0;
    int _2826 = ~_2746;
    int _2828 = _2826 + 1;
    int _2830 = _2828 + 1;
    float _2832 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2834 = !_2798;
    int _2836 = _2834 ? _2782 : (-1);
    float _2838 = _2814 * _2824;
    bool _2840 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2842 = isnan(_962);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2848 = _2844 || _2846;
    float _2850 = float(_2848);
    float _2852 = -_2814;
    float _2854 = _2852 + 1.0;
    int _2856 = _2770 * _2820;
    int _2858 = _2856 + _2347;
    int _2860 = _1324 + (-1);
    int _2862 = _2836 * _2830;
    bool _2864 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2866 = isnan(_962);
    bool _2868 = _2864 || _2866;
    bool _2870 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2872 = _2868 || _2870;
    float _2874 = float(_2872);
    float _2876 = -_2850;
    float _2878 = _2876 + 1.0;
    float _2880 = _2850 * _2854;
    bool _2882 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2884 = isnan(_962);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2890 = _2886 || _2888;
    float _2892 = float(_2890);
    float _2894 = trunc(_2351);
    int _2896 = int(_2894);
    float _2898 = _2874 * _2878;
    float _2900 = -_2874;
    float _2902 = _2900 + 1.0;
    int _2904 = _2746 * _2860;
    int _2906 = _2904 + _2862;
    bool _2908 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2910 = isnan(_962);
    bool _2912 = _2908 || _2910;
    bool _2914 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2916 = _2912 || _2914;
    float _2918 = float(_2916);
    float _2920 = _2892 * _2902;
    float _2922 = -_2892;
    float _2924 = _2922 + 1.0;
    int _2926 = abs(_1174);
    int _2928 = _2906 * _2393;
    bool _2930 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2932 = isnan(_962);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2938 = _2934 || _2936;
    float _2940 = float(_2938);
    float _2942 = _2918 * _2924;
    bool _2944 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2946 = isnan(_962);
    bool _2948 = _2944 || _2946;
    bool _2950 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2952 = _2948 || _2950;
    float _2954 = float(_2952);
    float _2956 = -_2918;
    float _2958 = _2956 + 1.0;
    float _2960 = -_2940;
    float _2962 = _2960 + 1.0;
    int _2964 = _2896 * _2926;
    int _2966 = _2964 + _2928;
    float _2968 = _2940 * _2958;
    float _2970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2972 = _2954 * _2962;
    bool _2974 = !_2536;
    float _2976 = _2974 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2978 = in.m_77.x;
    float _2980 = in.m_77.y;
    float _2982 = in.m_77.z;
    bool _2984 = _1464 != 0.0;
    bool _2986 = isnan(_1464);
    bool _2988 = _2984 || _2986;
    bool _2990 = isnan(0.0);
    bool _2992 = _2988 || _2990;
    float _2994 = _2644 * _2972;
    float _2996 = _2618 * _2972;
    float _2998 = _2626 * _2972;
    int _3000 = abs(as_type<int>(_2976));
    float _3002 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3004 = _2858 * _2397;
    int _3006 = _3004 + _2966;
    bool _3008 = _1462 == 0.0;
    bool _3010 = !_2992;
    bool _3012 = _3008 && _3010;
    int _3014 = _2966;
    float _3016 = _2626;
    float _3018 = _2976;
    int _3020 = as_type<int>(_2996);
    if (_2592)
    {
        float _3022 = -_2355;
        float _3024 = _3022 + 1.0;
        _3014 = as_type<int>(_3024);
    }
    int _3026 = _3014;
    float _3028 = fma(_3002, _2514, -0.5);
    int _3030 = _2770 * _3000;
    int _3032 = _3030 + _3006;
    bool _3034 = _1466 == 0.0;
    bool _3036 = _3034 && _3012;
    float _3038 = as_type<float>(_3026);
    if (_2480)
    {
        float _3040 = -_2355;
        float _3042 = _3040 + 1.0;
        _2444 = as_type<int>(_3042);
    }
    int _3044 = _2444;
    float _3046 = -_2954;
    float _3048 = _3046 + 1.0;
    float _3050 = _3048;
    if (!_2592)
    {
        _3016 = _2355;
    }
    float _3052 = _3016;
    float _3054 = -_1292;
    float _3056 = fma(_1134, _3028, _3054);
    float _3058 = float(uint(_3032));
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2994);
    float _3062 = _3052;
    float _3064 = _3058;
    if (!_2480)
    {
        _3018 = _2355;
    }
    float _3066 = _3018;
    float _3068 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[159].z, _2998);
    float _3070 = _3066;
    if (_2592)
    {
        float _3072 = _2379 ? as_type<float>(_3026) : _2355;
        _3062 = _3072;
    }
    float _3074 = _3062;
    float _3076 = as_type<float>(_2389) * _3058;
    if (_2480)
    {
        float _3078 = _2353 ? as_type<float>(_3044) : _2355;
        _3070 = _3078;
    }
    float _3080 = _3070;
    float _3082 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2996);
    float _3084 = _2980;
    float _3086 = _2978;
    if (_3036)
    {
        _2446 = _2980;
    }
    float _3088 = _2446;
    float _3090 = fma(_2674, _2968, _3068);
    float _3092 = _3088;
    if (_3036)
    {
        _3050 = _2982;
    }
    float _3094 = _3050;
    float _3096 = trunc(_3076);
    float _3098 = precise::max(_3096, 0.0);
    uint _3100 = uint(_3098);
    float _3102 = _3094;
    if (_3036)
    {
        _3064 = _3088;
    }
    float _3104 = _3064;
    float _3106 = _3104;
    if (_3036)
    {
        float _3108 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3088);
        _3038 = _3108;
    }
    float _3110 = _3038;
    float _3112 = _3110;
    if (!_3036)
    {
        _3092 = _2980;
    }
    float _3114 = _3092;
    if (_3036)
    {
        float _3116 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3094);
        _3020 = as_type<int>(_3116);
    }
    int _3118 = _3020;
    int _3120 = _3118;
    if (_3036)
    {
        _3084 = _3094;
    }
    float _3122 = _3084;
    float _3124 = fma(_2672, _2968, _3082);
    float _3126 = _3122;
    if (!_3036)
    {
        _3102 = _2982;
    }
    float _3128 = _3102;
    if (!_3036)
    {
        float _3130 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3114);
        _3112 = _3130;
    }
    float _3132 = _3112;
    float _3134 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3136 = ~_1324;
    int _3138 = _3136 + 1;
    if (!_3036)
    {
        float _3140 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2978);
        _3086 = _3140;
    }
    float _3142 = _3086;
    float _3144 = float(uint(_2858));
    float _3146 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3148 = fma(_3134, _3080, -0.5);
    int _3150 = _3138 * int(_3100);
    int _3152 = _3150 + _3032;
    float _3154 = fma(_2670, _2968, _3060);
    float _3156 = as_type<float>(_2389) * _3144;
    float _3158 = fma(_1386, _3146, _1056);
    int _3160 = ~_1324;
    int _3162 = _3160 + 1;
    float _3164 = fma(_1372, _3148, _1204);
    float _3166 = float(uint(_3152));
    float _3168 = _2970 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3170 = trunc(_3156);
    float _3172 = precise::max(_3170, 0.0);
    uint _3174 = uint(_3172);
    int _3176 = ~_1324;
    int _3178 = _3176 + 1;
    if (!_3036)
    {
        float _3180 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3128);
        _3120 = as_type<int>(_3180);
    }
    int _3182 = _3120;
    float _3184 = as_type<float>(_2389) * _3166;
    float _3186 = fma(_3168, _3074, -0.5);
    float _3188 = _3158 + 0.5;
    if (!_3036)
    {
        _3106 = _3132;
    }
    float _3190 = _3106;
    float _3192 = fma(_2636, _2942, _3154);
    float _3194 = trunc(_3184);
    float _3196 = precise::max(_3194, 0.0);
    uint _3198 = uint(_3196);
    float _3200 = fma(_1158, _3186, _1126);
    bool _3202 = !_3036;
    float _3204 = _3202 ? _3132 : _3114;
    float _3206 = fma(_2646, _2942, _3124);
    bool _3208 = !_3036;
    float _3210 = _3208 ? as_type<float>(_3182) : _3128;
    float _3212 = _3200 + 0.5;
    float _3214 = fma(_2642, _2942, _3090);
    float _3216 = _3204 * _3204;
    int _3218 = _3162 * int(_3174);
    int _3220 = _3218 + _2858;
    float _3222 = _2734 + 0.5;
    float _3224 = fma(_2690, _2920, _3192);
    float _3226 = fma(_3210, _3210, _3216);
    float _3228 = fma(_2692, _2920, _3206);
    float _3230 = float(uint(_3220));
    float _3232 = fma(_2694, _2920, _3214);
    float _3234 = fma(_2696, _2898, _3224);
    int _3236 = int(_3100) + int(_3198);
    float _3238 = rsqrt(_3226);
    float _3240 = as_type<float>(_2389) * _3230;
    float _3242 = _3056 + 0.5;
    float _3244 = fma(_2698, _2898, _3228);
    int _3246 = _3178 * _3236;
    int _3248 = _3246 + _3032;
    float _3250 = fma(_2704, _2898, _3232);
    float _3252 = fma(_2712, _2880, _3234);
    out.m_79.x = _3188;
    out.m_79.y = _3222;
    out.m_79.z = _3212;
    out.m_79.w = _3242;
    float _3254 = abs(_1874);
    float _3256 = log2(_3254);
    bool _3258 = uint(_3248) >= uint(_1324);
    float _3260 = fma(_2718, _2880, _3244);
    float _3262 = fma(_2740, _2880, _3250);
    float _3264 = _1558 * _1650;
    bool _3266 = !_3258;
    int _3268 = _3266 ? 0 : (-1);
    float _3270 = _1568 * _1608;
    float _3272 = _1576 * _1608;
    float _3274 = trunc(_3240);
    float _3276 = precise::max(_3274, 0.0);
    uint _3278 = uint(_3276);
    int _3280 = ~_3236;
    int _3282 = _3280 + _3268;
    int _3284 = _3282 + 1;
    float _3286 = _3210 * _3238;
    float _3288 = fma(_2796, _2838, _3252);
    float _3290 = fma(_2800, _2838, _3260);
    float _3292 = _3164 + 0.5;
    int _3294 = _1324 * _3284;
    int _3296 = _3294 + _3032;
    int _3298 = ~_1324;
    int _3300 = _3298 + 1;
    float _3302 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3304 = _2756 + 0.5;
    if (!_3036)
    {
        _3126 = as_type<float>(_3182);
    }
    float _3306 = _3126;
    float _3308 = _1558 * _1612;
    bool _3310 = !_2798;
    int _3312 = _3310 ? _3296 : (-1);
    float _3314 = fma(_1562, _1594, _3270);
    float _3316 = exp2(_3302);
    float _3318 = fma(_2802, _2838, _3262);
    int _3320 = _3312 >> 31;
    out.m_81.x = _3292;
    out.m_81.y = _3304;
    int _3322 = int(_3174) + int(_3278);
    float _3324 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[166].z, _3318);
    int _3326 = _3320 & 3;
    float _3328 = _3204 * _3238;
    float _3330 = _1568 * _1650;
    int _3332 = _3300 * _3322;
    int _3334 = _3332 + _2858;
    int _3336 = _3312 + _3326;
    float _3338 = _1576 * _1650;
    int _3340 = _3312 & 3;
    bool _3342 = _3340 != 0;
    float _3344 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3288);
    bool _3346 = uint(_3334) >= uint(_1324);
    float _3348 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3350 = precise::clamp(_3348, 0.0, 1.0);
    float _3352 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[166].y, _3290);
    int _3354 = _3336 >> 2;
    float _3356 = -_1548;
    float _3358 = fma(_3356, _1590, _3308);
    bool _3360 = !_3346;
    int _3362 = _3360 ? 0 : (-1);
    float _3364 = fma(_3350, -2.0, 3.0);
    float _3366 = _3350 * _3350;
    int _3368 = _3354 << 4;
    int _3370 = _3368 + 368;
    out.m_83.x = _3344;
    out.m_83.y = _3352;
    out.m_83.z = _3324;
    int _3372 = ~_3322;
    int _3374 = _3372 + _3362;
    int _3376 = _3374 + 1;
    float _3378 = _3366 * _3364;
    float _3380 = _1568 * _1612;
    uint _3382 = uint(int(uint(_3370) >> uint(2)));
    uint _3384 = uint(int(uint(int(_3382)) >> uint(2)));
    int _3386 = int(_3382) & 3;
    float _3388 = (*spvDescriptorSet0.vp_c9)._m0[int(_3384)][_3386];
    int _3390 = int(_3382) + 1;
    uint _3392 = uint(int(uint(_3390) >> uint(2)));
    int _3394 = _3390 & 3;
    float _3396 = (*spvDescriptorSet0.vp_c9)._m0[int(_3392)][_3394];
    float _3398 = _1576 * _1612;
    int _3400 = _1324 * _3376;
    int _3402 = _3400 + _2858;
    int _3404 = _3312 & 3;
    bool _3406 = _3404 != 0;
    float _3408 = _1558 * _1608;
    float _3410 = fma(_1562, _1590, _3380);
    float _3412 = fma(_1562, _1592, _3330);
    bool _3414 = uint(_3404) > 1u;
    int _3416 = _3370 + 8;
    uint _3418 = uint(int(uint(_3416) >> uint(2)));
    uint _3420 = uint(int(uint(int(_3418)) >> uint(2)));
    int _3422 = int(_3418) & 3;
    float _3424 = (*spvDescriptorSet0.vp_c9)._m0[int(_3420)][_3422];
    int _3426 = int(_3418) + 1;
    uint _3428 = uint(int(uint(_3426) >> uint(2)));
    int _3430 = _3426 & 3;
    float _3432 = (*spvDescriptorSet0.vp_c9)._m0[int(_3428)][_3430];
    int _3434 = _3342 ? 0 : 1;
    float _3436 = -_3378;
    float _3438 = _3436 + 1.0;
    float _3440 = -_1548;
    float _3442 = fma(_3440, _1592, _3264);
    float _3444 = -_1548;
    float _3446 = fma(_3444, _1594, _3408);
    int _3448 = ~_3434;
    int _3450 = _3448 + 1;
    int _3452 = _3450 + 1;
    float _3454 = fma(_3438, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3378);
    float _3456 = fma(_1560, _1476, _3442);
    float _3458 = fma(_1560, _1470, _3358);
    float _3460 = fma(_1560, _1486, _3446);
    float _3462 = fma(_1564, _1592, _3338);
    float _3464 = fma(_1564, _1594, _3272);
    int _3466 = _3452;
    if (!_3414)
    {
        int _3468 = ~_3434;
        int _3470 = _3468 + 1;
        _3466 = _3470;
    }
    int _3472 = _3466;
    float _3474 = fma(_1564, _1590, _3398);
    bool _3476 = _3404 != 3;
    float _3478 = fma(_1586, _1476, _3462);
    bool _3480 = !_3406;
    int _3482 = _3480 ? 0 : 1;
    float _3484 = fma(_1586, _1486, _3464);
    int _3486 = abs(_3472);
    float _3488 = fma(_1586, _1470, _3474);
    bool _3490 = uint(_3404) >= 2u;
    float _3492 = _2832 * _2320;
    int _3494 = abs(_3482);
    float _3496 = -_2832;
    float _3498 = _3496 + 1.0;
    float _3500 = -_2318;
    float _3502 = _3500 + 1.0;
    int _3504 = _3490 ? 0 : 1;
    int _3506 = ~_3486;
    int _3508 = _3506 + 1;
    int _3510 = _3508 + 1;
    int _3512 = ~_3504;
    int _3514 = _3512 + 1;
    int _3516 = _3514 + 1;
    int _3518 = _3516;
    if (_3476)
    {
        int _3520 = ~_3504;
        int _3522 = _3520 + 1;
        _3518 = _3522;
    }
    int _3524 = _3518;
    float _3526 = fma(_1572, _1486, _3314);
    int _3528 = ~_3494;
    int _3530 = _3528 + 1;
    int _3532 = _3530 + 1;
    float _3534 = _3458 * _3190;
    bool _3536 = _3404 != 3;
    int _3538 = abs(_3524);
    int _3540 = _3510 * as_type<int>(_3396);
    bool _3542 = !_2584;
    int _3544 = _3542 ? 0 : 1;
    bool _3546 = _1874 <= 8000.0;
    bool _3548 = isnan(_1874);
    bool _3550 = _3546 || _3548;
    bool _3552 = isnan(8000.0);
    bool _3554 = _3550 || _3552;
    float _3556 = float(_3554);
    int _3558 = _3532 * as_type<int>(_3388);
    int _3560 = _3558 + _3540;
    float _3562 = fma(_1572, _1470, _3410);
    float _3564 = fma(_1572, _1476, _3412);
    bool _3566 = !_3536;
    int _3568 = _3566 ? 0 : (-1);
    float _3570 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3572 = _3456 * _3190;
    int _3574 = abs(_3544);
    out.m_85.x = _3562;
    out.m_85.y = _3564;
    out.m_85.z = _3526;
    int _3576 = abs(_3568);
    float _3578 = fma(_3562, _3142, _3534);
    int _3580 = ~_3538;
    int _3582 = _3580 + 1;
    int _3584 = _3582 + 1;
    float _3586 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3570);
    int _3588 = ~_3576;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = fma(_3564, _3142, _3572);
    float _3596 = _3460 * _3190;
    int _3598 = _3584 * as_type<int>(_3424);
    int _3600 = _3598 + _3560;
    int _3602 = ~_3574;
    int _3604 = _3602 + 1;
    int _3606 = _3604 + 1;
    float _3608 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3586);
    float _3610 = fma(_3526, _3142, _3596);
    int _3612 = _3592 * as_type<int>(_3432);
    int _3614 = _3612 + _3600;
    float _3616 = -_3488;
    float _3618 = _3328 * _3616;
    float _3620 = -_3478;
    float _3622 = _3328 * _3620;
    float _3624 = -_3484;
    float _3626 = _3328 * _3624;
    bool _3628 = !_2798;
    int _3630 = _3628 ? _3402 : (-1);
    int _3632 = _3614 * _3606;
    float _3634 = fma(_3286, _3458, _3618);
    float _3636 = fma(_3286, _3456, _3622);
    float _3638 = fma(_3286, _3460, _3626);
    int _3640 = _3630 * _3574;
    int _3642 = _3640 + _3632;
    float _3644 = in.m_87.x;
    float _3646 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3608);
    float _3648 = _2250 * 0.5;
    float _3650 = _2292 + _2250;
    out.m_89.x = _3634;
    out.m_89.y = _3636;
    out.m_89.z = _3638;
    float _3652 = _3646 + _2250;
    float _3654 = _2341 * _3492;
    float _3656 = _3556 * _3454;
    float _3658 = fma(_2294, -0.5, _3648);
    float _3660 = _3652 * 0.5;
    float _3662 = _3650 * 0.5;
    float _3664 = fma(_3488, _3306, _3578);
    float _3666 = fma(_3478, _3306, _3594);
    float _3668 = fma(_3484, _3306, _3610);
    float _3670 = _2331 * _3498;
    float _3672 = _2331 * _3492;
    float _3674 = fma(_2331, _3654, _2329);
    float _3676 = _3656 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _3662;
    out.m_91.y = _3658;
    out.m_91.z = _3660;
    out.m_91.w = _2250;
    float _3678 = fma(_2337, _3672, _2325);
    float _3680 = fma(_2339, _3672, _2327);
    out.m_93.x = _3664;
    out.m_93.y = _3666;
    out.m_93.z = _3668;
    float _3682 = _3502 * _3676;
    float _3684 = precise::clamp(_3682, 0.0, 1.0);
    bool _3686 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3688 = isnan(_2006);
    bool _3690 = _3686 || _3688;
    bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3694 = _3690 || _3692;
    float _3696 = _1984 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _3678;
    out.m_95.y = _3680;
    out.m_95.z = _3674;
    out.m_95.w = _3670;
    float _3698 = -_3684;
    float _3700 = fma(_3698, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3702 = float(_3642);
    out.gl_Position.x = _2292;
    out.gl_Position.y = _2294;
    out.gl_Position.z = _3646;
    out.gl_Position.w = _2250;
    float _3704 = _3700 * _3644;
    out.m_97.x = _3702;
    float _3706 = _3704 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3708 = _3704;
    float _3710 = _3646;
    float _3712 = _3706;
    if (!_3694)
    {
        _3708 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3714 = _3708;
    float _3716 = _3714;
    float _3718 = _3714;
    if (!_3694)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3720 = _2448;
    out.m_99.x = _3706;
    float _3722 = _3720;
    float _3724 = _3720;
    if (!_3694)
    {
        _3710 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3726 = _3710;
    float _3728 = _3726;
    float _3730 = _3726;
    if (!_3694)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3732 = _2450;
    float _3734 = _3732;
    float _3736 = _3732;
    if (!_3694)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3738 = _2452;
    float _3740 = _3738;
    float _3742 = _3738;
    if (!_3694)
    {
        _3712 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3744 = _3712;
    bool _3746 = !_3694;
    float _3748 = _3744;
    float _3750 = _3744;
    if (!_3746)
    {
        bool _3752 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3754 = isnan(_2006);
        bool _3756 = _3752 || _3754;
        bool _3758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3760 = _3756 || _3758;
        if (!_3760)
        {
            float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3764 = _2006 + _3762;
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3772 = _3770 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3774 = 1.0 / _3768;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3792 = _3764 * _3774;
            float _3794 = precise::clamp(_3792, 0.0, 1.0);
            float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3800 = fma(_3794, _3772, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3802 = fma(_3794, _3798, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3804 = fma(_3794, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3806 = fma(_3794, _3782, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3808 = fma(_3794, _3786, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3810 = fma(_3794, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3724 = _3804;
            _3742 = _3808;
            _3718 = _3800;
            _3736 = _3806;
            _3730 = _3802;
            _3750 = _3810;
            _3812 = true;
        }
        else
        {
            bool _3814 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3816 = isnan(_2006);
            bool _3818 = _3814 || _3816;
            bool _3820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3822 = _3818 || _3820;
            if (!_3822)
            {
                _3716 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3824 = _3716;
            _3718 = _3824;
            if (!_3822)
            {
                _3722 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3826 = _3722;
            _3724 = _3826;
            if (!_3822)
            {
                _3728 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3828 = _3728;
            _3730 = _3828;
            if (!_3822)
            {
                _3734 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3830 = _3734;
            _3736 = _3830;
            if (!_3822)
            {
                _3740 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3832 = _3740;
            _3742 = _3832;
            if (!_3822)
            {
                _3748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3834 = _3748;
            bool _3836 = !_3822;
            _3750 = _3834;
            if (!_3836)
            {
                bool _3838 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3840 = isnan(_2006);
                bool _3842 = _3838 || _3840;
                bool _3844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3846 = _3842 || _3844;
                if (!_3846)
                {
                    float _3848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3850 = _2006 + _3848;
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3852;
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3858 = _3856 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3860 = 1.0 / _3854;
                    float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3866 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3878 = _3850 * _3860;
                    float _3880 = precise::clamp(_3878, 0.0, 1.0);
                    float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3886 = fma(_3880, _3858, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3888 = fma(_3880, _3884, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3890 = fma(_3880, _3864, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3892 = fma(_3880, _3868, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3894 = fma(_3880, _3872, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3896 = fma(_3880, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3724 = _3890;
                    _3742 = _3894;
                    _3718 = _3886;
                    _3736 = _3892;
                    _3730 = _3888;
                    _3750 = _3896;
                    _3812 = true;
                }
                else
                {
                    _3724 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3742 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3718 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3736 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3730 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3812 = false;
    float _3898 = _3724;
    float _3900 = _3742;
    float _3902 = _3718;
    float _3904 = _3736;
    float _3906 = _3730;
    float _3908 = _3750;
    float _3910 = _3696 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3912 = fma(_3666, -0.5, 0.5);
    float _3914 = precise::clamp(_3912, 0.0, 1.0);
    float _3916 = -_3898;
    float _3918 = _3916 + _3900;
    float _3920 = -_3902;
    float _3922 = _3920 + _3904;
    out.m_53.x = _3910;
    float _3924 = fma(_3914, _3918, _3898);
    float _3926 = -_3906;
    float _3928 = _3926 + _3908;
    float _3930 = fma(_3914, _3922, _3902);
    float _3932 = _3924 * 0.586610972881317138671875;
    bool _3934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3936 = fma(_3914, _3928, _3906);
    out.m_101.x = 0.0;
    float _3938 = fma(_3930, 0.298911988735198974609375, _3932);
    bool _3940 = _1984 > 0.0;
    bool _3942 = isnan(_1984);
    bool _3944 = _3940 || _3942;
    bool _3946 = isnan(0.0);
    bool _3948 = _3944 || _3946;
    float _3950 = fma(_3936, 0.114477999508380889892578125, _3938);
    float _3952 = -_3950;
    float _3954 = _3930 + _3952;
    float _3956 = -_3950;
    float _3958 = _3924 + _3956;
    float _3960 = -_3950;
    float _3962 = _3936 + _3960;
    float _3964 = fma(_3954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3950);
    float _3966 = fma(_3958, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3950);
    float _3968 = fma(_3962, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3950);
    bool _3970 = !_3934;
    if (!_3970)
    {
        float _3972 = -_1928;
        float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3976 = -_1930;
        float _3978 = _3976 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3980 = -_1932;
        float _3982 = _3980 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3984 = _3974 * _3974;
        float _3986 = fma(_3978, _3978, _3984);
        float _3988 = fma(_3982, _3982, _3986);
        float _3990 = sqrt(_3988);
        float _3992 = rsqrt(_3988);
        float _3994 = -_3990;
        float _3996 = _3994 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3998 = _3996 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4000 = precise::clamp(_3998, 0.0, 1.0);
        float _4002 = _3978 * _3992;
        float _4004 = _3974 * _3992;
        float _4006 = abs(_4000);
        float _4008 = log2(_4006);
        float _4010 = _3982 * _3992;
        float _4012 = _4002 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4014 = _3666 * _4004;
        float _4016 = -_4004;
        float _4018 = -_4012;
        float _4020 = fma(_4016, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4018);
        float _4022 = fma(_3664, _4002, _4014);
        float _4024 = -_4010;
        float _4026 = fma(_4024, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4020);
        float _4028 = fma(_3668, _4010, _4022);
        float _4030 = precise::clamp(_4028, 0.0, 1.0);
        float _4032 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4034 = _4026 + _4032;
        float _4036 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4038 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4040 = precise::clamp(_4038, 0.0, 1.0);
        float _4042 = exp2(_4036);
        float _4044 = _4042 * _4040;
        float _4046 = _4030 * _4044;
        float _4048 = _4046 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4050 = _4046 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4052 = _4046 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _4048;
        out.m_101.y = _4050;
        out.m_101.z = _4052;
    }
    out.m_103.x = _3964;
    out.m_103.y = _3966;
    out.m_103.z = _3968;
    if (_3948)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _4054 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4054;
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
    bool _3812 = false;
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
        float _4122 = as_type<float>(_146);
        out.gl_Position.z = _4122;
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
        float _4185 = as_type<float>(_178);
        out.gl_Position.z = _4185;
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
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _806 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _808 = isnan(_792);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _822 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _824 = isnan(_792);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = 1.0 / _800;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _836;
    float _840 = -_816;
    float _842 = _840 + 1.0;
    bool _844 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _846 = isnan(_792);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    bool _856 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _858 = 1.0 / _804;
    float _860 = 1.0 / _820;
    float _862 = _838 * _834;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _868 = _832 * _842;
    float _870 = -_832;
    float _872 = _870 + 1.0;
    float _874 = fma(_862, _796, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _876 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _878 = isnan(_792);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = _854 * _872;
    float _890 = _866 * _858;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _894 = _792 + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _896;
    float _900 = _874 * _888;
    float _902 = -_854;
    float _904 = _902 + 1.0;
    float _906 = fma(_890, _894, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _908 = -_886;
    float _910 = _908 + 1.0;
    float _912 = _898 * _860;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _916 = _792 + _914;
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[131].x, _900);
    float _920 = _816 * _910;
    float _922 = fma(_912, _916, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _924 = fma(_906, _868, _918);
    float _926 = fma(_922, _920, _924);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _934 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[134].x, _926);
    float _936 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _934 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _936;
    out.m_63.y = _940;
    out.m_63.z = _938;
    out.m_63.w = _942;
    bool _944 = !_856;
    if (!_944)
    {
        float _946 = in.m_57.x;
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _950 = _946 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _954 = _952 * _948;
        float _956 = floor(_954);
        float _958 = -_956;
        float _960 = _954 + _958;
        _174 = _960;
    }
    float _962 = _174;
    float _964 = in.m_57.x;
    float _966 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _968 = in.m_57.y;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _972 = in.m_57.z;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _976 = _974 != 0;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = in.m_46.x;
    float _982 = in.m_46.y;
    float _984 = in.m_46.z;
    float _986 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _988 = _964 * 2.0;
    float _990 = _964 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _992 = _968 * 2.0;
    float _994 = _968 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _996 = floor(_988);
    float _998 = -_970;
    float _1000 = fma(_990, 2.0, _998);
    float _1002 = _972 * 2.0;
    float _1004 = fma(_994, -2.0, _978);
    float _1006 = _964 + _968;
    float _1008 = _968 + _972;
    float _1010 = _982 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1012 = _982 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1014 = floor(_992);
    float _1016 = _982 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1018 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1010);
    float _1020 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1012);
    float _1022 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1016);
    float _1024 = _1006 + (-1.0);
    float _1026 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1028 = floor(_1002);
    float _1030 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1020);
    float _1032 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1022);
    float _1034 = _980;
    float _1036 = _984;
    float _1038 = _1022;
    if (_976)
    {
        _1034 = _964;
    }
    float _1040 = _1034;
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1044 = _1040;
    if (!_976)
    {
        _1036 = _968;
    }
    float _1046 = _1036;
    float _1048 = _1008 + (-1.0);
    float _1050 = _1046;
    if (!_976)
    {
        _1044 = _972;
    }
    float _1052 = _1044;
    float _1054 = -_128;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1000);
    float _1058 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1060 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1062 = log2(_1060);
    if (_976)
    {
        _1050 = _964;
    }
    float _1064 = _1050;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1068 = _996 > 0.0;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1072 = _996 >= 0.0;
    bool _1074 = isnan(_996);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    float _1082 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_976)
    {
        _1038 = _972;
    }
    float _1084 = _1038;
    float _1086 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1088 = _1084;
    if (_976)
    {
        _1088 = _968;
    }
    float _1090 = _1088;
    float _1092 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1094 = _1014 >= 0.0;
    bool _1096 = isnan(_1014);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    float _1104 = -_1066;
    float _1106 = fma(_1086, 2.0, _1104);
    bool _1108 = _1028 >= 0.0;
    bool _1110 = isnan(_1028);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan(0.0);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1070);
    float _1120 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1004);
    bool _1122 = _1014 > 0.0;
    float _1124 = -_128;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1106);
    bool _1128 = _1028 > 0.0;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1132 = _1080 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1134 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1118);
    int _1136 = _1102 ? 0 : 1;
    float _1138 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1130);
    float _1140 = _1116 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1142 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1144 = int(_1142);
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1156 = _1154 != 0;
    float _1158 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1138);
    int _1160 = ~as_type<int>(_1132);
    int _1162 = _1160 + 1;
    int _1164 = _1162 + 1;
    bool _1166 = !_1152;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1172 = !_1148;
    int _1174 = _1172 ? 0 : 1;
    bool _1176 = !_1156;
    int _1178 = _1176 ? 0 : 1;
    float _1180 = -_1170;
    float _1182 = fma(_1082, 2.0, _1180);
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1186 = _1184 != 0;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1194 = _1192 != 0;
    int _1196 = ~as_type<int>(_1140);
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    float _1202 = -_128;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    int _1206 = _1164;
    int _1208 = _1200;
    float _1210 = _1132;
    float _1212 = _1140;
    if (!_1068)
    {
        int _1214 = ~as_type<int>(_1132);
        int _1216 = _1214 + 1;
        _1206 = _1216;
    }
    int _1218 = _1206;
    float _1220 = -_1092;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1224 = !_1190;
    int _1226 = _1224 ? 0 : 1;
    bool _1228 = !_1186;
    int _1230 = _1228 ? 0 : 1;
    int _1232 = abs(_1226);
    int _1234 = abs(_1230);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (!_1128)
    {
        int _1238 = ~as_type<int>(_1140);
        int _1240 = _1238 + 1;
        _1208 = _1240;
    }
    int _1242 = _1208;
    if (!_976)
    {
        _1210 = _972;
    }
    float _1244 = _1210;
    float _1246 = _1244;
    if (_976)
    {
        _1212 = _968;
    }
    float _1248 = _1212;
    float _1250 = _1248;
    if (_976)
    {
        _1246 = _968;
    }
    float _1252 = _1246;
    if (!_976)
    {
        _1250 = _964;
    }
    float _1254 = _1250;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1258 = float(_1218);
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1262 = float(_1232);
    float _1264 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1266 = float(_1242);
    float _1268 = fma(_1260, -2.0, _1256);
    float _1270 = float(_1144);
    float _1272 = _1262 * _1258;
    float _1274 = _1062 * _128;
    float _1276 = fma(_1264, -2.0, _1236);
    float _1278 = in.m_65.x;
    float _1280 = in.m_65.y;
    float _1282 = in.m_65.z;
    float _1284 = 1.0 / _1270;
    int _1286 = ~_1136;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    float _1292 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1268);
    int _1294 = _1290;
    if (!_1122)
    {
        int _1296 = ~_1136;
        int _1298 = _1296 + 1;
        _1294 = _1298;
    }
    int _1300 = _1294;
    float _1302 = _1272 * (-2.0);
    float _1304 = float(_1234);
    float _1306 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1276);
    float _1308 = exp2(_1274);
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1314 = 1.0 + _1312;
    float _1316 = _1304 * _1266;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1320 = _1316 * (-2.0);
    float _1322 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1324 = int(_1322);
    bool _1326 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1328 = isnan(1.0);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1334 = _1330 || _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1318);
    float _1352 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1336);
    float _1354 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1338);
    float _1356 = 1.0 / _1314;
    float _1358 = -_1308;
    float _1360 = _1358 + 1.0;
    float _1362 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1364 = fma(_1320, _1278, _1278);
    float _1366 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1310);
    bool _1368 = !_1194;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1354);
    float _1374 = _1348 ? _1360 : 0.0;
    float _1376 = _964 + (-0.5);
    float _1378 = float(_1324);
    float _1380 = -_1362;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1384 = _1284 * _128;
    float _1386 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1350);
    float _1388 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1352);
    float _1390 = _1378 * _128;
    float _1392 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1366);
    int _1394 = abs(_1370);
    float _1396 = _1362;
    if (_1334)
    {
        float _1398 = _1374 * _1356;
        _138 = _1398;
    }
    float _1400 = _138;
    float _1402 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1404 = fma(_1042, _1320, _1042);
    float _1406 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1364);
    float _1408 = _1382 * _1382;
    float _1410 = fma(_1302, _1280, _1280);
    float _1412 = fma(_1404, _1400, _1406);
    float _1414 = -_1402;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1418 = fma(_1222, _1222, _1408);
    float _1420 = _968 + (-0.5);
    float _1422 = fma(_1058, _1302, _1058);
    float _1424 = float(_1300);
    float _1426 = _1412 * 0.15915493667125701904296875;
    float _1428 = float(_1394);
    float _1430 = fma(_1416, _1416, _1418);
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1410);
    float _1434 = _964 + _972;
    float _1436 = _1428 * _1424;
    float _1438 = rsqrt(_1430);
    float _1440 = _1434 + (-1.0);
    float _1442 = fma(_1422, _1400, _1432);
    float _1444 = _1436 * (-2.0);
    float _1446 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1448 = _972 + (-0.5);
    float _1450 = fma(_1444, _1282, _1282);
    float _1452 = _1426 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1442 * 0.15915493667125701904296875;
    float _1458 = fma(_1446, _1444, _1446);
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1450);
    float _1462 = in.m_67.x;
    float _1464 = in.m_67.y;
    float _1466 = in.m_67.z;
    float _1468 = fma(_1458, _1400, _1460);
    float _1470 = _1222 * _1438;
    float _1472 = _1426 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    float _1476 = _1382 * _1438;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1480 = _1476 * _1478;
    float _1482 = _1456 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = _1416 * _1438;
    float _1488 = _1468 * 0.15915493667125701904296875;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1492 = _1470 * _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1496 = -_1480;
    float _1498 = fma(_1470, _1494, _1496);
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1502 = _1486 * _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1506 = -_1492;
    float _1508 = fma(_1486, _1504, _1506);
    float _1510 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1514 = -_1502;
    float _1516 = fma(_1476, _1512, _1514);
    float _1518 = _1508 * _1508;
    float _1520 = _1456 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1462);
    float _1526 = _1474 * _1484;
    float _1528 = _966 * _1524;
    float _1530 = _1488 * 6.283185482025146484375;
    float _1532 = cos(_1530);
    float _1534 = fma(_1516, _1516, _1518);
    float _1536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1464);
    float _1538 = _1454 * _1484;
    float _1540 = fma(_1498, _1498, _1534);
    float _1542 = _1510 * _1536;
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1466);
    float _1546 = _1488 * 6.283185482025146484375;
    float _1548 = sin(_1546);
    float _1550 = _1474 * _1522;
    float _1552 = _1454 * _1522;
    float _1554 = _986 * _1544;
    float _1556 = rsqrt(_1540);
    float _1558 = _1474 * _1532;
    float _1560 = _1454 * _1532;
    float _1562 = _1522 * _1532;
    float _1564 = _1484 * _1532;
    float _1566 = _1558 * _1542;
    float _1568 = fma(_1548, _1550, _1538);
    float _1570 = -_1526;
    float _1572 = fma(_1548, _1552, _1570);
    float _1574 = -_1552;
    float _1576 = fma(_1548, _1526, _1574);
    float _1578 = -_1542;
    float _1580 = _1548 * _1578;
    float _1582 = fma(_1568, _1528, _1566);
    float _1584 = _1560 * _1542;
    float _1586 = fma(_1548, _1538, _1550);
    float _1588 = fma(_1562, _1528, _1580);
    float _1590 = _1516 * _1556;
    float _1592 = _1508 * _1556;
    float _1594 = _1498 * _1556;
    float _1596 = fma(_1576, _1554, _1582);
    float _1598 = _1476 * _1590;
    float _1600 = _1486 * _1592;
    float _1602 = fma(_1572, _1528, _1584);
    float _1604 = fma(_1564, _1554, _1588);
    float _1606 = -_1598;
    float _1608 = fma(_1470, _1592, _1606);
    float _1610 = -_1600;
    float _1612 = fma(_1476, _1594, _1610);
    float _1614 = fma(_1586, _1554, _1602);
    float _1616 = _1608 * _1596;
    float _1618 = _1612 * _1596;
    float _1620 = fma(_1594, _1604, _1616);
    float _1622 = fma(_1590, _1604, _1618);
    float _1624 = fma(_1486, _1614, _1620);
    float _1626 = fma(_1470, _1614, _1622);
    float _1628 = _1402 + _1624;
    float _1630 = _1092 + _1626;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1634 = _1628 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1630 + _1636;
    float _1640 = _1634 * _1634;
    float _1642 = fma(_1638, _1638, _1640);
    float _1644 = _1470 * _1594;
    float _1646 = sqrt(_1642);
    float _1648 = -_1644;
    float _1650 = fma(_1486, _1590, _1648);
    float _1652 = _1650 * _1596;
    float _1654 = fma(_1592, _1604, _1652);
    float _1656 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1658 = fma(_1476, _1614, _1654);
    float _1660 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1656);
    bool _1662 = _1646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1362 + _1658;
    float _1666 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1660);
    float _1668 = _1660;
    float _1670 = _1614;
    float _1672 = _1658;
    float _1674 = _1634;
    if (!_1662)
    {
        _1668 = _1630;
    }
    float _1676 = _1668;
    float _1678 = _1676;
    if (!_1662)
    {
        _1670 = _1628;
    }
    float _1680 = _1670;
    float _1682 = _1680;
    if (!_1662)
    {
        _1672 = _1664;
    }
    float _1684 = _1672;
    bool _1686 = !_1662;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1646 + _1692;
        float _1696 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = rsqrt(_1642);
        float _1700 = _1694 * _1690;
        float _1702 = _1700 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1706 + (-1.0);
        float _1714 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = fma(_1710, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1718 = fma(_1664, _1706, _1714);
        float _1720 = _1698 * _1716;
        float _1722 = fma(_1638, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1724 = fma(_1634, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1718;
        _1678 = _1722;
        _1682 = _1724;
    }
    float _1726 = _1688;
    float _1728 = _1678;
    float _1730 = _1682;
    float _1732 = -_1362;
    float _1734 = _1732 + _1726;
    float _1736 = -_1092;
    float _1738 = _1736 + _1728;
    float _1740 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1742 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1744 = _1734 * _1734;
    float _1746 = -_1402;
    float _1748 = _1746 + _1730;
    float _1750 = 1.0 / _1740;
    float _1752 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1742);
    float _1754 = fma(_1738, _1738, _1744);
    float _1756 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1752);
    float _1758 = fma(_1748, _1748, _1754);
    bool _1760 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1762 = isnan(0.5);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1768 = _1764 || _1766;
    float _1770 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1772 = sqrt(_1758);
    bool _1774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1776 = isnan(0.5);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1782 = _1778 || _1780;
    float _1784 = _1770 + _1740;
    float _1786 = _1784 * _1750;
    float _1788 = _1786 * 0.5;
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1792 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1790);
    float _1794 = 1.0 / _1792;
    bool _1796 = _1772 > 0.0;
    bool _1798 = !_1796;
    float _1800 = _1726;
    float _1802 = _1730;
    float _1804 = _1728;
    float _1806 = _1792;
    if (!_1798)
    {
        float _1808 = _202 * _202;
        float _1810 = fma(_200, _200, _1808);
        float _1812 = fma(_204, _204, _1810);
        float _1814 = rsqrt(_1758);
        float _1816 = sqrt(_1812);
        float _1818 = _1738 * _1814;
        float _1820 = _1734 * _1814;
        float _1822 = _1748 * _1814;
        bool _1824 = _1816 > 0.0;
        bool _1826 = !_1824;
        if (!_1826)
        {
            float _1828 = rsqrt(_1812);
            float _1830 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1832 = _202 * _1828;
            float _1834 = _200 * _1828;
            float _1836 = _204 * _1828;
            float _1838 = _1820 * _1832;
            float _1840 = fma(_1818, _1834, _1838);
            float _1842 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1844 = fma(_1822, _1836, _1840);
            float _1846 = _1844 * _1842;
            float _1848 = fma(_200, _1846, _1728);
            float _1850 = fma(_202, _1846, _1726);
            float _1852 = fma(_204, _1846, _1730);
            _1800 = _1850;
            _1802 = _1852;
            _1804 = _1848;
            _1806 = _1838;
        }
    }
    float _1854 = _1800;
    float _1856 = _1802;
    float _1858 = _1804;
    float _1860 = _1806;
    float _1862 = _1860;
    float _1864 = _1854;
    float _1866 = _1858;
    float _1868 = _1856;
    if (_1782)
    {
        _1862 = 1.0;
    }
    float _1870 = _1862;
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1874 = _1794 * _1872;
    float _1876 = _1870;
    if (!_1768)
    {
        float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1880 = _1362 + _1878;
        float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1884 = _1092 + _1882;
        float _1886 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1888 = -_1362;
        float _1890 = _1888 + _1854;
        float _1892 = _1880 * _1880;
        float _1894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1896 = _1402 + _1894;
        float _1898 = -_1402;
        float _1900 = _1898 + _1856;
        float _1902 = fma(_1884, _1884, _1892);
        float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1906 = fma(_1896, _1896, _1902);
        float _1908 = sqrt(_1906);
        float _1910 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1912 = precise::min(_1908, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1914 = _1912 * _1904;
        float _1916 = _1910 * _1914;
        float _1918 = -_1092;
        float _1920 = _1918 + _1858;
        float _1922 = fma(_1890, _1916, _1362);
        float _1924 = fma(_1920, _1916, _1092);
        float _1926 = fma(_1900, _1916, _1402);
        _1864 = _1922;
        _1866 = _1924;
        _1868 = _1926;
    }
    float _1928 = _1864;
    float _1930 = _1866;
    float _1932 = _1868;
    if (!_1782)
    {
        float _1934 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1936 = _1934 * 0.15915493667125701904296875;
        float _1938 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1940 = _1936 * 6.283185482025146484375;
        float _1942 = cos(_1940);
        float _1944 = _1938 * 0.15915493667125701904296875;
        float _1946 = _1936 * 6.283185482025146484375;
        float _1948 = sin(_1946);
        float _1950 = 1.0 / _1942;
        float _1952 = _1944 * 6.283185482025146484375;
        float _1954 = cos(_1952);
        float _1956 = _1948 * _1950;
        float _1958 = _1944 * 6.283185482025146484375;
        float _1960 = sin(_1958);
        float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1964 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1962;
        float _1966 = _1954 * _1956;
        float _1968 = 1.0 / _1964;
        float _1970 = 1.0 / _1966;
        float _1972 = _1960 * _1970;
        float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1976 = fma(_1874, _1972, _1974);
        float _1978 = _1976 * _1968;
        float _1980 = precise::clamp(_1978, 0.0, 1.0);
        _1396 = _1956;
        _1876 = _1980;
    }
    float _1982 = _1396;
    float _1984 = _1876;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1928 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1930 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1996 = _1932 + _1994;
    float _1998 = _1988 * _1988;
    float _2000 = fma(_1992, _1992, _1998);
    float _2002 = fma(_1996, _1996, _2000);
    float _2004 = rsqrt(_2002);
    float _2006 = sqrt(_2002);
    float _2008 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2010 = _1992 * _2008;
    float _2012 = _1996 * _2008;
    float _2014 = _2010 * _2010;
    float _2016 = _2012 * _2012;
    float _2018 = _2014 + _2016;
    float _2020 = sqrt(_2018);
    bool _2022 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2026 = _2020 + _2024;
    float _2028 = _1996;
    float _2030 = _2018;
    float _2032 = _2026;
    float _2034 = _1982;
    if (_2022)
    {
        float _2036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2028 = _2036;
    }
    float _2038 = _2028;
    if (_2022)
    {
        float _2040 = rsqrt(_2018);
        _2030 = _2040;
    }
    float _2042 = _2030;
    float _2044 = _2042;
    if (_2022)
    {
        float _2046 = _2026 * _2038;
        _2032 = _2046;
    }
    float _2048 = _2032;
    if (_2022)
    {
        float _2050 = _2048 * 0.15915493667125701904296875;
        _2034 = _2050;
    }
    float _2052 = _2034;
    float _2054 = _2038;
    float _2056 = _2052;
    if (_2022)
    {
        float _2058 = _2052 * 6.283185482025146484375;
        float _2060 = sin(_2058);
        _2054 = _2060;
    }
    float _2062 = _2054;
    float _2064 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2066 = precise::max(0.0, _2064);
    float _2068 = _1998;
    float _2070 = _2066;
    if (_2022)
    {
        float _2072 = _2052 * 6.283185482025146484375;
        float _2074 = cos(_2072);
        _2068 = _2074;
    }
    float _2076 = _2068;
    float _2078 = -_2008;
    float _2080 = -_2066;
    float _2082 = fma(_1988, _2078, _2080);
    float _2084 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2022)
    {
        float _2086 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2070 = _2086;
    }
    float _2088 = _2070;
    float _2090 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2092 = _2088;
    if (!_2022)
    {
        _2084 = _2082;
    }
    float _2094 = _2084;
    float _2096 = _2062;
    float _2098 = _2094;
    if (_2022)
    {
        float _2100 = fma(_2062, _2088, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2096 = _2100;
    }
    float _2102 = _2096;
    float _2104 = floor(_2090);
    float _2106 = _2102;
    float _2108 = _2076;
    if (_2022)
    {
        float _2110 = _2076 + (-1.0);
        _2092 = _2110;
    }
    float _2112 = _2092;
    float _2114 = _2112;
    if (_2022)
    {
        float _2116 = _2042 * _2102;
        _1674 = _2116;
    }
    float _2118 = _1674;
    if (!_2022)
    {
        _2106 = _2010;
    }
    float _2120 = _2106;
    float _2122 = _2120;
    if (_2022)
    {
        float _2124 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2056 = _2124;
    }
    float _2126 = _2056;
    if (_2022)
    {
        float _2128 = _2010 * _2118;
        _2122 = _2128;
    }
    float _2130 = _2122;
    if (!_2022)
    {
        _2114 = _2012;
    }
    float _2132 = _2114;
    float _2134 = _2132;
    if (_2022)
    {
        float _2136 = _2012 * _2118;
        _2134 = _2136;
    }
    float _2138 = _2134;
    if (!_2022)
    {
        _2044 = _2014;
    }
    float _2140 = _2044;
    float _2142 = _2140;
    if (_2022)
    {
        float _2144 = fma(_2082, _2076, _2126);
        _2098 = _2144;
    }
    float _2146 = _2098;
    if (_2022)
    {
        float _2148 = _2130 * _2130;
        _2142 = _2148;
    }
    float _2150 = _2142;
    float _2152 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2022)
    {
        _2108 = _2016;
    }
    float _2154 = _2108;
    float _2156 = _2154;
    if (_2022)
    {
        float _2158 = _2138 * _2138;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = fma(_2146, _2146, _2150);
    float _2164 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2166 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2168 = _2162 + _2160;
    float _2170 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2172 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2166);
    float _2174 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2152);
    float _2176 = rsqrt(_2168);
    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2180 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2178);
    float _2182 = precise::clamp(_2180, 0.0, 1.0);
    float _2184 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2170);
    float _2186 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2172);
    float _2188 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2174);
    float _2190 = -_2182;
    float _2192 = _2190 + 1.0;
    float _2194 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2184);
    float _2196 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2198 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2200 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2202 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2204 = abs(_2192);
    float _2206 = log2(_2204);
    float _2208 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2210 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2198);
    float _2212 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2202);
    float _2214 = _2176 * _2130;
    float _2216 = _2176 * _2146;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2220 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2222 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2224 = _2176 * _2138;
    float _2226 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2210);
    float _2228 = -_2220;
    float _2230 = fma(_2228, _2218, 1.0);
    float _2232 = -_2222;
    float _2234 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2232);
    float _2236 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2212);
    float _2238 = _2226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2240 = -_2104;
    float _2242 = _2090 + _2240;
    float _2244 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2246 = -_2224;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2234);
    float _2250 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2236);
    float _2252 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2254 = log2(_2230);
    float _2256 = fma(_2248, -0.5, 0.5);
    float _2258 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2260 = fma(_2248, 0.5, 0.5);
    float _2262 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2252);
    float _2264 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2258);
    float _2266 = _2216 + 1.0;
    float _2268 = exp2(_2244);
    float _2270 = fma(_2260, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2272 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2262);
    float _2274 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2264);
    float _2276 = fma(_2260, _2270, -0.212114393711090087890625);
    float _2278 = sqrt(_2256);
    float _2280 = fma(_2260, _2276, 1.570728778839111328125);
    float _2282 = _2254 * 0.693147182464599609375;
    float _2284 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2286 = 1.0 / _2250;
    float _2288 = -_2216;
    float _2290 = fma(_2268, _2266, _2288);
    float _2292 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2272);
    float _2294 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2274);
    float _2296 = floor(_2164);
    float _2298 = _2278 * 0.636619746685028076171875;
    float _2300 = -_2280;
    float _2302 = fma(_2298, _2300, 1.0);
    float _2304 = fma(_2290, 0.5, 0.5);
    float _2306 = _2292 * _2286;
    float _2308 = _2294 * _2286;
    float _2310 = fma(_2306, 0.5, 0.5);
    float _2312 = fma(_2308, -0.5, 0.5);
    float _2314 = -_2296;
    float _2316 = _2164 + _2314;
    float2 _7634 = float2(_2242, _2316);
    float _2318 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7634, float2(0.0), isnan(_7634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7634, float2(0.0), isnan(_7634)), level(0.0)).x;
    float3 _7645 = float3(_2310, _2312, _2284);
    float _2320 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7645, float3(0.0), isnan(_7645)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7645, float3(0.0), isnan(_7645)), level(0.0)).x;
    float3 _7656 = float3(_2310, _2312, _2284);
    float4 _2323 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7656, float3(0.0), isnan(_7656)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7656, float3(0.0), isnan(_7656)), level(0.0)).xyzw;
    float _2325 = _2323.x;
    float _2327 = _2323.y;
    float _2329 = _2323.z;
    float _2331 = _2323.w;
    float2 _7672 = float2(_2302, _2304);
    float3 _2335 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7672, float2(0.0), isnan(_7672)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7672, float2(0.0), isnan(_7672)), level(0.0)).xyz;
    float _2337 = _2335.x;
    float _2339 = _2335.y;
    float _2341 = _2335.z;
    float _2343 = float(uint(_1324));
    float _2345 = trunc(_1384);
    int _2347 = int(_2345);
    float _2349 = in.m_69.y;
    float _2351 = _1390 * _166;
    bool _2353 = _968 > 0.5;
    float _2355 = in.m_69.x;
    int _2357 = ~_1324;
    int _2359 = _2357 + 1;
    float _2361 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2363 = 1.0 / _2343;
    int _2365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2367 = _2365 != 0;
    float _2369 = in.m_71.w;
    int _2371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2373 = _2371 != 0;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2377 = _2375 != 0;
    out.m_73.x = _1930;
    out.m_73.y = _1928;
    out.m_73.z = _1932;
    bool _2379 = _972 > 0.5;
    float _2381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2383 = float(uint(_2347));
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2387 = _2385 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2389 = as_type<int>(_2363) + (-2);
    float _2391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2393 = abs(_1168);
    float _2395 = as_type<float>(_2389) * _2383;
    int _2397 = abs(_1178);
    float _2399 = in.m_57.w;
    float _2401 = _2381 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2403 = trunc(_2395);
    float _2405 = precise::max(_2403, 0.0);
    uint _2408 = uint(_2405);
    out.m_75.w = _2369;
    float _2410 = 1.0 / _2387;
    float _2412 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2412;
    int _2416 = _2359 * int(_2408);
    int _2418 = _2416 + _2347;
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2422 = _2420 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2426 = float(uint(_2418));
    float _2428 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _2428;
    bool _2432 = _2399 > 0.5;
    float _2434 = as_type<float>(_2389) * _2426;
    float _2436 = 1.0 / _2430;
    float _2438 = _2399;
    float _2440 = _2349;
    bool _2442 = _2367;
    int _2444 = as_type<int>(_2391);
    float _2446 = _2355;
    float _2448 = _2250;
    float _2450 = _2294;
    float _2452 = _2292;
    if (!_2373)
    {
        _2438 = _2355;
    }
    float _2454 = _2438;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _2456;
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2464 = trunc(_2434);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    int _2470 = ~_1324;
    int _2472 = _2470 + 1;
    bool _2474 = !_976;
    float _2476 = _2474 ? 7.345489978790283203125 : 1.0;
    int _2478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2480 = _2478 != 0;
    float _2482 = 1.0 / _2458;
    float _2484 = -_2349;
    float _2486 = _2484 + 1.0;
    int _2488 = _2353 ? as_type<int>(_2486) : as_type<int>(_2349);
    int _2490 = _2379 ? as_type<int>(_2486) : as_type<int>(_2349);
    float _2492 = 1.0 / _2462;
    float _2494 = _2377 ? as_type<float>(_2488) : _2349;
    int _2496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2498 = _2496 != 0;
    int _2500 = int(_2408) + int(_2468);
    float _2502 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2504 = _2498 ? as_type<float>(_2490) : _2349;
    float _2506 = exp2(_2361);
    int _2508 = as_type<int>(_2486);
    float _2510 = _2454;
    if (_2367)
    {
        float _2512 = _2432 ? _2486 : _2349;
        _2440 = _2512;
    }
    float _2514 = _2440;
    if (_2373)
    {
        float _2516 = -_2355;
        float _2518 = _2516 + 1.0;
        _2508 = as_type<int>(_2518);
    }
    int _2520 = _2508;
    int _2522 = _2472 * _2500;
    int _2524 = _2522 + _2347;
    if (_2373)
    {
        bool _2526 = _964 > 0.5;
        _2442 = _2526;
    }
    bool _2528 = _2442;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2532 = _962 + _2530;
    int _2534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2536 = _2534 != 0;
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _2538;
    if (_2373)
    {
        float _2542 = _2528 ? as_type<float>(_2520) : _2355;
        _2510 = _2542;
    }
    float _2544 = _2510;
    float _2546 = _2532 * _2436;
    bool _2548 = uint(_2524) >= uint(_1324);
    float _2550 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2554 = 1.0 / _2540;
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2558 = _962 + _2556;
    bool _2560 = !_2548;
    int _2562 = _2560 ? 0 : (-1);
    float _2564 = _2476 * _964;
    int _2566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2568 = _2566 != 0;
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2570;
    float _2574 = _2558 * _2482;
    float _2576 = 1.0 / _2552;
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2580 = _962 + _2578;
    int _2582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2584 = _2582 != 0;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2588 = _962 + _2586;
    int _2590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2592 = _2590 != 0;
    float _2594 = _2580 * _2410;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2598 = _962 + _2596;
    float _2600 = 1.0 / _2572;
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2604 = _962 + _2602;
    float _2606 = _2598 * _2554;
    float _2608 = _2588 * _2492;
    float _2610 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _2610;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2616 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2614;
    float _2618 = fma(_2414, _2546, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2620 = _2604 * _2576;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _2622;
    float _2626 = fma(_2612, _2546, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2630 = _962 + _2628;
    float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2634 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2632;
    float _2636 = fma(_2616, _2574, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2638;
    float _2642 = fma(_2624, _2574, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _2644 = fma(_2634, _2546, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2646 = fma(_2640, _2574, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2650 = _2648 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2656 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2658 = _2656 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2662 = _2660 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2664 = _2630 * _2600;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _2668 = _2666 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2670 = fma(_2650, _2594, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2672 = fma(_2422, _2594, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2674 = fma(_2654, _2594, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2676;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2680;
    float _2684 = floor(_2564);
    float _2686 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2688 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _2686;
    float _2690 = fma(_2658, _2608, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2692 = fma(_2662, _2608, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2694 = fma(_2668, _2608, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _2696 = fma(_2678, _2606, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2698 = fma(_2682, _2606, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2702 = _2700 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2704 = fma(_2688, _2606, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2708 = _2706 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2710 = float(_2347);
    float _2712 = fma(_2702, _2620, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2718 = fma(_2708, _2620, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2720 = _2710 >= _1378;
    bool _2722 = isnan(_2710);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan(_1378);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = -_1120;
    float _2734 = fma(_1388, _2502, _2732);
    float _2736 = -_2684;
    float _2738 = _2564 + _2736;
    float _2740 = fma(_2716, _2620, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _2742 = fma(_2504, _2401, -0.5);
    float _2744 = trunc(_2730);
    int _2746 = int(_2744);
    float _2748 = _2738 * _1378;
    float _2750 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2752 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2750;
    float _2754 = -_1306;
    float _2756 = fma(_1392, _2742, _2754);
    int _2758 = ~_2500;
    int _2760 = _2758 + _2562;
    int _2762 = _2760 + 1;
    float _2764 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2766 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2764;
    float _2768 = trunc(_2748);
    int _2770 = int(_2768);
    float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2774 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _2772;
    bool _2776 = !_2568;
    int _2778 = _2776 ? 0 : 1;
    int _2780 = _1324 * _2762;
    int _2782 = _2780 + _2347;
    bool _2784 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2786 = isnan(_962);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = fma(_2752, _2664, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _2798 = _1324 == 0;
    float _2800 = fma(_2766, _2664, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2802 = fma(_2774, _2664, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    bool _2804 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2806 = isnan(_962);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2812 = _2808 || _2810;
    float _2814 = float(_2812);
    float _2816 = -_2506;
    float _2818 = _2816 + 1.0;
    int _2820 = abs(_2778);
    float _2822 = -_2794;
    float _2824 = _2822 + 1.0;
    int _2826 = ~_2746;
    int _2828 = _2826 + 1;
    int _2830 = _2828 + 1;
    float _2832 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2834 = !_2798;
    int _2836 = _2834 ? _2782 : (-1);
    float _2838 = _2814 * _2824;
    bool _2840 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2842 = isnan(_962);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2848 = _2844 || _2846;
    float _2850 = float(_2848);
    float _2852 = -_2814;
    float _2854 = _2852 + 1.0;
    int _2856 = _2770 * _2820;
    int _2858 = _2856 + _2347;
    int _2860 = _1324 + (-1);
    int _2862 = _2836 * _2830;
    bool _2864 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2866 = isnan(_962);
    bool _2868 = _2864 || _2866;
    bool _2870 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2872 = _2868 || _2870;
    float _2874 = float(_2872);
    float _2876 = -_2850;
    float _2878 = _2876 + 1.0;
    float _2880 = _2850 * _2854;
    bool _2882 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2884 = isnan(_962);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2890 = _2886 || _2888;
    float _2892 = float(_2890);
    float _2894 = trunc(_2351);
    int _2896 = int(_2894);
    float _2898 = _2874 * _2878;
    float _2900 = -_2874;
    float _2902 = _2900 + 1.0;
    int _2904 = _2746 * _2860;
    int _2906 = _2904 + _2862;
    bool _2908 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2910 = isnan(_962);
    bool _2912 = _2908 || _2910;
    bool _2914 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2916 = _2912 || _2914;
    float _2918 = float(_2916);
    float _2920 = _2892 * _2902;
    float _2922 = -_2892;
    float _2924 = _2922 + 1.0;
    int _2926 = abs(_1174);
    int _2928 = _2906 * _2393;
    bool _2930 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2932 = isnan(_962);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2938 = _2934 || _2936;
    float _2940 = float(_2938);
    float _2942 = _2918 * _2924;
    bool _2944 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2946 = isnan(_962);
    bool _2948 = _2944 || _2946;
    bool _2950 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2952 = _2948 || _2950;
    float _2954 = float(_2952);
    float _2956 = -_2918;
    float _2958 = _2956 + 1.0;
    float _2960 = -_2940;
    float _2962 = _2960 + 1.0;
    int _2964 = _2896 * _2926;
    int _2966 = _2964 + _2928;
    float _2968 = _2940 * _2958;
    float _2970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2972 = _2954 * _2962;
    bool _2974 = !_2536;
    float _2976 = _2974 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2978 = in.m_77.x;
    float _2980 = in.m_77.y;
    float _2982 = in.m_77.z;
    bool _2984 = _1464 != 0.0;
    bool _2986 = isnan(_1464);
    bool _2988 = _2984 || _2986;
    bool _2990 = isnan(0.0);
    bool _2992 = _2988 || _2990;
    float _2994 = _2644 * _2972;
    float _2996 = _2618 * _2972;
    float _2998 = _2626 * _2972;
    int _3000 = abs(as_type<int>(_2976));
    float _3002 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3004 = _2858 * _2397;
    int _3006 = _3004 + _2966;
    bool _3008 = _1462 == 0.0;
    bool _3010 = !_2992;
    bool _3012 = _3008 && _3010;
    int _3014 = _2966;
    float _3016 = _2626;
    float _3018 = _2976;
    int _3020 = as_type<int>(_2996);
    if (_2592)
    {
        float _3022 = -_2355;
        float _3024 = _3022 + 1.0;
        _3014 = as_type<int>(_3024);
    }
    int _3026 = _3014;
    float _3028 = fma(_3002, _2514, -0.5);
    int _3030 = _2770 * _3000;
    int _3032 = _3030 + _3006;
    bool _3034 = _1466 == 0.0;
    bool _3036 = _3034 && _3012;
    float _3038 = as_type<float>(_3026);
    if (_2480)
    {
        float _3040 = -_2355;
        float _3042 = _3040 + 1.0;
        _2444 = as_type<int>(_3042);
    }
    int _3044 = _2444;
    float _3046 = -_2954;
    float _3048 = _3046 + 1.0;
    float _3050 = _3048;
    if (!_2592)
    {
        _3016 = _2355;
    }
    float _3052 = _3016;
    float _3054 = -_1292;
    float _3056 = fma(_1134, _3028, _3054);
    float _3058 = float(uint(_3032));
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2994);
    float _3062 = _3052;
    float _3064 = _3058;
    if (!_2480)
    {
        _3018 = _2355;
    }
    float _3066 = _3018;
    float _3068 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[159].z, _2998);
    float _3070 = _3066;
    if (_2592)
    {
        float _3072 = _2379 ? as_type<float>(_3026) : _2355;
        _3062 = _3072;
    }
    float _3074 = _3062;
    float _3076 = as_type<float>(_2389) * _3058;
    if (_2480)
    {
        float _3078 = _2353 ? as_type<float>(_3044) : _2355;
        _3070 = _3078;
    }
    float _3080 = _3070;
    float _3082 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2996);
    float _3084 = _2980;
    float _3086 = _2978;
    if (_3036)
    {
        _2446 = _2980;
    }
    float _3088 = _2446;
    float _3090 = fma(_2674, _2968, _3068);
    float _3092 = _3088;
    if (_3036)
    {
        _3050 = _2982;
    }
    float _3094 = _3050;
    float _3096 = trunc(_3076);
    float _3098 = precise::max(_3096, 0.0);
    uint _3100 = uint(_3098);
    float _3102 = _3094;
    if (_3036)
    {
        _3064 = _3088;
    }
    float _3104 = _3064;
    float _3106 = _3104;
    if (_3036)
    {
        float _3108 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3088);
        _3038 = _3108;
    }
    float _3110 = _3038;
    float _3112 = _3110;
    if (!_3036)
    {
        _3092 = _2980;
    }
    float _3114 = _3092;
    if (_3036)
    {
        float _3116 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3094);
        _3020 = as_type<int>(_3116);
    }
    int _3118 = _3020;
    int _3120 = _3118;
    if (_3036)
    {
        _3084 = _3094;
    }
    float _3122 = _3084;
    float _3124 = fma(_2672, _2968, _3082);
    float _3126 = _3122;
    if (!_3036)
    {
        _3102 = _2982;
    }
    float _3128 = _3102;
    if (!_3036)
    {
        float _3130 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3114);
        _3112 = _3130;
    }
    float _3132 = _3112;
    float _3134 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3136 = ~_1324;
    int _3138 = _3136 + 1;
    if (!_3036)
    {
        float _3140 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2978);
        _3086 = _3140;
    }
    float _3142 = _3086;
    float _3144 = float(uint(_2858));
    float _3146 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3148 = fma(_3134, _3080, -0.5);
    int _3150 = _3138 * int(_3100);
    int _3152 = _3150 + _3032;
    float _3154 = fma(_2670, _2968, _3060);
    float _3156 = as_type<float>(_2389) * _3144;
    float _3158 = fma(_1386, _3146, _1056);
    int _3160 = ~_1324;
    int _3162 = _3160 + 1;
    float _3164 = fma(_1372, _3148, _1204);
    float _3166 = float(uint(_3152));
    float _3168 = _2970 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3170 = trunc(_3156);
    float _3172 = precise::max(_3170, 0.0);
    uint _3174 = uint(_3172);
    int _3176 = ~_1324;
    int _3178 = _3176 + 1;
    if (!_3036)
    {
        float _3180 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3128);
        _3120 = as_type<int>(_3180);
    }
    int _3182 = _3120;
    float _3184 = as_type<float>(_2389) * _3166;
    float _3186 = fma(_3168, _3074, -0.5);
    float _3188 = _3158 + 0.5;
    if (!_3036)
    {
        _3106 = _3132;
    }
    float _3190 = _3106;
    float _3192 = fma(_2636, _2942, _3154);
    float _3194 = trunc(_3184);
    float _3196 = precise::max(_3194, 0.0);
    uint _3198 = uint(_3196);
    float _3200 = fma(_1158, _3186, _1126);
    bool _3202 = !_3036;
    float _3204 = _3202 ? _3132 : _3114;
    float _3206 = fma(_2646, _2942, _3124);
    bool _3208 = !_3036;
    float _3210 = _3208 ? as_type<float>(_3182) : _3128;
    float _3212 = _3200 + 0.5;
    float _3214 = fma(_2642, _2942, _3090);
    float _3216 = _3204 * _3204;
    int _3218 = _3162 * int(_3174);
    int _3220 = _3218 + _2858;
    float _3222 = _2734 + 0.5;
    float _3224 = fma(_2690, _2920, _3192);
    float _3226 = fma(_3210, _3210, _3216);
    float _3228 = fma(_2692, _2920, _3206);
    float _3230 = float(uint(_3220));
    float _3232 = fma(_2694, _2920, _3214);
    float _3234 = fma(_2696, _2898, _3224);
    int _3236 = int(_3100) + int(_3198);
    float _3238 = rsqrt(_3226);
    float _3240 = as_type<float>(_2389) * _3230;
    float _3242 = _3056 + 0.5;
    float _3244 = fma(_2698, _2898, _3228);
    int _3246 = _3178 * _3236;
    int _3248 = _3246 + _3032;
    float _3250 = fma(_2704, _2898, _3232);
    float _3252 = fma(_2712, _2880, _3234);
    out.m_79.x = _3188;
    out.m_79.y = _3222;
    out.m_79.z = _3212;
    out.m_79.w = _3242;
    float _3254 = abs(_1874);
    float _3256 = log2(_3254);
    bool _3258 = uint(_3248) >= uint(_1324);
    float _3260 = fma(_2718, _2880, _3244);
    float _3262 = fma(_2740, _2880, _3250);
    float _3264 = _1558 * _1650;
    bool _3266 = !_3258;
    int _3268 = _3266 ? 0 : (-1);
    float _3270 = _1568 * _1608;
    float _3272 = _1576 * _1608;
    float _3274 = trunc(_3240);
    float _3276 = precise::max(_3274, 0.0);
    uint _3278 = uint(_3276);
    int _3280 = ~_3236;
    int _3282 = _3280 + _3268;
    int _3284 = _3282 + 1;
    float _3286 = _3210 * _3238;
    float _3288 = fma(_2796, _2838, _3252);
    float _3290 = fma(_2800, _2838, _3260);
    float _3292 = _3164 + 0.5;
    int _3294 = _1324 * _3284;
    int _3296 = _3294 + _3032;
    int _3298 = ~_1324;
    int _3300 = _3298 + 1;
    float _3302 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3304 = _2756 + 0.5;
    if (!_3036)
    {
        _3126 = as_type<float>(_3182);
    }
    float _3306 = _3126;
    float _3308 = _1558 * _1612;
    bool _3310 = !_2798;
    int _3312 = _3310 ? _3296 : (-1);
    float _3314 = fma(_1562, _1594, _3270);
    float _3316 = exp2(_3302);
    float _3318 = fma(_2802, _2838, _3262);
    int _3320 = _3312 >> 31;
    out.m_81.x = _3292;
    out.m_81.y = _3304;
    int _3322 = int(_3174) + int(_3278);
    float _3324 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[166].z, _3318);
    int _3326 = _3320 & 3;
    float _3328 = _3204 * _3238;
    float _3330 = _1568 * _1650;
    int _3332 = _3300 * _3322;
    int _3334 = _3332 + _2858;
    int _3336 = _3312 + _3326;
    float _3338 = _1576 * _1650;
    int _3340 = _3312 & 3;
    bool _3342 = _3340 != 0;
    float _3344 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3288);
    bool _3346 = uint(_3334) >= uint(_1324);
    float _3348 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3350 = precise::clamp(_3348, 0.0, 1.0);
    float _3352 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[166].y, _3290);
    int _3354 = _3336 >> 2;
    float _3356 = -_1548;
    float _3358 = fma(_3356, _1590, _3308);
    bool _3360 = !_3346;
    int _3362 = _3360 ? 0 : (-1);
    float _3364 = fma(_3350, -2.0, 3.0);
    float _3366 = _3350 * _3350;
    int _3368 = _3354 << 4;
    int _3370 = _3368 + 368;
    out.m_83.x = _3344;
    out.m_83.y = _3352;
    out.m_83.z = _3324;
    int _3372 = ~_3322;
    int _3374 = _3372 + _3362;
    int _3376 = _3374 + 1;
    float _3378 = _3366 * _3364;
    float _3380 = _1568 * _1612;
    uint _3382 = uint(int(uint(_3370) >> uint(2)));
    uint _3384 = uint(int(uint(int(_3382)) >> uint(2)));
    int _3386 = int(_3382) & 3;
    float _3388 = (*spvDescriptorSet0.vp_c9)._m0[int(_3384)][_3386];
    int _3390 = int(_3382) + 1;
    uint _3392 = uint(int(uint(_3390) >> uint(2)));
    int _3394 = _3390 & 3;
    float _3396 = (*spvDescriptorSet0.vp_c9)._m0[int(_3392)][_3394];
    float _3398 = _1576 * _1612;
    int _3400 = _1324 * _3376;
    int _3402 = _3400 + _2858;
    int _3404 = _3312 & 3;
    bool _3406 = _3404 != 0;
    float _3408 = _1558 * _1608;
    float _3410 = fma(_1562, _1590, _3380);
    float _3412 = fma(_1562, _1592, _3330);
    bool _3414 = uint(_3404) > 1u;
    int _3416 = _3370 + 8;
    uint _3418 = uint(int(uint(_3416) >> uint(2)));
    uint _3420 = uint(int(uint(int(_3418)) >> uint(2)));
    int _3422 = int(_3418) & 3;
    float _3424 = (*spvDescriptorSet0.vp_c9)._m0[int(_3420)][_3422];
    int _3426 = int(_3418) + 1;
    uint _3428 = uint(int(uint(_3426) >> uint(2)));
    int _3430 = _3426 & 3;
    float _3432 = (*spvDescriptorSet0.vp_c9)._m0[int(_3428)][_3430];
    int _3434 = _3342 ? 0 : 1;
    float _3436 = -_3378;
    float _3438 = _3436 + 1.0;
    float _3440 = -_1548;
    float _3442 = fma(_3440, _1592, _3264);
    float _3444 = -_1548;
    float _3446 = fma(_3444, _1594, _3408);
    int _3448 = ~_3434;
    int _3450 = _3448 + 1;
    int _3452 = _3450 + 1;
    float _3454 = fma(_3438, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3378);
    float _3456 = fma(_1560, _1476, _3442);
    float _3458 = fma(_1560, _1470, _3358);
    float _3460 = fma(_1560, _1486, _3446);
    float _3462 = fma(_1564, _1592, _3338);
    float _3464 = fma(_1564, _1594, _3272);
    int _3466 = _3452;
    if (!_3414)
    {
        int _3468 = ~_3434;
        int _3470 = _3468 + 1;
        _3466 = _3470;
    }
    int _3472 = _3466;
    float _3474 = fma(_1564, _1590, _3398);
    bool _3476 = _3404 != 3;
    float _3478 = fma(_1586, _1476, _3462);
    bool _3480 = !_3406;
    int _3482 = _3480 ? 0 : 1;
    float _3484 = fma(_1586, _1486, _3464);
    int _3486 = abs(_3472);
    float _3488 = fma(_1586, _1470, _3474);
    bool _3490 = uint(_3404) >= 2u;
    float _3492 = _2832 * _2320;
    int _3494 = abs(_3482);
    float _3496 = -_2832;
    float _3498 = _3496 + 1.0;
    float _3500 = -_2318;
    float _3502 = _3500 + 1.0;
    int _3504 = _3490 ? 0 : 1;
    int _3506 = ~_3486;
    int _3508 = _3506 + 1;
    int _3510 = _3508 + 1;
    int _3512 = ~_3504;
    int _3514 = _3512 + 1;
    int _3516 = _3514 + 1;
    int _3518 = _3516;
    if (_3476)
    {
        int _3520 = ~_3504;
        int _3522 = _3520 + 1;
        _3518 = _3522;
    }
    int _3524 = _3518;
    float _3526 = fma(_1572, _1486, _3314);
    int _3528 = ~_3494;
    int _3530 = _3528 + 1;
    int _3532 = _3530 + 1;
    float _3534 = _3458 * _3190;
    bool _3536 = _3404 != 3;
    int _3538 = abs(_3524);
    int _3540 = _3510 * as_type<int>(_3396);
    bool _3542 = !_2584;
    int _3544 = _3542 ? 0 : 1;
    bool _3546 = _1874 <= 8000.0;
    bool _3548 = isnan(_1874);
    bool _3550 = _3546 || _3548;
    bool _3552 = isnan(8000.0);
    bool _3554 = _3550 || _3552;
    float _3556 = float(_3554);
    int _3558 = _3532 * as_type<int>(_3388);
    int _3560 = _3558 + _3540;
    float _3562 = fma(_1572, _1470, _3410);
    float _3564 = fma(_1572, _1476, _3412);
    bool _3566 = !_3536;
    int _3568 = _3566 ? 0 : (-1);
    float _3570 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3572 = _3456 * _3190;
    int _3574 = abs(_3544);
    out.m_85.x = _3562;
    out.m_85.y = _3564;
    out.m_85.z = _3526;
    int _3576 = abs(_3568);
    float _3578 = fma(_3562, _3142, _3534);
    int _3580 = ~_3538;
    int _3582 = _3580 + 1;
    int _3584 = _3582 + 1;
    float _3586 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3570);
    int _3588 = ~_3576;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = fma(_3564, _3142, _3572);
    float _3596 = _3460 * _3190;
    int _3598 = _3584 * as_type<int>(_3424);
    int _3600 = _3598 + _3560;
    int _3602 = ~_3574;
    int _3604 = _3602 + 1;
    int _3606 = _3604 + 1;
    float _3608 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3586);
    float _3610 = fma(_3526, _3142, _3596);
    int _3612 = _3592 * as_type<int>(_3432);
    int _3614 = _3612 + _3600;
    float _3616 = -_3488;
    float _3618 = _3328 * _3616;
    float _3620 = -_3478;
    float _3622 = _3328 * _3620;
    float _3624 = -_3484;
    float _3626 = _3328 * _3624;
    bool _3628 = !_2798;
    int _3630 = _3628 ? _3402 : (-1);
    int _3632 = _3614 * _3606;
    float _3634 = fma(_3286, _3458, _3618);
    float _3636 = fma(_3286, _3456, _3622);
    float _3638 = fma(_3286, _3460, _3626);
    int _3640 = _3630 * _3574;
    int _3642 = _3640 + _3632;
    float _3644 = in.m_87.x;
    float _3646 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3608);
    float _3648 = _2250 * 0.5;
    float _3650 = _2292 + _2250;
    out.m_89.x = _3634;
    out.m_89.y = _3636;
    out.m_89.z = _3638;
    float _3652 = _3646 + _2250;
    float _3654 = _2341 * _3492;
    float _3656 = _3556 * _3454;
    float _3658 = fma(_2294, -0.5, _3648);
    float _3660 = _3652 * 0.5;
    float _3662 = _3650 * 0.5;
    float _3664 = fma(_3488, _3306, _3578);
    float _3666 = fma(_3478, _3306, _3594);
    float _3668 = fma(_3484, _3306, _3610);
    float _3670 = _2331 * _3498;
    float _3672 = _2331 * _3492;
    float _3674 = fma(_2331, _3654, _2329);
    float _3676 = _3656 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _3662;
    out.m_91.y = _3658;
    out.m_91.z = _3660;
    out.m_91.w = _2250;
    float _3678 = fma(_2337, _3672, _2325);
    float _3680 = fma(_2339, _3672, _2327);
    out.m_93.x = _3664;
    out.m_93.y = _3666;
    out.m_93.z = _3668;
    float _3682 = _3502 * _3676;
    float _3684 = precise::clamp(_3682, 0.0, 1.0);
    bool _3686 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3688 = isnan(_2006);
    bool _3690 = _3686 || _3688;
    bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3694 = _3690 || _3692;
    float _3696 = _1984 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _3678;
    out.m_95.y = _3680;
    out.m_95.z = _3674;
    out.m_95.w = _3670;
    float _3698 = -_3684;
    float _3700 = fma(_3698, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3702 = float(_3642);
    out.gl_Position.x = _2292;
    out.gl_Position.y = _2294;
    out.gl_Position.z = _3646;
    out.gl_Position.w = _2250;
    float _3704 = _3700 * _3644;
    out.m_97.x = _3702;
    float _3706 = _3704 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3708 = _3704;
    float _3710 = _3646;
    float _3712 = _3706;
    if (!_3694)
    {
        _3708 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3714 = _3708;
    float _3716 = _3714;
    float _3718 = _3714;
    if (!_3694)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3720 = _2448;
    out.m_99.x = _3706;
    float _3722 = _3720;
    float _3724 = _3720;
    if (!_3694)
    {
        _3710 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3726 = _3710;
    float _3728 = _3726;
    float _3730 = _3726;
    if (!_3694)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3732 = _2450;
    float _3734 = _3732;
    float _3736 = _3732;
    if (!_3694)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3738 = _2452;
    float _3740 = _3738;
    float _3742 = _3738;
    if (!_3694)
    {
        _3712 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3744 = _3712;
    bool _3746 = !_3694;
    float _3748 = _3744;
    float _3750 = _3744;
    if (!_3746)
    {
        bool _3752 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3754 = isnan(_2006);
        bool _3756 = _3752 || _3754;
        bool _3758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3760 = _3756 || _3758;
        if (!_3760)
        {
            float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3764 = _2006 + _3762;
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3772 = _3770 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3774 = 1.0 / _3768;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3792 = _3764 * _3774;
            float _3794 = precise::clamp(_3792, 0.0, 1.0);
            float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3800 = fma(_3794, _3772, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3802 = fma(_3794, _3798, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3804 = fma(_3794, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3806 = fma(_3794, _3782, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3808 = fma(_3794, _3786, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3810 = fma(_3794, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3724 = _3804;
            _3742 = _3808;
            _3718 = _3800;
            _3736 = _3806;
            _3730 = _3802;
            _3750 = _3810;
            _3812 = true;
        }
        else
        {
            bool _3814 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3816 = isnan(_2006);
            bool _3818 = _3814 || _3816;
            bool _3820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3822 = _3818 || _3820;
            if (!_3822)
            {
                _3716 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3824 = _3716;
            _3718 = _3824;
            if (!_3822)
            {
                _3722 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3826 = _3722;
            _3724 = _3826;
            if (!_3822)
            {
                _3728 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3828 = _3728;
            _3730 = _3828;
            if (!_3822)
            {
                _3734 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3830 = _3734;
            _3736 = _3830;
            if (!_3822)
            {
                _3740 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3832 = _3740;
            _3742 = _3832;
            if (!_3822)
            {
                _3748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3834 = _3748;
            bool _3836 = !_3822;
            _3750 = _3834;
            if (!_3836)
            {
                bool _3838 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3840 = isnan(_2006);
                bool _3842 = _3838 || _3840;
                bool _3844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3846 = _3842 || _3844;
                if (!_3846)
                {
                    float _3848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3850 = _2006 + _3848;
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3852;
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3858 = _3856 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3860 = 1.0 / _3854;
                    float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3866 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3878 = _3850 * _3860;
                    float _3880 = precise::clamp(_3878, 0.0, 1.0);
                    float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3886 = fma(_3880, _3858, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3888 = fma(_3880, _3884, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3890 = fma(_3880, _3864, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3892 = fma(_3880, _3868, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3894 = fma(_3880, _3872, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3896 = fma(_3880, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3724 = _3890;
                    _3742 = _3894;
                    _3718 = _3886;
                    _3736 = _3892;
                    _3730 = _3888;
                    _3750 = _3896;
                    _3812 = true;
                }
                else
                {
                    _3724 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3742 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3718 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3736 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3730 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3812 = false;
    float _3898 = _3724;
    float _3900 = _3742;
    float _3902 = _3718;
    float _3904 = _3736;
    float _3906 = _3730;
    float _3908 = _3750;
    float _3910 = _3696 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3912 = fma(_3666, -0.5, 0.5);
    float _3914 = precise::clamp(_3912, 0.0, 1.0);
    float _3916 = -_3898;
    float _3918 = _3916 + _3900;
    float _3920 = -_3902;
    float _3922 = _3920 + _3904;
    out.m_53.x = _3910;
    float _3924 = fma(_3914, _3918, _3898);
    float _3926 = -_3906;
    float _3928 = _3926 + _3908;
    float _3930 = fma(_3914, _3922, _3902);
    float _3932 = _3924 * 0.586610972881317138671875;
    bool _3934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3936 = fma(_3914, _3928, _3906);
    out.m_101.x = 0.0;
    float _3938 = fma(_3930, 0.298911988735198974609375, _3932);
    bool _3940 = _1984 > 0.0;
    bool _3942 = isnan(_1984);
    bool _3944 = _3940 || _3942;
    bool _3946 = isnan(0.0);
    bool _3948 = _3944 || _3946;
    float _3950 = fma(_3936, 0.114477999508380889892578125, _3938);
    float _3952 = -_3950;
    float _3954 = _3930 + _3952;
    float _3956 = -_3950;
    float _3958 = _3924 + _3956;
    float _3960 = -_3950;
    float _3962 = _3936 + _3960;
    float _3964 = fma(_3954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3950);
    float _3966 = fma(_3958, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3950);
    float _3968 = fma(_3962, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3950);
    bool _3970 = !_3934;
    if (!_3970)
    {
        float _3972 = -_1928;
        float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3976 = -_1930;
        float _3978 = _3976 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3980 = -_1932;
        float _3982 = _3980 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3984 = _3974 * _3974;
        float _3986 = fma(_3978, _3978, _3984);
        float _3988 = fma(_3982, _3982, _3986);
        float _3990 = sqrt(_3988);
        float _3992 = rsqrt(_3988);
        float _3994 = -_3990;
        float _3996 = _3994 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3998 = _3996 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4000 = precise::clamp(_3998, 0.0, 1.0);
        float _4002 = _3978 * _3992;
        float _4004 = _3974 * _3992;
        float _4006 = abs(_4000);
        float _4008 = log2(_4006);
        float _4010 = _3982 * _3992;
        float _4012 = _4002 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4014 = _3666 * _4004;
        float _4016 = -_4004;
        float _4018 = -_4012;
        float _4020 = fma(_4016, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4018);
        float _4022 = fma(_3664, _4002, _4014);
        float _4024 = -_4010;
        float _4026 = fma(_4024, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4020);
        float _4028 = fma(_3668, _4010, _4022);
        float _4030 = precise::clamp(_4028, 0.0, 1.0);
        float _4032 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4034 = _4026 + _4032;
        float _4036 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4038 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4040 = precise::clamp(_4038, 0.0, 1.0);
        float _4042 = exp2(_4036);
        float _4044 = _4042 * _4040;
        float _4046 = _4030 * _4044;
        float _4048 = _4046 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4050 = _4046 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4052 = _4046 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _4048;
        out.m_101.y = _4050;
        out.m_101.z = _4052;
    }
    out.m_103.x = _3964;
    out.m_103.y = _3966;
    out.m_103.z = _3968;
    if (_3948)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _4054 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4054;
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
    bool _3812 = false;
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
        float _4122 = as_type<float>(_146);
        out.gl_Position.z = _4122;
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
        float _4185 = as_type<float>(_178);
        out.gl_Position.z = _4185;
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
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _806 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _808 = isnan(_792);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _822 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _824 = isnan(_792);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = 1.0 / _800;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _836;
    float _840 = -_816;
    float _842 = _840 + 1.0;
    bool _844 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _846 = isnan(_792);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    bool _856 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _858 = 1.0 / _804;
    float _860 = 1.0 / _820;
    float _862 = _838 * _834;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _868 = _832 * _842;
    float _870 = -_832;
    float _872 = _870 + 1.0;
    float _874 = fma(_862, _796, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _876 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _878 = isnan(_792);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = _854 * _872;
    float _890 = _866 * _858;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _894 = _792 + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _896;
    float _900 = _874 * _888;
    float _902 = -_854;
    float _904 = _902 + 1.0;
    float _906 = fma(_890, _894, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _908 = -_886;
    float _910 = _908 + 1.0;
    float _912 = _898 * _860;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _916 = _792 + _914;
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[131].x, _900);
    float _920 = _816 * _910;
    float _922 = fma(_912, _916, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _924 = fma(_906, _868, _918);
    float _926 = fma(_922, _920, _924);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _934 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[134].x, _926);
    float _936 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _934 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _936;
    out.m_63.y = _940;
    out.m_63.z = _938;
    out.m_63.w = _942;
    bool _944 = !_856;
    if (!_944)
    {
        float _946 = in.m_57.x;
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _950 = _946 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _954 = _952 * _948;
        float _956 = floor(_954);
        float _958 = -_956;
        float _960 = _954 + _958;
        _174 = _960;
    }
    float _962 = _174;
    float _964 = in.m_57.x;
    float _966 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _968 = in.m_57.y;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _972 = in.m_57.z;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _976 = _974 != 0;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = in.m_46.x;
    float _982 = in.m_46.y;
    float _984 = in.m_46.z;
    float _986 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _988 = _964 * 2.0;
    float _990 = _964 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _992 = _968 * 2.0;
    float _994 = _968 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _996 = floor(_988);
    float _998 = -_970;
    float _1000 = fma(_990, 2.0, _998);
    float _1002 = _972 * 2.0;
    float _1004 = fma(_994, -2.0, _978);
    float _1006 = _964 + _968;
    float _1008 = _968 + _972;
    float _1010 = _982 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1012 = _982 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1014 = floor(_992);
    float _1016 = _982 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1018 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1010);
    float _1020 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1012);
    float _1022 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1016);
    float _1024 = _1006 + (-1.0);
    float _1026 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1028 = floor(_1002);
    float _1030 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1020);
    float _1032 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1022);
    float _1034 = _980;
    float _1036 = _984;
    float _1038 = _1022;
    if (_976)
    {
        _1034 = _964;
    }
    float _1040 = _1034;
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1044 = _1040;
    if (!_976)
    {
        _1036 = _968;
    }
    float _1046 = _1036;
    float _1048 = _1008 + (-1.0);
    float _1050 = _1046;
    if (!_976)
    {
        _1044 = _972;
    }
    float _1052 = _1044;
    float _1054 = -_128;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1000);
    float _1058 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1060 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1062 = log2(_1060);
    if (_976)
    {
        _1050 = _964;
    }
    float _1064 = _1050;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1068 = _996 > 0.0;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1072 = _996 >= 0.0;
    bool _1074 = isnan(_996);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    float _1082 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_976)
    {
        _1038 = _972;
    }
    float _1084 = _1038;
    float _1086 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1088 = _1084;
    if (_976)
    {
        _1088 = _968;
    }
    float _1090 = _1088;
    float _1092 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1094 = _1014 >= 0.0;
    bool _1096 = isnan(_1014);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    float _1104 = -_1066;
    float _1106 = fma(_1086, 2.0, _1104);
    bool _1108 = _1028 >= 0.0;
    bool _1110 = isnan(_1028);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan(0.0);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1070);
    float _1120 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1004);
    bool _1122 = _1014 > 0.0;
    float _1124 = -_128;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1106);
    bool _1128 = _1028 > 0.0;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1132 = _1080 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1134 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1118);
    int _1136 = _1102 ? 0 : 1;
    float _1138 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1130);
    float _1140 = _1116 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1142 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1144 = int(_1142);
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1156 = _1154 != 0;
    float _1158 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1138);
    int _1160 = ~as_type<int>(_1132);
    int _1162 = _1160 + 1;
    int _1164 = _1162 + 1;
    bool _1166 = !_1152;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1172 = !_1148;
    int _1174 = _1172 ? 0 : 1;
    bool _1176 = !_1156;
    int _1178 = _1176 ? 0 : 1;
    float _1180 = -_1170;
    float _1182 = fma(_1082, 2.0, _1180);
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1186 = _1184 != 0;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1194 = _1192 != 0;
    int _1196 = ~as_type<int>(_1140);
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    float _1202 = -_128;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    int _1206 = _1164;
    int _1208 = _1200;
    float _1210 = _1132;
    float _1212 = _1140;
    if (!_1068)
    {
        int _1214 = ~as_type<int>(_1132);
        int _1216 = _1214 + 1;
        _1206 = _1216;
    }
    int _1218 = _1206;
    float _1220 = -_1092;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1224 = !_1190;
    int _1226 = _1224 ? 0 : 1;
    bool _1228 = !_1186;
    int _1230 = _1228 ? 0 : 1;
    int _1232 = abs(_1226);
    int _1234 = abs(_1230);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (!_1128)
    {
        int _1238 = ~as_type<int>(_1140);
        int _1240 = _1238 + 1;
        _1208 = _1240;
    }
    int _1242 = _1208;
    if (!_976)
    {
        _1210 = _972;
    }
    float _1244 = _1210;
    float _1246 = _1244;
    if (_976)
    {
        _1212 = _968;
    }
    float _1248 = _1212;
    float _1250 = _1248;
    if (_976)
    {
        _1246 = _968;
    }
    float _1252 = _1246;
    if (!_976)
    {
        _1250 = _964;
    }
    float _1254 = _1250;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1258 = float(_1218);
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1262 = float(_1232);
    float _1264 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1266 = float(_1242);
    float _1268 = fma(_1260, -2.0, _1256);
    float _1270 = float(_1144);
    float _1272 = _1262 * _1258;
    float _1274 = _1062 * _128;
    float _1276 = fma(_1264, -2.0, _1236);
    float _1278 = in.m_65.x;
    float _1280 = in.m_65.y;
    float _1282 = in.m_65.z;
    float _1284 = 1.0 / _1270;
    int _1286 = ~_1136;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    float _1292 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1268);
    int _1294 = _1290;
    if (!_1122)
    {
        int _1296 = ~_1136;
        int _1298 = _1296 + 1;
        _1294 = _1298;
    }
    int _1300 = _1294;
    float _1302 = _1272 * (-2.0);
    float _1304 = float(_1234);
    float _1306 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1276);
    float _1308 = exp2(_1274);
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1314 = 1.0 + _1312;
    float _1316 = _1304 * _1266;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1320 = _1316 * (-2.0);
    float _1322 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1324 = int(_1322);
    bool _1326 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1328 = isnan(1.0);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1334 = _1330 || _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1318);
    float _1352 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1336);
    float _1354 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1338);
    float _1356 = 1.0 / _1314;
    float _1358 = -_1308;
    float _1360 = _1358 + 1.0;
    float _1362 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1364 = fma(_1320, _1278, _1278);
    float _1366 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1310);
    bool _1368 = !_1194;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1354);
    float _1374 = _1348 ? _1360 : 0.0;
    float _1376 = _964 + (-0.5);
    float _1378 = float(_1324);
    float _1380 = -_1362;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1384 = _1284 * _128;
    float _1386 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1350);
    float _1388 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1352);
    float _1390 = _1378 * _128;
    float _1392 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1366);
    int _1394 = abs(_1370);
    float _1396 = _1362;
    if (_1334)
    {
        float _1398 = _1374 * _1356;
        _138 = _1398;
    }
    float _1400 = _138;
    float _1402 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1404 = fma(_1042, _1320, _1042);
    float _1406 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1364);
    float _1408 = _1382 * _1382;
    float _1410 = fma(_1302, _1280, _1280);
    float _1412 = fma(_1404, _1400, _1406);
    float _1414 = -_1402;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1418 = fma(_1222, _1222, _1408);
    float _1420 = _968 + (-0.5);
    float _1422 = fma(_1058, _1302, _1058);
    float _1424 = float(_1300);
    float _1426 = _1412 * 0.15915493667125701904296875;
    float _1428 = float(_1394);
    float _1430 = fma(_1416, _1416, _1418);
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1410);
    float _1434 = _964 + _972;
    float _1436 = _1428 * _1424;
    float _1438 = rsqrt(_1430);
    float _1440 = _1434 + (-1.0);
    float _1442 = fma(_1422, _1400, _1432);
    float _1444 = _1436 * (-2.0);
    float _1446 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1448 = _972 + (-0.5);
    float _1450 = fma(_1444, _1282, _1282);
    float _1452 = _1426 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1442 * 0.15915493667125701904296875;
    float _1458 = fma(_1446, _1444, _1446);
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1450);
    float _1462 = in.m_67.x;
    float _1464 = in.m_67.y;
    float _1466 = in.m_67.z;
    float _1468 = fma(_1458, _1400, _1460);
    float _1470 = _1222 * _1438;
    float _1472 = _1426 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    float _1476 = _1382 * _1438;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1480 = _1476 * _1478;
    float _1482 = _1456 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = _1416 * _1438;
    float _1488 = _1468 * 0.15915493667125701904296875;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1492 = _1470 * _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1496 = -_1480;
    float _1498 = fma(_1470, _1494, _1496);
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1502 = _1486 * _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1506 = -_1492;
    float _1508 = fma(_1486, _1504, _1506);
    float _1510 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1514 = -_1502;
    float _1516 = fma(_1476, _1512, _1514);
    float _1518 = _1508 * _1508;
    float _1520 = _1456 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1462);
    float _1526 = _1474 * _1484;
    float _1528 = _966 * _1524;
    float _1530 = _1488 * 6.283185482025146484375;
    float _1532 = cos(_1530);
    float _1534 = fma(_1516, _1516, _1518);
    float _1536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1464);
    float _1538 = _1454 * _1484;
    float _1540 = fma(_1498, _1498, _1534);
    float _1542 = _1510 * _1536;
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1466);
    float _1546 = _1488 * 6.283185482025146484375;
    float _1548 = sin(_1546);
    float _1550 = _1474 * _1522;
    float _1552 = _1454 * _1522;
    float _1554 = _986 * _1544;
    float _1556 = rsqrt(_1540);
    float _1558 = _1474 * _1532;
    float _1560 = _1454 * _1532;
    float _1562 = _1522 * _1532;
    float _1564 = _1484 * _1532;
    float _1566 = _1558 * _1542;
    float _1568 = fma(_1548, _1550, _1538);
    float _1570 = -_1526;
    float _1572 = fma(_1548, _1552, _1570);
    float _1574 = -_1552;
    float _1576 = fma(_1548, _1526, _1574);
    float _1578 = -_1542;
    float _1580 = _1548 * _1578;
    float _1582 = fma(_1568, _1528, _1566);
    float _1584 = _1560 * _1542;
    float _1586 = fma(_1548, _1538, _1550);
    float _1588 = fma(_1562, _1528, _1580);
    float _1590 = _1516 * _1556;
    float _1592 = _1508 * _1556;
    float _1594 = _1498 * _1556;
    float _1596 = fma(_1576, _1554, _1582);
    float _1598 = _1476 * _1590;
    float _1600 = _1486 * _1592;
    float _1602 = fma(_1572, _1528, _1584);
    float _1604 = fma(_1564, _1554, _1588);
    float _1606 = -_1598;
    float _1608 = fma(_1470, _1592, _1606);
    float _1610 = -_1600;
    float _1612 = fma(_1476, _1594, _1610);
    float _1614 = fma(_1586, _1554, _1602);
    float _1616 = _1608 * _1596;
    float _1618 = _1612 * _1596;
    float _1620 = fma(_1594, _1604, _1616);
    float _1622 = fma(_1590, _1604, _1618);
    float _1624 = fma(_1486, _1614, _1620);
    float _1626 = fma(_1470, _1614, _1622);
    float _1628 = _1402 + _1624;
    float _1630 = _1092 + _1626;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1634 = _1628 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1630 + _1636;
    float _1640 = _1634 * _1634;
    float _1642 = fma(_1638, _1638, _1640);
    float _1644 = _1470 * _1594;
    float _1646 = sqrt(_1642);
    float _1648 = -_1644;
    float _1650 = fma(_1486, _1590, _1648);
    float _1652 = _1650 * _1596;
    float _1654 = fma(_1592, _1604, _1652);
    float _1656 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1658 = fma(_1476, _1614, _1654);
    float _1660 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1656);
    bool _1662 = _1646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1362 + _1658;
    float _1666 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1660);
    float _1668 = _1660;
    float _1670 = _1614;
    float _1672 = _1658;
    float _1674 = _1634;
    if (!_1662)
    {
        _1668 = _1630;
    }
    float _1676 = _1668;
    float _1678 = _1676;
    if (!_1662)
    {
        _1670 = _1628;
    }
    float _1680 = _1670;
    float _1682 = _1680;
    if (!_1662)
    {
        _1672 = _1664;
    }
    float _1684 = _1672;
    bool _1686 = !_1662;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1646 + _1692;
        float _1696 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = rsqrt(_1642);
        float _1700 = _1694 * _1690;
        float _1702 = _1700 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1706 + (-1.0);
        float _1714 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = fma(_1710, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1718 = fma(_1664, _1706, _1714);
        float _1720 = _1698 * _1716;
        float _1722 = fma(_1638, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1724 = fma(_1634, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1718;
        _1678 = _1722;
        _1682 = _1724;
    }
    float _1726 = _1688;
    float _1728 = _1678;
    float _1730 = _1682;
    float _1732 = -_1362;
    float _1734 = _1732 + _1726;
    float _1736 = -_1092;
    float _1738 = _1736 + _1728;
    float _1740 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1742 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1744 = _1734 * _1734;
    float _1746 = -_1402;
    float _1748 = _1746 + _1730;
    float _1750 = 1.0 / _1740;
    float _1752 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1742);
    float _1754 = fma(_1738, _1738, _1744);
    float _1756 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1752);
    float _1758 = fma(_1748, _1748, _1754);
    bool _1760 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1762 = isnan(0.5);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1768 = _1764 || _1766;
    float _1770 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1772 = sqrt(_1758);
    bool _1774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1776 = isnan(0.5);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1782 = _1778 || _1780;
    float _1784 = _1770 + _1740;
    float _1786 = _1784 * _1750;
    float _1788 = _1786 * 0.5;
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1792 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1790);
    float _1794 = 1.0 / _1792;
    bool _1796 = _1772 > 0.0;
    bool _1798 = !_1796;
    float _1800 = _1726;
    float _1802 = _1730;
    float _1804 = _1728;
    float _1806 = _1792;
    if (!_1798)
    {
        float _1808 = _202 * _202;
        float _1810 = fma(_200, _200, _1808);
        float _1812 = fma(_204, _204, _1810);
        float _1814 = rsqrt(_1758);
        float _1816 = sqrt(_1812);
        float _1818 = _1738 * _1814;
        float _1820 = _1734 * _1814;
        float _1822 = _1748 * _1814;
        bool _1824 = _1816 > 0.0;
        bool _1826 = !_1824;
        if (!_1826)
        {
            float _1828 = rsqrt(_1812);
            float _1830 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1832 = _202 * _1828;
            float _1834 = _200 * _1828;
            float _1836 = _204 * _1828;
            float _1838 = _1820 * _1832;
            float _1840 = fma(_1818, _1834, _1838);
            float _1842 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1844 = fma(_1822, _1836, _1840);
            float _1846 = _1844 * _1842;
            float _1848 = fma(_200, _1846, _1728);
            float _1850 = fma(_202, _1846, _1726);
            float _1852 = fma(_204, _1846, _1730);
            _1800 = _1850;
            _1802 = _1852;
            _1804 = _1848;
            _1806 = _1838;
        }
    }
    float _1854 = _1800;
    float _1856 = _1802;
    float _1858 = _1804;
    float _1860 = _1806;
    float _1862 = _1860;
    float _1864 = _1854;
    float _1866 = _1858;
    float _1868 = _1856;
    if (_1782)
    {
        _1862 = 1.0;
    }
    float _1870 = _1862;
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1874 = _1794 * _1872;
    float _1876 = _1870;
    if (!_1768)
    {
        float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1880 = _1362 + _1878;
        float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1884 = _1092 + _1882;
        float _1886 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1888 = -_1362;
        float _1890 = _1888 + _1854;
        float _1892 = _1880 * _1880;
        float _1894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1896 = _1402 + _1894;
        float _1898 = -_1402;
        float _1900 = _1898 + _1856;
        float _1902 = fma(_1884, _1884, _1892);
        float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1906 = fma(_1896, _1896, _1902);
        float _1908 = sqrt(_1906);
        float _1910 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1912 = precise::min(_1908, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1914 = _1912 * _1904;
        float _1916 = _1910 * _1914;
        float _1918 = -_1092;
        float _1920 = _1918 + _1858;
        float _1922 = fma(_1890, _1916, _1362);
        float _1924 = fma(_1920, _1916, _1092);
        float _1926 = fma(_1900, _1916, _1402);
        _1864 = _1922;
        _1866 = _1924;
        _1868 = _1926;
    }
    float _1928 = _1864;
    float _1930 = _1866;
    float _1932 = _1868;
    if (!_1782)
    {
        float _1934 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1936 = _1934 * 0.15915493667125701904296875;
        float _1938 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1940 = _1936 * 6.283185482025146484375;
        float _1942 = cos(_1940);
        float _1944 = _1938 * 0.15915493667125701904296875;
        float _1946 = _1936 * 6.283185482025146484375;
        float _1948 = sin(_1946);
        float _1950 = 1.0 / _1942;
        float _1952 = _1944 * 6.283185482025146484375;
        float _1954 = cos(_1952);
        float _1956 = _1948 * _1950;
        float _1958 = _1944 * 6.283185482025146484375;
        float _1960 = sin(_1958);
        float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1964 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1962;
        float _1966 = _1954 * _1956;
        float _1968 = 1.0 / _1964;
        float _1970 = 1.0 / _1966;
        float _1972 = _1960 * _1970;
        float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1976 = fma(_1874, _1972, _1974);
        float _1978 = _1976 * _1968;
        float _1980 = precise::clamp(_1978, 0.0, 1.0);
        _1396 = _1956;
        _1876 = _1980;
    }
    float _1982 = _1396;
    float _1984 = _1876;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1928 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1930 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1996 = _1932 + _1994;
    float _1998 = _1988 * _1988;
    float _2000 = fma(_1992, _1992, _1998);
    float _2002 = fma(_1996, _1996, _2000);
    float _2004 = rsqrt(_2002);
    float _2006 = sqrt(_2002);
    float _2008 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2010 = _1992 * _2008;
    float _2012 = _1996 * _2008;
    float _2014 = _2010 * _2010;
    float _2016 = _2012 * _2012;
    float _2018 = _2014 + _2016;
    float _2020 = sqrt(_2018);
    bool _2022 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2026 = _2020 + _2024;
    float _2028 = _1996;
    float _2030 = _2018;
    float _2032 = _2026;
    float _2034 = _1982;
    if (_2022)
    {
        float _2036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2028 = _2036;
    }
    float _2038 = _2028;
    if (_2022)
    {
        float _2040 = rsqrt(_2018);
        _2030 = _2040;
    }
    float _2042 = _2030;
    float _2044 = _2042;
    if (_2022)
    {
        float _2046 = _2026 * _2038;
        _2032 = _2046;
    }
    float _2048 = _2032;
    if (_2022)
    {
        float _2050 = _2048 * 0.15915493667125701904296875;
        _2034 = _2050;
    }
    float _2052 = _2034;
    float _2054 = _2038;
    float _2056 = _2052;
    if (_2022)
    {
        float _2058 = _2052 * 6.283185482025146484375;
        float _2060 = sin(_2058);
        _2054 = _2060;
    }
    float _2062 = _2054;
    float _2064 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2066 = precise::max(0.0, _2064);
    float _2068 = _1998;
    float _2070 = _2066;
    if (_2022)
    {
        float _2072 = _2052 * 6.283185482025146484375;
        float _2074 = cos(_2072);
        _2068 = _2074;
    }
    float _2076 = _2068;
    float _2078 = -_2008;
    float _2080 = -_2066;
    float _2082 = fma(_1988, _2078, _2080);
    float _2084 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2022)
    {
        float _2086 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2070 = _2086;
    }
    float _2088 = _2070;
    float _2090 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2092 = _2088;
    if (!_2022)
    {
        _2084 = _2082;
    }
    float _2094 = _2084;
    float _2096 = _2062;
    float _2098 = _2094;
    if (_2022)
    {
        float _2100 = fma(_2062, _2088, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2096 = _2100;
    }
    float _2102 = _2096;
    float _2104 = floor(_2090);
    float _2106 = _2102;
    float _2108 = _2076;
    if (_2022)
    {
        float _2110 = _2076 + (-1.0);
        _2092 = _2110;
    }
    float _2112 = _2092;
    float _2114 = _2112;
    if (_2022)
    {
        float _2116 = _2042 * _2102;
        _1674 = _2116;
    }
    float _2118 = _1674;
    if (!_2022)
    {
        _2106 = _2010;
    }
    float _2120 = _2106;
    float _2122 = _2120;
    if (_2022)
    {
        float _2124 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2056 = _2124;
    }
    float _2126 = _2056;
    if (_2022)
    {
        float _2128 = _2010 * _2118;
        _2122 = _2128;
    }
    float _2130 = _2122;
    if (!_2022)
    {
        _2114 = _2012;
    }
    float _2132 = _2114;
    float _2134 = _2132;
    if (_2022)
    {
        float _2136 = _2012 * _2118;
        _2134 = _2136;
    }
    float _2138 = _2134;
    if (!_2022)
    {
        _2044 = _2014;
    }
    float _2140 = _2044;
    float _2142 = _2140;
    if (_2022)
    {
        float _2144 = fma(_2082, _2076, _2126);
        _2098 = _2144;
    }
    float _2146 = _2098;
    if (_2022)
    {
        float _2148 = _2130 * _2130;
        _2142 = _2148;
    }
    float _2150 = _2142;
    float _2152 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2022)
    {
        _2108 = _2016;
    }
    float _2154 = _2108;
    float _2156 = _2154;
    if (_2022)
    {
        float _2158 = _2138 * _2138;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = fma(_2146, _2146, _2150);
    float _2164 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2166 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2168 = _2162 + _2160;
    float _2170 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2172 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2166);
    float _2174 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2152);
    float _2176 = rsqrt(_2168);
    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2180 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2178);
    float _2182 = precise::clamp(_2180, 0.0, 1.0);
    float _2184 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2170);
    float _2186 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2172);
    float _2188 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2174);
    float _2190 = -_2182;
    float _2192 = _2190 + 1.0;
    float _2194 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2184);
    float _2196 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2198 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2200 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2202 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2204 = abs(_2192);
    float _2206 = log2(_2204);
    float _2208 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2210 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2198);
    float _2212 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2202);
    float _2214 = _2176 * _2130;
    float _2216 = _2176 * _2146;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2220 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2222 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2224 = _2176 * _2138;
    float _2226 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2210);
    float _2228 = -_2220;
    float _2230 = fma(_2228, _2218, 1.0);
    float _2232 = -_2222;
    float _2234 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2232);
    float _2236 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2212);
    float _2238 = _2226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2240 = -_2104;
    float _2242 = _2090 + _2240;
    float _2244 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2246 = -_2224;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2234);
    float _2250 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2236);
    float _2252 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2254 = log2(_2230);
    float _2256 = fma(_2248, -0.5, 0.5);
    float _2258 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2260 = fma(_2248, 0.5, 0.5);
    float _2262 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2252);
    float _2264 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2258);
    float _2266 = _2216 + 1.0;
    float _2268 = exp2(_2244);
    float _2270 = fma(_2260, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2272 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2262);
    float _2274 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2264);
    float _2276 = fma(_2260, _2270, -0.212114393711090087890625);
    float _2278 = sqrt(_2256);
    float _2280 = fma(_2260, _2276, 1.570728778839111328125);
    float _2282 = _2254 * 0.693147182464599609375;
    float _2284 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2286 = 1.0 / _2250;
    float _2288 = -_2216;
    float _2290 = fma(_2268, _2266, _2288);
    float _2292 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2272);
    float _2294 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2274);
    float _2296 = floor(_2164);
    float _2298 = _2278 * 0.636619746685028076171875;
    float _2300 = -_2280;
    float _2302 = fma(_2298, _2300, 1.0);
    float _2304 = fma(_2290, 0.5, 0.5);
    float _2306 = _2292 * _2286;
    float _2308 = _2294 * _2286;
    float _2310 = fma(_2306, 0.5, 0.5);
    float _2312 = fma(_2308, -0.5, 0.5);
    float _2314 = -_2296;
    float _2316 = _2164 + _2314;
    float2 _7634 = float2(_2242, _2316);
    float _2318 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7634, float2(0.0), isnan(_7634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7634, float2(0.0), isnan(_7634)), level(0.0)).x;
    float3 _7645 = float3(_2310, _2312, _2284);
    float _2320 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7645, float3(0.0), isnan(_7645)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7645, float3(0.0), isnan(_7645)), level(0.0)).x;
    float3 _7656 = float3(_2310, _2312, _2284);
    float4 _2323 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7656, float3(0.0), isnan(_7656)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7656, float3(0.0), isnan(_7656)), level(0.0)).xyzw;
    float _2325 = _2323.x;
    float _2327 = _2323.y;
    float _2329 = _2323.z;
    float _2331 = _2323.w;
    float2 _7672 = float2(_2302, _2304);
    float3 _2335 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7672, float2(0.0), isnan(_7672)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7672, float2(0.0), isnan(_7672)), level(0.0)).xyz;
    float _2337 = _2335.x;
    float _2339 = _2335.y;
    float _2341 = _2335.z;
    float _2343 = float(uint(_1324));
    float _2345 = trunc(_1384);
    int _2347 = int(_2345);
    float _2349 = in.m_69.y;
    float _2351 = _1390 * _166;
    bool _2353 = _968 > 0.5;
    float _2355 = in.m_69.x;
    int _2357 = ~_1324;
    int _2359 = _2357 + 1;
    float _2361 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2363 = 1.0 / _2343;
    int _2365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2367 = _2365 != 0;
    float _2369 = in.m_71.w;
    int _2371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2373 = _2371 != 0;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2377 = _2375 != 0;
    out.m_73.x = _1930;
    out.m_73.y = _1928;
    out.m_73.z = _1932;
    bool _2379 = _972 > 0.5;
    float _2381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2383 = float(uint(_2347));
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2387 = _2385 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2389 = as_type<int>(_2363) + (-2);
    float _2391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2393 = abs(_1168);
    float _2395 = as_type<float>(_2389) * _2383;
    int _2397 = abs(_1178);
    float _2399 = in.m_57.w;
    float _2401 = _2381 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2403 = trunc(_2395);
    float _2405 = precise::max(_2403, 0.0);
    uint _2408 = uint(_2405);
    out.m_75.w = _2369;
    float _2410 = 1.0 / _2387;
    float _2412 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2412;
    int _2416 = _2359 * int(_2408);
    int _2418 = _2416 + _2347;
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2422 = _2420 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2426 = float(uint(_2418));
    float _2428 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _2428;
    bool _2432 = _2399 > 0.5;
    float _2434 = as_type<float>(_2389) * _2426;
    float _2436 = 1.0 / _2430;
    float _2438 = _2399;
    float _2440 = _2349;
    bool _2442 = _2367;
    int _2444 = as_type<int>(_2391);
    float _2446 = _2355;
    float _2448 = _2250;
    float _2450 = _2294;
    float _2452 = _2292;
    if (!_2373)
    {
        _2438 = _2355;
    }
    float _2454 = _2438;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _2456;
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2464 = trunc(_2434);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    int _2470 = ~_1324;
    int _2472 = _2470 + 1;
    bool _2474 = !_976;
    float _2476 = _2474 ? 7.345489978790283203125 : 1.0;
    int _2478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2480 = _2478 != 0;
    float _2482 = 1.0 / _2458;
    float _2484 = -_2349;
    float _2486 = _2484 + 1.0;
    int _2488 = _2353 ? as_type<int>(_2486) : as_type<int>(_2349);
    int _2490 = _2379 ? as_type<int>(_2486) : as_type<int>(_2349);
    float _2492 = 1.0 / _2462;
    float _2494 = _2377 ? as_type<float>(_2488) : _2349;
    int _2496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2498 = _2496 != 0;
    int _2500 = int(_2408) + int(_2468);
    float _2502 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2504 = _2498 ? as_type<float>(_2490) : _2349;
    float _2506 = exp2(_2361);
    int _2508 = as_type<int>(_2486);
    float _2510 = _2454;
    if (_2367)
    {
        float _2512 = _2432 ? _2486 : _2349;
        _2440 = _2512;
    }
    float _2514 = _2440;
    if (_2373)
    {
        float _2516 = -_2355;
        float _2518 = _2516 + 1.0;
        _2508 = as_type<int>(_2518);
    }
    int _2520 = _2508;
    int _2522 = _2472 * _2500;
    int _2524 = _2522 + _2347;
    if (_2373)
    {
        bool _2526 = _964 > 0.5;
        _2442 = _2526;
    }
    bool _2528 = _2442;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2532 = _962 + _2530;
    int _2534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2536 = _2534 != 0;
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _2538;
    if (_2373)
    {
        float _2542 = _2528 ? as_type<float>(_2520) : _2355;
        _2510 = _2542;
    }
    float _2544 = _2510;
    float _2546 = _2532 * _2436;
    bool _2548 = uint(_2524) >= uint(_1324);
    float _2550 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2554 = 1.0 / _2540;
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2558 = _962 + _2556;
    bool _2560 = !_2548;
    int _2562 = _2560 ? 0 : (-1);
    float _2564 = _2476 * _964;
    int _2566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2568 = _2566 != 0;
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2570;
    float _2574 = _2558 * _2482;
    float _2576 = 1.0 / _2552;
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2580 = _962 + _2578;
    int _2582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2584 = _2582 != 0;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2588 = _962 + _2586;
    int _2590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2592 = _2590 != 0;
    float _2594 = _2580 * _2410;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2598 = _962 + _2596;
    float _2600 = 1.0 / _2572;
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2604 = _962 + _2602;
    float _2606 = _2598 * _2554;
    float _2608 = _2588 * _2492;
    float _2610 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _2610;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2616 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2614;
    float _2618 = fma(_2414, _2546, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2620 = _2604 * _2576;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _2622;
    float _2626 = fma(_2612, _2546, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2630 = _962 + _2628;
    float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2634 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2632;
    float _2636 = fma(_2616, _2574, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2638;
    float _2642 = fma(_2624, _2574, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _2644 = fma(_2634, _2546, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2646 = fma(_2640, _2574, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2650 = _2648 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _2656 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2658 = _2656 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2662 = _2660 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2664 = _2630 * _2600;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _2668 = _2666 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2670 = fma(_2650, _2594, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2672 = fma(_2422, _2594, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2674 = fma(_2654, _2594, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2676;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2680;
    float _2684 = floor(_2564);
    float _2686 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _2688 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _2686;
    float _2690 = fma(_2658, _2608, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2692 = fma(_2662, _2608, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2694 = fma(_2668, _2608, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _2696 = fma(_2678, _2606, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2698 = fma(_2682, _2606, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2702 = _2700 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2704 = fma(_2688, _2606, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2708 = _2706 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2710 = float(_2347);
    float _2712 = fma(_2702, _2620, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2718 = fma(_2708, _2620, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2720 = _2710 >= _1378;
    bool _2722 = isnan(_2710);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan(_1378);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = -_1120;
    float _2734 = fma(_1388, _2502, _2732);
    float _2736 = -_2684;
    float _2738 = _2564 + _2736;
    float _2740 = fma(_2716, _2620, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _2742 = fma(_2504, _2401, -0.5);
    float _2744 = trunc(_2730);
    int _2746 = int(_2744);
    float _2748 = _2738 * _1378;
    float _2750 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2752 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2750;
    float _2754 = -_1306;
    float _2756 = fma(_1392, _2742, _2754);
    int _2758 = ~_2500;
    int _2760 = _2758 + _2562;
    int _2762 = _2760 + 1;
    float _2764 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2766 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2764;
    float _2768 = trunc(_2748);
    int _2770 = int(_2768);
    float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2774 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _2772;
    bool _2776 = !_2568;
    int _2778 = _2776 ? 0 : 1;
    int _2780 = _1324 * _2762;
    int _2782 = _2780 + _2347;
    bool _2784 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2786 = isnan(_962);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = fma(_2752, _2664, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _2798 = _1324 == 0;
    float _2800 = fma(_2766, _2664, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2802 = fma(_2774, _2664, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    bool _2804 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2806 = isnan(_962);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2812 = _2808 || _2810;
    float _2814 = float(_2812);
    float _2816 = -_2506;
    float _2818 = _2816 + 1.0;
    int _2820 = abs(_2778);
    float _2822 = -_2794;
    float _2824 = _2822 + 1.0;
    int _2826 = ~_2746;
    int _2828 = _2826 + 1;
    int _2830 = _2828 + 1;
    float _2832 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2834 = !_2798;
    int _2836 = _2834 ? _2782 : (-1);
    float _2838 = _2814 * _2824;
    bool _2840 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2842 = isnan(_962);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2848 = _2844 || _2846;
    float _2850 = float(_2848);
    float _2852 = -_2814;
    float _2854 = _2852 + 1.0;
    int _2856 = _2770 * _2820;
    int _2858 = _2856 + _2347;
    int _2860 = _1324 + (-1);
    int _2862 = _2836 * _2830;
    bool _2864 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2866 = isnan(_962);
    bool _2868 = _2864 || _2866;
    bool _2870 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2872 = _2868 || _2870;
    float _2874 = float(_2872);
    float _2876 = -_2850;
    float _2878 = _2876 + 1.0;
    float _2880 = _2850 * _2854;
    bool _2882 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2884 = isnan(_962);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2890 = _2886 || _2888;
    float _2892 = float(_2890);
    float _2894 = trunc(_2351);
    int _2896 = int(_2894);
    float _2898 = _2874 * _2878;
    float _2900 = -_2874;
    float _2902 = _2900 + 1.0;
    int _2904 = _2746 * _2860;
    int _2906 = _2904 + _2862;
    bool _2908 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2910 = isnan(_962);
    bool _2912 = _2908 || _2910;
    bool _2914 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2916 = _2912 || _2914;
    float _2918 = float(_2916);
    float _2920 = _2892 * _2902;
    float _2922 = -_2892;
    float _2924 = _2922 + 1.0;
    int _2926 = abs(_1174);
    int _2928 = _2906 * _2393;
    bool _2930 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2932 = isnan(_962);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2938 = _2934 || _2936;
    float _2940 = float(_2938);
    float _2942 = _2918 * _2924;
    bool _2944 = _962 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2946 = isnan(_962);
    bool _2948 = _2944 || _2946;
    bool _2950 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2952 = _2948 || _2950;
    float _2954 = float(_2952);
    float _2956 = -_2918;
    float _2958 = _2956 + 1.0;
    float _2960 = -_2940;
    float _2962 = _2960 + 1.0;
    int _2964 = _2896 * _2926;
    int _2966 = _2964 + _2928;
    float _2968 = _2940 * _2958;
    float _2970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2972 = _2954 * _2962;
    bool _2974 = !_2536;
    float _2976 = _2974 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2978 = in.m_77.x;
    float _2980 = in.m_77.y;
    float _2982 = in.m_77.z;
    bool _2984 = _1464 != 0.0;
    bool _2986 = isnan(_1464);
    bool _2988 = _2984 || _2986;
    bool _2990 = isnan(0.0);
    bool _2992 = _2988 || _2990;
    float _2994 = _2644 * _2972;
    float _2996 = _2618 * _2972;
    float _2998 = _2626 * _2972;
    int _3000 = abs(as_type<int>(_2976));
    float _3002 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3004 = _2858 * _2397;
    int _3006 = _3004 + _2966;
    bool _3008 = _1462 == 0.0;
    bool _3010 = !_2992;
    bool _3012 = _3008 && _3010;
    int _3014 = _2966;
    float _3016 = _2626;
    float _3018 = _2976;
    int _3020 = as_type<int>(_2996);
    if (_2592)
    {
        float _3022 = -_2355;
        float _3024 = _3022 + 1.0;
        _3014 = as_type<int>(_3024);
    }
    int _3026 = _3014;
    float _3028 = fma(_3002, _2514, -0.5);
    int _3030 = _2770 * _3000;
    int _3032 = _3030 + _3006;
    bool _3034 = _1466 == 0.0;
    bool _3036 = _3034 && _3012;
    float _3038 = as_type<float>(_3026);
    if (_2480)
    {
        float _3040 = -_2355;
        float _3042 = _3040 + 1.0;
        _2444 = as_type<int>(_3042);
    }
    int _3044 = _2444;
    float _3046 = -_2954;
    float _3048 = _3046 + 1.0;
    float _3050 = _3048;
    if (!_2592)
    {
        _3016 = _2355;
    }
    float _3052 = _3016;
    float _3054 = -_1292;
    float _3056 = fma(_1134, _3028, _3054);
    float _3058 = float(uint(_3032));
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2994);
    float _3062 = _3052;
    float _3064 = _3058;
    if (!_2480)
    {
        _3018 = _2355;
    }
    float _3066 = _3018;
    float _3068 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[159].z, _2998);
    float _3070 = _3066;
    if (_2592)
    {
        float _3072 = _2379 ? as_type<float>(_3026) : _2355;
        _3062 = _3072;
    }
    float _3074 = _3062;
    float _3076 = as_type<float>(_2389) * _3058;
    if (_2480)
    {
        float _3078 = _2353 ? as_type<float>(_3044) : _2355;
        _3070 = _3078;
    }
    float _3080 = _3070;
    float _3082 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2996);
    float _3084 = _2980;
    float _3086 = _2978;
    if (_3036)
    {
        _2446 = _2980;
    }
    float _3088 = _2446;
    float _3090 = fma(_2674, _2968, _3068);
    float _3092 = _3088;
    if (_3036)
    {
        _3050 = _2982;
    }
    float _3094 = _3050;
    float _3096 = trunc(_3076);
    float _3098 = precise::max(_3096, 0.0);
    uint _3100 = uint(_3098);
    float _3102 = _3094;
    if (_3036)
    {
        _3064 = _3088;
    }
    float _3104 = _3064;
    float _3106 = _3104;
    if (_3036)
    {
        float _3108 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3088);
        _3038 = _3108;
    }
    float _3110 = _3038;
    float _3112 = _3110;
    if (!_3036)
    {
        _3092 = _2980;
    }
    float _3114 = _3092;
    if (_3036)
    {
        float _3116 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3094);
        _3020 = as_type<int>(_3116);
    }
    int _3118 = _3020;
    int _3120 = _3118;
    if (_3036)
    {
        _3084 = _3094;
    }
    float _3122 = _3084;
    float _3124 = fma(_2672, _2968, _3082);
    float _3126 = _3122;
    if (!_3036)
    {
        _3102 = _2982;
    }
    float _3128 = _3102;
    if (!_3036)
    {
        float _3130 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3114);
        _3112 = _3130;
    }
    float _3132 = _3112;
    float _3134 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3136 = ~_1324;
    int _3138 = _3136 + 1;
    if (!_3036)
    {
        float _3140 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2978);
        _3086 = _3140;
    }
    float _3142 = _3086;
    float _3144 = float(uint(_2858));
    float _3146 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3148 = fma(_3134, _3080, -0.5);
    int _3150 = _3138 * int(_3100);
    int _3152 = _3150 + _3032;
    float _3154 = fma(_2670, _2968, _3060);
    float _3156 = as_type<float>(_2389) * _3144;
    float _3158 = fma(_1386, _3146, _1056);
    int _3160 = ~_1324;
    int _3162 = _3160 + 1;
    float _3164 = fma(_1372, _3148, _1204);
    float _3166 = float(uint(_3152));
    float _3168 = _2970 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3170 = trunc(_3156);
    float _3172 = precise::max(_3170, 0.0);
    uint _3174 = uint(_3172);
    int _3176 = ~_1324;
    int _3178 = _3176 + 1;
    if (!_3036)
    {
        float _3180 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3128);
        _3120 = as_type<int>(_3180);
    }
    int _3182 = _3120;
    float _3184 = as_type<float>(_2389) * _3166;
    float _3186 = fma(_3168, _3074, -0.5);
    float _3188 = _3158 + 0.5;
    if (!_3036)
    {
        _3106 = _3132;
    }
    float _3190 = _3106;
    float _3192 = fma(_2636, _2942, _3154);
    float _3194 = trunc(_3184);
    float _3196 = precise::max(_3194, 0.0);
    uint _3198 = uint(_3196);
    float _3200 = fma(_1158, _3186, _1126);
    bool _3202 = !_3036;
    float _3204 = _3202 ? _3132 : _3114;
    float _3206 = fma(_2646, _2942, _3124);
    bool _3208 = !_3036;
    float _3210 = _3208 ? as_type<float>(_3182) : _3128;
    float _3212 = _3200 + 0.5;
    float _3214 = fma(_2642, _2942, _3090);
    float _3216 = _3204 * _3204;
    int _3218 = _3162 * int(_3174);
    int _3220 = _3218 + _2858;
    float _3222 = _2734 + 0.5;
    float _3224 = fma(_2690, _2920, _3192);
    float _3226 = fma(_3210, _3210, _3216);
    float _3228 = fma(_2692, _2920, _3206);
    float _3230 = float(uint(_3220));
    float _3232 = fma(_2694, _2920, _3214);
    float _3234 = fma(_2696, _2898, _3224);
    int _3236 = int(_3100) + int(_3198);
    float _3238 = rsqrt(_3226);
    float _3240 = as_type<float>(_2389) * _3230;
    float _3242 = _3056 + 0.5;
    float _3244 = fma(_2698, _2898, _3228);
    int _3246 = _3178 * _3236;
    int _3248 = _3246 + _3032;
    float _3250 = fma(_2704, _2898, _3232);
    float _3252 = fma(_2712, _2880, _3234);
    out.m_79.x = _3188;
    out.m_79.y = _3222;
    out.m_79.z = _3212;
    out.m_79.w = _3242;
    float _3254 = abs(_1874);
    float _3256 = log2(_3254);
    bool _3258 = uint(_3248) >= uint(_1324);
    float _3260 = fma(_2718, _2880, _3244);
    float _3262 = fma(_2740, _2880, _3250);
    float _3264 = _1558 * _1650;
    bool _3266 = !_3258;
    int _3268 = _3266 ? 0 : (-1);
    float _3270 = _1568 * _1608;
    float _3272 = _1576 * _1608;
    float _3274 = trunc(_3240);
    float _3276 = precise::max(_3274, 0.0);
    uint _3278 = uint(_3276);
    int _3280 = ~_3236;
    int _3282 = _3280 + _3268;
    int _3284 = _3282 + 1;
    float _3286 = _3210 * _3238;
    float _3288 = fma(_2796, _2838, _3252);
    float _3290 = fma(_2800, _2838, _3260);
    float _3292 = _3164 + 0.5;
    int _3294 = _1324 * _3284;
    int _3296 = _3294 + _3032;
    int _3298 = ~_1324;
    int _3300 = _3298 + 1;
    float _3302 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3304 = _2756 + 0.5;
    if (!_3036)
    {
        _3126 = as_type<float>(_3182);
    }
    float _3306 = _3126;
    float _3308 = _1558 * _1612;
    bool _3310 = !_2798;
    int _3312 = _3310 ? _3296 : (-1);
    float _3314 = fma(_1562, _1594, _3270);
    float _3316 = exp2(_3302);
    float _3318 = fma(_2802, _2838, _3262);
    int _3320 = _3312 >> 31;
    out.m_81.x = _3292;
    out.m_81.y = _3304;
    int _3322 = int(_3174) + int(_3278);
    float _3324 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[166].z, _3318);
    int _3326 = _3320 & 3;
    float _3328 = _3204 * _3238;
    float _3330 = _1568 * _1650;
    int _3332 = _3300 * _3322;
    int _3334 = _3332 + _2858;
    int _3336 = _3312 + _3326;
    float _3338 = _1576 * _1650;
    int _3340 = _3312 & 3;
    bool _3342 = _3340 != 0;
    float _3344 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3288);
    bool _3346 = uint(_3334) >= uint(_1324);
    float _3348 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3350 = precise::clamp(_3348, 0.0, 1.0);
    float _3352 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[166].y, _3290);
    int _3354 = _3336 >> 2;
    float _3356 = -_1548;
    float _3358 = fma(_3356, _1590, _3308);
    bool _3360 = !_3346;
    int _3362 = _3360 ? 0 : (-1);
    float _3364 = fma(_3350, -2.0, 3.0);
    float _3366 = _3350 * _3350;
    int _3368 = _3354 << 4;
    int _3370 = _3368 + 368;
    out.m_83.x = _3344;
    out.m_83.y = _3352;
    out.m_83.z = _3324;
    int _3372 = ~_3322;
    int _3374 = _3372 + _3362;
    int _3376 = _3374 + 1;
    float _3378 = _3366 * _3364;
    float _3380 = _1568 * _1612;
    uint _3382 = uint(int(uint(_3370) >> uint(2)));
    uint _3384 = uint(int(uint(int(_3382)) >> uint(2)));
    int _3386 = int(_3382) & 3;
    float _3388 = (*spvDescriptorSet0.vp_c9)._m0[int(_3384)][_3386];
    int _3390 = int(_3382) + 1;
    uint _3392 = uint(int(uint(_3390) >> uint(2)));
    int _3394 = _3390 & 3;
    float _3396 = (*spvDescriptorSet0.vp_c9)._m0[int(_3392)][_3394];
    float _3398 = _1576 * _1612;
    int _3400 = _1324 * _3376;
    int _3402 = _3400 + _2858;
    int _3404 = _3312 & 3;
    bool _3406 = _3404 != 0;
    float _3408 = _1558 * _1608;
    float _3410 = fma(_1562, _1590, _3380);
    float _3412 = fma(_1562, _1592, _3330);
    bool _3414 = uint(_3404) > 1u;
    int _3416 = _3370 + 8;
    uint _3418 = uint(int(uint(_3416) >> uint(2)));
    uint _3420 = uint(int(uint(int(_3418)) >> uint(2)));
    int _3422 = int(_3418) & 3;
    float _3424 = (*spvDescriptorSet0.vp_c9)._m0[int(_3420)][_3422];
    int _3426 = int(_3418) + 1;
    uint _3428 = uint(int(uint(_3426) >> uint(2)));
    int _3430 = _3426 & 3;
    float _3432 = (*spvDescriptorSet0.vp_c9)._m0[int(_3428)][_3430];
    int _3434 = _3342 ? 0 : 1;
    float _3436 = -_3378;
    float _3438 = _3436 + 1.0;
    float _3440 = -_1548;
    float _3442 = fma(_3440, _1592, _3264);
    float _3444 = -_1548;
    float _3446 = fma(_3444, _1594, _3408);
    int _3448 = ~_3434;
    int _3450 = _3448 + 1;
    int _3452 = _3450 + 1;
    float _3454 = fma(_3438, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3378);
    float _3456 = fma(_1560, _1476, _3442);
    float _3458 = fma(_1560, _1470, _3358);
    float _3460 = fma(_1560, _1486, _3446);
    float _3462 = fma(_1564, _1592, _3338);
    float _3464 = fma(_1564, _1594, _3272);
    int _3466 = _3452;
    if (!_3414)
    {
        int _3468 = ~_3434;
        int _3470 = _3468 + 1;
        _3466 = _3470;
    }
    int _3472 = _3466;
    float _3474 = fma(_1564, _1590, _3398);
    bool _3476 = _3404 != 3;
    float _3478 = fma(_1586, _1476, _3462);
    bool _3480 = !_3406;
    int _3482 = _3480 ? 0 : 1;
    float _3484 = fma(_1586, _1486, _3464);
    int _3486 = abs(_3472);
    float _3488 = fma(_1586, _1470, _3474);
    bool _3490 = uint(_3404) >= 2u;
    float _3492 = _2832 * _2320;
    int _3494 = abs(_3482);
    float _3496 = -_2832;
    float _3498 = _3496 + 1.0;
    float _3500 = -_2318;
    float _3502 = _3500 + 1.0;
    int _3504 = _3490 ? 0 : 1;
    int _3506 = ~_3486;
    int _3508 = _3506 + 1;
    int _3510 = _3508 + 1;
    int _3512 = ~_3504;
    int _3514 = _3512 + 1;
    int _3516 = _3514 + 1;
    int _3518 = _3516;
    if (_3476)
    {
        int _3520 = ~_3504;
        int _3522 = _3520 + 1;
        _3518 = _3522;
    }
    int _3524 = _3518;
    float _3526 = fma(_1572, _1486, _3314);
    int _3528 = ~_3494;
    int _3530 = _3528 + 1;
    int _3532 = _3530 + 1;
    float _3534 = _3458 * _3190;
    bool _3536 = _3404 != 3;
    int _3538 = abs(_3524);
    int _3540 = _3510 * as_type<int>(_3396);
    bool _3542 = !_2584;
    int _3544 = _3542 ? 0 : 1;
    bool _3546 = _1874 <= 8000.0;
    bool _3548 = isnan(_1874);
    bool _3550 = _3546 || _3548;
    bool _3552 = isnan(8000.0);
    bool _3554 = _3550 || _3552;
    float _3556 = float(_3554);
    int _3558 = _3532 * as_type<int>(_3388);
    int _3560 = _3558 + _3540;
    float _3562 = fma(_1572, _1470, _3410);
    float _3564 = fma(_1572, _1476, _3412);
    bool _3566 = !_3536;
    int _3568 = _3566 ? 0 : (-1);
    float _3570 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3572 = _3456 * _3190;
    int _3574 = abs(_3544);
    out.m_85.x = _3562;
    out.m_85.y = _3564;
    out.m_85.z = _3526;
    int _3576 = abs(_3568);
    float _3578 = fma(_3562, _3142, _3534);
    int _3580 = ~_3538;
    int _3582 = _3580 + 1;
    int _3584 = _3582 + 1;
    float _3586 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3570);
    int _3588 = ~_3576;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = fma(_3564, _3142, _3572);
    float _3596 = _3460 * _3190;
    int _3598 = _3584 * as_type<int>(_3424);
    int _3600 = _3598 + _3560;
    int _3602 = ~_3574;
    int _3604 = _3602 + 1;
    int _3606 = _3604 + 1;
    float _3608 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3586);
    float _3610 = fma(_3526, _3142, _3596);
    int _3612 = _3592 * as_type<int>(_3432);
    int _3614 = _3612 + _3600;
    float _3616 = -_3488;
    float _3618 = _3328 * _3616;
    float _3620 = -_3478;
    float _3622 = _3328 * _3620;
    float _3624 = -_3484;
    float _3626 = _3328 * _3624;
    bool _3628 = !_2798;
    int _3630 = _3628 ? _3402 : (-1);
    int _3632 = _3614 * _3606;
    float _3634 = fma(_3286, _3458, _3618);
    float _3636 = fma(_3286, _3456, _3622);
    float _3638 = fma(_3286, _3460, _3626);
    int _3640 = _3630 * _3574;
    int _3642 = _3640 + _3632;
    float _3644 = in.m_87.x;
    float _3646 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3608);
    float _3648 = _2250 * 0.5;
    float _3650 = _2292 + _2250;
    out.m_89.x = _3634;
    out.m_89.y = _3636;
    out.m_89.z = _3638;
    float _3652 = _3646 + _2250;
    float _3654 = _2341 * _3492;
    float _3656 = _3556 * _3454;
    float _3658 = fma(_2294, -0.5, _3648);
    float _3660 = _3652 * 0.5;
    float _3662 = _3650 * 0.5;
    float _3664 = fma(_3488, _3306, _3578);
    float _3666 = fma(_3478, _3306, _3594);
    float _3668 = fma(_3484, _3306, _3610);
    float _3670 = _2331 * _3498;
    float _3672 = _2331 * _3492;
    float _3674 = fma(_2331, _3654, _2329);
    float _3676 = _3656 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _3662;
    out.m_91.y = _3658;
    out.m_91.z = _3660;
    out.m_91.w = _2250;
    float _3678 = fma(_2337, _3672, _2325);
    float _3680 = fma(_2339, _3672, _2327);
    out.m_93.x = _3664;
    out.m_93.y = _3666;
    out.m_93.z = _3668;
    float _3682 = _3502 * _3676;
    float _3684 = precise::clamp(_3682, 0.0, 1.0);
    bool _3686 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3688 = isnan(_2006);
    bool _3690 = _3686 || _3688;
    bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3694 = _3690 || _3692;
    float _3696 = _1984 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _3678;
    out.m_95.y = _3680;
    out.m_95.z = _3674;
    out.m_95.w = _3670;
    float _3698 = -_3684;
    float _3700 = fma(_3698, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3702 = float(_3642);
    out.gl_Position.x = _2292;
    out.gl_Position.y = _2294;
    out.gl_Position.z = _3646;
    out.gl_Position.w = _2250;
    float _3704 = _3700 * _3644;
    out.m_97.x = _3702;
    float _3706 = _3704 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3708 = _3704;
    float _3710 = _3646;
    float _3712 = _3706;
    if (!_3694)
    {
        _3708 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3714 = _3708;
    float _3716 = _3714;
    float _3718 = _3714;
    if (!_3694)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3720 = _2448;
    out.m_99.x = _3706;
    float _3722 = _3720;
    float _3724 = _3720;
    if (!_3694)
    {
        _3710 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3726 = _3710;
    float _3728 = _3726;
    float _3730 = _3726;
    if (!_3694)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3732 = _2450;
    float _3734 = _3732;
    float _3736 = _3732;
    if (!_3694)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3738 = _2452;
    float _3740 = _3738;
    float _3742 = _3738;
    if (!_3694)
    {
        _3712 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3744 = _3712;
    bool _3746 = !_3694;
    float _3748 = _3744;
    float _3750 = _3744;
    if (!_3746)
    {
        bool _3752 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3754 = isnan(_2006);
        bool _3756 = _3752 || _3754;
        bool _3758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3760 = _3756 || _3758;
        if (!_3760)
        {
            float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3764 = _2006 + _3762;
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3772 = _3770 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3774 = 1.0 / _3768;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3792 = _3764 * _3774;
            float _3794 = precise::clamp(_3792, 0.0, 1.0);
            float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3800 = fma(_3794, _3772, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3802 = fma(_3794, _3798, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3804 = fma(_3794, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3806 = fma(_3794, _3782, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3808 = fma(_3794, _3786, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3810 = fma(_3794, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3724 = _3804;
            _3742 = _3808;
            _3718 = _3800;
            _3736 = _3806;
            _3730 = _3802;
            _3750 = _3810;
            _3812 = true;
        }
        else
        {
            bool _3814 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3816 = isnan(_2006);
            bool _3818 = _3814 || _3816;
            bool _3820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3822 = _3818 || _3820;
            if (!_3822)
            {
                _3716 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3824 = _3716;
            _3718 = _3824;
            if (!_3822)
            {
                _3722 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3826 = _3722;
            _3724 = _3826;
            if (!_3822)
            {
                _3728 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3828 = _3728;
            _3730 = _3828;
            if (!_3822)
            {
                _3734 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3830 = _3734;
            _3736 = _3830;
            if (!_3822)
            {
                _3740 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3832 = _3740;
            _3742 = _3832;
            if (!_3822)
            {
                _3748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3834 = _3748;
            bool _3836 = !_3822;
            _3750 = _3834;
            if (!_3836)
            {
                bool _3838 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3840 = isnan(_2006);
                bool _3842 = _3838 || _3840;
                bool _3844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3846 = _3842 || _3844;
                if (!_3846)
                {
                    float _3848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3850 = _2006 + _3848;
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3852;
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3858 = _3856 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3860 = 1.0 / _3854;
                    float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3866 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3878 = _3850 * _3860;
                    float _3880 = precise::clamp(_3878, 0.0, 1.0);
                    float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3886 = fma(_3880, _3858, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3888 = fma(_3880, _3884, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3890 = fma(_3880, _3864, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3892 = fma(_3880, _3868, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3894 = fma(_3880, _3872, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3896 = fma(_3880, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3724 = _3890;
                    _3742 = _3894;
                    _3718 = _3886;
                    _3736 = _3892;
                    _3730 = _3888;
                    _3750 = _3896;
                    _3812 = true;
                }
                else
                {
                    _3724 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3742 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3718 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3736 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3730 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3812 = false;
    float _3898 = _3724;
    float _3900 = _3742;
    float _3902 = _3718;
    float _3904 = _3736;
    float _3906 = _3730;
    float _3908 = _3750;
    float _3910 = _3696 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3912 = fma(_3666, -0.5, 0.5);
    float _3914 = precise::clamp(_3912, 0.0, 1.0);
    float _3916 = -_3898;
    float _3918 = _3916 + _3900;
    float _3920 = -_3902;
    float _3922 = _3920 + _3904;
    out.m_53.x = _3910;
    float _3924 = fma(_3914, _3918, _3898);
    float _3926 = -_3906;
    float _3928 = _3926 + _3908;
    float _3930 = fma(_3914, _3922, _3902);
    float _3932 = _3924 * 0.586610972881317138671875;
    bool _3934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3936 = fma(_3914, _3928, _3906);
    out.m_101.x = 0.0;
    float _3938 = fma(_3930, 0.298911988735198974609375, _3932);
    bool _3940 = _1984 > 0.0;
    bool _3942 = isnan(_1984);
    bool _3944 = _3940 || _3942;
    bool _3946 = isnan(0.0);
    bool _3948 = _3944 || _3946;
    float _3950 = fma(_3936, 0.114477999508380889892578125, _3938);
    float _3952 = -_3950;
    float _3954 = _3930 + _3952;
    float _3956 = -_3950;
    float _3958 = _3924 + _3956;
    float _3960 = -_3950;
    float _3962 = _3936 + _3960;
    float _3964 = fma(_3954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3950);
    float _3966 = fma(_3958, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3950);
    float _3968 = fma(_3962, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3950);
    bool _3970 = !_3934;
    if (!_3970)
    {
        float _3972 = -_1928;
        float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3976 = -_1930;
        float _3978 = _3976 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3980 = -_1932;
        float _3982 = _3980 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3984 = _3974 * _3974;
        float _3986 = fma(_3978, _3978, _3984);
        float _3988 = fma(_3982, _3982, _3986);
        float _3990 = sqrt(_3988);
        float _3992 = rsqrt(_3988);
        float _3994 = -_3990;
        float _3996 = _3994 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3998 = _3996 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4000 = precise::clamp(_3998, 0.0, 1.0);
        float _4002 = _3978 * _3992;
        float _4004 = _3974 * _3992;
        float _4006 = abs(_4000);
        float _4008 = log2(_4006);
        float _4010 = _3982 * _3992;
        float _4012 = _4002 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4014 = _3666 * _4004;
        float _4016 = -_4004;
        float _4018 = -_4012;
        float _4020 = fma(_4016, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4018);
        float _4022 = fma(_3664, _4002, _4014);
        float _4024 = -_4010;
        float _4026 = fma(_4024, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4020);
        float _4028 = fma(_3668, _4010, _4022);
        float _4030 = precise::clamp(_4028, 0.0, 1.0);
        float _4032 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4034 = _4026 + _4032;
        float _4036 = _4008 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4038 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4040 = precise::clamp(_4038, 0.0, 1.0);
        float _4042 = exp2(_4036);
        float _4044 = _4042 * _4040;
        float _4046 = _4030 * _4044;
        float _4048 = _4046 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4050 = _4046 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4052 = _4046 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _4048;
        out.m_101.y = _4050;
        out.m_101.z = _4052;
    }
    out.m_103.x = _3964;
    out.m_103.y = _3966;
    out.m_103.z = _3968;
    if (_3948)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _4054 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4054;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

