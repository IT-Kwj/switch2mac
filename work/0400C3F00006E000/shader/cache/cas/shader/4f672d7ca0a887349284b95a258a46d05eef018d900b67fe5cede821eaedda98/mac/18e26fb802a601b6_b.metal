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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4), flat]];
    float4 m_37 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _471 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_471, float2(0.0), isnan(_471))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_471, float2(0.0), isnan(_471))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_39.x;
    float _93 = in.m_37.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_41.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_41.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _119 = _77 * _97;
    float _121 = _87 * _87;
    float _123 = _89 * _89;
    float _125 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _127 = _77 * _103;
    float _129 = fma(_121, 2.0, -1.0);
    float _131 = fma(_123, 2.0, -1.0);
    float _133 = _77 * _115;
    float _135 = fma(_117, _129, _119);
    float _137 = _77 * _109;
    float _139 = fma(_125, _131, _127);
    float2 _560 = float2(_137, _133);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_560, float2(0.0), isnan(_560))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_560, float2(0.0), isnan(_560))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float2 _576 = float2(_135, _139);
    float4 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_576, float2(0.0), isnan(_576))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_576, float2(0.0), isnan(_576))).xyzw;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = _152.w;
    float _162 = in.m_43.w;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_45.w;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_47.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_49.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = _77 * _166;
    float _188 = _77 * _178;
    float _190 = in.m_47.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_47.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_47.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_45.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_45.y;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_45.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = _160 * _150;
    float _228 = _77 * _172;
    float _230 = -_186;
    float _232 = fma(_226, _228, _230);
    float _234 = _188 * _232;
    float _236 = _77 * _184;
    float _238 = 0.0 + _234;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _240 * _236;
    bool _246 = _242 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _248 = isnan(_242);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _254 = _250 || _252;
    float _256 = in.m_43.y;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_43.z;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_43.x;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    if (!_254)
    {
        discard_fragment();
    }
    float _274 = _144 * _144;
    float _276 = _146 * _146;
    float _278 = _77 * _206;
    float _280 = _154 * _274;
    float _282 = _156 * _276;
    float _284 = _148 * _148;
    float _286 = _158 * _284;
    float _288 = _77 * _260;
    float _290 = _77 * _194;
    float _292 = _77 * _266;
    float _294 = _77 * _200;
    float _296 = _77 * _272;
    float _298 = -_290;
    float _300 = _288 + _298;
    float _302 = -_294;
    float _304 = _292 + _302;
    float _306 = -_278;
    float _308 = _296 + _306;
    float _310 = fma(_282, _300, _290);
    float _312 = _77 * _224;
    float _314 = fma(_286, _304, _294);
    float _316 = fma(_280, _308, _278);
    float _318 = _77 * _212;
    float _320 = _77 * _218;
    float _322 = _314 * _312;
    float _324 = _316 * _318;
    float _326 = _310 * _320;
    if (!_254)
    {
        out.m_52.x = _324;
        out.m_52.y = _326;
        out.m_52.z = _322;
        out.m_52.w = _234;
        return out;
    }
    float _328 = _326 * 0.715200006961822509765625;
    float _330 = in.m_54.w;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_54.z;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_54.x;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = fma(_324, 0.2125999927520751953125, _328);
    float _350 = in.m_54.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = fma(_322, 0.072200000286102294921875, _348);
    bool _358 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _360 = 1.0 / _356;
    float _362 = _360 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _77 * _334;
    float _368 = fma(_364, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _370 = _77 * _340;
    float _372 = _368 * _366;
    float _374 = 0.0 + _242;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = _77 * _346;
    float _380 = _77 * _354;
    float _382 = fma(_322, _372, _370);
    float _384 = fma(_324, _372, _378);
    float _386 = fma(_326, _372, _380);
    float _388 = _370;
    if (!_358)
    {
        _388 = _376;
    }
    float _390 = _388;
    bool _392 = !_358;
    float _394 = _390;
    if (!_392)
    {
        float _396 = in.m_56.w;
        float _398 = gl_FragCoord.w;
        float _400 = _396 * _398;
        float _402 = in.m_56.z;
        float _404 = gl_FragCoord.w;
        float _406 = _402 * _404;
        float _408 = _77 * _400;
        float _410 = _77 * _406;
        float _412 = 1.0 / _408;
        float _414 = _410 * _412;
        float _416 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _418 = fma(_414, (*spvDescriptorSet0.fp_c8)._m0[30].w, _416);
        float _420 = 1.0 / _418;
        float _422 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _424 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _426 = fma(_420, _422, _424);
        float _428 = _426 * 8.0;
        float _430 = precise::clamp(_428, 0.0, 1.0);
        float _432 = _376 * _430;
        _394 = _432;
    }
    float _434 = _394;
    float _436 = 0.0 + _434;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    out.m_52.x = _384;
    out.m_52.y = _386;
    out.m_52.z = _382;
    out.m_52.w = _438;
    return out;
}

