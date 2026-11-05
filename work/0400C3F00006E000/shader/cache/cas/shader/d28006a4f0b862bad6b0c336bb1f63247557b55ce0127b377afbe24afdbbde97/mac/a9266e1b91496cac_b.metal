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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _491 = float2(_75, _77);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).xy;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = in.m_39.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_37.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_37.z;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _73 * _91;
    float _119 = _73 * _97;
    float _121 = _73 * _103;
    float _123 = 1.0 / _117;
    float _125 = _73 * _109;
    float _127 = _73 * _115;
    float _129 = _119 * _123;
    float _131 = _121 * _123;
    float2 _565 = float2(_129, _131);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_565, float2(0.0), isnan(_565))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_565, float2(0.0), isnan(_565))).x;
    float _135 = fma(_83, (*spvDescriptorSet0.fp_c9)._m0[194].w, _127);
    float _137 = fma(_85, (*spvDescriptorSet0.fp_c9)._m0[194].w, _125);
    float2 _586 = float2(_135, _137);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_586, float2(0.0), isnan(_586))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_586, float2(0.0), isnan(_586))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float _150 = in.m_41.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_39.z;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_43.w;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_45.w;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _73 * _154;
    float _176 = _73 * _160;
    float _178 = abs(_174);
    float _180 = log2(_178);
    float _182 = -_174;
    float _184 = _182 + 1.0;
    float _186 = _176 * _123;
    float _188 = precise::max(_184, 0.5);
    float _190 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _192 = fma(_186, (*spvDescriptorSet0.fp_c8)._m0[30].w, _190);
    float _194 = precise::min(_188, 1.0);
    float _196 = precise::max(0.0, _174);
    float _198 = 1.0 / _192;
    float _200 = fma(_194, 2.0, -1.0);
    float _202 = _180 * 8.0;
    float _204 = in.m_47.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _212 = fma(_133, (*spvDescriptorSet0.fp_c8)._m0[30].w, _210);
    float _214 = precise::min(_196, 0.75);
    float _216 = exp2(_202);
    float _218 = _214 * 1.33333337306976318359375;
    float _220 = _218 * _218;
    float _222 = 1.0 / _212;
    float _224 = _73 * _166;
    float _226 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _228 = _198 * _226;
    float _230 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _232 = in.m_45.z;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_45.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_45.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = fma(_148, _220, _216);
    float _252 = -_200;
    float _254 = fma(_252, (*spvDescriptorSet0.fp_c9)._m0[194].z, _250);
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _260 = -_228;
    float _262 = fma(_222, _258, _260);
    float _264 = _73 * _208;
    float _266 = _224 * _256;
    float _268 = _73 * _172;
    float _270 = _262 * _230;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _268 * _266;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _276 * _272;
    float _280 = _278 * _264;
    bool _284 = _280 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _286 = isnan(_280);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _292 = _288 || _290;
    float _294 = _148 * _148;
    float _296 = in.m_43.y;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_43.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_43.z;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    if (!_292)
    {
        discard_fragment();
    }
    float _314 = precise::max(_294, 0.4000000059604644775390625);
    float _316 = _142 * _142;
    float _318 = _146 * _146;
    float _320 = precise::min(_314, 0.5);
    float _322 = fma(_320, 10.00000095367431640625, -4.000000476837158203125);
    float _324 = _144 * _144;
    float _326 = fma(_316, _174, _322);
    float _328 = fma(_324, _174, _322);
    float _330 = fma(_318, _174, _322);
    float _332 = _73 * _236;
    float _334 = _326 + _216;
    float _336 = _328 + _216;
    float _338 = _330 + _216;
    float _340 = _73 * _242;
    float _342 = _73 * _248;
    float _344 = -_336;
    float _346 = _344 + 1.0;
    float _348 = -_338;
    float _350 = _348 + 1.0;
    float _352 = -_334;
    float _354 = _352 + 1.0;
    float _356 = _73 * _300;
    float _358 = _332 * _350;
    float _360 = _340 * _346;
    float _362 = _342 * _354;
    float _364 = _73 * _306;
    float _366 = _73 * _312;
    float _368 = fma(_336, _356, _360);
    float _370 = fma(_334, _364, _362);
    float _372 = fma(_338, _366, _358);
    if (!_292)
    {
        out.m_50.x = _370;
        out.m_50.y = _368;
        out.m_50.z = _372;
        out.m_50.w = _276;
        return out;
    }
    float _374 = _368 * 0.715200006961822509765625;
    float _376 = in.m_52.w;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_52.x;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_52.y;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = fma(_370, 0.2125999927520751953125, _374);
    float _396 = in.m_52.z;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = fma(_372, 0.072200000286102294921875, _394);
    bool _404 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _406 = 1.0 / _402;
    float _408 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_404)
    {
        float _410 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _412 = _228 + _410;
        _408 = _412;
    }
    float _414 = _408;
    float _416 = _406 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = fma(_418, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _422 = _73 * _380;
    float _424 = _73 * _392;
    float _426 = _420 * _422;
    float _428 = 0.0 + _280;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = _422;
    float _434 = _430;
    if (_404)
    {
        float _436 = _414 * 8.0;
        float _438 = precise::clamp(_436, 0.0, 1.0);
        _432 = _438;
    }
    float _440 = _432;
    float _442 = _73 * _386;
    float _444 = _73 * _400;
    float _446 = fma(_368, _426, _424);
    if (_404)
    {
        float _448 = _430 * _440;
        _434 = _448;
    }
    float _450 = _434;
    float _452 = fma(_370, _426, _442);
    float _454 = fma(_372, _426, _444);
    float _456 = 0.0 + _450;
    float _458 = precise::clamp(_456, 0.0, 1.0);
    out.m_50.x = _452;
    out.m_50.y = _446;
    out.m_50.z = _454;
    out.m_50.w = _458;
    return out;
}

