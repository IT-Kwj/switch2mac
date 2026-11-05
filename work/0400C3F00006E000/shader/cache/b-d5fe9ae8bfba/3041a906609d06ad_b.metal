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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_A [[id(0)]];
    sampler fp_t_tcb_ASmplr [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_ASmplr_w [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_28 [[color(0)]];
    float4 m_30 [[color(1)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_25.x;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_25.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_25.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_25.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _37;
    float _65 = _63 * _43;
    float _67 = _63 * _49;
    float _69 = _63 * _55;
    float _71 = _63 * _61;
    float2 _248 = float2(_65, _67);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_248, float2(0.0), isnan(_248))).x;
    float2 _259 = float2(_69, _67);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_259, float2(0.0), isnan(_259))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_259, float2(0.0), isnan(_259))).x;
    float2 _267 = float2(_65, _71);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_267, float2(0.0), isnan(_267))).x;
    float2 _275 = float2(_69, _71);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_275, float2(0.0), isnan(_275))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_275, float2(0.0), isnan(_275))).x;
    float2 _283 = float2(_69, _71);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_283, float2(0.0), isnan(_283))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = _73 + _75;
    float _94 = _77 + _92;
    float _96 = -_79;
    bool _100 = _94 != _96;
    bool _102 = isnan(_94);
    bool _104 = _100 || _102;
    bool _106 = isnan(_96);
    bool _108 = _104 || _106;
    int _111 = as_type<int>(_63);
    if (!_108)
    {
        _111 = 0;
    }
    int _113 = _111;
    if (!_108)
    {
        out.m_28.x = _84;
        out.m_28.y = _86;
        out.m_28.z = _88;
        out.m_28.w = _90;
        out.m_30.x = as_type<float>(_113);
        return out;
    }
    float2 _343 = float2(_69, _67);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_343, float2(0.0), isnan(_343))).xyzw;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _115.w;
    float2 _359 = float2(_65, _67);
    float4 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_359, float2(0.0), isnan(_359))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_359, float2(0.0), isnan(_359))).xyzw;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = _125.w;
    float2 _375 = float2(_65, _71);
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_375, float2(0.0), isnan(_375))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_375, float2(0.0), isnan(_375))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float _145 = _79 + _94;
    float _147 = -_79;
    bool _149 = _94 > _147;
    float _151 = 1.0 / _145;
    float _153 = _149 ? _151 : 1.0;
    float _155 = _75 * _123;
    float _157 = _75 * _117;
    float _159 = _75 * _119;
    float _161 = _75 * _121;
    float _163 = fma(_73, _133, _155);
    float _165 = fma(_73, _127, _157);
    float _167 = fma(_73, _129, _159);
    float _169 = fma(_73, _131, _161);
    float _171 = fma(_77, _143, _163);
    float _173 = fma(_77, _137, _165);
    float _175 = fma(_77, _139, _167);
    float _177 = fma(_77, _141, _169);
    float _179 = fma(_79, _90, _171);
    float _181 = fma(_79, _84, _173);
    float _183 = fma(_79, _86, _175);
    float _185 = fma(_79, _88, _177);
    float _187 = _179 * _153;
    float _189 = _181 * _153;
    float _191 = _183 * _153;
    float _193 = _185 * _153;
    out.m_28.x = _189;
    out.m_28.y = _191;
    out.m_28.z = _193;
    out.m_28.w = _187;
    out.m_30.x = _187;
    return out;
}


struct main0_out_u
{
    uint4 m_28 [[color(0)]];
    uint4 m_30 [[color(1)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_25.x;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_25.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_25.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_25.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _37;
    float _65 = _63 * _43;
    float _67 = _63 * _49;
    float _69 = _63 * _55;
    float _71 = _63 * _61;
    float2 _248 = float2(_65, _67);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_248, float2(0.0), isnan(_248))).x;
    float2 _259 = float2(_69, _67);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_259, float2(0.0), isnan(_259))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_259, float2(0.0), isnan(_259))).x;
    float2 _267 = float2(_65, _71);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_267, float2(0.0), isnan(_267))).x;
    float2 _275 = float2(_69, _71);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_275, float2(0.0), isnan(_275))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_275, float2(0.0), isnan(_275))).x;
    float2 _283 = float2(_69, _71);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_283, float2(0.0), isnan(_283))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = _73 + _75;
    float _94 = _77 + _92;
    float _96 = -_79;
    bool _100 = _94 != _96;
    bool _102 = isnan(_94);
    bool _104 = _100 || _102;
    bool _106 = isnan(_96);
    bool _108 = _104 || _106;
    int _111 = as_type<int>(_63);
    if (!_108)
    {
        _111 = 0;
    }
    int _113 = _111;
    if (!_108)
    {
        out.m_28.x = _84;
        out.m_28.y = _86;
        out.m_28.z = _88;
        out.m_28.w = _90;
        out.m_30.x = as_type<float>(_113);
        return main0_out_u{as_type<uint4>(out.m_28), as_type<uint4>(out.m_30)};
    }
    float2 _343 = float2(_69, _67);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_343, float2(0.0), isnan(_343))).xyzw;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _115.w;
    float2 _359 = float2(_65, _67);
    float4 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_359, float2(0.0), isnan(_359))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_359, float2(0.0), isnan(_359))).xyzw;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = _125.w;
    float2 _375 = float2(_65, _71);
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_375, float2(0.0), isnan(_375))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_375, float2(0.0), isnan(_375))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float _145 = _79 + _94;
    float _147 = -_79;
    bool _149 = _94 > _147;
    float _151 = 1.0 / _145;
    float _153 = _149 ? _151 : 1.0;
    float _155 = _75 * _123;
    float _157 = _75 * _117;
    float _159 = _75 * _119;
    float _161 = _75 * _121;
    float _163 = fma(_73, _133, _155);
    float _165 = fma(_73, _127, _157);
    float _167 = fma(_73, _129, _159);
    float _169 = fma(_73, _131, _161);
    float _171 = fma(_77, _143, _163);
    float _173 = fma(_77, _137, _165);
    float _175 = fma(_77, _139, _167);
    float _177 = fma(_77, _141, _169);
    float _179 = fma(_79, _90, _171);
    float _181 = fma(_79, _84, _173);
    float _183 = fma(_79, _86, _175);
    float _185 = fma(_79, _88, _177);
    float _187 = _179 * _153;
    float _189 = _181 * _153;
    float _191 = _183 * _153;
    float _193 = _185 * _153;
    out.m_28.x = _189;
    out.m_28.y = _191;
    out.m_28.z = _193;
    out.m_28.w = _187;
    out.m_30.x = _187;
    return main0_out_u{as_type<uint4>(out.m_28), as_type<uint4>(out.m_30)};
}


struct main0_out_m
{
    float4 m_28 [[color(0)]];
    uint4 m_30 [[color(1)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_25.x;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_25.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_25.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_25.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _37;
    float _65 = _63 * _43;
    float _67 = _63 * _49;
    float _69 = _63 * _55;
    float _71 = _63 * _61;
    float2 _248 = float2(_65, _67);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_248, float2(0.0), isnan(_248))).x;
    float2 _259 = float2(_69, _67);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_259, float2(0.0), isnan(_259))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_259, float2(0.0), isnan(_259))).x;
    float2 _267 = float2(_65, _71);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_267, float2(0.0), isnan(_267))).x;
    float2 _275 = float2(_69, _71);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_275, float2(0.0), isnan(_275))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_275, float2(0.0), isnan(_275))).x;
    float2 _283 = float2(_69, _71);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_283, float2(0.0), isnan(_283))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = _73 + _75;
    float _94 = _77 + _92;
    float _96 = -_79;
    bool _100 = _94 != _96;
    bool _102 = isnan(_94);
    bool _104 = _100 || _102;
    bool _106 = isnan(_96);
    bool _108 = _104 || _106;
    int _111 = as_type<int>(_63);
    if (!_108)
    {
        _111 = 0;
    }
    int _113 = _111;
    if (!_108)
    {
        out.m_28.x = _84;
        out.m_28.y = _86;
        out.m_28.z = _88;
        out.m_28.w = _90;
        out.m_30.x = as_type<float>(_113);
        return main0_out_m{out.m_28, as_type<uint4>(out.m_30)};
    }
    float2 _343 = float2(_69, _67);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_343, float2(0.0), isnan(_343))).xyzw;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _115.w;
    float2 _359 = float2(_65, _67);
    float4 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_359, float2(0.0), isnan(_359))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_359, float2(0.0), isnan(_359))).xyzw;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = _125.w;
    float2 _375 = float2(_65, _71);
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_375, float2(0.0), isnan(_375))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_375, float2(0.0), isnan(_375))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float _145 = _79 + _94;
    float _147 = -_79;
    bool _149 = _94 > _147;
    float _151 = 1.0 / _145;
    float _153 = _149 ? _151 : 1.0;
    float _155 = _75 * _123;
    float _157 = _75 * _117;
    float _159 = _75 * _119;
    float _161 = _75 * _121;
    float _163 = fma(_73, _133, _155);
    float _165 = fma(_73, _127, _157);
    float _167 = fma(_73, _129, _159);
    float _169 = fma(_73, _131, _161);
    float _171 = fma(_77, _143, _163);
    float _173 = fma(_77, _137, _165);
    float _175 = fma(_77, _139, _167);
    float _177 = fma(_77, _141, _169);
    float _179 = fma(_79, _90, _171);
    float _181 = fma(_79, _84, _173);
    float _183 = fma(_79, _86, _175);
    float _185 = fma(_79, _88, _177);
    float _187 = _179 * _153;
    float _189 = _181 * _153;
    float _191 = _183 * _153;
    float _193 = _185 * _153;
    out.m_28.x = _189;
    out.m_28.y = _191;
    out.m_28.z = _193;
    out.m_28.w = _187;
    out.m_30.x = _187;
    return main0_out_m{out.m_28, as_type<uint4>(out.m_30)};
}

