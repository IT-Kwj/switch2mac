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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _59;
    float _99 = _97 * _65;
    float _101 = _97 * _71;
    float _103 = _97 * _77;
    float _105 = _97 * _83;
    float _107 = _97 * _89;
    float _109 = _97 * _95;
    float2 _473 = float2(_99, _103);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_473, float2(0.0), isnan(_473))).w;
    float2 _484 = float2(_101, _105);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float2 _500 = float2(_107, _109);
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_500, float2(0.0), isnan(_500))).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float _134 = in.m_41.w;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_43.w;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_45.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_47.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_41.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_45.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_45.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_45.y;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_43.z;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = _122 + _111;
    float _190 = _97 * _144;
    float _192 = -_132;
    float _194 = _192 + 1.0;
    float _196 = _97 * _150;
    float _198 = _188 * _194;
    float _200 = _97 * _138;
    float _202 = -_200;
    float _204 = fma(_198, _190, _202);
    float _206 = _204 * 4.0;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = _196 * _208;
    float _212 = _97 * _156;
    float _214 = 0.0 + _210;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = _216 * _212;
    bool _222 = _218 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _224 = isnan(_218);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _230 = _226 || _228;
    float _232 = in.m_41.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_41.x;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_43.y;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    if (!_230)
    {
        discard_fragment();
    }
    float _250 = in.m_43.x;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = _118 * _118;
    float _258 = -_128;
    float _260 = _258 + 1.0;
    float _262 = _116 * _116;
    float _264 = -_126;
    float _266 = _264 + 1.0;
    float _268 = _120 * _120;
    float _270 = _256 * _260;
    float _272 = -_130;
    float _274 = _272 + 1.0;
    float _276 = _97 * _162;
    float _278 = _262 * _266;
    float _280 = _97 * _174;
    float _282 = _268 * _274;
    float _284 = _97 * _236;
    float _286 = _97 * _168;
    float _288 = _97 * _242;
    float _290 = _97 * _180;
    float _292 = -_286;
    float _294 = _276 + _292;
    float _296 = -_280;
    float _298 = _288 + _296;
    float _300 = -_290;
    float _302 = _284 + _300;
    float _304 = fma(_282, _294, _286);
    float _306 = _97 * _248;
    float _308 = fma(_278, _298, _280);
    float _310 = fma(_270, _302, _290);
    float _312 = _97 * _186;
    float _314 = _310 * _306;
    float _316 = _97 * _254;
    float _318 = _304 * _312;
    float _320 = _308 * _316;
    if (!_230)
    {
        out.m_50.x = _320;
        out.m_50.y = _314;
        out.m_50.z = _318;
        out.m_50.w = _210;
        return out;
    }
    float _322 = _314 * 0.715200006961822509765625;
    float _324 = 0.0 + _218;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = fma(_320, 0.2125999927520751953125, _322);
    bool _330 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _332 = fma(_318, 0.072200000286102294921875, _328);
    float _334 = 1.0 / _332;
    float _336 = _334 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = fma(_338, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _342 = _320 * _340;
    float _344 = _314 * _340;
    float _346 = _318 * _340;
    float _348 = _340;
    if (!_330)
    {
        _348 = _326;
    }
    float _350 = _348;
    bool _352 = !_330;
    float _354 = _350;
    if (!_352)
    {
        float _356 = in.m_52.w;
        float _358 = gl_FragCoord.w;
        float _360 = _356 * _358;
        float _362 = in.m_52.z;
        float _364 = gl_FragCoord.w;
        float _366 = _362 * _364;
        float _368 = _97 * _360;
        float _370 = _97 * _366;
        float _372 = 1.0 / _368;
        float _374 = _370 * _372;
        float _376 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _378 = fma(_374, (*spvDescriptorSet0.fp_c8)._m0[30].w, _376);
        float _380 = 1.0 / _378;
        float _382 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _384 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _386 = fma(_380, _382, _384);
        float _388 = _386 * 8.0;
        float _390 = precise::clamp(_388, 0.0, 1.0);
        float _392 = _326 * _390;
        _354 = _392;
    }
    float _394 = _354;
    float _396 = 0.0 + _394;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    out.m_50.x = _342;
    out.m_50.y = _344;
    out.m_50.z = _346;
    out.m_50.w = _398;
    return out;
}

