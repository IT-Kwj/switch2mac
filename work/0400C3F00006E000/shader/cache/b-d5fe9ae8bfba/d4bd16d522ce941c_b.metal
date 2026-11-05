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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texturecube<float> fp_t_tcb_1E [[id(6)]];
    sampler fp_t_tcb_1ESmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_1ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_38.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_38.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _600 = float2(_88, _90);
    float4 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_600, float2(0.0), isnan(_600))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_600, float2(0.0), isnan(_600))).xyzw;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = _93.w;
    float _103 = in.m_40.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_42.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_44.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _86 * _107;
    float _123 = _86 * _113;
    float _125 = _86 * _119;
    float _127 = in.m_42.z;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_42.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_46.y;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_46.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _86 * _143;
    float _153 = _101 * _121;
    float _155 = _123 * _153;
    float _157 = 0.0 + _155;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = _159 * _125;
    bool _164 = _161 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _166 = isnan(_161);
    bool _168 = _164 || _166;
    bool _170 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _172 = _168 || _170;
    float _174 = in.m_42.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_46.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    if (!_172)
    {
        discard_fragment();
    }
    float _186 = _95 * _95;
    float _188 = _97 * _97;
    float _190 = _86 * _178;
    float _192 = _86 * _137;
    float _194 = _86 * _184;
    float _196 = _86 * _131;
    float _198 = _86 * _149;
    float _200 = -_151;
    float _202 = _192 + _200;
    float _204 = -_194;
    float _206 = _190 + _204;
    float _208 = _99 * _99;
    float _210 = -_198;
    float _212 = _196 + _210;
    float _214 = fma(_188, _202, _151);
    float _216 = fma(_186, _206, _194);
    float _218 = fma(_208, _212, _198);
    if (!_172)
    {
        out.m_49.x = _216;
        out.m_49.y = _214;
        out.m_49.z = _218;
        out.m_49.w = _155;
        return out;
    }
    float _220 = in.m_51.w;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = _86 * _224;
    bool _228 = _226 != 1.0;
    bool _230 = isnan(_226);
    bool _232 = _228 || _230;
    bool _234 = isnan(1.0);
    bool _236 = _232 || _234;
    bool _238 = !_236;
    if (!_238)
    {
        float _240 = gl_FragCoord.x;
        float _242 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _244 = _240 / _242;
        float _246 = gl_FragCoord.y;
        float _248 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _250 = _246 / _248;
        float _252 = _226 * 256.0;
        float _254 = trunc(_252);
        int _257 = int(_254);
        uint _260 = uint(int(uint(_257) >> uint(7)));
        int _262 = int(_260) + _257;
        float _264 = trunc(_244);
        int _266 = int(_264);
        float _268 = trunc(_250);
        int _270 = int(_268);
        int _272 = _266 + 2;
        int _274 = _272 >> 1;
        uint _276 = uint(int(uint(_270) >> uint(1)));
        int _278 = _274 ^ int(_276);
        int _280 = _278 << 16;
        int _282 = _280 ^ _274;
        int _284 = 983055 & _282;
        int _286 = _284 << 6;
        int _288 = _286 + _284;
        int _290 = _288 & 13369548;
        uint _292 = uint(int(uint(_290) >> uint(3)));
        int _294 = _290 | int(_292);
        int _296 = _294 & 5570560;
        int _298 = _294 & 85;
        uint _300 = uint(int(uint(_296) >> uint(15)));
        int _302 = int(_300) + _298;
        bool _304 = uint(_262) > uint(_302);
        if (!_304)
        {
            discard_fragment();
        }
        if (!_304)
        {
            out.m_49.x = _216;
            out.m_49.y = _214;
            out.m_49.z = _218;
            out.m_49.w = _161;
            return out;
        }
    }
    float _306 = in.m_53.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _314 = in.m_53.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_53.z;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_51.x;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = _86 * _310;
    bool _334 = as_type<int>(_312) != 0;
    float _336 = _86 * _318;
    bool _338 = !_334;
    float _340 = -_332;
    float _342 = _338 ? _340 : _332;
    float _344 = _86 * _324;
    bool _346 = !_334;
    float _348 = -_336;
    float _350 = _346 ? _348 : _336;
    float _352 = _342 * _342;
    bool _354 = !_334;
    float _356 = -_344;
    float _358 = _354 ? _356 : _344;
    float _360 = fma(_350, _350, _352);
    float _362 = fma(_358, _358, _360);
    float _364 = rsqrt(_362);
    float _366 = _350 * _364;
    float _368 = _342 * _364;
    float _370 = _358 * _364;
    float _372 = _86 * _330;
    float _374 = abs(_366);
    float _376 = abs(_368);
    float _378 = precise::max(_374, _376);
    float _380 = abs(_370);
    float _382 = precise::max(_380, _378);
    float _384 = 1.0 / _382;
    float _386 = _366 * _384;
    float _388 = -_384;
    float _390 = _370 * _388;
    float _392 = precise::min(_372, 1.0);
    float _394 = _368 * _384;
    float3 _1051 = float3(_386, _394, _390);
    float3 _398 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1051, float3(0.0), isnan(_1051)), level(_392)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1051, float3(0.0), isnan(_1051)), level(_392)).xyz;
    float _400 = _398.x;
    float _402 = _398.y;
    float _404 = _398.z;
    float _406 = in.m_59.y;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = in.m_59.z;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = in.m_59.x;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = in.m_61.z;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_61.x;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_61.y;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = in.m_63.x;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = in.m_63.w;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = in.m_63.y;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_63.z;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = _86 * _410;
    float _468 = _86 * _416;
    float _470 = _86 * _422;
    bool _472 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _474 = _86 * _452;
    float _476 = fma(_404, 0.20999999344348907470703125, _468);
    float _478 = fma(_400, 0.20999999344348907470703125, _470);
    float _480 = _86 * _428;
    float _482 = fma(_402, 0.20999999344348907470703125, _466);
    float _484 = _86 * _434;
    float _486 = _86 * _440;
    float _488 = _476 + _480;
    float _490 = _478 + _484;
    float _492 = _482 + _486;
    float _494 = _218 * _488;
    float _496 = 0.0 + _161;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = _216 * _490;
    float _502 = _86 * _446;
    float _504 = _214 * _492;
    float _506 = _86 * _458;
    float _508 = _86 * _464;
    float _510 = fma(_500, _474, _502);
    float _512 = _502;
    if (!_472)
    {
        _512 = _498;
    }
    float _514 = _512;
    float _516 = fma(_504, _474, _506);
    float _518 = fma(_494, _474, _508);
    bool _520 = !_472;
    float _522 = _514;
    if (!_520)
    {
        float _524 = in.m_65.w;
        float _526 = gl_FragCoord.w;
        float _528 = _524 * _526;
        float _530 = in.m_65.z;
        float _532 = gl_FragCoord.w;
        float _534 = _530 * _532;
        float _536 = _86 * _528;
        float _538 = _86 * _534;
        float _540 = 1.0 / _536;
        float _542 = _538 * _540;
        float _544 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _546 = fma(_542, (*spvDescriptorSet0.fp_c8)._m0[30].w, _544);
        float _548 = 1.0 / _546;
        float _550 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _552 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _554 = fma(_548, _550, _552);
        float _556 = _554 * 8.0;
        float _558 = precise::clamp(_556, 0.0, 1.0);
        float _560 = _498 * _558;
        _522 = _560;
    }
    float _562 = _522;
    float _564 = 0.0 + _562;
    float _566 = precise::clamp(_564, 0.0, 1.0);
    out.m_49.x = _510;
    out.m_49.y = _516;
    out.m_49.z = _518;
    out.m_49.w = _566;
    return out;
}

