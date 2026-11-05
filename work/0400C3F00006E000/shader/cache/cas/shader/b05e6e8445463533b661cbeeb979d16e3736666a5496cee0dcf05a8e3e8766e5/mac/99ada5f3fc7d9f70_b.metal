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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_59 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_65 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1124 = false;
    bool _892 = false;
    bool _554 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2040 = as_type<float>(_100);
        out.gl_Position.z = _2040;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = 0.0;
    if (_114)
    {
        float _122 = float(_84);
        _120 = _122;
    }
    float _124 = _120;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    if (_130)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _94;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2108 = as_type<float>(_136);
        out.gl_Position.z = _2108;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_47.x;
    float _140 = in.m_47.y;
    float _142 = in.m_47.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _158 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _156);
    float _160 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _162 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _160);
    float _164 = _160;
    float _166 = _144;
    if (!_154)
    {
        float _168 = _144 * _144;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _158);
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _162);
    float _178 = _172;
    if (!_154)
    {
        float _180 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    float _188 = 0.0;
    if (!_184)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _144 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _144);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _218;
        _188 = _202;
    }
    float _220 = _186;
    float _222 = _188;
    bool _224 = !_154;
    float _226 = _222;
    if (!_224)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _144 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _166 = _246;
    }
    float _248 = _166;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = _250;
    float _258 = _254;
    if (!_154)
    {
        float _260 = _118 * _118;
        float _262 = _260 * 0.5;
        _226 = _262;
    }
    float _264 = _226;
    float _266 = fma(_248, _138, _250);
    float _268 = fma(_248, _140, _252);
    float _270 = fma(_248, _142, _254);
    if (!_154)
    {
        float _272 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _272;
    }
    float _274 = _256;
    bool _276 = !_154;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _118 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _118);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
        _258 = _296;
    }
    float _310 = _278;
    float _312 = _258;
    float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _316 = _312;
    if (!_154)
    {
        _316 = _118;
    }
    float _318 = _316;
    bool _320 = !_154;
    float _322 = _318;
    if (!_320)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _118 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _322 = _342;
    }
    float _344 = _322;
    float _346 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = fma(_344, _140, _314);
    float _350 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = sqrt(_176);
    float _354 = fma(_344, _138, _346);
    float _356 = -_348;
    float _358 = _268 + _356;
    float _360 = fma(_344, _142, _350);
    float _362 = -_354;
    float _364 = _266 + _362;
    float _366 = _358 * _358;
    float _368 = -_360;
    float _370 = _270 + _368;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _374 = fma(_364, _364, _366);
    float _376 = sqrt(_174);
    float _378 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _372);
    float _380 = fma(_370, _370, _374);
    float _382 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _384 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _386 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _378);
    float _388 = in.m_49.w;
    float _390 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].y, _382);
    float _392 = sqrt(_380);
    float _394 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _396 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].y, _390);
    float _400 = in.m_42.x;
    float _402 = in.m_42.y;
    float _404 = in.m_42.z;
    float _406 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].x, _394);
    float _408 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].z, _384);
    float _410 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].w, _396);
    float _412 = sqrt(_386);
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].x, _406);
    float _416 = _352 * _398;
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].w, _410);
    float _420 = _376 * _414;
    float _422 = _416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _424 = _392 >= 9.9999999747524270787835121154785e-07;
    bool _426 = isnan(_392);
    bool _428 = _424 || _426;
    bool _430 = isnan(9.9999999747524270787835121154785e-07);
    bool _432 = _428 || _430;
    float _434 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].z, _408);
    float _436 = _416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _438 = _416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _440 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[24].x, _422);
    float _442 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[25].x, _436);
    float _444 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[26].x, _438);
    float _446 = _412 * _434;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[24].z, _440);
    float _450 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[25].z, _442);
    float _452 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[26].z, _444);
    float _454 = fma(_268, _388, _402);
    float _456 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[24].w, _448);
    float _458 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[25].w, _450);
    float _460 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[26].w, _452);
    float _462 = fma(_266, _388, _400);
    float _464 = fma(_270, _388, _404);
    float _466 = _418;
    float _468 = _456;
    float _470 = _458;
    if (_432)
    {
        _466 = _456;
    }
    float _472 = _466;
    float _474 = _472;
    if (_432)
    {
        _468 = _460;
    }
    float _476 = _468;
    float _478 = _476;
    if (!_432)
    {
        bool _480 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _482 = !_480;
        if (!_482)
        {
            float _484 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _486 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _488 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _490 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _484);
            float _492 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _486);
            float _494 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _488);
            float _496 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _490);
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _492);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _494);
            float _502 = _352 * _496;
            float _504 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _506 = _376 * _498;
            float _508 = _412 * _500;
            float _510 = _502 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _512 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _504);
            float _514 = _502 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _516 = _502 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _518 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[25].x, _510);
            float _520 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _512);
            float _522 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[24].x, _514);
            float _524 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[26].x, _516);
            float _526 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[25].z, _518);
            float _528 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[24].z, _522);
            float _530 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[26].z, _524);
            float _532 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].w, _526);
            float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].w, _528);
            float _536 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].w, _530);
            float _538 = _532 * _532;
            float _540 = fma(_534, _534, _538);
            float _542 = fma(_536, _536, _540);
            float _544 = rsqrt(_542);
            float _546 = _544 * 9.9999999747524270787835121154785e-07;
            float _548 = _534 * _546;
            float _550 = _532 * _546;
            float _552 = _536 * _546;
            _470 = _550;
            _474 = _548;
            _478 = _552;
            _554 = true;
        }
        else
        {
            float _556 = _140 * _140;
            float _558 = fma(_138, _138, _556);
            float _560 = fma(_142, _142, _558);
            float _562 = sqrt(_560);
            bool _564 = _562 >= 9.9999999747524270787835121154785e-07;
            bool _566 = isnan(_562);
            bool _568 = _564 || _566;
            bool _570 = isnan(9.9999999747524270787835121154785e-07);
            bool _572 = _568 || _570;
            if (!_572)
            {
                float _574 = _402 * _402;
                float _576 = fma(_400, _400, _574);
                float _578 = fma(_404, _404, _576);
                float _580 = sqrt(_578);
                bool _582 = _580 >= 9.9999999747524270787835121154785e-07;
                bool _584 = isnan(_580);
                bool _586 = _582 || _584;
                bool _588 = isnan(9.9999999747524270787835121154785e-07);
                bool _590 = _586 || _588;
                if (!_590)
                {
                    float _592 = _352 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _594 = _376 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _596 = _412 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _598 = _592 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _600 = _592 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _602 = _592 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _604 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[25].x, _598);
                    float _606 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[24].x, _600);
                    float _608 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[26].x, _602);
                    float _610 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _604);
                    float _612 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _606);
                    float _614 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _608);
                    float _616 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _610);
                    float _618 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _612);
                    float _620 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _614);
                    float _622 = _616 * _616;
                    float _624 = fma(_618, _618, _622);
                    float _626 = fma(_620, _620, _624);
                    float _628 = rsqrt(_626);
                    float _630 = _628 * 9.9999999747524270787835121154785e-07;
                    float _632 = _618 * _630;
                    float _634 = _616 * _630;
                    float _636 = _620 * _630;
                    _470 = _634;
                    _474 = _632;
                    _478 = _636;
                    _554 = true;
                }
                else
                {
                    float _638 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _640 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _642 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _644 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _646 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].y, _638);
                    float _648 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].x, _640);
                    float _650 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].z, _642);
                    float _652 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].w, _644);
                    float _654 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].y, _646);
                    float _656 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].x, _648);
                    float _658 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].z, _650);
                    float _660 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].w, _652);
                    float _662 = _352 * _654;
                    float _664 = _376 * _656;
                    float _666 = _412 * _658;
                    float _668 = _662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _670 = _662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _672 = _662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _674 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _668);
                    float _676 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _670);
                    float _678 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _672);
                    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _674);
                    float _682 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _676);
                    float _684 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _678);
                    float _686 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[25].w, _680);
                    float _688 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[24].w, _682);
                    float _690 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[26].w, _684);
                    float _692 = _686 * _686;
                    float _694 = fma(_688, _688, _692);
                    float _696 = fma(_690, _690, _694);
                    float _698 = rsqrt(_696);
                    float _700 = _698 * 9.9999999747524270787835121154785e-07;
                    float _702 = _688 * _700;
                    float _704 = _686 * _700;
                    float _706 = _690 * _700;
                    _470 = _704;
                    _474 = _702;
                    _478 = _706;
                    _554 = true;
                }
            }
            else
            {
                float _708 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _710 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _712 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _714 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _716 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].y, _708);
                float _718 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].x, _710);
                float _720 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].z, _712);
                float _722 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].w, _714);
                float _724 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].y, _716);
                float _726 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].x, _718);
                float _728 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].z, _720);
                float _730 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].w, _722);
                float _732 = _352 * _724;
                float _734 = _376 * _726;
                float _736 = _412 * _728;
                float _738 = _732 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _740 = _732 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _742 = _732 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _744 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _738);
                float _746 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[24].x, _740);
                float _748 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _742);
                float _750 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].z, _744);
                float _752 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].z, _746);
                float _754 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].z, _748);
                float _756 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[25].w, _750);
                float _758 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[24].w, _752);
                float _760 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[26].w, _754);
                float _762 = _756 * _756;
                float _764 = fma(_758, _758, _762);
                float _766 = fma(_760, _760, _764);
                float _768 = rsqrt(_766);
                float _770 = _768 * 9.9999999747524270787835121154785e-07;
                float _772 = _758 * _770;
                float _774 = _756 * _770;
                float _776 = _760 * _770;
                _470 = _774;
                _474 = _772;
                _478 = _776;
            }
        }
    }
    _554 = false;
    float _778 = _470;
    float _780 = _474;
    float _782 = _478;
    float _784 = in.m_51.x;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _788 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _796 = _794 != 0;
    int _798 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _800 = _798 != 0;
    float _802 = _788 * _786;
    float _804 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[20].x, _802);
    float _806 = _804 * 6.283185482025146484375;
    float _808 = floor(_804);
    float _810 = _806 * 0.15915493667125701904296875;
    bool _812 = !_792;
    int _814 = _812 ? 0 : 1;
    int _816 = abs(_814);
    float _818 = _810 * 6.283185482025146484375;
    float _820 = cos(_818);
    bool _822 = !_800;
    int _824 = _822 ? 0 : 1;
    bool _826 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _828 = abs(_824);
    float _830 = -_808;
    float _832 = _804 + _830;
    bool _834 = !_796;
    int _836 = _834 ? 0 : 1;
    float _838 = float(_816);
    int _840 = abs(_836);
    float _842 = -_832;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _846 = _832 < 0.5;
    float _848 = float(_846);
    float _850 = fma(_820, 0.5, 0.5);
    float _852 = abs(_844);
    float _854 = _838 * _852;
    float _856 = float(_828);
    float _858 = -_848;
    float _860 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _862 = -_850;
    float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _866 = float(_840);
    float _868 = fma(_856, _864, _854);
    float _870 = abs(_860);
    float _872 = fma(_866, _870, _868);
    bool _874 = !_826;
    float _890;
    if (!_874)
    {
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _878 = _784 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _882 = _880 * _876;
        float _884 = floor(_882);
        float _886 = -_884;
        float _888 = _882 + _886;
        _890 = _888;
        _892 = true;
    }
    else
    {
        float _894 = float(_84);
        float _896 = 1.0 / _894;
        float _898 = _118 * _896;
        _890 = _898;
    }
    _892 = false;
    float _900 = _890;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _904 = _900 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _908 = _900 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _924 = _900 + _922;
    float _926 = 1.0 / _912;
    bool _928 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _930 = isnan(_900);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    bool _940 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _942 = isnan(_900);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = 1.0 / _916;
    bool _954 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _956 = 1.0 / _920;
    float _958 = _908 * _926;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _960;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _964;
    float _968 = _904 * _952;
    bool _970 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _972 = isnan(_900);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _982;
    float _986 = -_980;
    float _988 = _986 + 1.0;
    float _990 = fma(_984, _958, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _992 = _924 * _956;
    float _994 = fma(_962, _958, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _996 = fma(_966, _958, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _998 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1000 = isnan(_900);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _938 * _988;
    float _1012 = -_938;
    float _1014 = _1012 + 1.0;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1028 = -_1008;
    float _1030 = _1028 + 1.0;
    float _1032 = _1008 * _1014;
    float _1034 = fma(_1018, _968, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1036 = fma(_1022, _968, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1038 = fma(_1026, _968, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1040 = _950 * _1030;
    float _1042 = in.m_49.x;
    float _1044 = in.m_49.y;
    float _1046 = in.m_49.z;
    float _1048 = -_950;
    float _1050 = _1048 + 1.0;
    float _1052 = _994 * _1040;
    float _1054 = _996 * _1040;
    float _1056 = _990 * _1040;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1058;
    float _1062 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1052);
    float _1064 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1054);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1070;
    float _1074 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1056);
    float _1076 = fma(_1060, _992, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1078 = fma(_1068, _992, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1080 = fma(_1072, _992, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1082 = fma(_1034, _1032, _1062);
    float _1084 = fma(_1036, _1032, _1064);
    float _1086 = fma(_1038, _1032, _1074);
    float _1088 = fma(_1076, _1010, _1082);
    float _1090 = fma(_1078, _1010, _1084);
    float _1092 = fma(_1080, _1010, _1086);
    float _1094 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1088);
    float _1096 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1090);
    float _1098 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1092);
    float _1100 = _1094 * _1042;
    float _1102 = _1096 * _1044;
    float _1104 = _1098 * _1046;
    bool _1106 = !_954;
    float _1122;
    if (!_1106)
    {
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1110 = _784 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _1114 = _1112 * _1108;
        float _1116 = floor(_1114);
        float _1118 = -_1116;
        float _1120 = _1114 + _1118;
        _1122 = _1120;
        _1124 = true;
    }
    else
    {
        float _1126 = float(_84);
        float _1128 = 1.0 / _1126;
        float _1130 = _118 * _1128;
        _1122 = _1130;
    }
    _1124 = false;
    float _1132 = _1122;
    float _1134 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1136 = precise::max(0.5, (*spvDescriptorSet0.vp_c7)._m0[0].x);
    float _1138 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1140 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1134);
    float _1142 = precise::min(_1136, 0.949999988079071044921875);
    float _1144 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1138);
    float _1146 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1148 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1140);
    float _1150 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1152 = fma(_1142, -6.644444942474365234375, 6.31222248077392578125);
    float _1154 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1144);
    float _1156 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1146);
    float _1158 = _1148 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1160 = in.m_51.y;
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1164 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1156);
    float _1166 = floor(_1152);
    float _1168 = _352 * _1158;
    float _1170 = _376 * _1162;
    float _1172 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1150);
    float _1174 = _1164 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1180 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1172);
    float _1182 = _412 * _1174;
    float _1184 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1186 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1178);
    float _1190 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1184);
    float _1194 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1186);
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1188);
    float _1198 = _1166 * 0.5;
    float _1200 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1192);
    float _1202 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1194);
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1196);
    float _1206 = -_1198;
    float _1208 = _1206 + 0.5;
    float _1210 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1212 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1202);
    float _1214 = _1204 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1216 = _1208 * _1160;
    float _1218 = _1216 * 2.0;
    float _1220 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1222 = _1210 + _1220;
    float _1224 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1226 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1228 = _1214 + _1226;
    bool _1230 = _1198 <= _784;
    bool _1232 = isnan(_1198);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(_784);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = _1222 * _1218;
    float _1244 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1246 = _1224 + _1244;
    float _1248 = _1228 * _1218;
    float _1250 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1252 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[2].w, _778);
    float _1254 = _1246 * _1218;
    float _1256 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[2].w, _780);
    float _1258 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1260 = _1252 * _1252;
    float _1262 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[2].w, _782);
    float _1264 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1266 = _1224 + _1254;
    float _1268 = fma(_1256, _1256, _1260);
    float _1270 = _1214 + _1248;
    float _1272 = _1210 + _1242;
    float _1274 = fma(_1262, _1262, _1268);
    float _1276 = in.m_53.x;
    float _1278 = in.m_53.y;
    float _1280 = in.m_53.z;
    float _1282 = rsqrt(_1274);
    float _1284 = _1262 * _1282;
    float _1286 = _1256 * _1282;
    float _1288 = _1252 * _1282;
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1292 = _1284 * _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1296 = _1286 * _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1300 = _1288 * _1298;
    float _1302 = _1240 * _1278;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1306 = -_1292;
    float _1308 = fma(_1286, _1304, _1306);
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1312 = -_1296;
    float _1314 = fma(_1288, _1310, _1312);
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1318 = -_1300;
    float _1320 = fma(_1284, _1316, _1318);
    float _1322 = _1240 * _1276;
    float _1324 = _1308 * _1308;
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1302);
    float _1328 = _1240 * _1280;
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1322);
    float _1332 = fma(_1320, _1320, _1324);
    float _1334 = _1250 * _1326;
    float _1336 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1328);
    float _1338 = _1258 * _1330;
    float _1340 = fma(_1314, _1314, _1332);
    float _1342 = _1334 * _1284;
    float _1344 = _1264 * _1336;
    float _1346 = _1334 * _1286;
    float _1348 = rsqrt(_1340);
    float _1350 = _1308 * _1348;
    float _1352 = _1314 * _1348;
    float _1354 = _1320 * _1348;
    float _1356 = _1286 * _1350;
    float _1358 = fma(_1338, _1352, _1342);
    float _1360 = _1288 * _1352;
    float _1362 = fma(_1338, _1354, _1346);
    float _1364 = -_1356;
    float _1366 = fma(_1288, _1354, _1364);
    float _1368 = -_1360;
    float _1370 = fma(_1284, _1350, _1368);
    float _1372 = fma(_1344, _1366, _1358);
    float _1374 = fma(_1344, _1370, _1362);
    float _1376 = _1266 + _1372;
    float _1378 = _1270 + _1374;
    float _1380 = _1284 * _1354;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1384 = _1376 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1378 + _1386;
    float _1390 = -_1380;
    float _1392 = fma(_1286, _1352, _1390);
    float _1394 = _1384 * _1384;
    float _1396 = fma(_1388, _1388, _1394);
    float _1398 = _1334 * _1288;
    float _1400 = sqrt(_1396);
    float _1402 = fma(_1338, _1350, _1398);
    float _1404 = fma(_1344, _1392, _1402);
    float _1406 = _1272 + _1404;
    bool _1408 = _1400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = _1404;
    float _1412 = _1402;
    float _1414 = _1378;
    float _1416 = _1376;
    float _1418 = _1360;
    if (!_1408)
    {
        _1410 = _1378;
    }
    float _1420 = _1410;
    float _1422 = _1420;
    if (!_1408)
    {
        _1412 = _1376;
    }
    float _1424 = _1412;
    float _1426 = _1424;
    if (!_1408)
    {
        _1414 = _1406;
    }
    float _1428 = _1414;
    bool _1430 = !_1408;
    float _1432 = _1428;
    if (!_1430)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1438 = _1400 + _1436;
        float _1440 = rsqrt(_1396);
        float _1442 = _1438 * _1434;
        float _1444 = _1406 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = _1442 * 0.15915493667125701904296875;
        float _1448 = _1446 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1446 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 + (-1.0);
        float _1458 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1462 = fma(_1406, _1450, _1458);
        float _1464 = _1440 * _1460;
        float _1466 = fma(_1388, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1384, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1432 = _1462;
        _1422 = _1466;
        _1426 = _1468;
    }
    float _1470 = _1432;
    float _1472 = _1422;
    float _1474 = _1426;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = _1470 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1482 = _1472 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1486 = _1474 + _1484;
    float _1488 = _1478 * _1478;
    float _1490 = fma(_1482, _1482, _1488);
    float _1492 = fma(_1486, _1486, _1490);
    float _1494 = rsqrt(_1492);
    float _1496 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1498 = _1482 * _1496;
    float _1500 = _1486 * _1496;
    float _1502 = _1498 * _1498;
    float _1504 = _1500 * _1500;
    float _1506 = _1502 + _1504;
    float _1508 = sqrt(_1506);
    bool _1510 = _1508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1514 = _1508 + _1512;
    float _1516 = _1284;
    float _1518 = _1506;
    float _1520 = _1514;
    float _1522 = _1478;
    float _1524 = _1498;
    if (_1510)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1526;
    }
    float _1528 = _1516;
    if (_1510)
    {
        float _1530 = rsqrt(_1506);
        _1518 = _1530;
    }
    float _1532 = _1518;
    float _1534 = _1528;
    float _1536 = _1532;
    if (_1510)
    {
        float _1538 = _1514 * _1528;
        _1520 = _1538;
    }
    float _1540 = _1520;
    if (_1510)
    {
        float _1542 = _1540 * 0.15915493667125701904296875;
        _1416 = _1542;
    }
    float _1544 = _1416;
    float _1546 = _1486;
    if (_1510)
    {
        float _1548 = _1544 * 6.283185482025146484375;
        float _1550 = sin(_1548);
        _1546 = _1550;
    }
    float _1552 = _1546;
    float _1554 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1556 = precise::max(0.0, _1554);
    float _1558 = _1400;
    float _1560 = _1556;
    if (_1510)
    {
        float _1562 = _1544 * 6.283185482025146484375;
        float _1564 = cos(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = -_1496;
    float _1570 = -_1556;
    float _1572 = fma(_1478, _1568, _1570);
    if (_1510)
    {
        float _1574 = _1572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1522 = _1574;
    }
    float _1576 = _1522;
    float _1578 = sqrt(_1492);
    float _1580 = _1552;
    float _1582 = _1576;
    if (_1510)
    {
        float _1584 = fma(_1552, _1576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1580 = _1584;
    }
    float _1586 = _1580;
    float _1588 = _1586;
    if (!_1510)
    {
        _1582 = _1500;
    }
    float _1590 = _1582;
    float _1592 = _1590;
    if (_1510)
    {
        float _1594 = _1566 + (-1.0);
        _1560 = _1594;
    }
    float _1596 = _1560;
    float _1598 = _1596;
    if (_1510)
    {
        float _1600 = _1532 * _1586;
        _1418 = _1600;
    }
    float _1602 = _1418;
    if (!_1510)
    {
        _1588 = _1572;
    }
    float _1604 = _1588;
    float _1606 = _1604;
    if (_1510)
    {
        float _1608 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1534 = _1608;
    }
    float _1610 = _1534;
    if (_1510)
    {
        float _1612 = _1498 * _1602;
        _1524 = _1612;
    }
    float _1614 = _1524;
    if (!_1510)
    {
        _1536 = _1502;
    }
    float _1616 = _1536;
    float _1618 = _1616;
    if (_1510)
    {
        float _1620 = _1500 * _1602;
        _1592 = _1620;
    }
    float _1622 = _1592;
    if (_1510)
    {
        float _1624 = fma(_1572, _1566, _1610);
        _1606 = _1624;
    }
    float _1626 = _1606;
    if (_1510)
    {
        float _1628 = _1614 * _1614;
        _1618 = _1628;
    }
    float _1630 = _1618;
    if (!_1510)
    {
        _1598 = _1504;
    }
    float _1632 = _1598;
    float _1634 = _1632;
    if (_1510)
    {
        float _1636 = _1622 * _1622;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = fma(_1626, _1626, _1630);
    float _1642 = _1640 + _1638;
    float _1644 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1648 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1646);
    float _1650 = precise::clamp(_1648, 0.0, 1.0);
    float _1652 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1654 = rsqrt(_1642);
    float _1656 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1644);
    float _1658 = -_1650;
    float _1660 = _1658 + 1.0;
    float _1662 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1664 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1652);
    float _1666 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1656);
    float _1668 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1664);
    float _1672 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1674 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1662);
    float _1676 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1668);
    float _1678 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1680 = abs(_1660);
    float _1682 = log2(_1680);
    float _1684 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1674);
    float _1686 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1676);
    float _1688 = _1654 * _1614;
    float _1690 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1694 = _1654 * _1626;
    float _1696 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1698 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1700 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1702 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1690);
    float _1704 = _1654 * _1622;
    float _1706 = -_1696;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1706);
    float _1710 = -_1700;
    float _1712 = fma(_1710, _1698, 1.0);
    float _1714 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1716 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1718 = -_1704;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1708);
    float _1722 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1724 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1726 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1716);
    float _1728 = fma(_1720, -0.5, 0.5);
    float _1730 = log2(_1712);
    float _1732 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1734 = fma(_1720, 0.5, 0.5);
    float _1736 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1724);
    float _1738 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1732);
    float _1740 = fma(_1734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = 1.0 / _1726;
    float _1744 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1738);
    float _1746 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1748 = fma(_1734, _1740, -0.212114393711090087890625);
    float _1750 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1744);
    float _1752 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1754 = fma(_1734, _1748, 1.570728778839111328125);
    float _1756 = exp2(_1722);
    float _1758 = _1730 * 0.693147182464599609375;
    float _1760 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1762 = sqrt(_1728);
    float _1764 = _1694 + 1.0;
    float _1766 = _1750 * _1742;
    float _1768 = _1752 * _1742;
    float _1770 = fma(_1766, 0.5, 0.5);
    float _1772 = fma(_1768, -0.5, 0.5);
    float _1774 = -_1694;
    float _1776 = fma(_1756, _1764, _1774);
    float3 _4925 = float3(_1770, _1772, _1760);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4925, float3(0.0), isnan(_4925)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4925, float3(0.0), isnan(_4925)), level(0.0)).x;
    float _1780 = fma(_1776, 0.5, 0.5);
    float _1782 = _1762 * 0.636619746685028076171875;
    float _1784 = -_1754;
    float _1786 = fma(_1782, _1784, 1.0);
    float3 _4946 = float3(_1770, _1772, _1760);
    float4 _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4946, float3(0.0), isnan(_4946)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4946, float3(0.0), isnan(_4946)), level(0.0)).xyzw;
    float _1791 = _1789.x;
    float _1793 = _1789.y;
    float _1795 = _1789.z;
    float _1797 = _1789.w;
    float2 _4963 = float2(_1786, _1780);
    float3 _1801 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4963, float2(0.0), isnan(_4963)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4963, float2(0.0), isnan(_4963)), level(0.0)).xyz;
    float _1803 = _1801.x;
    float _1805 = _1801.y;
    float _1807 = _1801.z;
    float _1809 = in.m_55.x;
    float _1811 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1813 = in.m_55.y;
    float _1815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1823 = _1821 != 0;
    float _1825 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1829 = _1827 != 0;
    float _1831 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1833 = _784 > 0.5;
    bool _1835 = _1833 && _1823;
    float _1837 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1825);
    float _1839 = 1.0 / _1819;
    float _1841 = _1831 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1843 = _1160 > 0.5;
    bool _1845 = _1132 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1847 = isnan(_1132);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1853 = _1849 || _1851;
    float _1855 = float(_1853);
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1857;
    float _1861 = exp2(_1811);
    out.m_45.x = _1841;
    float _1863 = _1770;
    if (_1823)
    {
        _1863 = _1809;
    }
    float _1865 = _1863;
    float _1867 = -_1855;
    float _1869 = _1867 + 1.0;
    float _1871 = -_1813;
    float _1873 = _1871 + 1.0;
    float _1875 = _1865;
    float _1877 = _1813;
    float _1879 = _1873;
    if (_1835)
    {
        float _1881 = -_1865;
        float _1883 = _1881 + 1.0;
        _1875 = _1883;
    }
    float _1885 = _1875;
    float _1887 = _1859 * _1839;
    float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1891 = _1132 + _1889;
    bool _1893 = _1132 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1895 = isnan(_1132);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    float _1905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1829)
    {
        float _1907 = _1843 ? _1873 : _1813;
        _1877 = _1907;
    }
    float _1909 = _1877;
    if (!_1823)
    {
        _1879 = _1809;
    }
    float _1911 = _1879;
    float _1913 = fma(_1887, _1891, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1915 = _1911;
    if (_1823)
    {
        _1915 = _1885;
    }
    float _1917 = _1915;
    float _1919 = _1903 * _1869;
    float _1921 = -_1861;
    float _1923 = _1921 + 1.0;
    float _1925 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1927 = _1913 * _1919;
    float _1929 = -_1903;
    float _1931 = _1929 + 1.0;
    float _1933 = _1925 * _1815;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1935 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1937 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1927);
    float _1939 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1941 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1937);
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1945 = _1939 * _1905;
    float _1947 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1949 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1837);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1957 = -_1935;
    float _1959 = _1957 + 1.0;
    float _1961 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1951);
    float _1963 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1965 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1961 + _1726;
    out.m_59.x = _1933;
    out.m_59.y = _1945;
    float _1969 = _1967 * 0.5;
    out.m_61.x = _1963;
    out.m_61.y = _1965;
    out.m_61.z = _1949;
    out.m_61.w = _1947;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1961;
    out.gl_Position.w = _1726;
    out.m_63.z = _1969;
    out.m_63.w = _1726;
    float _1971 = _1935 * _1778;
    float _1973 = _1797 * _1971;
    float _1975 = _1797 * _1959;
    float _1977 = _1807 * _1971;
    float _1979 = fma(_1803, _1973, _1791);
    float _1981 = fma(_1805, _1973, _1793);
    float _1983 = fma(_1797, _1977, _1795);
    out.m_65.x = _1979;
    out.m_65.y = _1981;
    out.m_65.z = _1983;
    out.m_65.w = _1975;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1124 = false;
    bool _892 = false;
    bool _554 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2040 = as_type<float>(_100);
        out.gl_Position.z = _2040;
    }
    if (!_88)
    {
        return out;
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = 0.0;
    if (_114)
    {
        float _122 = float(_84);
        _120 = _122;
    }
    float _124 = _120;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    if (_130)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _94;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2108 = as_type<float>(_136);
        out.gl_Position.z = _2108;
    }
    if (_130)
    {
        return out;
    }
    float _138 = in.m_47.x;
    float _140 = in.m_47.y;
    float _142 = in.m_47.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _158 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _156);
    float _160 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _162 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _160);
    float _164 = _160;
    float _166 = _144;
    if (!_154)
    {
        float _168 = _144 * _144;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _158);
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _162);
    float _178 = _172;
    if (!_154)
    {
        float _180 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    float _188 = 0.0;
    if (!_184)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _144 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _144);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _218;
        _188 = _202;
    }
    float _220 = _186;
    float _222 = _188;
    bool _224 = !_154;
    float _226 = _222;
    if (!_224)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _144 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _166 = _246;
    }
    float _248 = _166;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = _250;
    float _258 = _254;
    if (!_154)
    {
        float _260 = _118 * _118;
        float _262 = _260 * 0.5;
        _226 = _262;
    }
    float _264 = _226;
    float _266 = fma(_248, _138, _250);
    float _268 = fma(_248, _140, _252);
    float _270 = fma(_248, _142, _254);
    if (!_154)
    {
        float _272 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _272;
    }
    float _274 = _256;
    bool _276 = !_154;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _118 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _118);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
        _258 = _296;
    }
    float _310 = _278;
    float _312 = _258;
    float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _316 = _312;
    if (!_154)
    {
        _316 = _118;
    }
    float _318 = _316;
    bool _320 = !_154;
    float _322 = _318;
    if (!_320)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _118 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _322 = _342;
    }
    float _344 = _322;
    float _346 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = fma(_344, _140, _314);
    float _350 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = sqrt(_176);
    float _354 = fma(_344, _138, _346);
    float _356 = -_348;
    float _358 = _268 + _356;
    float _360 = fma(_344, _142, _350);
    float _362 = -_354;
    float _364 = _266 + _362;
    float _366 = _358 * _358;
    float _368 = -_360;
    float _370 = _270 + _368;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _374 = fma(_364, _364, _366);
    float _376 = sqrt(_174);
    float _378 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _372);
    float _380 = fma(_370, _370, _374);
    float _382 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _384 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _386 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _378);
    float _388 = in.m_49.w;
    float _390 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].y, _382);
    float _392 = sqrt(_380);
    float _394 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _396 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].y, _390);
    float _400 = in.m_42.x;
    float _402 = in.m_42.y;
    float _404 = in.m_42.z;
    float _406 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].x, _394);
    float _408 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].z, _384);
    float _410 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].w, _396);
    float _412 = sqrt(_386);
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].x, _406);
    float _416 = _352 * _398;
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].w, _410);
    float _420 = _376 * _414;
    float _422 = _416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _424 = _392 >= 9.9999999747524270787835121154785e-07;
    bool _426 = isnan(_392);
    bool _428 = _424 || _426;
    bool _430 = isnan(9.9999999747524270787835121154785e-07);
    bool _432 = _428 || _430;
    float _434 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].z, _408);
    float _436 = _416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _438 = _416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _440 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[24].x, _422);
    float _442 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[25].x, _436);
    float _444 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[26].x, _438);
    float _446 = _412 * _434;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[24].z, _440);
    float _450 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[25].z, _442);
    float _452 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[26].z, _444);
    float _454 = fma(_268, _388, _402);
    float _456 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[24].w, _448);
    float _458 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[25].w, _450);
    float _460 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[26].w, _452);
    float _462 = fma(_266, _388, _400);
    float _464 = fma(_270, _388, _404);
    float _466 = _418;
    float _468 = _456;
    float _470 = _458;
    if (_432)
    {
        _466 = _456;
    }
    float _472 = _466;
    float _474 = _472;
    if (_432)
    {
        _468 = _460;
    }
    float _476 = _468;
    float _478 = _476;
    if (!_432)
    {
        bool _480 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _482 = !_480;
        if (!_482)
        {
            float _484 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _486 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _488 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _490 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _484);
            float _492 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _486);
            float _494 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _488);
            float _496 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _490);
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _492);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _494);
            float _502 = _352 * _496;
            float _504 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _506 = _376 * _498;
            float _508 = _412 * _500;
            float _510 = _502 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _512 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _504);
            float _514 = _502 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _516 = _502 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _518 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[25].x, _510);
            float _520 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _512);
            float _522 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[24].x, _514);
            float _524 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[26].x, _516);
            float _526 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[25].z, _518);
            float _528 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[24].z, _522);
            float _530 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[26].z, _524);
            float _532 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].w, _526);
            float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].w, _528);
            float _536 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].w, _530);
            float _538 = _532 * _532;
            float _540 = fma(_534, _534, _538);
            float _542 = fma(_536, _536, _540);
            float _544 = rsqrt(_542);
            float _546 = _544 * 9.9999999747524270787835121154785e-07;
            float _548 = _534 * _546;
            float _550 = _532 * _546;
            float _552 = _536 * _546;
            _470 = _550;
            _474 = _548;
            _478 = _552;
            _554 = true;
        }
        else
        {
            float _556 = _140 * _140;
            float _558 = fma(_138, _138, _556);
            float _560 = fma(_142, _142, _558);
            float _562 = sqrt(_560);
            bool _564 = _562 >= 9.9999999747524270787835121154785e-07;
            bool _566 = isnan(_562);
            bool _568 = _564 || _566;
            bool _570 = isnan(9.9999999747524270787835121154785e-07);
            bool _572 = _568 || _570;
            if (!_572)
            {
                float _574 = _402 * _402;
                float _576 = fma(_400, _400, _574);
                float _578 = fma(_404, _404, _576);
                float _580 = sqrt(_578);
                bool _582 = _580 >= 9.9999999747524270787835121154785e-07;
                bool _584 = isnan(_580);
                bool _586 = _582 || _584;
                bool _588 = isnan(9.9999999747524270787835121154785e-07);
                bool _590 = _586 || _588;
                if (!_590)
                {
                    float _592 = _352 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _594 = _376 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _596 = _412 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _598 = _592 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _600 = _592 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _602 = _592 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _604 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[25].x, _598);
                    float _606 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[24].x, _600);
                    float _608 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[26].x, _602);
                    float _610 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _604);
                    float _612 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _606);
                    float _614 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _608);
                    float _616 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _610);
                    float _618 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _612);
                    float _620 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _614);
                    float _622 = _616 * _616;
                    float _624 = fma(_618, _618, _622);
                    float _626 = fma(_620, _620, _624);
                    float _628 = rsqrt(_626);
                    float _630 = _628 * 9.9999999747524270787835121154785e-07;
                    float _632 = _618 * _630;
                    float _634 = _616 * _630;
                    float _636 = _620 * _630;
                    _470 = _634;
                    _474 = _632;
                    _478 = _636;
                    _554 = true;
                }
                else
                {
                    float _638 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _640 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _642 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _644 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _646 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].y, _638);
                    float _648 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].x, _640);
                    float _650 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].z, _642);
                    float _652 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].w, _644);
                    float _654 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].y, _646);
                    float _656 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].x, _648);
                    float _658 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].z, _650);
                    float _660 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].w, _652);
                    float _662 = _352 * _654;
                    float _664 = _376 * _656;
                    float _666 = _412 * _658;
                    float _668 = _662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _670 = _662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _672 = _662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _674 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _668);
                    float _676 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _670);
                    float _678 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _672);
                    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _674);
                    float _682 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _676);
                    float _684 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _678);
                    float _686 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[25].w, _680);
                    float _688 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[24].w, _682);
                    float _690 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[26].w, _684);
                    float _692 = _686 * _686;
                    float _694 = fma(_688, _688, _692);
                    float _696 = fma(_690, _690, _694);
                    float _698 = rsqrt(_696);
                    float _700 = _698 * 9.9999999747524270787835121154785e-07;
                    float _702 = _688 * _700;
                    float _704 = _686 * _700;
                    float _706 = _690 * _700;
                    _470 = _704;
                    _474 = _702;
                    _478 = _706;
                    _554 = true;
                }
            }
            else
            {
                float _708 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _710 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _712 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _714 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _716 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].y, _708);
                float _718 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].x, _710);
                float _720 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].z, _712);
                float _722 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].w, _714);
                float _724 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].y, _716);
                float _726 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].x, _718);
                float _728 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].z, _720);
                float _730 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].w, _722);
                float _732 = _352 * _724;
                float _734 = _376 * _726;
                float _736 = _412 * _728;
                float _738 = _732 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _740 = _732 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _742 = _732 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _744 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _738);
                float _746 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[24].x, _740);
                float _748 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _742);
                float _750 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].z, _744);
                float _752 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].z, _746);
                float _754 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].z, _748);
                float _756 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[25].w, _750);
                float _758 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[24].w, _752);
                float _760 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[26].w, _754);
                float _762 = _756 * _756;
                float _764 = fma(_758, _758, _762);
                float _766 = fma(_760, _760, _764);
                float _768 = rsqrt(_766);
                float _770 = _768 * 9.9999999747524270787835121154785e-07;
                float _772 = _758 * _770;
                float _774 = _756 * _770;
                float _776 = _760 * _770;
                _470 = _774;
                _474 = _772;
                _478 = _776;
            }
        }
    }
    _554 = false;
    float _778 = _470;
    float _780 = _474;
    float _782 = _478;
    float _784 = in.m_51.x;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _788 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _796 = _794 != 0;
    int _798 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _800 = _798 != 0;
    float _802 = _788 * _786;
    float _804 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[20].x, _802);
    float _806 = _804 * 6.283185482025146484375;
    float _808 = floor(_804);
    float _810 = _806 * 0.15915493667125701904296875;
    bool _812 = !_792;
    int _814 = _812 ? 0 : 1;
    int _816 = abs(_814);
    float _818 = _810 * 6.283185482025146484375;
    float _820 = cos(_818);
    bool _822 = !_800;
    int _824 = _822 ? 0 : 1;
    bool _826 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _828 = abs(_824);
    float _830 = -_808;
    float _832 = _804 + _830;
    bool _834 = !_796;
    int _836 = _834 ? 0 : 1;
    float _838 = float(_816);
    int _840 = abs(_836);
    float _842 = -_832;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _846 = _832 < 0.5;
    float _848 = float(_846);
    float _850 = fma(_820, 0.5, 0.5);
    float _852 = abs(_844);
    float _854 = _838 * _852;
    float _856 = float(_828);
    float _858 = -_848;
    float _860 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _862 = -_850;
    float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _866 = float(_840);
    float _868 = fma(_856, _864, _854);
    float _870 = abs(_860);
    float _872 = fma(_866, _870, _868);
    bool _874 = !_826;
    float _890;
    if (!_874)
    {
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _878 = _784 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _882 = _880 * _876;
        float _884 = floor(_882);
        float _886 = -_884;
        float _888 = _882 + _886;
        _890 = _888;
        _892 = true;
    }
    else
    {
        float _894 = float(_84);
        float _896 = 1.0 / _894;
        float _898 = _118 * _896;
        _890 = _898;
    }
    _892 = false;
    float _900 = _890;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _904 = _900 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _908 = _900 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _924 = _900 + _922;
    float _926 = 1.0 / _912;
    bool _928 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _930 = isnan(_900);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    bool _940 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _942 = isnan(_900);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = 1.0 / _916;
    bool _954 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _956 = 1.0 / _920;
    float _958 = _908 * _926;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _960;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _964;
    float _968 = _904 * _952;
    bool _970 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _972 = isnan(_900);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _982;
    float _986 = -_980;
    float _988 = _986 + 1.0;
    float _990 = fma(_984, _958, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _992 = _924 * _956;
    float _994 = fma(_962, _958, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _996 = fma(_966, _958, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _998 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1000 = isnan(_900);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _938 * _988;
    float _1012 = -_938;
    float _1014 = _1012 + 1.0;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1028 = -_1008;
    float _1030 = _1028 + 1.0;
    float _1032 = _1008 * _1014;
    float _1034 = fma(_1018, _968, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1036 = fma(_1022, _968, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1038 = fma(_1026, _968, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1040 = _950 * _1030;
    float _1042 = in.m_49.x;
    float _1044 = in.m_49.y;
    float _1046 = in.m_49.z;
    float _1048 = -_950;
    float _1050 = _1048 + 1.0;
    float _1052 = _994 * _1040;
    float _1054 = _996 * _1040;
    float _1056 = _990 * _1040;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1058;
    float _1062 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1052);
    float _1064 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1054);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1070;
    float _1074 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1056);
    float _1076 = fma(_1060, _992, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1078 = fma(_1068, _992, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1080 = fma(_1072, _992, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1082 = fma(_1034, _1032, _1062);
    float _1084 = fma(_1036, _1032, _1064);
    float _1086 = fma(_1038, _1032, _1074);
    float _1088 = fma(_1076, _1010, _1082);
    float _1090 = fma(_1078, _1010, _1084);
    float _1092 = fma(_1080, _1010, _1086);
    float _1094 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1088);
    float _1096 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1090);
    float _1098 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1092);
    float _1100 = _1094 * _1042;
    float _1102 = _1096 * _1044;
    float _1104 = _1098 * _1046;
    bool _1106 = !_954;
    float _1122;
    if (!_1106)
    {
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1110 = _784 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _1114 = _1112 * _1108;
        float _1116 = floor(_1114);
        float _1118 = -_1116;
        float _1120 = _1114 + _1118;
        _1122 = _1120;
        _1124 = true;
    }
    else
    {
        float _1126 = float(_84);
        float _1128 = 1.0 / _1126;
        float _1130 = _118 * _1128;
        _1122 = _1130;
    }
    _1124 = false;
    float _1132 = _1122;
    float _1134 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1136 = precise::max(0.5, (*spvDescriptorSet0.vp_c7)._m0[0].x);
    float _1138 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1140 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1134);
    float _1142 = precise::min(_1136, 0.949999988079071044921875);
    float _1144 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1138);
    float _1146 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1148 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1140);
    float _1150 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1152 = fma(_1142, -6.644444942474365234375, 6.31222248077392578125);
    float _1154 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1144);
    float _1156 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1146);
    float _1158 = _1148 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1160 = in.m_51.y;
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1164 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1156);
    float _1166 = floor(_1152);
    float _1168 = _352 * _1158;
    float _1170 = _376 * _1162;
    float _1172 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1150);
    float _1174 = _1164 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1180 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1172);
    float _1182 = _412 * _1174;
    float _1184 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1186 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1178);
    float _1190 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1184);
    float _1194 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1186);
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1188);
    float _1198 = _1166 * 0.5;
    float _1200 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1192);
    float _1202 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1194);
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1196);
    float _1206 = -_1198;
    float _1208 = _1206 + 0.5;
    float _1210 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1212 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1202);
    float _1214 = _1204 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1216 = _1208 * _1160;
    float _1218 = _1216 * 2.0;
    float _1220 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1222 = _1210 + _1220;
    float _1224 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1226 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1228 = _1214 + _1226;
    bool _1230 = _1198 <= _784;
    bool _1232 = isnan(_1198);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(_784);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = _1222 * _1218;
    float _1244 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1246 = _1224 + _1244;
    float _1248 = _1228 * _1218;
    float _1250 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1252 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[2].w, _778);
    float _1254 = _1246 * _1218;
    float _1256 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[2].w, _780);
    float _1258 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1260 = _1252 * _1252;
    float _1262 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[2].w, _782);
    float _1264 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1266 = _1224 + _1254;
    float _1268 = fma(_1256, _1256, _1260);
    float _1270 = _1214 + _1248;
    float _1272 = _1210 + _1242;
    float _1274 = fma(_1262, _1262, _1268);
    float _1276 = in.m_53.x;
    float _1278 = in.m_53.y;
    float _1280 = in.m_53.z;
    float _1282 = rsqrt(_1274);
    float _1284 = _1262 * _1282;
    float _1286 = _1256 * _1282;
    float _1288 = _1252 * _1282;
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1292 = _1284 * _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1296 = _1286 * _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1300 = _1288 * _1298;
    float _1302 = _1240 * _1278;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1306 = -_1292;
    float _1308 = fma(_1286, _1304, _1306);
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1312 = -_1296;
    float _1314 = fma(_1288, _1310, _1312);
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1318 = -_1300;
    float _1320 = fma(_1284, _1316, _1318);
    float _1322 = _1240 * _1276;
    float _1324 = _1308 * _1308;
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1302);
    float _1328 = _1240 * _1280;
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1322);
    float _1332 = fma(_1320, _1320, _1324);
    float _1334 = _1250 * _1326;
    float _1336 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1328);
    float _1338 = _1258 * _1330;
    float _1340 = fma(_1314, _1314, _1332);
    float _1342 = _1334 * _1284;
    float _1344 = _1264 * _1336;
    float _1346 = _1334 * _1286;
    float _1348 = rsqrt(_1340);
    float _1350 = _1308 * _1348;
    float _1352 = _1314 * _1348;
    float _1354 = _1320 * _1348;
    float _1356 = _1286 * _1350;
    float _1358 = fma(_1338, _1352, _1342);
    float _1360 = _1288 * _1352;
    float _1362 = fma(_1338, _1354, _1346);
    float _1364 = -_1356;
    float _1366 = fma(_1288, _1354, _1364);
    float _1368 = -_1360;
    float _1370 = fma(_1284, _1350, _1368);
    float _1372 = fma(_1344, _1366, _1358);
    float _1374 = fma(_1344, _1370, _1362);
    float _1376 = _1266 + _1372;
    float _1378 = _1270 + _1374;
    float _1380 = _1284 * _1354;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1384 = _1376 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1378 + _1386;
    float _1390 = -_1380;
    float _1392 = fma(_1286, _1352, _1390);
    float _1394 = _1384 * _1384;
    float _1396 = fma(_1388, _1388, _1394);
    float _1398 = _1334 * _1288;
    float _1400 = sqrt(_1396);
    float _1402 = fma(_1338, _1350, _1398);
    float _1404 = fma(_1344, _1392, _1402);
    float _1406 = _1272 + _1404;
    bool _1408 = _1400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = _1404;
    float _1412 = _1402;
    float _1414 = _1378;
    float _1416 = _1376;
    float _1418 = _1360;
    if (!_1408)
    {
        _1410 = _1378;
    }
    float _1420 = _1410;
    float _1422 = _1420;
    if (!_1408)
    {
        _1412 = _1376;
    }
    float _1424 = _1412;
    float _1426 = _1424;
    if (!_1408)
    {
        _1414 = _1406;
    }
    float _1428 = _1414;
    bool _1430 = !_1408;
    float _1432 = _1428;
    if (!_1430)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1438 = _1400 + _1436;
        float _1440 = rsqrt(_1396);
        float _1442 = _1438 * _1434;
        float _1444 = _1406 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = _1442 * 0.15915493667125701904296875;
        float _1448 = _1446 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1446 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 + (-1.0);
        float _1458 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1462 = fma(_1406, _1450, _1458);
        float _1464 = _1440 * _1460;
        float _1466 = fma(_1388, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1384, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1432 = _1462;
        _1422 = _1466;
        _1426 = _1468;
    }
    float _1470 = _1432;
    float _1472 = _1422;
    float _1474 = _1426;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = _1470 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1482 = _1472 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1486 = _1474 + _1484;
    float _1488 = _1478 * _1478;
    float _1490 = fma(_1482, _1482, _1488);
    float _1492 = fma(_1486, _1486, _1490);
    float _1494 = rsqrt(_1492);
    float _1496 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1498 = _1482 * _1496;
    float _1500 = _1486 * _1496;
    float _1502 = _1498 * _1498;
    float _1504 = _1500 * _1500;
    float _1506 = _1502 + _1504;
    float _1508 = sqrt(_1506);
    bool _1510 = _1508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1514 = _1508 + _1512;
    float _1516 = _1284;
    float _1518 = _1506;
    float _1520 = _1514;
    float _1522 = _1478;
    float _1524 = _1498;
    if (_1510)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1526;
    }
    float _1528 = _1516;
    if (_1510)
    {
        float _1530 = rsqrt(_1506);
        _1518 = _1530;
    }
    float _1532 = _1518;
    float _1534 = _1528;
    float _1536 = _1532;
    if (_1510)
    {
        float _1538 = _1514 * _1528;
        _1520 = _1538;
    }
    float _1540 = _1520;
    if (_1510)
    {
        float _1542 = _1540 * 0.15915493667125701904296875;
        _1416 = _1542;
    }
    float _1544 = _1416;
    float _1546 = _1486;
    if (_1510)
    {
        float _1548 = _1544 * 6.283185482025146484375;
        float _1550 = sin(_1548);
        _1546 = _1550;
    }
    float _1552 = _1546;
    float _1554 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1556 = precise::max(0.0, _1554);
    float _1558 = _1400;
    float _1560 = _1556;
    if (_1510)
    {
        float _1562 = _1544 * 6.283185482025146484375;
        float _1564 = cos(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = -_1496;
    float _1570 = -_1556;
    float _1572 = fma(_1478, _1568, _1570);
    if (_1510)
    {
        float _1574 = _1572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1522 = _1574;
    }
    float _1576 = _1522;
    float _1578 = sqrt(_1492);
    float _1580 = _1552;
    float _1582 = _1576;
    if (_1510)
    {
        float _1584 = fma(_1552, _1576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1580 = _1584;
    }
    float _1586 = _1580;
    float _1588 = _1586;
    if (!_1510)
    {
        _1582 = _1500;
    }
    float _1590 = _1582;
    float _1592 = _1590;
    if (_1510)
    {
        float _1594 = _1566 + (-1.0);
        _1560 = _1594;
    }
    float _1596 = _1560;
    float _1598 = _1596;
    if (_1510)
    {
        float _1600 = _1532 * _1586;
        _1418 = _1600;
    }
    float _1602 = _1418;
    if (!_1510)
    {
        _1588 = _1572;
    }
    float _1604 = _1588;
    float _1606 = _1604;
    if (_1510)
    {
        float _1608 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1534 = _1608;
    }
    float _1610 = _1534;
    if (_1510)
    {
        float _1612 = _1498 * _1602;
        _1524 = _1612;
    }
    float _1614 = _1524;
    if (!_1510)
    {
        _1536 = _1502;
    }
    float _1616 = _1536;
    float _1618 = _1616;
    if (_1510)
    {
        float _1620 = _1500 * _1602;
        _1592 = _1620;
    }
    float _1622 = _1592;
    if (_1510)
    {
        float _1624 = fma(_1572, _1566, _1610);
        _1606 = _1624;
    }
    float _1626 = _1606;
    if (_1510)
    {
        float _1628 = _1614 * _1614;
        _1618 = _1628;
    }
    float _1630 = _1618;
    if (!_1510)
    {
        _1598 = _1504;
    }
    float _1632 = _1598;
    float _1634 = _1632;
    if (_1510)
    {
        float _1636 = _1622 * _1622;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = fma(_1626, _1626, _1630);
    float _1642 = _1640 + _1638;
    float _1644 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1648 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1646);
    float _1650 = precise::clamp(_1648, 0.0, 1.0);
    float _1652 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1654 = rsqrt(_1642);
    float _1656 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1644);
    float _1658 = -_1650;
    float _1660 = _1658 + 1.0;
    float _1662 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1664 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1652);
    float _1666 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1656);
    float _1668 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1664);
    float _1672 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1674 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1662);
    float _1676 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1668);
    float _1678 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1680 = abs(_1660);
    float _1682 = log2(_1680);
    float _1684 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1674);
    float _1686 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1676);
    float _1688 = _1654 * _1614;
    float _1690 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1694 = _1654 * _1626;
    float _1696 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1698 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1700 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1702 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1690);
    float _1704 = _1654 * _1622;
    float _1706 = -_1696;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1706);
    float _1710 = -_1700;
    float _1712 = fma(_1710, _1698, 1.0);
    float _1714 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1716 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1718 = -_1704;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1708);
    float _1722 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1724 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1726 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1716);
    float _1728 = fma(_1720, -0.5, 0.5);
    float _1730 = log2(_1712);
    float _1732 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1734 = fma(_1720, 0.5, 0.5);
    float _1736 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1724);
    float _1738 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1732);
    float _1740 = fma(_1734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = 1.0 / _1726;
    float _1744 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1738);
    float _1746 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1748 = fma(_1734, _1740, -0.212114393711090087890625);
    float _1750 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1744);
    float _1752 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1754 = fma(_1734, _1748, 1.570728778839111328125);
    float _1756 = exp2(_1722);
    float _1758 = _1730 * 0.693147182464599609375;
    float _1760 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1762 = sqrt(_1728);
    float _1764 = _1694 + 1.0;
    float _1766 = _1750 * _1742;
    float _1768 = _1752 * _1742;
    float _1770 = fma(_1766, 0.5, 0.5);
    float _1772 = fma(_1768, -0.5, 0.5);
    float _1774 = -_1694;
    float _1776 = fma(_1756, _1764, _1774);
    float3 _4925 = float3(_1770, _1772, _1760);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4925, float3(0.0), isnan(_4925)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4925, float3(0.0), isnan(_4925)), level(0.0)).x;
    float _1780 = fma(_1776, 0.5, 0.5);
    float _1782 = _1762 * 0.636619746685028076171875;
    float _1784 = -_1754;
    float _1786 = fma(_1782, _1784, 1.0);
    float3 _4946 = float3(_1770, _1772, _1760);
    float4 _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4946, float3(0.0), isnan(_4946)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4946, float3(0.0), isnan(_4946)), level(0.0)).xyzw;
    float _1791 = _1789.x;
    float _1793 = _1789.y;
    float _1795 = _1789.z;
    float _1797 = _1789.w;
    float2 _4963 = float2(_1786, _1780);
    float3 _1801 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4963, float2(0.0), isnan(_4963)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4963, float2(0.0), isnan(_4963)), level(0.0)).xyz;
    float _1803 = _1801.x;
    float _1805 = _1801.y;
    float _1807 = _1801.z;
    float _1809 = in.m_55.x;
    float _1811 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1813 = in.m_55.y;
    float _1815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1823 = _1821 != 0;
    float _1825 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1829 = _1827 != 0;
    float _1831 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1833 = _784 > 0.5;
    bool _1835 = _1833 && _1823;
    float _1837 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1825);
    float _1839 = 1.0 / _1819;
    float _1841 = _1831 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1843 = _1160 > 0.5;
    bool _1845 = _1132 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1847 = isnan(_1132);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1853 = _1849 || _1851;
    float _1855 = float(_1853);
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1857;
    float _1861 = exp2(_1811);
    out.m_45.x = _1841;
    float _1863 = _1770;
    if (_1823)
    {
        _1863 = _1809;
    }
    float _1865 = _1863;
    float _1867 = -_1855;
    float _1869 = _1867 + 1.0;
    float _1871 = -_1813;
    float _1873 = _1871 + 1.0;
    float _1875 = _1865;
    float _1877 = _1813;
    float _1879 = _1873;
    if (_1835)
    {
        float _1881 = -_1865;
        float _1883 = _1881 + 1.0;
        _1875 = _1883;
    }
    float _1885 = _1875;
    float _1887 = _1859 * _1839;
    float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1891 = _1132 + _1889;
    bool _1893 = _1132 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1895 = isnan(_1132);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    float _1905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1829)
    {
        float _1907 = _1843 ? _1873 : _1813;
        _1877 = _1907;
    }
    float _1909 = _1877;
    if (!_1823)
    {
        _1879 = _1809;
    }
    float _1911 = _1879;
    float _1913 = fma(_1887, _1891, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1915 = _1911;
    if (_1823)
    {
        _1915 = _1885;
    }
    float _1917 = _1915;
    float _1919 = _1903 * _1869;
    float _1921 = -_1861;
    float _1923 = _1921 + 1.0;
    float _1925 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1927 = _1913 * _1919;
    float _1929 = -_1903;
    float _1931 = _1929 + 1.0;
    float _1933 = _1925 * _1815;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1935 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1937 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1927);
    float _1939 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1941 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1937);
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1945 = _1939 * _1905;
    float _1947 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1949 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1837);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1957 = -_1935;
    float _1959 = _1957 + 1.0;
    float _1961 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1951);
    float _1963 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1965 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1961 + _1726;
    out.m_59.x = _1933;
    out.m_59.y = _1945;
    float _1969 = _1967 * 0.5;
    out.m_61.x = _1963;
    out.m_61.y = _1965;
    out.m_61.z = _1949;
    out.m_61.w = _1947;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1961;
    out.gl_Position.w = _1726;
    out.m_63.z = _1969;
    out.m_63.w = _1726;
    float _1971 = _1935 * _1778;
    float _1973 = _1797 * _1971;
    float _1975 = _1797 * _1959;
    float _1977 = _1807 * _1971;
    float _1979 = fma(_1803, _1973, _1791);
    float _1981 = fma(_1805, _1973, _1793);
    float _1983 = fma(_1797, _1977, _1795);
    out.m_65.x = _1979;
    out.m_65.y = _1981;
    out.m_65.z = _1983;
    out.m_65.w = _1975;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1124 = false;
    bool _892 = false;
    bool _554 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2040 = as_type<float>(_100);
        out.gl_Position.z = _2040;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = 0.0;
    if (_114)
    {
        float _122 = float(_84);
        _120 = _122;
    }
    float _124 = _120;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    if (_130)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _94;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2108 = as_type<float>(_136);
        out.gl_Position.z = _2108;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_47.x;
    float _140 = in.m_47.y;
    float _142 = in.m_47.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _158 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _156);
    float _160 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _162 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _160);
    float _164 = _160;
    float _166 = _144;
    if (!_154)
    {
        float _168 = _144 * _144;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _158);
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _162);
    float _178 = _172;
    if (!_154)
    {
        float _180 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    float _188 = 0.0;
    if (!_184)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _144 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _144);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _218;
        _188 = _202;
    }
    float _220 = _186;
    float _222 = _188;
    bool _224 = !_154;
    float _226 = _222;
    if (!_224)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _144 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _166 = _246;
    }
    float _248 = _166;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = _250;
    float _258 = _254;
    if (!_154)
    {
        float _260 = _118 * _118;
        float _262 = _260 * 0.5;
        _226 = _262;
    }
    float _264 = _226;
    float _266 = fma(_248, _138, _250);
    float _268 = fma(_248, _140, _252);
    float _270 = fma(_248, _142, _254);
    if (!_154)
    {
        float _272 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _272;
    }
    float _274 = _256;
    bool _276 = !_154;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _118 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _118);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
        _258 = _296;
    }
    float _310 = _278;
    float _312 = _258;
    float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _316 = _312;
    if (!_154)
    {
        _316 = _118;
    }
    float _318 = _316;
    bool _320 = !_154;
    float _322 = _318;
    if (!_320)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _118 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _322 = _342;
    }
    float _344 = _322;
    float _346 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = fma(_344, _140, _314);
    float _350 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = sqrt(_176);
    float _354 = fma(_344, _138, _346);
    float _356 = -_348;
    float _358 = _268 + _356;
    float _360 = fma(_344, _142, _350);
    float _362 = -_354;
    float _364 = _266 + _362;
    float _366 = _358 * _358;
    float _368 = -_360;
    float _370 = _270 + _368;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _374 = fma(_364, _364, _366);
    float _376 = sqrt(_174);
    float _378 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _372);
    float _380 = fma(_370, _370, _374);
    float _382 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _384 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _386 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _378);
    float _388 = in.m_49.w;
    float _390 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].y, _382);
    float _392 = sqrt(_380);
    float _394 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _396 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].y, _390);
    float _400 = in.m_42.x;
    float _402 = in.m_42.y;
    float _404 = in.m_42.z;
    float _406 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].x, _394);
    float _408 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].z, _384);
    float _410 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].w, _396);
    float _412 = sqrt(_386);
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].x, _406);
    float _416 = _352 * _398;
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].w, _410);
    float _420 = _376 * _414;
    float _422 = _416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _424 = _392 >= 9.9999999747524270787835121154785e-07;
    bool _426 = isnan(_392);
    bool _428 = _424 || _426;
    bool _430 = isnan(9.9999999747524270787835121154785e-07);
    bool _432 = _428 || _430;
    float _434 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].z, _408);
    float _436 = _416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _438 = _416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _440 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[24].x, _422);
    float _442 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[25].x, _436);
    float _444 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[26].x, _438);
    float _446 = _412 * _434;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[24].z, _440);
    float _450 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[25].z, _442);
    float _452 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[26].z, _444);
    float _454 = fma(_268, _388, _402);
    float _456 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[24].w, _448);
    float _458 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[25].w, _450);
    float _460 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[26].w, _452);
    float _462 = fma(_266, _388, _400);
    float _464 = fma(_270, _388, _404);
    float _466 = _418;
    float _468 = _456;
    float _470 = _458;
    if (_432)
    {
        _466 = _456;
    }
    float _472 = _466;
    float _474 = _472;
    if (_432)
    {
        _468 = _460;
    }
    float _476 = _468;
    float _478 = _476;
    if (!_432)
    {
        bool _480 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _482 = !_480;
        if (!_482)
        {
            float _484 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _486 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _488 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _490 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _484);
            float _492 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _486);
            float _494 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _488);
            float _496 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _490);
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _492);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _494);
            float _502 = _352 * _496;
            float _504 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _506 = _376 * _498;
            float _508 = _412 * _500;
            float _510 = _502 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _512 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _504);
            float _514 = _502 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _516 = _502 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _518 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[25].x, _510);
            float _520 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _512);
            float _522 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[24].x, _514);
            float _524 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[26].x, _516);
            float _526 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[25].z, _518);
            float _528 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[24].z, _522);
            float _530 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[26].z, _524);
            float _532 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].w, _526);
            float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].w, _528);
            float _536 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].w, _530);
            float _538 = _532 * _532;
            float _540 = fma(_534, _534, _538);
            float _542 = fma(_536, _536, _540);
            float _544 = rsqrt(_542);
            float _546 = _544 * 9.9999999747524270787835121154785e-07;
            float _548 = _534 * _546;
            float _550 = _532 * _546;
            float _552 = _536 * _546;
            _470 = _550;
            _474 = _548;
            _478 = _552;
            _554 = true;
        }
        else
        {
            float _556 = _140 * _140;
            float _558 = fma(_138, _138, _556);
            float _560 = fma(_142, _142, _558);
            float _562 = sqrt(_560);
            bool _564 = _562 >= 9.9999999747524270787835121154785e-07;
            bool _566 = isnan(_562);
            bool _568 = _564 || _566;
            bool _570 = isnan(9.9999999747524270787835121154785e-07);
            bool _572 = _568 || _570;
            if (!_572)
            {
                float _574 = _402 * _402;
                float _576 = fma(_400, _400, _574);
                float _578 = fma(_404, _404, _576);
                float _580 = sqrt(_578);
                bool _582 = _580 >= 9.9999999747524270787835121154785e-07;
                bool _584 = isnan(_580);
                bool _586 = _582 || _584;
                bool _588 = isnan(9.9999999747524270787835121154785e-07);
                bool _590 = _586 || _588;
                if (!_590)
                {
                    float _592 = _352 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _594 = _376 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _596 = _412 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _598 = _592 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _600 = _592 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _602 = _592 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _604 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[25].x, _598);
                    float _606 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[24].x, _600);
                    float _608 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[26].x, _602);
                    float _610 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _604);
                    float _612 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _606);
                    float _614 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _608);
                    float _616 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _610);
                    float _618 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _612);
                    float _620 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _614);
                    float _622 = _616 * _616;
                    float _624 = fma(_618, _618, _622);
                    float _626 = fma(_620, _620, _624);
                    float _628 = rsqrt(_626);
                    float _630 = _628 * 9.9999999747524270787835121154785e-07;
                    float _632 = _618 * _630;
                    float _634 = _616 * _630;
                    float _636 = _620 * _630;
                    _470 = _634;
                    _474 = _632;
                    _478 = _636;
                    _554 = true;
                }
                else
                {
                    float _638 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _640 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _642 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _644 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _646 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].y, _638);
                    float _648 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].x, _640);
                    float _650 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].z, _642);
                    float _652 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].w, _644);
                    float _654 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].y, _646);
                    float _656 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].x, _648);
                    float _658 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].z, _650);
                    float _660 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].w, _652);
                    float _662 = _352 * _654;
                    float _664 = _376 * _656;
                    float _666 = _412 * _658;
                    float _668 = _662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _670 = _662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _672 = _662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _674 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _668);
                    float _676 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _670);
                    float _678 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _672);
                    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _674);
                    float _682 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _676);
                    float _684 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _678);
                    float _686 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[25].w, _680);
                    float _688 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[24].w, _682);
                    float _690 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[26].w, _684);
                    float _692 = _686 * _686;
                    float _694 = fma(_688, _688, _692);
                    float _696 = fma(_690, _690, _694);
                    float _698 = rsqrt(_696);
                    float _700 = _698 * 9.9999999747524270787835121154785e-07;
                    float _702 = _688 * _700;
                    float _704 = _686 * _700;
                    float _706 = _690 * _700;
                    _470 = _704;
                    _474 = _702;
                    _478 = _706;
                    _554 = true;
                }
            }
            else
            {
                float _708 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _710 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _712 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _714 = _140 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _716 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].y, _708);
                float _718 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].x, _710);
                float _720 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].z, _712);
                float _722 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[14].w, _714);
                float _724 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].y, _716);
                float _726 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].x, _718);
                float _728 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].z, _720);
                float _730 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[16].w, _722);
                float _732 = _352 * _724;
                float _734 = _376 * _726;
                float _736 = _412 * _728;
                float _738 = _732 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _740 = _732 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _742 = _732 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _744 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _738);
                float _746 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[24].x, _740);
                float _748 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _742);
                float _750 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].z, _744);
                float _752 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].z, _746);
                float _754 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].z, _748);
                float _756 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[25].w, _750);
                float _758 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[24].w, _752);
                float _760 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[26].w, _754);
                float _762 = _756 * _756;
                float _764 = fma(_758, _758, _762);
                float _766 = fma(_760, _760, _764);
                float _768 = rsqrt(_766);
                float _770 = _768 * 9.9999999747524270787835121154785e-07;
                float _772 = _758 * _770;
                float _774 = _756 * _770;
                float _776 = _760 * _770;
                _470 = _774;
                _474 = _772;
                _478 = _776;
            }
        }
    }
    _554 = false;
    float _778 = _470;
    float _780 = _474;
    float _782 = _478;
    float _784 = in.m_51.x;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _788 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _796 = _794 != 0;
    int _798 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _800 = _798 != 0;
    float _802 = _788 * _786;
    float _804 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[20].x, _802);
    float _806 = _804 * 6.283185482025146484375;
    float _808 = floor(_804);
    float _810 = _806 * 0.15915493667125701904296875;
    bool _812 = !_792;
    int _814 = _812 ? 0 : 1;
    int _816 = abs(_814);
    float _818 = _810 * 6.283185482025146484375;
    float _820 = cos(_818);
    bool _822 = !_800;
    int _824 = _822 ? 0 : 1;
    bool _826 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _828 = abs(_824);
    float _830 = -_808;
    float _832 = _804 + _830;
    bool _834 = !_796;
    int _836 = _834 ? 0 : 1;
    float _838 = float(_816);
    int _840 = abs(_836);
    float _842 = -_832;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _846 = _832 < 0.5;
    float _848 = float(_846);
    float _850 = fma(_820, 0.5, 0.5);
    float _852 = abs(_844);
    float _854 = _838 * _852;
    float _856 = float(_828);
    float _858 = -_848;
    float _860 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _862 = -_850;
    float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _866 = float(_840);
    float _868 = fma(_856, _864, _854);
    float _870 = abs(_860);
    float _872 = fma(_866, _870, _868);
    bool _874 = !_826;
    float _890;
    if (!_874)
    {
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _878 = _784 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _882 = _880 * _876;
        float _884 = floor(_882);
        float _886 = -_884;
        float _888 = _882 + _886;
        _890 = _888;
        _892 = true;
    }
    else
    {
        float _894 = float(_84);
        float _896 = 1.0 / _894;
        float _898 = _118 * _896;
        _890 = _898;
    }
    _892 = false;
    float _900 = _890;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _904 = _900 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _908 = _900 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _924 = _900 + _922;
    float _926 = 1.0 / _912;
    bool _928 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _930 = isnan(_900);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    bool _940 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _942 = isnan(_900);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = 1.0 / _916;
    bool _954 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _956 = 1.0 / _920;
    float _958 = _908 * _926;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _960;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _964;
    float _968 = _904 * _952;
    bool _970 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _972 = isnan(_900);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _982;
    float _986 = -_980;
    float _988 = _986 + 1.0;
    float _990 = fma(_984, _958, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _992 = _924 * _956;
    float _994 = fma(_962, _958, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _996 = fma(_966, _958, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _998 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1000 = isnan(_900);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _938 * _988;
    float _1012 = -_938;
    float _1014 = _1012 + 1.0;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1028 = -_1008;
    float _1030 = _1028 + 1.0;
    float _1032 = _1008 * _1014;
    float _1034 = fma(_1018, _968, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1036 = fma(_1022, _968, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1038 = fma(_1026, _968, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1040 = _950 * _1030;
    float _1042 = in.m_49.x;
    float _1044 = in.m_49.y;
    float _1046 = in.m_49.z;
    float _1048 = -_950;
    float _1050 = _1048 + 1.0;
    float _1052 = _994 * _1040;
    float _1054 = _996 * _1040;
    float _1056 = _990 * _1040;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1058;
    float _1062 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1052);
    float _1064 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1054);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1070;
    float _1074 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1056);
    float _1076 = fma(_1060, _992, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1078 = fma(_1068, _992, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1080 = fma(_1072, _992, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1082 = fma(_1034, _1032, _1062);
    float _1084 = fma(_1036, _1032, _1064);
    float _1086 = fma(_1038, _1032, _1074);
    float _1088 = fma(_1076, _1010, _1082);
    float _1090 = fma(_1078, _1010, _1084);
    float _1092 = fma(_1080, _1010, _1086);
    float _1094 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1088);
    float _1096 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1090);
    float _1098 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1092);
    float _1100 = _1094 * _1042;
    float _1102 = _1096 * _1044;
    float _1104 = _1098 * _1046;
    bool _1106 = !_954;
    float _1122;
    if (!_1106)
    {
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1110 = _784 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _1114 = _1112 * _1108;
        float _1116 = floor(_1114);
        float _1118 = -_1116;
        float _1120 = _1114 + _1118;
        _1122 = _1120;
        _1124 = true;
    }
    else
    {
        float _1126 = float(_84);
        float _1128 = 1.0 / _1126;
        float _1130 = _118 * _1128;
        _1122 = _1130;
    }
    _1124 = false;
    float _1132 = _1122;
    float _1134 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1136 = precise::max(0.5, (*spvDescriptorSet0.vp_c7)._m0[0].x);
    float _1138 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1140 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1134);
    float _1142 = precise::min(_1136, 0.949999988079071044921875);
    float _1144 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1138);
    float _1146 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1148 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1140);
    float _1150 = _454 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1152 = fma(_1142, -6.644444942474365234375, 6.31222248077392578125);
    float _1154 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1144);
    float _1156 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1146);
    float _1158 = _1148 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1160 = in.m_51.y;
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1164 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1156);
    float _1166 = floor(_1152);
    float _1168 = _352 * _1158;
    float _1170 = _376 * _1162;
    float _1172 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1150);
    float _1174 = _1164 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1180 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1172);
    float _1182 = _412 * _1174;
    float _1184 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1186 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1178);
    float _1190 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1184);
    float _1194 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1186);
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1188);
    float _1198 = _1166 * 0.5;
    float _1200 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1192);
    float _1202 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1194);
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1196);
    float _1206 = -_1198;
    float _1208 = _1206 + 0.5;
    float _1210 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1212 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1202);
    float _1214 = _1204 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1216 = _1208 * _1160;
    float _1218 = _1216 * 2.0;
    float _1220 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1222 = _1210 + _1220;
    float _1224 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1226 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1228 = _1214 + _1226;
    bool _1230 = _1198 <= _784;
    bool _1232 = isnan(_1198);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(_784);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = _1222 * _1218;
    float _1244 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1246 = _1224 + _1244;
    float _1248 = _1228 * _1218;
    float _1250 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1252 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[2].w, _778);
    float _1254 = _1246 * _1218;
    float _1256 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[2].w, _780);
    float _1258 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1260 = _1252 * _1252;
    float _1262 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[2].w, _782);
    float _1264 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1266 = _1224 + _1254;
    float _1268 = fma(_1256, _1256, _1260);
    float _1270 = _1214 + _1248;
    float _1272 = _1210 + _1242;
    float _1274 = fma(_1262, _1262, _1268);
    float _1276 = in.m_53.x;
    float _1278 = in.m_53.y;
    float _1280 = in.m_53.z;
    float _1282 = rsqrt(_1274);
    float _1284 = _1262 * _1282;
    float _1286 = _1256 * _1282;
    float _1288 = _1252 * _1282;
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1292 = _1284 * _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1296 = _1286 * _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1300 = _1288 * _1298;
    float _1302 = _1240 * _1278;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1306 = -_1292;
    float _1308 = fma(_1286, _1304, _1306);
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1312 = -_1296;
    float _1314 = fma(_1288, _1310, _1312);
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1318 = -_1300;
    float _1320 = fma(_1284, _1316, _1318);
    float _1322 = _1240 * _1276;
    float _1324 = _1308 * _1308;
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1302);
    float _1328 = _1240 * _1280;
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1322);
    float _1332 = fma(_1320, _1320, _1324);
    float _1334 = _1250 * _1326;
    float _1336 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1328);
    float _1338 = _1258 * _1330;
    float _1340 = fma(_1314, _1314, _1332);
    float _1342 = _1334 * _1284;
    float _1344 = _1264 * _1336;
    float _1346 = _1334 * _1286;
    float _1348 = rsqrt(_1340);
    float _1350 = _1308 * _1348;
    float _1352 = _1314 * _1348;
    float _1354 = _1320 * _1348;
    float _1356 = _1286 * _1350;
    float _1358 = fma(_1338, _1352, _1342);
    float _1360 = _1288 * _1352;
    float _1362 = fma(_1338, _1354, _1346);
    float _1364 = -_1356;
    float _1366 = fma(_1288, _1354, _1364);
    float _1368 = -_1360;
    float _1370 = fma(_1284, _1350, _1368);
    float _1372 = fma(_1344, _1366, _1358);
    float _1374 = fma(_1344, _1370, _1362);
    float _1376 = _1266 + _1372;
    float _1378 = _1270 + _1374;
    float _1380 = _1284 * _1354;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1384 = _1376 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1378 + _1386;
    float _1390 = -_1380;
    float _1392 = fma(_1286, _1352, _1390);
    float _1394 = _1384 * _1384;
    float _1396 = fma(_1388, _1388, _1394);
    float _1398 = _1334 * _1288;
    float _1400 = sqrt(_1396);
    float _1402 = fma(_1338, _1350, _1398);
    float _1404 = fma(_1344, _1392, _1402);
    float _1406 = _1272 + _1404;
    bool _1408 = _1400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = _1404;
    float _1412 = _1402;
    float _1414 = _1378;
    float _1416 = _1376;
    float _1418 = _1360;
    if (!_1408)
    {
        _1410 = _1378;
    }
    float _1420 = _1410;
    float _1422 = _1420;
    if (!_1408)
    {
        _1412 = _1376;
    }
    float _1424 = _1412;
    float _1426 = _1424;
    if (!_1408)
    {
        _1414 = _1406;
    }
    float _1428 = _1414;
    bool _1430 = !_1408;
    float _1432 = _1428;
    if (!_1430)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1438 = _1400 + _1436;
        float _1440 = rsqrt(_1396);
        float _1442 = _1438 * _1434;
        float _1444 = _1406 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = _1442 * 0.15915493667125701904296875;
        float _1448 = _1446 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1446 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 + (-1.0);
        float _1458 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1462 = fma(_1406, _1450, _1458);
        float _1464 = _1440 * _1460;
        float _1466 = fma(_1388, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1384, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1432 = _1462;
        _1422 = _1466;
        _1426 = _1468;
    }
    float _1470 = _1432;
    float _1472 = _1422;
    float _1474 = _1426;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = _1470 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1482 = _1472 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1486 = _1474 + _1484;
    float _1488 = _1478 * _1478;
    float _1490 = fma(_1482, _1482, _1488);
    float _1492 = fma(_1486, _1486, _1490);
    float _1494 = rsqrt(_1492);
    float _1496 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1498 = _1482 * _1496;
    float _1500 = _1486 * _1496;
    float _1502 = _1498 * _1498;
    float _1504 = _1500 * _1500;
    float _1506 = _1502 + _1504;
    float _1508 = sqrt(_1506);
    bool _1510 = _1508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1514 = _1508 + _1512;
    float _1516 = _1284;
    float _1518 = _1506;
    float _1520 = _1514;
    float _1522 = _1478;
    float _1524 = _1498;
    if (_1510)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1526;
    }
    float _1528 = _1516;
    if (_1510)
    {
        float _1530 = rsqrt(_1506);
        _1518 = _1530;
    }
    float _1532 = _1518;
    float _1534 = _1528;
    float _1536 = _1532;
    if (_1510)
    {
        float _1538 = _1514 * _1528;
        _1520 = _1538;
    }
    float _1540 = _1520;
    if (_1510)
    {
        float _1542 = _1540 * 0.15915493667125701904296875;
        _1416 = _1542;
    }
    float _1544 = _1416;
    float _1546 = _1486;
    if (_1510)
    {
        float _1548 = _1544 * 6.283185482025146484375;
        float _1550 = sin(_1548);
        _1546 = _1550;
    }
    float _1552 = _1546;
    float _1554 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1556 = precise::max(0.0, _1554);
    float _1558 = _1400;
    float _1560 = _1556;
    if (_1510)
    {
        float _1562 = _1544 * 6.283185482025146484375;
        float _1564 = cos(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = -_1496;
    float _1570 = -_1556;
    float _1572 = fma(_1478, _1568, _1570);
    if (_1510)
    {
        float _1574 = _1572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1522 = _1574;
    }
    float _1576 = _1522;
    float _1578 = sqrt(_1492);
    float _1580 = _1552;
    float _1582 = _1576;
    if (_1510)
    {
        float _1584 = fma(_1552, _1576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1580 = _1584;
    }
    float _1586 = _1580;
    float _1588 = _1586;
    if (!_1510)
    {
        _1582 = _1500;
    }
    float _1590 = _1582;
    float _1592 = _1590;
    if (_1510)
    {
        float _1594 = _1566 + (-1.0);
        _1560 = _1594;
    }
    float _1596 = _1560;
    float _1598 = _1596;
    if (_1510)
    {
        float _1600 = _1532 * _1586;
        _1418 = _1600;
    }
    float _1602 = _1418;
    if (!_1510)
    {
        _1588 = _1572;
    }
    float _1604 = _1588;
    float _1606 = _1604;
    if (_1510)
    {
        float _1608 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1534 = _1608;
    }
    float _1610 = _1534;
    if (_1510)
    {
        float _1612 = _1498 * _1602;
        _1524 = _1612;
    }
    float _1614 = _1524;
    if (!_1510)
    {
        _1536 = _1502;
    }
    float _1616 = _1536;
    float _1618 = _1616;
    if (_1510)
    {
        float _1620 = _1500 * _1602;
        _1592 = _1620;
    }
    float _1622 = _1592;
    if (_1510)
    {
        float _1624 = fma(_1572, _1566, _1610);
        _1606 = _1624;
    }
    float _1626 = _1606;
    if (_1510)
    {
        float _1628 = _1614 * _1614;
        _1618 = _1628;
    }
    float _1630 = _1618;
    if (!_1510)
    {
        _1598 = _1504;
    }
    float _1632 = _1598;
    float _1634 = _1632;
    if (_1510)
    {
        float _1636 = _1622 * _1622;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = fma(_1626, _1626, _1630);
    float _1642 = _1640 + _1638;
    float _1644 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1648 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1646);
    float _1650 = precise::clamp(_1648, 0.0, 1.0);
    float _1652 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1654 = rsqrt(_1642);
    float _1656 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1644);
    float _1658 = -_1650;
    float _1660 = _1658 + 1.0;
    float _1662 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1664 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1652);
    float _1666 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1656);
    float _1668 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1664);
    float _1672 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1674 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1662);
    float _1676 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1668);
    float _1678 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1680 = abs(_1660);
    float _1682 = log2(_1680);
    float _1684 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1674);
    float _1686 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1676);
    float _1688 = _1654 * _1614;
    float _1690 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1694 = _1654 * _1626;
    float _1696 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1698 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1700 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1702 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1690);
    float _1704 = _1654 * _1622;
    float _1706 = -_1696;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1706);
    float _1710 = -_1700;
    float _1712 = fma(_1710, _1698, 1.0);
    float _1714 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1716 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1718 = -_1704;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1708);
    float _1722 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1724 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1726 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1716);
    float _1728 = fma(_1720, -0.5, 0.5);
    float _1730 = log2(_1712);
    float _1732 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1734 = fma(_1720, 0.5, 0.5);
    float _1736 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1724);
    float _1738 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1732);
    float _1740 = fma(_1734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = 1.0 / _1726;
    float _1744 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1738);
    float _1746 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1748 = fma(_1734, _1740, -0.212114393711090087890625);
    float _1750 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1744);
    float _1752 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1754 = fma(_1734, _1748, 1.570728778839111328125);
    float _1756 = exp2(_1722);
    float _1758 = _1730 * 0.693147182464599609375;
    float _1760 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1762 = sqrt(_1728);
    float _1764 = _1694 + 1.0;
    float _1766 = _1750 * _1742;
    float _1768 = _1752 * _1742;
    float _1770 = fma(_1766, 0.5, 0.5);
    float _1772 = fma(_1768, -0.5, 0.5);
    float _1774 = -_1694;
    float _1776 = fma(_1756, _1764, _1774);
    float3 _4925 = float3(_1770, _1772, _1760);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4925, float3(0.0), isnan(_4925)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4925, float3(0.0), isnan(_4925)), level(0.0)).x;
    float _1780 = fma(_1776, 0.5, 0.5);
    float _1782 = _1762 * 0.636619746685028076171875;
    float _1784 = -_1754;
    float _1786 = fma(_1782, _1784, 1.0);
    float3 _4946 = float3(_1770, _1772, _1760);
    float4 _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4946, float3(0.0), isnan(_4946)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4946, float3(0.0), isnan(_4946)), level(0.0)).xyzw;
    float _1791 = _1789.x;
    float _1793 = _1789.y;
    float _1795 = _1789.z;
    float _1797 = _1789.w;
    float2 _4963 = float2(_1786, _1780);
    float3 _1801 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4963, float2(0.0), isnan(_4963)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4963, float2(0.0), isnan(_4963)), level(0.0)).xyz;
    float _1803 = _1801.x;
    float _1805 = _1801.y;
    float _1807 = _1801.z;
    float _1809 = in.m_55.x;
    float _1811 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1813 = in.m_55.y;
    float _1815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1823 = _1821 != 0;
    float _1825 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1829 = _1827 != 0;
    float _1831 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1833 = _784 > 0.5;
    bool _1835 = _1833 && _1823;
    float _1837 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1825);
    float _1839 = 1.0 / _1819;
    float _1841 = _1831 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1843 = _1160 > 0.5;
    bool _1845 = _1132 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1847 = isnan(_1132);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1853 = _1849 || _1851;
    float _1855 = float(_1853);
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1857;
    float _1861 = exp2(_1811);
    out.m_45.x = _1841;
    float _1863 = _1770;
    if (_1823)
    {
        _1863 = _1809;
    }
    float _1865 = _1863;
    float _1867 = -_1855;
    float _1869 = _1867 + 1.0;
    float _1871 = -_1813;
    float _1873 = _1871 + 1.0;
    float _1875 = _1865;
    float _1877 = _1813;
    float _1879 = _1873;
    if (_1835)
    {
        float _1881 = -_1865;
        float _1883 = _1881 + 1.0;
        _1875 = _1883;
    }
    float _1885 = _1875;
    float _1887 = _1859 * _1839;
    float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1891 = _1132 + _1889;
    bool _1893 = _1132 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1895 = isnan(_1132);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    float _1905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1829)
    {
        float _1907 = _1843 ? _1873 : _1813;
        _1877 = _1907;
    }
    float _1909 = _1877;
    if (!_1823)
    {
        _1879 = _1809;
    }
    float _1911 = _1879;
    float _1913 = fma(_1887, _1891, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1915 = _1911;
    if (_1823)
    {
        _1915 = _1885;
    }
    float _1917 = _1915;
    float _1919 = _1903 * _1869;
    float _1921 = -_1861;
    float _1923 = _1921 + 1.0;
    float _1925 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1927 = _1913 * _1919;
    float _1929 = -_1903;
    float _1931 = _1929 + 1.0;
    float _1933 = _1925 * _1815;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1935 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1937 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1927);
    float _1939 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1941 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1937);
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1945 = _1939 * _1905;
    float _1947 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1949 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1837);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1957 = -_1935;
    float _1959 = _1957 + 1.0;
    float _1961 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1951);
    float _1963 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1965 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1961 + _1726;
    out.m_59.x = _1933;
    out.m_59.y = _1945;
    float _1969 = _1967 * 0.5;
    out.m_61.x = _1963;
    out.m_61.y = _1965;
    out.m_61.z = _1949;
    out.m_61.w = _1947;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1961;
    out.gl_Position.w = _1726;
    out.m_63.z = _1969;
    out.m_63.w = _1726;
    float _1971 = _1935 * _1778;
    float _1973 = _1797 * _1971;
    float _1975 = _1797 * _1959;
    float _1977 = _1807 * _1971;
    float _1979 = fma(_1803, _1973, _1791);
    float _1981 = fma(_1805, _1973, _1793);
    float _1983 = fma(_1797, _1977, _1795);
    out.m_65.x = _1979;
    out.m_65.y = _1981;
    out.m_65.z = _1983;
    out.m_65.w = _1975;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

