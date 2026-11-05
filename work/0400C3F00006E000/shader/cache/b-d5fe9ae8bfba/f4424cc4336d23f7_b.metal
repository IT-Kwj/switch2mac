#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 m_33 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    float4 m_30 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    bool _115 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _47;
    float _51 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _53 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _51;
    float _55 = _49 * _49;
    float _57 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _59 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _57;
    float _61 = fma(_53, _53, _55);
    float _63 = fma(_59, _59, _61);
    float _65 = sqrt(_63);
    bool _69 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _71 = isnan(_65);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _77 = _73 || _75;
    float _79 = _59;
    if (!_77)
    {
        _79 = 1.0;
    }
    float _81 = _79;
    bool _83 = !_77;
    float _85 = _81;
    if (!_83)
    {
        bool _87 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _89 = isnan(_65);
        bool _91 = _87 || _89;
        bool _93 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _95 = _91 || _93;
        if (!_95)
        {
            float _97 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _99 = _65 + _97;
            float _101 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _103 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _101;
            float _105 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _107 = _105 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _109 = 1.0 / _103;
            float _111 = _99 * _109;
            float _113 = fma(_111, _107, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _85 = _113;
            _115 = true;
        }
        else
        {
            bool _117 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _119 = isnan(_65);
            bool _121 = _117 || _119;
            bool _123 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _125 = _121 || _123;
            if (!_125)
            {
                float _127 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _129 = _65 + _127;
                float _131 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _133 = _131 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _135 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _137 = _135 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _139 = 1.0 / _133;
                float _141 = _129 * _139;
                float _143 = fma(_141, _137, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _85 = _143;
                _115 = true;
            }
            else
            {
                _85 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _115 = false;
    float _145 = _85;
    float _147 = in.m_28.x;
    float _149 = in.m_28.y;
    float _151 = in.m_28.z;
    float _153 = _145 + (-1.0);
    float _155 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _157 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _159 = fma(_145, _149, _155);
    float _161 = fma(_145, _147, _157);
    float _163 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _165 = _159 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _167 = _159 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _169 = fma(_145, _151, _163);
    float _171 = _159 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _173 = fma(_161, (*spvDescriptorSet0.vp_c7)._m0[2].x, _165);
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c7)._m0[0].x, _167);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c7)._m0[1].x, _171);
    float _179 = fma(_169, (*spvDescriptorSet0.vp_c7)._m0[2].z, _173);
    float _181 = fma(_169, (*spvDescriptorSet0.vp_c7)._m0[0].z, _175);
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c7)._m0[1].z, _177);
    float _185 = _179 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _187 = _181 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _189 = _183 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _193 = _185 + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _197 = _187 + _195;
    float _199 = _193 * _193;
    float _201 = fma(_197, _197, _199);
    float _203 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _205 = sqrt(_201);
    float _207 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[2].x, _203);
    float _209 = fma(_185, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
    float _211 = _209 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _213 = _205 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _215 = _183;
    float _217 = _209;
    float _219 = _187;
    float _221 = _211;
    if (!_213)
    {
        _215 = _187;
    }
    float _223 = _215;
    float _225 = _223;
    if (!_213)
    {
        _217 = _185;
    }
    float _227 = _217;
    float _229 = _227;
    if (!_213)
    {
        _219 = _189;
    }
    float _231 = _219;
    bool _233 = !_213;
    float _235 = _231;
    if (!_233)
    {
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _241 = _205 + _239;
        float _243 = _189 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _245 = rsqrt(_201);
        float _247 = _241 * _237;
        float _249 = _247 * 0.15915493667125701904296875;
        float _251 = _249 * 6.283185482025146484375;
        float _253 = cos(_251);
        float _255 = _249 * 6.283185482025146484375;
        float _257 = sin(_255);
        float _259 = _253 + (-1.0);
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _263 = fma(_257, _243, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _265 = fma(_189, _253, _261);
        float _267 = _245 * _263;
        float _269 = _265 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _271 = fma(_197, _267, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _273 = fma(_193, _267, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _275 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[2].x, _269);
        float _277 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].z, _275);
        float _279 = _277 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _235 = _265;
        _225 = _271;
        _229 = _273;
        _221 = _279;
    }
    float _281 = _235;
    float _283 = _225;
    float _285 = _229;
    float _287 = _221;
    float _289 = _281 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _291 = _281 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _293 = in.m_30.x;
    float _295 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[1].x, _289);
    float _297 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[0].x, _291);
    float _299 = in.m_30.y;
    float _301 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[1].z, _295);
    float _303 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[0].z, _297);
    float _305 = _301 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _307 = _303 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _309 = _305 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _311 = _305 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _313 = _305 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _315 = _305 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _317 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[8].x, _309);
    float _319 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[7].x, _311);
    float _321 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[9].x, _313);
    float _323 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[10].x, _315);
    float _325 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[8].z, _317);
    float _327 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[7].z, _319);
    float _329 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[9].z, _321);
    float _331 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[10].z, _323);
    float _333 = _327 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _335 = _325 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _337 = _329 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _339 = _331 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_33.x = _293;
    out.m_33.y = _299;
    out.gl_Position.x = _333;
    out.gl_Position.y = _335;
    out.gl_Position.z = _337;
    out.gl_Position.w = _339;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    bool _115 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _47;
    float _51 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _53 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _51;
    float _55 = _49 * _49;
    float _57 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _59 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _57;
    float _61 = fma(_53, _53, _55);
    float _63 = fma(_59, _59, _61);
    float _65 = sqrt(_63);
    bool _69 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _71 = isnan(_65);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _77 = _73 || _75;
    float _79 = _59;
    if (!_77)
    {
        _79 = 1.0;
    }
    float _81 = _79;
    bool _83 = !_77;
    float _85 = _81;
    if (!_83)
    {
        bool _87 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _89 = isnan(_65);
        bool _91 = _87 || _89;
        bool _93 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _95 = _91 || _93;
        if (!_95)
        {
            float _97 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _99 = _65 + _97;
            float _101 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _103 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _101;
            float _105 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _107 = _105 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _109 = 1.0 / _103;
            float _111 = _99 * _109;
            float _113 = fma(_111, _107, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _85 = _113;
            _115 = true;
        }
        else
        {
            bool _117 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _119 = isnan(_65);
            bool _121 = _117 || _119;
            bool _123 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _125 = _121 || _123;
            if (!_125)
            {
                float _127 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _129 = _65 + _127;
                float _131 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _133 = _131 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _135 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _137 = _135 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _139 = 1.0 / _133;
                float _141 = _129 * _139;
                float _143 = fma(_141, _137, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _85 = _143;
                _115 = true;
            }
            else
            {
                _85 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _115 = false;
    float _145 = _85;
    float _147 = in.m_28.x;
    float _149 = in.m_28.y;
    float _151 = in.m_28.z;
    float _153 = _145 + (-1.0);
    float _155 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _157 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _159 = fma(_145, _149, _155);
    float _161 = fma(_145, _147, _157);
    float _163 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _165 = _159 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _167 = _159 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _169 = fma(_145, _151, _163);
    float _171 = _159 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _173 = fma(_161, (*spvDescriptorSet0.vp_c7)._m0[2].x, _165);
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c7)._m0[0].x, _167);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c7)._m0[1].x, _171);
    float _179 = fma(_169, (*spvDescriptorSet0.vp_c7)._m0[2].z, _173);
    float _181 = fma(_169, (*spvDescriptorSet0.vp_c7)._m0[0].z, _175);
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c7)._m0[1].z, _177);
    float _185 = _179 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _187 = _181 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _189 = _183 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _193 = _185 + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _197 = _187 + _195;
    float _199 = _193 * _193;
    float _201 = fma(_197, _197, _199);
    float _203 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _205 = sqrt(_201);
    float _207 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[2].x, _203);
    float _209 = fma(_185, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
    float _211 = _209 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _213 = _205 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _215 = _183;
    float _217 = _209;
    float _219 = _187;
    float _221 = _211;
    if (!_213)
    {
        _215 = _187;
    }
    float _223 = _215;
    float _225 = _223;
    if (!_213)
    {
        _217 = _185;
    }
    float _227 = _217;
    float _229 = _227;
    if (!_213)
    {
        _219 = _189;
    }
    float _231 = _219;
    bool _233 = !_213;
    float _235 = _231;
    if (!_233)
    {
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _241 = _205 + _239;
        float _243 = _189 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _245 = rsqrt(_201);
        float _247 = _241 * _237;
        float _249 = _247 * 0.15915493667125701904296875;
        float _251 = _249 * 6.283185482025146484375;
        float _253 = cos(_251);
        float _255 = _249 * 6.283185482025146484375;
        float _257 = sin(_255);
        float _259 = _253 + (-1.0);
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _263 = fma(_257, _243, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _265 = fma(_189, _253, _261);
        float _267 = _245 * _263;
        float _269 = _265 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _271 = fma(_197, _267, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _273 = fma(_193, _267, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _275 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[2].x, _269);
        float _277 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].z, _275);
        float _279 = _277 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _235 = _265;
        _225 = _271;
        _229 = _273;
        _221 = _279;
    }
    float _281 = _235;
    float _283 = _225;
    float _285 = _229;
    float _287 = _221;
    float _289 = _281 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _291 = _281 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _293 = in.m_30.x;
    float _295 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[1].x, _289);
    float _297 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[0].x, _291);
    float _299 = in.m_30.y;
    float _301 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[1].z, _295);
    float _303 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[0].z, _297);
    float _305 = _301 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _307 = _303 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _309 = _305 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _311 = _305 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _313 = _305 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _315 = _305 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _317 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[8].x, _309);
    float _319 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[7].x, _311);
    float _321 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[9].x, _313);
    float _323 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[10].x, _315);
    float _325 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[8].z, _317);
    float _327 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[7].z, _319);
    float _329 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[9].z, _321);
    float _331 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[10].z, _323);
    float _333 = _327 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _335 = _325 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _337 = _329 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _339 = _331 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_33.x = _293;
    out.m_33.y = _299;
    out.gl_Position.x = _333;
    out.gl_Position.y = _335;
    out.gl_Position.z = _337;
    out.gl_Position.w = _339;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    bool _115 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _47;
    float _51 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _53 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _51;
    float _55 = _49 * _49;
    float _57 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _59 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _57;
    float _61 = fma(_53, _53, _55);
    float _63 = fma(_59, _59, _61);
    float _65 = sqrt(_63);
    bool _69 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _71 = isnan(_65);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _77 = _73 || _75;
    float _79 = _59;
    if (!_77)
    {
        _79 = 1.0;
    }
    float _81 = _79;
    bool _83 = !_77;
    float _85 = _81;
    if (!_83)
    {
        bool _87 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _89 = isnan(_65);
        bool _91 = _87 || _89;
        bool _93 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _95 = _91 || _93;
        if (!_95)
        {
            float _97 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _99 = _65 + _97;
            float _101 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _103 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _101;
            float _105 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _107 = _105 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _109 = 1.0 / _103;
            float _111 = _99 * _109;
            float _113 = fma(_111, _107, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _85 = _113;
            _115 = true;
        }
        else
        {
            bool _117 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _119 = isnan(_65);
            bool _121 = _117 || _119;
            bool _123 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _125 = _121 || _123;
            if (!_125)
            {
                float _127 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _129 = _65 + _127;
                float _131 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _133 = _131 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _135 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _137 = _135 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _139 = 1.0 / _133;
                float _141 = _129 * _139;
                float _143 = fma(_141, _137, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _85 = _143;
                _115 = true;
            }
            else
            {
                _85 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _115 = false;
    float _145 = _85;
    float _147 = in.m_28.x;
    float _149 = in.m_28.y;
    float _151 = in.m_28.z;
    float _153 = _145 + (-1.0);
    float _155 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _157 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _159 = fma(_145, _149, _155);
    float _161 = fma(_145, _147, _157);
    float _163 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _165 = _159 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _167 = _159 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _169 = fma(_145, _151, _163);
    float _171 = _159 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _173 = fma(_161, (*spvDescriptorSet0.vp_c7)._m0[2].x, _165);
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c7)._m0[0].x, _167);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c7)._m0[1].x, _171);
    float _179 = fma(_169, (*spvDescriptorSet0.vp_c7)._m0[2].z, _173);
    float _181 = fma(_169, (*spvDescriptorSet0.vp_c7)._m0[0].z, _175);
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c7)._m0[1].z, _177);
    float _185 = _179 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _187 = _181 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _189 = _183 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _193 = _185 + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _197 = _187 + _195;
    float _199 = _193 * _193;
    float _201 = fma(_197, _197, _199);
    float _203 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _205 = sqrt(_201);
    float _207 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[2].x, _203);
    float _209 = fma(_185, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
    float _211 = _209 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _213 = _205 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _215 = _183;
    float _217 = _209;
    float _219 = _187;
    float _221 = _211;
    if (!_213)
    {
        _215 = _187;
    }
    float _223 = _215;
    float _225 = _223;
    if (!_213)
    {
        _217 = _185;
    }
    float _227 = _217;
    float _229 = _227;
    if (!_213)
    {
        _219 = _189;
    }
    float _231 = _219;
    bool _233 = !_213;
    float _235 = _231;
    if (!_233)
    {
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _241 = _205 + _239;
        float _243 = _189 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _245 = rsqrt(_201);
        float _247 = _241 * _237;
        float _249 = _247 * 0.15915493667125701904296875;
        float _251 = _249 * 6.283185482025146484375;
        float _253 = cos(_251);
        float _255 = _249 * 6.283185482025146484375;
        float _257 = sin(_255);
        float _259 = _253 + (-1.0);
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _263 = fma(_257, _243, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _265 = fma(_189, _253, _261);
        float _267 = _245 * _263;
        float _269 = _265 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _271 = fma(_197, _267, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _273 = fma(_193, _267, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _275 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[2].x, _269);
        float _277 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].z, _275);
        float _279 = _277 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _235 = _265;
        _225 = _271;
        _229 = _273;
        _221 = _279;
    }
    float _281 = _235;
    float _283 = _225;
    float _285 = _229;
    float _287 = _221;
    float _289 = _281 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _291 = _281 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _293 = in.m_30.x;
    float _295 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[1].x, _289);
    float _297 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[0].x, _291);
    float _299 = in.m_30.y;
    float _301 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[1].z, _295);
    float _303 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[0].z, _297);
    float _305 = _301 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _307 = _303 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _309 = _305 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _311 = _305 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _313 = _305 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _315 = _305 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _317 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[8].x, _309);
    float _319 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[7].x, _311);
    float _321 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[9].x, _313);
    float _323 = fma(_307, (*spvDescriptorSet0.vp_c4)._m0[10].x, _315);
    float _325 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[8].z, _317);
    float _327 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[7].z, _319);
    float _329 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[9].z, _321);
    float _331 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[10].z, _323);
    float _333 = _327 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _335 = _325 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _337 = _329 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _339 = _331 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_33.x = _293;
    out.m_33.y = _299;
    out.gl_Position.x = _333;
    out.gl_Position.y = _335;
    out.gl_Position.z = _337;
    out.gl_Position.w = _339;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

