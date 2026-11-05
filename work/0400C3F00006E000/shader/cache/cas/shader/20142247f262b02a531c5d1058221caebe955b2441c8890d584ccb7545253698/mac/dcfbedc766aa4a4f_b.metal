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
    constant _16* fp_c3 [[id(0)]];
    texturecube_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].y));
    bool _63 = 0 != as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].y);
    float _65 = rint(_59);
    float _67 = precise::max(_65, 0.0);
    uint _70 = uint(_67);
    uint _72 = clamp(_70, 0u, 65535u);
    float _74 = 1.0 / _39;
    float _76 = _74 * _45;
    float _78 = _74 * _51;
    float _80 = _74 * _57;
    float _82 = abs(_76);
    float _84 = abs(_78);
    float _86 = precise::max(_82, _84);
    float _88 = abs(_80);
    float _90 = precise::max(_88, _86);
    float _92 = 1.0 / _90;
    float _94 = _76 * _92;
    float _96 = _78 * _92;
    float _98 = _80 * _92;
    float _100 = _86;
    float _102 = _74;
    float _104 = 0.0;
    float _106 = 0.0;
    if (!_63)
    {
        float4 _280 = float4(_94, _96, _98, float(int(_72)));
        float4 _284 = select(_280, float4(0.0), isnan(_280));
        float4 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _284.xyz, uint(rint(_284.w))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _284.xyz, uint(rint(_284.w))).xyzw;
        float _111 = _109.x;
        float _113 = _109.y;
        float _115 = _109.z;
        float _117 = _109.w;
        _100 = _111;
        _102 = _113;
        _104 = _115;
        _106 = _117;
    }
    float _119 = _100;
    float _121 = _102;
    float _123 = _104;
    float _125 = _106;
    float _127 = 0.0;
    if (_63)
    {
        _127 = (*spvDescriptorSet0.fp_c3)._m0[7].w;
    }
    float _129 = _127;
    float _131 = _119;
    float _133 = _121;
    float _135 = _123;
    float _137 = _125;
    if (_63)
    {
        float4 _324 = float4(_94, _96, _98, float(int(_72)));
        float4 _326 = select(_324, float4(0.0), isnan(_324));
        float4 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _326.xyz, uint(rint(_326.w)), level(_129)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _326.xyz, uint(rint(_326.w)), level(_129)).xyzw;
        float _141 = _139.x;
        float _143 = _139.y;
        float _145 = _139.z;
        float _147 = _139.w;
        _131 = _141;
        _133 = _143;
        _135 = _145;
        _137 = _147;
    }
    float _149 = _131;
    float _151 = _133;
    float _153 = _135;
    float _155 = _137;
    float _157 = abs(_155);
    float _159 = log2(_157);
    float _161 = _159 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _163 = exp2(_161);
    float _165 = _163 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _167 = _165 * _149;
    float _169 = _165 * _151;
    float _171 = _165 * _153;
    float _173 = _155 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = precise::max(0.0, _167);
    float _179 = precise::max(0.0, _169);
    float _181 = precise::max(0.0, _171);
    out.m_32.x = _177;
    out.m_32.y = _179;
    out.m_32.z = _181;
    out.m_32.w = _175;
    return out;
}

