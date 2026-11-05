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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.z;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _57;
    float _85 = _83 * _63;
    float _87 = _83 * _69;
    float _89 = _83 * _75;
    float _91 = _83 * _81;
    float2 _427 = float2(_85, _87);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _446 = float2(_89, _91);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_446, float2(0.0), isnan(_446))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_446, float2(0.0), isnan(_446))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float _114 = in.m_37.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_39.w;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_41.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_43.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _83 * _118;
    float _140 = _83 * _130;
    float _142 = in.m_41.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_41.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_39.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_39.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_39.z;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _102 * _112;
    float _174 = _83 * _124;
    float _176 = -_138;
    float _178 = fma(_172, _174, _176);
    float _180 = _140 * _178;
    float _182 = _83 * _136;
    float _184 = 0.0 + _180;
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = _186 * _182;
    bool _192 = _188 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _194 = isnan(_188);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _200 = _196 || _198;
    float _202 = in.m_37.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_37.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_41.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_37.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    if (!_200)
    {
        discard_fragment();
    }
    float _226 = _96 * _106;
    float _228 = _98 * _108;
    float _230 = _83 * _146;
    float _232 = _100 * _110;
    float _234 = _83 * _206;
    float _236 = _83 * _212;
    float _238 = _83 * _218;
    float _240 = _83 * _224;
    float _242 = _83 * _152;
    float _244 = fma(_228, _236, _230);
    float _246 = fma(_226, _234, _238);
    float _248 = _83 * _158;
    float _250 = fma(_232, _240, _242);
    float _252 = _83 * _164;
    float _254 = _83 * _170;
    float _256 = _246 * _248;
    float _258 = _244 * _252;
    float _260 = _250 * _254;
    if (!_200)
    {
        out.m_46.x = _256;
        out.m_46.y = _258;
        out.m_46.z = _260;
        out.m_46.w = _180;
        return out;
    }
    float _262 = _258 * 0.715200006961822509765625;
    float _264 = in.m_48.w;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_48.z;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_48.x;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = fma(_256, 0.2125999927520751953125, _262);
    float _284 = in.m_48.y;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = fma(_260, 0.072200000286102294921875, _282);
    bool _292 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _294 = 1.0 / _290;
    float _296 = _294 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = _83 * _268;
    float _302 = fma(_298, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _304 = _83 * _274;
    float _306 = _302 * _300;
    float _308 = 0.0 + _188;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = _83 * _280;
    float _314 = _83 * _288;
    float _316 = fma(_260, _306, _304);
    float _318 = fma(_256, _306, _312);
    float _320 = fma(_258, _306, _314);
    float _322 = _304;
    if (!_292)
    {
        _322 = _310;
    }
    float _324 = _322;
    bool _326 = !_292;
    float _328 = _324;
    if (!_326)
    {
        float _330 = in.m_50.w;
        float _332 = gl_FragCoord.w;
        float _334 = _330 * _332;
        float _336 = in.m_50.z;
        float _338 = gl_FragCoord.w;
        float _340 = _336 * _338;
        float _342 = _83 * _334;
        float _344 = _83 * _340;
        float _346 = 1.0 / _342;
        float _348 = _344 * _346;
        float _350 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _352 = fma(_348, (*spvDescriptorSet0.fp_c8)._m0[30].w, _350);
        float _354 = 1.0 / _352;
        float _356 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _358 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _360 = fma(_354, _356, _358);
        float _362 = _360 * 8.0;
        float _364 = precise::clamp(_362, 0.0, 1.0);
        float _366 = _310 * _364;
        _328 = _366;
    }
    float _368 = _328;
    float _370 = 0.0 + _368;
    float _372 = precise::clamp(_370, 0.0, 1.0);
    out.m_46.x = _318;
    out.m_46.y = _320;
    out.m_46.z = _316;
    out.m_46.w = _372;
    return out;
}

