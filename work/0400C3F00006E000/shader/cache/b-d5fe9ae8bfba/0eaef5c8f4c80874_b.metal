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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_31.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_31.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _47;
    float _75 = _73 * _53;
    float _77 = _73 * _59;
    float _79 = _73 * _71;
    float _81 = fma(_75, 0.75, -0.75);
    float _83 = fma(_77, 0.75, -0.75);
    float _85 = _73 * _65;
    float _87 = _81 * 0.707106769084930419921875;
    float _89 = -_87;
    float _91 = fma(_83, 0.707106769084930419921875, _89);
    float _93 = fma(_83, 0.707106769084930419921875, _87);
    float2 _327 = float2(_85, _79);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_327, float2(0.0), isnan(_327))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_327, float2(0.0), isnan(_327))).w;
    float _97 = _91 + 1.0;
    float _99 = _93 + 1.0;
    float2 _342 = float2(_97, _99);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_342, float2(0.0), isnan(_342))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_342, float2(0.0), isnan(_342))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float _112 = in.m_33.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_35.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_37.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _73 * _116;
    float _132 = fma(_130, 0.23999999463558197021484375, 0.00999999977648258209228515625);
    float _134 = in.m_33.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_33.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_35.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    bool _154 = _95 >= _132;
    bool _156 = isnan(_95);
    bool _158 = _154 || _156;
    bool _160 = isnan(_132);
    bool _162 = _158 || _160;
    float _164 = float(_162);
    float _166 = _73 * _122;
    float _168 = _73 * _128;
    float _170 = fma(_110, _166, _164);
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = _172 * _168;
    bool _176 = _174 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _178 = isnan(_174);
    bool _180 = _176 || _178;
    bool _182 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _184 = _180 || _182;
    float _186 = in.m_35.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_33.y;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_35.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    if (!_184)
    {
        discard_fragment();
    }
    float _204 = _104 * _104;
    float _206 = _106 * _106;
    float _208 = _108 * _108;
    float _210 = _73 * _138;
    float _212 = _204 * _204;
    float _214 = _206 * _206;
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = _73 * _190;
    float _222 = _208 * _208;
    float _224 = _73 * _196;
    float _226 = _73 * _144;
    float _228 = -_212;
    float _230 = _228 + 1.0;
    float _232 = -_222;
    float _234 = _232 + 1.0;
    float _236 = _73 * _202;
    float _238 = _73 * _150;
    float _240 = _210 * _230;
    float _242 = _224 * _218;
    float _244 = _226 * _234;
    float _246 = fma(_212, _220, _240);
    float _248 = fma(_214, _236, _242);
    float _250 = fma(_222, _238, _244);
    if (!_184)
    {
        out.m_40.x = _246;
        out.m_40.y = _248;
        out.m_40.z = _250;
        out.m_40.w = _172;
        return out;
    }
    float _252 = 0.0 + _174;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    out.m_40.x = _246;
    out.m_40.y = _248;
    out.m_40.z = _250;
    out.m_40.w = _254;
    return out;
}

