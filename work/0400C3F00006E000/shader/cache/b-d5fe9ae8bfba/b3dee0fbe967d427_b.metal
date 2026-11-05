#pragma clang diagnostic ignored "-Wunused-variable"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c0 [[id(2)]];
    device _23* fp_s0 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
};

struct main0_out
{
    float4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_36.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_36.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _222 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_222, float2(0.0), isnan(_222)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = gl_FragCoord.y;
    float _82 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _84 = _80 / _82;
    float _86 = gl_FragCoord.x;
    float _88 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _90 = _86 / _88;
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _94 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _96 = _65 * _92;
    float _98 = _67 * _94;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_84);
    int _111 = int(_109);
    int _113 = _107 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _103;
    float _117 = trunc(_90);
    int _119 = int(_117);
    int _121 = _111 * 2;
    int _123 = _119 & 1;
    int _125 = 2 & _121;
    int _127 = (-3) & _123;
    int _129 = _125 | _127;
    int _131 = _115 * 4;
    int _133 = _131 + _129;
    int _135 = _133 << 2;
    int _137 = _135 + 9728;
    int _139 = _137 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    float _141 = precise::max(_72, _74);
    float _143 = precise::max(_76, _78);
    float _145 = precise::max(_141, _143);
    bool _149 = _145 >= 1.0;
    bool _151 = isnan(_145);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = -_145;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _163 = 1.0 / _161;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _167 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[1].w, _165);
    float _169 = _167 * 16777215.0;
    bool _171 = !_157;
    float _173 = _171 ? _169 : 16777215.0;
    float _175 = trunc(_173);
    float _177 = precise::max(_175, 0.0);
    uint _180 = uint(_177);
    bool _182 = !_157;
    int _184 = _182 ? as_type<int>(_167) : 1065353216;
    uint _186 = uint(int(uint(_137) >> uint(2)));
    uint _391 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_186)], _180, memory_order_relaxed);
    uint _188 = _391;
    out.gl_FragDepth = as_type<float>(_139);
    out.m_42.x = as_type<float>(_184);
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_36.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_36.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _222 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_222, float2(0.0), isnan(_222)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = gl_FragCoord.y;
    float _82 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _84 = _80 / _82;
    float _86 = gl_FragCoord.x;
    float _88 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _90 = _86 / _88;
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _94 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _96 = _65 * _92;
    float _98 = _67 * _94;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_84);
    int _111 = int(_109);
    int _113 = _107 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _103;
    float _117 = trunc(_90);
    int _119 = int(_117);
    int _121 = _111 * 2;
    int _123 = _119 & 1;
    int _125 = 2 & _121;
    int _127 = (-3) & _123;
    int _129 = _125 | _127;
    int _131 = _115 * 4;
    int _133 = _131 + _129;
    int _135 = _133 << 2;
    int _137 = _135 + 9728;
    int _139 = _137 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    float _141 = precise::max(_72, _74);
    float _143 = precise::max(_76, _78);
    float _145 = precise::max(_141, _143);
    bool _149 = _145 >= 1.0;
    bool _151 = isnan(_145);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = -_145;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _163 = 1.0 / _161;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _167 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[1].w, _165);
    float _169 = _167 * 16777215.0;
    bool _171 = !_157;
    float _173 = _171 ? _169 : 16777215.0;
    float _175 = trunc(_173);
    float _177 = precise::max(_175, 0.0);
    uint _180 = uint(_177);
    bool _182 = !_157;
    int _184 = _182 ? as_type<int>(_167) : 1065353216;
    uint _186 = uint(int(uint(_137) >> uint(2)));
    uint _391 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_186)], _180, memory_order_relaxed);
    uint _188 = _391;
    out.gl_FragDepth = as_type<float>(_139);
    out.m_42.x = as_type<float>(_184);
    return main0_out_u{as_type<uint4>(out.m_42), out.gl_FragDepth};
}

