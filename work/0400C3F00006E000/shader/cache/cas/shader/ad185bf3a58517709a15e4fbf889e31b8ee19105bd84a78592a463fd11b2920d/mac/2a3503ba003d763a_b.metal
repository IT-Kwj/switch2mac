#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

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
    constant _16* vp_c3 [[id(1)]];
    const device _21* vp_s0 [[id(2)]];
    texture2d<float> vp_t_tcb_8 [[id(3)]];
    sampler vp_t_tcb_8Smplr [[id(4)]];
};

struct main0_out
{
    float4 m_39 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

static inline __attribute__((always_inline))
int _52(thread const int& _666, thread const int& _667, constant _10& support_buffer)
{
    float _670 = as_type<float>(support_buffer._m4);
    int _672 = _667 + as_type<int>(_670);
    int _674 = 1 + _672;
    float _676 = support_buffer._m5[_674].x;
    float _678 = abs(_676);
    bool _680 = _678 == 1.0;
    if (_680)
    {
        return _666;
    }
    float _682 = float(_666);
    float _684 = _682 / _678;
    int _686 = int(_684);
    return _686;
}

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _55 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _57 = _55;
    int _59 = 0;
    int _61 = _52(_57, _59, (*spvDescriptorSet0.support_buffer));
    int _63 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _65 = _63;
    int _67 = 0;
    int _69 = _52(_65, _67, (*spvDescriptorSet0.support_buffer));
    float _72 = as_type<float>(int(gl_InstanceIndex));
    float _74 = as_type<float>(int(gl_BaseInstance));
    int _76 = as_type<int>(_72) - as_type<int>(_74);
    int _78 = _76 << 4;
    uint _81 = uint(int(uint(_78) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_81)];
    float _83 = as_type<float>(_dmw0.x);
    int _85 = _78 + 4;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw0.y);
    int _91 = _78 + 8;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw0.z);
    int _97 = _78 + 12;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    float _101 = as_type<float>(_dmw0.w);
    float _103 = float(as_type<int>(_89));
    float _105 = float(as_type<int>(_83));
    bool _109 = _103 > (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _111 = float(as_type<int>(_95));
    bool _113 = _105 > (*spvDescriptorSet0.vp_c3)._m0[3].x;
    bool _115 = _113 || _109;
    float _117 = float(as_type<int>(_101));
    bool _119 = _111 > (*spvDescriptorSet0.vp_c3)._m0[3].z;
    bool _121 = _119 || _115;
    bool _123 = _117 > (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _125 = _123 || _121;
    float _127 = _105;
    float _129 = _117;
    int _131 = as_type<int>(_83);
    int _133 = as_type<int>(_89);
    if (!_125)
    {
        _127 = 0.0;
    }
    float _135 = _127;
    float _137 = _135;
    if (!_125)
    {
        _129 = 0.0;
    }
    float _139 = _129;
    float _141 = _139;
    if (!_125)
    {
        _131 = -971227136;
    }
    int _143 = _131;
    int _145 = _143;
    if (!_125)
    {
        _133 = -971227136;
    }
    int _147 = _133;
    bool _149 = !_125;
    int _151 = _147;
    if (!_149)
    {
        int _153 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _155 = abs(_76);
        float _157 = float(uint(_153));
        float _159 = float(uint(_155));
        float _161 = 1.0 / _157;
        int _163 = as_type<int>(_161) + (-2);
        float _165 = as_type<float>(int(gl_VertexIndex));
        float _167 = as_type<float>(_163) * _159;
        float _169 = trunc(_167);
        float _171 = precise::max(_169, 0.0);
        uint _173 = uint(_171);
        int _175 = -int(_173);
        int _177 = _175 * _153;
        int _179 = _177 + _155;
        float _181 = float(uint(_179));
        float _183 = as_type<float>(_163) * _181;
        float _185 = trunc(_183);
        float _187 = precise::max(_185, 0.0);
        uint _189 = uint(_187);
        float _191 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
        int _193 = int(_173) + int(_189);
        int _195 = _76 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _197 = -_193;
        uint _199 = uint(int(uint(_195) >> uint(31)));
        int _201 = _197 * _153;
        int _203 = _201 + _155;
        float _205 = 1.0 / _191;
        bool _207 = uint(_203) >= uint(_153);
        int _209 = -int(_199);
        int _211 = as_type<int>(_165) >> 31;
        bool _213 = !_207;
        int _215 = _213 ? 0 : (-1);
        bool _217 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _219 = _211 & 1;
        int _221 = -_215;
        int _223 = _193 + _221;
        float _225 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _227 = as_type<int>(_165) + _219;
        int _229 = _223 ^ _209;
        float _231 = 1.0 / _225;
        int _233 = as_type<int>(_165) & 1;
        int _235 = -_209;
        int _237 = _229 + _235;
        int _239 = _227 >> 1;
        float _241 = float(_233);
        bool _243 = !_217;
        int _245 = _243 ? _237 : (-1);
        float _247 = float(_239);
        float _249 = float(_245);
        int _251 = -_245;
        int _253 = _251 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _255 = _253 + _76;
        float _257 = _247 + _249;
        float _259 = float(_255);
        float _261 = _231 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
        float _263 = _241 + _259;
        float _265 = _205 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
        float _267 = _261 * _263;
        float _269 = _265 * _257;
        float _271 = fma(_269, -2.0, 1.0);
        float _273 = fma(_267, 2.0, -1.0);
        _145 = as_type<int>(_273);
        _151 = as_type<int>(_271);
        _137 = _267;
        _141 = _269;
    }
    int _275 = _145;
    int _277 = _151;
    float _279 = _137;
    float _281 = _141;
    float _283 = float(_61);
    float _644 = as_type<float>(_275);
    out.gl_Position.x = _644;
    float _647 = as_type<float>(_277);
    out.gl_Position.y = _647;
    out.gl_Position.z = -1.0;
    float _285 = float(_69);
    float _287 = 1.0 / _283;
    float _289 = 1.0 / _285;
    float _291 = fma(_287, -0.00999999977648258209228515625, _279);
    float _293 = fma(_289, -0.00999999977648258209228515625, _281);
    out.m_39.x = _291;
    out.m_39.y = _293;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _55 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _57 = _55;
    int _59 = 0;
    int _61 = _52(_57, _59, (*spvDescriptorSet0.support_buffer));
    int _63 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _65 = _63;
    int _67 = 0;
    int _69 = _52(_65, _67, (*spvDescriptorSet0.support_buffer));
    float _72 = as_type<float>(int(gl_InstanceIndex));
    float _74 = as_type<float>(int(gl_BaseInstance));
    int _76 = as_type<int>(_72) - as_type<int>(_74);
    int _78 = _76 << 4;
    uint _81 = uint(int(uint(_78) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_81)];
    float _83 = as_type<float>(_dmw0.x);
    int _85 = _78 + 4;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw0.y);
    int _91 = _78 + 8;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw0.z);
    int _97 = _78 + 12;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    float _101 = as_type<float>(_dmw0.w);
    float _103 = float(as_type<int>(_89));
    float _105 = float(as_type<int>(_83));
    bool _109 = _103 > (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _111 = float(as_type<int>(_95));
    bool _113 = _105 > (*spvDescriptorSet0.vp_c3)._m0[3].x;
    bool _115 = _113 || _109;
    float _117 = float(as_type<int>(_101));
    bool _119 = _111 > (*spvDescriptorSet0.vp_c3)._m0[3].z;
    bool _121 = _119 || _115;
    bool _123 = _117 > (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _125 = _123 || _121;
    float _127 = _105;
    float _129 = _117;
    int _131 = as_type<int>(_83);
    int _133 = as_type<int>(_89);
    if (!_125)
    {
        _127 = 0.0;
    }
    float _135 = _127;
    float _137 = _135;
    if (!_125)
    {
        _129 = 0.0;
    }
    float _139 = _129;
    float _141 = _139;
    if (!_125)
    {
        _131 = -971227136;
    }
    int _143 = _131;
    int _145 = _143;
    if (!_125)
    {
        _133 = -971227136;
    }
    int _147 = _133;
    bool _149 = !_125;
    int _151 = _147;
    if (!_149)
    {
        int _153 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _155 = abs(_76);
        float _157 = float(uint(_153));
        float _159 = float(uint(_155));
        float _161 = 1.0 / _157;
        int _163 = as_type<int>(_161) + (-2);
        float _165 = as_type<float>(int(gl_VertexIndex));
        float _167 = as_type<float>(_163) * _159;
        float _169 = trunc(_167);
        float _171 = precise::max(_169, 0.0);
        uint _173 = uint(_171);
        int _175 = -int(_173);
        int _177 = _175 * _153;
        int _179 = _177 + _155;
        float _181 = float(uint(_179));
        float _183 = as_type<float>(_163) * _181;
        float _185 = trunc(_183);
        float _187 = precise::max(_185, 0.0);
        uint _189 = uint(_187);
        float _191 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
        int _193 = int(_173) + int(_189);
        int _195 = _76 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _197 = -_193;
        uint _199 = uint(int(uint(_195) >> uint(31)));
        int _201 = _197 * _153;
        int _203 = _201 + _155;
        float _205 = 1.0 / _191;
        bool _207 = uint(_203) >= uint(_153);
        int _209 = -int(_199);
        int _211 = as_type<int>(_165) >> 31;
        bool _213 = !_207;
        int _215 = _213 ? 0 : (-1);
        bool _217 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _219 = _211 & 1;
        int _221 = -_215;
        int _223 = _193 + _221;
        float _225 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _227 = as_type<int>(_165) + _219;
        int _229 = _223 ^ _209;
        float _231 = 1.0 / _225;
        int _233 = as_type<int>(_165) & 1;
        int _235 = -_209;
        int _237 = _229 + _235;
        int _239 = _227 >> 1;
        float _241 = float(_233);
        bool _243 = !_217;
        int _245 = _243 ? _237 : (-1);
        float _247 = float(_239);
        float _249 = float(_245);
        int _251 = -_245;
        int _253 = _251 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _255 = _253 + _76;
        float _257 = _247 + _249;
        float _259 = float(_255);
        float _261 = _231 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
        float _263 = _241 + _259;
        float _265 = _205 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
        float _267 = _261 * _263;
        float _269 = _265 * _257;
        float _271 = fma(_269, -2.0, 1.0);
        float _273 = fma(_267, 2.0, -1.0);
        _145 = as_type<int>(_273);
        _151 = as_type<int>(_271);
        _137 = _267;
        _141 = _269;
    }
    int _275 = _145;
    int _277 = _151;
    float _279 = _137;
    float _281 = _141;
    float _283 = float(_61);
    float _644 = as_type<float>(_275);
    out.gl_Position.x = _644;
    float _647 = as_type<float>(_277);
    out.gl_Position.y = _647;
    out.gl_Position.z = -1.0;
    float _285 = float(_69);
    float _287 = 1.0 / _283;
    float _289 = 1.0 / _285;
    float _291 = fma(_287, -0.00999999977648258209228515625, _279);
    float _293 = fma(_289, -0.00999999977648258209228515625, _281);
    out.m_39.x = _291;
    out.m_39.y = _293;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _55 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _57 = _55;
    int _59 = 0;
    int _61 = _52(_57, _59, (*spvDescriptorSet0.support_buffer));
    int _63 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _65 = _63;
    int _67 = 0;
    int _69 = _52(_65, _67, (*spvDescriptorSet0.support_buffer));
    float _72 = as_type<float>(int(gl_InstanceIndex));
    float _74 = as_type<float>(int(gl_BaseInstance));
    int _76 = as_type<int>(_72) - as_type<int>(_74);
    int _78 = _76 << 4;
    uint _81 = uint(int(uint(_78) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_81)];
    float _83 = as_type<float>(_dmw0.x);
    int _85 = _78 + 4;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw0.y);
    int _91 = _78 + 8;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw0.z);
    int _97 = _78 + 12;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    float _101 = as_type<float>(_dmw0.w);
    float _103 = float(as_type<int>(_89));
    float _105 = float(as_type<int>(_83));
    bool _109 = _103 > (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _111 = float(as_type<int>(_95));
    bool _113 = _105 > (*spvDescriptorSet0.vp_c3)._m0[3].x;
    bool _115 = _113 || _109;
    float _117 = float(as_type<int>(_101));
    bool _119 = _111 > (*spvDescriptorSet0.vp_c3)._m0[3].z;
    bool _121 = _119 || _115;
    bool _123 = _117 > (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _125 = _123 || _121;
    float _127 = _105;
    float _129 = _117;
    int _131 = as_type<int>(_83);
    int _133 = as_type<int>(_89);
    if (!_125)
    {
        _127 = 0.0;
    }
    float _135 = _127;
    float _137 = _135;
    if (!_125)
    {
        _129 = 0.0;
    }
    float _139 = _129;
    float _141 = _139;
    if (!_125)
    {
        _131 = -971227136;
    }
    int _143 = _131;
    int _145 = _143;
    if (!_125)
    {
        _133 = -971227136;
    }
    int _147 = _133;
    bool _149 = !_125;
    int _151 = _147;
    if (!_149)
    {
        int _153 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _155 = abs(_76);
        float _157 = float(uint(_153));
        float _159 = float(uint(_155));
        float _161 = 1.0 / _157;
        int _163 = as_type<int>(_161) + (-2);
        float _165 = as_type<float>(int(gl_VertexIndex));
        float _167 = as_type<float>(_163) * _159;
        float _169 = trunc(_167);
        float _171 = precise::max(_169, 0.0);
        uint _173 = uint(_171);
        int _175 = -int(_173);
        int _177 = _175 * _153;
        int _179 = _177 + _155;
        float _181 = float(uint(_179));
        float _183 = as_type<float>(_163) * _181;
        float _185 = trunc(_183);
        float _187 = precise::max(_185, 0.0);
        uint _189 = uint(_187);
        float _191 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
        int _193 = int(_173) + int(_189);
        int _195 = _76 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _197 = -_193;
        uint _199 = uint(int(uint(_195) >> uint(31)));
        int _201 = _197 * _153;
        int _203 = _201 + _155;
        float _205 = 1.0 / _191;
        bool _207 = uint(_203) >= uint(_153);
        int _209 = -int(_199);
        int _211 = as_type<int>(_165) >> 31;
        bool _213 = !_207;
        int _215 = _213 ? 0 : (-1);
        bool _217 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _219 = _211 & 1;
        int _221 = -_215;
        int _223 = _193 + _221;
        float _225 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _227 = as_type<int>(_165) + _219;
        int _229 = _223 ^ _209;
        float _231 = 1.0 / _225;
        int _233 = as_type<int>(_165) & 1;
        int _235 = -_209;
        int _237 = _229 + _235;
        int _239 = _227 >> 1;
        float _241 = float(_233);
        bool _243 = !_217;
        int _245 = _243 ? _237 : (-1);
        float _247 = float(_239);
        float _249 = float(_245);
        int _251 = -_245;
        int _253 = _251 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _255 = _253 + _76;
        float _257 = _247 + _249;
        float _259 = float(_255);
        float _261 = _231 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
        float _263 = _241 + _259;
        float _265 = _205 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
        float _267 = _261 * _263;
        float _269 = _265 * _257;
        float _271 = fma(_269, -2.0, 1.0);
        float _273 = fma(_267, 2.0, -1.0);
        _145 = as_type<int>(_273);
        _151 = as_type<int>(_271);
        _137 = _267;
        _141 = _269;
    }
    int _275 = _145;
    int _277 = _151;
    float _279 = _137;
    float _281 = _141;
    float _283 = float(_61);
    float _644 = as_type<float>(_275);
    out.gl_Position.x = _644;
    float _647 = as_type<float>(_277);
    out.gl_Position.y = _647;
    out.gl_Position.z = -1.0;
    float _285 = float(_69);
    float _287 = 1.0 / _283;
    float _289 = 1.0 / _285;
    float _291 = fma(_287, -0.00999999977648258209228515625, _279);
    float _293 = fma(_289, -0.00999999977648258209228515625, _281);
    out.m_39.x = _291;
    out.m_39.y = _293;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

