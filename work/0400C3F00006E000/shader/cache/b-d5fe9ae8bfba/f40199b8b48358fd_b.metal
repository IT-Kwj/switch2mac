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
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_46 [[user(locn7)]];
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
    float2 _386 = float2(_71, _73);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_386, float2(0.0), isnan(_386))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_386, float2(0.0), isnan(_386))).xyzw;
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
    float _112 = _69 * _96;
    float _114 = in.m_39.y;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_39.x;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_35.z;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_39.z;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_37.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_37.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_37.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = _69 * _118;
    float _158 = _69 * _124;
    float _160 = _69 * _130;
    float _162 = -_110;
    float _164 = fma(_84, _112, _162);
    float _166 = _69 * _102;
    float _168 = _164 * 4.0;
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = _166 * _170;
    float _174 = _69 * _108;
    float _176 = 0.0 + _172;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _178 * _174;
    bool _184 = _180 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _186 = isnan(_180);
    bool _188 = _184 || _186;
    bool _190 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _192 = _188 || _190;
    float _194 = in.m_35.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_35.y;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    if (!_192)
    {
        discard_fragment();
    }
    float _206 = _69 * _198;
    float _208 = _69 * _204;
    float _210 = _69 * _136;
    float _212 = -_158;
    float _214 = _206 + _212;
    float _216 = -_156;
    float _218 = _208 + _216;
    float _220 = -_210;
    float _222 = _160 + _220;
    float _224 = fma(_78, _214, _158);
    float _226 = fma(_80, _218, _156);
    float _228 = fma(_82, _222, _210);
    float _230 = _69 * _142;
    float _232 = _69 * _148;
    float _234 = _69 * _154;
    float _236 = _224 * _230;
    float _238 = _226 * _232;
    float _240 = _228 * _234;
    if (!_192)
    {
        out.m_44.x = _236;
        out.m_44.y = _238;
        out.m_44.z = _240;
        out.m_44.w = _172;
        return out;
    }
    float _242 = _238 * 0.715200006961822509765625;
    float _244 = in.m_46.w;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_46.z;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_46.x;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = fma(_236, 0.2125999927520751953125, _242);
    float _264 = in.m_46.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = fma(_240, 0.072200000286102294921875, _262);
    bool _272 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _274 = 1.0 / _270;
    float _276 = _274 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _69 * _248;
    float _282 = fma(_278, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _284 = _69 * _254;
    float _286 = _282 * _280;
    float _288 = 0.0 + _180;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = _69 * _260;
    float _294 = _69 * _268;
    float _296 = fma(_240, _286, _284);
    float _298 = fma(_236, _286, _292);
    float _300 = fma(_238, _286, _294);
    float _302 = _284;
    if (!_272)
    {
        _302 = _290;
    }
    float _304 = _302;
    bool _306 = !_272;
    float _308 = _304;
    if (!_306)
    {
        float _310 = in.m_48.w;
        float _312 = gl_FragCoord.w;
        float _314 = _310 * _312;
        float _316 = in.m_48.z;
        float _318 = gl_FragCoord.w;
        float _320 = _316 * _318;
        float _322 = _69 * _314;
        float _324 = _69 * _320;
        float _326 = 1.0 / _322;
        float _328 = _324 * _326;
        float _330 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _332 = fma(_328, (*spvDescriptorSet0.fp_c8)._m0[30].w, _330);
        float _334 = 1.0 / _332;
        float _336 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _338 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _340 = fma(_334, _336, _338);
        float _342 = _340 * 8.0;
        float _344 = precise::clamp(_342, 0.0, 1.0);
        float _346 = _290 * _344;
        _308 = _346;
    }
    float _348 = _308;
    float _350 = 0.0 + _348;
    float _352 = precise::clamp(_350, 0.0, 1.0);
    out.m_44.x = _298;
    out.m_44.y = _300;
    out.m_44.z = _296;
    out.m_44.w = _352;
    return out;
}

