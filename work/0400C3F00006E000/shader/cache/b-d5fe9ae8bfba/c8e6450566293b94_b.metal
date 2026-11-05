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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    device _21* fp_s0 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
    float4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_34.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_34.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _262 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_262, float2(0.0), isnan(_262)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _82 = gl_FragCoord.x;
    float _84 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _86 = _82 / _84;
    float _88 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _90 = _67 * _80;
    float _92 = gl_FragCoord.y;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = _65 * _88;
    float _100 = trunc(_90);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_86);
    int _111 = int(_109);
    int _113 = _103 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _107;
    float _117 = trunc(_96);
    int _119 = int(_117);
    int _121 = _111 & 1;
    int _123 = _119 << 1;
    int _125 = 2 & _123;
    int _127 = (-3) & _121;
    int _129 = _125 | _127;
    int _131 = _115 * 4;
    int _133 = _131 + _129;
    int _135 = _133 * 4;
    int _137 = _135 + 9728;
    float _139 = precise::min(_72, _74);
    float _141 = precise::max(_72, _74);
    float _143 = precise::min(_76, _78);
    float _145 = precise::max(_76, _78);
    float _147 = precise::min(_139, _143);
    float _149 = precise::max(_141, _145);
    bool _153 = _147 >= 1.0;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = -_147;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _167 = -_149;
    float _169 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _171 = 1.0 / _165;
    float _173 = 1.0 / _169;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _177 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[1].w, _175);
    float _179 = _177 * 16777215.0;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[1].w, _181);
    bool _185 = !_161;
    float _187 = _185 ? _179 : 16777215.0;
    bool _189 = _149 >= 1.0;
    bool _191 = isnan(_149);
    bool _193 = _189 || _191;
    bool _195 = isnan(1.0);
    bool _197 = _193 || _195;
    float _199 = _183 * 16777215.0;
    float _201 = trunc(_187);
    float _203 = precise::max(_201, 0.0);
    uint _206 = uint(_203);
    bool _208 = !_197;
    float _210 = _208 ? _199 : 16777215.0;
    float _212 = trunc(_210);
    float _214 = precise::max(_212, 0.0);
    uint _216 = uint(_214);
    uint _218 = uint(int(uint(_135) >> uint(2)));
    uint _467 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_218)], _206, memory_order_relaxed);
    uint _220 = _467;
    bool _222 = !_197;
    int _224 = _222 ? as_type<int>(_183) : 1065353216;
    uint _226 = uint(int(uint(_137) >> uint(2)));
    uint _482 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_226)], _216, memory_order_relaxed);
    uint _228 = _482;
    out.gl_FragDepth = as_type<float>(_216);
    out.m_40.x = _78;
    out.m_40.y = _78;
    out.m_40.z = _78;
    out.m_40.w = _78;
    out.m_42.x = as_type<float>(_224);
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
    uint4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_34.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_34.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _262 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_262, float2(0.0), isnan(_262)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _82 = gl_FragCoord.x;
    float _84 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _86 = _82 / _84;
    float _88 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _90 = _67 * _80;
    float _92 = gl_FragCoord.y;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = _65 * _88;
    float _100 = trunc(_90);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_86);
    int _111 = int(_109);
    int _113 = _103 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _107;
    float _117 = trunc(_96);
    int _119 = int(_117);
    int _121 = _111 & 1;
    int _123 = _119 << 1;
    int _125 = 2 & _123;
    int _127 = (-3) & _121;
    int _129 = _125 | _127;
    int _131 = _115 * 4;
    int _133 = _131 + _129;
    int _135 = _133 * 4;
    int _137 = _135 + 9728;
    float _139 = precise::min(_72, _74);
    float _141 = precise::max(_72, _74);
    float _143 = precise::min(_76, _78);
    float _145 = precise::max(_76, _78);
    float _147 = precise::min(_139, _143);
    float _149 = precise::max(_141, _145);
    bool _153 = _147 >= 1.0;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = -_147;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _167 = -_149;
    float _169 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _171 = 1.0 / _165;
    float _173 = 1.0 / _169;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _177 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[1].w, _175);
    float _179 = _177 * 16777215.0;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[1].w, _181);
    bool _185 = !_161;
    float _187 = _185 ? _179 : 16777215.0;
    bool _189 = _149 >= 1.0;
    bool _191 = isnan(_149);
    bool _193 = _189 || _191;
    bool _195 = isnan(1.0);
    bool _197 = _193 || _195;
    float _199 = _183 * 16777215.0;
    float _201 = trunc(_187);
    float _203 = precise::max(_201, 0.0);
    uint _206 = uint(_203);
    bool _208 = !_197;
    float _210 = _208 ? _199 : 16777215.0;
    float _212 = trunc(_210);
    float _214 = precise::max(_212, 0.0);
    uint _216 = uint(_214);
    uint _218 = uint(int(uint(_135) >> uint(2)));
    uint _467 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_218)], _206, memory_order_relaxed);
    uint _220 = _467;
    bool _222 = !_197;
    int _224 = _222 ? as_type<int>(_183) : 1065353216;
    uint _226 = uint(int(uint(_137) >> uint(2)));
    uint _482 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_226)], _216, memory_order_relaxed);
    uint _228 = _482;
    out.gl_FragDepth = as_type<float>(_216);
    out.m_40.x = _78;
    out.m_40.y = _78;
    out.m_40.z = _78;
    out.m_40.w = _78;
    out.m_42.x = as_type<float>(_224);
    return main0_out_u{as_type<uint4>(out.m_40), as_type<uint4>(out.m_42), out.gl_FragDepth};
}


struct main0_out_m
{
    float4 m_40 [[color(0)]];
    uint4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_34.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_34.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _262 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_262, float2(0.0), isnan(_262)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _82 = gl_FragCoord.x;
    float _84 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _86 = _82 / _84;
    float _88 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _90 = _67 * _80;
    float _92 = gl_FragCoord.y;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = _65 * _88;
    float _100 = trunc(_90);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_86);
    int _111 = int(_109);
    int _113 = _103 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _107;
    float _117 = trunc(_96);
    int _119 = int(_117);
    int _121 = _111 & 1;
    int _123 = _119 << 1;
    int _125 = 2 & _123;
    int _127 = (-3) & _121;
    int _129 = _125 | _127;
    int _131 = _115 * 4;
    int _133 = _131 + _129;
    int _135 = _133 * 4;
    int _137 = _135 + 9728;
    float _139 = precise::min(_72, _74);
    float _141 = precise::max(_72, _74);
    float _143 = precise::min(_76, _78);
    float _145 = precise::max(_76, _78);
    float _147 = precise::min(_139, _143);
    float _149 = precise::max(_141, _145);
    bool _153 = _147 >= 1.0;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = -_147;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _167 = -_149;
    float _169 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _171 = 1.0 / _165;
    float _173 = 1.0 / _169;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _177 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[1].w, _175);
    float _179 = _177 * 16777215.0;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[1].w, _181);
    bool _185 = !_161;
    float _187 = _185 ? _179 : 16777215.0;
    bool _189 = _149 >= 1.0;
    bool _191 = isnan(_149);
    bool _193 = _189 || _191;
    bool _195 = isnan(1.0);
    bool _197 = _193 || _195;
    float _199 = _183 * 16777215.0;
    float _201 = trunc(_187);
    float _203 = precise::max(_201, 0.0);
    uint _206 = uint(_203);
    bool _208 = !_197;
    float _210 = _208 ? _199 : 16777215.0;
    float _212 = trunc(_210);
    float _214 = precise::max(_212, 0.0);
    uint _216 = uint(_214);
    uint _218 = uint(int(uint(_135) >> uint(2)));
    uint _467 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_218)], _206, memory_order_relaxed);
    uint _220 = _467;
    bool _222 = !_197;
    int _224 = _222 ? as_type<int>(_183) : 1065353216;
    uint _226 = uint(int(uint(_137) >> uint(2)));
    uint _482 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_226)], _216, memory_order_relaxed);
    uint _228 = _482;
    out.gl_FragDepth = as_type<float>(_216);
    out.m_40.x = _78;
    out.m_40.y = _78;
    out.m_40.z = _78;
    out.m_40.w = _78;
    out.m_42.x = as_type<float>(_224);
    return main0_out_m{out.m_40, as_type<uint4>(out.m_42), out.gl_FragDepth};
}

