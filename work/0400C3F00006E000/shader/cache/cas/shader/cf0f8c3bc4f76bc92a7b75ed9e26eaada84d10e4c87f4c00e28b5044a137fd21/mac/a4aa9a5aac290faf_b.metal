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
    float4 m_41 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
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
    float2 _336 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_336, float2(0.0), isnan(_336))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_336, float2(0.0), isnan(_336))).xyzw;
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
    float _106 = in.m_37.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_41.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_37.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_41.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_35.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_35.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_35.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = _67 * _116;
    float _150 = _67 * _122;
    float _152 = _82 * _102;
    float _154 = _104 * _152;
    float _156 = _67 * _100;
    float _158 = 0.0 + _154;
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = _160 * _156;
    bool _166 = _162 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _168 = isnan(_162);
    bool _170 = _166 || _168;
    bool _172 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _174 = _170 || _172;
    float _176 = in.m_37.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_41.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    if (!_174)
    {
        discard_fragment();
    }
    float _188 = _67 * _180;
    float _190 = _67 * _186;
    float _192 = _67 * _110;
    float _194 = _67 * _128;
    float _196 = -_190;
    float _198 = _188 + _196;
    float _200 = -_148;
    float _202 = _192 + _200;
    float _204 = -_194;
    float _206 = _150 + _204;
    float _208 = fma(_76, _198, _190);
    float _210 = fma(_78, _202, _148);
    float _212 = fma(_80, _206, _194);
    float _214 = _67 * _134;
    float _216 = _67 * _140;
    float _218 = _67 * _146;
    float _220 = _208 * _214;
    float _222 = _210 * _216;
    float _224 = _212 * _218;
    if (!_174)
    {
        out.m_44.x = _220;
        out.m_44.y = _222;
        out.m_44.z = _224;
        out.m_44.w = _154;
        return out;
    }
    float _226 = _222 * 0.715200006961822509765625;
    float _228 = 0.0 + _162;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = fma(_220, 0.2125999927520751953125, _226);
    bool _234 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _236 = fma(_224, 0.072200000286102294921875, _232);
    float _238 = 1.0 / _236;
    float _240 = _238 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = fma(_242, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _246 = _220 * _244;
    float _248 = _222 * _244;
    float _250 = _224 * _244;
    float _252 = _244;
    if (!_234)
    {
        _252 = _230;
    }
    float _254 = _252;
    bool _256 = !_234;
    float _258 = _254;
    if (!_256)
    {
        float _260 = in.m_46.w;
        float _262 = gl_FragCoord.w;
        float _264 = _260 * _262;
        float _266 = in.m_46.z;
        float _268 = gl_FragCoord.w;
        float _270 = _266 * _268;
        float _272 = _67 * _264;
        float _274 = _67 * _270;
        float _276 = 1.0 / _272;
        float _278 = _274 * _276;
        float _280 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _282 = fma(_278, (*spvDescriptorSet0.fp_c8)._m0[30].w, _280);
        float _284 = 1.0 / _282;
        float _286 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _288 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _290 = fma(_284, _286, _288);
        float _292 = _290 * 8.0;
        float _294 = precise::clamp(_292, 0.0, 1.0);
        float _296 = _230 * _294;
        _258 = _296;
    }
    float _298 = _258;
    float _300 = 0.0 + _298;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    out.m_44.x = _246;
    out.m_44.y = _248;
    out.m_44.z = _250;
    out.m_44.w = _302;
    return out;
}

