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
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_44 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _348 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_348, float2(0.0), isnan(_348))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_348, float2(0.0), isnan(_348))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_35.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_37.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_39.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _67 * _88;
    float _104 = _67 * _94;
    float _106 = in.m_35.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_37.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_35.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_37.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _67 * _116;
    float _132 = _67 * _122;
    float _134 = -_102;
    float _136 = _82 + _134;
    float _138 = _104 * _136;
    float _140 = _67 * _100;
    float _142 = 0.0 + _138;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _144 * _140;
    bool _150 = _146 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _152 = isnan(_146);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _158 = _154 || _156;
    float _160 = in.m_35.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_37.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    if (!_158)
    {
        discard_fragment();
    }
    float _172 = _76 * _76;
    float _174 = _78 * _78;
    float _176 = _67 * _164;
    float _178 = _67 * _170;
    float _180 = _67 * _110;
    float _182 = _67 * _128;
    float _184 = -_178;
    float _186 = _176 + _184;
    float _188 = -_130;
    float _190 = _180 + _188;
    float _192 = -_182;
    float _194 = _132 + _192;
    float _196 = _80 * _80;
    float _198 = fma(_172, _186, _178);
    float _200 = fma(_174, _190, _130);
    float _202 = fma(_196, _194, _182);
    if (!_158)
    {
        out.m_42.x = _198;
        out.m_42.y = _200;
        out.m_42.z = _202;
        out.m_42.w = _138;
        return out;
    }
    float _204 = _200 * 0.715200006961822509765625;
    float _206 = in.m_44.w;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_44.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_44.x;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = fma(_198, 0.2125999927520751953125, _204);
    float _226 = in.m_44.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = fma(_202, 0.072200000286102294921875, _224);
    bool _234 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _236 = 1.0 / _232;
    float _238 = _236 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _67 * _210;
    float _244 = fma(_240, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _246 = _67 * _216;
    float _248 = _244 * _242;
    float _250 = 0.0 + _146;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _67 * _222;
    float _256 = _67 * _230;
    float _258 = fma(_202, _248, _246);
    float _260 = fma(_198, _248, _254);
    float _262 = fma(_200, _248, _256);
    float _264 = _246;
    if (!_234)
    {
        _264 = _252;
    }
    float _266 = _264;
    bool _268 = !_234;
    float _270 = _266;
    if (!_268)
    {
        float _272 = in.m_46.w;
        float _274 = gl_FragCoord.w;
        float _276 = _272 * _274;
        float _278 = in.m_46.z;
        float _280 = gl_FragCoord.w;
        float _282 = _278 * _280;
        float _284 = _67 * _276;
        float _286 = _67 * _282;
        float _288 = 1.0 / _284;
        float _290 = _286 * _288;
        float _292 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _294 = fma(_290, (*spvDescriptorSet0.fp_c8)._m0[30].w, _292);
        float _296 = 1.0 / _294;
        float _298 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _300 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _302 = fma(_296, _298, _300);
        float _304 = _302 * 8.0;
        float _306 = precise::clamp(_304, 0.0, 1.0);
        float _308 = _252 * _306;
        _270 = _308;
    }
    float _310 = _270;
    float _312 = 0.0 + _310;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    out.m_42.x = _260;
    out.m_42.y = _262;
    out.m_42.z = _258;
    out.m_42.w = _314;
    return out;
}

