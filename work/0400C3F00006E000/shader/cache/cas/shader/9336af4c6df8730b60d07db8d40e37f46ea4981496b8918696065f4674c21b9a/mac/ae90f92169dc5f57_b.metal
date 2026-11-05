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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_23 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_29 [[user(locn4)]];
    float4 m_27 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_23.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_23.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _270 = float2(_59, _61);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_270, float2(0.0), isnan(_270))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_270, float2(0.0), isnan(_270))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float _74 = in.m_25.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_27.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_29.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_25.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_31.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_25.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_25.z;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_33.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = _57 * _78;
    float _124 = _57 * _84;
    float _126 = _57 * _90;
    bool _130 = _124 != 1.0;
    bool _132 = isnan(_124);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = -_122;
    float _142 = fma(_72, _126, _140);
    float _144 = _57 * _96;
    float _146 = _57 * _102;
    float _148 = _57 * _108;
    float _150 = _57 * _114;
    float _152 = _57 * _120;
    float _154 = _146 * _142;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = _66 * _144;
    float _160 = _68 * _148;
    float _162 = _70 * _150;
    float _164 = _156 * _152;
    bool _166 = !_138;
    if (!_166)
    {
        float _168 = gl_FragCoord.x;
        float _170 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _172 = _168 / _170;
        float _174 = gl_FragCoord.y;
        float _176 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _178 = _174 / _176;
        float _180 = trunc(_172);
        int _183 = int(_180);
        float _185 = trunc(_178);
        int _187 = int(_185);
        int _189 = _183 + 2;
        int _191 = _189 >> 1;
        uint _194 = uint(int(uint(_187) >> uint(1)));
        int _196 = _191 ^ int(_194);
        int _198 = _196 << 16;
        int _200 = _198 ^ _191;
        int _202 = 983055 & _200;
        float _204 = _124 * 256.0;
        int _206 = _202 << 6;
        int _208 = _206 + _202;
        float _210 = trunc(_204);
        int _212 = int(_210);
        int _214 = _208 & 13369548;
        uint _216 = uint(int(uint(_214) >> uint(3)));
        int _218 = _214 | int(_216);
        int _220 = _218 & 5570560;
        int _222 = _218 & 85;
        uint _224 = uint(int(uint(_212) >> uint(7)));
        int _226 = int(_224) + _212;
        uint _228 = uint(int(uint(_220) >> uint(15)));
        int _230 = int(_228) + _222;
        bool _232 = uint(_226) > uint(_230);
        if (!_232)
        {
            discard_fragment();
        }
        if (!_232)
        {
            out.m_36.x = _158;
            out.m_36.y = _160;
            out.m_36.z = _162;
            out.m_36.w = _164;
            return out;
        }
    }
    float _234 = 0.0 + _164;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    out.m_36.x = 1.0;
    out.m_36.y = 1.0;
    out.m_36.z = 1.0;
    out.m_36.w = _236;
    return out;
}

