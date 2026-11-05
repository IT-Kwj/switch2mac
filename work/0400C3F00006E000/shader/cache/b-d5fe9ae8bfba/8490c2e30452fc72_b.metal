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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_46 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _382 = float2(_71, _73);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_382, float2(0.0), isnan(_382))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_382, float2(0.0), isnan(_382))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_35.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_37.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_39.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_41.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = _69 * _90;
    float _112 = in.m_39.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_39.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_37.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_39.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_35.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_35.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_35.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = _69 * _116;
    float _156 = _69 * _122;
    float _158 = _69 * _128;
    float _160 = _84 * _110;
    float _162 = _69 * _96;
    float _164 = _69 * _102;
    float _166 = _162 * _160;
    float _168 = _164 * _166;
    float _170 = _69 * _108;
    float _172 = 0.0 + _168;
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = _174 * _170;
    bool _180 = _176 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _182 = isnan(_176);
    bool _184 = _180 || _182;
    bool _186 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _188 = _184 || _186;
    float _190 = in.m_37.x;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_37.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    if (!_188)
    {
        discard_fragment();
    }
    float _202 = _69 * _194;
    float _204 = _69 * _200;
    float _206 = _69 * _134;
    float _208 = -_156;
    float _210 = _202 + _208;
    float _212 = -_154;
    float _214 = _204 + _212;
    float _216 = -_206;
    float _218 = _158 + _216;
    float _220 = fma(_78, _210, _156);
    float _222 = fma(_80, _214, _154);
    float _224 = fma(_82, _218, _206);
    float _226 = _69 * _140;
    float _228 = _69 * _146;
    float _230 = _69 * _152;
    float _232 = _220 * _226;
    float _234 = _222 * _228;
    float _236 = _224 * _230;
    if (!_188)
    {
        out.m_44.x = _232;
        out.m_44.y = _234;
        out.m_44.z = _236;
        out.m_44.w = _168;
        return out;
    }
    float _238 = _234 * 0.715200006961822509765625;
    float _240 = in.m_46.w;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_46.z;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_46.x;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = fma(_232, 0.2125999927520751953125, _238);
    float _260 = in.m_46.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = fma(_236, 0.072200000286102294921875, _258);
    bool _268 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _270 = 1.0 / _266;
    float _272 = _270 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _69 * _244;
    float _278 = fma(_274, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _280 = _69 * _250;
    float _282 = _278 * _276;
    float _284 = 0.0 + _176;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = _69 * _256;
    float _290 = _69 * _264;
    float _292 = fma(_236, _282, _280);
    float _294 = fma(_232, _282, _288);
    float _296 = fma(_234, _282, _290);
    float _298 = _280;
    if (!_268)
    {
        _298 = _286;
    }
    float _300 = _298;
    bool _302 = !_268;
    float _304 = _300;
    if (!_302)
    {
        float _306 = in.m_48.w;
        float _308 = gl_FragCoord.w;
        float _310 = _306 * _308;
        float _312 = in.m_48.z;
        float _314 = gl_FragCoord.w;
        float _316 = _312 * _314;
        float _318 = _69 * _310;
        float _320 = _69 * _316;
        float _322 = 1.0 / _318;
        float _324 = _320 * _322;
        float _326 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _328 = fma(_324, (*spvDescriptorSet0.fp_c8)._m0[30].w, _326);
        float _330 = 1.0 / _328;
        float _332 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _334 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _336 = fma(_330, _332, _334);
        float _338 = _336 * 8.0;
        float _340 = precise::clamp(_338, 0.0, 1.0);
        float _342 = _286 * _340;
        _304 = _342;
    }
    float _344 = _304;
    float _346 = 0.0 + _344;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    out.m_44.x = _294;
    out.m_44.y = _296;
    out.m_44.z = _292;
    out.m_44.w = _348;
    return out;
}

