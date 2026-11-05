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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_31.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_31.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _344 = float2(_67, _69);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_344, float2(0.0), isnan(_344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_344, float2(0.0), isnan(_344))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = in.m_33.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_35.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_37.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = _65 * _86;
    float _102 = _65 * _98;
    float _104 = _80 * _100;
    float _106 = _65 * _92;
    float _108 = 0.0 + _104;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = _110 * _106;
    bool _116 = _112 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _118 = isnan(_112);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _124 = _120 || _122;
    float _126 = in.m_37.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    if (!_124)
    {
        discard_fragment();
    }
    float _132 = _65 * _130;
    float2 _436 = float2(_132, _102);
    float3 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_436, float2(0.0), isnan(_436))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_436, float2(0.0), isnan(_436))).xyz;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = in.m_33.x;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_39.x;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_33.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_39.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_33.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_39.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = _74 * _74;
    float _182 = _76 * _76;
    float _184 = _78 * _78;
    float _186 = _65 * _148;
    float _188 = _65 * _166;
    float _190 = _65 * _178;
    float _192 = _180 * _138;
    float _194 = _182 * _140;
    float _196 = _65 * _154;
    float _198 = _65 * _160;
    float _200 = _65 * _172;
    float _202 = _184 * _142;
    float _204 = -_196;
    float _206 = _186 + _204;
    float _208 = -_188;
    float _210 = _198 + _208;
    float _212 = -_190;
    float _214 = _200 + _212;
    float _216 = fma(_192, _206, _196);
    float _218 = fma(_194, _210, _188);
    float _220 = fma(_202, _214, _190);
    if (!_124)
    {
        out.m_42.x = _216;
        out.m_42.y = _218;
        out.m_42.z = _220;
        out.m_42.w = _104;
        return out;
    }
    float _222 = in.m_44.w;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = _65 * _226;
    bool _230 = _228 != 1.0;
    bool _232 = isnan(_228);
    bool _234 = _230 || _232;
    bool _236 = isnan(1.0);
    bool _238 = _234 || _236;
    bool _240 = !_238;
    if (!_240)
    {
        float _242 = gl_FragCoord.x;
        float _244 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _246 = _242 / _244;
        float _248 = gl_FragCoord.y;
        float _250 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _252 = _248 / _250;
        float _254 = _228 * 256.0;
        float _256 = trunc(_254);
        int _259 = int(_256);
        float _261 = trunc(_246);
        int _263 = int(_261);
        float _265 = trunc(_252);
        int _267 = int(_265);
        int _269 = _263 + 2;
        int _271 = _269 >> 1;
        uint _274 = uint(int(uint(_267) >> uint(1)));
        int _276 = _271 ^ int(_274);
        int _278 = _276 << 16;
        int _280 = _278 ^ _271;
        int _282 = 983055 & _280;
        int _284 = _282 << 6;
        int _286 = _284 + _282;
        int _288 = _286 & 13369548;
        uint _290 = uint(int(uint(_288) >> uint(3)));
        int _292 = _288 | int(_290);
        uint _294 = uint(int(uint(_259) >> uint(7)));
        int _296 = int(_294) + _259;
        int _298 = _292 & 5570560;
        int _300 = _292 & 85;
        uint _302 = uint(int(uint(_298) >> uint(15)));
        int _304 = int(_302) + _300;
        bool _306 = uint(_296) > uint(_304);
        if (!_306)
        {
            discard_fragment();
        }
        if (!_306)
        {
            out.m_42.x = _216;
            out.m_42.y = _218;
            out.m_42.z = _220;
            out.m_42.w = _112;
            return out;
        }
    }
    float _308 = 0.0 + _112;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    out.m_42.x = 1.0;
    out.m_42.y = 1.0;
    out.m_42.z = 1.0;
    out.m_42.w = _310;
    return out;
}

