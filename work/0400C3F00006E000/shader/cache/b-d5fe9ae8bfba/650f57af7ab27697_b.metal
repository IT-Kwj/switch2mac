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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _812 = false;
    bool _560 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2052 = as_type<float>(_108);
        out.gl_Position.z = _2052;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2121 = as_type<float>(_144);
        out.gl_Position.z = _2121;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _166 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _164);
    float _168 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _170 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _168);
    float _172 = _168;
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _176 = _152;
    if (!_162)
    {
        float _178 = _152 * _152;
        float _180 = _178 * 0.5;
        _172 = _180;
    }
    float _182 = _172;
    float _184 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _166);
    float _186 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _170);
    float _188 = _182;
    if (!_162)
    {
        float _190 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_162;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _152 * _200;
        float _210 = exp2(_208);
        float _212 = _206 * 0.693147182464599609375;
        float _214 = 1.0 / _212;
        float _216 = 1.0 / _204;
        float _218 = _210 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _214, _152);
        float _224 = _222 * _216;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
        _174 = _210;
    }
    float _228 = _196;
    float _230 = _174;
    bool _232 = !_162;
    float _234 = _230;
    if (!_232)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _152 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _176 = _254;
        _234 = _242;
    }
    float _256 = _176;
    float _258 = _234;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = _258;
    float _268 = _260;
    float _270 = _264;
    if (!_162)
    {
        float _272 = _126 * _126;
        float _274 = _272 * 0.5;
        _266 = _274;
    }
    float _276 = _266;
    float _278 = fma(_256, _146, _260);
    float _280 = fma(_256, _148, _262);
    float _282 = fma(_256, _150, _264);
    if (!_162)
    {
        float _284 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _284;
    }
    float _286 = _268;
    bool _288 = !_162;
    float _290 = _286;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _126 * _294;
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = 1.0 / _302;
        float _306 = _296 * 0.693147182464599609375;
        float _308 = exp2(_298);
        float _310 = 1.0 / _306;
        float _312 = _308 + (-1.0);
        float _314 = -_312;
        float _316 = fma(_314, _310, _126);
        float _318 = _316 * _304;
        float _320 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _320;
        _270 = _308;
    }
    float _322 = _290;
    float _324 = _270;
    float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _328 = _324;
    if (!_162)
    {
        _328 = _126;
    }
    float _330 = _328;
    bool _332 = !_162;
    float _334 = _330;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = 1.0 / _342;
        float _346 = _126 * _338;
        float _348 = exp2(_346);
        float _350 = -_348;
        float _352 = _350 + 1.0;
        float _354 = _352 * _344;
        _334 = _354;
    }
    float _356 = _334;
    float _358 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = fma(_356, _148, _326);
    float _362 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _364 = sqrt(_186);
    float _366 = fma(_356, _146, _358);
    float _368 = -_360;
    float _370 = _280 + _368;
    float _372 = fma(_356, _150, _362);
    float _374 = -_366;
    float _376 = _278 + _374;
    float _378 = _370 * _370;
    float _380 = -_372;
    float _382 = _282 + _380;
    float _384 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _386 = fma(_376, _376, _378);
    float _388 = sqrt(_184);
    float _390 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _384);
    float _392 = fma(_382, _382, _386);
    float _394 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _396 = in.m_49.w;
    float _398 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _400 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].y, _394);
    float _402 = sqrt(_392);
    float _404 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _390);
    float _406 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _408 = in.m_42.x;
    float _410 = in.m_42.y;
    float _412 = in.m_42.z;
    float _414 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _416 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].y, _400);
    float _418 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].x, _406);
    float _420 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].z, _398);
    float _422 = sqrt(_404);
    float _424 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].w, _414);
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].x, _418);
    float _428 = _364 * _416;
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].z, _420);
    float _432 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].w, _424);
    float _434 = _388 * _426;
    float _436 = _428 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _438 = _402 >= 9.9999999747524270787835121154785e-07;
    bool _440 = isnan(_402);
    bool _442 = _438 || _440;
    bool _444 = isnan(9.9999999747524270787835121154785e-07);
    bool _446 = _442 || _444;
    float _448 = _428 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _450 = _428 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[24].x, _436);
    float _454 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _448);
    float _456 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[26].x, _450);
    float _458 = _422 * _430;
    float _460 = fma(_280, _396, _410);
    float _462 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[24].z, _452);
    float _464 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[25].z, _454);
    float _466 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[26].z, _456);
    float _468 = fma(_282, _396, _412);
    float _470 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[24].w, _462);
    float _472 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[25].w, _464);
    float _474 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[26].w, _466);
    float _476 = fma(_278, _396, _408);
    float _478 = _472;
    float _480 = _470;
    float _482 = _474;
    float _484 = _422;
    if (!_446)
    {
        bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _488 = !_486;
        if (!_488)
        {
            float _490 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _492 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _496 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _490);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _492);
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _494);
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _496);
            float _506 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _498);
            float _508 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _500);
            float _510 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _504);
            float _512 = _364 * _506;
            float _514 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _502);
            float _516 = _388 * _508;
            float _518 = _512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _520 = _512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _522 = _422 * _514;
            float _524 = _512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _526 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[25].x, _518);
            float _528 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[24].x, _520);
            float _530 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[26].x, _524);
            float _532 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[25].z, _526);
            float _534 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[24].z, _528);
            float _536 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[26].z, _530);
            float _538 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[25].w, _532);
            float _540 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[24].w, _534);
            float _542 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[26].w, _536);
            float _544 = _538 * _538;
            float _546 = fma(_540, _540, _544);
            float _548 = fma(_542, _542, _546);
            float _550 = rsqrt(_548);
            float _552 = _550 * 9.9999999747524270787835121154785e-07;
            float _554 = _540 * _552;
            float _556 = _538 * _552;
            float _558 = _542 * _552;
            _478 = _556;
            _480 = _554;
            _482 = _558;
            _560 = true;
        }
        else
        {
            float _562 = _148 * _148;
            float _564 = fma(_146, _146, _562);
            float _566 = fma(_150, _150, _564);
            float _568 = sqrt(_566);
            bool _570 = _568 >= 9.9999999747524270787835121154785e-07;
            bool _572 = isnan(_568);
            bool _574 = _570 || _572;
            bool _576 = isnan(9.9999999747524270787835121154785e-07);
            bool _578 = _574 || _576;
            if (!_578)
            {
                float _580 = _410 * _410;
                float _582 = fma(_408, _408, _580);
                float _584 = fma(_412, _412, _582);
                float _586 = sqrt(_584);
                bool _588 = _586 >= 9.9999999747524270787835121154785e-07;
                bool _590 = isnan(_586);
                bool _592 = _588 || _590;
                bool _594 = isnan(9.9999999747524270787835121154785e-07);
                bool _596 = _592 || _594;
                if (!_596)
                {
                    float _598 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _600 = _388 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _602 = _422 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _604 = _598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _606 = _598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _608 = _598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _610 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[25].x, _604);
                    float _612 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[24].x, _606);
                    float _614 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[26].x, _608);
                    float _616 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _610);
                    float _618 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _612);
                    float _620 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _614);
                    float _622 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _616);
                    float _624 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _618);
                    float _626 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _620);
                    float _628 = _622 * _622;
                    float _630 = fma(_624, _624, _628);
                    float _632 = fma(_626, _626, _630);
                    float _634 = rsqrt(_632);
                    float _636 = _634 * 9.9999999747524270787835121154785e-07;
                    float _638 = _624 * _636;
                    float _640 = _622 * _636;
                    float _642 = _626 * _636;
                    _478 = _640;
                    _480 = _638;
                    _482 = _642;
                    _560 = true;
                }
                else
                {
                    float _644 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _646 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _648 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _650 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _652 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].y, _644);
                    float _654 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].x, _646);
                    float _656 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].z, _648);
                    float _658 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].w, _650);
                    float _660 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].y, _652);
                    float _662 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].x, _654);
                    float _664 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].z, _656);
                    float _666 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].w, _658);
                    float _668 = _364 * _660;
                    float _670 = _388 * _662;
                    float _672 = _422 * _664;
                    float _674 = _668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _676 = _668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _678 = _668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _680 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _674);
                    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _676);
                    float _684 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _678);
                    float _686 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _680);
                    float _688 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _682);
                    float _690 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _684);
                    float _692 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].w, _686);
                    float _694 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].w, _688);
                    float _696 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].w, _690);
                    float _698 = _692 * _692;
                    float _700 = fma(_694, _694, _698);
                    float _702 = fma(_696, _696, _700);
                    float _704 = rsqrt(_702);
                    float _706 = _704 * 9.9999999747524270787835121154785e-07;
                    float _708 = _694 * _706;
                    float _710 = _692 * _706;
                    float _712 = _696 * _706;
                    _478 = _710;
                    _480 = _708;
                    _482 = _712;
                    _560 = true;
                }
            }
            else
            {
                float _714 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _716 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _718 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _720 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _722 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].y, _714);
                float _724 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].x, _716);
                float _726 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].z, _718);
                float _728 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].w, _720);
                float _730 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].y, _722);
                float _732 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].x, _724);
                float _734 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].z, _726);
                float _736 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].w, _728);
                float _738 = _364 * _730;
                float _740 = _388 * _732;
                float _742 = _422 * _734;
                float _744 = _738 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _746 = _738 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _748 = _738 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _750 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[25].x, _744);
                float _752 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[24].x, _746);
                float _754 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[26].x, _748);
                float _756 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].z, _750);
                float _758 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].z, _752);
                float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].z, _754);
                float _762 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].w, _756);
                float _764 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].w, _758);
                float _766 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].w, _760);
                float _768 = _762 * _762;
                float _770 = fma(_764, _764, _768);
                float _772 = fma(_766, _766, _770);
                float _774 = rsqrt(_772);
                float _776 = _774 * 9.9999999747524270787835121154785e-07;
                float _778 = _764 * _776;
                float _780 = _762 * _776;
                float _782 = _766 * _776;
                _478 = _780;
                _480 = _778;
                _482 = _782;
            }
        }
    }
    _560 = false;
    float _784 = _478;
    float _786 = _480;
    float _788 = _482;
    bool _790 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _792 = !_790;
    float _810;
    if (!_792)
    {
        float _794 = in.m_51.x;
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _798 = _794 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _802 = _800 * _796;
        float _804 = floor(_802);
        float _806 = -_804;
        float _808 = _802 + _806;
        _810 = _808;
        _812 = true;
    }
    else
    {
        float _814 = float(_92);
        float _816 = 1.0 / _814;
        float _818 = _126 * _816;
        _810 = _818;
    }
    _812 = false;
    float _820 = _810;
    float _822 = _784 * _784;
    float _824 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _826 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _828 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _830 = fma(_786, _786, _822);
    float _832 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _834 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].x, _824);
    float _836 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].y, _826);
    float _838 = fma(_788, _788, _830);
    float _840 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].z, _828);
    float _842 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].w, _832);
    float _844 = in.m_49.x;
    float _846 = in.m_49.y;
    float _848 = in.m_49.z;
    float _850 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].y, _836);
    float _852 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].x, _834);
    float _854 = rsqrt(_838);
    float _856 = in.m_53.x;
    float _858 = in.m_53.y;
    float _860 = in.m_53.z;
    float _862 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].z, _840);
    float _864 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].w, _842);
    float _866 = _852 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _868 = _864 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _870 = _388 * _866;
    float _872 = _854 * _788;
    float _874 = _854 * _786;
    float _876 = _854 * _784;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _880 = _872 * _878;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _884 = _874 * _882;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _888 = _876 * _886;
    float _890 = _848 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _894 = -_880;
    float _896 = fma(_874, _892, _894);
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _900 = -_884;
    float _902 = fma(_876, _898, _900);
    float _904 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _906 = -_888;
    float _908 = fma(_872, _904, _906);
    float _910 = _850 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _912 = _896 * _896;
    float _914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _860);
    float _916 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _918 = _846 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _920 = fma(_908, _908, _912);
    float _922 = _364 * _910;
    float _924 = _862 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _926 = _916 * _914;
    float _928 = fma(_902, _902, _920);
    float _930 = _844 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _858);
    float _934 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _936 = _922 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _856);
    float _940 = rsqrt(_928);
    float _942 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _944 = _934 * _932;
    float _946 = _922 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _948 = _422 * _924;
    float _950 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _936);
    float _952 = _942 * _938;
    float _954 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _946);
    float _956 = _944 * _874;
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[26].z, _950);
    float _960 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[24].z, _954);
    float _962 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].w, _958);
    float _964 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].w, _960);
    float _966 = _896 * _940;
    float _968 = _902 * _940;
    float _970 = _908 * _940;
    float _972 = _944 * _872;
    float _974 = _874 * _966;
    float _976 = _876 * _968;
    float _978 = _962 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _980 = fma(_952, _968, _972);
    float _982 = -_974;
    float _984 = fma(_876, _970, _982);
    float _986 = fma(_952, _970, _956);
    float _988 = -_976;
    float _990 = fma(_872, _966, _988);
    float _992 = _964 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _994 = fma(_926, _984, _980);
    float _996 = _922 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _998 = fma(_926, _990, _986);
    float _1000 = _944 * _876;
    float _1002 = _978 + _994;
    float _1004 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _996);
    float _1006 = _992 + _998;
    float _1008 = _872 * _970;
    float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1012 = _1002 + _1010;
    float _1014 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1004);
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1018 = _1006 + _1016;
    float _1020 = fma(_952, _966, _1000);
    float _1022 = _1012 * _1012;
    float _1024 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1014);
    float _1026 = -_1008;
    float _1028 = fma(_874, _968, _1026);
    float _1030 = fma(_1018, _1018, _1022);
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1034 = fma(_926, _1028, _1020);
    float _1036 = sqrt(_1030);
    float _1038 = _1032 + _1034;
    bool _1040 = _1036 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1004;
    float _1044 = _1006;
    float _1046 = _996;
    float _1048 = _1018;
    float _1050 = _868;
    int _1052 = as_type<int>(_858);
    float _1054 = _856;
    if (!_1040)
    {
        _1042 = _1002;
    }
    float _1056 = _1042;
    float _1058 = _1056;
    if (!_1040)
    {
        _484 = _1038;
    }
    float _1060 = _484;
    bool _1062 = !_1040;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _1036 + _1068;
        float _1072 = rsqrt(_1030);
        float _1074 = _1070 * _1066;
        float _1076 = _1038 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = _1074 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = fma(_1082, _1076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = _1072 * _1088;
        float _1092 = _1086 + (-1.0);
        float _1094 = fma(_1018, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1096 = fma(_1012, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1098 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1100 = fma(_1038, _1086, _1098);
        _1064 = _1100;
        _1044 = _1094;
        _1058 = _1096;
        _1046 = _1078;
    }
    float _1102 = _1064;
    float _1104 = _1044;
    float _1106 = _1058;
    float _1108 = _1046;
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1112 = _1102 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1116 = _1104 + _1114;
    float _1118 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1120 = _1106 + _1118;
    float _1122 = _1112 * _1112;
    float _1124 = fma(_1116, _1116, _1122);
    float _1126 = fma(_1120, _1120, _1124);
    float _1128 = rsqrt(_1126);
    float _1130 = sqrt(_1126);
    float _1132 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1134 = _1116 * _1132;
    float _1136 = _1120 * _1132;
    float _1138 = _1134 * _1134;
    float _1140 = _1136 * _1136;
    float _1142 = _1138 + _1140;
    float _1144 = sqrt(_1142);
    bool _1146 = _1144 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1150 = _1144 + _1148;
    float _1152 = _922;
    float _1154 = _1150;
    if (_1146)
    {
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1152 = _1156;
    }
    float _1158 = _1152;
    if (_1146)
    {
        float _1160 = rsqrt(_1142);
        _1048 = _1160;
    }
    float _1162 = _1048;
    float _1164 = _1162;
    if (_1146)
    {
        float _1166 = _1150 * _1158;
        _1154 = _1166;
    }
    float _1168 = _1154;
    float _1170 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1146)
    {
        float _1172 = _1168 * 0.15915493667125701904296875;
        _1050 = _1172;
    }
    float _1174 = _1050;
    float _1176 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1170);
    float _1178 = _1108;
    float _1180 = _1174;
    if (_1146)
    {
        float _1182 = _1174 * 6.283185482025146484375;
        float _1184 = sin(_1182);
        _1178 = _1184;
    }
    float _1186 = _1178;
    float _1188 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1190 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1176);
    float _1192 = precise::max(0.0, _1188);
    float _1194 = _1012;
    float _1196 = _1192;
    float _1198 = _1188;
    if (_1146)
    {
        float _1200 = _1174 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        _1194 = _1202;
    }
    float _1204 = _1194;
    float _1206 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1208 = -_1132;
    float _1210 = -_1192;
    float _1212 = fma(_1112, _1208, _1210);
    if (_1146)
    {
        float _1214 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1196 = _1214;
    }
    float _1216 = _1196;
    float _1218 = _1216;
    if (!_1146)
    {
        _1180 = _1138;
    }
    float _1220 = _1180;
    float _1222 = _1186;
    float _1224 = _1220;
    if (_1146)
    {
        float _1226 = fma(_1186, _1216, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1218 = _1226;
    }
    float _1228 = _1218;
    float _1230 = _1228;
    if (!_1146)
    {
        _1222 = _1134;
    }
    float _1232 = _1222;
    float _1234 = _1232;
    float _1236 = _1204;
    if (_1146)
    {
        float _1238 = _1204 + (-1.0);
        _1198 = _1238;
    }
    float _1240 = _1198;
    float _1242 = 0.0;
    float _1244 = _1240;
    if (_1146)
    {
        float _1246 = _1162 * _1228;
        _1242 = _1246;
    }
    float _1248 = _1242;
    if (!_1146)
    {
        _1164 = _1212;
    }
    float _1250 = _1164;
    float _1252 = _1250;
    if (_1146)
    {
        float _1254 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1230 = _1254;
    }
    float _1256 = _1230;
    if (_1146)
    {
        float _1258 = _1134 * _1248;
        _1234 = _1258;
    }
    float _1260 = _1234;
    if (!_1146)
    {
        _1244 = _1136;
    }
    float _1262 = _1244;
    float _1264 = _1262;
    if (_1146)
    {
        float _1266 = _1136 * _1248;
        _1264 = _1266;
    }
    float _1268 = _1264;
    if (_1146)
    {
        float _1270 = fma(_1212, _1204, _1256);
        _1252 = _1270;
    }
    float _1272 = _1252;
    if (_1146)
    {
        float _1274 = _1260 * _1260;
        _1224 = _1274;
    }
    float _1276 = _1224;
    if (!_1146)
    {
        _1236 = _1140;
    }
    float _1278 = _1236;
    float _1280 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1282 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1284 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1286 = _1278;
    if (_1146)
    {
        float _1288 = _1268 * _1268;
        _1286 = _1288;
    }
    float _1290 = _1286;
    float _1292 = fma(_1272, _1272, _1276);
    float _1294 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1280);
    float _1296 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1282);
    float _1298 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1284);
    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1302 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1300);
    float _1304 = precise::clamp(_1302, 0.0, 1.0);
    float _1306 = _1292 + _1290;
    float _1308 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1296);
    float _1310 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1294);
    float _1312 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1314 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1316 = rsqrt(_1306);
    float _1318 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1320 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1324 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1298);
    float _1326 = -_1304;
    float _1328 = _1326 + 1.0;
    float _1330 = -_1312;
    float _1332 = fma(_1330, _1320, 1.0);
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1322);
    float _1336 = _1324 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1338 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1334);
    float _1340 = abs(_1328);
    float _1342 = log2(_1340);
    float _1344 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1346 = _1316 * _1260;
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1338);
    float _1350 = _1316 * _1272;
    float _1352 = _1316 * _1268;
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1356 = log2(_1332);
    float _1358 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1344);
    float _1360 = _1350 + 1.0;
    float _1362 = -_1354;
    float _1364 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1362);
    float _1366 = -_1352;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1364);
    float _1370 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1372 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1374 = 1.0 / _1348;
    float _1376 = fma(_1368, -0.5, 0.5);
    float _1378 = fma(_1368, 0.5, 0.5);
    float _1380 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1372);
    float _1382 = fma(_1378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1384 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1380);
    float _1386 = exp2(_1370);
    float _1388 = fma(_1378, _1382, -0.212114393711090087890625);
    float _1390 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1384);
    float _1392 = fma(_1378, _1388, 1.570728778839111328125);
    float _1394 = sqrt(_1376);
    float _1396 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1358);
    float _1398 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1396);
    float _1400 = _1356 * 0.693147182464599609375;
    float _1402 = _1390 * _1374;
    float _1404 = -_1350;
    float _1406 = fma(_1386, _1360, _1404);
    float _1408 = _1398 * _1374;
    float _1410 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1412 = fma(_1402, 0.5, 0.5);
    float _1414 = fma(_1406, 0.5, 0.5);
    float _1416 = fma(_1408, -0.5, 0.5);
    float _1418 = _1394 * 0.636619746685028076171875;
    float _1420 = -_1392;
    float _1422 = fma(_1418, _1420, 1.0);
    float3 _4370 = float3(_1412, _1416, _1410);
    float _1424 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4370, float3(0.0), isnan(_4370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4370, float3(0.0), isnan(_4370)), level(0.0)).x;
    float3 _4381 = float3(_1412, _1416, _1410);
    float4 _1427 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4381, float3(0.0), isnan(_4381)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4381, float3(0.0), isnan(_4381)), level(0.0)).xyzw;
    float _1429 = _1427.x;
    float _1431 = _1427.y;
    float _1433 = _1427.z;
    float _1435 = _1427.w;
    float2 _4398 = float2(_1422, _1414);
    float3 _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4398, float2(0.0), isnan(_4398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4398, float2(0.0), isnan(_4398)), level(0.0)).xyz;
    float _1441 = _1439.x;
    float _1443 = _1439.y;
    float _1445 = _1439.z;
    float _1447 = in.m_55.y;
    float _1449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1453 = _1451 != 0;
    float _1455 = in.m_51.w;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1459 = _1457 != 0;
    float _1461 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1463 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1461);
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1475 = _1447;
    if (_1453)
    {
        float _1477 = in.m_51.x;
        _1473 = _1477;
    }
    float _1479 = _1473;
    float _1481 = 1.0 / _1467;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1485 = _1483 != 0;
    float _1487 = _1410;
    if (!_1459)
    {
        float _1489 = in.m_51.y;
        _1487 = _1489;
    }
    float _1491 = _1487;
    float _1493 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1463);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1497 = _1495 != 0;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1501 = _1499 != 0;
    bool _1503 = _1455 > 0.5;
    float _1505 = in.m_55.x;
    float _1507 = 0.0;
    bool _1509 = _1497;
    float _1511 = _1505;
    if (_1485)
    {
        float _1513 = in.m_51.z;
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = 1.0 / _1471;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1525 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1527 = false;
    float _1529 = _1479;
    if (_1453)
    {
        bool _1531 = _1479 > 0.5;
        _1527 = _1531;
    }
    bool _1533 = _1527;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1543 = -_1447;
    float _1545 = _1543 + 1.0;
    float _1547 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1549 = _1537 * _1481;
    float _1551 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1459)
    {
        _1529 = _1491;
    }
    float _1553 = _1529;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1557 = _1503 ? as_type<int>(_1545) : as_type<int>(_1447);
    float _1559 = _1541 * _1517;
    bool _1561 = _858 != 0.0;
    bool _1563 = isnan(_858);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan(0.0);
    bool _1569 = _1565 || _1567;
    float _1571 = in.m_59.x;
    float _1573 = in.m_59.y;
    float _1575 = in.m_59.z;
    float _1577 = _1497 ? as_type<float>(_1557) : _1447;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1581 = _820 + _1579;
    bool _1583 = _856 == 0.0;
    bool _1585 = !_1569;
    bool _1587 = _1583 && _1585;
    out.m_61.x = _1525;
    out.m_61.y = _1547;
    out.m_61.z = _1551;
    if (_1485)
    {
        bool _1589 = _1515 > 0.5;
        _1509 = _1589;
    }
    bool _1591 = _1509;
    float _1593 = fma(_1559, _1581, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1595 = _860 == 0.0;
    bool _1597 = _1595 && _1587;
    float _1599 = _1551;
    if (!_1459)
    {
        float _1601 = in.m_51.z;
        _1599 = _1601;
    }
    float _1603 = _1599;
    bool _1605 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1607 = isnan(_820);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = _1553;
    float _1619 = _1491;
    if (_1459)
    {
        float _1621 = in.m_51.x;
        float _1623 = in.m_51.y;
        _1617 = _1621;
        _1619 = _1623;
    }
    float _1625 = _1617;
    float _1627 = _1619;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1631 = _820 + _1629;
    bool _1633 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1635 = isnan(_820);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = fma(_1549, _1631, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1647 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1649 = isnan(_820);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1655 = _1651 || _1653;
    float _1657 = float(_1655);
    float _1659 = -_1643;
    float _1661 = _1659 + 1.0;
    float _1663 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1665 = _1573;
    float _1667 = _1657;
    float _1669 = _1571;
    float _1671 = _1575;
    if (!_1597)
    {
        float _1673 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1665 = _1673;
    }
    float _1675 = _1665;
    if (_1453)
    {
        float _1677 = -_1505;
        float _1679 = _1677 + 1.0;
        _1052 = as_type<int>(_1679);
    }
    int _1681 = _1052;
    float _1683 = -_1657;
    float _1685 = _1683 + 1.0;
    float _1687 = _1657 * _1661;
    if (!_1453)
    {
        _1667 = _1505;
    }
    float _1689 = _1667;
    float _1691 = _874 * _1675;
    float _1693 = _1615 * _1685;
    float _1695 = _876 * _1675;
    float _1697 = _872 * _1675;
    float _1699 = _1689;
    int _1701 = as_type<int>(_1693);
    if (_1453)
    {
        float _1703 = _1533 ? as_type<float>(_1681) : _1505;
        _1699 = _1703;
    }
    float _1705 = _1699;
    float _1707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_1597)
    {
        float _1709 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1571);
        _1669 = _1709;
    }
    float _1711 = _1669;
    float _1713 = _1603;
    if (!_1459)
    {
        _1054 = _1603;
    }
    float _1715 = _1054;
    float _1717 = _1715;
    if (!_1597)
    {
        float _1719 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1575);
        _1671 = _1719;
    }
    float _1721 = _1671;
    float _1723 = _1645 * _1693;
    if (_1459)
    {
        _1717 = _1627;
    }
    float _1725 = _1717;
    if (_1485)
    {
        float _1727 = -_1505;
        float _1729 = _1727 + 1.0;
        _1701 = as_type<int>(_1729);
    }
    int _1731 = _1701;
    if (_1459)
    {
        _1713 = _1627;
    }
    float _1733 = _1713;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1737 = _1627 > 0.5;
    float _1739 = -_1615;
    float _1741 = _1739 + 1.0;
    float _1743 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1735);
    if (_1485)
    {
        float _1745 = _1591 ? as_type<float>(_1731) : _1505;
        _1511 = _1745;
    }
    float _1747 = _1511;
    float _1749 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1723);
    float _1751 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1755 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1555);
    float _1757 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1763 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1765 = -_1753;
    float _1767 = fma(_1751, 2.0, _1765);
    float _1769 = fma(_1593, _1687, _1749);
    float _1771 = fma(_1757, -2.0, _1761);
    float _1773 = fma(_1763, _1747, -0.5);
    if (_1501)
    {
        float _1775 = _1737 ? _1545 : _1447;
        _1475 = _1775;
    }
    float _1777 = _1475;
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1781 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1743);
    float _1783 = -_126;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1767);
    float _1787 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1755);
    float _1789 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1771);
    float _1791 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1769);
    float _1793 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1795 = fma(_1663, _1577, -0.5);
    float _1797 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1799 = fma(_1781, _1773, _1785);
    float _1801 = _1793 * _1759;
    float _1803 = -_1789;
    float _1805 = fma(_1787, _1795, _1803);
    float _1807 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1809 = fma(_970, _1711, _1691);
    float _1811 = _1797 * _1779;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1817 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1807);
    float _1819 = fma(_966, _1711, _1695);
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1823 = fma(_968, _1711, _1697);
    float _1825 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1827 = _1815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1833 = _1799 + 0.5;
    float _1835 = _1805 + 0.5;
    float _1837 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1817);
    float _1839 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1841 = fma(_990, _1721, _1809);
    float _1843 = fma(_1028, _1721, _1819);
    float _1845 = fma(_984, _1721, _1823);
    out.m_63.x = _1829;
    out.m_63.y = _1825;
    out.m_63.z = _1827;
    out.m_63.w = _1831;
    float _1847 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1849 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1839);
    float _1851 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _1801;
    out.m_65.y = _1811;
    out.m_65.z = _1833;
    out.m_65.w = _1835;
    float _1853 = 1.0 / _1847;
    bool _1855 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1857 = isnan(0.5);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1863 = _1859 || _1861;
    float _1865 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1849);
    out.m_67.x = _1841;
    out.m_67.y = _1843;
    out.m_67.z = _1845;
    float _1867 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1493);
    float _1869 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1871 = exp2(_1851);
    float _1873 = _1869 + _1847;
    float _1875 = _1841;
    if (_1863)
    {
        _1875 = 1.0;
    }
    float _1877 = _1875;
    float _1879 = _1873 * _1853;
    float _1881 = _1879 * 0.5;
    float _1883 = _1877;
    if (!_1863)
    {
        float _1885 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1887 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1889 = _1885 * 0.15915493667125701904296875;
        float _1891 = _1887 * 0.15915493667125701904296875;
        float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1895 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1893);
        float _1897 = _1889 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = _1889 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = 1.0 / _1899;
        float _1907 = _1891 * 6.283185482025146484375;
        float _1909 = cos(_1907);
        float _1911 = _1903 * _1905;
        float _1913 = _1891 * 6.283185482025146484375;
        float _1915 = sin(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = 1.0 / _1895;
        float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1923 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1921;
        float _1925 = 1.0 / _1917;
        float _1927 = 1.0 / _1923;
        float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1931 = _1919 * _1929;
        float _1933 = _1915 * _1925;
        float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1937 = fma(_1933, _1931, _1935);
        float _1939 = _1937 * _1927;
        float _1941 = precise::clamp(_1939, 0.0, 1.0);
        _1883 = _1941;
    }
    float _1943 = _1883;
    float _1945 = -_1871;
    float _1947 = _1945 + 1.0;
    bool _1949 = _1943 > 0.0;
    bool _1951 = isnan(_1943);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(0.0);
    bool _1957 = _1953 || _1955;
    float _1959 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1961 = _1867 + _1348;
    float _1963 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1965 = _1390 + _1348;
    float _1967 = _1348 * 0.5;
    out.m_69.x = _1116;
    out.m_69.y = _1112;
    out.m_69.z = _1120;
    float _1969 = _1963 * _1424;
    float _1971 = -_1963;
    float _1973 = _1971 + 1.0;
    float _1975 = _1961 * 0.5;
    float _1977 = _1435 * _1969;
    float _1979 = _1445 * _1969;
    float _1981 = _1435 * _1973;
    float _1983 = _1965 * 0.5;
    float _1985 = fma(_1398, -0.5, _1967);
    float _1987 = _1959 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1989 = fma(_1441, _1977, _1429);
    float _1991 = fma(_1443, _1977, _1431);
    float _1993 = fma(_1435, _1979, _1433);
    out.gl_Position.x = _1390;
    out.gl_Position.y = _1398;
    out.gl_Position.z = _1867;
    out.gl_Position.w = _1348;
    out.m_71.x = _1983;
    out.m_71.y = _1985;
    out.m_71.z = _1975;
    out.m_71.w = _1348;
    out.m_45.x = _1987;
    out.m_73.x = _1989;
    out.m_73.y = _1991;
    out.m_73.z = _1993;
    out.m_73.w = _1981;
    if (_1957)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1995 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1995;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _812 = false;
    bool _560 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2052 = as_type<float>(_108);
        out.gl_Position.z = _2052;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2121 = as_type<float>(_144);
        out.gl_Position.z = _2121;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _166 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _164);
    float _168 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _170 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _168);
    float _172 = _168;
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _176 = _152;
    if (!_162)
    {
        float _178 = _152 * _152;
        float _180 = _178 * 0.5;
        _172 = _180;
    }
    float _182 = _172;
    float _184 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _166);
    float _186 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _170);
    float _188 = _182;
    if (!_162)
    {
        float _190 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_162;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _152 * _200;
        float _210 = exp2(_208);
        float _212 = _206 * 0.693147182464599609375;
        float _214 = 1.0 / _212;
        float _216 = 1.0 / _204;
        float _218 = _210 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _214, _152);
        float _224 = _222 * _216;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
        _174 = _210;
    }
    float _228 = _196;
    float _230 = _174;
    bool _232 = !_162;
    float _234 = _230;
    if (!_232)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _152 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _176 = _254;
        _234 = _242;
    }
    float _256 = _176;
    float _258 = _234;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = _258;
    float _268 = _260;
    float _270 = _264;
    if (!_162)
    {
        float _272 = _126 * _126;
        float _274 = _272 * 0.5;
        _266 = _274;
    }
    float _276 = _266;
    float _278 = fma(_256, _146, _260);
    float _280 = fma(_256, _148, _262);
    float _282 = fma(_256, _150, _264);
    if (!_162)
    {
        float _284 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _284;
    }
    float _286 = _268;
    bool _288 = !_162;
    float _290 = _286;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _126 * _294;
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = 1.0 / _302;
        float _306 = _296 * 0.693147182464599609375;
        float _308 = exp2(_298);
        float _310 = 1.0 / _306;
        float _312 = _308 + (-1.0);
        float _314 = -_312;
        float _316 = fma(_314, _310, _126);
        float _318 = _316 * _304;
        float _320 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _320;
        _270 = _308;
    }
    float _322 = _290;
    float _324 = _270;
    float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _328 = _324;
    if (!_162)
    {
        _328 = _126;
    }
    float _330 = _328;
    bool _332 = !_162;
    float _334 = _330;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = 1.0 / _342;
        float _346 = _126 * _338;
        float _348 = exp2(_346);
        float _350 = -_348;
        float _352 = _350 + 1.0;
        float _354 = _352 * _344;
        _334 = _354;
    }
    float _356 = _334;
    float _358 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = fma(_356, _148, _326);
    float _362 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _364 = sqrt(_186);
    float _366 = fma(_356, _146, _358);
    float _368 = -_360;
    float _370 = _280 + _368;
    float _372 = fma(_356, _150, _362);
    float _374 = -_366;
    float _376 = _278 + _374;
    float _378 = _370 * _370;
    float _380 = -_372;
    float _382 = _282 + _380;
    float _384 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _386 = fma(_376, _376, _378);
    float _388 = sqrt(_184);
    float _390 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _384);
    float _392 = fma(_382, _382, _386);
    float _394 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _396 = in.m_49.w;
    float _398 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _400 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].y, _394);
    float _402 = sqrt(_392);
    float _404 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _390);
    float _406 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _408 = in.m_42.x;
    float _410 = in.m_42.y;
    float _412 = in.m_42.z;
    float _414 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _416 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].y, _400);
    float _418 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].x, _406);
    float _420 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].z, _398);
    float _422 = sqrt(_404);
    float _424 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].w, _414);
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].x, _418);
    float _428 = _364 * _416;
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].z, _420);
    float _432 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].w, _424);
    float _434 = _388 * _426;
    float _436 = _428 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _438 = _402 >= 9.9999999747524270787835121154785e-07;
    bool _440 = isnan(_402);
    bool _442 = _438 || _440;
    bool _444 = isnan(9.9999999747524270787835121154785e-07);
    bool _446 = _442 || _444;
    float _448 = _428 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _450 = _428 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[24].x, _436);
    float _454 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _448);
    float _456 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[26].x, _450);
    float _458 = _422 * _430;
    float _460 = fma(_280, _396, _410);
    float _462 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[24].z, _452);
    float _464 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[25].z, _454);
    float _466 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[26].z, _456);
    float _468 = fma(_282, _396, _412);
    float _470 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[24].w, _462);
    float _472 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[25].w, _464);
    float _474 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[26].w, _466);
    float _476 = fma(_278, _396, _408);
    float _478 = _472;
    float _480 = _470;
    float _482 = _474;
    float _484 = _422;
    if (!_446)
    {
        bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _488 = !_486;
        if (!_488)
        {
            float _490 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _492 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _496 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _490);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _492);
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _494);
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _496);
            float _506 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _498);
            float _508 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _500);
            float _510 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _504);
            float _512 = _364 * _506;
            float _514 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _502);
            float _516 = _388 * _508;
            float _518 = _512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _520 = _512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _522 = _422 * _514;
            float _524 = _512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _526 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[25].x, _518);
            float _528 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[24].x, _520);
            float _530 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[26].x, _524);
            float _532 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[25].z, _526);
            float _534 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[24].z, _528);
            float _536 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[26].z, _530);
            float _538 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[25].w, _532);
            float _540 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[24].w, _534);
            float _542 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[26].w, _536);
            float _544 = _538 * _538;
            float _546 = fma(_540, _540, _544);
            float _548 = fma(_542, _542, _546);
            float _550 = rsqrt(_548);
            float _552 = _550 * 9.9999999747524270787835121154785e-07;
            float _554 = _540 * _552;
            float _556 = _538 * _552;
            float _558 = _542 * _552;
            _478 = _556;
            _480 = _554;
            _482 = _558;
            _560 = true;
        }
        else
        {
            float _562 = _148 * _148;
            float _564 = fma(_146, _146, _562);
            float _566 = fma(_150, _150, _564);
            float _568 = sqrt(_566);
            bool _570 = _568 >= 9.9999999747524270787835121154785e-07;
            bool _572 = isnan(_568);
            bool _574 = _570 || _572;
            bool _576 = isnan(9.9999999747524270787835121154785e-07);
            bool _578 = _574 || _576;
            if (!_578)
            {
                float _580 = _410 * _410;
                float _582 = fma(_408, _408, _580);
                float _584 = fma(_412, _412, _582);
                float _586 = sqrt(_584);
                bool _588 = _586 >= 9.9999999747524270787835121154785e-07;
                bool _590 = isnan(_586);
                bool _592 = _588 || _590;
                bool _594 = isnan(9.9999999747524270787835121154785e-07);
                bool _596 = _592 || _594;
                if (!_596)
                {
                    float _598 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _600 = _388 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _602 = _422 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _604 = _598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _606 = _598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _608 = _598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _610 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[25].x, _604);
                    float _612 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[24].x, _606);
                    float _614 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[26].x, _608);
                    float _616 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _610);
                    float _618 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _612);
                    float _620 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _614);
                    float _622 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _616);
                    float _624 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _618);
                    float _626 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _620);
                    float _628 = _622 * _622;
                    float _630 = fma(_624, _624, _628);
                    float _632 = fma(_626, _626, _630);
                    float _634 = rsqrt(_632);
                    float _636 = _634 * 9.9999999747524270787835121154785e-07;
                    float _638 = _624 * _636;
                    float _640 = _622 * _636;
                    float _642 = _626 * _636;
                    _478 = _640;
                    _480 = _638;
                    _482 = _642;
                    _560 = true;
                }
                else
                {
                    float _644 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _646 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _648 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _650 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _652 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].y, _644);
                    float _654 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].x, _646);
                    float _656 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].z, _648);
                    float _658 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].w, _650);
                    float _660 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].y, _652);
                    float _662 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].x, _654);
                    float _664 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].z, _656);
                    float _666 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].w, _658);
                    float _668 = _364 * _660;
                    float _670 = _388 * _662;
                    float _672 = _422 * _664;
                    float _674 = _668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _676 = _668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _678 = _668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _680 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _674);
                    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _676);
                    float _684 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _678);
                    float _686 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _680);
                    float _688 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _682);
                    float _690 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _684);
                    float _692 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].w, _686);
                    float _694 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].w, _688);
                    float _696 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].w, _690);
                    float _698 = _692 * _692;
                    float _700 = fma(_694, _694, _698);
                    float _702 = fma(_696, _696, _700);
                    float _704 = rsqrt(_702);
                    float _706 = _704 * 9.9999999747524270787835121154785e-07;
                    float _708 = _694 * _706;
                    float _710 = _692 * _706;
                    float _712 = _696 * _706;
                    _478 = _710;
                    _480 = _708;
                    _482 = _712;
                    _560 = true;
                }
            }
            else
            {
                float _714 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _716 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _718 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _720 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _722 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].y, _714);
                float _724 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].x, _716);
                float _726 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].z, _718);
                float _728 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].w, _720);
                float _730 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].y, _722);
                float _732 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].x, _724);
                float _734 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].z, _726);
                float _736 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].w, _728);
                float _738 = _364 * _730;
                float _740 = _388 * _732;
                float _742 = _422 * _734;
                float _744 = _738 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _746 = _738 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _748 = _738 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _750 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[25].x, _744);
                float _752 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[24].x, _746);
                float _754 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[26].x, _748);
                float _756 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].z, _750);
                float _758 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].z, _752);
                float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].z, _754);
                float _762 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].w, _756);
                float _764 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].w, _758);
                float _766 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].w, _760);
                float _768 = _762 * _762;
                float _770 = fma(_764, _764, _768);
                float _772 = fma(_766, _766, _770);
                float _774 = rsqrt(_772);
                float _776 = _774 * 9.9999999747524270787835121154785e-07;
                float _778 = _764 * _776;
                float _780 = _762 * _776;
                float _782 = _766 * _776;
                _478 = _780;
                _480 = _778;
                _482 = _782;
            }
        }
    }
    _560 = false;
    float _784 = _478;
    float _786 = _480;
    float _788 = _482;
    bool _790 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _792 = !_790;
    float _810;
    if (!_792)
    {
        float _794 = in.m_51.x;
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _798 = _794 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _802 = _800 * _796;
        float _804 = floor(_802);
        float _806 = -_804;
        float _808 = _802 + _806;
        _810 = _808;
        _812 = true;
    }
    else
    {
        float _814 = float(_92);
        float _816 = 1.0 / _814;
        float _818 = _126 * _816;
        _810 = _818;
    }
    _812 = false;
    float _820 = _810;
    float _822 = _784 * _784;
    float _824 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _826 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _828 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _830 = fma(_786, _786, _822);
    float _832 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _834 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].x, _824);
    float _836 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].y, _826);
    float _838 = fma(_788, _788, _830);
    float _840 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].z, _828);
    float _842 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].w, _832);
    float _844 = in.m_49.x;
    float _846 = in.m_49.y;
    float _848 = in.m_49.z;
    float _850 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].y, _836);
    float _852 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].x, _834);
    float _854 = rsqrt(_838);
    float _856 = in.m_53.x;
    float _858 = in.m_53.y;
    float _860 = in.m_53.z;
    float _862 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].z, _840);
    float _864 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].w, _842);
    float _866 = _852 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _868 = _864 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _870 = _388 * _866;
    float _872 = _854 * _788;
    float _874 = _854 * _786;
    float _876 = _854 * _784;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _880 = _872 * _878;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _884 = _874 * _882;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _888 = _876 * _886;
    float _890 = _848 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _894 = -_880;
    float _896 = fma(_874, _892, _894);
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _900 = -_884;
    float _902 = fma(_876, _898, _900);
    float _904 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _906 = -_888;
    float _908 = fma(_872, _904, _906);
    float _910 = _850 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _912 = _896 * _896;
    float _914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _860);
    float _916 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _918 = _846 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _920 = fma(_908, _908, _912);
    float _922 = _364 * _910;
    float _924 = _862 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _926 = _916 * _914;
    float _928 = fma(_902, _902, _920);
    float _930 = _844 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _858);
    float _934 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _936 = _922 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _856);
    float _940 = rsqrt(_928);
    float _942 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _944 = _934 * _932;
    float _946 = _922 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _948 = _422 * _924;
    float _950 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _936);
    float _952 = _942 * _938;
    float _954 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _946);
    float _956 = _944 * _874;
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[26].z, _950);
    float _960 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[24].z, _954);
    float _962 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].w, _958);
    float _964 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].w, _960);
    float _966 = _896 * _940;
    float _968 = _902 * _940;
    float _970 = _908 * _940;
    float _972 = _944 * _872;
    float _974 = _874 * _966;
    float _976 = _876 * _968;
    float _978 = _962 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _980 = fma(_952, _968, _972);
    float _982 = -_974;
    float _984 = fma(_876, _970, _982);
    float _986 = fma(_952, _970, _956);
    float _988 = -_976;
    float _990 = fma(_872, _966, _988);
    float _992 = _964 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _994 = fma(_926, _984, _980);
    float _996 = _922 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _998 = fma(_926, _990, _986);
    float _1000 = _944 * _876;
    float _1002 = _978 + _994;
    float _1004 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _996);
    float _1006 = _992 + _998;
    float _1008 = _872 * _970;
    float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1012 = _1002 + _1010;
    float _1014 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1004);
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1018 = _1006 + _1016;
    float _1020 = fma(_952, _966, _1000);
    float _1022 = _1012 * _1012;
    float _1024 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1014);
    float _1026 = -_1008;
    float _1028 = fma(_874, _968, _1026);
    float _1030 = fma(_1018, _1018, _1022);
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1034 = fma(_926, _1028, _1020);
    float _1036 = sqrt(_1030);
    float _1038 = _1032 + _1034;
    bool _1040 = _1036 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1004;
    float _1044 = _1006;
    float _1046 = _996;
    float _1048 = _1018;
    float _1050 = _868;
    int _1052 = as_type<int>(_858);
    float _1054 = _856;
    if (!_1040)
    {
        _1042 = _1002;
    }
    float _1056 = _1042;
    float _1058 = _1056;
    if (!_1040)
    {
        _484 = _1038;
    }
    float _1060 = _484;
    bool _1062 = !_1040;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _1036 + _1068;
        float _1072 = rsqrt(_1030);
        float _1074 = _1070 * _1066;
        float _1076 = _1038 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = _1074 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = fma(_1082, _1076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = _1072 * _1088;
        float _1092 = _1086 + (-1.0);
        float _1094 = fma(_1018, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1096 = fma(_1012, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1098 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1100 = fma(_1038, _1086, _1098);
        _1064 = _1100;
        _1044 = _1094;
        _1058 = _1096;
        _1046 = _1078;
    }
    float _1102 = _1064;
    float _1104 = _1044;
    float _1106 = _1058;
    float _1108 = _1046;
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1112 = _1102 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1116 = _1104 + _1114;
    float _1118 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1120 = _1106 + _1118;
    float _1122 = _1112 * _1112;
    float _1124 = fma(_1116, _1116, _1122);
    float _1126 = fma(_1120, _1120, _1124);
    float _1128 = rsqrt(_1126);
    float _1130 = sqrt(_1126);
    float _1132 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1134 = _1116 * _1132;
    float _1136 = _1120 * _1132;
    float _1138 = _1134 * _1134;
    float _1140 = _1136 * _1136;
    float _1142 = _1138 + _1140;
    float _1144 = sqrt(_1142);
    bool _1146 = _1144 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1150 = _1144 + _1148;
    float _1152 = _922;
    float _1154 = _1150;
    if (_1146)
    {
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1152 = _1156;
    }
    float _1158 = _1152;
    if (_1146)
    {
        float _1160 = rsqrt(_1142);
        _1048 = _1160;
    }
    float _1162 = _1048;
    float _1164 = _1162;
    if (_1146)
    {
        float _1166 = _1150 * _1158;
        _1154 = _1166;
    }
    float _1168 = _1154;
    float _1170 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1146)
    {
        float _1172 = _1168 * 0.15915493667125701904296875;
        _1050 = _1172;
    }
    float _1174 = _1050;
    float _1176 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1170);
    float _1178 = _1108;
    float _1180 = _1174;
    if (_1146)
    {
        float _1182 = _1174 * 6.283185482025146484375;
        float _1184 = sin(_1182);
        _1178 = _1184;
    }
    float _1186 = _1178;
    float _1188 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1190 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1176);
    float _1192 = precise::max(0.0, _1188);
    float _1194 = _1012;
    float _1196 = _1192;
    float _1198 = _1188;
    if (_1146)
    {
        float _1200 = _1174 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        _1194 = _1202;
    }
    float _1204 = _1194;
    float _1206 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1208 = -_1132;
    float _1210 = -_1192;
    float _1212 = fma(_1112, _1208, _1210);
    if (_1146)
    {
        float _1214 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1196 = _1214;
    }
    float _1216 = _1196;
    float _1218 = _1216;
    if (!_1146)
    {
        _1180 = _1138;
    }
    float _1220 = _1180;
    float _1222 = _1186;
    float _1224 = _1220;
    if (_1146)
    {
        float _1226 = fma(_1186, _1216, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1218 = _1226;
    }
    float _1228 = _1218;
    float _1230 = _1228;
    if (!_1146)
    {
        _1222 = _1134;
    }
    float _1232 = _1222;
    float _1234 = _1232;
    float _1236 = _1204;
    if (_1146)
    {
        float _1238 = _1204 + (-1.0);
        _1198 = _1238;
    }
    float _1240 = _1198;
    float _1242 = 0.0;
    float _1244 = _1240;
    if (_1146)
    {
        float _1246 = _1162 * _1228;
        _1242 = _1246;
    }
    float _1248 = _1242;
    if (!_1146)
    {
        _1164 = _1212;
    }
    float _1250 = _1164;
    float _1252 = _1250;
    if (_1146)
    {
        float _1254 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1230 = _1254;
    }
    float _1256 = _1230;
    if (_1146)
    {
        float _1258 = _1134 * _1248;
        _1234 = _1258;
    }
    float _1260 = _1234;
    if (!_1146)
    {
        _1244 = _1136;
    }
    float _1262 = _1244;
    float _1264 = _1262;
    if (_1146)
    {
        float _1266 = _1136 * _1248;
        _1264 = _1266;
    }
    float _1268 = _1264;
    if (_1146)
    {
        float _1270 = fma(_1212, _1204, _1256);
        _1252 = _1270;
    }
    float _1272 = _1252;
    if (_1146)
    {
        float _1274 = _1260 * _1260;
        _1224 = _1274;
    }
    float _1276 = _1224;
    if (!_1146)
    {
        _1236 = _1140;
    }
    float _1278 = _1236;
    float _1280 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1282 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1284 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1286 = _1278;
    if (_1146)
    {
        float _1288 = _1268 * _1268;
        _1286 = _1288;
    }
    float _1290 = _1286;
    float _1292 = fma(_1272, _1272, _1276);
    float _1294 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1280);
    float _1296 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1282);
    float _1298 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1284);
    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1302 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1300);
    float _1304 = precise::clamp(_1302, 0.0, 1.0);
    float _1306 = _1292 + _1290;
    float _1308 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1296);
    float _1310 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1294);
    float _1312 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1314 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1316 = rsqrt(_1306);
    float _1318 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1320 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1324 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1298);
    float _1326 = -_1304;
    float _1328 = _1326 + 1.0;
    float _1330 = -_1312;
    float _1332 = fma(_1330, _1320, 1.0);
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1322);
    float _1336 = _1324 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1338 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1334);
    float _1340 = abs(_1328);
    float _1342 = log2(_1340);
    float _1344 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1346 = _1316 * _1260;
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1338);
    float _1350 = _1316 * _1272;
    float _1352 = _1316 * _1268;
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1356 = log2(_1332);
    float _1358 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1344);
    float _1360 = _1350 + 1.0;
    float _1362 = -_1354;
    float _1364 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1362);
    float _1366 = -_1352;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1364);
    float _1370 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1372 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1374 = 1.0 / _1348;
    float _1376 = fma(_1368, -0.5, 0.5);
    float _1378 = fma(_1368, 0.5, 0.5);
    float _1380 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1372);
    float _1382 = fma(_1378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1384 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1380);
    float _1386 = exp2(_1370);
    float _1388 = fma(_1378, _1382, -0.212114393711090087890625);
    float _1390 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1384);
    float _1392 = fma(_1378, _1388, 1.570728778839111328125);
    float _1394 = sqrt(_1376);
    float _1396 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1358);
    float _1398 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1396);
    float _1400 = _1356 * 0.693147182464599609375;
    float _1402 = _1390 * _1374;
    float _1404 = -_1350;
    float _1406 = fma(_1386, _1360, _1404);
    float _1408 = _1398 * _1374;
    float _1410 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1412 = fma(_1402, 0.5, 0.5);
    float _1414 = fma(_1406, 0.5, 0.5);
    float _1416 = fma(_1408, -0.5, 0.5);
    float _1418 = _1394 * 0.636619746685028076171875;
    float _1420 = -_1392;
    float _1422 = fma(_1418, _1420, 1.0);
    float3 _4370 = float3(_1412, _1416, _1410);
    float _1424 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4370, float3(0.0), isnan(_4370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4370, float3(0.0), isnan(_4370)), level(0.0)).x;
    float3 _4381 = float3(_1412, _1416, _1410);
    float4 _1427 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4381, float3(0.0), isnan(_4381)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4381, float3(0.0), isnan(_4381)), level(0.0)).xyzw;
    float _1429 = _1427.x;
    float _1431 = _1427.y;
    float _1433 = _1427.z;
    float _1435 = _1427.w;
    float2 _4398 = float2(_1422, _1414);
    float3 _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4398, float2(0.0), isnan(_4398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4398, float2(0.0), isnan(_4398)), level(0.0)).xyz;
    float _1441 = _1439.x;
    float _1443 = _1439.y;
    float _1445 = _1439.z;
    float _1447 = in.m_55.y;
    float _1449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1453 = _1451 != 0;
    float _1455 = in.m_51.w;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1459 = _1457 != 0;
    float _1461 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1463 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1461);
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1475 = _1447;
    if (_1453)
    {
        float _1477 = in.m_51.x;
        _1473 = _1477;
    }
    float _1479 = _1473;
    float _1481 = 1.0 / _1467;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1485 = _1483 != 0;
    float _1487 = _1410;
    if (!_1459)
    {
        float _1489 = in.m_51.y;
        _1487 = _1489;
    }
    float _1491 = _1487;
    float _1493 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1463);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1497 = _1495 != 0;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1501 = _1499 != 0;
    bool _1503 = _1455 > 0.5;
    float _1505 = in.m_55.x;
    float _1507 = 0.0;
    bool _1509 = _1497;
    float _1511 = _1505;
    if (_1485)
    {
        float _1513 = in.m_51.z;
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = 1.0 / _1471;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1525 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1527 = false;
    float _1529 = _1479;
    if (_1453)
    {
        bool _1531 = _1479 > 0.5;
        _1527 = _1531;
    }
    bool _1533 = _1527;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1543 = -_1447;
    float _1545 = _1543 + 1.0;
    float _1547 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1549 = _1537 * _1481;
    float _1551 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1459)
    {
        _1529 = _1491;
    }
    float _1553 = _1529;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1557 = _1503 ? as_type<int>(_1545) : as_type<int>(_1447);
    float _1559 = _1541 * _1517;
    bool _1561 = _858 != 0.0;
    bool _1563 = isnan(_858);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan(0.0);
    bool _1569 = _1565 || _1567;
    float _1571 = in.m_59.x;
    float _1573 = in.m_59.y;
    float _1575 = in.m_59.z;
    float _1577 = _1497 ? as_type<float>(_1557) : _1447;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1581 = _820 + _1579;
    bool _1583 = _856 == 0.0;
    bool _1585 = !_1569;
    bool _1587 = _1583 && _1585;
    out.m_61.x = _1525;
    out.m_61.y = _1547;
    out.m_61.z = _1551;
    if (_1485)
    {
        bool _1589 = _1515 > 0.5;
        _1509 = _1589;
    }
    bool _1591 = _1509;
    float _1593 = fma(_1559, _1581, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1595 = _860 == 0.0;
    bool _1597 = _1595 && _1587;
    float _1599 = _1551;
    if (!_1459)
    {
        float _1601 = in.m_51.z;
        _1599 = _1601;
    }
    float _1603 = _1599;
    bool _1605 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1607 = isnan(_820);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = _1553;
    float _1619 = _1491;
    if (_1459)
    {
        float _1621 = in.m_51.x;
        float _1623 = in.m_51.y;
        _1617 = _1621;
        _1619 = _1623;
    }
    float _1625 = _1617;
    float _1627 = _1619;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1631 = _820 + _1629;
    bool _1633 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1635 = isnan(_820);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = fma(_1549, _1631, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1647 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1649 = isnan(_820);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1655 = _1651 || _1653;
    float _1657 = float(_1655);
    float _1659 = -_1643;
    float _1661 = _1659 + 1.0;
    float _1663 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1665 = _1573;
    float _1667 = _1657;
    float _1669 = _1571;
    float _1671 = _1575;
    if (!_1597)
    {
        float _1673 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1665 = _1673;
    }
    float _1675 = _1665;
    if (_1453)
    {
        float _1677 = -_1505;
        float _1679 = _1677 + 1.0;
        _1052 = as_type<int>(_1679);
    }
    int _1681 = _1052;
    float _1683 = -_1657;
    float _1685 = _1683 + 1.0;
    float _1687 = _1657 * _1661;
    if (!_1453)
    {
        _1667 = _1505;
    }
    float _1689 = _1667;
    float _1691 = _874 * _1675;
    float _1693 = _1615 * _1685;
    float _1695 = _876 * _1675;
    float _1697 = _872 * _1675;
    float _1699 = _1689;
    int _1701 = as_type<int>(_1693);
    if (_1453)
    {
        float _1703 = _1533 ? as_type<float>(_1681) : _1505;
        _1699 = _1703;
    }
    float _1705 = _1699;
    float _1707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_1597)
    {
        float _1709 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1571);
        _1669 = _1709;
    }
    float _1711 = _1669;
    float _1713 = _1603;
    if (!_1459)
    {
        _1054 = _1603;
    }
    float _1715 = _1054;
    float _1717 = _1715;
    if (!_1597)
    {
        float _1719 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1575);
        _1671 = _1719;
    }
    float _1721 = _1671;
    float _1723 = _1645 * _1693;
    if (_1459)
    {
        _1717 = _1627;
    }
    float _1725 = _1717;
    if (_1485)
    {
        float _1727 = -_1505;
        float _1729 = _1727 + 1.0;
        _1701 = as_type<int>(_1729);
    }
    int _1731 = _1701;
    if (_1459)
    {
        _1713 = _1627;
    }
    float _1733 = _1713;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1737 = _1627 > 0.5;
    float _1739 = -_1615;
    float _1741 = _1739 + 1.0;
    float _1743 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1735);
    if (_1485)
    {
        float _1745 = _1591 ? as_type<float>(_1731) : _1505;
        _1511 = _1745;
    }
    float _1747 = _1511;
    float _1749 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1723);
    float _1751 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1755 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1555);
    float _1757 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1763 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1765 = -_1753;
    float _1767 = fma(_1751, 2.0, _1765);
    float _1769 = fma(_1593, _1687, _1749);
    float _1771 = fma(_1757, -2.0, _1761);
    float _1773 = fma(_1763, _1747, -0.5);
    if (_1501)
    {
        float _1775 = _1737 ? _1545 : _1447;
        _1475 = _1775;
    }
    float _1777 = _1475;
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1781 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1743);
    float _1783 = -_126;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1767);
    float _1787 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1755);
    float _1789 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1771);
    float _1791 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1769);
    float _1793 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1795 = fma(_1663, _1577, -0.5);
    float _1797 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1799 = fma(_1781, _1773, _1785);
    float _1801 = _1793 * _1759;
    float _1803 = -_1789;
    float _1805 = fma(_1787, _1795, _1803);
    float _1807 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1809 = fma(_970, _1711, _1691);
    float _1811 = _1797 * _1779;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1817 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1807);
    float _1819 = fma(_966, _1711, _1695);
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1823 = fma(_968, _1711, _1697);
    float _1825 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1827 = _1815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1833 = _1799 + 0.5;
    float _1835 = _1805 + 0.5;
    float _1837 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1817);
    float _1839 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1841 = fma(_990, _1721, _1809);
    float _1843 = fma(_1028, _1721, _1819);
    float _1845 = fma(_984, _1721, _1823);
    out.m_63.x = _1829;
    out.m_63.y = _1825;
    out.m_63.z = _1827;
    out.m_63.w = _1831;
    float _1847 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1849 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1839);
    float _1851 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _1801;
    out.m_65.y = _1811;
    out.m_65.z = _1833;
    out.m_65.w = _1835;
    float _1853 = 1.0 / _1847;
    bool _1855 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1857 = isnan(0.5);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1863 = _1859 || _1861;
    float _1865 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1849);
    out.m_67.x = _1841;
    out.m_67.y = _1843;
    out.m_67.z = _1845;
    float _1867 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1493);
    float _1869 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1871 = exp2(_1851);
    float _1873 = _1869 + _1847;
    float _1875 = _1841;
    if (_1863)
    {
        _1875 = 1.0;
    }
    float _1877 = _1875;
    float _1879 = _1873 * _1853;
    float _1881 = _1879 * 0.5;
    float _1883 = _1877;
    if (!_1863)
    {
        float _1885 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1887 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1889 = _1885 * 0.15915493667125701904296875;
        float _1891 = _1887 * 0.15915493667125701904296875;
        float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1895 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1893);
        float _1897 = _1889 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = _1889 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = 1.0 / _1899;
        float _1907 = _1891 * 6.283185482025146484375;
        float _1909 = cos(_1907);
        float _1911 = _1903 * _1905;
        float _1913 = _1891 * 6.283185482025146484375;
        float _1915 = sin(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = 1.0 / _1895;
        float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1923 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1921;
        float _1925 = 1.0 / _1917;
        float _1927 = 1.0 / _1923;
        float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1931 = _1919 * _1929;
        float _1933 = _1915 * _1925;
        float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1937 = fma(_1933, _1931, _1935);
        float _1939 = _1937 * _1927;
        float _1941 = precise::clamp(_1939, 0.0, 1.0);
        _1883 = _1941;
    }
    float _1943 = _1883;
    float _1945 = -_1871;
    float _1947 = _1945 + 1.0;
    bool _1949 = _1943 > 0.0;
    bool _1951 = isnan(_1943);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(0.0);
    bool _1957 = _1953 || _1955;
    float _1959 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1961 = _1867 + _1348;
    float _1963 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1965 = _1390 + _1348;
    float _1967 = _1348 * 0.5;
    out.m_69.x = _1116;
    out.m_69.y = _1112;
    out.m_69.z = _1120;
    float _1969 = _1963 * _1424;
    float _1971 = -_1963;
    float _1973 = _1971 + 1.0;
    float _1975 = _1961 * 0.5;
    float _1977 = _1435 * _1969;
    float _1979 = _1445 * _1969;
    float _1981 = _1435 * _1973;
    float _1983 = _1965 * 0.5;
    float _1985 = fma(_1398, -0.5, _1967);
    float _1987 = _1959 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1989 = fma(_1441, _1977, _1429);
    float _1991 = fma(_1443, _1977, _1431);
    float _1993 = fma(_1435, _1979, _1433);
    out.gl_Position.x = _1390;
    out.gl_Position.y = _1398;
    out.gl_Position.z = _1867;
    out.gl_Position.w = _1348;
    out.m_71.x = _1983;
    out.m_71.y = _1985;
    out.m_71.z = _1975;
    out.m_71.w = _1348;
    out.m_45.x = _1987;
    out.m_73.x = _1989;
    out.m_73.y = _1991;
    out.m_73.z = _1993;
    out.m_73.w = _1981;
    if (_1957)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1995 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1995;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _812 = false;
    bool _560 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2052 = as_type<float>(_108);
        out.gl_Position.z = _2052;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2121 = as_type<float>(_144);
        out.gl_Position.z = _2121;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _166 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _164);
    float _168 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _170 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _168);
    float _172 = _168;
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _176 = _152;
    if (!_162)
    {
        float _178 = _152 * _152;
        float _180 = _178 * 0.5;
        _172 = _180;
    }
    float _182 = _172;
    float _184 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _166);
    float _186 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _170);
    float _188 = _182;
    if (!_162)
    {
        float _190 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_162;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _152 * _200;
        float _210 = exp2(_208);
        float _212 = _206 * 0.693147182464599609375;
        float _214 = 1.0 / _212;
        float _216 = 1.0 / _204;
        float _218 = _210 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _214, _152);
        float _224 = _222 * _216;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
        _174 = _210;
    }
    float _228 = _196;
    float _230 = _174;
    bool _232 = !_162;
    float _234 = _230;
    if (!_232)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _152 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _176 = _254;
        _234 = _242;
    }
    float _256 = _176;
    float _258 = _234;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = _258;
    float _268 = _260;
    float _270 = _264;
    if (!_162)
    {
        float _272 = _126 * _126;
        float _274 = _272 * 0.5;
        _266 = _274;
    }
    float _276 = _266;
    float _278 = fma(_256, _146, _260);
    float _280 = fma(_256, _148, _262);
    float _282 = fma(_256, _150, _264);
    if (!_162)
    {
        float _284 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _284;
    }
    float _286 = _268;
    bool _288 = !_162;
    float _290 = _286;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _126 * _294;
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = 1.0 / _302;
        float _306 = _296 * 0.693147182464599609375;
        float _308 = exp2(_298);
        float _310 = 1.0 / _306;
        float _312 = _308 + (-1.0);
        float _314 = -_312;
        float _316 = fma(_314, _310, _126);
        float _318 = _316 * _304;
        float _320 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _320;
        _270 = _308;
    }
    float _322 = _290;
    float _324 = _270;
    float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _328 = _324;
    if (!_162)
    {
        _328 = _126;
    }
    float _330 = _328;
    bool _332 = !_162;
    float _334 = _330;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = 1.0 / _342;
        float _346 = _126 * _338;
        float _348 = exp2(_346);
        float _350 = -_348;
        float _352 = _350 + 1.0;
        float _354 = _352 * _344;
        _334 = _354;
    }
    float _356 = _334;
    float _358 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = fma(_356, _148, _326);
    float _362 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _364 = sqrt(_186);
    float _366 = fma(_356, _146, _358);
    float _368 = -_360;
    float _370 = _280 + _368;
    float _372 = fma(_356, _150, _362);
    float _374 = -_366;
    float _376 = _278 + _374;
    float _378 = _370 * _370;
    float _380 = -_372;
    float _382 = _282 + _380;
    float _384 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _386 = fma(_376, _376, _378);
    float _388 = sqrt(_184);
    float _390 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _384);
    float _392 = fma(_382, _382, _386);
    float _394 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _396 = in.m_49.w;
    float _398 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _400 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].y, _394);
    float _402 = sqrt(_392);
    float _404 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _390);
    float _406 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _408 = in.m_42.x;
    float _410 = in.m_42.y;
    float _412 = in.m_42.z;
    float _414 = _370 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _416 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].y, _400);
    float _418 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].x, _406);
    float _420 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].z, _398);
    float _422 = sqrt(_404);
    float _424 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[14].w, _414);
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].x, _418);
    float _428 = _364 * _416;
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].z, _420);
    float _432 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[16].w, _424);
    float _434 = _388 * _426;
    float _436 = _428 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _438 = _402 >= 9.9999999747524270787835121154785e-07;
    bool _440 = isnan(_402);
    bool _442 = _438 || _440;
    bool _444 = isnan(9.9999999747524270787835121154785e-07);
    bool _446 = _442 || _444;
    float _448 = _428 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _450 = _428 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[24].x, _436);
    float _454 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _448);
    float _456 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[26].x, _450);
    float _458 = _422 * _430;
    float _460 = fma(_280, _396, _410);
    float _462 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[24].z, _452);
    float _464 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[25].z, _454);
    float _466 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[26].z, _456);
    float _468 = fma(_282, _396, _412);
    float _470 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[24].w, _462);
    float _472 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[25].w, _464);
    float _474 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[26].w, _466);
    float _476 = fma(_278, _396, _408);
    float _478 = _472;
    float _480 = _470;
    float _482 = _474;
    float _484 = _422;
    if (!_446)
    {
        bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _488 = !_486;
        if (!_488)
        {
            float _490 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _492 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _496 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _490);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _492);
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _494);
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _496);
            float _506 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _498);
            float _508 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _500);
            float _510 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _504);
            float _512 = _364 * _506;
            float _514 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _502);
            float _516 = _388 * _508;
            float _518 = _512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _520 = _512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _522 = _422 * _514;
            float _524 = _512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _526 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[25].x, _518);
            float _528 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[24].x, _520);
            float _530 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[26].x, _524);
            float _532 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[25].z, _526);
            float _534 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[24].z, _528);
            float _536 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[26].z, _530);
            float _538 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[25].w, _532);
            float _540 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[24].w, _534);
            float _542 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[26].w, _536);
            float _544 = _538 * _538;
            float _546 = fma(_540, _540, _544);
            float _548 = fma(_542, _542, _546);
            float _550 = rsqrt(_548);
            float _552 = _550 * 9.9999999747524270787835121154785e-07;
            float _554 = _540 * _552;
            float _556 = _538 * _552;
            float _558 = _542 * _552;
            _478 = _556;
            _480 = _554;
            _482 = _558;
            _560 = true;
        }
        else
        {
            float _562 = _148 * _148;
            float _564 = fma(_146, _146, _562);
            float _566 = fma(_150, _150, _564);
            float _568 = sqrt(_566);
            bool _570 = _568 >= 9.9999999747524270787835121154785e-07;
            bool _572 = isnan(_568);
            bool _574 = _570 || _572;
            bool _576 = isnan(9.9999999747524270787835121154785e-07);
            bool _578 = _574 || _576;
            if (!_578)
            {
                float _580 = _410 * _410;
                float _582 = fma(_408, _408, _580);
                float _584 = fma(_412, _412, _582);
                float _586 = sqrt(_584);
                bool _588 = _586 >= 9.9999999747524270787835121154785e-07;
                bool _590 = isnan(_586);
                bool _592 = _588 || _590;
                bool _594 = isnan(9.9999999747524270787835121154785e-07);
                bool _596 = _592 || _594;
                if (!_596)
                {
                    float _598 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _600 = _388 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _602 = _422 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _604 = _598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _606 = _598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _608 = _598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _610 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[25].x, _604);
                    float _612 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[24].x, _606);
                    float _614 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[26].x, _608);
                    float _616 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _610);
                    float _618 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _612);
                    float _620 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _614);
                    float _622 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _616);
                    float _624 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _618);
                    float _626 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _620);
                    float _628 = _622 * _622;
                    float _630 = fma(_624, _624, _628);
                    float _632 = fma(_626, _626, _630);
                    float _634 = rsqrt(_632);
                    float _636 = _634 * 9.9999999747524270787835121154785e-07;
                    float _638 = _624 * _636;
                    float _640 = _622 * _636;
                    float _642 = _626 * _636;
                    _478 = _640;
                    _480 = _638;
                    _482 = _642;
                    _560 = true;
                }
                else
                {
                    float _644 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _646 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _648 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _650 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _652 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].y, _644);
                    float _654 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].x, _646);
                    float _656 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].z, _648);
                    float _658 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].w, _650);
                    float _660 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].y, _652);
                    float _662 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].x, _654);
                    float _664 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].z, _656);
                    float _666 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].w, _658);
                    float _668 = _364 * _660;
                    float _670 = _388 * _662;
                    float _672 = _422 * _664;
                    float _674 = _668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _676 = _668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _678 = _668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _680 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _674);
                    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _676);
                    float _684 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _678);
                    float _686 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _680);
                    float _688 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _682);
                    float _690 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _684);
                    float _692 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].w, _686);
                    float _694 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].w, _688);
                    float _696 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].w, _690);
                    float _698 = _692 * _692;
                    float _700 = fma(_694, _694, _698);
                    float _702 = fma(_696, _696, _700);
                    float _704 = rsqrt(_702);
                    float _706 = _704 * 9.9999999747524270787835121154785e-07;
                    float _708 = _694 * _706;
                    float _710 = _692 * _706;
                    float _712 = _696 * _706;
                    _478 = _710;
                    _480 = _708;
                    _482 = _712;
                    _560 = true;
                }
            }
            else
            {
                float _714 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _716 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _718 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _720 = _148 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _722 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].y, _714);
                float _724 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].x, _716);
                float _726 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].z, _718);
                float _728 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[14].w, _720);
                float _730 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].y, _722);
                float _732 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].x, _724);
                float _734 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].z, _726);
                float _736 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[16].w, _728);
                float _738 = _364 * _730;
                float _740 = _388 * _732;
                float _742 = _422 * _734;
                float _744 = _738 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _746 = _738 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _748 = _738 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _750 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[25].x, _744);
                float _752 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[24].x, _746);
                float _754 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[26].x, _748);
                float _756 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].z, _750);
                float _758 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].z, _752);
                float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].z, _754);
                float _762 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].w, _756);
                float _764 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].w, _758);
                float _766 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].w, _760);
                float _768 = _762 * _762;
                float _770 = fma(_764, _764, _768);
                float _772 = fma(_766, _766, _770);
                float _774 = rsqrt(_772);
                float _776 = _774 * 9.9999999747524270787835121154785e-07;
                float _778 = _764 * _776;
                float _780 = _762 * _776;
                float _782 = _766 * _776;
                _478 = _780;
                _480 = _778;
                _482 = _782;
            }
        }
    }
    _560 = false;
    float _784 = _478;
    float _786 = _480;
    float _788 = _482;
    bool _790 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _792 = !_790;
    float _810;
    if (!_792)
    {
        float _794 = in.m_51.x;
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _798 = _794 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _802 = _800 * _796;
        float _804 = floor(_802);
        float _806 = -_804;
        float _808 = _802 + _806;
        _810 = _808;
        _812 = true;
    }
    else
    {
        float _814 = float(_92);
        float _816 = 1.0 / _814;
        float _818 = _126 * _816;
        _810 = _818;
    }
    _812 = false;
    float _820 = _810;
    float _822 = _784 * _784;
    float _824 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _826 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _828 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _830 = fma(_786, _786, _822);
    float _832 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _834 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].x, _824);
    float _836 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].y, _826);
    float _838 = fma(_788, _788, _830);
    float _840 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].z, _828);
    float _842 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[14].w, _832);
    float _844 = in.m_49.x;
    float _846 = in.m_49.y;
    float _848 = in.m_49.z;
    float _850 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].y, _836);
    float _852 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].x, _834);
    float _854 = rsqrt(_838);
    float _856 = in.m_53.x;
    float _858 = in.m_53.y;
    float _860 = in.m_53.z;
    float _862 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].z, _840);
    float _864 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].w, _842);
    float _866 = _852 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _868 = _864 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _870 = _388 * _866;
    float _872 = _854 * _788;
    float _874 = _854 * _786;
    float _876 = _854 * _784;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _880 = _872 * _878;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _884 = _874 * _882;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _888 = _876 * _886;
    float _890 = _848 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _894 = -_880;
    float _896 = fma(_874, _892, _894);
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _900 = -_884;
    float _902 = fma(_876, _898, _900);
    float _904 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _906 = -_888;
    float _908 = fma(_872, _904, _906);
    float _910 = _850 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _912 = _896 * _896;
    float _914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _860);
    float _916 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _918 = _846 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _920 = fma(_908, _908, _912);
    float _922 = _364 * _910;
    float _924 = _862 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _926 = _916 * _914;
    float _928 = fma(_902, _902, _920);
    float _930 = _844 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _858);
    float _934 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _936 = _922 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _856);
    float _940 = rsqrt(_928);
    float _942 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _944 = _934 * _932;
    float _946 = _922 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _948 = _422 * _924;
    float _950 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _936);
    float _952 = _942 * _938;
    float _954 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _946);
    float _956 = _944 * _874;
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[26].z, _950);
    float _960 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[24].z, _954);
    float _962 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].w, _958);
    float _964 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].w, _960);
    float _966 = _896 * _940;
    float _968 = _902 * _940;
    float _970 = _908 * _940;
    float _972 = _944 * _872;
    float _974 = _874 * _966;
    float _976 = _876 * _968;
    float _978 = _962 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _980 = fma(_952, _968, _972);
    float _982 = -_974;
    float _984 = fma(_876, _970, _982);
    float _986 = fma(_952, _970, _956);
    float _988 = -_976;
    float _990 = fma(_872, _966, _988);
    float _992 = _964 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _994 = fma(_926, _984, _980);
    float _996 = _922 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _998 = fma(_926, _990, _986);
    float _1000 = _944 * _876;
    float _1002 = _978 + _994;
    float _1004 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _996);
    float _1006 = _992 + _998;
    float _1008 = _872 * _970;
    float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1012 = _1002 + _1010;
    float _1014 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1004);
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1018 = _1006 + _1016;
    float _1020 = fma(_952, _966, _1000);
    float _1022 = _1012 * _1012;
    float _1024 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1014);
    float _1026 = -_1008;
    float _1028 = fma(_874, _968, _1026);
    float _1030 = fma(_1018, _1018, _1022);
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1034 = fma(_926, _1028, _1020);
    float _1036 = sqrt(_1030);
    float _1038 = _1032 + _1034;
    bool _1040 = _1036 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1004;
    float _1044 = _1006;
    float _1046 = _996;
    float _1048 = _1018;
    float _1050 = _868;
    int _1052 = as_type<int>(_858);
    float _1054 = _856;
    if (!_1040)
    {
        _1042 = _1002;
    }
    float _1056 = _1042;
    float _1058 = _1056;
    if (!_1040)
    {
        _484 = _1038;
    }
    float _1060 = _484;
    bool _1062 = !_1040;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _1036 + _1068;
        float _1072 = rsqrt(_1030);
        float _1074 = _1070 * _1066;
        float _1076 = _1038 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = _1074 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = fma(_1082, _1076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = _1072 * _1088;
        float _1092 = _1086 + (-1.0);
        float _1094 = fma(_1018, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1096 = fma(_1012, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1098 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1100 = fma(_1038, _1086, _1098);
        _1064 = _1100;
        _1044 = _1094;
        _1058 = _1096;
        _1046 = _1078;
    }
    float _1102 = _1064;
    float _1104 = _1044;
    float _1106 = _1058;
    float _1108 = _1046;
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1112 = _1102 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1116 = _1104 + _1114;
    float _1118 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1120 = _1106 + _1118;
    float _1122 = _1112 * _1112;
    float _1124 = fma(_1116, _1116, _1122);
    float _1126 = fma(_1120, _1120, _1124);
    float _1128 = rsqrt(_1126);
    float _1130 = sqrt(_1126);
    float _1132 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1134 = _1116 * _1132;
    float _1136 = _1120 * _1132;
    float _1138 = _1134 * _1134;
    float _1140 = _1136 * _1136;
    float _1142 = _1138 + _1140;
    float _1144 = sqrt(_1142);
    bool _1146 = _1144 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1150 = _1144 + _1148;
    float _1152 = _922;
    float _1154 = _1150;
    if (_1146)
    {
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1152 = _1156;
    }
    float _1158 = _1152;
    if (_1146)
    {
        float _1160 = rsqrt(_1142);
        _1048 = _1160;
    }
    float _1162 = _1048;
    float _1164 = _1162;
    if (_1146)
    {
        float _1166 = _1150 * _1158;
        _1154 = _1166;
    }
    float _1168 = _1154;
    float _1170 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1146)
    {
        float _1172 = _1168 * 0.15915493667125701904296875;
        _1050 = _1172;
    }
    float _1174 = _1050;
    float _1176 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1170);
    float _1178 = _1108;
    float _1180 = _1174;
    if (_1146)
    {
        float _1182 = _1174 * 6.283185482025146484375;
        float _1184 = sin(_1182);
        _1178 = _1184;
    }
    float _1186 = _1178;
    float _1188 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1190 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1176);
    float _1192 = precise::max(0.0, _1188);
    float _1194 = _1012;
    float _1196 = _1192;
    float _1198 = _1188;
    if (_1146)
    {
        float _1200 = _1174 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        _1194 = _1202;
    }
    float _1204 = _1194;
    float _1206 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1208 = -_1132;
    float _1210 = -_1192;
    float _1212 = fma(_1112, _1208, _1210);
    if (_1146)
    {
        float _1214 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1196 = _1214;
    }
    float _1216 = _1196;
    float _1218 = _1216;
    if (!_1146)
    {
        _1180 = _1138;
    }
    float _1220 = _1180;
    float _1222 = _1186;
    float _1224 = _1220;
    if (_1146)
    {
        float _1226 = fma(_1186, _1216, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1218 = _1226;
    }
    float _1228 = _1218;
    float _1230 = _1228;
    if (!_1146)
    {
        _1222 = _1134;
    }
    float _1232 = _1222;
    float _1234 = _1232;
    float _1236 = _1204;
    if (_1146)
    {
        float _1238 = _1204 + (-1.0);
        _1198 = _1238;
    }
    float _1240 = _1198;
    float _1242 = 0.0;
    float _1244 = _1240;
    if (_1146)
    {
        float _1246 = _1162 * _1228;
        _1242 = _1246;
    }
    float _1248 = _1242;
    if (!_1146)
    {
        _1164 = _1212;
    }
    float _1250 = _1164;
    float _1252 = _1250;
    if (_1146)
    {
        float _1254 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1230 = _1254;
    }
    float _1256 = _1230;
    if (_1146)
    {
        float _1258 = _1134 * _1248;
        _1234 = _1258;
    }
    float _1260 = _1234;
    if (!_1146)
    {
        _1244 = _1136;
    }
    float _1262 = _1244;
    float _1264 = _1262;
    if (_1146)
    {
        float _1266 = _1136 * _1248;
        _1264 = _1266;
    }
    float _1268 = _1264;
    if (_1146)
    {
        float _1270 = fma(_1212, _1204, _1256);
        _1252 = _1270;
    }
    float _1272 = _1252;
    if (_1146)
    {
        float _1274 = _1260 * _1260;
        _1224 = _1274;
    }
    float _1276 = _1224;
    if (!_1146)
    {
        _1236 = _1140;
    }
    float _1278 = _1236;
    float _1280 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1282 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1284 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1286 = _1278;
    if (_1146)
    {
        float _1288 = _1268 * _1268;
        _1286 = _1288;
    }
    float _1290 = _1286;
    float _1292 = fma(_1272, _1272, _1276);
    float _1294 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1280);
    float _1296 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1282);
    float _1298 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1284);
    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1302 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1300);
    float _1304 = precise::clamp(_1302, 0.0, 1.0);
    float _1306 = _1292 + _1290;
    float _1308 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1296);
    float _1310 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1294);
    float _1312 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1314 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1316 = rsqrt(_1306);
    float _1318 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1320 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1324 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1298);
    float _1326 = -_1304;
    float _1328 = _1326 + 1.0;
    float _1330 = -_1312;
    float _1332 = fma(_1330, _1320, 1.0);
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1322);
    float _1336 = _1324 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1338 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1334);
    float _1340 = abs(_1328);
    float _1342 = log2(_1340);
    float _1344 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1346 = _1316 * _1260;
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1338);
    float _1350 = _1316 * _1272;
    float _1352 = _1316 * _1268;
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1356 = log2(_1332);
    float _1358 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1344);
    float _1360 = _1350 + 1.0;
    float _1362 = -_1354;
    float _1364 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1362);
    float _1366 = -_1352;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1364);
    float _1370 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1372 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1374 = 1.0 / _1348;
    float _1376 = fma(_1368, -0.5, 0.5);
    float _1378 = fma(_1368, 0.5, 0.5);
    float _1380 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1372);
    float _1382 = fma(_1378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1384 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1380);
    float _1386 = exp2(_1370);
    float _1388 = fma(_1378, _1382, -0.212114393711090087890625);
    float _1390 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1384);
    float _1392 = fma(_1378, _1388, 1.570728778839111328125);
    float _1394 = sqrt(_1376);
    float _1396 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1358);
    float _1398 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1396);
    float _1400 = _1356 * 0.693147182464599609375;
    float _1402 = _1390 * _1374;
    float _1404 = -_1350;
    float _1406 = fma(_1386, _1360, _1404);
    float _1408 = _1398 * _1374;
    float _1410 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1412 = fma(_1402, 0.5, 0.5);
    float _1414 = fma(_1406, 0.5, 0.5);
    float _1416 = fma(_1408, -0.5, 0.5);
    float _1418 = _1394 * 0.636619746685028076171875;
    float _1420 = -_1392;
    float _1422 = fma(_1418, _1420, 1.0);
    float3 _4370 = float3(_1412, _1416, _1410);
    float _1424 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4370, float3(0.0), isnan(_4370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4370, float3(0.0), isnan(_4370)), level(0.0)).x;
    float3 _4381 = float3(_1412, _1416, _1410);
    float4 _1427 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4381, float3(0.0), isnan(_4381)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4381, float3(0.0), isnan(_4381)), level(0.0)).xyzw;
    float _1429 = _1427.x;
    float _1431 = _1427.y;
    float _1433 = _1427.z;
    float _1435 = _1427.w;
    float2 _4398 = float2(_1422, _1414);
    float3 _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4398, float2(0.0), isnan(_4398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4398, float2(0.0), isnan(_4398)), level(0.0)).xyz;
    float _1441 = _1439.x;
    float _1443 = _1439.y;
    float _1445 = _1439.z;
    float _1447 = in.m_55.y;
    float _1449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1453 = _1451 != 0;
    float _1455 = in.m_51.w;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1459 = _1457 != 0;
    float _1461 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1463 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1461);
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1475 = _1447;
    if (_1453)
    {
        float _1477 = in.m_51.x;
        _1473 = _1477;
    }
    float _1479 = _1473;
    float _1481 = 1.0 / _1467;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1485 = _1483 != 0;
    float _1487 = _1410;
    if (!_1459)
    {
        float _1489 = in.m_51.y;
        _1487 = _1489;
    }
    float _1491 = _1487;
    float _1493 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1463);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1497 = _1495 != 0;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1501 = _1499 != 0;
    bool _1503 = _1455 > 0.5;
    float _1505 = in.m_55.x;
    float _1507 = 0.0;
    bool _1509 = _1497;
    float _1511 = _1505;
    if (_1485)
    {
        float _1513 = in.m_51.z;
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = 1.0 / _1471;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1525 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1527 = false;
    float _1529 = _1479;
    if (_1453)
    {
        bool _1531 = _1479 > 0.5;
        _1527 = _1531;
    }
    bool _1533 = _1527;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1543 = -_1447;
    float _1545 = _1543 + 1.0;
    float _1547 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1549 = _1537 * _1481;
    float _1551 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1459)
    {
        _1529 = _1491;
    }
    float _1553 = _1529;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1557 = _1503 ? as_type<int>(_1545) : as_type<int>(_1447);
    float _1559 = _1541 * _1517;
    bool _1561 = _858 != 0.0;
    bool _1563 = isnan(_858);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan(0.0);
    bool _1569 = _1565 || _1567;
    float _1571 = in.m_59.x;
    float _1573 = in.m_59.y;
    float _1575 = in.m_59.z;
    float _1577 = _1497 ? as_type<float>(_1557) : _1447;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1581 = _820 + _1579;
    bool _1583 = _856 == 0.0;
    bool _1585 = !_1569;
    bool _1587 = _1583 && _1585;
    out.m_61.x = _1525;
    out.m_61.y = _1547;
    out.m_61.z = _1551;
    if (_1485)
    {
        bool _1589 = _1515 > 0.5;
        _1509 = _1589;
    }
    bool _1591 = _1509;
    float _1593 = fma(_1559, _1581, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1595 = _860 == 0.0;
    bool _1597 = _1595 && _1587;
    float _1599 = _1551;
    if (!_1459)
    {
        float _1601 = in.m_51.z;
        _1599 = _1601;
    }
    float _1603 = _1599;
    bool _1605 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1607 = isnan(_820);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = _1553;
    float _1619 = _1491;
    if (_1459)
    {
        float _1621 = in.m_51.x;
        float _1623 = in.m_51.y;
        _1617 = _1621;
        _1619 = _1623;
    }
    float _1625 = _1617;
    float _1627 = _1619;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1631 = _820 + _1629;
    bool _1633 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1635 = isnan(_820);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = fma(_1549, _1631, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1647 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1649 = isnan(_820);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1655 = _1651 || _1653;
    float _1657 = float(_1655);
    float _1659 = -_1643;
    float _1661 = _1659 + 1.0;
    float _1663 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1665 = _1573;
    float _1667 = _1657;
    float _1669 = _1571;
    float _1671 = _1575;
    if (!_1597)
    {
        float _1673 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1665 = _1673;
    }
    float _1675 = _1665;
    if (_1453)
    {
        float _1677 = -_1505;
        float _1679 = _1677 + 1.0;
        _1052 = as_type<int>(_1679);
    }
    int _1681 = _1052;
    float _1683 = -_1657;
    float _1685 = _1683 + 1.0;
    float _1687 = _1657 * _1661;
    if (!_1453)
    {
        _1667 = _1505;
    }
    float _1689 = _1667;
    float _1691 = _874 * _1675;
    float _1693 = _1615 * _1685;
    float _1695 = _876 * _1675;
    float _1697 = _872 * _1675;
    float _1699 = _1689;
    int _1701 = as_type<int>(_1693);
    if (_1453)
    {
        float _1703 = _1533 ? as_type<float>(_1681) : _1505;
        _1699 = _1703;
    }
    float _1705 = _1699;
    float _1707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_1597)
    {
        float _1709 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1571);
        _1669 = _1709;
    }
    float _1711 = _1669;
    float _1713 = _1603;
    if (!_1459)
    {
        _1054 = _1603;
    }
    float _1715 = _1054;
    float _1717 = _1715;
    if (!_1597)
    {
        float _1719 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1575);
        _1671 = _1719;
    }
    float _1721 = _1671;
    float _1723 = _1645 * _1693;
    if (_1459)
    {
        _1717 = _1627;
    }
    float _1725 = _1717;
    if (_1485)
    {
        float _1727 = -_1505;
        float _1729 = _1727 + 1.0;
        _1701 = as_type<int>(_1729);
    }
    int _1731 = _1701;
    if (_1459)
    {
        _1713 = _1627;
    }
    float _1733 = _1713;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1737 = _1627 > 0.5;
    float _1739 = -_1615;
    float _1741 = _1739 + 1.0;
    float _1743 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1735);
    if (_1485)
    {
        float _1745 = _1591 ? as_type<float>(_1731) : _1505;
        _1511 = _1745;
    }
    float _1747 = _1511;
    float _1749 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1723);
    float _1751 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1755 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1555);
    float _1757 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1763 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1765 = -_1753;
    float _1767 = fma(_1751, 2.0, _1765);
    float _1769 = fma(_1593, _1687, _1749);
    float _1771 = fma(_1757, -2.0, _1761);
    float _1773 = fma(_1763, _1747, -0.5);
    if (_1501)
    {
        float _1775 = _1737 ? _1545 : _1447;
        _1475 = _1775;
    }
    float _1777 = _1475;
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1781 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1743);
    float _1783 = -_126;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1767);
    float _1787 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1755);
    float _1789 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1771);
    float _1791 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1769);
    float _1793 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1795 = fma(_1663, _1577, -0.5);
    float _1797 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1799 = fma(_1781, _1773, _1785);
    float _1801 = _1793 * _1759;
    float _1803 = -_1789;
    float _1805 = fma(_1787, _1795, _1803);
    float _1807 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1809 = fma(_970, _1711, _1691);
    float _1811 = _1797 * _1779;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1817 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1807);
    float _1819 = fma(_966, _1711, _1695);
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1823 = fma(_968, _1711, _1697);
    float _1825 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1827 = _1815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1833 = _1799 + 0.5;
    float _1835 = _1805 + 0.5;
    float _1837 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1817);
    float _1839 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1841 = fma(_990, _1721, _1809);
    float _1843 = fma(_1028, _1721, _1819);
    float _1845 = fma(_984, _1721, _1823);
    out.m_63.x = _1829;
    out.m_63.y = _1825;
    out.m_63.z = _1827;
    out.m_63.w = _1831;
    float _1847 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1849 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1839);
    float _1851 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _1801;
    out.m_65.y = _1811;
    out.m_65.z = _1833;
    out.m_65.w = _1835;
    float _1853 = 1.0 / _1847;
    bool _1855 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1857 = isnan(0.5);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1863 = _1859 || _1861;
    float _1865 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1849);
    out.m_67.x = _1841;
    out.m_67.y = _1843;
    out.m_67.z = _1845;
    float _1867 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1493);
    float _1869 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1871 = exp2(_1851);
    float _1873 = _1869 + _1847;
    float _1875 = _1841;
    if (_1863)
    {
        _1875 = 1.0;
    }
    float _1877 = _1875;
    float _1879 = _1873 * _1853;
    float _1881 = _1879 * 0.5;
    float _1883 = _1877;
    if (!_1863)
    {
        float _1885 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1887 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1889 = _1885 * 0.15915493667125701904296875;
        float _1891 = _1887 * 0.15915493667125701904296875;
        float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1895 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1893);
        float _1897 = _1889 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = _1889 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = 1.0 / _1899;
        float _1907 = _1891 * 6.283185482025146484375;
        float _1909 = cos(_1907);
        float _1911 = _1903 * _1905;
        float _1913 = _1891 * 6.283185482025146484375;
        float _1915 = sin(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = 1.0 / _1895;
        float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1923 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1921;
        float _1925 = 1.0 / _1917;
        float _1927 = 1.0 / _1923;
        float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1931 = _1919 * _1929;
        float _1933 = _1915 * _1925;
        float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1937 = fma(_1933, _1931, _1935);
        float _1939 = _1937 * _1927;
        float _1941 = precise::clamp(_1939, 0.0, 1.0);
        _1883 = _1941;
    }
    float _1943 = _1883;
    float _1945 = -_1871;
    float _1947 = _1945 + 1.0;
    bool _1949 = _1943 > 0.0;
    bool _1951 = isnan(_1943);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(0.0);
    bool _1957 = _1953 || _1955;
    float _1959 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1961 = _1867 + _1348;
    float _1963 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1965 = _1390 + _1348;
    float _1967 = _1348 * 0.5;
    out.m_69.x = _1116;
    out.m_69.y = _1112;
    out.m_69.z = _1120;
    float _1969 = _1963 * _1424;
    float _1971 = -_1963;
    float _1973 = _1971 + 1.0;
    float _1975 = _1961 * 0.5;
    float _1977 = _1435 * _1969;
    float _1979 = _1445 * _1969;
    float _1981 = _1435 * _1973;
    float _1983 = _1965 * 0.5;
    float _1985 = fma(_1398, -0.5, _1967);
    float _1987 = _1959 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1989 = fma(_1441, _1977, _1429);
    float _1991 = fma(_1443, _1977, _1431);
    float _1993 = fma(_1435, _1979, _1433);
    out.gl_Position.x = _1390;
    out.gl_Position.y = _1398;
    out.gl_Position.z = _1867;
    out.gl_Position.w = _1348;
    out.m_71.x = _1983;
    out.m_71.y = _1985;
    out.m_71.z = _1975;
    out.m_71.w = _1348;
    out.m_45.x = _1987;
    out.m_73.x = _1989;
    out.m_73.y = _1991;
    out.m_73.z = _1993;
    out.m_73.w = _1981;
    if (_1957)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1995 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1995;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

