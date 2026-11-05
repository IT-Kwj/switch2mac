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
    float4 m_39 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
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
    float2 _318 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_318, float2(0.0), isnan(_318))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_318, float2(0.0), isnan(_318))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_35.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_37.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = _67 * _88;
    float _98 = _67 * _94;
    float _100 = in.m_39.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_35.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_39.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_39.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = _67 * _104;
    float _126 = _67 * _116;
    float _128 = _82 * _96;
    float _130 = 0.0 + _128;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = _132 * _98;
    bool _138 = _134 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _140 = isnan(_134);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _146 = _142 || _144;
    float _148 = in.m_35.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_35.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    if (!_146)
    {
        discard_fragment();
    }
    float _160 = _67 * _152;
    float _162 = _67 * _110;
    float _164 = _67 * _158;
    float _166 = _67 * _122;
    float _168 = fma(_78, _160, _124);
    float _170 = fma(_76, _164, _126);
    float _172 = fma(_80, _162, _166);
    if (!_146)
    {
        out.m_42.x = _170;
        out.m_42.y = _168;
        out.m_42.z = _172;
        out.m_42.w = _128;
        return out;
    }
    float _174 = _168 * 0.715200006961822509765625;
    float _176 = in.m_44.w;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_44.z;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_44.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = fma(_170, 0.2125999927520751953125, _174);
    float _196 = in.m_44.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = 0.0 + _134;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = fma(_172, 0.072200000286102294921875, _194);
    bool _208 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _210 = 1.0 / _206;
    float _212 = _210 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = fma(_214, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _218 = _67 * _180;
    float _220 = _67 * _186;
    float _222 = _216 * _218;
    float _224 = _67 * _192;
    float _226 = _67 * _200;
    float _228 = fma(_172, _222, _220);
    float _230 = fma(_170, _222, _224);
    float _232 = fma(_168, _222, _226);
    float _234 = _220;
    if (!_208)
    {
        _234 = _204;
    }
    float _236 = _234;
    bool _238 = !_208;
    float _240 = _236;
    if (!_238)
    {
        float _242 = in.m_46.w;
        float _244 = gl_FragCoord.w;
        float _246 = _242 * _244;
        float _248 = in.m_46.z;
        float _250 = gl_FragCoord.w;
        float _252 = _248 * _250;
        float _254 = _67 * _246;
        float _256 = _67 * _252;
        float _258 = 1.0 / _254;
        float _260 = _256 * _258;
        float _262 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _264 = fma(_260, (*spvDescriptorSet0.fp_c8)._m0[30].w, _262);
        float _266 = 1.0 / _264;
        float _268 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _270 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _272 = fma(_266, _268, _270);
        float _274 = _272 * 8.0;
        float _276 = precise::clamp(_274, 0.0, 1.0);
        float _278 = _204 * _276;
        _240 = _278;
    }
    float _280 = _240;
    float _282 = 0.0 + _280;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    out.m_42.x = _230;
    out.m_42.y = _232;
    out.m_42.z = _228;
    out.m_42.w = _284;
    return out;
}

